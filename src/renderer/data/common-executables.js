import { platform } from 'os';

const commonExecutables = {
  linux: [

  ],
  darwin: [

  ],
  win32: [

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
