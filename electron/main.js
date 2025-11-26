import { app, BrowserWindow, ipcMain } from 'electron';
import path from 'path';
import { fileURLToPath } from 'url';
import { ensureSteamCMD, installServer } from './handlers/steamcmd.js';
import { getConfigs, readConfig, saveConfig, deleteConfig, openConfigFile, revealConfigFile, installSophiePreset } from './handlers/config.js';
import { startServer, stopServer, getMemorySettings, setMemorySettings, getServerStatus, getServerLogs, openSavesFolder, backupSaves, startBackupSchedule, stopBackupSchedule, startRestartSchedule, stopRestartSchedule } from './handlers/server.js';
import { getInstalledMods, addModToServer, removeModFromServer, searchSteamWorkshop, installMod, deleteMod, copyModsFromClient } from './handlers/mods.js';
import { getWhitelist, addToWhitelist, removeFromWhitelist } from './handlers/whitelist.js';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

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
}

app.whenReady().then(() => {
    createWindow();

    // IPC Handlers
    ipcMain.handle('steamcmd:ensure', ensureSteamCMD);
    ipcMain.handle('server:install', installServer);
    ipcMain.handle('config:list', getConfigs);
    ipcMain.handle('config:read', (_, name) => readConfig(name));
    ipcMain.handle('config:save', (_, name, data) => saveConfig(name, data));
    ipcMain.handle('config:delete', (_, name) => deleteConfig(name));
    ipcMain.handle('config:open', (_, name) => openConfigFile(name));
    ipcMain.handle('config:reveal', (_, name) => revealConfigFile(name));
    ipcMain.handle('config:installSophie', installSophiePreset);

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
    ipcMain.handle('server:openSaves', openSavesFolder);
    ipcMain.handle('server:backupSaves', backupSaves);
    ipcMain.handle('server:sendCommand', async (_, command) => {
        const { sendCommand } = await import('./handlers/server.js');
        return sendCommand(command);
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

});

app.on('window-all-closed', () => {
    if (process.platform !== 'darwin') {
        app.quit();
    }
});
