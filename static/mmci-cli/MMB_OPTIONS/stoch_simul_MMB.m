function [base]=stoch_simul_MMB(base)

% Copyright (C) 2001-2009 Dynare Team
%
% This file is part of Dynare.
%
% Dynare is free software: you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation, either version 3 of the License, or
% (at your option) any later version.
%
% Dynare is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details.
%
% You should have received a copy of the GNU General Public License
% along with Dynare.  If not, see <http://www.gnu.org/licenses/>.
cd ..
AL=base.AL; % MODELBASE Change

location=cd;
d_version=dynare_version;
if ~isempty(str2num(d_version([1 3])))
    if str2num(d_version([1 3]))==42 % for dynare versions higher than 4.2.0 and AL Models, we have modeifed the dr1.m of dynare(basically by storing the model jacobian)
        if exist([location '\ALTOOL\dr1_AL.m'], 'file')==2
            copyfile([location '\ALTOOL\dr1_AL.m'],[location '\ALTOOL\dr1.m']);
        end
    elseif str2num(d_version([1 3]))>42 && str2num(d_version([1 3]))<45 % for dynare versions higher than 4.3.0 and AL Models, we have modeifed the stochastic_solvers.m of dynare(basically by storing the model jacobian)
        if exist([location '\ALTOOL\stochastic_solvers_AL_Dynare_' d_version([1 3]) '.m'], 'file')==2
            copyfile([location '\ALTOOL\stochastic_solvers_AL_Dynare_' d_version([1 3]) '.m'],[location '\ALTOOL\stochastic_solvers.m']);
        end
    elseif str2num(d_version([1 3]))>44  % for dynare versions higher than 4.4.* and AL Models, we have to use the modeifed stochastic_solvers.m of dynare(basically by storing the model jacobian)
        if exist([location '\ALTOOL\stochastic_solvers_AL_Dynare_45.m'], 'file')==2
            copyfile([location '\ALTOOL\stochastic_solvers_AL_Dynare_45.m'],[location '\ALTOOL\stochastic_solvers.m']);
        end
    end
else % for unstable (not numbered) versions of dynare versions higher than 4.5 and AL Models, we have modeifed the stochastic_solvers.m of dynare(basically by storing the model jacobian)
    if exist([location '\ALTOOL\stochastic_solvers_AL_Dynare_45.m'], 'file')==2
        copyfile([location '\ALTOOL\stochastic_solvers_AL_Dynare_45.m'],[location '\ALTOOL\stochastic_solvers.m']);
    end
end
if AL % MODELBASE change
    gain=base.gain;
    AL_=base.AL_;
end
cd(base.setpath(base.models(base.epsilon),:)); % MODELBASE: change directory to the specific folder of the to-be-solved model

global M_ options_ oo_ it_

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%%%%%%%% ADDED BY MODELBASE TEAM
global shocks;
global s; %s=size(shocks);
global chosenshocks; %chosenshocks = zeros(s(1,1),1);
global option4;
global option3;
global MODELGUI;


if (strcmp(dynare_version, '4.2.0') || strcmp(dynare_version, '4.2.1') || strcmp(dynare_version, '4.2.2') || strcmp(dynare_version, '4.2.4')...
        || strcmp(dynare_version, '4.2.5'))
    
else
    % Only when the Dynare version is higher than 4.3.0
    dr = oo_.dr;
end
%%%%%%%%%%%%%%
%%
options_old = options_;
options_.ar=base.maxhorizon;
options_.order = 1;     % ADDED BY MODELBASE TEAM
if options_.linear
    options_.order = 1;
end
if options_.order == 1
    options_.replic = 1;
elseif options_.order == 3
    options_.k_order_solver = 1;
end

if isempty(options_.qz_criterium)
    options_.qz_criterium = 1+1e-6;
end

TeX = options_.TeX;

iter_ = max(options_.periods,1);
if M_.exo_nbr > 0
    oo_.exo_simul= ones(iter_ + M_.maximum_lag + M_.maximum_lead,1) * oo_.exo_steady_state';
end


%%%%%%%%% ADDED BY MODELBASE TEAM
%check_model;  % commented out by Sebastian, otherwise Matlab breaks down
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    rule_number=base.l;
if (AL && ~isempty(find([8 9 10] == rule_number)))
    disp(' ');
    disp('For the moment, AL models only allow simulations with at most one lead and one lag in the monetary policy rule.');
    disp(' ');
    base.solution=0;
    base.info(base.models(base.epsilon)) = 1;
    if base.option(2)==1
        if strcmp(base.innos(1,:),'all_shocks')  % this is the case if only one model and then all shocks for this model have been chosen
            shocks= M_.exo_names(M_.exo_names_orig_ord,:);
            inv_lgx_orig_ord_(M_.exo_names_orig_ord)=(1:M_.exo_nbr)';
            base.innos = shocks; % put all shocks in the choice vector for the IRFs
            base.namesshocks = shocks; % put the right shock names for correct plots
        end
        for p=1:size(base.innos,1)
            base.pos_shock(p,base.models(base.epsilon))=0;
        end
    end
else
    % Execute differently according to Dynare version
    if (strcmp(dynare_version, '4.2.0') || strcmp(dynare_version, '4.2.1') || strcmp(dynare_version, '4.2.2') || strcmp(dynare_version, '4.2.4')...
            || strcmp(dynare_version, '4.2.5'))
        [oo_.dr, info] = resol(oo_.steady_state,0); % solve
    elseif (strcmp(dynare_version, '4.3.0') || strcmp(dynare_version, '4.3.1') || strcmp(dynare_version, '4.3.2') || strcmp(dynare_version, '4.3.3')  )
        oo_.dr=set_state_space(dr,M_);
        [oo_.dr,info] = resol(0,M_,options_,oo_); %solve
    else  % for dynare versions 4.4.0 or higher
        oo_.dr=set_state_space(dr,M_,options_);
        [oo_.dr.nstatic, oo_.dr.npred, oo_.dr.nboth, oo_.dr.nfwrd,oo_.dr.nsfwrd] = get_nvars_state_space(dr,M_);
        
        if (strcmp(dynare_version, '4.4.0') || strcmp(dynare_version, '4.4.1') )
            
        else
            if options_.logged_steady_state
                oo_.dr.ys=exp(oo_.dr.ys);
                oo_.steady_state=exp(oo_.steady_state);
            end
        end
        
        [oo_.dr,info,M_,options_,oo_] = resol(0,M_,options_,oo_); %solve
    end
    
    % The follwoing if clause matters when the Dynare version is higher than
    % 4.4.1.
    if options_.loglinear
        oo_.dr.ys=log(oo_.dr.ys);
        oo_.steady_state=log(oo_.steady_state);
        options_old.logged_steady_state = 1;
    end
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    if info(1)
        disp(' ');
        disp('NO SOLUTION FOUND');
        disp(' ');
        base.solution=0;
        base.info(base.models(base.epsilon)) = 1;
        if base.option(2)==1
            if strcmp(base.innos(1,:),'all_shocks')  % this is the case if only one model and then all shocks for this model have been chosen
                shocks= M_.exo_names(M_.exo_names_orig_ord,:);
                inv_lgx_orig_ord_(M_.exo_names_orig_ord)=(1:M_.exo_nbr)';
                base.innos = shocks; % put all shocks in the choice vector for the IRFs
                base.namesshocks = shocks; % put the right shock names for correct plots
            end
            for p=1:size(base.innos,1)
                base.pos_shock(p,base.models(base.epsilon))=0;
            end
        end
    else
         base.info(base.l) = info(1);
         base.solution=1;

        %Theoretical ACFs and Variances
        nvar  = length(oo_.dr.order_var);
        ivar  = transpose(1:nvar);
        options_.irf = base.horizon; % horizon for ACFs
        %cd('..');
        if AL       % HAVE TO REMEMBER MAKE R_sim IN DECLARATION ORDER!
            h = waitbar(0,'Simulations running...');
            n_sims = 10;
            len_sim = 500;
            R_sim = zeros(nvar,len_sim,n_sims);
            Covar = zeros(nvar,nvar,n_sims);
            for j = 1:n_sims;
                R_sim(:,:,j) = sim_AL_alt_gain(oo_.dr,len_sim,AL_,gain);
                % Re-ordering into declaration order
                R_sim(oo_.dr.order_var,:,j) = R_sim(:,:,j);
                waitbar(j/n_sims,h);
                Covar(:,:,j) = cov(R_sim(:,:,j)');
            end
            close(h);
            oo_.var = mean(Covar,3);
        else
            [Gamma_y,stationary_vars] = th_autocovariances(oo_.dr,ivar,M_,options_,1);
            oo_.var = Gamma_y{1}; % Variances
        end
        if AL
            base.VAR.(num2str(deblank(base.rulenamesshort1(base.l,:)))) =oo_.var;
            base.VARendo_names.(num2str(deblank(base.rulenamesshort1(base.l,:))))=M_.endo_names;
        else
            base.VAR.(num2str(deblank(base.rulenamesshort1(base.l,:)))) =Gamma_y{1};
            base.VARendo_names.(num2str(deblank(base.rulenamesshort1(base.l,:))))=M_.endo_names;
        end
        if AL
            aut = zeros(nvar,base.horizon,n_sims);
            for j = 1:n_sims
                for n = 1:nvar
                    temp_vec = squeeze(R_sim(n,:,j));
                    for k = 1:base.horizon
                        temp = corrcoef([temp_vec(1:end-k)' temp_vec(k+1:end)' ]);
                        aut(n,k,j) = temp(1,2);
                    end
                end
            end
            R = mean(aut,3);
        else
            R=[];
            for i=1:base.horizon
                oo_.autocorr{i}=Gamma_y{i+1};
                R= [ R, diag(oo_.autocorr{i}) ];
            end
        end
        
        if base.option(1) == 1; % If ACF are selected...
           base.AUTR.(num2str(deblank(base.rulenamesshort1(base.l,:))))(:,:)=[ones(size(R,1),1),R];
           base.AUTendo_names.(num2str(deblank(base.rulenamesshort1(base.l,:))))(:,:)=M_.endo_names(ivar,:);
        else
           base.AUTR.(num2str(deblank(base.rulenamesshort1(base.l,:)))) = [];
           base.AUTendo_names.(num2str(deblank(base.rulenamesshort1(base.l,:)))) = [];
        end
        
        % Impulse response functions
        
        if base.option(2)==1   % If IRF are selected...
            options_.irf = base.horizon; % horizon for IRFs
            shocks = M_.exo_names(M_.exo_names_orig_ord,:);  % put shocks in the right order for Dynare
            inv_lgx_orig_ord_(M_.exo_names_orig_ord)=(1:M_.exo_nbr)'; % save the order
%             if base.option(6)==1 % this is the case if only one model and then all shocks for this model have been chosen
%                 if base.l==min(find(base.info==0))
%                     % the menu for model-specific shocks is shown once when the model with the first chosen rule is solved.
%                     option3=0;
%                     option4=1;
%                     shocks= M_.exo_names(M_.exo_names_orig_ord,:);
%                     s=size(shocks);
%                     chosenshocks = zeros(s(1,1),1);
%                     model_specific_gui
%                     waitfor(MODELGUI)
%                     shocks = shocks(find(chosenshocks>0),:);
%                     base.option(4)=option4;
%                     base.option(3)=option3;
%                     if option3 == 0
%                         disp('Selected innovations will not be shocked contemporaneously.');
%                     end
%                     base.innos = shocks; % put all chosen shocks in the choice vector for the IRFs
%                     base.namesshocks1 = shocks; % put the right shock names for correct plots
%                     if size(base.namesshocks1,2)<size(base.namesshocks,2)  % check if long names for monetary and fiscal shock fit in the names vector
%                         nblanks=size(base.namesshocks,2)-size(base.namesshocks1,2);  % adjust vector length
%                         for j= 1:size(base.namesshocks1,1)
%                             blankvector(j,:) = blanks(nblanks);
%                         end
%                         base.namesshocks1 = [base.namesshocks1 blankvector];
%                     end
%                     if loc(base.namesshocks1,'interest_')~=0
%                         base.namesshocks1(loc(base.namesshocks1,'interest_'),:)=char('Mon. Pol. Shock      ');  %put nice names for 'interest_' and 'fiscal_'
%                     end
%                     if loc(base.namesshocks1,'fiscal_')~=0
%                         base.namesshocks1(loc(base.namesshocks1,'fiscal_'),:)  =char('Fiscal Pol. Shock    ');
%                     end
%                     base.namesshocks = base.namesshocks1; clear base.namesshocks1;
%                     base.option(4)=option4;
%                     base.option(3)=option3;
%                     disp(' ');
%                     if base.option(4) ==1
%                         disp('You decided to plot selected variables.');
%                         disp(' ');
%                     else disp('You decided to plot all variables.');
%                         disp(' ');
%                     end
%                     
%                 end
%             else  base.option(4)=1;
%             end
            if base.option(3)==1 %Several innovations are shocked contemporaneously
                cd('..');
                if AL
                    SS_AL=M_.Sigma_e+1e-14*eye(M_.exo_nbr);
                    cs = zeros(size(SS_AL,1),1); % this line produces in the end IRF that are independent of any covariance structure. Shocks are one unit shocks. (as in Küster, Wieland)
                else
                    SS(M_.exo_names_orig_ord,M_.exo_names_orig_ord)=M_.Sigma_e+1e-14*eye(M_.exo_nbr);
                    cs = zeros(size(SS,1),1); % this line produces in the end IRF that are independent of any covariance structure. Shocks are one unit shocks. (as in K?ter, Wieland)
                end
                for p=1:size(base.innos,1)
                    if AL
                        ii=loc(M_.exo_names,base.innos(p,:)); %Position of the shock
                        cd(base.setpath(base.models(base.epsilon),:));
                        base.pos_shock(p,base.models(base.epsilon))=ii;
                    else
                        ii=loc(M_.exo_names(inv_lgx_orig_ord_,:),base.innos(p,:)); %Position of the shock
                        cd(base.setpath(base.models(base.epsilon),:));
                        base.pos_shock(p,base.models(base.epsilon))=ii;
                    end
                    
                    if ii==0
                        disp(['No ' deblank(num2str(base.namesshocks(p,:))) ' is available for Model: ' num2str(base.names(base.models(base.epsilon),:))]);
                    end;
                    if AL
                        if base.variabledim(base.models(base.epsilon)) ==1
                            cs(ii,1)=1;
                        end
                        if base.variabledim(base.models(base.epsilon)) ==2
                            cs(ii,1)=1/100; % in case that models are written in percent/100 terms, shocks are 0.01 shocks
                        end
                    else
                        if base.variabledim(base.models(base.epsilon)) ==1
                            cs(ii,1)=1;
                        end
                        if base.variabledim(base.models(base.epsilon)) ==2
                            cs(ii,1)=1/100; % in case that models are written in percent/100 terms, shocks are 0.01 shocks
                        end
                    end
                end;
                %Compute the IRFs
                if AL
                    R=irf_AL_alt_gain(oo_.dr,cs, options_.irf, base.AL_,gain);
                    R(oo_.dr.order_var,:) = R;
                else
                    R=irf(oo_.dr,cs(M_.exo_names_orig_ord,1), options_.irf, options_.drop, options_.replic, options_.order);
                end
                base.IRF.(num2str(deblank(base.rulenamesshort1(base.l,:))))(:,:,1) = [zeros(size(R,1),1),R];
                base.IRFendo_names.(num2str(deblank(base.rulenamesshort1(base.l,:))))(:,:)=M_.endo_names;
            else
                for p=1:size(base.innos,1)
                    cd('..');
                    if AL
                        ii=loc(M_.exo_names,base.innos(p,:)); %Position of the shock
                        cd(base.setpath(base.models(base.epsilon),:));
                        base.pos_shock(p,base.models(base.epsilon))=ii;
                    else
                        ii=loc(M_.exo_names(inv_lgx_orig_ord_,:),base.innos(p,:)); %Position of the shock
                        cd(base.setpath(base.models(base.epsilon),:));
                        base.pos_shock(p,base.models(base.epsilon))=ii;
                    end
                    
                    if ii==0
                        disp(['No ' deblank(num2str(base.namesshocks(p,:))) ' is available for Model: ' num2str(base.names(base.models(base.epsilon),:))]);
                    else
                        % Computing the IRFs
                        if AL
                            SS=M_.Sigma_e+1e-14*eye(M_.exo_nbr);
                            % cs = transpose(chol(SS)); % this line should be taken later as an option to produce IRFs that are dependent on the covariances where the shock is one standard deviation (as in Dynare)
                            if base.variabledim(base.models(base.epsilon)) ==1
                                cs = eye(size(SS,1)); % this line produces in the end IRF that are independent of any covariance structure. Shocks are one unit shocks. (as in K?ter, Wieland)
                            end
                            if base.variabledim(base.models(base.epsilon)) ==2;
                                cs = eye(size(SS,1))*(1/100); % in case that models are written in percent/100 terms, shocks are 0.01 shocks
                            end
                        else
                            SS(M_.exo_names_orig_ord,M_.exo_names_orig_ord)=M_.Sigma_e+1e-14*eye(M_.exo_nbr);
                            % cs = transpose(chol(SS)); % this line should be taken later as an option to produce IRFs that are dependent on the covariances where the shock is one standard deviation (as in Dynare)
                            if base.variabledim(base.models(base.epsilon)) ==1
                                cs = eye(size(SS,1)); % this line produces in the end IRF that are independent of any covariance structure. Shocks are one unit shocks. (as in K?ter, Wieland)
                            end
                            if base.variabledim(base.models(base.epsilon)) ==2
                                cs = eye(size(SS,1))*(1/100); % in case that models are written in percent/100 terms, shocks are 0.01 shocks
                            end
                        end
                        if AL
                            R=irf_AL_alt_gain(oo_.dr,cs(:,ii), options_.irf, base.AL_,gain);
                            R(oo_.dr.order_var,:) = R;
                        else
                            R=irf(oo_.dr,cs(M_.exo_names_orig_ord,ii), options_.irf, options_.drop, options_.replic, options_.order);
                        end
                        base.IRF.(num2str(deblank(base.rulenamesshort1(base.l,:))))(:,:,p) = [zeros(size(R,1),1),R];
                        base.IRFendo_names.(num2str(deblank(base.rulenamesshort1(base.l,:))))(:,:)=M_.endo_names;
                    end;
                end;
            end;
        else
            base.IRF.(num2str(deblank(base.rulenamesshort1(base.l,:)))) = [];
            base.IRFendo_names.(num2str(deblank(base.rulenamesshort1(base.l,:))))= [];
        end
    end
end
if AL
    if ~isempty(str2num(d_version([1 3])))
        if str2num(d_version([1 3]))==42
            copyfile([location '\ALTOOL\dr1.m'],[location '\ALTOOL\dr1_AL.m']);
        elseif  str2num(d_version([1 3]))>42 && str2num(d_version([1 3]))<45
            copyfile([location '\ALTOOL\stochastic_solvers.m'],[location '\ALTOOL\stochastic_solvers_AL_Dynare_' d_version([1 3]) '.m']);
        end
    else
        copyfile([location '\ALTOOL\stochastic_solvers.m'],[location '\ALTOOL\stochastic_solvers_AL_Dynare_45.m']);
    end
end

delete *_dynamic.m
delete *_static.m
delete *.log    
delete *_set_auxiliary_variables.m
delete *_results.mat

