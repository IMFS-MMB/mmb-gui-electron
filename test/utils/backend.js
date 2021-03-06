import { create } from '../../src/common/backend/interface';
import { mmbFolder } from '../../src/config/paths';

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
