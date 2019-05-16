function load_dynare(basepath)
  path = fullfile(basepath, 'matlab');
  isoctave = exist('OCTAVE_VERSION');

  if isoctave
      warning('off', 'Octave:shadowed-function')
  end

  disp(['Dynare path is "' basepath '"'])
  addpath(path);

  if isoctave
      warning('on', 'Octave:shadowed-function')
  end

  if ~exist('dynare')
    error(['The dynare() function was unavailable although "' path '" was added to path. Please check the provided dynare path. Exiting.'])
  end
end
