const fs = require('fs');

const serializeLua = (obj, indent = 4) => {
    let content = '';
    const spaces = ' '.repeat(indent);
    for (const [key, value] of Object.entries(obj)) {
        if (key === 'SandboxVars') continue;

        if (typeof value === 'object' && value !== null) {
            content += `${spaces}${key} = {\n`;
            content += serializeLua(value, indent + 4);
            content += `${spaces}},\n`;
        } else {
            let valStr = value;
            if (typeof value === 'string') valStr = `"${value}"`;
            content += `${spaces}${key} = ${valStr},\n`;
        }
    }
    return content;
};

const testData = {
    VERSION: 5,
    "Invalid Key": 123, // Space in key
    "123Start": 456,    // Starts with number
    "": 789,            // Empty key
    Normal: "Value"
};

let luaContent = 'SandboxVars = {\n';
luaContent += serializeLua(testData);
luaContent += '}';

console.log(luaContent);
