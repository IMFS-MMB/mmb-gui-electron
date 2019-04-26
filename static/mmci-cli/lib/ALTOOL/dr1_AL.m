function [dr,info,M_,options_,oo_] = dr1(dr,task,M_,options_,oo_)
% function [dr,info,M_,options_,oo_] = dr1(dr,task,M_,options_,oo_)
% computes the reduced form solution of a rational expectation model (first or second order
% approximation of the stochastic model around the deterministic steady state). 
%
% INPUTS
%   dr         [matlab structure] Decision rules for stochastic simulations.
%   task       [integer]          if task = 0 then dr1 computes decision rules.
%                                 if task = 1 then dr1 computes eigenvalues.
%   M_         [matlab structure] Definition of the model.           
%   options_   [matlab structure] Global options.
%   oo_        [matlab structure] Results 
%    
% OUTPUTS
%   dr         [matlab structure] Decision rules for stochastic simulations.
%   info       [integer]          info=1: the model doesn't define current variables uniquely
%                                 info=2: problem in mjdgges.dll info(2) contains error code. 
%                                 info=3: BK order condition not satisfied info(2) contains "distance"
%                                         absence of stable trajectory.
%                                 info=4: BK order condition not satisfied info(2) contains "distance"
%                                         indeterminacy.
%                                 info=5: BK rank condition not satisfied.
%                                 info=6: The jacobian matrix evaluated at the steady state is complex.        
%   M_         [matlab structure]            
%   options_   [matlab structure]
%   oo_        [matlab structure]
%  
% ALGORITHM
%   ...
%    
% SPECIAL REQUIREMENTS
%   none.
%  

% Copyright (C) 1996-2011 Dynare Team
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

lead_lag_incidence = M_.lead_lag_incidence;

info = 0;

if M_.maximum_endo_lag == 0 && options_.order > 1
    error(['2nd and 3rd order approximation not implemented for purely forward models'])
end

if options_.k_order_solver;
    dr = set_state_space(dr,M_);
    [dr,info] = k_order_pert(dr,M_,options_,oo_);
    oo_.dr = dr;
    return;
end

xlen = M_.maximum_endo_lead + M_.maximum_endo_lag + 1;
klen = M_.maximum_endo_lag + M_.maximum_endo_lead + 1;
iyv = lead_lag_incidence';
iyv = iyv(:);
iyr0 = find(iyv) ;
it_ = M_.maximum_lag + 1 ;

if M_.exo_nbr == 0
    oo_.exo_steady_state = [] ;
end

% expanding system for Optimal Linear Regulator
if options_.ramsey_policy
    if isfield(M_,'orig_model')
        orig_model = M_.orig_model;
        M_.endo_nbr = orig_model.endo_nbr;
        M_.orig_endo_nbr = orig_model.orig_endo_nbr;
        M_.aux_vars = orig_model.aux_vars;
        M_.endo_names = orig_model.endo_names;
        M_.lead_lag_incidence = orig_model.lead_lag_incidence;
        M_.maximum_lead = orig_model.maximum_lead;
        M_.maximum_endo_lead = orig_model.maximum_endo_lead;
        M_.maximum_lag = orig_model.maximum_lag;
        M_.maximum_endo_lag = orig_model.maximum_endo_lag;
        oo_.steady_state = oo_.steady_state(1:M_.endo_nbr);
    end

    if options_.steadystate_flag
        k_inst = [];
        instruments = options_.instruments;
        for i = 1:size(instruments,1)
            k_inst = [k_inst; strmatch(options_.instruments(i,:), ...
                                       M_.endo_names,'exact')];
        end
        ys = oo_.steady_state;
        [inst_val,info1] = dynare_solve('dyn_ramsey_static_', ...
                                        oo_.steady_state(k_inst),0, ...
                                        M_,options_,oo_,it_);
        M_.params = evalin('base','M_.params;');
        ys(k_inst) = inst_val;
        [x,check] = feval([M_.fname '_steadystate'],...
                          ys,[oo_.exo_steady_state; ...
                            oo_.exo_det_steady_state]);
        M_.params = evalin('base','M_.params;');
        if size(x,1) < M_.endo_nbr 
            if length(M_.aux_vars) > 0
                x = add_auxiliary_variables_to_steadystate(x,M_.aux_vars,...
                                                           M_.fname,...
                                                           oo_.exo_steady_state,...
                                                           oo_.exo_det_steady_state,...
                                                           M_.params,...
                                                           options_.bytecode);
            else
                error([M_.fname '_steadystate.m doesn''t match the model']);
            end
        end
        oo_.steady_state = x;
        [junk,junk,multbar] = dyn_ramsey_static_(oo_.steady_state(k_inst),M_,options_,oo_,it_);
    else
        [oo_.steady_state,info1] = dynare_solve('dyn_ramsey_static_', ...
                                                oo_.steady_state,0,M_,options_,oo_,it_);
        [junk,junk,multbar] = dyn_ramsey_static_(oo_.steady_state,M_,options_,oo_,it_);
    end
    
    check1 = max(abs(feval([M_.fname '_static'],...
                           oo_.steady_state,...
                           [oo_.exo_steady_state; ...
                        oo_.exo_det_steady_state], M_.params))) > options_.dynatol ;
    if check1
        info(1) = 20;
        info(2) = check1'*check1;
        return
    end
    
    [jacobia_,M_,dr] = dyn_ramsey_dynamic_(oo_.steady_state,multbar,M_,options_,dr,it_);
    klen = M_.maximum_lag + M_.maximum_lead + 1;
    dr.ys = [oo_.steady_state;zeros(M_.exo_nbr,1);multbar];
    oo_.steady_state = dr.ys;
    lead_lag_incidence = M_.lead_lag_incidence;
else
    klen = M_.maximum_lag + M_.maximum_lead + 1;
    iyv = M_.lead_lag_incidence';
    iyv = iyv(:);
    iyr0 = find(iyv) ;
    it_ = M_.maximum_lag + 1 ;
    
    if M_.exo_nbr == 0
        oo_.exo_steady_state = [] ;
    end
    
    it_ = M_.maximum_lag + 1;
    z = repmat(dr.ys,1,klen);
    if ~options_.bytecode
        z = z(iyr0) ;
    end;
    if options_.order == 1
        if (options_.bytecode)
            [chck, junk, loc_dr] = bytecode('dynamic','evaluate', z,[oo_.exo_simul ...
                                oo_.exo_det_simul], M_.params, dr.ys, 1);
            jacobia_ = [loc_dr.g1 loc_dr.g1_x loc_dr.g1_xd];
        else
            [junk,jacobia_] = feval([M_.fname '_dynamic'],z,[oo_.exo_simul ...
                                oo_.exo_det_simul], M_.params, dr.ys, it_);
        end;
    elseif options_.order == 2
        if (options_.bytecode)
            [chck, junk, loc_dr] = bytecode('dynamic','evaluate', z,[oo_.exo_simul ...
                                oo_.exo_det_simul], M_.params, dr.ys, 1);
            jacobia_ = [loc_dr.g1 loc_dr.g1_x];
        else
            [junk,jacobia_,hessian1] = feval([M_.fname '_dynamic'],z,...
                                             [oo_.exo_simul ...
                                oo_.exo_det_simul], M_.params, dr.ys, it_);
        end;
        if options_.use_dll
            % In USE_DLL mode, the hessian is in the 3-column sparse representation
            hessian1 = sparse(hessian1(:,1), hessian1(:,2), hessian1(:,3), ...
                              size(jacobia_, 1), size(jacobia_, 2)*size(jacobia_, 2));
        end
    end
end

if options_.debug
    save([M_.fname '_debug.mat'],'jacobia_')
end

if ~isreal(jacobia_)
    if max(max(abs(imag(jacobia_)))) < 1e-15
        jacobia_ = real(jacobia_);
    else
        info(1) = 6;
        info(2) = sum(sum(imag(jacobia_).^2));
        return
    end
end

dr=set_state_space(dr,M_);
kstate = dr.kstate;
kad = dr.kad;
kae = dr.kae;
nstatic = dr.nstatic;
nfwrd = dr.nfwrd;
npred = dr.npred;
nboth = dr.nboth;
order_var = dr.order_var;
nd = size(kstate,1);
nz = nnz(lead_lag_incidence);

sdyn = M_.endo_nbr - nstatic;

[junk,cols_b,cols_j] = find(lead_lag_incidence(M_.maximum_endo_lag+1, ...
                                                  order_var));
b = zeros(M_.endo_nbr,M_.endo_nbr);
b(:,cols_b) = jacobia_(:,cols_j);

dr.jacobia = jacobia_;

if M_.maximum_endo_lead == 0
    % backward models: simplified code exist only at order == 1
    % If required, use AIM solver if not check only
    if options_.order > 1
        error(['2nd and 3rd order approximation not implemented for purely ' ...
               'backward models'])
    end
    if (options_.aim_solver == 1) && (task == 0)
        if options_.order > 1
            error('Option "aim_solver" is incompatible with order >= 2')
        end
        try
            [dr,aimcode]=dynAIMsolver1(jacobia_,M_,dr);
            if aimcode ~=1
                info(1) = convertAimCodeToInfo(aimcode);
                info(2) = 1.0e+8;
                return
            end
        catch
            disp(lasterror.message)
            error('Problem with AIM solver - Try to remove the "aim_solver" option');
        end
    else % use original Dynare solver
        [k1,junk,k2] = find(kstate(:,4));
        dr.ghx(:,k1) = -b\jacobia_(:,k2);
        % with simul, the Jacobian doesn't contain derivatives w.r. to shocks
        if size(jacobia_,2) > nz
            dr.ghu = -b\jacobia_(:,nz+1:end);
        end
    end % if not use AIM or not...
    dr.eigval = eig(transition_matrix(dr));
    dr.rank = 0;
    if any(abs(dr.eigval) > options_.qz_criterium)
        temp = sort(abs(dr.eigval));
        nba = nnz(abs(dr.eigval) > options_.qz_criterium);
        temp = temp(nd-nba+1:nd)-1-options_.qz_criterium;
        info(1) = 3;
        info(2) = temp'*temp;
    end
    if options_.loglinear == 1
        klags = find(lead_lag_incidence(1,:));
        dr.ghx = repmat(1./dr.ys,1,size(dr.ghx,2)).*dr.ghx.* ...
                 repmat(dr.ys(klags),size(dr.ghx,1),1);
        dr.ghu = repmat(1./dr.ys,1,size(dr.ghu,2)).*dr.ghu;
    end
    return
end

%forward--looking models
if nstatic > 0
    [Q,R] = qr(b(:,1:nstatic));
    aa = Q'*jacobia_;
else
    aa = jacobia_;
end

% If required, use AIM solver if not check only
if (options_.aim_solver == 1) && (task == 0)
    if options_.order > 1
        error('Option "aim_solver" is incompatible with order >= 2')
    end
    try
        [dr,aimcode]=dynAIMsolver1(aa,M_,dr);

        % reuse some of the bypassed code and tests that may be needed 
        
        if aimcode ~=1
            info(1) = convertAimCodeToInfo(aimcode);
            info(2) = 1.0e+8;
            return
        end
        [A,B] =transition_matrix(dr);
        dr.eigval = eig(A);
        sdim = sum( abs(dr.eigval) < options_.qz_criterium );
        nba = nd-sdim;

        nyf = sum(kstate(:,2) > M_.maximum_endo_lag+1);
        if nba ~= nyf
            temp = sort(abs(dr.eigval));
            if nba > nyf
                temp = temp(nd-nba+1:nd-nyf)-1-options_.qz_criterium;
                info(1) = 3;
            elseif nba < nyf;
                temp = temp(nd-nyf+1:nd-nba)-1-options_.qz_criterium;
                info(1) = 4;
            end
            info(2) = temp'*temp;
            return
        end
    catch
        disp(lasterror.message)
        error('Problem with AIM solver - Try to remove the "aim_solver" option')
    end
else  % use original Dynare solver
    k1 = lead_lag_incidence(find([1:klen] ~= M_.maximum_endo_lag+1),:);
    a = aa(:,nonzeros(k1'));
    b(:,cols_b) = aa(:,cols_j);
    b10 = b(1:nstatic,1:nstatic);
    b11 = b(1:nstatic,nstatic+1:end);
    dr.C = - b10 \ b11;
    b2 = b(nstatic+1:end,nstatic+1:end);
    if any(isinf(a(:)))
        info = 1;
        return
    end

    % buildind D and E
    d = zeros(nd,nd) ;
    e = d ;

    k = find(kstate(:,2) >= M_.maximum_endo_lag+2 & kstate(:,3));
    d(1:sdyn,k) = a(nstatic+1:end,kstate(k,3)) ;
    k1 = find(kstate(:,2) == M_.maximum_endo_lag+2);
    e(1:sdyn,k1) =  -b2(:,kstate(k1,1)-nstatic);
    k = find(kstate(:,2) <= M_.maximum_endo_lag+1 & kstate(:,4));
    e(1:sdyn,k) = -a(nstatic+1:end,kstate(k,4)) ;
    k2 = find(kstate(:,2) == M_.maximum_endo_lag+1);
    k2 = k2(~ismember(kstate(k2,1),kstate(k1,1)));
    d(1:sdyn,k2) = b2(:,kstate(k2,1)-nstatic);

    if ~isempty(kad)
        for j = 1:size(kad,1)
            d(sdyn+j,kad(j)) = 1 ;
            e(sdyn+j,kae(j)) = 1 ;
        end
    end

    % 1) if mjdgges.dll (or .mexw32 or ....) doesn't exit, 
    % matlab/qz is added to the path. There exists now qz/mjdgges.m that 
    % contains the calls to the old Sims code 
    % 2) In  global_initialization.m, if mjdgges.m is visible exist(...)==2, 
    % this means that the DLL isn't avaiable and use_qzdiv is set to 1
    
    [err,ss,tt,w,sdim,dr.eigval,info1] = mjdgges(e,d,options_.qz_criterium);
    mexErrCheck('mjdgges', err);

    if info1
        if info1 == -30
            info(1) = 7;
        else
            info(1) = 2;
            info(2) = info1;
            info(3) = size(e,2);
        end
        return
    end

    nba = nd-sdim;

    nyf = sum(kstate(:,2) > M_.maximum_endo_lag+1);

    if task == 1
        dr.rank = rank(w(1:nyf,nd-nyf+1:end));
        % Under Octave, eig(A,B) doesn't exist, and
        % lambda = qz(A,B) won't return infinite eigenvalues
        if ~exist('OCTAVE_VERSION')
            dr.eigval = eig(e,d);
        end
        return
    end

    if nba ~= nyf
        sorted_roots = sort(abs(dr.eigval));
        if isfield(options_,'indeterminacy_continuity')
            if options_.indeterminacy_msv == 1
                [ss,tt,w,q] = qz(e',d');
                [ss,tt,w,q] = reorder(ss,tt,w,q);
                ss = ss';
                tt = tt';
                w  = w';
                nba = nyf;
            end
        else
            if nba > nyf
                temp = sorted_roots(nd-nba+1:nd-nyf)-1-options_.qz_criterium;
                info(1) = 3;
            elseif nba < nyf;
                temp = sorted_roots(nd-nyf+1:nd-nba)-1-options_.qz_criterium;
                info(1) = 4;
            end
            info(2) = temp'*temp;
            return
        end
    end

    np = nd - nyf;
    n2 = np + 1;
    n3 = nyf;
    n4 = n3 + 1;
    % derivatives with respect to dynamic state variables
    % forward variables
    w1 =w(1:n3,n2:nd);
    if ~isscalar(w1) && (condest(w1) > 1e9)
        % condest() fails on a scalar under Octave
        info(1) = 5;
        info(2) = condest(w1);
        return;
    else
        gx = -w1'\w(n4:nd,n2:nd)';
    end  

    % predetermined variables
    hx = w(1:n3,1:np)'*gx+w(n4:nd,1:np)';
    hx = (tt(1:np,1:np)*hx)\(ss(1:np,1:np)*hx);

    k1 = find(kstate(n4:nd,2) == M_.maximum_endo_lag+1);
    k2 = find(kstate(1:n3,2) == M_.maximum_endo_lag+2);
    dr.ghx = [hx(k1,:); gx(k2(nboth+1:end),:)];

    %lead variables actually present in the model
    j3 = nonzeros(kstate(:,3));
    j4  = find(kstate(:,3));
    % derivatives with respect to exogenous variables
    if M_.exo_nbr
        fu = aa(:,nz+(1:M_.exo_nbr));
        a1 = b;
        aa1 = [];
        if nstatic > 0
            aa1 = a1(:,1:nstatic);
        end
        dr.ghu = -[aa1 a(:,j3)*gx(j4,1:npred)+a1(:,nstatic+1:nstatic+ ...
                                                 npred) a1(:,nstatic+npred+1:end)]\fu;
    else
        dr.ghu = [];
    end

    % static variables
    if nstatic > 0
        temp = -a(1:nstatic,j3)*gx(j4,:)*hx;
        j5 = find(kstate(n4:nd,4));
        temp(:,j5) = temp(:,j5)-a(1:nstatic,nonzeros(kstate(:,4)));
        temp = b10\(temp-b11*dr.ghx);
        dr.ghx = [temp; dr.ghx];
        temp = [];
    end
end % if not use AIM and ....
    % End of if... and if not... main AIM Blocks, continue as per usual...

if options_.loglinear == 1
    k = find(dr.kstate(:,2) <= M_.maximum_endo_lag+1);
    klag = dr.kstate(k,[1 2]);
    k1 = dr.order_var;
    
    dr.ghx = repmat(1./dr.ys(k1),1,size(dr.ghx,2)).*dr.ghx.* ...
             repmat(dr.ys(k1(klag(:,1)))',size(dr.ghx,1),1);
    dr.ghu = repmat(1./dr.ys(k1),1,size(dr.ghu,2)).*dr.ghu;
end

if options_.aim_solver ~= 1 && options_.use_qzdiv
    %% Necessary when using Sims' routines for QZ
    gx = real(gx);
    hx = real(hx);
    dr.ghx = real(dr.ghx);
    dr.ghu = real(dr.ghu);
end

%exogenous deterministic variables
if M_.exo_det_nbr > 0
    f1 = sparse(jacobia_(:,nonzeros(lead_lag_incidence(M_.maximum_endo_lag+2:end,order_var))));
    f0 = sparse(jacobia_(:,nonzeros(lead_lag_incidence(M_.maximum_endo_lag+1,order_var))));
    fudet = sparse(jacobia_(:,nz+M_.exo_nbr+1:end));
    M1 = inv(f0+[zeros(M_.endo_nbr,nstatic) f1*gx zeros(M_.endo_nbr,nyf-nboth)]);
    M2 = M1*f1;
    dr.ghud = cell(M_.exo_det_length,1);
    dr.ghud{1} = -M1*fudet;
    for i = 2:M_.exo_det_length
        dr.ghud{i} = -M2*dr.ghud{i-1}(end-nyf+1:end,:);
    end
end

if options_.order == 1
    return
end

% Second order
k1 = nonzeros(lead_lag_incidence(:,order_var)');
kk = [k1; length(k1)+(1:M_.exo_nbr+M_.exo_det_nbr)'];
nk = size(kk,1);
kk1 = reshape([1:nk^2],nk,nk);
kk1 = kk1(kk,kk);
hessian = hessian1(:,kk1(:));
clear hessian1

zx = zeros(np,np);
zu=zeros(np,M_.exo_nbr);
zx(1:np,:)=eye(np);
k0 = [1:M_.endo_nbr];
gx1 = dr.ghx;
hu = dr.ghu(nstatic+[1:npred],:);
k0 = find(lead_lag_incidence(M_.maximum_endo_lag+1,order_var)');
zx = [zx; gx1(k0,:)];
zu = [zu; dr.ghu(k0,:)];
k1 = find(lead_lag_incidence(M_.maximum_endo_lag+2,order_var)');
zu = [zu; gx1(k1,:)*hu];
zx = [zx; gx1(k1,:)*hx];
zx=[zx; zeros(M_.exo_nbr,np);zeros(M_.exo_det_nbr,np)];
zu=[zu; eye(M_.exo_nbr);zeros(M_.exo_det_nbr,M_.exo_nbr)];
[nrzx,nczx] = size(zx);

[err, rhs] = sparse_hessian_times_B_kronecker_C(hessian,zx,options_.threads.kronecker.sparse_hessian_times_B_kronecker_C);
mexErrCheck('sparse_hessian_times_B_kronecker_C', err);
rhs = -rhs;

%lhs
n = M_.endo_nbr+sum(kstate(:,2) > M_.maximum_endo_lag+1 & kstate(:,2) < M_.maximum_endo_lag+M_.maximum_endo_lead+1);
A = zeros(M_.endo_nbr,M_.endo_nbr);
B = zeros(M_.endo_nbr,M_.endo_nbr);
A(:,k0) = jacobia_(:,nonzeros(lead_lag_incidence(M_.maximum_endo_lag+1,order_var)));
% variables with the highest lead
k1 = find(kstate(:,2) == M_.maximum_endo_lag+2);
% Jacobian with respect to the variables with the highest lead
fyp = jacobia_(:,kstate(k1,3)+nnz(M_.lead_lag_incidence(M_.maximum_endo_lag+1,:)));
B(:,nstatic+npred-dr.nboth+1:end) = fyp;
offset = M_.endo_nbr;
gx1 = dr.ghx;
[junk,k1,k2] = find(M_.lead_lag_incidence(M_.maximum_endo_lag+M_.maximum_endo_lead+1,order_var));
A(1:M_.endo_nbr,nstatic+1:nstatic+npred)=...
    A(1:M_.endo_nbr,nstatic+[1:npred])+fyp*gx1(k1,1:npred);
C = hx;
D = [rhs; zeros(n-M_.endo_nbr,size(rhs,2))];


[err, dr.ghxx] = gensylv(2,A,B,C,D);
mexErrCheck('gensylv', err);

%ghxu
%rhs
hu = dr.ghu(nstatic+1:nstatic+npred,:);
[err, rhs] = sparse_hessian_times_B_kronecker_C(hessian,zx,zu,options_.threads.kronecker.sparse_hessian_times_B_kronecker_C);
mexErrCheck('sparse_hessian_times_B_kronecker_C', err);

hu1 = [hu;zeros(np-npred,M_.exo_nbr)];
[nrhx,nchx] = size(hx);
[nrhu1,nchu1] = size(hu1);

[err, abcOut] = A_times_B_kronecker_C(dr.ghxx,hx,hu1,options_.threads.kronecker.A_times_B_kronecker_C);
mexErrCheck('A_times_B_kronecker_C', err);
B1 = B*abcOut;
rhs = -[rhs; zeros(n-M_.endo_nbr,size(rhs,2))]-B1;


%lhs
dr.ghxu = A\rhs;

%ghuu
%rhs
[err, rhs] = sparse_hessian_times_B_kronecker_C(hessian,zu,options_.threads.kronecker.sparse_hessian_times_B_kronecker_C);
mexErrCheck('sparse_hessian_times_B_kronecker_C', err);

[err, B1] = A_times_B_kronecker_C(B*dr.ghxx,hu1,options_.threads.kronecker.A_times_B_kronecker_C);
mexErrCheck('A_times_B_kronecker_C', err);
rhs = -[rhs; zeros(n-M_.endo_nbr,size(rhs,2))]-B1;

%lhs
dr.ghuu = A\rhs;

dr.ghxx = dr.ghxx(1:M_.endo_nbr,:);
dr.ghxu = dr.ghxu(1:M_.endo_nbr,:);
rdr.ghuu = dr.ghuu(1:M_.endo_nbr,:);


% dr.ghs2
% derivatives of F with respect to forward variables
% reordering predetermined variables in diminishing lag order
O1 = zeros(M_.endo_nbr,nstatic);
O2 = zeros(M_.endo_nbr,M_.endo_nbr-nstatic-npred);
LHS = zeros(M_.endo_nbr,M_.endo_nbr);
LHS(:,k0) = jacobia_(:,nonzeros(lead_lag_incidence(M_.maximum_endo_lag+1,order_var)));
RHS = zeros(M_.endo_nbr,M_.exo_nbr^2);
kk = find(kstate(:,2) == M_.maximum_endo_lag+2);
gu = dr.ghu; 
guu = dr.ghuu; 
Gu = [dr.ghu(nstatic+[1:npred],:); zeros(np-npred,M_.exo_nbr)];
Guu = [dr.ghuu(nstatic+[1:npred],:); zeros(np-npred,M_.exo_nbr*M_.exo_nbr)];
E = eye(M_.endo_nbr);
kh = reshape([1:nk^2],nk,nk);
kp = sum(kstate(:,2) <= M_.maximum_endo_lag+1);
E1 = [eye(npred); zeros(kp-npred,npred)];
H = E1;
hxx = dr.ghxx(nstatic+[1:npred],:);
[junk,k2a,k2] = find(M_.lead_lag_incidence(M_.maximum_endo_lag+2,order_var));
k3 = nnz(M_.lead_lag_incidence(1:M_.maximum_endo_lag+1,:))+(1:dr.nsfwrd)';
[err, B1] = sparse_hessian_times_B_kronecker_C(hessian(:,kh(k3,k3)),gu(k2a,:),options_.threads.kronecker.sparse_hessian_times_B_kronecker_C);
mexErrCheck('sparse_hessian_times_B_kronecker_C', err);
RHS = RHS + jacobia_(:,k2)*guu(k2a,:)+B1;

% LHS
LHS = LHS + jacobia_(:,k2)*(E(k2a,:)+[O1(k2a,:) dr.ghx(k2a,:)*H O2(k2a,:)]);
    
RHS = RHS*M_.Sigma_e(:);
dr.fuu = RHS;
%RHS = -RHS-dr.fbias;
RHS = -RHS;
dr.ghs2 = LHS\RHS;

% deterministic exogenous variables
if M_.exo_det_nbr > 0
    hud = dr.ghud{1}(nstatic+1:nstatic+npred,:);
    zud=[zeros(np,M_.exo_det_nbr);dr.ghud{1};gx(:,1:npred)*hud;zeros(M_.exo_nbr,M_.exo_det_nbr);eye(M_.exo_det_nbr)];
    R1 = hessian*kron(zx,zud);
    dr.ghxud = cell(M_.exo_det_length,1);
    kf = [M_.endo_nbr-nyf+1:M_.endo_nbr];
    kp = nstatic+[1:npred];
    dr.ghxud{1} = -M1*(R1+f1*dr.ghxx(kf,:)*kron(dr.ghx(kp,:),dr.ghud{1}(kp,:)));
    Eud = eye(M_.exo_det_nbr);
    for i = 2:M_.exo_det_length
        hudi = dr.ghud{i}(kp,:);
        zudi=[zeros(np,M_.exo_det_nbr);dr.ghud{i};gx(:,1:npred)*hudi;zeros(M_.exo_nbr+M_.exo_det_nbr,M_.exo_det_nbr)];
        R2 = hessian*kron(zx,zudi);
        dr.ghxud{i} = -M2*(dr.ghxud{i-1}(kf,:)*kron(hx,Eud)+dr.ghxx(kf,:)*kron(dr.ghx(kp,:),dr.ghud{i}(kp,:)))-M1*R2;
    end
    R1 = hessian*kron(zu,zud);
    dr.ghudud = cell(M_.exo_det_length,1);
    kf = [M_.endo_nbr-nyf+1:M_.endo_nbr];
    
    dr.ghuud{1} = -M1*(R1+f1*dr.ghxx(kf,:)*kron(dr.ghu(kp,:),dr.ghud{1}(kp,:)));
    Eud = eye(M_.exo_det_nbr);
    for i = 2:M_.exo_det_length
        hudi = dr.ghud{i}(kp,:);
        zudi=[zeros(np,M_.exo_det_nbr);dr.ghud{i};gx(:,1:npred)*hudi;zeros(M_.exo_nbr+M_.exo_det_nbr,M_.exo_det_nbr)];
        R2 = hessian*kron(zu,zudi);
        dr.ghuud{i} = -M2*dr.ghxud{i-1}(kf,:)*kron(hu,Eud)-M1*R2;
    end
    R1 = hessian*kron(zud,zud);
    dr.ghudud = cell(M_.exo_det_length,M_.exo_det_length);
    dr.ghudud{1,1} = -M1*R1-M2*dr.ghxx(kf,:)*kron(hud,hud);
    for i = 2:M_.exo_det_length
        hudi = dr.ghud{i}(nstatic+1:nstatic+npred,:);
        zudi=[zeros(np,M_.exo_det_nbr);dr.ghud{i};gx(:,1:npred)*hudi+dr.ghud{i-1}(kf,:);zeros(M_.exo_nbr+M_.exo_det_nbr,M_.exo_det_nbr)];
        R2 = hessian*kron(zudi,zudi);
        dr.ghudud{i,i} = -M2*(dr.ghudud{i-1,i-1}(kf,:)+...
                              2*dr.ghxud{i-1}(kf,:)*kron(hudi,Eud) ...
                              +dr.ghxx(kf,:)*kron(hudi,hudi))-M1*R2;
        R2 = hessian*kron(zud,zudi);
        dr.ghudud{1,i} = -M2*(dr.ghxud{i-1}(kf,:)*kron(hud,Eud)+...
                              dr.ghxx(kf,:)*kron(hud,hudi))...
            -M1*R2;
        for j=2:i-1
            hudj = dr.ghud{j}(kp,:);
            zudj=[zeros(np,M_.exo_det_nbr);dr.ghud{j};gx(:,1:npred)*hudj;zeros(M_.exo_nbr+M_.exo_det_nbr,M_.exo_det_nbr)];
            R2 = hessian*kron(zudj,zudi);
            dr.ghudud{j,i} = -M2*(dr.ghudud{j-1,i-1}(kf,:)+dr.ghxud{j-1}(kf,:)* ...
                                  kron(hudi,Eud)+dr.ghxud{i-1}(kf,:)* ...
                                  kron(hudj,Eud)+dr.ghxx(kf,:)*kron(hudj,hudi))-M1*R2;
        end
        
    end
end
