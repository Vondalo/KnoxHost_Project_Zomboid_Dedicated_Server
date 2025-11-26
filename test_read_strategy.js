import ini from 'ini';

const iniContent = `
Mods=mod1;mod2;mod3
WorkshopItems=123;456
Map=Muldraugh, KY;West Point
SpawnPoint=0,0,0
Other=Value
AlreadyQuoted="quoted;value"
`;

// Pre-process to quote specific keys if not already quoted
const keysToQuote = ['Mods', 'WorkshopItems', 'Map', 'SpawnPoint'];
const lines = iniContent.split('\n');
const processedLines = lines.map(line => {
    const match = line.match(/^\s*(\w+)\s*=\s*(.*)/);
    if (match) {
        const key = match[1];
        let value = match[2];
        if (keysToQuote.includes(key)) {
            if (!value.startsWith('"')) {
                value = `"${value}"`;
            }
        }
        return `${key}=${value}`;
    }
    return line;
});

const processedContent = processedLines.join('\n');
console.log('Processed Content:\n', processedContent);

const parsed = ini.parse(processedContent);
console.log('Parsed:', parsed);
