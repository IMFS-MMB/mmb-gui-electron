/* global describe, it, before */

import { assert } from 'chai';
import ajv from './utils/ajv';
import rules from './utils/rules';

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
