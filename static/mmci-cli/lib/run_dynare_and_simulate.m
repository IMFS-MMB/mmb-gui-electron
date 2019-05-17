function result = run_dynare_and_simulate (model, rule, options, modelsfolder)
  oldpath = pwd;

  paramspath = fullfile(modelsfolder, 'policy_param.mat');
  modelpath = fullfile(modelsfolder, model.name);

  make_policy_params(paramspath, rule.coefficients);

  cd(modelpath);

  dynare(model.name);

  % create legacy modelbase object
  modelbase = make_modelbase(model, rule, options, modelpath);
  result = stoch_simul_MMB(modelbase);

  % clean up policy params file
  delete(paramspath);

  cd(oldpath);
end
