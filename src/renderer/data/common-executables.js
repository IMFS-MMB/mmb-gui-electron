import { platform } from 'os';

/**
 * A collection of paths and patterns the application crawls to find executables.
 * You can use glob patterns here. Docs: https://github.com/isaacs/node-glob#readme
 * Be careful with too broad patterns. Scanning can take a long time.
 */

const commonExecutables = {
  linux: [

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
  all: [
    {
      type: 'octave',
      path: 'octave',
    },
    {
      type: 'matlab',
      path: 'matlab',
    },
  ],
};

export default [
  ...commonExecutables.all,
  ...commonExecutables[platform()],
];
