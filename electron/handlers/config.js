import { fileURLToPath } from 'url';
import fs from 'fs/promises';
import { constants } from 'fs';
import path from 'path';
import ini from 'ini';
import { app, shell } from 'electron';
import { getSettings } from './settings.js';
import { isValidServerName } from './validation.js';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);




async function getConfigDir() {
    const settings = await getSettings();
    const basePath = settings.pzConfigPath || path.join(app.getPath('home'), 'Zomboid');
    return path.join(basePath, 'Server');
}

async function getSavesDir() {
    const settings = await getSettings();
    const basePath = settings.pzConfigPath || path.join(app.getPath('home'), 'Zomboid');
    return path.join(basePath, 'Saves', 'Multiplayer');
}

async function getDbDir() {
    const settings = await getSettings();
    const basePath = settings.pzConfigPath || path.join(app.getPath('home'), 'Zomboid');
    return path.join(basePath, 'db');
}

// Helper for async file existence check
async function exists(filePath) {
    try {
        await fs.access(filePath, constants.F_OK);
        return true;
    } catch {
        return false;
    }
}

export async function getConfigs() {
    const CONFIG_DIR = await getConfigDir();
    if (!(await exists(CONFIG_DIR))) {
        return [];
    }
    try {
        const files = await fs.readdir(CONFIG_DIR);
        return files.filter(f => f.endsWith('.ini') && !f.endsWith('_zombies.ini')).map(f => f.replace('.ini', ''));
    } catch (error) {
        console.error('Error reading config directory:', error);
        return [];
    }
}

export async function readConfig(serverName) {
    if (!isValidServerName(serverName)) {
        console.error(`Invalid server name: ${serverName}`);
        return { config: {}, sandbox: {}, spawnregions: '', zombies: {}, metadata: { memory: { min: '4', max: '4' } } };
    }

    const CONFIG_DIR = await getConfigDir();
    const iniPath = path.join(CONFIG_DIR, `${serverName}.ini`);
    const luaPath = path.join(CONFIG_DIR, `${serverName}_SandboxVars.lua`);
    const spawnPath = path.join(CONFIG_DIR, `${serverName}_spawnregions.lua`);

    let config = {};
    let sandbox = {};
    let spawnregions = '';
    let zombies = {};
    let metadata = { memory: { min: '4', max: '4' } }; // Default metadata

    // Read Metadata (JSON)
    const jsonPath = path.join(CONFIG_DIR, `${serverName}.json`);
    if (await exists(jsonPath)) {
        try {
            const jsonContent = await fs.readFile(jsonPath, 'utf-8');
            const parsed = JSON.parse(jsonContent);
            metadata = { ...metadata, ...parsed };
        } catch (error) {
            console.error(`Error reading JSON metadata ${jsonPath}:`, error);
        }
    }

    // Read Zombies INI
    const zombiesPath = path.join(CONFIG_DIR, `${serverName}_zombies.ini`);
    if (await exists(zombiesPath)) {
        try {
            const zombiesContent = await fs.readFile(zombiesPath, 'utf-8');
            zombies = ini.parse(zombiesContent);
        } catch (error) {
            console.error(`Error reading Zombies INI ${zombiesPath}:`, error);
        }
    }

    if (await exists(iniPath)) {
        try {
            let iniContent = await fs.readFile(iniPath, 'utf-8');

            // Pre-process to quote specific keys if not already quoted to prevent semicolon truncation
            const keysToQuote = ['Mods', 'WorkshopItems', 'Map', 'SpawnPoint'];
            const lines = iniContent.split('\n');
            const processedLines = lines.map(line => {
                const match = line.match(/^\s*(\w+)\s*=\s*(.*)/);
                if (match) {
                    const key = match[1];
                    let value = match[2];
                    if (keysToQuote.includes(key)) {
                        // If value contains semicolon and isn't quoted, quote it
                        if (!value.startsWith('"') && !value.endsWith('"')) {
                            value = `"${value}"`;
                        }
                    }
                    return `${key}=${value}`;
                }
                return line;
            });

            config = ini.parse(processedLines.join('\n'));
        } catch (error) {
            console.error(`Error reading INI file ${iniPath}:`, error);
        }
    }

    if (await exists(luaPath)) {
        try {
            const luaContent = await fs.readFile(luaPath, 'utf-8');
            const lines = luaContent.split('\n');
            let currentObj = sandbox;
            let stack = [sandbox];

            lines.forEach(line => {
                // Strip comments
                line = line.split('--')[0].trim();
                if (!line) return;

                if (line.startsWith('SandboxVars') || line.startsWith('return')) return;
                if (line === '}' || line === '},') {
                    if (stack.length > 1) {
                        stack.pop();
                        currentObj = stack[stack.length - 1];
                    }
                    return;
                }

                // Match: Key = Value OR ["Key"] = Value OR ['Key'] = Value
                const match = line.match(/^(?:(\w+)|\["([^"]+)"\]|\['([^']+)'\])\s*=\s*(.*)/);
                if (match) {
                    let key = match[1] || match[2] || match[3];
                    let value = match[4];
                    if (value.endsWith(',')) value = value.slice(0, -1);

                    if (value === '{') {
                        currentObj[key] = {};
                        stack.push(currentObj[key]);
                        currentObj = currentObj[key];
                    } else {
                        // Parse value
                        if (value === 'true') value = true;
                        else if (value === 'false') value = false;
                        else if (!isNaN(Number(value))) value = Number(value);
                        else if (value.startsWith('"') && value.endsWith('"')) value = value.slice(1, -1);
                        else if (value.startsWith("'") && value.endsWith("'")) value = value.slice(1, -1);

                        currentObj[key] = value;
                    }
                }
            });
        } catch (error) {
            console.error(`Error reading Lua file ${luaPath}:`, error);
        }
    }

    if (await exists(spawnPath)) {
        try {
            spawnregions = await fs.readFile(spawnPath, 'utf-8');
        } catch (error) {
            console.error(`Error reading SpawnRegions file ${spawnPath}:`, error);
        }
    }

    return { config, sandbox, spawnregions, zombies, metadata };
}

export async function saveConfig(serverName, data) {
    if (!isValidServerName(serverName)) {
        throw new Error(`Invalid server name: ${serverName}`);
    }
    const CONFIG_DIR = await getConfigDir();
    if (!(await exists(CONFIG_DIR))) {
        await fs.mkdir(CONFIG_DIR, { recursive: true });
    }

    const iniPath = path.join(CONFIG_DIR, `${serverName}.ini`);
    const luaPath = path.join(CONFIG_DIR, `${serverName}_SandboxVars.lua`);
    const spawnPath = path.join(CONFIG_DIR, `${serverName}_spawnregions.lua`);
    const zombiesPath = path.join(CONFIG_DIR, `${serverName}_zombies.ini`);
    const jsonPath = path.join(CONFIG_DIR, `${serverName}.json`);

    if (data.config) {
        try {
            let iniContent = ini.stringify(data.config);
            // Post-process to unescape semicolons for PZ compatibility
            iniContent = iniContent.replace(/\\;/g, ';');
            await fs.writeFile(iniPath, iniContent);
        } catch (error) {
            console.error(`Error writing INI file ${iniPath}:`, error);
        }
    }

    if (data.sandbox) {
        try {
            const serializeLua = (obj, indent = 4) => {
                let content = '';
                const spaces = ' '.repeat(indent);
                for (const [key, value] of Object.entries(obj)) {
                    if (key === 'SandboxVars' || key === '') continue;
                    if (value === undefined || value === null) continue; // Skip null/undefined

                    // Check if key needs quoting
                    const needsQuotes = !/^[a-zA-Z_][a-zA-Z0-9_]*$/.test(key);
                    const keyStr = needsQuotes ? `["${key.replace(/"/g, '\\"')}"]` : key;

                    if (typeof value === 'object') {
                        content += `${spaces}${keyStr} = {\n`;
                        content += serializeLua(value, indent + 4);
                        content += `${spaces}},\n`;
                    } else {
                        let valStr = value;
                        if (typeof value === 'string') {
                            // Escape backslashes first, then double quotes
                            valStr = `"${value.replace(/\\/g, '\\\\').replace(/"/g, '\\"')}"`;
                        }
                        content += `${spaces}${keyStr} = ${valStr},\n`;
                    }
                }
                return content;
            };

            let luaContent = 'SandboxVars = {\n';
            luaContent += serializeLua(data.sandbox);
            luaContent += '}\nreturn SandboxVars';
            await fs.writeFile(luaPath, luaContent);
        } catch (error) {
            console.error(`Error writing Lua file ${luaPath}:`, error);
        }
    }

    if (data.spawnregions !== undefined) {
        try {
            await fs.writeFile(spawnPath, data.spawnregions);
        } catch (error) {
            console.error(`Error writing SpawnRegions file ${spawnPath}:`, error);
        }
    }

    if (data.zombies) {
        try {
            const zombiesContent = ini.stringify(data.zombies);
            await fs.writeFile(zombiesPath, zombiesContent);
        } catch (error) {
            console.error(`Error writing Zombies INI ${zombiesPath}:`, error);
        }
    }

    if (data.metadata) {
        try {
            await fs.writeFile(jsonPath, JSON.stringify(data.metadata, null, 2));
        } catch (error) {
            console.error(`Error writing Metadata JSON ${jsonPath}:`, error);
        }
    }
}

export async function deleteConfig(serverName, deleteWorld = false) {
    if (!isValidServerName(serverName)) {
        console.error(`Invalid server name: ${serverName}`);
        return false;
    }
    const CONFIG_DIR = await getConfigDir();
    const iniPath = path.join(CONFIG_DIR, `${serverName}.ini`);
    const luaPath = path.join(CONFIG_DIR, `${serverName}_SandboxVars.lua`);
    const spawnPath = path.join(CONFIG_DIR, `${serverName}_spawnregions.lua`);
    const zombiesPath = path.join(CONFIG_DIR, `${serverName}_zombies.ini`);
    const jsonPath = path.join(CONFIG_DIR, `${serverName}.json`);

    try {
        if (await exists(iniPath)) await fs.unlink(iniPath);
        if (await exists(luaPath)) await fs.unlink(luaPath);
        if (await exists(spawnPath)) await fs.unlink(spawnPath);
        if (await exists(zombiesPath)) await fs.unlink(zombiesPath);
        if (await exists(jsonPath)) await fs.unlink(jsonPath);

        if (deleteWorld) {
            const savesDir = path.join(await getSavesDir(), serverName);
            const dbPath = path.join(await getDbDir(), `${serverName}.db`); // Note: DB location might vary, usually in db folder or saves

            // Standard PZ Save Location: ~/Zomboid/Saves/Multiplayer/<ServerName>
            if (await exists(savesDir)) {
                await fs.rm(savesDir, { recursive: true, force: true });
            }

            // Also check for the .db file which might be in Zomboid/db or Zomboid/Saves
            // Actually, for MP, the main world data is in the Saves/Multiplayer/<ServerName> folder (map_p.bin, etc.)
            // The player database is usually <ServerName>.db in Zomboid/db
            const dbDir = await getDbDir();
            const dbFile = path.join(dbDir, `${serverName}.db`);
            if (await exists(dbFile)) {
                await fs.unlink(dbFile);
            }
        }

        return true;
    } catch (error) {
        console.error(`Error deleting config ${serverName}:`, error);
        return false;
    }
}

export async function openConfigFile(serverName) {
    if (!isValidServerName(serverName)) return false;
    const CONFIG_DIR = await getConfigDir();
    const iniPath = path.join(CONFIG_DIR, `${serverName}.ini`);
    if (await exists(iniPath)) {
        await shell.openPath(iniPath);
        return true;
    }
    return false;
}

export async function revealConfigFile(serverName) {
    if (!isValidServerName(serverName)) return false;
    const CONFIG_DIR = await getConfigDir();
    const iniPath = path.join(CONFIG_DIR, `${serverName}.ini`);
    if (await exists(iniPath)) {
        shell.showItemInFolder(iniPath);
        return true;
    }
    return false;
}

export async function installSophiePreset(onProgress) {
    const settings = await getSettings();
    const destBase = settings.pzConfigPath || path.join(app.getPath('home'), 'Zomboid');
    const tempDir = app.getPath('temp');
    const zipPath = path.join(tempDir, 'sophie_preset.zip');
    const extractPath = path.join(tempDir, 'sophie_extracted');
    const downloadUrl = 'https://drive.google.com/uc?export=download&id=1SKnAm9rEjzcypx4jqb85YmmZlpyU0nkb';

    try {
        if (onProgress) onProgress({ status: 'Downloading...', percent: 0 });

        // 1. Download File
        const response = await fetch(downloadUrl);
        if (!response.ok) throw new Error(`Failed to download: ${response.statusText}`);

        const totalBytes = Number(response.headers.get('content-length')) || 0;
        let downloadedBytes = 0;
        const fileStream = await fs.open(zipPath, 'w');

        // Node 18+ fetch body is a ReadableStream
        const reader = response.body.getReader();

        while (true) {
            const { done, value } = await reader.read();
            if (done) break;

            await fileStream.write(value);
            downloadedBytes += value.length;

            if (totalBytes > 0 && onProgress) {
                const percent = Math.round((downloadedBytes / totalBytes) * 100);
                onProgress({ status: 'Downloading...', percent });
            }
        }
        await fileStream.close();

        if (onProgress) onProgress({ status: 'Extracting...', percent: 100 });

        // 2. Unzip using PowerShell (Windows only, but app is for Windows)
        // Clean previous extraction if exists
        if (await exists(extractPath)) {
            await fs.rm(extractPath, { recursive: true, force: true });
        }

        const { exec } = await import('child_process');
        const psCommand = `powershell -command "Expand-Archive -Path '${zipPath}' -DestinationPath '${extractPath}' -Force"`;

        await new Promise((resolve, reject) => {
            exec(psCommand, (error, stdout, stderr) => {
                if (error) {
                    console.error('Unzip error:', stderr);
                    reject(error);
                } else {
                    resolve();
                }
            });
        });

        if (onProgress) onProgress({ status: 'Installing...', percent: 100 });

        // 3. Move Files
        // The zip structure is likely: Sophie Files/{Server, Lua, Sandbox Presets} or just {Server, Lua, ...}
        // Let's check what's inside extractPath
        const extractedFiles = await fs.readdir(extractPath);
        let sourceRoot = extractPath;

        // If there's a single folder inside, go into it (common with zips)
        if (extractedFiles.length === 1 && (await fs.stat(path.join(extractPath, extractedFiles[0]))).isDirectory()) {
            sourceRoot = path.join(extractPath, extractedFiles[0]);
        }

        // Ensure destination directories exist
        await fs.mkdir(path.join(destBase, 'Server'), { recursive: true });
        await fs.mkdir(path.join(destBase, 'Lua'), { recursive: true });
        await fs.mkdir(path.join(destBase, 'Sandbox Presets'), { recursive: true });

        // Copy Server folder
        if (await exists(path.join(sourceRoot, 'Server'))) {
            await fs.cp(path.join(sourceRoot, 'Server'), path.join(destBase, 'Server'), { recursive: true, force: true });
        }

        // Copy Lua folder
        if (await exists(path.join(sourceRoot, 'Lua'))) {
            await fs.cp(path.join(sourceRoot, 'Lua'), path.join(destBase, 'Lua'), { recursive: true, force: true });
        }

        // Copy Sandbox Presets folder
        if (await exists(path.join(sourceRoot, 'Sandbox Presets'))) {
            await fs.cp(path.join(sourceRoot, 'Sandbox Presets'), path.join(destBase, 'Sandbox Presets'), { recursive: true, force: true });
        }

        // Cleanup
        await fs.unlink(zipPath);
        await fs.rm(extractPath, { recursive: true, force: true });

        return { success: true, message: 'Sophie Modpack installed successfully.' };
    } catch (error) {
        console.error('Error installing Sophie Preset:', error);
        return { success: false, error: error.message };
    }
}

export async function getSaves() {
    const savesPath = await getSavesDir();
    if (!(await exists(savesPath))) return [];

    try {
        const files = await fs.readdir(savesPath, { withFileTypes: true });
        return files.filter(dirent => dirent.isDirectory()).map(dirent => dirent.name);
    } catch (error) {
        console.error('Error reading saves directory:', error);
        return [];
    }
}

export async function deleteSave(saveName) {
    const savePath = path.join(await getSavesDir(), saveName);
    const dbPath = path.join(await getDbDir(), `${saveName}.db`);

    try {
        if (await exists(savePath)) {
            await fs.rm(savePath, { recursive: true, force: true });
        }
        if (await exists(dbPath)) {
            await fs.unlink(dbPath);
        }
        return true;
    } catch (error) {
        console.error(`Error deleting save ${saveName}:`, error);
        return false;
    }
}
