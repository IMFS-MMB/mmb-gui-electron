function mmb (jsonconfig, keep)
  keep = exist('keep','var');

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

    if(~exist(paths.out, 'dir'))
      mkdir(paths.out);
    end

    if (~keep)
      delete(fullfile(paths.out, '*'));
    end

    diary(fullfile(paths.out, 'diary.log'));
    diary('on');

    config = load_config(jsonconfig);

    load_dynare(config.dynare);
    assert_compatibility();

    models = load_models(config.models, paths.models);
    rules = load_rules(config.rules, paths.rules);

    for i = 1:length(models)
      model = models{i};
      run_model_with_rules(model, rules, config, paths);
    end
  catch e
    print_error(e);

    save_error(e, fullfile(paths.out, 'error.json'));

    cd(paths.root);
  end
end
