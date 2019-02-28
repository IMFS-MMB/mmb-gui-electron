const Client = require('ssh2-sftp-client');
const sftp = new Client();
const path = require('path');
const glob = require('glob');

function coerceBoolean(value) {
  return typeof value !== 'undefined' && value != null && `${value}` !== 'false' && `${value}` !== 'undefined';
}

function exitSuccess(message) {
  if (message) console.log(message);

  process.exit(0);
}

function exitError(message) {
  if (message) console.error(message);

  process.exit(1);
}

function getOptions() {
  const isTravis = coerceBoolean(process.env.TRAVIS);
  const isAppveyor = coerceBoolean(process.env.APPVEYOR);

  if (isTravis) {
    console.log('Travis detected');

    const {
      TRAVIS_BRANCH,
      TRAVIS_PULL_REQUEST,
      TRAVIS_TAG,
    } = process.env;

    console.log(`TRAVIS_BRANCH=${TRAVIS_BRANCH}`);
    console.log(`TRAVIS_PULL_REQUEST=${TRAVIS_PULL_REQUEST}`);
    console.log(`TRAVIS_TAG=${TRAVIS_TAG}`);

    return {
      shouldDeploy: !coerceBoolean(TRAVIS_PULL_REQUEST) && TARGET_BRANCHES.includes(TRAVIS_BRANCH),
      isStable: coerceBoolean(TRAVIS_TAG),
      tag: TRAVIS_TAG,
    };
  }

  if (isAppveyor) {
    console.log('Appveyor detected');

    const {
      APPVEYOR_PULL_REQUEST_NUMBER,
      APPVEYOR_REPO_BRANCH,
      APPVEYOR_REPO_TAG,
      APPVEYOR_REPO_TAG_NAME
    } = process.env;

    console.log(`APPVEYOR_PULL_REQUEST_NUMBER = ${APPVEYOR_PULL_REQUEST_NUMBER}`);
    console.log(`APPVEYOR_REPO_BRANCH = ${APPVEYOR_REPO_BRANCH}`);
    console.log(`APPVEYOR_REPO_TAG = ${APPVEYOR_REPO_TAG}`);
    console.log(`APPVEYOR_REPO_TAG_NAME = ${APPVEYOR_REPO_TAG_NAME}`);

    return {
      shouldDeploy: !coerceBoolean(APPVEYOR_PULL_REQUEST_NUMBER) && TARGET_BRANCHES.includes(APPVEYOR_REPO_BRANCH),
      isStable: coerceBoolean(APPVEYOR_REPO_TAG),
      tag: APPVEYOR_REPO_TAG_NAME,
    };
  }

  return {
    shouldDeploy: false,
    isStable: false,
    tag: null
  };
}

const { SFTP_PASSWORD } = process.env;

const BUILD_FOLDER = path.join(__dirname, '..', 'build');

const TARGET_BRANCHES = ['master'];

const PATH_BASE = `data/mmb-electron-gui`;

const {
  shouldDeploy,
  isStable,
  tag,
} = getOptions();

if (!shouldDeploy) {
  exitSuccess('No deployment needed. Exiting.');
}

glob('mmb-electron*{snap,AppImage,dmg,mac.zip,exe}', {
  cwd: BUILD_FOLDER
}, async function (err, files) {
  try {
    await sftp.connect({
      host: 'macromodelbase.com',
      port: '2222',
      username: 'deploy',
      password: SFTP_PASSWORD
    });

    const remoteFolder = `${PATH_BASE}/${isStable ? tag : 'nightly'}`;

    if (!await sftp.exists(remoteFolder)) {
      await sftp.mkdir(remoteFolder, true);
    }

    for (const file of files) {
      const src = path.join(BUILD_FOLDER, file);

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
