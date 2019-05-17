function run_model_with_rules(model, rules, config, paths)
  % run with user specified rule
  if (iscell(config.usr))
    rule = make_rule('User', config.usr);

    result = run_dynare_and_simulate(model, rule, config.options, paths.models);
    save_result(result, get_output_filename(paths.out, model.name, rule.name));
  end

  % run with model specific rule
  if (config.msr && ~isempty(model.msr))
    rule = make_rule('Model', model.msr);

    result = run_dynare_and_simulate(model, rule, config.options, paths.models);
    save_result(result, get_output_filename(paths.out, model.name, rule.name));
  end

  % run with common rules
  for rule = rules
    result = run_dynare_and_simulate(model, rule, config.options, paths.models);
    save_result(result, get_output_filename(paths.out, model.name, rule.name));
  end
end
