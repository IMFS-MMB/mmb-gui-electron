const fs = require('fs');
const models = require('./models');

function forEachModel(fn) {
  return models.forEach((model) => {
    const jsonFile = `./${model}/${model}.json`;

    // eslint-disable-next-line import/no-dynamic-require
    const json = require(jsonFile);

    fn(json);

    fs.writeFileSync(jsonFile, JSON.stringify(json, null, 2));
  });
}

forEachModel((json) => {
  console.log(`${json.name}: ${json.shocks.length}`);
});
