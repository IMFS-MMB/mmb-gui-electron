function check = convert_code(name)

%%
% Input:    name of models
% Output:   check = 0, mod file could not be changed
%                 = 1, all mod files successfully changed

% This file converts mod file to dynare version >4.6
% Copy file 
% Read mod file
% Look for sequence to change
% Replace it
% Save mod file
oldpath=pwd;

%%
check=0;

cd(name);
%% Sequences which replace code
sequence_change = {};   %sequence to search
lines_change={};        %lines to add

%Loading policy rule coefficients
sequence_change{end+1} = "deep_parameter_name = M_.param_names(i,:);";
lines_change{end+1}="    deep_parameter_name = M_.param_names{i};";

sequence_change{end+1} = "name = deblank(M_.param_names(i,:));";
lines_change{end+1}="        name = deblank(M_.param_names{i});";

% copy paste original code
%copyfile(name+".mod",name+"_orig.mod");
        
% Read the mod file as a cell with element being one line of code
code=importdata(name+".mod", '\n');
code=string(code);            
% Look for the sequences where to change code
for j=1:size(sequence_change,2)
    do=1;
    while do==1
        do=0;
        index_sequ_start = strfind(code,sequence_change{1,j});
        index_sequ_start = find(~cellfun(@isempty,index_sequ_start)); 
        if isempty(index_sequ_start)==false
            code = vertcat(code(1:index_sequ_start-1),lines_change{1,j},code(index_sequ_start+1:end));
            check=1;
            do=1;
        end
    end
end


                
% create a mod file with the converted code
filename = name+".mod";
fid = fopen(filename,'wt');
for k = 1:size(code)
    fprintf(fid, '%s \n', code(k));
end
fclose(fid);   

cd(oldpath)
