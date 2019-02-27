const Client = require('ssh2-sftp-client');
const sftp = new Client();
const path = require('path');
const glob = require('glob');

glob("build/mmb-electron*", {}, function (err, files) {
  sftp.connect({
    host: 'macromodelbase.com',
    port: '2222',
    username: 'deploy',
    password: process.env.SFTP_PASSWORD
  }).then(() => {
    const promises = files.map(file => sftp.put(path.join(process.cwd(), file), `data/mmb-electron-latest/${file}`));

    return Promise.all(promises);
  });
});

