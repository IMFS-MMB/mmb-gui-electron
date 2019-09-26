import path from 'path';

// eslint-disable-next-line import/no-extraneous-dependencies
import { remote } from 'electron';
import { copy } from 'fs-extra';
import { staticMmbFolder } from '../../../../config/paths';
import isEmptyFolder from '../../../../common/util/is-empty-folder';

const namespaced = true;

const state = {
  mmbFolder: staticMmbFolder,
};

const getters = {
  mmbFolder(state) {
    return path.resolve(state.mmbFolder);
  },
  modelsFolder(state) {
    return path.resolve(state.mmbFolder, 'models');
  },
  rulesFolder(state) {
    return path.resolve(state.mmbFolder, 'rules');
  },
};

const mutations = {
  setMmbFolder(state, path) {
    state.mmbFolder = path;
  },
};

const actions = {
  async useBuiltinMmbFolder(ctx) {
    ctx.commit('setMmbFolder', staticMmbFolder);
  },
  async setMmbFolder(ctx) {
    const options = {
      filters: [],
      title: 'Select folder containing MMB files',
      properties: ['openDirectory'],
      message: 'Please select a folder containing MMB 3.1 compatible files',
    };

    const [destination] = remote.dialog.showOpenDialog(options);

    ctx.commit('setMmbFolder', destination);
  },
  async extractMmbFolder(ctx) {
    const options = {
      filters: [],
      title: 'Select destination folder',
      properties: ['openDirectory'],
      message: 'Please select an empty folder MMB files will be copied to',
    };

    const [destination] = remote.dialog.showOpenDialog(options);

    if (!destination) {
      return;
    }

    if (!await isEmptyFolder(destination)) {
      window.vue.$bvToast.toast('The path you selected is not an empty folder. You need to select an empty folder to extract MMB\'s files.', {
        title: 'Not an empty folder!',
        variant: 'danger',
      });

      return;
    }

    try {
      await copy(staticMmbFolder, destination);
      ctx.commit('setMmbFolder', destination);
    } catch (e) {
      throw e;
    }
  },
};

export default {
  namespaced,
  state,
  getters,
  mutations,
  actions,
};
