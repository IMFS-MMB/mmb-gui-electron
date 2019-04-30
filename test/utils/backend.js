import { create } from '../../src/renderer/utils/electron/interface';
import { mmbFolder } from '../../config/paths';

export default function getBackend(type = 'octave') {
  if (type === 'octave' && process.env.OCTAVE_PATH) {
    return create({
      type: 'octave',
      path: process.env.OCTAVE_PATH,
      cwd: mmbFolder,
    });
  } else if (type === 'matlab' && process.env.MATLAB_PATH) {
    return create({
      type: 'matlab',
      path: process.env.MATLAB_PATH,
      cwd: mmbFolder,
    });
  }
  return null;
}
