const {
  readdirSync,
  readJsonSync,
  writeJsonSync,
  writeFileSync,
  ensureDirSync
} = require('fs-extra');
const path = require('path');
const rootFolder = path.resolve(__dirname, '..');
const modelsFolder = path.resolve(rootFolder, 'static', 'mmci-cli', 'models');
const tmpFolder = path.resolve(rootFolder, 'tmp');

const configBase = {
  'dynare': '/usr/lib/dynare',
  'rules': null,
  'models': null,
  'msr': null,
  'usr': false,
  "shocks": [
    "interest_",
    "fiscal_"
  ],
  'options': {
    'gain': 0.01,
    'horizon': 20
  }
};

ensureDirSync(tmpFolder);

const mLines = [];

readdirSync(modelsFolder, { withFileTypes: true })
  .filter(dirent => dirent.isDirectory())
  .map(dirent => dirent.name)
  .map(name => path.join(modelsFolder, name, `${name}.json`))
  .forEach(modelPath => {
    const model = readJsonSync(modelPath);

    const config = {
      ...configBase,
      models: [model.name],
      rules: model.capabilities.rules,
      msr: !!model.msr
    };

    const configPath = path.join(tmpFolder, `${model.name}.json`);

    writeJsonSync(configPath, config, { spaces: 2 });

    mLines.push(`mmb('${configPath}')`);
  });

const mPath = path.join(tmpFolder, `crunch.m`);

writeFileSync(mPath, mLines.join(';\n'), { encoding: 'utf8' });
