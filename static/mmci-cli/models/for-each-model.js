const models = require('./models');
const alterModel = require('./alter-model');

module.exports = function forEachModel(fn) {
  return models.forEach(model => alterModel(model, fn));
};

