// adopted from https://github.com/vue-electron/vuex-electron/blob/master/src/persisted-state.js

import merge from 'deepmerge';
import Store from 'electron-store';

const STORAGE_NAME = 'vuex';
const STORAGE_KEY = 'state';
const STORAGE_TEST_KEY = 'test';

function filterInArray(list) {
  return mutation => list.includes(mutation.type);
}

function loadFilter(filter, name) {
  if (!filter) {
    return null;
  } else if (filter instanceof Array) {
    return filterInArray(filter);
  } else if (typeof filter === 'function') {
    return filter;
  }

  throw new Error(`[Vuex Electron] Filter "${name}" should be Array or Function. Please, read the docs.`);
}

class PersistedState {
  constructor(options, store) {
    this.options = options;
    this.store = store;
  }

  loadOptions() {
    if (!this.options.storage) this.options.storage = this.createStorage();
    if (!this.options.storageKey) this.options.storageKey = STORAGE_KEY;
    if (!this.options.selectState) this.options.selectState = state => state;

    this.whitelist = loadFilter(this.options.whitelist, 'whitelist');
    this.blacklist = loadFilter(this.options.blacklist, 'blacklist');
  }

  createStorage() {
    return new Store({ name: this.options.storageName || STORAGE_NAME });
  }

  getState() {
    return this.options.storage.get(this.options.storageKey);
  }

  setState(state) {
    const selectedState = this.options.selectState(state);

    this.options.storage.set(this.options.storageKey, selectedState);
  }

  checkStorage() {
    try {
      this.options.storage.set(STORAGE_TEST_KEY, STORAGE_TEST_KEY);
      this.options.storage.get(STORAGE_TEST_KEY);
      this.options.storage.delete(STORAGE_TEST_KEY);
    } catch (error) {
      throw new Error('[Vuex Electron] Storage is not valid. Please, read the docs.');
    }
  }

  loadInitialState() {
    const state = this.getState(this.options.storage, this.options.storageKey);

    if (state) {
      const selectedState = this.options.selectState(state, true);
      const mergedState = merge(this.store.state, selectedState, this.options.mergeOptions);
      this.store.replaceState(mergedState);
    }
  }

  subscribeOnChanges() {
    this.store.subscribe((mutation, state) => {
      if (this.blacklist && this.blacklist(mutation)) return;
      if (this.whitelist && !this.whitelist(mutation)) return;

      this.setState(state);
    });
  }
}

export default (options = {}) => (store) => {
  const persistedState = new PersistedState(options, store);

  persistedState.loadOptions();
  persistedState.checkStorage();
  persistedState.loadInitialState();
  persistedState.subscribeOnChanges();
};
