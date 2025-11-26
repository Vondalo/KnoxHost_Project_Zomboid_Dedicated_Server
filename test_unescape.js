import ini from 'ini';

const data = {
    Mods: 'mod1;mod2;mod3',
    WorkshopItems: '123;456;789',
    Map: 'Muldraugh, KY;West Point'
};

const stringified = ini.stringify(data);
console.log('Original Stringified:\n', stringified);

const fixed = stringified.replace(/\\;/g, ';');
console.log('Fixed Stringified:\n', fixed);
