function result = load_models (models, modelspath)
  result = arrayfun(@(x) load_model(x{1}, modelspath), models, 'UniformOutput', false);
end

function result = load_model (model, modelspath)
  modelpath = fullfile(modelspath, model, [model '.json']);

  result = loadjson(modelpath);
end
