/*eslint-disable*/
const path = require('path');
const fs = require('fs');
const { deleteByDot } = require('feathers-hooks-common');

const descriptions = require('./descriptions');
const models = require('./models');

const model_prules = require('./model_prules');
const common_rules = require('./common_rules');
const prules = require('./prules');

const description_authors = require('./description_authors');
const prule_params = require('./prule_params');
const params = require('./params');
const allAuthors = require('./authors');
const output_vars = require('./output_vars');
const shocks = require('./shocks');

function getDescription (id) {
  const { ...description } = descriptions.find(d => d.id === id);

  return {
    ...description,
    authors: getAuthors(description.id)
  }
}

function getAuthors (id) {
  // const description = getDescription(id);

  const authors = description_authors
    .filter(da => da.description_id === id)
    .map(da => allAuthors.find(a => a.id === da.author_id))
    .map(a => a.name);

  return authors
}

// function getCompatibility (id) {
//   const compatible = model_prules.filter(mp => mp.model_id === id).map(mp => mp.model_id)
//   return common_rules.filter()
// }

function getModels () {
  const result = models.map(model => {
    const description = getDescription(model.description_id);
    const rule = prules.find(r => {
      return r.id === model.id;
    });

    const {
      // id,
      interest,
      inflation,
      outputgap,
      output,
      mp_shock,
      fiscal_shock,
      ..._model
    } = model;

    const capabilities = {
      interest,
      inflation,
      outputgap,
      output,
      mp_shock,
      fiscal_shock
    };

    // const compatibility = getCompatibility(model.id);

    delete _model.description_id;
    delete description.id;

    return {
      ..._model,

      capabilities,
      description,
      rule: rule || null
    };
  });

  return result;
}

function getCommonRules () {
  const result = common_rules.map(cm => {
    const description = getDescription(cm.description_id);

    return {
      ...cm,
      description
    }
  });

  return result;
}

const data = {
  models: getModels(),
  commonRules: getCommonRules()
};


fs.writeFileSync(path.join(__dirname, '_data.json'), JSON.stringify(data, null, 2))