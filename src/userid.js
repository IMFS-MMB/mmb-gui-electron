import storage from './storage';

const USERID_KEY = 'user-id';

if (!storage.has(USERID_KEY)) {
  storage.set(USERID_KEY, Math.ceil(10e15 * Math.random()).toString(16));
}

export default storage.get(USERID_KEY);
