import * as comlink from 'comlink';
import getDynareVersion from './dynare/get-dynare-version';
import scanForDynare from './dynare/scan-for-dynare';
import { getExecutableInfo, scanForBackends } from './backend/scan-for-backends';
import loadModels from './data/load-models';
import loadRules from './data/load-rules';

const api = {
  getDynareVersion,
  scanForDynare,
  getExecutableInfo,
  scanForBackends,
  loadModels,
  loadRules,
};

comlink.expose(api);
