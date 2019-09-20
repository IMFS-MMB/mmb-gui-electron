import path from 'path';
import { platform, homedir } from 'os';

const staticFolder = path.resolve(__dirname, '..', '..', 'static');

export const mmbFolder = path.resolve(staticFolder, 'mmci-cli');
export const modelsFolder = path.resolve(mmbFolder, 'models');
export const rulesFolder = path.resolve(mmbFolder, 'rules');
export const schemasFolder = path.resolve(mmbFolder, 'schemas');

/**
 * A collection of paths and patterns the application crawls to find MATLAB and/or Octave.
 * You can use glob patterns here. Docs: https://github.com/isaacs/node-glob#readme
 * Be careful with too broad patterns. Scanning can take a long time.
 */
export const backends = {
  linux: [
    {
      type: 'matlab',
      path: `${homedir()}/MATLAB/**/bin/matlab`,
    },
    {
      type: 'octave',
      path: '/usr/bin/octave',
    },
  ],
  darwin: [
    // darwin is macOS
    {
      type: 'matlab',
      path: '/Applications/MATLAB_*.app/bin/matlab',
    },
    {
      type: 'octave',
      path: '/Applications/Octave*.app/bin/octave',
    },
  ],
  win32: [
    // Use forward slashes. '/' is mapped to 'C:\'
    {
      type: 'octave',
      path: '/Octave/**/octave-cli.exe', // e.g. c:\Octave\4.3.2\bin\octave-cli.exe
    },
    {
      type: 'matlab',
      path: '/Program Files/matlab/*/bin/matlab.exe',
    },
  ],
}[platform()];

/**
 * A collection of paths and patterns the application crawls to find dynare.
 * You can use glob patterns here. Docs: https://github.com/isaacs/node-glob#readme
 * Be careful with too broad patterns. Scanning can take a long time.
 */
export const dynare = {
  linux: [
    '/usr/lib/dynare',
    '/usr/local/lib/dynare',
  ],
  darwin: [
    // darwin is macOS

  ],
  win32: [
    // Use forward slashes. '/' is mapped to 'C:\'
    '/dynare/*',
  ],
}[platform()];

export const exampleMatlab = {
  darwin: '/Applications/MATLAB_R2019a.app/bin/matlab',
  linux: '/usr/local/bin/matlab',
  win32: 'C:\\Program Files\\MATLAB\\R2019a\\bin\\matlab.exe',
}[platform()];

export const exampleOctave = {
  darwin: '/Applications/Octave 4.4.1.app/bin/octave',
  linux: '/usr/bin/octave',
  win32: 'C:\\Octave\\4.5.6',
}[platform()];

export const exampleDynare = {
  darwin: '/usr/lib/dynare',
  linux: '/usr/lib/dynare',
  win32: 'C:\\dynare\\4.5.6',
}[platform()];
