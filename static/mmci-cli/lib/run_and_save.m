function run_and_save(rule_name, coeffs, options, paths);
  options.rule_name = rule_name;
  options.coeffs = load_coeffs(coeffs);

  result = run_dynare_and_simulate(paths.models, options);
  save_result(result, fullfile(paths.out, [options.model_name '-' options.rule_name '.json']));
end
