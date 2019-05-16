function run_model_with_rules(model, rules, config, paths)
  options = config.options;

  options.model_name = model.name;
  options.al = model.al;

  if (model.al && ~isfield(options, 'al_'))
    options.al_.forwards = model.al_info.forwards;
    options.al_.states = model.al_info.states_long;
  end

  % run with user specified rule
  if (iscell(config.usr))
    run_and_save('User', config.usr, options, paths);
  end

  % run with model specific rule
  if (config.msr && ~isempty(model.msr))
    run_and_save('Model', model.msr, options, paths);
  end

  % run with common rules
  for rule = rules
    run_and_save(rule.name, rule.coefficients, options, paths)
  end
end
