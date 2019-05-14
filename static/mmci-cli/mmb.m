function mmb (jsonconfig)
  try
    paths.root = pwd;
    paths.models = fullfile(paths.root, 'models');
    paths.rules = fullfile(paths.root, 'rules');
    paths.out = fullfile(paths.root, 'out');
    paths.lib = fullfile(paths.root, 'lib');

    addpath(paths.root);
    addpath(paths.models);
    addpath(paths.lib);
    addpath(fullfile(paths.lib, 'ALTOOL'));
    addpath(fullfile(paths.lib, 'jsonlab'));

    delete(fullfile(paths.out, '*'));

    config = load_config(jsonconfig);

    setup_dynare(); % todo use dynare path from config

    models = load_models(config.models, paths.models);
    rules = load_rules(config.rules, paths.rules);

    arrayfun(@(model) run_model_with_rules(model, rules, config, paths), models);
  catch e
    disp(['current directory: ' pwd]);
    printf(savejson('', e));
    cd(paths.root);
  end
end
