import pick from 'lodash.pick';
import fs from 'fs-extra';

import backends from './modules/backends';
import dynare from './modules/dynare';
import userrule from './modules/userrule';
import settings from './modules/settings';
import store from '../utils/storage';
import createPersistedState from './persisted-state';

// Only add more functions to this array! Do not alter existing ones!
const migrations = [
  () => ({}),
];

function removeNonExistentMmbPath(state) {
  // eslint-disable-next-line max-len
  if (state && state.settings && state.settings.mmbFolder && !fs.existsSync(state.settings.mmbFolder)) {
    delete state.settings.mmbFolder;
  }
}

function selectState(state, initialLoad) {
  const versionField = '__version';
  const currentVersion = migrations.length - 1;
  let newState = state;

  if (initialLoad) {
    if (!state) {
      newState = {};
    } else {
      const stateVersion = typeof state[versionField] !== 'undefined' ? state[versionField] : -1;
      for (let i = stateVersion, l = migrations.length; i < l; i += 1) {
        if (stateVersion < i) {
          try {
            // eslint-disable-next-line no-console
            console.info(`Migrating to ${i}`);
            newState = migrations[i](newState);
          } catch (e) {
            // eslint-disable-next-line no-console
            console.warn(`There was an error migrating the persisted state to a new version: ${e}, resetting to defaults.`);
            newState = {};
            break;
          }
        }
      }

      removeNonExistentMmbPath(state);
    }
  }

  return {
    [versionField]: currentVersion,
    ...pick(newState, ['backends', 'userrule', 'dynare', 'settings']),
  };
}

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
    selectState,
    whitelist: whitelistNamespaces(['backends', 'userrule', 'dynare', 'settings']),
    mergeOptions: {
      arrayMerge: (dest, src) => src,
    },
  }),
];
