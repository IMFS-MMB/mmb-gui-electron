/* eslint-disable import/no-dynamic-require */

import path from 'path';
import { platform } from 'os';

const staticFolder = path.join(__dirname, '..', 'static');

export const mmbFolder = path.join(staticFolder, 'mmci-cli');

export const modelsFolder = path.join(mmbFolder, 'models');
export const rulesFolder = path.join(mmbFolder, 'rules');
export const schemasFolder = path.join(mmbFolder, 'schemas');

/**
 * A collection of paths and patterns the application crawls to find dynare.
 * You can use glob patterns here. Docs: https://github.com/isaacs/node-glob#readme
 * Be careful with too broad patterns. Scanning can take a long time.
 */
export const dynare = {
  linux: [
    '/usr/lib/dynare',
  ],
  darwin: [
    // darwin is macOS

  ],
  win32: [
    // Use forward slashes. '/' is mapped to 'C:\'

  ],
}[platform()];
