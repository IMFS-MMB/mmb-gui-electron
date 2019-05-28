function result = run_dynare_and_simulate (model, rule, options, workfolder)
  oldpath = pwd;

  paramspath = fullfile(workfolder, 'policy_param.mat');
  modelpath = fullfile(workfolder, model.name);

  make_policy_params(paramspath, rule.coefficients);

  cd(modelpath);

  dynare(model.name);

  % create legacy modelbase object
  modelbase = make_modelbase(model, rule, options, modelpath);
  result = stoch_simul_MMB(modelbase);

  cd(oldpath);
end
