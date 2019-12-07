function run_model_with_rules(model, rules, config, paths)
  if (exist(paths.work, 'dir'))
    rmdir(paths.work, 's');
  end
  mkdir(paths.work);

  copyfile(fullfile(paths.models, model.name), fullfile(paths.work, model.name));

  % run with user specified rule
  if (iscell(config.usr) || size(config.usr, 2) > 1)
    if (iscell(config.usr))
      usr = config.usr;
    else
      usr = num2cell(config.usr);
    end

    rule = make_rule('User', config.usr);

    result = run_dynare_and_simulate(model, rule, config.options, paths.work);
    save_result(result, get_output_filename(paths.out, model.name, rule.name), model.name, rule.name);
  end

  % run with model specific rule
  if (config.msr && ~isempty(model.msr))
    rule = make_rule('Model', model.msr);

    result = run_dynare_and_simulate(model, rule, config.options, paths.work);
    save_result(result, get_output_filename(paths.out, model.name, rule.name), model.name, rule.name);
  end

  % run with common rules
  for i = 1:length(rules)
    rule = rules(i);

    result = run_dynare_and_simulate(model, rule, config.options, paths.work);
    save_result(result, get_output_filename(paths.out, model.name, rule.name), model.name, rule.name);
  end
end
