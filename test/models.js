// eslint-disable-next-line no-unused-vars
/* global describe, it, before */

import { assert } from 'chai';
import models from './utils/models';
import getBackend from './utils/backend';
import { MODEL_RULE } from '../src/config/constants';
import getTestScript from './utils/matlab-code';

import { schemasFolder } from '../src/config/paths';
import ajv from '../src/worker/util/ajv';
import { makeModelScaffoldJson } from '../src/renderer/utils/createModelScaffold';

function assertCorrectModelJson(json) {
  assert.equal(ajv.validate('model', json), true, ajv.errorsText(ajv.errors));
}

describe('Models', () => {
  models.forEach((model) => {
    describe(`${model.name}`, () => {
      it('.json passes validation', () => {
        assertCorrectModelJson(model);
      });
    });
  });
});

describe('Model scaffold', () => {
  const json = makeModelScaffoldJson('XX_TEST');

  it('.json passes validation', () => {
    const model = JSON.parse(json);
    assertCorrectModelJson(model);
  })
})
