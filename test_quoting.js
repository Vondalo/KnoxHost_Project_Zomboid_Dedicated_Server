import ini from 'ini';

const iniContent = `
Mods="mod1;mod2;mod3"
WorkshopItems="123;456;789"
`;

const parsed = ini.parse(iniContent);
console.log('Parsed Mods:', parsed.Mods);
console.log('Parsed WorkshopItems:', parsed.WorkshopItems);
