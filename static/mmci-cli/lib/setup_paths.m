function paths = setup_paths ()
  paths.root = pwd;
  paths.models = fullfile(paths.root, 'models');
  paths.rules = fullfile(paths.root, 'rules');
  paths.out = fullfile(paths.root, 'out');
  paths.lib = fullfile(paths.root, 'lib');

  addpath(paths.root);
  addpath(paths.models);
  addpath(fullfile())
  addpath(fullfile(paths.lib, 'ALTOOL'))
  addpath(fullfile(paths.lib, 'jsonlab'))
end

