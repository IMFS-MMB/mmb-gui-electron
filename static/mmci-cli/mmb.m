function mmb (jsonconfig)
  try
    [paths.root] = fileparts(mfilename('fullpath'));
    paths.models = fullfile(paths.root, 'models');
    paths.rules = fullfile(paths.root, 'rules');
    paths.out = fullfile(paths.root, 'out');
    paths.lib = fullfile(paths.root, 'lib');
    paths.work = fullfile(paths.root, 'work');

    cd(paths.root);

    addpath(paths.root);
    addpath(paths.models);
    addpath(paths.lib);
    addpath(fullfile(paths.lib, 'ALTOOL'));
    addpath(fullfile(paths.lib, 'jsonlab'));

    mkdir(paths.out);
    delete(fullfile(paths.out, '*'));
    diary(fullfile(paths.out, 'diary.log'));
    diary('on');

    config = load_config(jsonconfig);

    load_dynare(config.dynare);
    assert_compatibility();

    models = load_models(config.models, paths.models);
    rules = load_rules(config.rules, paths.rules);

    for model = models
      run_model_with_rules(model, rules, config, paths);
    end
  catch e
    print_error(e);

    save_error(e, fullfile(paths.out, 'error.json'));

    cd(paths.root);
  end
end
