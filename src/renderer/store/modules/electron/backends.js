import { remote } from 'electron'; // eslint-disable-line
import { getExecutableInfo, findExecutables } from '@/utils/electron/find-executables';

const { dialog } = remote;

const namespaced = true;

const state = {
  executables: [],
  selectedIndex: null,
  scanning: false,
};

const getters = {
  executables(state) {
    return state.executables;
  },
  selectedIndex(state) {
    return state.selectedIndex;
  },
  selectedExecutable(state) {
    return state.executables[state.selectedIndex];
  },
  scanning(state) {
    return state.scanning;
  },
};

const mutations = {
  add(state, info) {
    if (state.executables.some(executable => executable.path === info.path)) {
      return;
    }

    state.executables.push(info);

    if (state.selectedIndex === null) {
      state.selectedIndex = 0;
    }
  },
  remove(state, info) {
    state.executable = state.executables.filter(executable => executable.path !== info.path);
  },
  removeAll(state) {
    state.executables = [];
    state.selectedIndex = null;
  },
  select(state, path) {
    state.selectedIndex = path;
  },
  setScanning(state, bool) {
    state.scanning = bool;
  },
};

const actions = {
  async scan({ commit }) {
    commit('setScanning', true);

    const infos = await findExecutables();

    infos.forEach((info) => {
      commit('add', info);
    });

    commit('setScanning', false);
  },
  find({ commit, state }) {
    let type;

    dialog.showMessageBox({
      type: 'question',
      message: 'Do you want to add Matlab or Octave to the list of executables?',
      buttons: ['Cancel', 'Matlab', 'Octave'],
    }, (result) => {
      const filters = {};

      switch (result) {
        case 0:
          return;
        case 1:
          type = 'matlab';
          break;
        case 2:
          type = 'octave';

          filters.name = process.platform === 'win32' ? 'octave-cli.exe' : 'octave';
          break;
        default:
          throw new Error('invalid selection');
      }

      const options = {
        filters,
        properties: ['openFile'],
        message: `Please select the ${type} executable`,
      };

      dialog.showOpenDialog(options, (async (filePaths) => {
        if (!filePaths) {
          return;
        }

        const path = filePaths[0];

        const info = await getExecutableInfo({
          path,
          type,
        });

        if (!info.isExecutable) {
          dialog.showErrorBox(
            'Not an executable',
            `The file you provided (${info.path}) is not an executable or you lack execution permissions. Please select an executable file.`,
          );

          return;
        }

        commit('add', info);

        const index = state.executables.indexOf(info);
        commit('select', index);
      }));
    });
  },
};

export default {
  namespaced,
  state,
  getters,
  mutations,
  actions,
};
