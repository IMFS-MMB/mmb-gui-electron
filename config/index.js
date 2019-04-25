/* eslint-disable import/no-dynamic-require */

import path from 'path';

export const mmbFolder = path.join(__dirname, '..', 'static', 'mmci-cli');
export const modelsFolder = path.join(mmbFolder, 'MODELS');
export const modelsSchemaPath = path.join(modelsFolder, 'model.schema.json');
