import pick from 'lodash.pick';

import backends from './modules/electron/backends';
import userrule from './modules/electron/userrule';

import createPersistedState from './persisted-state';

function whitelistNamespaces(namespaces) {
  namespaces = Array.isArray(namespaces) ? namespaces : [namespaces];

  return mutation => namespaces.some(namespace => mutation.type.startsWith(namespace));
}

export const modules = {
  backends,
  userrule,
};

export const plugins = [
  createPersistedState({
    selectState: state => pick(state, ['backends', 'userrule']),
    whitelist: whitelistNamespaces(['backends', 'userrule']),
    storageName: 'mmb-electron-vuex',
    mergeOptions: {
      arrayMerge: (dest, src) => src,
    },
  }),
];
