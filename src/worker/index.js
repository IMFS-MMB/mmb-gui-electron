// import * as comlink from 'comlink';

// There was a painful debugging session when worker-loader interfered with
// monaco-editor-webpack-plugin, so we use the slightly sketchy loader syntax here.
// eslint-disable-next-line import/no-webpack-loader-syntax
// import Worker from 'worker-loader!./worker.js';

// const worker = comlink.wrap(new Worker());

// export default worker;

const worker = process.env.IS_WEB ? {} : require('./worker').default;

export default worker;
