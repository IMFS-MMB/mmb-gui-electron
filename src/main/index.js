import { app, BrowserWindow, shell } from 'electron'; // eslint-disable-line
import windowStateKeeper from 'electron-window-state';
import path from 'path';
import { sentry } from '../config/constants';
/**
 * Set `__static` path to static files in production
 * https://simulatedgreg.gitbooks.io/electron-vue/content/en/using-static-assets.html
 */
if (process.env.NODE_ENV !== 'development') {
  global.__static = require('path').join(__dirname, '/static').replace(/\\/g, '\\\\'); // eslint-disable-line
}

if (!process.env.IS_WEB) {
  const Sentry = require('@sentry/electron');

  Sentry.init({
    dsn: sentry.dsnElectron,
  });
}

let mainWindow;
const winURL = process.env.NODE_ENV === 'development'
  ? 'http://localhost:9080'
  : `file://${__dirname}/index.html`;

function createWindow() {
  const mainWindowState = windowStateKeeper({
    defaultWidth: 1000,
    defaultHeight: 800,
  });

  /**
   * Initial window options
   */
  mainWindow = new BrowserWindow({
    webPreferences: {
      enableRemoteModule: true,
      nodeIntegration: true,
      nodeIntegrationInWorker: true,
    },

    x: mainWindowState.x,
    y: mainWindowState.y,
    width: mainWindowState.width,
    height: mainWindowState.height,

    // electron-window-state docs say:
    // "Please do not set useContentSize to true at creating BrowserWindow instance
    // because it changes how to calculate window size."
    // useContentSize: true,

    backgroundColor: '#444444',
    icon: path.join(__static, 'logo.png'),
  });

  mainWindowState.manage(mainWindow);

  mainWindow.loadURL(winURL);

  // Open dev tools initially when in development mode
  if (process.env.NODE_ENV === 'development') {
    mainWindow.webContents.on('did-frame-finish-load', () => {
      mainWindow.webContents.openDevTools();
    });
  }

  mainWindow.on('closed', () => {
    mainWindow = null;
  });

  // open external links in browser
  mainWindow.webContents.on('new-window', (e, url) => {
    e.preventDefault();
    shell.openExternal(url);
  });
}

app.on('ready', createWindow);

app.on('window-all-closed', () => {
  if (process.platform !== 'darwin') {
    app.quit();
  }
});

app.on('activate', () => {
  if (mainWindow === null) {
    createWindow();
  }
});

/**
 * Auto Updater
 *
 * Uncomment the following code below and install `electron-updater` to
 * support auto updating. Code Signing with a valid certificate is required.
 * https://simulatedgreg.gitbooks.io/electron-vue/content/en/using-electron-builder.html#auto-updating
 */

/*
import { autoUpdater } from 'electron-updater'

autoUpdater.on('update-downloaded', () => {
  autoUpdater.quitAndInstall()
})

app.on('ready', () => {
  if (process.env.NODE_ENV === 'production') autoUpdater.checkForUpdates()
})
 */
