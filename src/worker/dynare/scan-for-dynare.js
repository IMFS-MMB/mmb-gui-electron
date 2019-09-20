import { dynare } from '../../config/paths';
import getDynareVersion from './get-dynare-version';
import findPaths from '../util/find-paths';

export default async function scanForDynare() {
  const result = [];

  // eslint-disable-next-line no-restricted-syntax
  for (const pattern of dynare) {
    // eslint-disable-next-line no-await-in-loop
    const paths = await findPaths(pattern);

    paths.forEach((path) => {
      const dynare = {
        path,
        version: getDynareVersion(path),
      };

      result.push(dynare);
    });
  }

  return result;
}
