function result = run_dynare_and_simulate (model, rule, options, workfolder)
  oldpath = pwd;

  paramspath = fullfile(workfolder, 'policy_param.mat');
  modelpath = fullfile(workfolder, model.name);

  make_policy_params(paramspath, rule.coefficients);

  cd(modelpath);
  %d_version = dynare_version;
   
  dynare(model.name);

  % create legacy modelbase object
  modelbase = make_modelbase(model, rule, options, modelpath);
 % if str2num(d_version([1 3])) <46
      result = stoch_simul_MMB(modelbase);
%  else
  %    result = stoch_simul_MMB_46(modelbase);
   %   restore_files(model.name);
%  end
    
  cd(oldpath);
end
