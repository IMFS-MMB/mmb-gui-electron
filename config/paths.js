/* eslint-disable import/no-dynamic-require */

import path from 'path';

const staticFolder = path.join(__dirname, '..', 'static');

export const mmbFolder = path.join(staticFolder, 'mmci-cli');

export const modelsFolder = path.join(mmbFolder, 'models');
export const rulesFolder = path.join(mmbFolder, 'rules');
export const schemasFolder = path.join(mmbFolder, 'schemas');
