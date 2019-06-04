function mb = make_modelbase(model, rule, options, modelpath)
  mb.option = [1 1 0 1 1 0];
  mb.maxhorizon = 100;

  mb.horizon = default(options, 'horizon', 20);

  mb.gain = default(options, 'gain', 0.01);
  % allow gain value between 0 and 0.05 only.
  if mb.gain<0 || mb.gain>0.05
    mb.gain = 0.01;
  end

  mb.AL = model.al;
  if (model.al)
    mb.AL_.forwards = model.al_info.forwards;
    mb.AL_.states = default(options, { 'states', model.name }, model.al_info.states_long);

    mb.ModelStates(1)={ mb.AL_.states };
  end

  mb.innos = char(default(options, 'shocks', ['interest_']));

  % insert single model and single rule only, so all model/rule ids can be 1.
  mb.names = char([model.name]);

  mb.variabledim(1) = model.variabledim;

  mb.modeltime(1) = cputime;
  mb.models(1) = 1;
  mb.epsilon = 1;
  mb.l = 1;
  mb.totaltime = cputime;
end
