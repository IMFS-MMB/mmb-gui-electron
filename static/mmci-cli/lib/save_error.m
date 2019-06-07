function save_error (orig, path)
  error = struct(orig);

  error.backendVersion = version();
  error.dynareVersion = dynare_version();

  is_octave = exist('OCTAVE_VERSION', 'builtin');

  if is_octave
    error.backend = 'octave';
  else
    error.backend = 'matlab';
  end

  savejson('', error, path);
end
