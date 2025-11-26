import ini from 'ini';

const data = {
    Mods: 'mod1;mod2;mod3',
    WorkshopItems: '123;456;789'
};

const stringified = ini.stringify(data);
console.log('Stringified:\n', stringified);

const parsedBack = ini.parse(stringified);
console.log('Parsed Back Mods:', parsedBack.Mods);
