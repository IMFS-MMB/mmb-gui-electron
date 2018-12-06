%****************************************
% Stéphane Moyen
% Saves the IRFs produced by Dynare V4
% 11/05/2006
%****************************************

nv = size(var_list_,1);
ns = size(M_.exo_names,1);

for i = 1:nv
    for j = 1:ns
        if exist ([deblank(var_list_(i,:)) '_' deblank(M_.exo_names(j,:))])
            if exist('extension')== 1
                eval(['oo_.irfs_' M_.fname '_' extension '.' deblank(var_list_(i,:)) '_' deblank(M_.exo_names(j,:)) '=' deblank(var_list_(i,:)) '_' deblank(M_.exo_names(j,:)) ';']);
            else
                eval(['oo_.irfs_' M_.fname '.' deblank(var_list_(i,:)) '_' deblank(M_.exo_names(j,:)) '=' deblank(var_list_(i,:)) '_' deblank(M_.exo_names(j,:)) ';']);
            end
        else
            continue
        end
    end
end

if exist('extension')== 1

    save (['IRFs_' M_.fname '_' extension],'-struct','oo_',['irfs_' M_.fname '_' extension]);

    disp(' ');

    disp(['IRFs are saved in IRFs_' M_.fname '_' extension '.mat']);

else

    save (['IRFs_' M_.fname],'-struct','oo_',['irfs_' M_.fname]);

    disp(' ');

    disp(['IRFs are saved in IRFs_' M_.fname '.mat'])
end

