import pick from 'lodash.pick';

import backends from './modules/electron/backends';
import dynare from './modules/electron/dynare';
import userrule from './modules/electron/userrule';
import settings from './modules/electron/settings';
import store from '../../storage';
import createPersistedState from './persisted-state';

function whitelistNamespaces(namespaces) {
  namespaces = Array.isArray(namespaces) ? namespaces : [namespaces];

  return mutation => namespaces.some(namespace => mutation.type.startsWith(namespace));
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
    selectState: state => pick(state, ['backends', 'userrule', 'dynare', 'settings']),
    whitelist: whitelistNamespaces(['backends', 'userrule', 'dynare', 'settings']),
    mergeOptions: {
      arrayMerge: (dest, src) => src,
    },
  }),
];
