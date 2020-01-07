import Vue from 'vue';
import axios from 'axios';

import App from './App';
import store from './store';

import { sentry } from '../config/constants';

import './global.scss';
import './plugins/bootstrap';
import './plugins/highcharts';
import './plugins/chatscroll';
import resizeEvents from './utils/resize';

if (process.env.IS_WEB) {
  const Sentry = require('@sentry/browser');

  Sentry.init({
    dsn: sentry.dsnWeb,
    integrations: [new Sentry.Integrations.Vue({ Vue })],
  });
} else {
  const Sentry = require('@sentry/electron');
  const id = require('./utils/userid').default;

  Sentry.init({
    dsn: sentry.dsnElectron,
  });

  Sentry.configureScope((scope) => {
    scope.setUser({
      id,
    });
  });
}


if (!process.env.IS_WEB) {
  Vue.use(require('vue-electron'));
}

Vue.http = Vue.prototype.$http = axios;

Vue.prototype.$isWeb = !!process.env.IS_WEB;
Vue.prototype.$isElectron = !process.env.IS_WEB;

Vue.config.productionTip = false;

/* eslint-disable no-new */
const vue = new Vue({
  components: { App },
  store,
  template: '<App/>',
}).$mount('#app');

resizeEvents(vue);

window.vue = vue;
