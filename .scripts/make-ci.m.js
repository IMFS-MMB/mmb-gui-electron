const {
  readdirSync,
  writeFileSync,
  mkdirSync,
  existsSync,
  readFileSync,
} = require('fs');
const path = require('path');

const rootFolder = path.resolve(__dirname, '..');
const cliFolder = path.resolve(rootFolder, 'static', 'mmci-cli');
const tmpFolder = path.resolve(rootFolder, 'tmp');
const modelsFolder = path.resolve(cliFolder, 'models');

const DYNARE_PATH = '/usr/lib/dynare';

const configBase = {
  dynare: DYNARE_PATH,
  rules: null,
  models: null,
  msr: null,
  usr: false,
  options: {
    shocks: [
      'interest_',
      'fiscal_'
    ],
    gain: 0.01,
    horizon: 20,
    states: {},
  }
};

if(!existsSync(tmpFolder)) {
  mkdirSync(tmpFolder);
}

const mLines = [];

const MODEL_NAMES = process.env.MODEL_NAMES?.split(',') ?? null;

readdirSync(modelsFolder, { withFileTypes: true })
  .filter(dirent => dirent.isDirectory())
  .map(dirent => dirent.name)
  .filter(name => !MODEL_NAMES || MODEL_NAMES.includes(name))
  .map(name => path.join(modelsFolder, name, `${name}.json`))
  .forEach(modelPath => {
    const model = JSON.parse(readFileSync(modelPath));

    const config = {
      ...configBase,
      models: [model.name],
      rules: model.capabilities.rules,
      msr: !!model.msr
    };

    const configPath = path.join(tmpFolder, `${model.name}.json`);

    writeFileSync(configPath, JSON.stringify(config, null, 2));

    mLines.push(`mmb('${configPath}', 1)`);
  });

const mPath = path.join(cliFolder, `ci.m`);

writeFileSync(mPath, mLines.join(';\n'), { encoding: 'utf8' });
