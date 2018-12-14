import { platform } from 'os';

// You can use glob patterns here. Docs: https://github.com/isaacs/node-glob#readme
// Be careful with too broad patterns. Scanning can take a long time.
const commonExecutables = {
  linux: [

  ],
  // darwin is macOS
  darwin: [

  ],
  win32: [
    {
      type: 'octave',
      pattern: '/octave/**/octave-cli.exe',
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
