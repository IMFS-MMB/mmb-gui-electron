/* global describe, it, before */

import { assert } from 'chai';

import { ajv, models, validate } from './utils/models';
import getBackend from './utils/backend';
import { MODEL_RULE } from '../config/constants';
import getTestScript from './utils/matlab-code';

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
    describe(`${model.internal_name}`, () => {
      it('.json passes validation', () => {
        assert.equal(validate(model), true, ajv.errorsText(validate.errors));
      });

      describe('Octave', () => modelTests(model, octave));
      describe('Matlab', () => modelTests(model, matlab));
    });
  });
});
