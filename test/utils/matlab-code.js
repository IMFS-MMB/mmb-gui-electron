export default function getTestScript(models = [], rules = [], output = [], shocks = []) {
  function vector(selected, length) {
    const arr = [];

    for (let i = 0; i < length; i += 1) {
      arr.push(selected.includes(i + 1) ? 1 : 0);
    }

    return `[${arr.join(',')}]`;
  }

  const code =
 `rootpath = fileparts(mfilename('fullpath'))
  addpath([rootpath filesep 'lib' filesep 'jsonlab'])

  try
      models = ${vector(models, 128)}
      rules = ${vector(rules, 11)}
      output = ${vector(output, 3)}
      shocks = ${vector(shocks, 2)}
      CMD_MMB(models,rules,output,shocks, 'horizon', '20')
  catch ERR
      printf(savejson('', ERR))
  end`;

  return code.replace(/ *\r?\n */g, ';');
}
