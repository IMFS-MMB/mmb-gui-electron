function result = get_states (model, options)
  if isfield(options, 'states')
    result = options.states;
  else
    result = model.al_info.states_long;
  end
end
