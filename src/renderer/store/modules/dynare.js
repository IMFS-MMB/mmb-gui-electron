// eslint-disable-next-line import/no-extraneous-dependencies
import { remote } from 'electron';
import path from 'path';
import worker from '../../../worker';

const { dialog } = remote;

const namespaced = true;

const state = {
  dynares: [],
  selectedIndex: null,
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
};

const actions = {
  async removeSelected({ commit, getters }) {
    commit('remove', getters.selected);
  },
  async scan({ commit }) {
    try {
      const dynares = await worker.scanForDynare();

      commit('add', dynares);
    } catch (e) {
      // eslint-disable-next-line no-console
      console.warn(e);
    }
  },
  async find({ commit, state }) {
    const options = {
      filters: [],
      title: 'Select dynare folder',
      properties: ['openDirectory'],
      message: 'Please select the root folder of the dynare installation you want to use.',
    };

    const {
      canceled,
      filePaths,
    } = await dialog.showOpenDialog(options);

    if (canceled) {
      return;
    }

    const path = filePaths[0];

    const data = {
      path,
      version: await worker.getDynareVersion(path),
    };
    commit('add', data);
    commit('select', state.dynares.indexOf(data));
  },
};

export default {
  namespaced,
  state,
  getters,
  mutations,
  actions,
};
