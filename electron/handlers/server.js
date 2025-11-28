import { spawn } from 'child_process';
import path from 'path';
import { app } from 'electron';
import fs from 'fs/promises';
import { constants } from 'fs';

import { readConfig } from './config.js';
import { installServer, downloadMods } from './steamcmd.js';
import { isValidServerName } from './validation.js';

const SERVER_DIR = path.join(app.getPath('userData'), 'server');
let serverProcess = null;
let currentServerName = null; // Track the current server name for restarts

// Helper for async file existence check
async function exists(filePath) {
    try {
        await fs.access(filePath, constants.F_OK);
        return true;
    } catch {
        return false;
    }
}

const serverState = {
    isRunning: false,
    logs: [],
    players: []
};

// Helper to strip ANSI codes
function stripAnsi(str) {
    return str.replace(/\u001b\[[0-9;]*m/g, '');
}

function addLog(message) {
    serverState.logs.push(message);
    if (serverState.logs.length > 1000) {
        serverState.logs.shift();
    }

    // Split message into lines to handle multi-line chunks
    const lines = message.split(/\r?\n/);

    for (const rawLine of lines) {
        const line = stripAnsi(rawLine); // Strip ANSI codes for parsing
        const trimmedLine = line.trim();
        if (!trimmedLine) continue;

        // Parse player list
        // Format usually: "Players connected (1):" followed by lines "- Username"
        // OR "Players connected (1): - Username"
        if (line.includes('Players connected (')) {
            console.log('[Debug] Found player list header:', line);
            serverState.parsingPlayers = true;
            serverState.tempPlayers = [];

            // Extract expected count
            const countMatch = line.match(/Players connected \((\d+)\)/);
            const expectedCount = countMatch ? parseInt(countMatch[1], 10) : 0;
            console.log('[Debug] Expected players:', expectedCount);

            // Check for player on the same line
            const parts = line.split('):');
            if (parts.length > 1) {
                const potentialPlayer = parts[1].trim();
                // Handle "- Username" or "-Username"
                if (potentialPlayer.startsWith('-')) {
                    const player = potentialPlayer.substring(1).trim();
                    if (player) {
                        serverState.tempPlayers.push(player);
                        console.log('[Debug] Found inline player:', player);
                    }
                }
            }

            // If we found all expected players (e.g. 0 or 1 on same line), commit immediately
            if (serverState.tempPlayers.length >= expectedCount) {
                serverState.players = [...serverState.tempPlayers];
                serverState.parsingPlayers = false;
                serverState.tempPlayers = [];
                console.log('[Debug] Player list updated (inline):', serverState.players);
            }
        } else if (serverState.parsingPlayers) {
            if (trimmedLine.startsWith('-')) {
                const player = trimmedLine.substring(1).trim();
                if (player) {
                    serverState.tempPlayers.push(player);
                    console.log('[Debug] Found line player:', player);
                }
            } else {
                // End of list
                serverState.players = [...serverState.tempPlayers];
                serverState.parsingPlayers = false;
                serverState.tempPlayers = [];
                console.log('[Debug] Player list updated (end of list):', serverState.players);
            }
        }
    }
}

export function getServerStatus() {
    return serverState.isRunning;
}

export function getServerLogs() {
    return serverState.logs;
}

export async function isServerInstalled() {
    const batPath = path.join(SERVER_DIR, 'StartServer64.bat');
    return await exists(batPath);
}

export async function startServer(serverName, onData, skipModVerification = false) {
    if (serverProcess) return false;

    if (!isValidServerName(serverName)) {
        const msg = `Error: Invalid server name "${serverName}". Only alphanumeric characters, hyphens, and underscores are allowed.`;
        if (onData) onData(msg);
        addLog(msg);
        return false;
    }

    currentServerName = serverName; // Update current server name

    // Windows batch file
    const batPath = path.join(SERVER_DIR, 'StartServer64.bat');

    // Note: StartServer64.bat might need to be run from its directory
    if (!(await exists(batPath))) {
        const msg = `Server file not found. Starting automatic download/install... This may take a while.`;
        if (onData) onData(msg);
        addLog(msg);

        try {
            await installServer((msg) => {
                if (onData) onData(`[Installer] ${msg}`);
                addLog(`[Installer] ${msg}`);
            });
            const completeMsg = `Installation complete. Starting server...`;
            if (onData) onData(completeMsg);
            addLog(completeMsg);
        } catch (err) {
            const errMsg = `Error installing server: ${err.message}`;
            if (onData) onData(errMsg);
            addLog(errMsg);
            return false;
        }
    }

    // Pre-download mods to avoid server-side download issues
    if (!skipModVerification) {
        try {
            const configData = await readConfig(serverName);
            if (configData && configData.config && configData.config.WorkshopItems) {
                const workshopItems = configData.config.WorkshopItems.split(';').map(id => id.trim()).filter(id => id);
                if (workshopItems.length > 0) {
                    const verifyMsg = `Verifying ${workshopItems.length} workshop items...`;
                    if (onData) onData(verifyMsg);
                    addLog(verifyMsg);

                    await downloadMods(workshopItems, (msg) => {
                        if (onData) onData(`[SteamCMD] ${msg}`);
                        addLog(`[SteamCMD] ${msg}`);
                    });
                }
            }
        } catch (err) {
            console.error("Failed to pre-download mods:", err);
            const warnMsg = `Warning: Failed to pre-download mods. Server will attempt to download them. Error: ${err.message}`;
            if (onData) onData(warnMsg);
            addLog(warnMsg);
        }
    } else {
        const skipMsg = `Skipping mod verification as requested.`;
        if (onData) onData(skipMsg);
        addLog(skipMsg);
    }

    // Fix steam_appid.txt if it exists and is incorrect
    const appidPath = path.join(SERVER_DIR, 'steam_appid.txt');
    if (await exists(appidPath)) {
        try {
            const appidContent = await fs.readFile(appidPath, 'utf8');
            if (appidContent.trim() === '380870') {
                const fixMsg = 'Fixing steam_appid.txt (380870 -> 108600)...';
                if (onData) onData(fixMsg);
                addLog(fixMsg);
                await fs.writeFile(appidPath, '108600');
            }
        } catch (err) {
            console.error('Failed to fix steam_appid.txt:', err);
        }
    }

    // Patch memory settings
    try {
        const configData = await readConfig(serverName);
        const memSettings = configData.metadata?.memory || { min: '4', max: '4' };

        let content = await fs.readFile(batPath, 'utf8');
        // Match -Xms and -Xmx with any value (e.g. 16g, 8g, 2048m)
        const memRegex = /-Xms(\d+[gm])\s+-Xmx(\d+[gm])/;

        // Always enforce the settings from the config
        const newMemStr = `-Xms${memSettings.min}g -Xmx${memSettings.max}g`;

        if (content.match(memRegex)) {
            content = content.replace(memRegex, newMemStr);
        } else {
            // If regex doesn't match, it might be using a different format or variables. 
            // But usually StartServer64.bat has these flags.
            // We'll append them to the java command if we can find it, or just log a warning.
            console.warn("Could not find memory flags in StartServer64.bat to replace.");
        }

        await fs.writeFile(batPath, content);

        const memMsg = `Applied memory settings: ${memSettings.min}GB / ${memSettings.max}GB`;
        if (onData) onData(memMsg);
        addLog(memMsg);

    } catch (err) {
        console.error('Failed to patch memory settings:', err);
    }

    serverProcess = spawn(batPath, ['-servername', serverName], { cwd: SERVER_DIR, shell: true });
    serverState.isRunning = true;

    serverProcess.stdout.on('data', (data) => {
        const msg = data.toString();
        if (onData) onData(msg);
        addLog(msg);

        // Detect password prompt
        if (msg.includes('Enter new administrator password')) {
            if (onData) onData({ type: 'password-needed' });
        }
    });

    serverProcess.stderr.on('data', (data) => {
        const msg = data.toString();
        if (onData) onData(msg);
        addLog(msg);

        // Detect password prompt in stderr too, just in case
        if (msg.includes('Enter new administrator password')) {
            if (onData) onData({ type: 'password-needed' });
        }
    });

    serverProcess.on('close', () => {
        serverProcess = null;
        serverState.isRunning = false;
        const stopMsg = 'Server stopped.';
        if (onData) onData(stopMsg);
        addLog(stopMsg);
    });

    try {
        const content = await fs.readFile(batPath, 'utf8');
        // Look for -Xms and -Xmx
        const minMatch = content.match(/-Xms(\d+[gm])/);
        const maxMatch = content.match(/-Xmx(\d+[gm])/);

        return {
            min: minMatch ? minMatch[1] : '4g',
            max: maxMatch ? maxMatch[1] : '4g'
        };
    } catch (err) {
        console.error('Error reading memory settings:', err);
        return { min: '4g', max: '4g' };
    }
}

export async function stopServer() {
    if (serverProcess) {
        addLog('Stopping server...');

        // 1. Notify and Save
        if (serverProcess && serverState.isRunning) {
            sendCommand('servermsg "Server is shutting down..."');
            sendCommand('save');

            // Wait 5s for save to process
            await new Promise(resolve => setTimeout(resolve, 5000));

            // 2. Quit
            sendCommand('quit');
            addLog('> quit');
        }

        // 3. Wait for graceful exit
        // We do NOT force kill. We let the server take its time to close.
        // The 'close' event handler in startServer will clean up the state.

        return true;
    }
    return false;
}

export function sendCommand(command) {
    if (serverProcess && serverProcess.stdin && !serverProcess.killed) {
        try {
            serverProcess.stdin.write(command + '\n');
            addLog(`> ${command}`);
            return true;
        } catch (err) {
            console.error('Failed to write to server stdin:', err);
            addLog(`Error sending command: ${err.message}`);
            return false;
        }
    }
    addLog('Error: Server is not running or input is unavailable.');
    return false;
}

export async function getMemorySettings() {
    const batPath = path.join(SERVER_DIR, 'StartServer64.bat');
    if (!(await exists(batPath))) return { min: '4g', max: '4g' }; // Default fallback

    try {
        const content = await fs.readFile(batPath, 'utf8');
        // Look for -Xms and -Xmx
        const minMatch = content.match(/-Xms(\d+[gm])/);
        const maxMatch = content.match(/-Xmx(\d+[gm])/);

        return {
            min: minMatch ? minMatch[1] : '4g',
            max: maxMatch ? maxMatch[1] : '4g'
        };
    } catch (err) {
        console.error('Error reading memory settings:', err);
        return { min: '4g', max: '4g' };
    }
}

export async function setMemorySettings(min, max) {
    const batPath = path.join(SERVER_DIR, 'StartServer64.bat');
    if (!(await exists(batPath))) return false;

    try {
        let content = await fs.readFile(batPath, 'utf8');

        // Replace existing or add if missing
        if (content.match(/-Xms\d+[gm]/)) {
            content = content.replace(/-Xms\d+[gm]/, `-Xms${min}`);
        }
        if (content.match(/-Xmx\d+[gm]/)) {
            content = content.replace(/-Xmx\d+[gm]/, `-Xmx${max}`);
        }

        await fs.writeFile(batPath, content);
        return true;
    } catch (err) {
        console.error('Error writing memory settings:', err);
        return false;
    }
}

export async function openSavesFolder() {
    const savesPath = path.join(app.getPath('home'), 'Zomboid', 'Saves', 'Multiplayer');
    try {
        await fs.mkdir(savesPath, { recursive: true });
        await import('electron').then(e => e.shell.openPath(savesPath));
        return true;
    } catch (err) {
        console.error('Failed to open saves folder:', err);
        return false;
    }
}

export async function openServerFolder() {
    try {
        await fs.mkdir(SERVER_DIR, { recursive: true });
        await import('electron').then(e => e.shell.openPath(SERVER_DIR));
        return true;
    } catch (err) {
        console.error('Failed to open server folder:', err);
        return false;
    }
}

export async function backupSaves() {
    const savesPath = path.join(app.getPath('home'), 'Zomboid', 'Saves', 'Multiplayer');
    const backupsDir = path.join(app.getPath('userData'), 'backups');
    const timestamp = new Date().toISOString().replace(/[:.]/g, '-');
    const backupName = `backup-${timestamp}`;
    const targetPath = path.join(backupsDir, backupName);

    try {
        if (!(await exists(savesPath))) {
            throw new Error('Saves folder does not exist');
        }

        await fs.mkdir(backupsDir, { recursive: true });
        await fs.cp(savesPath, targetPath, { recursive: true });
        return { success: true, path: targetPath };
    } catch (err) {
        console.error('Failed to backup saves:', err);
        return { success: false, error: err.message };
    }
}

let backupIntervalId = null;

export function startBackupSchedule(intervalMinutes, onBackupComplete) {
    if (backupIntervalId) clearInterval(backupIntervalId);

    const intervalMs = intervalMinutes * 60 * 1000;
    addLog(`Backup schedule started. Interval: ${intervalMinutes} minutes.`);

    backupIntervalId = setInterval(async () => {
        addLog('Starting scheduled backup...');
        const result = await backupSaves();
        if (result.success) {
            addLog(`Scheduled backup created: ${path.basename(result.path)}`);
        } else {
            addLog(`Scheduled backup failed: ${result.error}`);
        }
        if (onBackupComplete) onBackupComplete(result);
    }, intervalMs);

    return true;
}

export function stopBackupSchedule() {
    if (backupIntervalId) {
        clearInterval(backupIntervalId);
        backupIntervalId = null;
        addLog('Backup schedule stopped.');
        return true;
    }
    return false;
}

let restartIntervalId = null;

export function startRestartSchedule(timeString) {
    if (restartIntervalId) clearInterval(restartIntervalId);

    addLog(`Restart schedule set for ${timeString} daily.`);

    restartIntervalId = setInterval(() => {
        const now = new Date();
        const currentTime = `${String(now.getHours()).padStart(2, '0')}:${String(now.getMinutes()).padStart(2, '0')}`;

        if (currentTime === timeString) {
            addLog('Scheduled restart triggered!');

            // Send warning
            sendCommand('servermsg "Server restarting in 1 minute..."');

            setTimeout(async () => {
                sendCommand('quit');
                addLog('Stopping server for restart...');

                // Poll for server shutdown (max 60 seconds)
                let attempts = 0;
                const maxAttempts = 60;

                const checkServerStopped = setInterval(async () => {
                    attempts++;
                    if (!serverProcess || !serverState.isRunning) {
                        clearInterval(checkServerStopped);
                        addLog('Server stopped. Starting restart...');

                        if (currentServerName) {
                            // Wait a brief moment to ensure file locks are released
                            setTimeout(async () => {
                                await startServer(currentServerName, null, false);
                            }, 2000);
                        } else {
                            addLog('Error: Could not restart, server name unknown.');
                        }
                    } else if (attempts >= maxAttempts) {
                        clearInterval(checkServerStopped);
                        addLog('Error: Server failed to stop in time. Retrying stop...');
                        stopServer(); // Attempt safe stop again

                        setTimeout(async () => {
                            if (currentServerName) {
                                await startServer(currentServerName, null, false);
                            }
                        }, 2000);
                    }
                }, 1000);

            }, 60000); // Wait 1 min after warning
        }
    }, 60000); // Check every minute

    return true;
}

export function stopRestartSchedule() {
    if (restartIntervalId) {
        clearInterval(restartIntervalId);
        restartIntervalId = null;
        addLog('Restart schedule stopped.');
        return true;
    }
    return false;
}

// Player Management & Admin Commands

export function getConnectedPlayers() {
    // Send command to refresh list
    sendCommand('players');
    // Return current state (will be updated async by log parser)
    console.log('[Debug] getConnectedPlayers returning:', serverState.players);
    return serverState.players || [];
}

export function kickPlayer(username, reason) {
    const cmd = reason ? `kick "${username}" -r "${reason}"` : `kick "${username}"`;
    return sendCommand(cmd);
}

export function banPlayer(username, reason, ip = false) {
    let cmd = `banuser "${username}"`;
    if (ip) cmd += ' -ip';
    if (reason) cmd += ` -r "${reason}"`;
    return sendCommand(cmd);
}

export function unbanPlayer(username) {
    return sendCommand(`unbanuser "${username}"`);
}

export function messagePlayer(username, message) {
    // Try 'message' instead of 'msg'
    return sendCommand(`message "${username}" "${message}"`);
}

export function teleportPlayer(username, target) {
    // target can be another username or x,y,z
    // If target is missing, we can't teleport from console
    if (!target) return false;
    return sendCommand(`teleport "${username}" "${target}"`);
}

export function setAccessLevel(username, level) {
    // level: admin, moderator, overseer, gm, observer, none
    return sendCommand(`setaccesslevel "${username}" "${level}"`);
}

export function giveItem(username, item, count = 1) {
    return sendCommand(`additem "${username}" "${item}" ${count}`);
}

export function addVehicle(username, vehicle) {
    return sendCommand(`addvehicle "${vehicle}" "${username}"`);
}

export function godMode(username, enable) {
    // Expects -true or -false
    return sendCommand(`godmode "${username}" -${enable}`);
}

export function invisible(username, enable) {
    // Expects -true or -false
    return sendCommand(`invisible "${username}" -${enable}`);
}

// World Events
export function startRain(intensity) {
    return sendCommand(`startrain ${intensity}`);
}

export function stopRain() {
    return sendCommand(`stoprain`);
}

export function doChopper() {
    return sendCommand(`chopper`);
}

export function doGunshot() {
    return sendCommand(`gunshot`);
}

export function broadcastMessage(message) {
    return sendCommand(`servermsg "${message}"`);
}

// Advanced Features
export function addXp(username, skill, amount) {
    // /addxp "username" skillname=amount
    return sendCommand(`addxp "${username}" ${skill}=${amount}`);
}

export function unbanUser(username) {
    return sendCommand(`unbanuser "${username}"`);
}

export function teleportToCoords(username, x, y, z) {
    // /teleport "username" x,y,z (Attempting to use teleport for coords as teleportto is executor-only)
    return sendCommand(`teleport "${username}" ${x},${y},${z}`);
}

import Database from 'better-sqlite3';

export async function getBanList() {
    if (!currentServerName) return [];

    const dbPath = path.join(app.getPath('home'), 'Zomboid', 'db', `${currentServerName}.db`);

    if (!(await exists(dbPath))) return [];

    let db;
    try {
        db = new Database(dbPath, { readonly: true, timeout: 5000 });

        // Check if tables exist
        const tableExists = db.prepare("SELECT name FROM sqlite_master WHERE type='table' AND name='bannedip'").get();
        if (!tableExists) return [];

        // Get bans from bannedip (contains usernames)
        const rows = db.prepare('SELECT username FROM bannedip').all();

        // We could also check bannedid for SteamIDs, but for now let's stick to usernames
        // const steamBans = db.prepare('SELECT steamid FROM bannedid').all();

        return rows.map(r => r.username).filter(u => u);
    } catch (err) {
        console.error(`Error reading ban list from ${dbPath}:`, err);
        return [];
    } finally {
        if (db) db.close();
    }
}
