const alterModel = require('./alter-model');

const model = process.argv[2];

if (!model) {
  throw new Error('Please provide model name as first argument');
}

alterModel(model, (json, mod) => {
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
    .reduce((acc, shockname) => acc.concat({
      name: shockname,
      text: shockname,
    }), []);

  json.variables = mod
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
    .reduce((acc, varname) => acc.concat({
      name: varname,
      text: varname,
    }), []);

  console.log(`Extracted ${json.shocks.length} shocks, ${json.variables.length} variables`);
});
