function save_result(modelbase, path, model_name, rule_name)
  output.model = model_name;
  output.rule = rule_name;

  output.AC = struct_from_names_and_values(modelbase.AUTendo_names, modelbase.AUTR, @(values, i) values(i,:));
  output.VAR = struct_from_names_and_values(modelbase.VARendo_names, modelbase.VAR, @(values, i) values(i,i));

  for p = 1:size(modelbase.innos, 1)
    % 0 if shock unavailable
    if(modelbase.pos_shock(p)) == 0
      continue;
    end

    inno = deblank(modelbase.innos(p, :));
    output.IRF.(inno) = struct_from_names_and_values(modelbase.IRFendo_names, modelbase.IRF, @(values, i) values(i,:,p));
  end

  [folder] = fileparts(path);
  mkdir(folder);

  opts.FileName = path;

  savejson('', output, opts);
end
