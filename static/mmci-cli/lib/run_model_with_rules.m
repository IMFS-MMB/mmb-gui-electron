function run_model_with_rules(model, rules, config, paths)
  options = config.options;

  options.model_name = model.name;
  options.al = model.al;

  if (model.al && ~isfield(options, 'al_'))
    options.al_.forwards = model.al_info.forwards;
    options.al_.states = model.al_info.states_long;
  end

  function run_and_save(rule_name, coeffs)
    options.rule_name = rule_name;
    options.coeffs = load_coeffs(coeffs);

    result = run_dynare_and_simulate(paths.models, options);
    save_result(result, fullfile(paths.out, [options.model_name '-' options.rule_name '.json']));
  end

  % run with user specified rule
  if (iscell(config.usr))
    run_and_save('User', config.usr);
  end

  % run with model specific rule
  if (config.msr && ~isempty(model.msr))
    run_and_save('Model', model.msr);
  end

  % run with common rules
  arrayfun(@(rule) run_and_save(rule.name, rule.coefficients), rules);
end
