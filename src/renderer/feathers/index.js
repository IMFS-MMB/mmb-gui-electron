const isElectron = true; // todo: detect environment

let feathers; // eslint-disable-line

if (isElectron) {
  feathers = require('./electron').default();
} else {
  feathers = require('./browser').default();
}

window.app = feathers;

export default feathers;
