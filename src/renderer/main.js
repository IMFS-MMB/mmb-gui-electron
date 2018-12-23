import { remote }  from 'electron'; // eslint-disable-line

import Vue from 'vue';
import axios from 'axios';

import App from './App';
import router from './router';
import store from './store';

import './global.scss';
import './plugins/bootstrap';
import './plugins/highcharts';
import './plugins/chatscroll';
import constants from '../constants';

if (process.env.IS_WEB) {
  const Sentry = require('@sentry/browser');

  Sentry.init({
    dsn: constants.sentry.dsnWeb,
    integrations: [Sentry.Integrations.Vue({ Vue })],
  });
} else {
  const Sentry = require('@sentry/electron');

  Sentry.init({
    dsn: constants.sentry.dsnElectron,
  });

  Vue.use(require('vue-electron'));
}

Vue.http = Vue.prototype.$http = axios;
Vue.config.productionTip = false;

/* eslint-disable no-new */
const vue = new Vue({
  components: { App },
  router,
  store,
  template: '<App/>',
}).$mount('#app');

window.vue = vue;

window.addEventListener('beforeunload', () => {
  remote.globalShortcut.unregisterAll();
});
