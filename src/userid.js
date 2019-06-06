import storage from './storage';

const USERID_KEY = 'user-id';

// eslint-disable-next-line import/no-mutable-exports
let userId = storage.get(USERID_KEY);

if (!userId) {
  userId = Math.ceil(10e15 * Math.random())
    .toString(16);
  storage.set(USERID_KEY, userId);
}

export default userId;
