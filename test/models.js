// eslint-disable-next-line no-unused-vars
/* global describe, it, before */

import { assert } from 'chai';
import models from './utils/models';
import getBackend from './utils/backend';
import { MODEL_RULE } from '../src/config/constants';
import getTestScript from './utils/matlab-code';

import { schemasFolder } from '../src/config/paths';
import ajv from '../src/worker/util/ajv';
// const ajv = loadAjvWithSchemas(schemasFolder);

async function runSimulation(backend, models = [], rules = [], output = [], shocks = []) {
  const code = getTestScript(models, rules, output, shocks);

  let out = '';

  try {
    await backend.runCode(
      code,
      // eslint-disable-next-line no-return-assign
      o => out += o.toString(),
      // eslint-disable-next-line no-return-assign
      o => out += o.toString(),
    );
  } catch (e) {
    console.warn(out);
    throw e;
  }
}

const tests = [
  {
    caption: 'runs with model-specific rule',
    condition: model => model.capabilities.model_specific_rule,
    run: async (model, backend) => runSimulation(backend, [model.id], [MODEL_RULE], [], []),
  },
  {
    caption: 'runs with fiscal shock',
    condition: model => model.capabilities.fiscal_shock,
    run: async (model, backend) => runSimulation(backend, [model.id], [MODEL_RULE], [], []),
  },
  {
    caption: 'runs with monetary policy shock',
    condition: model => model.capabilities.mp_shock,
    run: async (model, backend) => runSimulation(backend, [model.id], [MODEL_RULE], [], []),
  },
];

function modelTests(model, backend) {
  if (!backend) {
    return;
  }

  tests.forEach((test) => {
    if (test.condition(model)) {
      it(test.caption, () => test.run(model, backend));
    }
  });
}

describe('Models', () => {
  const octave = getBackend('octave');
  const matlab = getBackend('matlab');

  models.forEach((model) => {
    describe(`${model.name}`, () => {
      it('.json passes validation', () => {
        assert.equal(ajv.validate('model', model), true, ajv.errorsText(ajv.errors));
      });

      describe('Octave', () => modelTests(model, octave));
      describe('Matlab', () => modelTests(model, matlab));
    });
  });
});
