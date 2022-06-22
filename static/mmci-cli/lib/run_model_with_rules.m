function run_model_with_rules(model, rules, config, paths)
  if (exist(paths.work, 'dir'))
    rmdir(paths.work, 's');
  end
  mkdir(paths.work);

  copyfile(fullfile(paths.models, model.name), fullfile(paths.work, model.name));

  d_version = dynare_version;
  
  oldpath=pwd;
  
  cd(paths.work)
  % If dynare version >=4.6 adjust code (written for <4.6)
  if str2num(d_version([1 3])) >=46  % changed for dynare 4.6
    convert_code(model.name); %this copies original file as name_orig.mod
  end
  
  % If steady state file exists, check dynare version and copy paste steady
  % state file
  %cd(path.work)
  get_steadystate_file(model.name,d_version,paths.work);
  
  cd(oldpath)
  
  % run with user specified rule
  if (iscell(config.usr) || size(config.usr, 2) > 1)
    if (iscell(config.usr))
      usr = config.usr;
    else
      usr = num2cell(config.usr);
    end

    rule = make_rule('User', usr);

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
