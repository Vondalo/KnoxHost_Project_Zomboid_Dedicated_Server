import ini from 'ini';

// Mocking the logic from config.js
function parseConfig(iniContent) {
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

    return ini.parse(processedLines.join('\n'));
}

function stringifyConfig(config) {
    let iniContent = ini.stringify(config);
    // Post-process to unescape semicolons for PZ compatibility
    iniContent = iniContent.replace(/\\;/g, ';');
    return iniContent;
}

// Test Case 1: Reading problematic INI
const problematicIni = `
Mods=mod1;mod2;mod3
WorkshopItems=123;456;789
Map=Muldraugh, KY;West Point
Other=Value
`;

console.log('--- Testing Read Logic ---');
const parsed = parseConfig(problematicIni);
console.log('Parsed Mods:', parsed.Mods);
console.log('Parsed WorkshopItems:', parsed.WorkshopItems);
console.log('Parsed Map:', parsed.Map);

if (parsed.Mods === 'mod1;mod2;mod3' && parsed.WorkshopItems === '123;456;789') {
    console.log('✅ Read Logic Passed');
} else {
    console.error('❌ Read Logic Failed');
}

// Test Case 2: Writing Config
console.log('\n--- Testing Write Logic ---');
const dataToWrite = {
    Mods: 'mod1;mod2;mod3',
    WorkshopItems: '123;456;789',
    Map: 'Muldraugh, KY;West Point'
};

const stringified = stringifyConfig(dataToWrite);
console.log('Stringified Output:\n', stringified);

if (stringified.includes('Mods=mod1;mod2;mod3') && !stringified.includes('Mods=mod1\\;mod2\\;mod3')) {
    console.log('✅ Write Logic Passed');
} else {
    console.error('❌ Write Logic Failed');
}
