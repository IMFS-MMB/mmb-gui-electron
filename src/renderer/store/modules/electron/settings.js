import path from 'path';
import { mmbFolder } from '../../../../config/paths';

const namespaced = true;

const state = {
  mmbFolder,
};

const getters = {
  modelsFolder(state) {
    return path.resolve(state.mmbFolder, 'models');
  },
  rulesFolder(state) {
    return path.resolve(state.mmbFolder, 'rules');
  },
};

const mutations = {
  set(state, text) {
    state.text = text;
  },
};

const actions = {};

export default {
  namespaced,
  state,
  getters,
  mutations,
  actions,
};
