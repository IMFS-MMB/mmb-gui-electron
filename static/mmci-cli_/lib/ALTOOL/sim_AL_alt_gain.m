% correct for mu
function filteratt = sim_AL_alt_gain(dr,smpl,AL_,gain)

% This program derives the IRFs for a model with adaptive learning

global M_ options_ oo_


% We are doing constant gain learning
options_.kalman_algo = 203;

% Deriving the initial belifs

tmp = deblank(M_.endo_names(dr.order_var,:));
[~,yf_list] = ismember(deblank(AL_.forwards),tmp);
yf_list = sort(yf_list);
[~,ys_list] = ismember(deblank(AL_.states),tmp);
ys_list = sort(ys_list);
% creating reorder vector
vars        = oo_.dr.order_var(ys_list);
[~,reorder] = sort(ys_list);
[~,reorder_f] = sort(oo_.dr.order_var(yf_list));

options_.ys_list = ys_list;
options_.yf_list = yf_list;
options_.reorder = reorder;
options_.reorder_f = reorder_f;
options_.vars = vars;
if (strcmp(dynare_version, '4.2.0') || strcmp(dynare_version, '4.2.1') || strcmp(dynare_version, '4.2.2') || strcmp(dynare_version, '4.2.4')...
        || strcmp(dynare_version, '4.2.5'))
    [T,R,SState,info] = dynare_resolve;
elseif (strcmp(dynare_version, '4.3.0') || strcmp(dynare_version, '4.3.1') || strcmp(dynare_version, '4.3.2') || strcmp(dynare_version, '4.3.3'))
    [T,R,SState,info] = dynare_resolve(M_,options_,oo_);
else
    [T,R,SState,info] = dynare_resolve(M_,options_,oo_);
end


Q = M_.Sigma_e + 1.e-14;
RQ = R * chol(Q);
nx = size(Q,1);

[betamat,SecMom] = BetaFromTR(T,R,Q);
% In case I restrict myself to MSV learning, the nexst step could be
% skipped
[T,R] = TRFromBeta(betamat);

% Variables needed to control the simulations
projection_facility = 0;
exits = 0;
[~,exit_var_loc] = ismember({'inflationq','interest','output','outputgap'},tmp);
exit_var_loc = nonzeros(exit_var_loc);
 
% The version of the lyapunov_symm.m to be called depends on the dynare version
d_version=dynare_version;
if ~isempty(str2num(d_version([1 3]))) 
    if str2num(d_version([1 3]))<=44 %
        tmp = sqrt(diag(lyapunov_symm(T,R*Q*R',options_.qz_criterium,options_.lyapunov_complex_threshold)));
    else
        tmp = sqrt(diag(lyapunov_symm(T,R*Q*R',0,options_.qz_criterium,options_.lyapunov_complex_threshold)));
    end                              
else
    tmp = sqrt(diag(lyapunov_symm(T,R*Q*R',0,options_.qz_criterium,options_.lyapunov_complex_threshold)));
end

tmp = tmp(exit_var_loc);

% gain = 0.0;

if options_.kalman_algo > 200 % betamat is just the slopes, need to add
    % proper intercepts to the beliefs. SecMom is constructed as a
    % variance-covariance matrix, if there's a constant we have to turn it
    % into 2nd moments by adding outer product of means vector
    means = SState(oo_.dr.order_var);
    const = means(options_.yf_list) - betamat' * means(ys_list);
    betamat = [const'; betamat];
    SM = zeros(size(SecMom,1)+1);
    SM(2:end,2:end) = SecMom + means(ys_list) * means(ys_list)';
    SM(1,1) = 1;
    SM(2:end,1) = means(ys_list);
    SM(1,2:end) = means(ys_list)';
    SecMom = SM;
end

ridge = 1e-06;
ridge_adj = 1;
smsize = size(SecMom,1);
nk = 4;

N           = length(SState);
mu_in       = (eye(N) - T) * SState(oo_.dr.order_var);
mu          = mu_in;
Y_init      = SState(oo_.dr.order_var);
a           = Y_init * ones(1,smpl+1);
aK          = zeros(nk,N,smpl+1);
filteratt   = Y_init * ones(1,smpl);

bet = zeros(length(ys_list)+1,length(yf_list),smpl);
bet(:,:,1) = betamat;

% Matrix A_0 from the jacobia_ variable.
LG = zeros(size(oo_.dr.jacobia,1));
% Need to re-sort the columns (originally in alpha order) into order_var.
LG(:,sort(oo_.dr.order_var(oo_.dr.nstatic+1:oo_.dr.nstatic+oo_.dr.npred))) = ...
    oo_.dr.jacobia(:,1:oo_.dr.npred);
% Preparations to construct matrix A_2 * betamat
EXP = zeros(size(oo_.dr.jacobia,1));
% A list of ALL variables present on the RHS of forecasting equations, in
% order_var
% fwd_sort = sort(oo_.dr.order_var(N-oo_.dr.nsfwrd+1:end));
% the same as oo_.dr.order_var(yf_list), if list of forwards is correct
fwd_sort = oo_.dr.order_var(yf_list);
% vars = oo_.dr.order_var(sort([ys_list; shock_list]));
fw = size(oo_.dr.jacobia,2) - nx;
t_vars = oo_.dr.npred+1:fw-oo_.dr.nsfwrd;
% A_1 matrix of the jacobia_ variable. Used only in its original order
% (columns alpha)
A1 = oo_.dr.jacobia(:,t_vars);
% matrix A_2 from jacobian, used only in its original (alpha) form.
A2 = oo_.dr.jacobia(:,fw-oo_.dr.nsfwrd+1:fw);
% matrix A_2_full is useful in updating the constant
A2_full = zeros(N);
A2_full(:,fwd_sort) = A2;
% Matrix which multiplies innovations in jacobia_
B  = oo_.dr.jacobia(:,fw+1:end);

t = 0;
while t<smpl
    t = t+1;
    % Generating the fictional data
    if t == 1
        tmp_vars = mu + T * Y_init + RQ * randn(nx,1);
    else
        tmp_vars = mu + T * tmp_vars + RQ * randn(nx,1);
    end
    % Alternative specification: all variables are given by simulation
    % alone
    filteratt(:,t) = tmp_vars;
    a(:,t+1)    = mu + T * filteratt(:,t);
    aK(1,:,t+1) 	 	= a(:,t+1);
    for jnk=2:nk
        aK(jnk,:,t+jnk) = (mu + T * aK(jnk-1,:,t+jnk-1)')';
    end
    if t > 1
        z = filteratt(ys_list,t-1);
    else
        z = Y_init(ys_list);
    end
    if options_.kalman_algo > 200
        z = [1; z];
    end
    err = filteratt(yf_list,t) - betamat' * z;
    bet(:,:,t+1) = betamat;
    % learning will explode if the 2nd moments matrix is allowed to
    % update?
    SecMom_New = SecMom + gain * (z * z' - SecMom);
    if min(abs(eig(SecMom_New))) < ridge
        SecMom_New = SecMom_New + ridge / ridge_adj * eye(smsize);
    end
    betamat_New = betamat + gain * (SecMom_New \ (z * err'));
    if options_.kalman_algo > 200
        betama_ = betamat_New(2:end,:)';
    else
        betama_ = betamat_New(1:end,:)';
    end
    betama_ = betama_(reorder_f,reorder);
    EXP(:,vars) = A2 * betama_;
    T_New = - (A1 + EXP) \ LG;
    % Checking whether the trasnmission mechanism became unstable
    hit = any(abs(eig(T_New)) > options_.qz_criterium);
    % Checking for exits: state variables more than 4 REE st devs from the
    % steady state (zero)
    exit = any(abs(filteratt(exit_var_loc,t)) > 5 * tmp);
    if exit
        % The variables of interest have moved too far away from the SS
        exits = exits + 1;
        filteratt(:,t) = Y_init;
        tmp_vars = Y_init;
        if hit
            projection_facility = projection_facility + 1;
        end
    else
        if hit == 0
            R = - (A1 + EXP) \ B;
            T = T_New(oo_.dr.order_var,oo_.dr.order_var);
            R = R(oo_.dr.order_var,:);
            RQ = R * chol(Q);
            SecMom = SecMom_New;
            betamat = betamat_New;
            if options_.kalman_algo > 200
                mu_new_1 = (A1 + EXP) \ ( (LG + A1 + A2_full) * SState - A2 * betamat(1,:)');
                mu =  mu_new_1(oo_.dr.order_var);
            end
        else
            projection_facility = projection_facility + 1;
        end
    end
    
end

fprintf('PF hits %4i \n',projection_facility);
fprintf('Exits %4i \n',exits);

% IRF = filteratt - Y_init * ones(1,smpl);