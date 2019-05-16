import { remote } from 'electron'; // eslint-disable-line
import { promisify } from 'util';
import _glob from 'glob';
import { dynare } from '../../../../../config/paths';

const glob = promisify(_glob);

const { dialog } = remote;

const namespaced = true;

const state = {
  paths: [],
  selectedIndex: null,
  scanning: false,
};

const getters = {
  paths(state) {
    return state.paths;
  },
  selectedIndex(state) {
    return state.selectedIndex;
  },
  selected(state) {
    return state.paths[state.selectedIndex];
  },
  scanning(state) {
    return state.scanning;
  },
};

const mutations = {
  add(state, paths) {
    paths = Array.isArray(paths) ? paths : [paths];

    const filtered = paths.filter(p => !state.paths.includes(p));

    state.paths.push(...filtered);

    if (state.selectedIndex === null) {
      state.selectedIndex = 0;
    }
  },
  remove(state, pathToRemove) {
    state.paths = state.paths.filter(path => path !== pathToRemove);

    if (state.paths.length === 0) {
      state.selectedIndex = null;
    } else if (state.selectedIndex > state.paths.length - 1) {
      state.selectedIndex = state.paths.length - 1;
    }
  },
  removeAll(state) {
    state.paths = [];
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
        const result = await glob(pattern, {
          absolute: true,
          cwd: '/',
          silent: true,
          strict: false,
        });

        commit('add', result);
      }
    } catch (e) {
      console.warn(e);
    } finally {
      commit('setScanning', false);
    }
  },
  find({ commit, state }) {
    const options = {
      filters: [
        {
          name: '.m files',
          extensions: ['dynare.m'],
        },
      ],
      title: 'Select dynare folder',
      properties: ['openDirectory'],
      message: 'Please select the root folder of the dynare installation you want to use.',
    };

    dialog.showOpenDialog(options, (async (filePaths) => {
      if (!filePaths) {
        return;
      }

      const path = filePaths[0];

      commit('add', path);
      commit('select', state.paths.indexOf(path));
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
