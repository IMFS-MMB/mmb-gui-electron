import { remote } from 'electron'; // eslint-disable-line
import { promisify } from 'util';
import _glob from 'glob';
import getDynareVersion from '@/utils/electron/get-dynare-version';
import path from 'path';
import { dynare } from '../../../../../config/paths';

const glob = promisify(_glob);

const { dialog } = remote;

const namespaced = true;

const state = {
  dynares: [],
  selectedIndex: null,
  scanning: false,
};

const getters = {
  dynares(state) {
    return state.dynares;
  },
  selectedIndex(state) {
    return state.selectedIndex;
  },
  selected(state) {
    return state.dynares[state.selectedIndex];
  },
  scanning(state) {
    return state.scanning;
  },
};

const mutations = {
  add(state, dynares) {
    dynares = Array.isArray(dynares) ? dynares : [dynares];

    // eslint-disable-next-line no-return-assign
    dynares.forEach(dynare => dynare.path = path.normalize(dynare.path));

    const filtered = dynares
      .filter(newDynare => !state.dynares.some(dynare => dynare.path === newDynare.path));

    state.dynares.push(...filtered);

    if (state.selectedIndex === null) {
      state.selectedIndex = 0;
    }
  },
  remove(state, dynareToRemove) {
    state.dynares = state.dynares.filter(dynare => dynare.path !== dynareToRemove.path);

    if (state.dynares.length === 0) {
      state.selectedIndex = null;
    } else if (state.selectedIndex > state.dynares.length - 1) {
      state.selectedIndex = state.dynares.length - 1;
    }
  },
  removeAll(state) {
    state.dynares = [];
    state.selectedIndex = null;
  },
  select(state, index) {
    state.selectedIndex = index;
  },
  setScanning(state, bool) {
    state.scanning = bool;
  },
};

const actions = {
  async removeSelected({ commit, getters }) {
    commit('remove', getters.selected);
  },
  async scan({ commit }) {
    commit('setScanning', true);

    try {
      // eslint-disable-next-line no-restricted-syntax
      for (const pattern of dynare) {
        // eslint-disable-next-line no-await-in-loop
        const dynares = await glob(pattern, {
          absolute: true,
          cwd: '/',
          silent: true,
          strict: false,
        });

        dynares.forEach(dynare => commit('add', {
          path: dynare,
          version: getDynareVersion(dynare),
        }));
      }
    } catch (e) {
      console.warn(e);
    } finally {
      commit('setScanning', false);
    }
  },
  find({ commit, state }) {
    const options = {
      filters: [],
      title: 'Select dynare folder',
      properties: ['openDirectory'],
      message: 'Please select the root folder of the dynare installation you want to use.',
    };

    dialog.showOpenDialog(options, (async (filePaths) => {
      if (!filePaths) {
        return;
      }

      const path = filePaths[0];

      commit('add', {
        path,
        version: getDynareVersion(path),
      });
      commit('select', state.dynares.indexOf(path));
    }));
  },
};

export default {
  namespaced,
  state,
  getters,
  mutations,
  actions,
};
