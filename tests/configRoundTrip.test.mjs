import fs from 'fs/promises';
import path from 'path';
import assert from 'assert/strict';
import electron from 'electron';

const testRoot = path.resolve('.test-temp-config');
const { app } = electron;

app.getPath = (name) => {
    if (name === 'home') {
        return path.join(testRoot, 'home');
    }
    if (name === 'userData') {
        return path.join(testRoot, 'userData');
    }
    return testRoot;
};

const { saveConfig, readConfig } = await import('../electron/handlers/config.js');

await fs.rm(testRoot, { recursive: true, force: true });
await fs.mkdir(path.join(testRoot, 'home', 'Zomboid', 'Server'), { recursive: true });

const configName = 'roundtrip-test';
const input = {
    config: {
        PublicName: 'Round Trip Test',
        Mods: 'mod1;mod2;mod3',
        WorkshopItems: '111;222;333',
        Map: 'Muldraugh, KY;BedfordFalls'
    },
    sandbox: {
        ZombieLore: {
            Speed: 2
        }
    },
    spawnregions: 'function SpawnRegions()\n\treturn {}\nend',
    zombies: {},
    metadata: {
        memory: {
            min: '6',
            max: '10'
        }
    }
};

const saveResult = await saveConfig(configName, input);
assert.equal(saveResult.success, true, `saveConfig should succeed: ${saveResult.errors.join(', ')}`);

const roundTrip = await readConfig(configName);

assert.equal(roundTrip.config.Mods, input.config.Mods, 'Mods should retain semicolon-separated values');
assert.equal(roundTrip.config.WorkshopItems, input.config.WorkshopItems, 'WorkshopItems should retain semicolon-separated values');
assert.equal(roundTrip.metadata.memory.min, '6', 'memory.min should round-trip');
assert.equal(roundTrip.metadata.memory.max, '10', 'memory.max should round-trip');

const invalidMemoryConfigName = 'roundtrip-invalid-memory';
const invalidMemoryInput = {
    ...input,
    metadata: {
        memory: {
            min: '8',
            max: '4'
        }
    }
};

const invalidSaveResult = await saveConfig(invalidMemoryConfigName, invalidMemoryInput);
assert.equal(invalidSaveResult.success, true, `saveConfig should normalize invalid memory settings: ${invalidSaveResult.errors.join(', ')}`);

const normalizedRoundTrip = await readConfig(invalidMemoryConfigName);
assert.equal(normalizedRoundTrip.metadata.memory.min, '8', 'invalid minimum memory should be preserved');
assert.equal(normalizedRoundTrip.metadata.memory.max, '8', 'maximum memory should be raised to match the minimum when the saved config is invalid');

console.log('configRoundTrip.test.mjs passed');
process.exit(0);
