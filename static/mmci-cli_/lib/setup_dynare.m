function setup_dynare()
    %% Checking versions of OCTAVE AND DYNARE
    if isunix==1
        addpath('/usr/local/opt/dynare/lib/dynare/matlab')
        addpath('/usr/lib/dynare/mex/octave')
        if exist('OCTAVE_VERSION', 'builtin')
            k0=strfind(IMAGE_PATH,'4.4.0');
            k1=strfind(IMAGE_PATH,'4.4.1');
            if  k0 ~= 0
                if exist(['/Applications/Dynare/4.5.6'])
                        addpath(['/Applications/Dynare/4.5.6/matlab'])
                        addpath(['/Applications/Dynare/4.5.6/mex/octave'])
                else
                    error('Error: Your version of dynare seems to be incompatible with your version of octave. Please check on the dynare website for more information. ')
                end
            elseif k1 ~=0
                if exist(['/Applications/Dynare/4.5.7'])
                        addpath(['/Applications/Dynare/4.5.7/matlab'])
                        addpath(['/Applications/Dynare/4.5.7/mex/octave'])
                else
                    error('Error: Your version of dynare seems to be incompatible with your version of octave. Please check on the dynare website for more information.')
                end
            else
                disp('Old versions of octave used. We cannot guarantee that all models will be simulated.')
            end
        end
        if ~exist('dynare')
               error('Error. Dynare is not installed')
        end
    else
        if exist('OCTAVE_VERSION', 'builtin')
            k0=strfind(IMAGE_PATH,'4.4.0');
            k1=strfind(IMAGE_PATH,'4.4.1');
            if  k0 ~= 0
                if exist('c:\dynare\4.5.6\matlab')
                    addpath(['c:\dynare\4.5.6\matlab'])
                    addpath(['c:\dynare\4.5.6\mex\octave'])
                    addpath('c:\octave\octave-4.4.0\share\octave\packages\nan-3.1.4')
                else
                    error('Error: Octave 4.4.0 requires Dynare 4.5.6. Path for Dynare 4.5.6 not found: expected: c:\dynare\4.5.6\matlab')
                end
            elseif k1 ~=0
                if exist('c:\dynare\4.5.7\matlab')
                    addpath(['c:\dynare\4.5.7\matlab'])
                    addpath(['c:\dynare\4.5.7\mex\octave'])
                    addpath('c:\octave\octave-4.4.0\share\octave\packages\nan-3.1.4')
                else
                    error('Error: Octave 4.4.1 requires Dynare 4.5.7. Path for Dynare 4.5.7 not found: expected: c:\dynare\4.5.7\matlab')
                end
            else
                error('Error: Neither path for Octave 4.4.0 nor Octave 4.4.1 was found! Expected: c:\octave\octave-4.4.0 or c:\octave\octave-4.4.1')
            end
        end
        if ~exist('dynare')
               error('Error. Dynare is not installed')
        end
    end
end
