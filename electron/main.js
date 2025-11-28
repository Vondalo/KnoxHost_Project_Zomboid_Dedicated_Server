import { app, BrowserWindow, ipcMain, Tray, Menu, nativeImage, Notification, protocol, dialog } from 'electron';
import electronUpdater from 'electron-updater';
const { autoUpdater } = electronUpdater;
import path from 'path';
import { fileURLToPath } from 'url';
import { ensureSteamCMD, installServer } from './handlers/steamcmd.js';
import { getConfigs, readConfig, saveConfig, deleteConfig, openConfigFile, revealConfigFile, installSophiePreset } from './handlers/config.js';
import { startServer, stopServer, getMemorySettings, setMemorySettings, getServerStatus, getServerLogs, openSavesFolder, backupSaves, startBackupSchedule, stopBackupSchedule, startRestartSchedule, stopRestartSchedule } from './handlers/server.js';
import { getInstalledMods, addModToServer, removeModFromServer, searchSteamWorkshop, installMod, deleteMod, copyModsFromClient } from './handlers/mods.js';
import { getWhitelist, addToWhitelist, removeFromWhitelist } from './handlers/whitelist.js';
import { getSettings, saveSettings } from './handlers/settings.js';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

let tray = null;
let isQuitting = false;

// Global Error Handling
process.on('unhandledRejection', (reason, promise) => {
    console.error('Unhandled Rejection at:', promise, 'reason:', reason);
});

process.on('uncaughtException', (error) => {
    console.error('Uncaught Exception:', error);
});

// Register scheme as privileged
protocol.registerSchemesAsPrivileged([
    { scheme: 'media', privileges: { secure: true, supportFetchAPI: true, bypassCSP: true, standard: true } }
]);

function createWindow() {
    const win = new BrowserWindow({
        width: 1200,
        height: 800,
        webPreferences: {
            preload: path.join(__dirname, 'preload.js'),
            nodeIntegration: false,
            contextIsolation: true,
            sandbox: false,
        },
        autoHideMenuBar: true,
        backgroundColor: '#1a1a1a',
    });

    if (!app.isPackaged) {
        win.loadURL('http://localhost:5173');
        win.webContents.openDevTools();
    } else {
        win.loadFile(path.join(__dirname, '../dist/index.html'));
    }

    win.on('close', (event) => {
        if (!isQuitting) {
            event.preventDefault();
            win.hide();
            new Notification({
                title: 'KnoxHost',
                body: 'KnoxHost is running in the background.',
                icon: path.join(__dirname, '../assets/logo.png')
            }).show();
            return false;
        }
    });

    createTray(win);
}

function createTray(win) {
    const iconPath = path.join(__dirname, '../assets/logo.png');
    const icon = nativeImage.createFromPath(iconPath).resize({ width: 16, height: 16 });
    tray = new Tray(icon);

    const updateContextMenu = () => {
        const isRunning = getServerStatus();
        const statusText = isRunning ? 'Server: Running' : 'Server: Stopped';

        const contextMenu = Menu.buildFromTemplate([
            { label: statusText, enabled: false },
            { type: 'separator' },
            {
                label: 'Show App',
                click: () => {
                    win.show();
                }
            },
            {
                label: 'Quit',
                click: () => {
                    isQuitting = true;
                    app.quit();
                }
            }
        ]);

        tray.setToolTip(`KnoxHost - ${statusText}`);
        tray.setContextMenu(contextMenu);
    };

    updateContextMenu();

    // Poll server status every 5 seconds
    setInterval(updateContextMenu, 5000);

    tray.on('click', () => {
        win.show();
    });
}

app.whenReady().then(() => {
    createWindow();

    // IPC Handlers
    ipcMain.handle('steamcmd:ensure', ensureSteamCMD);
    ipcMain.handle('server:install', async () => {
        const win = BrowserWindow.getAllWindows()[0];
        return await installServer((data) => {
            win.webContents.send('server:output', data);
        });
    });
    ipcMain.handle('config:list', getConfigs);
    ipcMain.handle('config:read', (_, name) => readConfig(name));
    ipcMain.handle('config:save', (_, name, data) => saveConfig(name, data));
    ipcMain.handle('config:delete', (_, name) => deleteConfig(name));
    ipcMain.handle('config:open', (_, name) => openConfigFile(name));
    ipcMain.handle('config:reveal', (_, name) => revealConfigFile(name));
    ipcMain.handle('config:installSophie', async () => {
        const win = BrowserWindow.getAllWindows()[0];
        return await installSophiePreset((progress) => {
            win.webContents.send('sophie:progress', progress);
        });
    });

    ipcMain.handle('server:start', async (_, name, skipModVerification) => {
        const win = BrowserWindow.getAllWindows()[0];
        return await startServer(name, (data) => {
            win.webContents.send('server:output', data);
        }, skipModVerification);
    });

    ipcMain.handle('server:stop', stopServer);
    ipcMain.handle('server:getMemory', getMemorySettings);
    ipcMain.handle('server:setMemory', (_, min, max) => setMemorySettings(min, max));
    ipcMain.handle('server:status', getServerStatus);
    ipcMain.handle('server:logs', getServerLogs);
    ipcMain.handle('server:isInstalled', async () => {
        const { isServerInstalled } = await import('./handlers/server.js');
        return isServerInstalled();
    });
    ipcMain.handle('server:openSaves', openSavesFolder);
    ipcMain.handle('server:openFolder', async () => {
        const { openServerFolder } = await import('./handlers/server.js');
        return openServerFolder();
    });
    ipcMain.handle('server:backupSaves', backupSaves);
    ipcMain.handle('server:sendCommand', async (_, command) => {
        const { sendCommand } = await import('./handlers/server.js');
        return sendCommand(command);
    });

    // Admin & Player Management IPC
    ipcMain.handle('server:getPlayers', async () => {
        const { getConnectedPlayers } = await import('./handlers/server.js');
        return getConnectedPlayers();
    });
    ipcMain.handle('server:kickPlayer', async (_, username, reason) => {
        const { kickPlayer } = await import('./handlers/server.js');
        return kickPlayer(username, reason);
    });
    ipcMain.handle('server:banPlayer', async (_, username, reason, ip) => {
        const { banPlayer } = await import('./handlers/server.js');
        return banPlayer(username, reason, ip);
    });
    ipcMain.handle('server:unbanPlayer', async (_, username) => {
        const { unbanPlayer } = await import('./handlers/server.js');
        return unbanPlayer(username);
    });
    ipcMain.handle('server:messagePlayer', async (_, username, message) => {
        const { messagePlayer } = await import('./handlers/server.js');
        return messagePlayer(username, message);
    });
    ipcMain.handle('server:teleportPlayer', async (_, username, target) => {
        const { teleportPlayer } = await import('./handlers/server.js');
        return teleportPlayer(username, target);
    });
    ipcMain.handle('server:setAccessLevel', async (_, username, level) => {
        const { setAccessLevel } = await import('./handlers/server.js');
        return setAccessLevel(username, level);
    });
    ipcMain.handle('server:giveItem', async (_, username, item, count) => {
        const { giveItem } = await import('./handlers/server.js');
        return giveItem(username, item, count);
    });
    ipcMain.handle('server:addVehicle', async (_, username, vehicle) => {
        const { addVehicle } = await import('./handlers/server.js');
        return addVehicle(username, vehicle);
    });
    ipcMain.handle('server:godMode', async (_, username, enable) => {
        const { godMode } = await import('./handlers/server.js');
        return godMode(username, enable);
    });
    ipcMain.handle('server:invisible', async (_, username, enable) => {
        const { invisible } = await import('./handlers/server.js');
        return invisible(username, enable);
    });
    ipcMain.handle('server:startRain', async (_, intensity) => {
        const { startRain } = await import('./handlers/server.js');
        return startRain(intensity);
    });
    ipcMain.handle('server:stopRain', async () => {
        const { stopRain } = await import('./handlers/server.js');
        return stopRain();
    });
    ipcMain.handle('server:doChopper', async () => {
        const { doChopper } = await import('./handlers/server.js');
        return doChopper();
    });
    ipcMain.handle('server:doGunshot', async () => {
        const { doGunshot } = await import('./handlers/server.js');
        return doGunshot();
    });
    ipcMain.handle('server:broadcastMessage', async (_, message) => {
        const { broadcastMessage } = await import('./handlers/server.js');
        return broadcastMessage(message);
    });

    // Advanced Admin
    ipcMain.handle('server:addXp', async (_, user, skill, amt) => {
        const { addXp } = await import('./handlers/server.js');
        return addXp(user, skill, amt);
    });
    ipcMain.handle('server:unbanUser', async (_, user) => {
        const { unbanUser } = await import('./handlers/server.js');
        return unbanUser(user);
    });
    ipcMain.handle('server:teleportToCoords', async (_, user, x, y, z) => {
        const { teleportToCoords } = await import('./handlers/server.js');
        return teleportToCoords(user, x, y, z);
    });
    ipcMain.handle('server:getBanList', async () => {
        const { getBanList } = await import('./handlers/server.js');
        return getBanList();
    });

    ipcMain.handle('server:startBackupSchedule', (_, intervalMinutes) => {
        const win = BrowserWindow.getAllWindows()[0];
        return startBackupSchedule(intervalMinutes, (result) => {
            win.webContents.send('server:backupComplete', result);
        });
    });

    ipcMain.handle('server:stopBackupSchedule', stopBackupSchedule);

    ipcMain.handle('server:startRestartSchedule', (_, timeString) => {
        return startRestartSchedule(timeString);
    });

    ipcMain.handle('server:stopRestartSchedule', stopRestartSchedule);

    ipcMain.handle('config:getSaves', async () => {
        const { getSaves } = await import('./handlers/config.js');
        return await getSaves();
    });

    ipcMain.handle('config:deleteSave', async (_, saveName) => {
        const { deleteSave } = await import('./handlers/config.js');
        return await deleteSave(saveName);
    });

    ipcMain.handle('mods:list', getInstalledMods);
    ipcMain.handle('mods:search', (_, query) => searchSteamWorkshop(query));
    ipcMain.handle('mods:install', (_, workshopId) => installMod(workshopId, (msg) => win.webContents.send('server:output', msg)));
    ipcMain.handle('mods:delete', (_, workshopId) => deleteMod(workshopId));
    ipcMain.handle('mods:add', (_, configName, workshopId, modIds) => addModToServer(configName, workshopId, modIds));
    ipcMain.handle('mods:remove', (_, configName, workshopId, modIds) => removeModFromServer(configName, workshopId, modIds));
    ipcMain.handle('mods:copyFromClient', async (_, modIds) => {
        const win = BrowserWindow.getAllWindows()[0];
        return await copyModsFromClient(modIds, (msg) => win.webContents.send('server:output', msg));
    });

    ipcMain.handle('whitelist:get', (_, serverName) => getWhitelist(serverName));
    ipcMain.handle('whitelist:add', (_, serverName, username, password, isAdmin) => addToWhitelist(serverName, username, password, isAdmin));
    ipcMain.handle('whitelist:remove', (_, serverName, username) => removeFromWhitelist(serverName, username));

    ipcMain.handle('settings:get', getSettings);
    ipcMain.handle('settings:save', (_, settings) => saveSettings(settings));



    // Auto-Updater Logic
    autoUpdater.logger = console;
    autoUpdater.autoDownload = false; // We will manually trigger download if needed, or let user decide. Actually, let's set to true for convenience or handle it.
    // User asked for "automatically done when starting".
    // Let's set autoDownload = true so it's seamless, but we can also provide feedback.
    autoUpdater.autoDownload = true;

    ipcMain.handle('updater:check', () => {
        autoUpdater.checkForUpdates();
    });

    ipcMain.handle('updater:quitAndInstall', () => {
        autoUpdater.quitAndInstall();
    });

    autoUpdater.on('checking-for-update', () => {
        const win = BrowserWindow.getAllWindows()[0];
        if (win) win.webContents.send('updater:status', 'Checking for updates...');
    });

    autoUpdater.on('update-available', (info) => {
        const win = BrowserWindow.getAllWindows()[0];
        if (win) win.webContents.send('updater:update-available', info);
    });

    autoUpdater.on('update-not-available', (info) => {
        const win = BrowserWindow.getAllWindows()[0];
        if (win) win.webContents.send('updater:update-not-available', info);
    });

    autoUpdater.on('error', (err) => {
        const win = BrowserWindow.getAllWindows()[0];
        if (win) win.webContents.send('updater:error', err.message);
    });

    autoUpdater.on('download-progress', (progressObj) => {
        const win = BrowserWindow.getAllWindows()[0];
        if (win) win.webContents.send('updater:download-progress', progressObj);
    });

    autoUpdater.on('update-downloaded', (info) => {
        const win = BrowserWindow.getAllWindows()[0];
        if (win) win.webContents.send('updater:update-downloaded', info);
    });

    // Check for updates on startup
    autoUpdater.checkForUpdatesAndNotify();

});

// Register custom protocol for local media
app.whenReady().then(() => {

    protocol.registerFileProtocol('media', (request, callback) => {
        const url = request.url.replace('media://', '');
        try {
            return callback(decodeURIComponent(url));
        } catch (error) {
            console.error(error);
        }
    });
});

app.on('window-all-closed', () => {
    if (process.platform !== 'darwin') {
        app.quit();
    }
});
