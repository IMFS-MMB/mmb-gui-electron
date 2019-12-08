import fs from 'fs-extra';
import path from 'path';

export function makeModelScaffoldJson(modelName) {
  const json = {
    $schema: 'model',
    name: modelName,
    capabilities: {
      rules: [
        'CEE',
        'CMR',
        'Coenen',
        'GR',
        'LWW',
        'OW08',
        'OW13',
        'SW',
        'Taylor',
      ],
      unconditional_variances: true,
    },
    description: {
      ac_ref: 'Example',
      paper_title: 'Example',
      journal: 'Example',
      replicants_name: 'Example',
      pub_date: 'Example',
      keywords: [],
      description: 'Example',
      category: 'Example',
      authors: [
        'Example',
      ],
    },
    msr: null,
    variabledim: 1,
    al: false,
    shocks: [
      {
        name: 'example_',
        text: 'Example Shock',
      },
    ],
    al_info: null,
    variables: [
      {
        name: 'example',
        text: 'Example shock process',
      },
    ],
  };

  return JSON.stringify(json, null, 2);
}

export function makeModelScaffoldMod(modelName) {
  return `// Model: ${modelName}`;
}

export function writeModelScaffold(baseFolder, modelName) {
  const folderPath = path.join(baseFolder, modelName);
  const jsonPath = path.join(folderPath, `${modelName}.json`);
  const modPath = path.join(folderPath, `${modelName}.mod`);

  const json = makeModelScaffoldJson(modelName);
  const mod = makeModelScaffoldMod(modelName);

  fs.mkdirpSync(folderPath);
  fs.writeFileSync(jsonPath, json, { encoding: 'utf8' });
  fs.writeFileSync(modPath, mod, { encoding: 'utf8' });
}
