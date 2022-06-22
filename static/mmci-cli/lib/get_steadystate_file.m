function get_steadystate_file(modelname,d_version,workpath)

%% Input: modelname: Model Name
%         d_version: dynare version
% If the model has a steady state file, it checks the dynare version and
% copy pastes the correct steady state file to the model

%%
%check which files are in directory
cd(modelname);

all = dir;
all = all(3:end);
for i =1:size(all,1)
    %if file is folder and has name steadystate
    if (all(i).isdir) && (contains(all(i).name,'steadystate')==true)
        cd 'steadystate'
        inside = dir;
        inside = inside(3:end);
        filename_work = inside(1).name;
        %if dynare version >=4.6, take the first file (without "_dy45")
         if str2num(d_version([1 3])) >=46
            filename=inside(1).name;
            copyfile(fullfile(workpath,"\",modelname,"\steadystate\",filename),fullfile(workpath,"\",modelname,"\",filename_work));
        else %else take the second file one without "_dy45"
            filename=inside(2).name;
            copyfile(fullfile(workpath,"\",modelname,"\steadystate\",filename),fullfile(workpath,"\",modelname,"\",filename_work));
        end
    end
end
