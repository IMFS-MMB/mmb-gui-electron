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

    load_dynare(config.dynare);
    assert_compatibility();

    models = load_models(config.models, paths.models);
    rules = load_rules(config.rules, paths.rules);

    arrayfun(@(model) run_model_with_rules(model, rules, config, paths), models);
  catch e
    print_error(e);

    cd(paths.root);
  end
end
