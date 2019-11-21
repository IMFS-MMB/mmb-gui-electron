import pick from 'lodash.pick';

import backends from './modules/backends';
import dynare from './modules/dynare';
import userrule from './modules/userrule';
import settings from './modules/settings';
import store from '../utils/storage';
import createPersistedState from './persisted-state';

function whitelistNamespaces(namespaces) {
  namespaces = Array.isArray(namespaces) ? namespaces : [namespaces];

  return mutation => namespaces.some(namespace => mutation.type.startsWith(namespace));
}

function userrule9x4to1x33(old) {
  // for legacy reasons the user rule used to be a 9x4 matrix in matlab,
  // although other coefficient matrices were 1x33. The user rule is 1x33 now, too.

  const result = [];

  result.push(old[1][0]);
  result.push(old[2][0]);
  result.push(old[3][0]);
  result.push(old[4][0]);
  result.push(old[0][1]);
  result.push(old[1][1]);
  result.push(old[2][1]);
  result.push(old[3][1]);
  result.push(old[4][1]);
  result.push(old[5][1]);
  result.push(old[6][1]);
  result.push(old[7][1]);
  result.push(old[8][1]);
  result.push(old[0][2]);
  result.push(old[1][2]);
  result.push(old[2][2]);
  result.push(old[3][2]);
  result.push(old[4][2]);
  result.push(old[5][2]);
  result.push(old[6][2]);
  result.push(old[7][2]);
  result.push(old[8][2]);
  result.push(old[0][3]);
  result.push(old[1][3]);
  result.push(old[2][3]);
  result.push(old[3][3]);
  result.push(old[4][3]);
  result.push(old[5][3]);
  result.push(old[6][3]);
  result.push(old[7][3]);
  result.push(old[8][3]);
  result.push('1');
  result.push('0.25');

  return result;
}

function selectState(state) {
  const newState = pick(state, ['backends', 'userrule', 'dynare', 'settings']);

  if (newState.userrule.params.some(e => Array.isArray(e))) {
    newState.userrule.params = userrule9x4to1x33(newState.userrule.params);
  }

  return newState;
}

export const modules = {
  backends,
  userrule,
  dynare,
  settings,
};

export const plugins = [
  createPersistedState({
    storage: store,
    selectState,
    whitelist: whitelistNamespaces(['backends', 'userrule', 'dynare', 'settings']),
    mergeOptions: {
      arrayMerge: (dest, src) => src,
    },
  }),
];
