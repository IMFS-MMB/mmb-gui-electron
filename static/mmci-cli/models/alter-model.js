const fs = require('fs');

module.exports = function alterModel(model, fn) {
  const jsonFile = `./${model}/${model}.json`;
  const modFile = `./${model}/${model}.mod`;

  // eslint-disable-next-line import/no-dynamic-require
  const json = require(jsonFile);
  const mod = fs.readFileSync(modFile, { encoding: 'utf8' });

  fn(json, mod);

  fs.writeFileSync(jsonFile, JSON.stringify(json, null, 2));
};
