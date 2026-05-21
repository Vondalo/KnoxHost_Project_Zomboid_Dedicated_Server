import path from 'path';
import fs from 'fs/promises';
import { app } from 'electron';

const SETTINGS_FILE = path.join(app.getPath('userData'), 'settings.json');

// Default settings
const DEFAULT_SETTINGS = {
    pzConfigPath: path.join(app.getPath('home'), 'Zomboid'),
    steamInstallPath: 'C:\\Program Files (x86)\\Steam',
    enableDedicatedServer: false,
    uiEffectsEnabled: true
};

function normalizeSettings(settings = {}) {
    return {
        ...DEFAULT_SETTINGS,
        ...settings,
        enableDedicatedServer: Boolean(settings.enableDedicatedServer),
        uiEffectsEnabled: settings.uiEffectsEnabled !== false
    };
}

export async function getSettings() {
    try {
        const data = await fs.readFile(SETTINGS_FILE, 'utf-8');
        return normalizeSettings(JSON.parse(data));
    } catch (error) {
        // If file doesn't exist or is invalid, return defaults
        return { ...DEFAULT_SETTINGS };
    }
}

export async function saveSettings(settings) {
    if (!settings || typeof settings.pzConfigPath !== 'string' || typeof settings.steamInstallPath !== 'string') {
        console.error('Invalid settings object:', settings);
        return false;
    }
    try {
        await fs.mkdir(path.dirname(SETTINGS_FILE), { recursive: true });
        await fs.writeFile(SETTINGS_FILE, JSON.stringify(normalizeSettings(settings), null, 2));
        return true;
    } catch (error) {
        console.error('Error saving settings:', error);
        return false;
    }
}
