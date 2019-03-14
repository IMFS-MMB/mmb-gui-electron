function coerceBoolean(value) {
  return value && `${value}` !== 'false' && `${value}` !== 'undefined';
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
      isTagged: coerceBoolean(TRAVIS_TAG),
      isPr: coerceBoolean(TRAVIS_PULL_REQUEST),
      tag: TRAVIS_TAG,
      branch: TRAVIS_BRANCH,
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
      isTagged: coerceBoolean(APPVEYOR_REPO_TAG),
      isPr: coerceBoolean(APPVEYOR_PULL_REQUEST_NUMBER),
      tag: APPVEYOR_REPO_TAG_NAME,
      branch: APPVEYOR_REPO_BRANCH,
    };
  }

  throw new Error('Unrecognized environment.');
}

module.exports = getOptions();
