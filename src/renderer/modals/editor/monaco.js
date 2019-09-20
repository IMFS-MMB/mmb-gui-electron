import * as monaco from 'monaco-editor/esm/vs/editor/editor.main';

import common from '../../../schemas/common.schema';
import config from '../../../schemas/config.schema';
import model from '../../../schemas/model.schema';
import rule from '../../../schemas/rule.schema';

monaco.languages.json.jsonDefaults.setDiagnosticsOptions({
  enableSchemaRequest: false,
  validate: true,
  schemas: [
    {
      uri: 'common',
      schema: common,
    },
    {
      uri: 'config',
      schema: config,
    },
    {
      uri: 'model',
      schema: model,
    },
    {
      uri: 'rule',
      schema: rule,
    },
  ],
});

export default monaco;
