import { promisify } from 'util';

import fs from 'fs';

export const readdir = promisify(fs.readdir);
export const exists = promisify(fs.exists);
export const stat = promisify(fs.stat);
export const readFile = promisify(fs.readFile);
