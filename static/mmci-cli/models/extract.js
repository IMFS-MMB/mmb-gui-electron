const fs = require('fs');
const models = require('./models');

models.forEach((model) => {
  const modFile = `./${model}/${model}.mod`;
  const jsonFile = `./${model}/${model}.json`;

  // eslint-disable-next-line import/no-dynamic-require
  const json = require(jsonFile);
  const mod = fs.readFileSync(modFile, { encoding: 'utf8' });

  json.shocks = mod
    .split(/\r?\n/)
    .map(line => line.replace(/\/\/.*$/, '')) // remove // style comments
    .map(line => line.replace(/%.*$/, '')) // remove % style comments
    .join(' ')
    .match(/varexo(.*?);/)[1] // find match between 'varexo' and the first semicolon thereafter
    .replace(/\/*.+?\*\//g, '') // remove /* */ style comments
    .replace(/,/g, ' ')
    .split(/\s+/) // split into non-whitespace portions
    .filter(line => !/^\s*$/.test(line)) // remove whitespace-only lines
    .sort((a, b) => a.localeCompare(b))
    .reduce((acc, v) => acc.concat(v), []);

  json.vars = mod
    .split(/\r?\n/)
    .map(line => line.replace(/\/\/.*$/, '')) // remove // style comments
    .map(line => line.replace(/%.*$/, '')) // remove % style comments
    .join(' ')
    .split('varexo')[0] // everything before 'varexo'
    .match(/var (.*?);/)[1] // find match between 'var' and the first semicolon thereafter
    .replace(/\/*.+?\*\//g, '') // remove /* */ style comments
    .replace(/,/g, ' ')
    .split(/\s+/) // split into non-whitespace portions
    .filter(line => !/^\s*$/.test(line)) // remove whitespace-only lines
    .sort((a, b) => a.localeCompare(b))
    .reduce((acc, v) => acc.concat(v), []);

  fs.writeFileSync(jsonFile, JSON.stringify(json, null, 2));
});
