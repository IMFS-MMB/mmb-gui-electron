import { isElectron } from '../../../../config/constants';

function getCompare() {
  const { default: compare } = isElectron ? require('./electron/compare.electron') : require('./web/compare.web');

  return compare;
}

export default getCompare();
