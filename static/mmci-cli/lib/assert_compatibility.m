function assert_compatibility()
  % Versions known to be incompatible? Throw error.

  ERR_INCOMPATIBLE = 'Error: Your version of dynare seems to be incompatible with your version of octave. Please check on the dynare website for more information.';
  WARN_UNSUPPORTED = 'Unsupported version of octave used. We cannot guarantee that all models will be simulated.';

  if is_matlab()
    return;
  end

  if is_octave_ver('4.4.0')
    if is_dynare_ver('4.5.6')
      return;
    else
      error(ERR_INCOMPATIBLE);
    end
  end

  if is_octave_ver('4.4.1')
    if is_dynare_ver('4.5.7')
      return;
    else
      error(ERR_INCOMPATIBLE);
    end
  end

  warning(WARN_UNSUPPORTED);
end

function res = is_matlab()
  res = ~exist('OCTAVE_VERSION', 'builtin');
end

function res = is_dynare_ver(ver)
  res = strcmp(dynare_version(), ver);
end

function res = is_octave_ver(ver)
  res = exist('OCTAVE_VERSION', 'builtin') && strcmp('OCTAVE_VERSION', ver);
end
