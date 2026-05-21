import fs from 'fs/promises';
import { constants } from 'fs';
import path from 'path';
import { app } from 'electron';
import { exec } from 'child_process';
import util from 'util';
import { readConfig, saveConfig } from './config.js';
import { installWorkshopItem } from './steamcmd.js';
import { getSettings } from './settings.js';
import https from 'https';
import { parseWorkshopHtml } from './workshopParser.js';

const execPromise = util.promisify(exec);

// Default Steam Workshop path for PZ (Client)
const DEFAULT_STEAM_PATH_X86 = 'C:\\Program Files (x86)\\Steam';
const DEFAULT_STEAM_PATH_X64 = 'C:\\Program Files\\Steam';
const PZ_APP_ID = '108600';
const STEAMCMD_DIR = path.join(app.getPath('userData'), 'steamcmd');
const SERVER_DIR = path.join(app.getPath('userData'), 'server');

// Helper for async file existence check
async function exists(filePath) {
    try {
        await fs.access(filePath, constants.F_OK);
        return true;
    } catch {
        return false;
    }
}

// Helper to parse VDF (Valve Data Format) - simplified for libraryfolders.vdf
function parseVdf(content) {
    const libraries = [];
    const lines = content.split('\n');

    for (const line of lines) {
        // Look for "path" "..."
        const match = line.match(/"path"\s+"(.+?)"/);
        if (match) {
            // VDF paths often have double backslashes that need normalization
            let libPath = match[1].replace(/\\\\/g, '\\');
            libraries.push(libPath);
        }
    }
    return libraries;
}

async function getSteamLibraryFolders() {
    const libraries = new Set();

    // 1. Try to find main Steam installation
    let steamPath = null;

    // Try registry
    try {
        const { stdout } = await execPromise('reg query HKEY_CURRENT_USER\\Software\\Valve\\Steam /v SteamPath');
        const match = stdout.match(/SteamPath\s+REG_SZ\s+(.+)/);
        if (match && match[1]) {
            steamPath = match[1].trim();
        }
    } catch (e) { }

    // Try defaults
    if (!steamPath) {
        const settings = await getSettings();
        if (settings.steamInstallPath && await exists(settings.steamInstallPath)) {
            steamPath = settings.steamInstallPath;
        } else if (await exists(DEFAULT_STEAM_PATH_X86)) {
            steamPath = DEFAULT_STEAM_PATH_X86;
        } else if (await exists(DEFAULT_STEAM_PATH_X64)) {
            steamPath = DEFAULT_STEAM_PATH_X64;
        }
    }

    if (steamPath) {
        libraries.add(steamPath);

        // Parse libraryfolders.vdf
        const vdfPath = path.join(steamPath, 'steamapps', 'libraryfolders.vdf');
        if (await exists(vdfPath)) {
            try {
                const content = await fs.readFile(vdfPath, 'utf-8');
                const vdfLibs = parseVdf(content);
                // Verify existence of these libs
                for (const lib of vdfLibs) {
                    if (await exists(lib)) {
                        libraries.add(lib);
                    }
                }
            } catch (err) {
                console.error('Error reading libraryfolders.vdf:', err);
            }
        }
    }

    return Array.from(libraries);
}

// Helper to parse mod.info
async function parseModInfo(dir) {
    const modInfoPath = path.join(dir, 'mod.info');
    if (!(await exists(modInfoPath))) return null;

    try {
        const content = await fs.readFile(modInfoPath, 'utf-8');
        const info = {};
        content.split('\n').forEach(line => {
            const [key, ...val] = line.split('=');
            if (key && val) {
                info[key.trim().toLowerCase()] = val.join('=').trim();
            }
        });
        return info;
    } catch (err) {
        return null;
    }
}

// Helper to parse ACF (Valve KeyValue Format) - simplified for appworkshop
async function getWorkshopItemsFromAcf(acfPath) {
    if (!(await exists(acfPath))) return [];
    try {
        const content = await fs.readFile(acfPath, 'utf-8');
        const items = [];

        let inInstalledSection = false;
        let depth = 0;

        const lines = content.split(/\r?\n/);
        for (const line of lines) {
            const trimmed = line.trim();
            if (trimmed.includes('"WorkshopItemsInstalled"')) {
                inInstalledSection = true;
                continue;
            }

            if (inInstalledSection) {
                if (trimmed.startsWith('{')) {
                    depth++;
                } else if (trimmed.startsWith('}')) {
                    depth--;
                    if (depth === 0) inInstalledSection = false;
                } else if (depth === 1) {
                    // This should be the ID line: "123456"
                    const match = trimmed.match(/"(\d+)"/);
                    if (match) {
                        items.push(match[1]);
                    }
                }
            }
        }
        return items;
    } catch (err) {
        console.error(`Error reading ACF ${acfPath}:`, err);
        return [];
    }
}

async function getInstalledWorkshopIds() {
    const installedIds = new Set();
    const libraries = await getSteamLibraryFolders();
    libraries.push(STEAMCMD_DIR);

    for (const libPath of libraries) {
        const acfPath = path.join(libPath, 'steamapps', 'workshop', `appworkshop_${PZ_APP_ID}.acf`);
        if (!(await exists(acfPath))) {
            continue;
        }

        const itemIds = await getWorkshopItemsFromAcf(acfPath);
        itemIds.forEach((id) => installedIds.add(id));
    }

    return installedIds;
}

async function parseModFromPath(modPath, workshopId, source) {
    try {
        const stat = await fs.stat(modPath);
        if (!stat.isDirectory()) return null;
    } catch {
        return null;
    }

    const modsDir = path.join(modPath, 'mods');
    let modItems = [];

    // Helper to find maps in a mod directory
    const findMaps = async (dir) => {
        const mapsDir = path.join(dir, 'media', 'maps');
        if (await exists(mapsDir)) {
            try {
                const entries = await fs.readdir(mapsDir, { withFileTypes: true });
                return entries.filter(e => e.isDirectory()).map(e => e.name);
            } catch {
                return [];
            }
        }
        return [];
    };

    // Check for mod.info in 'mods' subdirectory (multi-mod)
    if (await exists(modsDir)) {
        try {
            const subDirs = await fs.readdir(modsDir);
            for (const sub of subDirs) {
                const subPath = path.join(modsDir, sub);
                const info = await parseModInfo(subPath);
                if (info) {
                    modItems.push({
                        id: info.id,
                        name: info.name,
                        description: info.description,
                        poster: info.poster ? path.join(subPath, info.poster) : null,
                        maps: await findMaps(subPath)
                    });
                }
            }
        } catch (err) {
            console.error(`Error parsing mods dir ${modsDir}:`, err);
        }
    }
    // Check for mod.info in root (single mod)
    else {
        const info = await parseModInfo(modPath);
        if (info) {
            modItems.push({
                id: info.id,
                name: info.name,
                description: info.description,
                poster: info.poster ? path.join(modPath, info.poster) : null,
                maps: await findMaps(modPath)
            });
        }
    }

    return {
        workshopId: workshopId,
        title: modItems[0].name, // Use first mod name as title
        mods: modItems,
        preview: null, // Will be populated via Steam API
        location: source
    };
}


async function getPublishedFileDetails(ids) {
    if (!ids || ids.length === 0) return {};

    return new Promise((resolve, reject) => {
        const postData = new URLSearchParams();
        postData.append('itemcount', ids.length);
        ids.forEach((id, index) => {
            postData.append(`publishedfileids[${index}]`, id);
        });

        const options = {
            hostname: 'api.steampowered.com',
            path: '/ISteamRemoteStorage/GetPublishedFileDetails/v1/',
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded',
                'Content-Length': Buffer.byteLength(postData.toString())
            }
        };

        const req = https.request(options, (res) => {
            let data = '';
            res.on('data', (chunk) => data += chunk);
            res.on('end', () => {
                try {
                    const json = JSON.parse(data);
                    const map = {};
                    if (json.response && json.response.publishedfiledetails) {
                        json.response.publishedfiledetails.forEach(item => {
                            map[item.publishedfileid] = item.preview_url;
                        });
                    }
                    resolve(map);
                } catch (err) {
                    console.error('Error parsing Steam API response:', err);
                    resolve({});
                }
            });
        });

        req.on('error', (e) => {
            console.error('Steam API request failed:', e);
            resolve({});
        });

        req.write(postData.toString());
        req.end();
    });
}

export async function getInstalledMods() {
    const mods = [];
    const processedIds = new Set();

    const libraries = await getSteamLibraryFolders();
    // Add SteamCMD to libraries list
    libraries.push(STEAMCMD_DIR);

    for (const libPath of libraries) {
        const acfPath = path.join(libPath, 'steamapps', 'workshop', `appworkshop_${PZ_APP_ID}.acf`);
        const contentPath = path.join(libPath, 'steamapps', 'workshop', 'content', PZ_APP_ID);

        if (await exists(acfPath)) {
            const itemIds = await getWorkshopItemsFromAcf(acfPath);

            // Process mods in parallel for this library
            const modPromises = itemIds.map(async (id) => {
                if (processedIds.has(id)) return null;

                const modPath = path.join(contentPath, id);
                const source = libPath.includes('steamcmd') ? 'Server (SteamCMD)' : 'Client (Steam)';

                const modData = await parseModFromPath(modPath, id, source);
                if (modData) {
                    processedIds.add(id);
                    return modData;
                }
                return null;
            });

            const results = await Promise.all(modPromises);
            mods.push(...results.filter(m => m !== null));
        }
    }

    // Batch fetch images from Steam API
    const workshopIds = mods.map(m => m.workshopId);
    // Fetch in chunks of 50 to be safe
    const chunkSize = 50;
    for (let i = 0; i < workshopIds.length; i += chunkSize) {
        const chunk = workshopIds.slice(i, i + chunkSize);
        const images = await getPublishedFileDetails(chunk);

        mods.forEach(mod => {
            if (images[mod.workshopId]) {
                mod.preview = images[mod.workshopId];
            }
        });
    }

    return mods;
}

export async function searchSteamWorkshop(query) {
    const searchText = query?.trim() || '';
    const url = searchText
        ? `https://steamcommunity.com/workshop/browse/?appid=${PZ_APP_ID}&searchtext=${encodeURIComponent(searchText)}&childpublishedfileid=0&browsesort=textsearch&section=items`
        : `https://steamcommunity.com/workshop/browse/?appid=${PZ_APP_ID}&browsesort=trend&section=readytouseitems&actualsection=readytouseitems&p=1`;

    const html = await new Promise((resolve, reject) => {
        https.get(url, (res) => {
            if (res.statusCode !== 200) {
                res.resume();
                reject(new Error(`Steam Workshop returned status code: ${res.statusCode}`));
                return;
            }

            let data = '';
            res.on('data', (chunk) => {
                data += chunk;
            });
            res.on('end', () => resolve(data));
        }).on('error', (err) => reject(new Error(`Network error searching Steam Workshop: ${err.message}`)));
    });

    const installedIds = await getInstalledWorkshopIds();
    return parseWorkshopHtml(html, installedIds).slice(0, 48);
}

export async function installMod(workshopId, onLog) {
    await installWorkshopItem(PZ_APP_ID, workshopId, onLog);
    return true;
}

export async function deleteMod(workshopId) {
    // Only delete from SteamCMD folder to be safe
    const steamCmdWorkshop = path.join(STEAMCMD_DIR, 'steamapps', 'workshop', 'content', PZ_APP_ID, workshopId);
    if (await exists(steamCmdWorkshop)) {
        try {
            await fs.rm(steamCmdWorkshop, { recursive: true, force: true });
            return true;
        } catch (err) {
            console.error(`Error deleting mod ${workshopId}:`, err);
            return false;
        }
    }
    return false;
}

export async function addModToServer(configName, workshopId, modIds) {
    const { config, sandbox } = await readConfig(configName);

    // 1. Update WorkshopItems
    let currentWorkshopItems = config.WorkshopItems ? config.WorkshopItems.split(';') : [];
    // Clean up existing items
    currentWorkshopItems = currentWorkshopItems.map(i => i.trim()).filter(i => i);

    if (!currentWorkshopItems.includes(workshopId)) {
        currentWorkshopItems.push(workshopId);
    }

    // 2. Update Mods
    let currentMods = config.Mods ? config.Mods.split(';') : [];
    currentMods = currentMods.map(i => i.trim()).filter(i => i);

    modIds.forEach(id => {
        if (!currentMods.includes(id)) {
            currentMods.push(id);
        }
    });

    // 3. Update Maps (if any)
    const libraries = await getSteamLibraryFolders();
    libraries.push(STEAMCMD_DIR);

    let mapsToAdd = [];
    for (const libPath of libraries) {
        const modPath = path.join(libPath, 'steamapps', 'workshop', 'content', PZ_APP_ID, workshopId);
        if (await exists(modPath)) {
            const modData = await parseModFromPath(modPath, workshopId, 'temp');
            if (modData) {
                modData.mods.forEach(m => {
                    if (modIds.includes(m.id) && m.maps) {
                        mapsToAdd.push(...m.maps);
                    }
                });
            }
            break; // Found it
        }
    }

    if (mapsToAdd.length > 0) {
        let currentMaps = config.Map ? config.Map.split(';') : ['Muldraugh, KY'];
        currentMaps = currentMaps.map(i => i.trim()).filter(i => i);

        // Add new maps to the BEGINNING (priority)
        mapsToAdd.forEach(map => {
            if (!currentMaps.includes(map)) {
                currentMaps.unshift(map);
            }
        });

        config.Map = currentMaps.join(';');
    }

    // Save
    config.WorkshopItems = currentWorkshopItems.join(';');
    config.Mods = currentMods.join(';');

    const result = await saveConfig(configName, { config, sandbox });
    if (!result.success) {
        return { success: false, error: result.errors.join(' ') };
    }

    if (mapsToAdd.length === 0) {
        // Check if the mod actually HAD maps but we couldn't find them (e.g. not downloaded)
        // We can't easily know if it *should* have maps without metadata, but we can warn if we found nothing.
        // For now, let's just return a warning if the user *expects* a map but we didn't find one.
        // Since we don't know user intent, we'll just return what we did.
        return { success: true, mapsAdded: 0 };
    }

    return { success: true, mapsAdded: mapsToAdd.length };
}

export async function removeModFromServer(configName, workshopId, modIds) {
    const { config, sandbox } = await readConfig(configName);

    // 1. Remove WorkshopId
    let currentWorkshopItems = config.WorkshopItems ? config.WorkshopItems.split(';') : [];
    currentWorkshopItems = currentWorkshopItems.map(i => i.trim()).filter(i => i);
    currentWorkshopItems = currentWorkshopItems.filter(id => id !== workshopId);

    // 2. Remove ModIds
    let currentMods = config.Mods ? config.Mods.split(';') : [];
    currentMods = currentMods.map(i => i.trim()).filter(i => i);
    currentMods = currentMods.filter(id => !modIds.includes(id));

    // 3. Remove Maps
    const libraries = await getSteamLibraryFolders();
    libraries.push(STEAMCMD_DIR);

    let mapsToRemove = [];
    for (const libPath of libraries) {
        const modPath = path.join(libPath, 'steamapps', 'workshop', 'content', PZ_APP_ID, workshopId);
        if (await exists(modPath)) {
            const modData = await parseModFromPath(modPath, workshopId, 'temp');
            if (modData) {
                modData.mods.forEach(m => {
                    if (modIds.includes(m.id) && m.maps) {
                        mapsToRemove.push(...m.maps);
                    }
                });
            }
            break;
        }
    }

    if (mapsToRemove.length > 0) {
        let currentMaps = config.Map ? config.Map.split(';') : [];
        currentMaps = currentMaps.map(i => i.trim()).filter(i => i);
        currentMaps = currentMaps.filter(m => !mapsToRemove.includes(m));

        // Ensure Muldraugh, KY is still there if list becomes empty
        if (currentMaps.length === 0) {
            currentMaps.push('Muldraugh, KY');
        }

        config.Map = currentMaps.join(';');
    }

    config.WorkshopItems = currentWorkshopItems.join(';');
    config.Mods = currentMods.join(';');

    const result = await saveConfig(configName, { config, sandbox });
    if (!result.success) {
        return { success: false, error: result.errors.join(' ') };
    }

    return { success: true };
}

export async function copyModsFromClient(modIds, onLog) {
    if (!modIds || modIds.length === 0) return { success: false, error: 'No mods specified' };

    const libraries = await getSteamLibraryFolders();
    const serverWorkshopDir = path.join(SERVER_DIR, 'steamapps', 'workshop', 'content', PZ_APP_ID);

    if (onLog) onLog(`Searching for ${modIds.length} mods in client libraries...`);

    let copiedCount = 0;

    for (const modId of modIds) {
        let found = false;
        for (const libPath of libraries) {
            // Check client workshop path
            const clientModPath = path.join(libPath, 'steamapps', 'workshop', 'content', PZ_APP_ID, modId);

            if (await exists(clientModPath)) {
                const targetPath = path.join(serverWorkshopDir, modId);

                try {
                    // Ensure target directory exists
                    await fs.mkdir(targetPath, { recursive: true });

                    // Copy recursively
                    if (onLog) onLog(`Copying mod ${modId} from client library...`);
                    await fs.cp(clientModPath, targetPath, { recursive: true, force: true });

                    copiedCount++;
                    found = true;
                    break; // Found and copied, move to next mod
                } catch (err) {
                    console.error(`Failed to copy mod ${modId}:`, err);
                    if (onLog) onLog(`Error copying mod ${modId}: ${err.message}`);
                }
            }
        }

        if (!found) {
            if (onLog) onLog(`Mod ${modId} not found in any client library.`);
        }
    }

    if (onLog) onLog(`Finished copying. Copied ${copiedCount}/${modIds.length} mods.`);
    return { success: true, count: copiedCount };
}

export async function updateAcf(workshopIds) {
    if (!workshopIds || workshopIds.length === 0) return;

    const libraries = await getSteamLibraryFolders();
    // Prioritize Client Steam path if available, otherwise check all
    // We want to update the ACF that the GAME uses.
    // If we are in "Co-op Mode", we are likely using the Client's install.
    // If we are in "Dedicated Mode", we might be using SteamCMD (but usually Dedicated Server has its own ACF in steamapps/workshop)

    // Let's try to find the main PZ install ACF.
    let targetAcfPath = null;

    for (const libPath of libraries) {
        const checkPath = path.join(libPath, 'steamapps', 'workshop', `appworkshop_${PZ_APP_ID}.acf`);
        if (await exists(checkPath)) {
            targetAcfPath = checkPath;
            break; // Found one, use it. (Usually main steam lib is first)
        }
    }

    if (!targetAcfPath) {
        console.warn('Could not find appworkshop_108600.acf to update.');
        return;
    }

    try {
        let content = await fs.readFile(targetAcfPath, 'utf-8');
        const lines = content.split(/\r?\n/);
        let newLines = [];
        let inInstalledSection = false;
        let depth = 0;
        let existingIds = new Set();
        let insertIndex = -1;

        // First pass: find existing IDs and insertion point
        for (let i = 0; i < lines.length; i++) {
            const line = lines[i];
            const trimmed = line.trim();

            if (trimmed.includes('"WorkshopItemsInstalled"')) {
                inInstalledSection = true;
            }

            if (inInstalledSection) {
                if (trimmed.startsWith('{')) {
                    depth++;
                } else if (trimmed.startsWith('}')) {
                    depth--;
                    if (depth === 0) {
                        inInstalledSection = false;
                        insertIndex = i; // Insert before the closing brace
                    }
                } else if (depth === 1) {
                    const match = trimmed.match(/"(\d+)"/);
                    if (match) {
                        existingIds.add(match[1]);
                    }
                }
            }
        }

        // Reconstruct content
        if (insertIndex !== -1) {
            // Add missing IDs
            const idsToAdd = workshopIds.filter(id => !existingIds.has(id));

            if (idsToAdd.length > 0) {
                const insertionLines = idsToAdd.map(id => {
                    // Minimal entry to satisfy "installed" check
                    return `\t\t"${id}"\n\t\t{\n\t\t\t"manifest"\t"0"\n\t\t\t"size"\t"0"\n\t\t\t"timeupdated"\t"${Math.floor(Date.now() / 1000)}"\n\t\t}`;
                });

                lines.splice(insertIndex, 0, ...insertionLines);
                await fs.writeFile(targetAcfPath, lines.join('\n'));
                console.log(`Updated ACF with ${idsToAdd.length} new mods.`);
            } else {
                console.log('ACF already contains all mods.');
            }
        } else {
            console.warn('Could not parse WorkshopItemsInstalled section in ACF.');
        }

    } catch (error) {
        console.error('Error updating ACF:', error);
    }
}

export async function installModsToClient(modIds, onProgress) {
    if (!modIds || modIds.length === 0) return { success: true, count: 0 };

    const libraries = await getSteamLibraryFolders();
    // Find Client Workshop Path
    // Find Client Workshop Path based on where PZ is installed (ACF location)
    let clientWorkshopPath = null;

    // First, find the library where PZ is installed
    for (const libPath of libraries) {
        const acfPath = path.join(libPath, 'steamapps', 'workshop', `appworkshop_${PZ_APP_ID}.acf`);
        if (await exists(acfPath)) {
            // Found the library where PZ is installed!
            clientWorkshopPath = path.join(libPath, 'steamapps', 'workshop', 'content', PZ_APP_ID);
            break;
        }
    }

    if (!clientWorkshopPath) {
        // Fallback: Try to find ANY workshop content folder if ACF is missing (unlikely if game is installed)
        for (const libPath of libraries) {
            const checkPath = path.join(libPath, 'steamapps', 'workshop', 'content', PZ_APP_ID);
            // Check if 'workshop' folder exists at least
            if (await exists(path.join(libPath, 'steamapps', 'workshop'))) {
                clientWorkshopPath = checkPath;
                break;
            }
        }
    }

    if (!clientWorkshopPath) {
        clientWorkshopPath = path.join(DEFAULT_STEAM_PATH_X86, 'steamapps', 'workshop', 'content', PZ_APP_ID);
    }

    let installedCount = 0;
    const total = modIds.length;

    for (let i = 0; i < total; i++) {
        const modId = modIds[i];
        if (onProgress) onProgress({ status: `Installing mod ${i + 1}/${total}: ${modId}`, percent: Math.round(((i) / total) * 100) });

        try {
            // 1. Download via SteamCMD (always downloads to STEAMCMD_DIR)
            await installWorkshopItem(PZ_APP_ID, modId, (msg) => {
                // Optional: forward detailed steamcmd logs?
            });

            // 2. Copy to Client Workshop
            const sourcePath = path.join(STEAMCMD_DIR, 'steamapps', 'workshop', 'content', PZ_APP_ID, modId);
            const destPath = path.join(clientWorkshopPath, modId);

            if (await exists(sourcePath)) {
                await fs.mkdir(destPath, { recursive: true });
                await fs.cp(sourcePath, destPath, { recursive: true, force: true });
                installedCount++;
            } else {
                console.error(`Mod ${modId} failed to download via SteamCMD.`);
            }

        } catch (err) {
            console.error(`Error installing mod ${modId}:`, err);
        }
    }

    // 3. Update ACF
    if (onProgress) onProgress({ status: 'Updating Steam ACF...', percent: 100 });
    await updateAcf(modIds);

    return { success: true, count: installedCount };
}
