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
      pattern: '/Applications/MATLAB_*.app/bin/matlab',
    },
  ],
  win32: [
    // Use forward slashes. '/' is mapped to 'C:\'
    {
      type: 'octave',
      pattern: '/Octave/**/octave-cli.exe', // e.g. c:\Octave\4.3.2\bin\octave-cli.exe
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
