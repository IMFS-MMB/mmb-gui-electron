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

  AL=base.AL; % MODELBASE Change
  warning('off','all')

  location = pwd;
  d_version=dynare_version;

  if ~isempty(str2num(d_version([1 3])))
    if str2num(d_version([1 3]))==42 % for dynare versions higher than 4.2.0 and AL Models, we have modeifed the dr1.m of dynare(basically by storing the model jacobian)
      if exist([location  filesep 'ALTOOL' filesep 'dr1_AL.m'], 'file')==2
        copyfile([location  filesep 'ALTOOL' filesep 'dr1_AL.m'],[location  filesep 'ALTOOL' filesep 'dr1.m']);
      end
    elseif str2num(d_version([1 3]))>42 && str2num(d_version([1 3]))<45 % for dynare versions higher than 4.3.0 and AL Models, we have modeifed the stochastic_solvers.m of dynare(basically by storing the model jacobian)
      if exist([location  filesep 'ALTOOL' filesep 'stochastic_solvers_AL_Dynare_' d_version([1 3]) '.m'], 'file')==2
        copyfile([location  filesep 'ALTOOL' filesep 'stochastic_solvers_AL_Dynare_' d_version([1 3]) '.m'],[location  filesep 'ALTOOL' filesep 'stochastic_solvers.m']);
      end
    elseif str2num(d_version([1 3]))>44  % for dynare versions higher than 4.4.* and AL Models, we have to use the modeifed stochastic_solvers.m of dynare(basically by storing the model jacobian)
      if exist([location  filesep 'ALTOOL' filesep 'stochastic_solvers_AL_Dynare_45.m'], 'file')==2
        copyfile([location  filesep 'ALTOOL' filesep 'stochastic_solvers_AL_Dynare_45.m'],[location  filesep 'ALTOOL' filesep 'stochastic_solvers.m']);
      end
    end
  else % for unstable (not numbered) versions of dynare versions higher than 4.5 and AL Models, we have modeifed the stochastic_solvers.m of dynare(basically by storing the model jacobian)
    if exist([location  filesep 'ALTOOL' filesep 'stochastic_solvers_AL_Dynare_45.m'], 'file')==2
        copyfile([location  filesep 'ALTOOL' filesep 'stochastic_solvers_AL_Dynare_45.m'],[location  filesep 'ALTOOL' filesep 'stochastic_solvers.m']);
    end
  end

  if AL % MODELBASE change
    gain=base.gain;
    AL_=base.AL_;
  end

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
        %shocks= M_.exo_names(M_.exo_names_orig_ord,:);
        shocks= M_.exo_names{M_.exo_names_orig_ord,:};
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
      [oo_.dr, info] = resol_MMB(oo_.steady_state,0); % solve
    elseif (strcmp(dynare_version, '4.3.0') || strcmp(dynare_version, '4.3.1') || strcmp(dynare_version, '4.3.2') || strcmp(dynare_version, '4.3.3')  )
      oo_.dr=set_state_space(dr,M_);
      [oo_.dr,info] = resol_MMB(0,M_,options_,oo_); %solve
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

      [oo_.dr,info,M_,options_,oo_] = resol_MMB(0,M_,options_,oo_); %solve
    end

    % The follwoing if clause matters when the Dynare version is higher than
    % 4.4.1.
    if options_.loglinear
        oo_.dr.ys=log(oo_.dr.ys);
        oo_.steady_state=log(oo_.steady_state);
        options_old.logged_steady_state = 1;
    end

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
      base.info(rule_number) = info(1);
      base.solution=1;

      %Theoretical ACFs and Variances
      nvar  = length(oo_.dr.order_var);
      ivar  = transpose(1:nvar);
      options_.irf = base.horizon; % horizon for ACFs

      if AL       % HAVE TO REMEMBER MAKE R_sim IN DECLARATION ORDER!
        n_sims = 25;
        len_sim = 500;
        R_sim = zeros(nvar,len_sim,n_sims);
        Covar = zeros(nvar,nvar,n_sims);
        for j = 1:n_sims;
          R_sim(:,:,j) = sim_AL_alt_gain(oo_.dr,len_sim,AL_,gain);
          % Re-ordering into declaration order
          R_sim(oo_.dr.order_var,:,j) = R_sim(:,:,j);
          Covar(:,:,j) = cov(R_sim(:,:,j)');
        end
        oo_.var = mean(Covar,3);
      else
        [Gamma_y,stationary_vars] = th_autocovariances(oo_.dr,ivar,M_,options_,1);
        oo_.var = Gamma_y{1}; % Variances
      end

      if AL
        base.VAR =oo_.var;
        base.VARendo_names=M_.endo_names;
      else
        base.VAR =Gamma_y{1};
        base.VARendo_names=M_.endo_names;
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

      base.AUTR(:,:)=[ones(size(R,1),1),R];
      base.AUTendo_names(:,:)=M_.endo_names(ivar,:);

      options_.irf = base.horizon; % horizon for IRFs
      shocks = M_.exo_names(M_.exo_names_orig_ord,:);  % put shocks in the right order for Dynare
      inv_lgx_orig_ord_(M_.exo_names_orig_ord)=(1:M_.exo_nbr)'; % save the order

      for p=1:size(base.innos,1)
         inno = base.innos(p,:);

        if AL
             if str2num(d_version([1 3])) < 46  % changed for dynare 4.6
               ii=loc(M_.exo_names, inno); %Position of the shock
             else 
               ii=find(strcmp(M_.exo_names, deblank(inno)));%Position of the shock
               if isempty(ii)
                   ii=0;
               end
             end
        else
             if str2num(d_version([1 3])) < 46  % changed for dynare 4.6
               ii=loc(M_.exo_names(inv_lgx_orig_ord_,:), inno); %Position of the shock
             else 
               ii=find(strcmp(M_.exo_names(inv_lgx_orig_ord_,:), deblank(inno)));%Position of the shock
               if isempty(ii)
                   ii=0;
               end
             end
        end

        base.pos_shock(p,base.models(base.epsilon))=ii;

        if ii==0
          disp([inno ' is unavailable for this model: ']);
        else
          if base.variabledim(base.models(base.epsilon)) == 1
            vdim = 1;
          elseif base.variabledim(base.models(base.epsilon)) == 2;
            vdim = 1/100; % in case that models are written in percent/100 terms, shocks are 0.01 shocks
          end

          % Computing the IRFs
          if AL
            SS=M_.Sigma_e+1e-14*eye(M_.exo_nbr);
          else
            SS(M_.exo_names_orig_ord,M_.exo_names_orig_ord)=M_.Sigma_e+1e-14*eye(M_.exo_nbr);
          end

          cs = eye(size(SS,1))*vdim; % in case that models are written in percent/100 terms, shocks are 0.01 shocks

          if AL
            R=irf_AL_alt_gain(oo_.dr,cs(:,ii), options_.irf, base.AL_,gain);
            R(oo_.dr.order_var,:) = R;
          else
              if  str2num(d_version([1 3])) < 46;  % changed for dynare 4.6
                R=irf(oo_.dr,cs(M_.exo_names_orig_ord,ii), options_.irf, options_.drop, options_.replic, options_.order);
              else
                R=irf(M_, options_,oo_.dr,cs(M_.exo_names_orig_ord,ii), options_.irf, options_.drop, options_.replic, options_.order);
              end
              
          end
          base.IRF(:,:,p) = [zeros(size(R,1),1),R];
          base.IRFendo_names(:,:)=M_.endo_names;
        end
      end
    end
  end

  if AL
    if ~isempty(str2num(d_version([1 3])))
      if str2num(d_version([1 3]))==42
        copyfile([location  filesep 'ALTOOL' filesep 'dr1.m'],[location  filesep 'ALTOOL' filesep 'dr1_AL.m']);
      elseif str2num(d_version([1 3]))>42 && str2num(d_version([1 3]))<45
        copyfile([location  filesep 'ALTOOL' filesep 'stochastic_solvers.m'],[location  filesep 'ALTOOL' filesep 'stochastic_solvers_AL_Dynare_' d_version([1 3]) '.m']);
      end
    else
      copyfile([location  filesep 'ALTOOL' filesep 'stochastic_solvers.m'],[location  filesep 'ALTOOL' filesep 'stochastic_solvers_AL_Dynare_45.m']);
    end
  end

  % delete('*_dynamic.m');
  % delete('*_static.m');
  % delete('*.log');
  % delete('*_set_auxiliary_variables.m');
  % delete('*_results.mat');
  % delete('*.eps');
  % delete('*.fig');
  % delete('*.pdf');
  % delete('*.png');
  % delete([strtrim(deblank(base.names((base.models(base.epsilon)),:))),'.m']);
  % rmdir(strtrim(deblank(base.names((base.models(base.epsilon)),:))), 's')
end
