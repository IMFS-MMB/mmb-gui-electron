// eslint-disable-next-line no-unused-vars
/* global describe, it, before */

import { assert } from 'chai';
import rules from './utils/rules';

import { schemasFolder } from '../src/config/paths';
import loadAjvWithSchemas from '../src/worker/util/ajv';
const ajv = loadAjvWithSchemas(schemasFolder);

function ruleTests(rule) {
  describe(`${rule.name}`, () => {
    it('.json passes validation', () => {
      assert.equal(ajv.validate('rule', rule), true, ajv.errorsText(ajv.errors));
    });
  });
}

describe('Common Rules', () => {
  rules.forEach(rule => ruleTests(rule));
});
