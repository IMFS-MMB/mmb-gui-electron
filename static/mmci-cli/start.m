function start()
  try
    paths.root = pwd;
    paths.models = fullfile(paths.root, 'models');
    paths.rules = fullfile(paths.root, 'rules');
    paths.out = fullfile(paths.root, 'out');
    paths.lib = fullfile(paths.root, 'lib');

    addpath(paths.root);
    addpath(paths.models);
    addpath(paths.lib)
    addpath(fullfile(paths.lib, 'ALTOOL'))
    addpath(fullfile(paths.lib, 'jsonlab'))

    delete(fullfile(paths.out, '*'));

    config = load_config('config.json')

    setup_dynare(); % todo use dynare path from config

    models = load_models(config.models, paths.models);
    rules = load_rules(config.rules, paths.rules);

    options = config.options;

    for i = 1:size(models,2)
      model = models(i);
      options.model_name = model.name;

      % run with user specified rule
      % TODO:
      if (0)
        options.rule_name = 'User';
        options.coeffs = load_coeffs(config.user_specified_rule);
      end

      % run with model specific rule
      if (config.model_specific_rule && ~isempty(model.msr))
        options.rule_name = 'Model';
        options.coeffs = model.msr;

        result = run_model(paths.models, options);
        save_result(result, fullfile(paths.out, [options.model_name '-' options.rule_name '.json']));
      end

      % run with common rules
      if(~isempty(rules))
        for j = 1:size(rules,2)
          rule = rules(j);

          options.rule_name = rule.name;
          options.coeffs = rule.coefficients;

          result = run_model(paths.models, options);
          save_result(result, fullfile(paths.out, [options.model_name '-' options.rule_name '.json']));
        end
      end
    end
  catch e
    printf(savejson('', e));
    cd(paths.root);
  end
end
