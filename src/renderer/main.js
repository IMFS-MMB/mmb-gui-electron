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

if (!process.env.IS_WEB) Vue.use(require('vue-electron'));
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
