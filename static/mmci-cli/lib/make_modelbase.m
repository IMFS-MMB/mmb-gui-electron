function mb = make_modelbase(modelpath, options)
  mb.option = [1 1 0 1 1 0];
  mb.maxhorizon = 100;

  mb.horizon = default(options, 'horizon', 20);
  mb.gain = default(options, 'gain', 0.01);

  mb.AL = default(options, 'al', 0);
  mb.AL_ = default(options, 'al_', []);

  shocks = default(options, 'shocks', [1]);

  % allow gain value between 0 and 0.05 only.
  if mb.gain<0 || mb.gain>0.05
    mb.gain = 0.01;
  end

  if mb.AL
    mb.ModelStates(1)={ mb.AL_.states };
  end

  mb.rulenamesshort1 = char([options.rule_name]);
  mb.names = char([options.model_name]);
  mb.modeltime(1) = cputime;
  mb.models(1) = 1;
  mb.setpath(1,:) = modelpath;
  mb.variabledim(1) = 1;
  mb.epsilon = 1;
  mb.l = 1;
  mb.namesshocks= char(['Mon. Pol. Shock      '; 'Fiscal Pol. Shock    ']);
  mb.namesinnos= char(['interest_'; 'fiscal_  ']);
  mb.innos = mb.namesinnos(shocks,:);
  mb.namesshocks = mb.namesshocks(shocks,:);

  mb.totaltime = cputime;
end

function result = default (base, fieldname, default_value)
  if (isfield(base, fieldname))
    result = base.(fieldname);
  else
    result = default_value;
  end
end
