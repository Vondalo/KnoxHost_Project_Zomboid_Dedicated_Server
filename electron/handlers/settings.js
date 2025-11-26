import path from 'path';
import fs from 'fs/promises';
import { app } from 'electron';

const SETTINGS_FILE = path.join(app.getPath('userData'), 'settings.json');

// Default settings
const DEFAULT_SETTINGS = {
    pzConfigPath: path.join(app.getPath('home'), 'Zomboid'),
    steamInstallPath: 'C:\\Program Files (x86)\\Steam'
};

export async function getSettings() {
    try {
        const data = await fs.readFile(SETTINGS_FILE, 'utf-8');
        return { ...DEFAULT_SETTINGS, ...JSON.parse(data) };
    } catch (error) {
        // If file doesn't exist or is invalid, return defaults
        return DEFAULT_SETTINGS;
    }
}

export async function saveSettings(settings) {
    try {
        await fs.writeFile(SETTINGS_FILE, JSON.stringify(settings, null, 2));
        return true;
    } catch (error) {
        console.error('Error saving settings:', error);
        return false;
    }
}
