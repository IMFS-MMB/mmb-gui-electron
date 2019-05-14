const fs = require('fs');
const models = require('./models');

models.forEach((model) => {
  const modFile = `./${model}/${model}.mod`;
  const jsonFile = `./${model}/${model}.json`;

  // eslint-disable-next-line import/no-dynamic-require
  const json = require(jsonFile);
  const mod = fs.readFileSync(modFile, { encoding: 'utf8' });

  json.vars = mod
    .split(/\r?\n/)
    .map(line => line.replace(/\/\/.*$/, '')) // remove // style comments
    .map(line => line.replace(/%.*$/, '')) // remove % style comments
    .join(' ')
    .match(/varexo(.*?);/)[1] // find match between 'varexo' and the first semicolon thereafter
    .replace(/\/*.+?\*\//g, '') // remove /* */ style comments
    .replace(/,/g, '')
    .split(/\s+/)
    .filter(line => !/^\s*$/.test(line)) // remove whitespace-only lines
    .reduce((acc, v) => acc.concat(v), []);

  fs.writeFileSync(jsonFile, JSON.stringify(json, null, 2));
});
