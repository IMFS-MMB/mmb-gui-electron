// eslint-disable-next-line no-unused-vars
/* global describe, it, before, beforeEach, after, chai */

import { assert } from 'chai';

import { create } from '../src/renderer/utils/electron/interface';


describe('Matlab/Octave', () => {
  const {
    OCTAVE_PATH,
    MATLAB_PATH,
  } = process.env;

  function setup(name, path) {
    describe(name, () => {
      let octave;

      before(() => {
        octave = create({
          type: 'octave',
          path,
        });
      });

      it('can launch and detect version', async () => {
        const pattern = /\d+\.\d+\.\d+/;
        const version = await octave.getVersion();

        assert.match(version, pattern);
      });
    });
  }

  if (OCTAVE_PATH) {
    setup('Octave', OCTAVE_PATH);
  }

  if (MATLAB_PATH) {
    setup('Matlab', MATLAB_PATH);
  }
});
