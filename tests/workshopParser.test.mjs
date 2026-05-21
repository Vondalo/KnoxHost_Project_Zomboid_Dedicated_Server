import fs from 'fs/promises';
import path from 'path';
import { fileURLToPath } from 'url';
import assert from 'assert/strict';
import { parseWorkshopHtml } from '../electron/handlers/workshopParser.js';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

const fixturePath = path.join(__dirname, 'fixtures', 'workshop-browse-sample.html');
const html = await fs.readFile(fixturePath, 'utf8');
const results = parseWorkshopHtml(html, new Set(['2460154811']));

assert.equal(results.length, 2, 'expected two workshop cards to parse');
assert.deepEqual(results[0], {
    workshopId: '3726526329',
    title: "'78 Lamborghini Countach",
    preview: 'https://images.steamusercontent.com/ugc/sample-one.jpg',
    author: 'KI5',
    installed: false
});
assert.deepEqual(results[1], {
    workshopId: '2460154811',
    title: "Brita's Armor Pack",
    preview: 'https://images.steamusercontent.com/ugc/sample-two.jpg',
    author: 'BRITA',
    installed: true
});

console.log('workshopParser.test.mjs passed');
