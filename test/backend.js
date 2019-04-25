// eslint-disable-next-line no-unused-vars
/* global describe, it, before, beforeEach, after, chai */

import { assert } from 'chai';

import { create } from '../src/renderer/utils/electron/interface';


describe('Matlab/Octave', () => {
  const {
    OCTAVE_PATH,
    MATLAB_PATH,
  } = process.env;

  let backend;

  function commonTests() {
    it('can launch and detect version', async () => {
      const pattern = /\d+\.\d+\.\d+/;
      const version = await backend.getVersion();

      assert.match(version, pattern);
    });
  }

  if (OCTAVE_PATH) {
    describe('Octave', () => {
      before(() => {
        backend = create({
          type: 'octave',
          path: OCTAVE_PATH,
        });
      });

      commonTests();
    });
  }

  if (MATLAB_PATH) {
    describe('Matlab', () => {
      before(() => {
        backend = create({
          type: 'matlab',
          path: MATLAB_PATH,
        });
      });

      commonTests();
    });
  }
});
