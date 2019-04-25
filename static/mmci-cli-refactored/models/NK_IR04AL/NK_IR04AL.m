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
M_.fname = 'NK_IR04AL';
M_.dynare_version = '4.5.4';
oo_.dynare_version = '4.5.4';
options_.dynare_version = '4.5.4';
%
% Some global variables initialization
%
global_initialization;
diary off;
diary('NK_IR04AL.log');
M_.exo_names = 'epsa_';
M_.exo_names_tex = 'epsa\_';
M_.exo_names_long = 'epsa_';
M_.exo_names = char(M_.exo_names, 'epse_');
M_.exo_names_tex = char(M_.exo_names_tex, 'epse\_');
M_.exo_names_long = char(M_.exo_names_long, 'epse_');
M_.exo_names = char(M_.exo_names, 'epsz_');
M_.exo_names_tex = char(M_.exo_names_tex, 'epsz\_');
M_.exo_names_long = char(M_.exo_names_long, 'epsz_');
M_.exo_names = char(M_.exo_names, 'interest_');
M_.exo_names_tex = char(M_.exo_names_tex, 'interest\_');
M_.exo_names_long = char(M_.exo_names_long, 'interest_');
M_.endo_names = 'y';
M_.endo_names_tex = 'y';
M_.endo_names_long = 'y';
M_.endo_names = char(M_.endo_names, 'm');
M_.endo_names_tex = char(M_.endo_names_tex, 'm');
M_.endo_names_long = char(M_.endo_names_long, 'm');
M_.endo_names = char(M_.endo_names, 'pi');
M_.endo_names_tex = char(M_.endo_names_tex, 'pi');
M_.endo_names_long = char(M_.endo_names_long, 'pi');
M_.endo_names = char(M_.endo_names, 'r');
M_.endo_names_tex = char(M_.endo_names_tex, 'r');
M_.endo_names_long = char(M_.endo_names_long, 'r');
M_.endo_names = char(M_.endo_names, 'a');
M_.endo_names_tex = char(M_.endo_names_tex, 'a');
M_.endo_names_long = char(M_.endo_names_long, 'a');
M_.endo_names = char(M_.endo_names, 'e');
M_.endo_names_tex = char(M_.endo_names_tex, 'e');
M_.endo_names_long = char(M_.endo_names_long, 'e');
M_.endo_names = char(M_.endo_names, 'z');
M_.endo_names_tex = char(M_.endo_names_tex, 'z');
M_.endo_names_long = char(M_.endo_names_long, 'z');
M_.endo_names = char(M_.endo_names, 'pinf4');
M_.endo_names_tex = char(M_.endo_names_tex, 'pinf4');
M_.endo_names_long = char(M_.endo_names_long, 'pinf4');
M_.endo_names = char(M_.endo_names, 'interest');
M_.endo_names_tex = char(M_.endo_names_tex, 'interest');
M_.endo_names_long = char(M_.endo_names_long, 'interest');
M_.endo_names = char(M_.endo_names, 'inflation');
M_.endo_names_tex = char(M_.endo_names_tex, 'inflation');
M_.endo_names_long = char(M_.endo_names_long, 'inflation');
M_.endo_names = char(M_.endo_names, 'inflationq');
M_.endo_names_tex = char(M_.endo_names_tex, 'inflationq');
M_.endo_names_long = char(M_.endo_names_long, 'inflationq');
M_.endo_names = char(M_.endo_names, 'outputgap');
M_.endo_names_tex = char(M_.endo_names_tex, 'outputgap');
M_.endo_names_long = char(M_.endo_names_long, 'outputgap');
M_.endo_names = char(M_.endo_names, 'output');
M_.endo_names_tex = char(M_.endo_names_tex, 'output');
M_.endo_names_long = char(M_.endo_names_long, 'output');
M_.endo_names = char(M_.endo_names, 'inflationql');
M_.endo_names_tex = char(M_.endo_names_tex, 'inflationql');
M_.endo_names_long = char(M_.endo_names_long, 'inflationql');
M_.endo_names = char(M_.endo_names, 'inflationql2');
M_.endo_names_tex = char(M_.endo_names_tex, 'inflationql2');
M_.endo_names_long = char(M_.endo_names_long, 'inflationql2');
M_.endo_names = char(M_.endo_names, 'inflationqls');
M_.endo_names_tex = char(M_.endo_names_tex, 'inflationqls');
M_.endo_names_long = char(M_.endo_names_long, 'inflationqls');
M_.endo_partitions = struct();
M_.param_names = 'cofintintb1';
M_.param_names_tex = 'cofintintb1';
M_.param_names_long = 'cofintintb1';
M_.param_names = char(M_.param_names, 'cofintintb2');
M_.param_names_tex = char(M_.param_names_tex, 'cofintintb2');
M_.param_names_long = char(M_.param_names_long, 'cofintintb2');
M_.param_names = char(M_.param_names, 'cofintintb3');
M_.param_names_tex = char(M_.param_names_tex, 'cofintintb3');
M_.param_names_long = char(M_.param_names_long, 'cofintintb3');
M_.param_names = char(M_.param_names, 'cofintintb4');
M_.param_names_tex = char(M_.param_names_tex, 'cofintintb4');
M_.param_names_long = char(M_.param_names_long, 'cofintintb4');
M_.param_names = char(M_.param_names, 'cofintinf0');
M_.param_names_tex = char(M_.param_names_tex, 'cofintinf0');
M_.param_names_long = char(M_.param_names_long, 'cofintinf0');
M_.param_names = char(M_.param_names, 'cofintinfb1');
M_.param_names_tex = char(M_.param_names_tex, 'cofintinfb1');
M_.param_names_long = char(M_.param_names_long, 'cofintinfb1');
M_.param_names = char(M_.param_names, 'cofintinfb2');
M_.param_names_tex = char(M_.param_names_tex, 'cofintinfb2');
M_.param_names_long = char(M_.param_names_long, 'cofintinfb2');
M_.param_names = char(M_.param_names, 'cofintinfb3');
M_.param_names_tex = char(M_.param_names_tex, 'cofintinfb3');
M_.param_names_long = char(M_.param_names_long, 'cofintinfb3');
M_.param_names = char(M_.param_names, 'cofintinfb4');
M_.param_names_tex = char(M_.param_names_tex, 'cofintinfb4');
M_.param_names_long = char(M_.param_names_long, 'cofintinfb4');
M_.param_names = char(M_.param_names, 'cofintinff1');
M_.param_names_tex = char(M_.param_names_tex, 'cofintinff1');
M_.param_names_long = char(M_.param_names_long, 'cofintinff1');
M_.param_names = char(M_.param_names, 'cofintinff2');
M_.param_names_tex = char(M_.param_names_tex, 'cofintinff2');
M_.param_names_long = char(M_.param_names_long, 'cofintinff2');
M_.param_names = char(M_.param_names, 'cofintinff3');
M_.param_names_tex = char(M_.param_names_tex, 'cofintinff3');
M_.param_names_long = char(M_.param_names_long, 'cofintinff3');
M_.param_names = char(M_.param_names, 'cofintinff4');
M_.param_names_tex = char(M_.param_names_tex, 'cofintinff4');
M_.param_names_long = char(M_.param_names_long, 'cofintinff4');
M_.param_names = char(M_.param_names, 'cofintout');
M_.param_names_tex = char(M_.param_names_tex, 'cofintout');
M_.param_names_long = char(M_.param_names_long, 'cofintout');
M_.param_names = char(M_.param_names, 'cofintoutb1');
M_.param_names_tex = char(M_.param_names_tex, 'cofintoutb1');
M_.param_names_long = char(M_.param_names_long, 'cofintoutb1');
M_.param_names = char(M_.param_names, 'cofintoutb2');
M_.param_names_tex = char(M_.param_names_tex, 'cofintoutb2');
M_.param_names_long = char(M_.param_names_long, 'cofintoutb2');
M_.param_names = char(M_.param_names, 'cofintoutb3');
M_.param_names_tex = char(M_.param_names_tex, 'cofintoutb3');
M_.param_names_long = char(M_.param_names_long, 'cofintoutb3');
M_.param_names = char(M_.param_names, 'cofintoutb4');
M_.param_names_tex = char(M_.param_names_tex, 'cofintoutb4');
M_.param_names_long = char(M_.param_names_long, 'cofintoutb4');
M_.param_names = char(M_.param_names, 'cofintoutf1');
M_.param_names_tex = char(M_.param_names_tex, 'cofintoutf1');
M_.param_names_long = char(M_.param_names_long, 'cofintoutf1');
M_.param_names = char(M_.param_names, 'cofintoutf2');
M_.param_names_tex = char(M_.param_names_tex, 'cofintoutf2');
M_.param_names_long = char(M_.param_names_long, 'cofintoutf2');
M_.param_names = char(M_.param_names, 'cofintoutf3');
M_.param_names_tex = char(M_.param_names_tex, 'cofintoutf3');
M_.param_names_long = char(M_.param_names_long, 'cofintoutf3');
M_.param_names = char(M_.param_names, 'cofintoutf4');
M_.param_names_tex = char(M_.param_names_tex, 'cofintoutf4');
M_.param_names_long = char(M_.param_names_long, 'cofintoutf4');
M_.param_names = char(M_.param_names, 'cofintoutp');
M_.param_names_tex = char(M_.param_names_tex, 'cofintoutp');
M_.param_names_long = char(M_.param_names_long, 'cofintoutp');
M_.param_names = char(M_.param_names, 'cofintoutpb1');
M_.param_names_tex = char(M_.param_names_tex, 'cofintoutpb1');
M_.param_names_long = char(M_.param_names_long, 'cofintoutpb1');
M_.param_names = char(M_.param_names, 'cofintoutpb2');
M_.param_names_tex = char(M_.param_names_tex, 'cofintoutpb2');
M_.param_names_long = char(M_.param_names_long, 'cofintoutpb2');
M_.param_names = char(M_.param_names, 'cofintoutpb3');
M_.param_names_tex = char(M_.param_names_tex, 'cofintoutpb3');
M_.param_names_long = char(M_.param_names_long, 'cofintoutpb3');
M_.param_names = char(M_.param_names, 'cofintoutpb4');
M_.param_names_tex = char(M_.param_names_tex, 'cofintoutpb4');
M_.param_names_long = char(M_.param_names_long, 'cofintoutpb4');
M_.param_names = char(M_.param_names, 'cofintoutpf1');
M_.param_names_tex = char(M_.param_names_tex, 'cofintoutpf1');
M_.param_names_long = char(M_.param_names_long, 'cofintoutpf1');
M_.param_names = char(M_.param_names, 'cofintoutpf2');
M_.param_names_tex = char(M_.param_names_tex, 'cofintoutpf2');
M_.param_names_long = char(M_.param_names_long, 'cofintoutpf2');
M_.param_names = char(M_.param_names, 'cofintoutpf3');
M_.param_names_tex = char(M_.param_names_tex, 'cofintoutpf3');
M_.param_names_long = char(M_.param_names_long, 'cofintoutpf3');
M_.param_names = char(M_.param_names, 'cofintoutpf4');
M_.param_names_tex = char(M_.param_names_tex, 'cofintoutpf4');
M_.param_names_long = char(M_.param_names_long, 'cofintoutpf4');
M_.param_names = char(M_.param_names, 'std_r_');
M_.param_names_tex = char(M_.param_names_tex, 'std\_r\_');
M_.param_names_long = char(M_.param_names_long, 'std_r_');
M_.param_names = char(M_.param_names, 'std_r_quart');
M_.param_names_tex = char(M_.param_names_tex, 'std\_r\_quart');
M_.param_names_long = char(M_.param_names_long, 'std_r_quart');
M_.param_names = char(M_.param_names, 'coffispol');
M_.param_names_tex = char(M_.param_names_tex, 'coffispol');
M_.param_names_long = char(M_.param_names_long, 'coffispol');
M_.param_names = char(M_.param_names, 'omega1');
M_.param_names_tex = char(M_.param_names_tex, 'omega1');
M_.param_names_long = char(M_.param_names_long, 'omega1');
M_.param_names = char(M_.param_names, 'omega2');
M_.param_names_tex = char(M_.param_names_tex, 'omega2');
M_.param_names_long = char(M_.param_names_long, 'omega2');
M_.param_names = char(M_.param_names, 'psi');
M_.param_names_tex = char(M_.param_names_tex, 'psi');
M_.param_names_long = char(M_.param_names_long, 'psi');
M_.param_names = char(M_.param_names, 'gamma1');
M_.param_names_tex = char(M_.param_names_tex, 'gamma1');
M_.param_names_long = char(M_.param_names_long, 'gamma1');
M_.param_names = char(M_.param_names, 'gamma2');
M_.param_names_tex = char(M_.param_names_tex, 'gamma2');
M_.param_names_long = char(M_.param_names_long, 'gamma2');
M_.param_names = char(M_.param_names, 'gamma3');
M_.param_names_tex = char(M_.param_names_tex, 'gamma3');
M_.param_names_long = char(M_.param_names_long, 'gamma3');
M_.param_names = char(M_.param_names, 'rhor');
M_.param_names_tex = char(M_.param_names_tex, 'rhor');
M_.param_names_long = char(M_.param_names_long, 'rhor');
M_.param_names = char(M_.param_names, 'rhoy');
M_.param_names_tex = char(M_.param_names_tex, 'rhoy');
M_.param_names_long = char(M_.param_names_long, 'rhoy');
M_.param_names = char(M_.param_names, 'rhopi');
M_.param_names_tex = char(M_.param_names_tex, 'rhopi');
M_.param_names_long = char(M_.param_names_long, 'rhopi');
M_.param_names = char(M_.param_names, 'rhoa');
M_.param_names_tex = char(M_.param_names_tex, 'rhoa');
M_.param_names_long = char(M_.param_names_long, 'rhoa');
M_.param_names = char(M_.param_names, 'rhoe');
M_.param_names_tex = char(M_.param_names_tex, 'rhoe');
M_.param_names_long = char(M_.param_names_long, 'rhoe');
M_.param_names = char(M_.param_names, 'rhoz');
M_.param_names_tex = char(M_.param_names_tex, 'rhoz');
M_.param_names_long = char(M_.param_names_long, 'rhoz');
M_.param_names = char(M_.param_names, 'sigmaa');
M_.param_names_tex = char(M_.param_names_tex, 'sigmaa');
M_.param_names_long = char(M_.param_names_long, 'sigmaa');
M_.param_names = char(M_.param_names, 'sigmae');
M_.param_names_tex = char(M_.param_names_tex, 'sigmae');
M_.param_names_long = char(M_.param_names_long, 'sigmae');
M_.param_names = char(M_.param_names, 'sigmaz');
M_.param_names_tex = char(M_.param_names_tex, 'sigmaz');
M_.param_names_long = char(M_.param_names_long, 'sigmaz');
M_.param_names = char(M_.param_names, 'sigmar');
M_.param_names_tex = char(M_.param_names_tex, 'sigmar');
M_.param_names_long = char(M_.param_names_long, 'sigmar');
M_.param_names = char(M_.param_names, 'lny');
M_.param_names_tex = char(M_.param_names_tex, 'lny');
M_.param_names_long = char(M_.param_names_long, 'lny');
M_.param_names = char(M_.param_names, 'lnm');
M_.param_names_tex = char(M_.param_names_tex, 'lnm');
M_.param_names_long = char(M_.param_names_long, 'lnm');
M_.param_names = char(M_.param_names, 'lnpi');
M_.param_names_tex = char(M_.param_names_tex, 'lnpi');
M_.param_names_long = char(M_.param_names_long, 'lnpi');
M_.param_names = char(M_.param_names, 'lnr');
M_.param_names_tex = char(M_.param_names_tex, 'lnr');
M_.param_names_long = char(M_.param_names_long, 'lnr');
M_.param_names = char(M_.param_names, 'yss');
M_.param_names_tex = char(M_.param_names_tex, 'yss');
M_.param_names_long = char(M_.param_names_long, 'yss');
M_.param_names = char(M_.param_names, 'mss');
M_.param_names_tex = char(M_.param_names_tex, 'mss');
M_.param_names_long = char(M_.param_names_long, 'mss');
M_.param_names = char(M_.param_names, 'piss');
M_.param_names_tex = char(M_.param_names_tex, 'piss');
M_.param_names_long = char(M_.param_names_long, 'piss');
M_.param_names = char(M_.param_names, 'rss');
M_.param_names_tex = char(M_.param_names_tex, 'rss');
M_.param_names_long = char(M_.param_names_long, 'rss');
M_.param_partitions = struct();
M_.exo_det_nbr = 0;
M_.exo_nbr = 4;
M_.endo_nbr = 16;
M_.param_nbr = 58;
M_.orig_endo_nbr = 16;
M_.aux_vars = [];
M_.Sigma_e = zeros(4, 4);
M_.Correlation_matrix = eye(4, 4);
M_.H = 0;
M_.Correlation_matrix_ME = 1;
M_.sigma_e_is_diagonal = 1;
M_.det_shocks = [];
options_.linear = 1;
options_.block=0;
options_.bytecode=0;
options_.use_dll=0;
M_.hessian_eq_zero = 1;
erase_compiled_function('NK_IR04AL_static');
erase_compiled_function('NK_IR04AL_dynamic');
M_.orig_eq_nbr = 16;
M_.eq_nbr = 16;
M_.ramsey_eq_nbr = 0;
M_.set_auxiliary_variables = exist(['./' M_.fname '_set_auxiliary_variables.m'], 'file') == 2;
M_.lead_lag_incidence = [
 0 10 26;
 0 11 27;
 0 12 28;
 0 13 0;
 1 14 29;
 2 15 30;
 3 16 0;
 0 17 0;
 4 18 0;
 0 19 0;
 5 20 31;
 6 21 0;
 7 22 0;
 8 23 0;
 9 24 0;
 0 25 0;]';
M_.nstatic = 4;
M_.nfwrd   = 3;
M_.npred   = 6;
M_.nboth   = 3;
M_.nsfwrd   = 6;
M_.nspred   = 9;
M_.ndynamic   = 12;
M_.equations_tags = {
};
M_.static_and_dynamic_models_differ = 0;
M_.exo_names_orig_ord = [1:4];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(16, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(4, 1);
M_.params = NaN(58, 1);
M_.NNZDerivatives = [65; 0; -1];
M_.params( 35 ) = 1;
omega1 = M_.params( 35 );
M_.params( 36 ) = 0.25;
omega2 = M_.params( 36 );
M_.params( 37 ) = 0.1;
psi = M_.params( 37 );
M_.params( 38 ) = 0.0158;
gamma1 = M_.params( 38 );
M_.params( 39 ) = 0.1251;
gamma2 = M_.params( 39 );
M_.params( 40 ) = 0.9977;
gamma3 = M_.params( 40 );
M_.params( 41 ) = 0.5481;
rhor = M_.params( 41 );
M_.params( 42 ) = 0.0000;
rhoy = M_.params( 42 );
M_.params( 43 ) = 0.5680;
rhopi = M_.params( 43 );
M_.params( 44 ) = 0.9575;
rhoa = M_.params( 44 );
M_.params( 45 ) = 0.9867;
rhoe = M_.params( 45 );
M_.params( 46 ) = 0.9904;
rhoz = M_.params( 46 );
M_.params( 47 ) = 0.0187;
sigmaa = M_.params( 47 );
M_.params( 48 ) = 0.0088;
sigmae = M_.params( 48 );
M_.params( 49 ) = 0.0098;
sigmaz = M_.params( 49 );
M_.params( 50 ) = 0.0025;
sigmar = M_.params( 50 );
M_.params( 51 ) = 8.8747;
lny = M_.params( 51 );
M_.params( 52 ) = 9.7383;
lnm = M_.params( 52 );
M_.params( 53 ) = 0.0100;
lnpi = M_.params( 53 );
M_.params( 54 ) = 0.0186;
lnr = M_.params( 54 );
M_.params( 55 ) = 7148.8015;
yss = M_.params( 55 );
M_.params( 56 ) = 16954.6939;
mss = M_.params( 56 );
M_.params( 57 ) = 1.0101;
piss = M_.params( 57 );
M_.params( 58 ) = 1.0188;
rss = M_.params( 58 );
thispath = cd;                                                           
cd('..');                                                                
load policy_param.mat;                                                   
for i=1:33                                                               
deep_parameter_name = M_.param_names(i,:);                           
eval(['M_.params(i)  = ' deep_parameter_name ' ;'])                  
end                                                                      
cd(thispath); 
AL_Info.forwards = {'y','m','e','a','inflationq','pi'};
AL_Info.states_long  = {'a','z','inflationq','inflationql','inflationql2'};
AL_Info.states_short = {'a','z','interest'};
save AL_Info AL_Info 
%
% SHOCKS instructions
%
M_.exo_det_length = 0;
M_.Sigma_e(1, 1) = 10000*M_.params(47)^2;
M_.Sigma_e(2, 2) = 10000*M_.params(48)^2;
M_.Sigma_e(3, 3) = 10000*M_.params(49)^2;
save('NK_IR04AL_results.mat', 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save('NK_IR04AL_results.mat', 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save('NK_IR04AL_results.mat', 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save('NK_IR04AL_results.mat', 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save('NK_IR04AL_results.mat', 'estimation_info', '-append');
end
if exist('dataset_info', 'var') == 1
  save('NK_IR04AL_results.mat', 'dataset_info', '-append');
end
if exist('oo_recursive_', 'var') == 1
  save('NK_IR04AL_results.mat', 'oo_recursive_', '-append');
end


disp(['Total computing time : ' dynsec2hms(toc(tic0)) ]);
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
diary off
