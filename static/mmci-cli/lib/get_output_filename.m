function result = get_output_filename (folder, model_name, rule_name)
  result = fullfile(folder, [model_name '-' rule_name '.output.json']);
end
