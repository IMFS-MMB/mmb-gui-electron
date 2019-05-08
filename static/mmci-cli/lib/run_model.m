function result = run_model (modelsfolder, options)
  oldpath = pwd;

  paramspath = fullfile(modelsfolder, 'policy_param.mat');
  modelpath = fullfile(modelsfolder, options.model_name);

  make_policy_params(paramspath, options.coeffs);

  cd(modelpath);

  dynare(options.model_name);

  % create legacy modelbase object
  modelbase = make_modelbase(modelpath, options);
  result = stoch_simul_MMB(modelbase);

  % clean up policy params file
  delete(paramspath);

  cd(oldpath);
end
