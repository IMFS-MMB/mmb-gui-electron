import fs from 'fs';
import { promisify } from 'util';

export const readFile = promisify(fs.readFile);
export const stat = promisify(fs.stat);
