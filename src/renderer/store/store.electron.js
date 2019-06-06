import pick from 'lodash.pick';

import backends from './modules/electron/backends';
import dynare from './modules/electron/dynare';
import userrule from './modules/electron/userrule';
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
};

export const plugins = [
  createPersistedState({
    storage: store,
    selectState: (state) => {
      const result = pick(state, ['backends', 'userrule', 'dynare']);

      if (result && result.backends) {
        result.backends.scanning = false;
      }

      return result;
    },
    whitelist: whitelistNamespaces(['backends', 'userrule', 'dynare']),
    mergeOptions: {
      arrayMerge: (dest, src) => src,
    },
  }),
];
