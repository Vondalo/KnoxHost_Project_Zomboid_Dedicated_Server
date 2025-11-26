import { removeModFromServer, addModToServer } from './electron/handlers/mods.js';
import { readConfig, saveConfig } from './electron/handlers/config.js';
import path from 'path';
import fs from 'fs/promises';
import { app } from 'electron';

// Mock electron app.getPath
app.getPath = (name) => {
    if (name === 'userData') return './mock_userdata';
    if (name === 'home') return './mock_home';
    return '';
};

async function test() {
    // Setup mock environment
    const configDir = './mock_home/Zomboid/Server';
    await fs.mkdir(configDir, { recursive: true });

    const iniPath = path.join(configDir, 'test_server.ini');
    const initialIni = `
PublicName=Test Server
Mods=mod1;mod2;mod3
WorkshopItems=111;222;333
Map=Muldraugh, KY
`;
    await fs.writeFile(iniPath, initialIni);

    console.log('--- Initial Config ---');
    console.log(await fs.readFile(iniPath, 'utf-8'));

    // Test Removal
    console.log('\n--- Removing mod2 (ID: 222) ---');
    await removeModFromServer('test_server', '222', ['mod2']);

    console.log('--- Config After Removal ---');
    const afterRemoval = await fs.readFile(iniPath, 'utf-8');
    console.log(afterRemoval);

    if (afterRemoval.includes('Mods=mod1;mod3') && afterRemoval.includes('WorkshopItems=111;333')) {
        console.log('SUCCESS: Mod removed correctly.');
    } else {
        console.log('FAILURE: Mod NOT removed correctly.');
        if (afterRemoval.includes('[config]')) {
            console.log('DETECTED: [config] section created incorrectly.');
        }
    }
}

test().catch(console.error);
