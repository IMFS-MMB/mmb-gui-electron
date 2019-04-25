// eslint-disable-next-line no-unused-vars
/* global describe, it, before, beforeEach, after, chai */

import { assert } from 'chai';

import { create } from '../src/renderer/utils/electron/interface';

describe('Matlab/Octave', () => {
  describe('Octave', () => {
    let octave;

    before(() => {
      octave = create({
        type: 'octave',
        path: '/usr/bin/octave',
      });
    });

    it('can launch and detect version', async () => {
      const pattern = /\d+\.\d+\.\d+/;
      const version = await octave.getVersion();
      assert.match(version, pattern);
    });
  });
});
