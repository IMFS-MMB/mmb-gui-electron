import { readFileSync } from 'fs-extra';
import { join } from 'path';

export default function getDynareVersion(rootPath) {
  const versionPath = join(rootPath, 'matlab', 'dynare_version.m');
  const versionPattern = /v = '(\d+\.\d+\.\d+)';/;

  try {
    const contents = readFileSync(versionPath, { encoding: 'utf8' });

    return contents.match(versionPattern)[1] || null;
  } catch (e) {
    return null;
  }
}
