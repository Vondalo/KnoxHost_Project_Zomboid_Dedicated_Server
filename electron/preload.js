import { contextBridge, ipcRenderer } from 'electron';

contextBridge.exposeInMainWorld('electronAPI', {
    ensureSteamCMD: () => ipcRenderer.invoke('steamcmd:ensure'),
    installServer: () => ipcRenderer.invoke('server:install'),
    getConfigs: () => ipcRenderer.invoke('config:list'),
    readConfig: (name) => ipcRenderer.invoke('config:read', name),
    saveConfig: (name, data) => ipcRenderer.invoke('config:save', name, data),
    deleteConfig: (name) => ipcRenderer.invoke('config:delete', name),
    openConfigFile: (name) => ipcRenderer.invoke('config:open', name),
    revealConfigFile: (name) => ipcRenderer.invoke('config:reveal', name),
    installSophiePreset: () => ipcRenderer.invoke('config:installSophie'),
    startServer: (name, skipModVerification) => ipcRenderer.invoke('server:start', name, skipModVerification),
    stopServer: () => ipcRenderer.invoke('server:stop'),
    getMemory: () => ipcRenderer.invoke('server:getMemory'),
    setMemory: (min, max) => ipcRenderer.invoke('server:setMemory', min, max),
    getServerStatus: () => ipcRenderer.invoke('server:status'),
    isServerInstalled: () => ipcRenderer.invoke('server:isInstalled'),
    getServerLogs: () => ipcRenderer.invoke('server:logs'),
    openSavesFolder: () => ipcRenderer.invoke('server:openSaves'),
    openServerFolder: () => ipcRenderer.invoke('server:openFolder'),
    backupSaves: () => ipcRenderer.invoke('server:backupSaves'),
    sendCommand: (command) => ipcRenderer.invoke('server:sendCommand', command),
    startBackupSchedule: (interval) => ipcRenderer.invoke('server:startBackupSchedule', interval),
    stopBackupSchedule: () => ipcRenderer.invoke('server:stopBackupSchedule'),
    onBackupComplete: (callback) => {
        const subscription = (_, result) => callback(result);
        ipcRenderer.on('server:backupComplete', subscription);
        return () => ipcRenderer.removeListener('server:backupComplete', subscription);
    },
    startRestartSchedule: (timeString) => ipcRenderer.invoke('server:startRestartSchedule', timeString),
    stopRestartSchedule: () => ipcRenderer.invoke('server:stopRestartSchedule'),
    getSaves: () => ipcRenderer.invoke('config:getSaves'),
    deleteSave: (saveName) => ipcRenderer.invoke('config:deleteSave', saveName),
    getMods: () => ipcRenderer.invoke('mods:list'),
    searchMods: (query) => ipcRenderer.invoke('mods:search', query),
    installMod: (workshopId) => ipcRenderer.invoke('mods:install', workshopId),
    deleteMod: (workshopId) => ipcRenderer.invoke('mods:delete', workshopId),
    addMod: (configName, workshopId, modIds) => ipcRenderer.invoke('mods:add', configName, workshopId, modIds),
    removeMod: (configName, workshopId, modIds) => ipcRenderer.invoke('mods:remove', configName, workshopId, modIds),
    copyModsFromClient: (modIds) => ipcRenderer.invoke('mods:copyFromClient', modIds),
    onServerOutput: (callback) => {
        const subscription = (_, data) => callback(data);
        ipcRenderer.on('server:output', subscription);
        return () => ipcRenderer.removeListener('server:output', subscription);
    },
    getWhitelist: (serverName) => ipcRenderer.invoke('whitelist:get', serverName),
    addToWhitelist: (serverName, username, password, isAdmin) => ipcRenderer.invoke('whitelist:add', serverName, username, password, isAdmin),
    removeFromWhitelist: (serverName, username) => ipcRenderer.invoke('whitelist:remove', serverName, username),
    getSettings: () => ipcRenderer.invoke('settings:get'),
    saveSettings: (settings) => ipcRenderer.invoke('settings:save', settings),
    onSophieProgress: (callback) => {
        const subscription = (_, data) => callback(data);
        ipcRenderer.on('sophie:progress', subscription);
        return () => ipcRenderer.removeListener('sophie:progress', subscription);
    },
});
