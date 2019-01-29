import Vue from 'vue';
import axios from 'axios';

import App from './App';
import router from './router';
import store from './store';

import { isElectron, isProduction, isWeb, sentry } from '../constants';

import './global.scss';
import './plugins/bootstrap';
import './plugins/highcharts';
import './plugins/chatscroll';

if (isWeb) {
  if (isProduction) {
    const Sentry = require('@sentry/browser');

    Sentry.init({
      dsn: sentry.dsnWeb,
      integrations: [new Sentry.Integrations.Vue({ Vue })],
    });
  }
} else {
  const Sentry = require('@sentry/electron');

  Sentry.init({
    dsn: sentry.dsnElectron,
  });

  Vue.use(require('vue-electron'));
}

Vue.http = Vue.prototype.$http = axios;

Vue.prototype.$isWeb = isWeb;
Vue.prototype.$isElectron = isElectron;

Vue.config.productionTip = false;

/* eslint-disable no-new */
const vue = new Vue({
  components: { App },
  router,
  store,
  template: '<App/>',
}).$mount('#app');

window.vue = vue;
