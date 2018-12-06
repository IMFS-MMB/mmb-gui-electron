%
% Status : main Dynare file
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

if isoctave || matlab_ver_less_than('8.6')
    clear all
else
    clearvars -global
    clear_persistent_variables(fileparts(which('dynare')), false)
end
tic0 = tic;
% Save empty dates and dseries objects in memory.
dates('initialize');
dseries('initialize');
% Define global variables.
global M_ options_ oo_ estim_params_ bayestopt_ dataset_ dataset_info estimation_info ys0_ ex0_
options_ = [];
M_.fname = 'Diko_mou2';
M_.dynare_version = '4.5.4';
oo_.dynare_version = '4.5.4';
options_.dynare_version = '4.5.4';
%
% Some global variables initialization
%
global_initialization;
diary off;
diary('Diko_mou2.log');
M_.exo_names = 'epsi_D';
M_.exo_names_tex = 'epsi\_D';
M_.exo_names_long = 'epsi_D';
M_.exo_names = char(M_.exo_names, 'eta_PIESTAR');
M_.exo_names_tex = char(M_.exo_names_tex, 'eta\_PIESTAR');
M_.exo_names_long = char(M_.exo_names_long, 'eta_PIESTAR');
M_.exo_names = char(M_.exo_names, 'eta_r');
M_.exo_names_tex = char(M_.exo_names_tex, 'eta\_r');
M_.exo_names_long = char(M_.exo_names_long, 'eta_r');
M_.exo_names = char(M_.exo_names, 'epsi_G');
M_.exo_names_tex = char(M_.exo_names_tex, 'epsi\_G');
M_.exo_names_long = char(M_.exo_names_long, 'epsi_G');
M_.endo_names = 'yn';
M_.endo_names_tex = 'output';
M_.endo_names_long = 'yn';
M_.endo_names = char(M_.endo_names, 'cn');
M_.endo_names_tex = char(M_.endo_names_tex, 'cn');
M_.endo_names_long = char(M_.endo_names_long, 'cn');
M_.endo_names = char(M_.endo_names, 'hn');
M_.endo_names_tex = char(M_.endo_names_tex, 'hn');
M_.endo_names_long = char(M_.endo_names_long, 'hn');
M_.endo_names = char(M_.endo_names, 'wn');
M_.endo_names_tex = char(M_.endo_names_tex, 'wn');
M_.endo_names_long = char(M_.endo_names_long, 'wn');
M_.endo_names = char(M_.endo_names, 'mn');
M_.endo_names_tex = char(M_.endo_names_tex, 'mn');
M_.endo_names_long = char(M_.endo_names_long, 'mn');
M_.endo_names = char(M_.endo_names, 'Dn');
M_.endo_names_tex = char(M_.endo_names_tex, 'Dn');
M_.endo_names_long = char(M_.endo_names_long, 'Dn');
M_.endo_names = char(M_.endo_names, 'Dnewn');
M_.endo_names_tex = char(M_.endo_names_tex, 'Dnewn');
M_.endo_names_long = char(M_.endo_names_long, 'Dnewn');
M_.endo_names = char(M_.endo_names, 'i_Dn');
M_.endo_names_tex = char(M_.endo_names_tex, 'i\_Dn');
M_.endo_names_long = char(M_.endo_names_long, 'i_Dn');
M_.endo_names = char(M_.endo_names, 'i_Dnewn');
M_.endo_names_tex = char(M_.endo_names_tex, 'i\_Dnewn');
M_.endo_names_long = char(M_.endo_names_long, 'i_Dnewn');
M_.endo_names = char(M_.endo_names, 'in');
M_.endo_names_tex = char(M_.endo_names_tex, 'in');
M_.endo_names_long = char(M_.endo_names_long, 'in');
M_.endo_names = char(M_.endo_names, 'Rn');
M_.endo_names_tex = char(M_.endo_names_tex, 'Rn');
M_.endo_names_long = char(M_.endo_names_long, 'Rn');
M_.endo_names = char(M_.endo_names, 'pin');
M_.endo_names_tex = char(M_.endo_names_tex, 'pin');
M_.endo_names_long = char(M_.endo_names_long, 'pin');
M_.endo_names = char(M_.endo_names, 'lamdan');
M_.endo_names_tex = char(M_.endo_names_tex, 'lamdan');
M_.endo_names_long = char(M_.endo_names_long, 'lamdan');
M_.endo_names = char(M_.endo_names, 'mun');
M_.endo_names_tex = char(M_.endo_names_tex, 'mun');
M_.endo_names_long = char(M_.endo_names_long, 'mun');
M_.endo_names = char(M_.endo_names, 'taun');
M_.endo_names_tex = char(M_.endo_names_tex, 'taun');
M_.endo_names_long = char(M_.endo_names_long, 'taun');
M_.endo_names = char(M_.endo_names, 'Dbs');
M_.endo_names_tex = char(M_.endo_names_tex, 'Dbs');
M_.endo_names_long = char(M_.endo_names_long, 'Dbs');
M_.endo_names = char(M_.endo_names, 'taun_obs');
M_.endo_names_tex = char(M_.endo_names_tex, 'taun\_obs');
M_.endo_names_long = char(M_.endo_names_long, 'taun_obs');
M_.endo_names = char(M_.endo_names, 'PIESTARn');
M_.endo_names_tex = char(M_.endo_names_tex, 'PIESTARn');
M_.endo_names_long = char(M_.endo_names_long, 'PIESTARn');
M_.endo_names = char(M_.endo_names, 'Dn_obs');
M_.endo_names_tex = char(M_.endo_names_tex, 'Dn\_obs');
M_.endo_names_long = char(M_.endo_names_long, 'Dn_obs');
M_.endo_names = char(M_.endo_names, 'DG');
M_.endo_names_tex = char(M_.endo_names_tex, 'DG');
M_.endo_names_long = char(M_.endo_names_long, 'DG');
M_.endo_names = char(M_.endo_names, 'y');
M_.endo_names_tex = char(M_.endo_names_tex, 'y');
M_.endo_names_long = char(M_.endo_names_long, 'y');
M_.endo_names = char(M_.endo_names, 'c');
M_.endo_names_tex = char(M_.endo_names_tex, 'c');
M_.endo_names_long = char(M_.endo_names_long, 'c');
M_.endo_names = char(M_.endo_names, 'h');
M_.endo_names_tex = char(M_.endo_names_tex, 'h');
M_.endo_names_long = char(M_.endo_names_long, 'h');
M_.endo_names = char(M_.endo_names, 'w');
M_.endo_names_tex = char(M_.endo_names_tex, 'w');
M_.endo_names_long = char(M_.endo_names_long, 'w');
M_.endo_names = char(M_.endo_names, 'm');
M_.endo_names_tex = char(M_.endo_names_tex, 'm');
M_.endo_names_long = char(M_.endo_names_long, 'm');
M_.endo_names = char(M_.endo_names, 'D');
M_.endo_names_tex = char(M_.endo_names_tex, 'D');
M_.endo_names_long = char(M_.endo_names_long, 'D');
M_.endo_names = char(M_.endo_names, 'Dnew');
M_.endo_names_tex = char(M_.endo_names_tex, 'Dnew');
M_.endo_names_long = char(M_.endo_names_long, 'Dnew');
M_.endo_names = char(M_.endo_names, 'i_D');
M_.endo_names_tex = char(M_.endo_names_tex, 'i\_D');
M_.endo_names_long = char(M_.endo_names_long, 'i_D');
M_.endo_names = char(M_.endo_names, 'i_Dnew');
M_.endo_names_tex = char(M_.endo_names_tex, 'i\_Dnew');
M_.endo_names_long = char(M_.endo_names_long, 'i_Dnew');
M_.endo_names = char(M_.endo_names, 'i');
M_.endo_names_tex = char(M_.endo_names_tex, 'i');
M_.endo_names_long = char(M_.endo_names_long, 'i');
M_.endo_names = char(M_.endo_names, 'R');
M_.endo_names_tex = char(M_.endo_names_tex, 'R');
M_.endo_names_long = char(M_.endo_names_long, 'R');
M_.endo_names = char(M_.endo_names, 'pi');
M_.endo_names_tex = char(M_.endo_names_tex, 'pi');
M_.endo_names_long = char(M_.endo_names_long, 'pi');
M_.endo_names = char(M_.endo_names, 'lamda');
M_.endo_names_tex = char(M_.endo_names_tex, 'lamda');
M_.endo_names_long = char(M_.endo_names_long, 'lamda');
M_.endo_names = char(M_.endo_names, 'mu');
M_.endo_names_tex = char(M_.endo_names_tex, 'mu');
M_.endo_names_long = char(M_.endo_names_long, 'mu');
M_.endo_names = char(M_.endo_names, 'tau');
M_.endo_names_tex = char(M_.endo_names_tex, 'tau');
M_.endo_names_long = char(M_.endo_names_long, 'tau');
M_.endo_names = char(M_.endo_names, 'PIESTAR');
M_.endo_names_tex = char(M_.endo_names_tex, 'PIESTAR');
M_.endo_names_long = char(M_.endo_names_long, 'PIESTAR');
M_.endo_names = char(M_.endo_names, 'pistar');
M_.endo_names_tex = char(M_.endo_names_tex, 'pistar');
M_.endo_names_long = char(M_.endo_names_long, 'pistar');
M_.endo_names = char(M_.endo_names, 'MC');
M_.endo_names_tex = char(M_.endo_names_tex, 'MC');
M_.endo_names_long = char(M_.endo_names_long, 'MC');
M_.endo_names = char(M_.endo_names, 'G');
M_.endo_names_tex = char(M_.endo_names_tex, 'G');
M_.endo_names_long = char(M_.endo_names_long, 'G');
M_.endo_names = char(M_.endo_names, 'D_obs');
M_.endo_names_tex = char(M_.endo_names_tex, 'D\_obs');
M_.endo_names_long = char(M_.endo_names_long, 'D_obs');
M_.endo_names = char(M_.endo_names, 'tau_obs');
M_.endo_names_tex = char(M_.endo_names_tex, 'tau\_obs');
M_.endo_names_long = char(M_.endo_names_long, 'tau_obs');
M_.endo_names = char(M_.endo_names, 'i_obs');
M_.endo_names_tex = char(M_.endo_names_tex, 'i\_obs');
M_.endo_names_long = char(M_.endo_names_long, 'i_obs');
M_.endo_names = char(M_.endo_names, 'pi_obs');
M_.endo_names_tex = char(M_.endo_names_tex, 'pi\_obs');
M_.endo_names_long = char(M_.endo_names_long, 'pi_obs');
M_.endo_names = char(M_.endo_names, 'y_obs');
M_.endo_names_tex = char(M_.endo_names_tex, 'y\_obs');
M_.endo_names_long = char(M_.endo_names_long, 'y_obs');
M_.endo_names = char(M_.endo_names, 'yn_obs');
M_.endo_names_tex = char(M_.endo_names_tex, 'yn\_obs');
M_.endo_names_long = char(M_.endo_names_long, 'yn_obs');
M_.endo_names = char(M_.endo_names, 'Disp');
M_.endo_names_tex = char(M_.endo_names_tex, 'Disp');
M_.endo_names_long = char(M_.endo_names_long, 'Disp');
M_.endo_names = char(M_.endo_names, 'Z1');
M_.endo_names_tex = char(M_.endo_names_tex, 'Z1');
M_.endo_names_long = char(M_.endo_names_long, 'Z1');
M_.endo_names = char(M_.endo_names, 'Z2');
M_.endo_names_tex = char(M_.endo_names_tex, 'Z2');
M_.endo_names_long = char(M_.endo_names_long, 'Z2');
M_.endo_names = char(M_.endo_names, 'epsi_R');
M_.endo_names_tex = char(M_.endo_names_tex, 'epsi\_R');
M_.endo_names_long = char(M_.endo_names_long, 'epsi_R');
M_.endo_names = char(M_.endo_names, 'c_obs');
M_.endo_names_tex = char(M_.endo_names_tex, 'c\_obs');
M_.endo_names_long = char(M_.endo_names_long, 'c_obs');
M_.endo_names = char(M_.endo_names, 'w_obs');
M_.endo_names_tex = char(M_.endo_names_tex, 'w\_obs');
M_.endo_names_long = char(M_.endo_names_long, 'w_obs');
M_.endo_names = char(M_.endo_names, 'h_obs');
M_.endo_names_tex = char(M_.endo_names_tex, 'h\_obs');
M_.endo_names_long = char(M_.endo_names_long, 'h_obs');
M_.endo_names = char(M_.endo_names, 'Dnew_obs');
M_.endo_names_tex = char(M_.endo_names_tex, 'Dnew\_obs');
M_.endo_names_long = char(M_.endo_names_long, 'Dnew_obs');
M_.endo_names = char(M_.endo_names, 'm_obs');
M_.endo_names_tex = char(M_.endo_names_tex, 'm\_obs');
M_.endo_names_long = char(M_.endo_names_long, 'm_obs');
M_.endo_names = char(M_.endo_names, 'Rrate');
M_.endo_names_tex = char(M_.endo_names_tex, 'Rrate');
M_.endo_names_long = char(M_.endo_names_long, 'Rrate');
M_.endo_names = char(M_.endo_names, 'mu_obs');
M_.endo_names_tex = char(M_.endo_names_tex, 'mu\_obs');
M_.endo_names_long = char(M_.endo_names_long, 'mu_obs');
M_.endo_names = char(M_.endo_names, 'i_Dnew_obs');
M_.endo_names_tex = char(M_.endo_names_tex, 'i\_Dnew\_obs');
M_.endo_names_long = char(M_.endo_names_long, 'i_Dnew_obs');
M_.endo_names = char(M_.endo_names, 'G_obs');
M_.endo_names_tex = char(M_.endo_names_tex, 'G\_obs');
M_.endo_names_long = char(M_.endo_names_long, 'G_obs');
M_.endo_partitions = struct();
M_.param_names = 'sigmac';
M_.param_names_tex = 'sigmac';
M_.param_names_long = 'sigmac';
M_.param_names = char(M_.param_names, 'sigmam');
M_.param_names_tex = char(M_.param_names_tex, 'sigmam');
M_.param_names_long = char(M_.param_names_long, 'sigmam');
M_.param_names = char(M_.param_names, 'sigmah');
M_.param_names_tex = char(M_.param_names_tex, 'sigmah');
M_.param_names_long = char(M_.param_names_long, 'sigmah');
M_.param_names = char(M_.param_names, 'theta');
M_.param_names_tex = char(M_.param_names_tex, 'theta');
M_.param_names_long = char(M_.param_names_long, 'theta');
M_.param_names = char(M_.param_names, 'epsi');
M_.param_names_tex = char(M_.param_names_tex, 'epsi');
M_.param_names_long = char(M_.param_names_long, 'epsi');
M_.param_names = char(M_.param_names, 'markup');
M_.param_names_tex = char(M_.param_names_tex, 'markup');
M_.param_names_long = char(M_.param_names_long, 'markup');
M_.param_names = char(M_.param_names, 'betta');
M_.param_names_tex = char(M_.param_names_tex, 'betta');
M_.param_names_long = char(M_.param_names_long, 'betta');
M_.param_names = char(M_.param_names, 'alphaa');
M_.param_names_tex = char(M_.param_names_tex, 'alphaa');
M_.param_names_long = char(M_.param_names_long, 'alphaa');
M_.param_names = char(M_.param_names, 'rho_tau');
M_.param_names_tex = char(M_.param_names_tex, 'rho\_tau');
M_.param_names_long = char(M_.param_names_long, 'rho_tau');
M_.param_names = char(M_.param_names, 'phi_tau_D');
M_.param_names_tex = char(M_.param_names_tex, 'phi\_tau\_D');
M_.param_names_long = char(M_.param_names_long, 'phi_tau_D');
M_.param_names = char(M_.param_names, 'rho_D');
M_.param_names_tex = char(M_.param_names_tex, 'rho\_D');
M_.param_names_long = char(M_.param_names_long, 'rho_D');
M_.param_names = char(M_.param_names, 'rho_pi');
M_.param_names_tex = char(M_.param_names_tex, 'rho\_pi');
M_.param_names_long = char(M_.param_names_long, 'rho_pi');
M_.param_names = char(M_.param_names, 'phi');
M_.param_names_tex = char(M_.param_names_tex, 'phi');
M_.param_names_long = char(M_.param_names_long, 'phi');
M_.param_names = char(M_.param_names, 'rho_i');
M_.param_names_tex = char(M_.param_names_tex, 'rho\_i');
M_.param_names_long = char(M_.param_names_long, 'rho_i');
M_.param_names = char(M_.param_names, 'phipi');
M_.param_names_tex = char(M_.param_names_tex, 'phipi');
M_.param_names_long = char(M_.param_names_long, 'phipi');
M_.param_names = char(M_.param_names, 'phiy');
M_.param_names_tex = char(M_.param_names_tex, 'phiy');
M_.param_names_long = char(M_.param_names_long, 'phiy');
M_.param_names = char(M_.param_names, 'rho_r');
M_.param_names_tex = char(M_.param_names_tex, 'rho\_r');
M_.param_names_long = char(M_.param_names_long, 'rho_r');
M_.param_names = char(M_.param_names, 'rho_G');
M_.param_names_tex = char(M_.param_names_tex, 'rho\_G');
M_.param_names_long = char(M_.param_names_long, 'rho_G');
M_.param_names = char(M_.param_names, 'xi');
M_.param_names_tex = char(M_.param_names_tex, 'xi');
M_.param_names_long = char(M_.param_names_long, 'xi');
M_.param_partitions = struct();
M_.exo_det_nbr = 0;
M_.exo_nbr = 4;
M_.endo_nbr = 58;
M_.param_nbr = 19;
M_.orig_endo_nbr = 58;
M_.aux_vars = [];
M_.Sigma_e = zeros(4, 4);
M_.Correlation_matrix = eye(4, 4);
M_.H = 0;
M_.Correlation_matrix_ME = 1;
M_.sigma_e_is_diagonal = 1;
M_.det_shocks = [];
options_.block=0;
options_.bytecode=0;
options_.use_dll=0;
M_.hessian_eq_zero = 1;
erase_compiled_function('Diko_mou2_static');
erase_compiled_function('Diko_mou2_dynamic');
M_.orig_eq_nbr = 58;
M_.eq_nbr = 58;
M_.ramsey_eq_nbr = 0;
M_.set_auxiliary_variables = exist(['./' M_.fname '_set_auxiliary_variables.m'], 'file') == 2;
M_.lead_lag_incidence = [
 0 17 0;
 0 18 75;
 0 19 0;
 0 20 0;
 1 21 0;
 2 22 0;
 0 23 0;
 3 24 0;
 0 25 76;
 0 26 0;
 0 27 0;
 0 28 77;
 0 29 0;
 0 30 78;
 0 31 0;
 4 32 0;
 5 33 0;
 6 34 0;
 0 35 0;
 7 36 0;
 0 37 0;
 0 38 79;
 0 39 0;
 0 40 0;
 8 41 0;
 9 42 0;
 0 43 0;
 10 44 0;
 0 45 80;
 0 46 0;
 0 47 0;
 0 48 81;
 0 49 0;
 0 50 82;
 0 51 0;
 11 52 0;
 0 53 83;
 0 54 0;
 12 55 0;
 0 56 0;
 13 57 0;
 14 58 0;
 0 59 84;
 0 60 0;
 0 61 0;
 15 62 0;
 0 63 85;
 0 64 86;
 16 65 0;
 0 66 0;
 0 67 0;
 0 68 0;
 0 69 0;
 0 70 0;
 0 71 0;
 0 72 0;
 0 73 0;
 0 74 0;]';
M_.nstatic = 30;
M_.nfwrd   = 12;
M_.npred   = 16;
M_.nboth   = 0;
M_.nsfwrd   = 12;
M_.nspred   = 16;
M_.ndynamic   = 28;
M_.equations_tags = {
};
M_.static_and_dynamic_models_differ = 0;
M_.exo_names_orig_ord = [1:4];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(58, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(4, 1);
M_.params = NaN(19, 1);
M_.NNZDerivatives = [203; -1; -1];
M_.params( 7 ) = 0.99;
betta = M_.params( 7 );
M_.params( 4 ) = 0.75;
theta = M_.params( 4 );
M_.params( 1 ) = 1.5;
sigmac = M_.params( 1 );
M_.params( 3 ) = 2;
sigmah = M_.params( 3 );
M_.params( 2 ) = 2.56;
sigmam = M_.params( 2 );
M_.params( 5 ) = 6;
epsi = M_.params( 5 );
M_.params( 6 ) = M_.params(5)/(M_.params(5)-1);
markup = M_.params( 6 );
M_.params( 8 ) = 0.0472;
alphaa = M_.params( 8 );
M_.params( 19 ) = 7.140600000000007e-006;
xi = M_.params( 19 );
M_.params( 13 ) = 35.4634381498;
phi = M_.params( 13 );
M_.params( 11 ) = 0.00;
rho_D = M_.params( 11 );
M_.params( 12 ) = 0.99;
rho_pi = M_.params( 12 );
M_.params( 18 ) = 0;
rho_G = M_.params( 18 );
M_.params( 9 ) = 0.5;
rho_tau = M_.params( 9 );
M_.params( 10 ) = 0.0037;
phi_tau_D = M_.params( 10 );
M_.params( 14 ) = 0.75;
rho_i = M_.params( 14 );
M_.params( 15 ) = 1.5;
phipi = M_.params( 15 );
M_.params( 16 ) = 0.5;
phiy = M_.params( 16 );
M_.params( 17 ) = 0.01;
rho_r = M_.params( 17 );
%
% SHOCKS instructions
%
M_.exo_det_length = 0;
M_.Sigma_e(4, 4) = 0;
M_.Sigma_e(1, 1) = (0.107)^2;
M_.Sigma_e(2, 2) = (0)^2;
M_.Sigma_e(3, 3) = (0)^2;
steady;
oo_.dr.eigval = check(M_,options_,oo_);
Fig2= 1;
if Fig2 == 1
steady;
warning('OFF');
Params_list = str2mat('rho_tau','phi_tau_D');
Params_vals = [0.5;0.035];
nparams = size(Params_list,1)
pindx = [ ];
for i=1:nparams
pindx = strmatch(Params_list(i,:),M_.param_names,'exact')
M_.params(pindx) = Params_vals(i)
end
warning('OFF');
options_.irf = 80;
options_.nograph = 0;
options_.noprint = 1;
options_.order = 1;
var_list_ = char('D_obs','Dnew_obs','pi_obs','i_obs','y_obs','Rrate','w_obs','tau_obs','G_obs','yn');
info = stoch_simul(var_list_);
extension =['Taxes'];
save_irf; 
end;
save('Diko_mou2_results.mat', 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save('Diko_mou2_results.mat', 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save('Diko_mou2_results.mat', 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save('Diko_mou2_results.mat', 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save('Diko_mou2_results.mat', 'estimation_info', '-append');
end
if exist('dataset_info', 'var') == 1
  save('Diko_mou2_results.mat', 'dataset_info', '-append');
end
if exist('oo_recursive_', 'var') == 1
  save('Diko_mou2_results.mat', 'oo_recursive_', '-append');
end


disp(['Total computing time : ' dynsec2hms(toc(tic0)) ]);
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
diary off
