import pick from 'lodash.pick';

import backends from './modules/electron/backends';
import dynare from './modules/electron/dynare';
import userrule from './modules/electron/userrule';

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
    selectState: (state) => {
      const result = pick(state, ['backends', 'userrule', 'dynare']);

      if (result && result.backends) {
        result.backends.scanning = false;
      }

      return result;
    },
    whitelist: whitelistNamespaces(['backends', 'userrule', 'dynare']),
    storageName: 'mmb-electron-vuex',
    mergeOptions: {
      arrayMerge: (dest, src) => src,
    },
  }),
];
