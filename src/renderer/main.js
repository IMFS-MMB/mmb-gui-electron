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

console.warn('TODO: Sentry is still connecting via plain HTTP! Set up HTTPS for production!');
// TODO: Sentry is still connecting via plain HTTP! Set up HTTPS for production!

if (process.env.IS_WEB) {
  const Sentry = require('@sentry/browser');

  Sentry.init({
    dsn: 'http://69d6aff76a234100a714aa1507b79985@www.macromodelbase.com:9000/3',
    integrations: [Sentry.Integrations.Vue({ Vue })],
  });
} else {
  const Sentry = require('@sentry/electron');

  Sentry.init({
    dsn: 'http://b0fda030c61748cd95cc5f27e4a07a15@www.macromodelbase.com:9000/2',
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

// todo: remove for production
remote.globalShortcut.register('CommandOrControl+Shift+K', () => {
  remote.BrowserWindow.getFocusedWindow().webContents.openDevTools();
});

window.addEventListener('beforeunload', () => {
  remote.globalShortcut.unregisterAll();
});
