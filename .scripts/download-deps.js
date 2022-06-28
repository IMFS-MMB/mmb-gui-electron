const axios = require('axios');
const hasha = require('hasha');
const path = require('path');
const fs = require('fs');

const buildFolder = path.join(process.cwd(), 'build');
const ALGORITHM = 'sha512';

const files = [
  {
    url: 'https://www.dynare.org/release/windows/dynare-5.1-win.exe',
    filename: 'dynare-installer.exe',
    [ALGORITHM]: 'c94f51a41050d0ffb205e92fd9e67d0647da8f8ede198d9c498ef39fbbc3d5578cd99327f53a9bb471930da5a63c7687b32c7022c962793b96ff6dd5fea04f6e',
  }, {
    url: 'https://ftp.gnu.org/gnu/octave/windows/octave-6.4.0-w64-installer.exe',
    filename: 'octave-installer.exe',
    [ALGORITHM]: '242fb064c50972914f4207fcf7c199191cb07447fe79b9cdbc93144d960d6281465c1256f345540e7c08a49a512ba8cf6069a5039637a04fef08ace7fe94cafe',
  },
];

async function downloadAndVerify(url, filepath, expectedHash) {
  console.log(`downloading ${url} to ${filepath}`);

  const response = await axios.get(url, {
    responseType: 'stream'
  });

  await new Promise((resolve, reject) => {
    const dest = fs.createWriteStream(filepath);

    dest.on('finish', resolve);
    dest.on('error', reject);

    response.data.pipe(dest);
  });

  const hash = await hasha.fromFile(filepath, { algorithm: ALGORITHM });

  if (expectedHash === hash) {
    console.log(`${ALGORITHM} ok (${hash})`);
  } else {
    throw new Error(`${ALGORITHM} checksum didn't match expected value!
Expected: ${expectedHash}
  Actual: ${hash}`);
  }
}

(async function main() {
  for (const { url, filename, sha512 } of files) {
    const filepath = path.join(buildFolder, filename);
    await downloadAndVerify(url, filepath, sha512);
  }
})()
  .then(() => process.exit(0))
  .catch(err => {
    console.error(err);
    process.exit(1);
  });
