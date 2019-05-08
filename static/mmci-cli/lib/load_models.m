function result = load_models (models, modelspath)
  result = arrayfun(@(x) load_model(x{1}, modelspath), models)
end

function result = load_model (model, modelspath)
  modelpath = fullfile(modelspath, model, [model '.json'])

  result = loadjson(modelpath);

  if (isempty(result.msr) == 0)
    result.msr = load_coeffs(result.msr);
  end
end
