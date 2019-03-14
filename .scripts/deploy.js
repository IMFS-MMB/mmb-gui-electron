const Client = require('ssh2-sftp-client');
const sftp = new Client();
const path = require('path');
const glob = require('glob');

const { isTagged, isPr, tag } = require('./_ci');
const { exitError, exitSuccess } = require('./_utils');

if(isPr) {
  exitSuccess('No deployment needed. Exiting.');
}

const { SFTP_PASSWORD } = process.env;

const LOCAL_BASE = path.join(__dirname, '..', 'build');
const REMOTE_BASE = `data/mmb-electron-gui`;

glob('mmb-electron*{tar.xz,dmg,mac.zip,exe}', {
  cwd: LOCAL_BASE
}, async function (err, files) {
  try {
    await sftp.connect({
      host: 'macromodelbase.com',
      port: '2222',
      username: 'deploy',
      password: SFTP_PASSWORD
    });

    const remoteFolder = `${REMOTE_BASE}/${isTagged ? tag : 'nightly'}`;

    if (!await sftp.exists(remoteFolder)) {
      await sftp.mkdir(remoteFolder, true);
    }

    for (const file of files) {
      const src = path.join(LOCAL_BASE, file);

      const dest = `${remoteFolder}/${file}`;

      console.log(`Uploading '${src}' to '${dest}'.`);

      await sftp.put(src, dest);
    }

    await sftp.end();

    exitSuccess();
  } catch (e) {
    exitError(e.message || e.toString());
  }
});
