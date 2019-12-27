const axios = require('axios');
const hasha = require('hasha');
const path = require('path');
const fs = require('fs');

const buildFolder = path.join(process.cwd(), 'build');
const ALGORITHM = 'sha512';

const files = [
  {
    url: 'https://www.dynare.org/release/windows/dynare-4.5.7-win.exe',
    filename: 'dynare-installer.exe',
    [ALGORITHM]: '4edbdbc098eddbea9b3dc334c8323266a66a301da824438e1edd3566936e7d7d8b13761713ce9cf457f6ce37639525102cc726e7a423c1d093fb12a916876a3f',
  }, {
    url: 'https://ftpmirror.gnu.org/octave/windows/octave-4.4.1-w64-installer.exe',
    filename: 'octave-installer.exe',
    [ALGORITHM]: 'a6abcbcec3b3c0f1e4ddf91fc0e77b3a877f3b842a77896d9b0e79b072d8bbebd63f0d2b174d4b5a91761f64cf128bed15354ca409c33334a63009d157c71169',
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
