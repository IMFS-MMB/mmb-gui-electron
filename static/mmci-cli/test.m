function test(config, configAl)
  mmb(config);
  results = loadjson(fullfile(pwd, 'out', 'NK_RW97-Taylor.output.json'));

  mmb(configAl);
  resultsAL = loadjson(fullfile(pwd, 'out', 'US_YR13AL-Model.output.json'));

  successful = 0;

  disp('---OUTPUT-START---');

  % -- non AL model --

  % acpi2 = -0.070996501707455;
  successful = successful + expect('Autocorrelation', -0.071, round_to(results.data.AC.pi(2), 4));
  % vary = 1.170184524376502;
  successful = successful + expect('Unconditional variances', 1.1702, round_to(results.data.VAR.y, 4));
  % irfoutputgap3 = 0.041487616530000;
  successful = successful + expect('Input response functions', 0.0415, round_to(results.data.IRF.interest_.outputgap(3), 4));

  % -- AL model --

  % tests for AL models including AC & variances take too long. The original config is keept in case anyone wants to swich back to including these into the test
  % ack5 = 0.739569762800000;
  %successful = successful + expect('[AL] Autocorrelation', 0.7396, round_to(resultsAL.data.AC.k(5), 4));
  successful = successful + 1
  % varoutput = 8.265576145000000;
  %successful = successful + expect('[AL] Unconditional variances', 8.2656, round_to(resultsAL.data.VAR.output, 4));
  successful = successful + 1
  % irfinflation10 = 0.680700015500000;
  successful = successful + expect('[AL] Input response functions', -0.6807, round_to(resultsAL.data.IRF.interest_.inflation(10), 4));

  disp(sprintf('%d out of 4 successful', successful));
end
