function mb = make_modelbase(modelpath, options)
    % default options

    mb.option = [1 1 0 1 1 0]
    mb.horizon = 20;
    mb.maxhorizon = 100;
    mb.shocks = [1 0];
    mb.gain = 0.01;
    mb.data = [NaN 0.39 0 0.97;0.81 0 0 -0.9;0 0 0 0;0 0 0 0;0 0 0 0;NaN 0 0 0;NaN 0 0 0;NaN 0 0 0;NaN 0 0 0];
    mb.AL = 0;

    % end default options

    % copy all fields of options into mb
    mb = copy_fields(options, mb);

    % allow gain value between 0 and 0.05 only.
    if mb.gain<0 || mb.gain>0.05
      mb.gain = 0.01;
    end

    % anything beyond this line is needed to provide compatibility with the cli's stoch_simul_MMB
    model_id = 1;
    choices = [1,2];

    mb.rulenamesshort1 = char([options.rule_name])
    mb.names = char([options.model_name]);%

    mb.modeltime(model_id) = cputime;
    mb.models(1) = 1;
    mb.setpath(1,:) = modelpath; % path for dynare file of specific model
    mb.variabledim(1) = 1;
    mb.epsilon = 1;
    mb.l = 1;
    mb.namesshocks= char(['Mon. Pol. Shock      '
      'Fiscal Pol. Shock    ']);
    mb.namesinnos= char(['interest_'
      'fiscal_  ']);
    mb.innos=mb.namesinnos(choices,:);
    mb.namesshocks = mb.namesshocks(choices,:);
    mb.totaltime = cputime;
end
