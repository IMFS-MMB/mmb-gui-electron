// eslint-disable-next-line no-unused-vars
/* global describe, it, before */

import fs from 'fs-extra';

import { assert } from 'chai';
import { models, getModFile } from './utils/models';
import getBackend from './utils/backend';
import { MODEL_RULE } from '../src/config/constants';
import getTestScript from './utils/matlab-code';

import { schemasFolder } from '../src/config/paths';
import ajv from '../src/worker/util/ajv';
import { makeModelScaffoldJson } from '../src/renderer/utils/createModelScaffold';

function assertCorrectModelJson(json) {
  assert.equal(ajv.validate('model', json), true, ajv.errorsText(ajv.errors));
}

const tests = [
  {
    title: `Doesn't use 'cd' to get current path`,
    pattern: /=\scd\s*;?\s*$/m,
    message: `Do not use 'cd' to get the current path. Use 'pwd' which works consistently across Matlab and Octave`
  }
];

function modFileTests(model) {
  let mod;

  it('.mod exists', () => {
    mod = getModFile(model.name);
  });

  tests.forEach(test => {
    it(test.title, () => {
      const result = !!mod.match(test.pattern);
      debugger;
      assert.isFalse(result, test.message);
    });
  });
}

describe('Models', () => {
  models.forEach((model) => {
    describe(`${model.name}`, () => {
      it('.json passes validation', () => {
        assertCorrectModelJson(model);
      });

      modFileTests(model);
    });
  });
});

describe('Model scaffold', () => {
  const json = makeModelScaffoldJson('XX_TEST');

  it('.json passes validation', () => {
    const model = JSON.parse(json);
    assertCorrectModelJson(model);
  });
});
