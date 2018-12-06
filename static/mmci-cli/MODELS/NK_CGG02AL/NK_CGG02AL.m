%
% Status : main Dynare file 
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

tic;
global M_ oo_ options_ ys0_ ex0_ estimation_info
options_ = [];
M_.fname = 'NK_CGG02AL';
%
% Some global variables initialization
%
global_initialization;
diary off;
diary('NK_CGG02AL.log');
M_.exo_names = 'inf_';
M_.exo_names_tex = 'inf\_';
M_.exo_names_long = 'inf_';
M_.exo_names = char(M_.exo_names, 'a_');
M_.exo_names_tex = char(M_.exo_names_tex, 'a\_');
M_.exo_names_long = char(M_.exo_names_long, 'a_');
M_.exo_names = char(M_.exo_names, 'infstar_');
M_.exo_names_tex = char(M_.exo_names_tex, 'infstar\_');
M_.exo_names_long = char(M_.exo_names_long, 'infstar_');
M_.exo_names = char(M_.exo_names, 'ystar_');
M_.exo_names_tex = char(M_.exo_names_tex, 'ystar\_');
M_.exo_names_long = char(M_.exo_names_long, 'ystar_');
M_.exo_names = char(M_.exo_names, 'rstar_');
M_.exo_names_tex = char(M_.exo_names_tex, 'rstar\_');
M_.exo_names_long = char(M_.exo_names_long, 'rstar_');
M_.exo_names = char(M_.exo_names, 'astar_');
M_.exo_names_tex = char(M_.exo_names_tex, 'astar\_');
M_.exo_names_long = char(M_.exo_names_long, 'astar_');
M_.exo_names = char(M_.exo_names, 'interest_');
M_.exo_names_tex = char(M_.exo_names_tex, 'interest\_');
M_.exo_names_long = char(M_.exo_names_long, 'interest_');
M_.endo_names = 'ytilde';
M_.endo_names_tex = 'ytilde';
M_.endo_names_long = 'ytilde';
M_.endo_names = char(M_.endo_names, 'ybar');
M_.endo_names_tex = char(M_.endo_names_tex, 'ybar');
M_.endo_names_long = char(M_.endo_names_long, 'ybar');
M_.endo_names = char(M_.endo_names, 'y');
M_.endo_names_tex = char(M_.endo_names_tex, 'y');
M_.endo_names_long = char(M_.endo_names_long, 'y');
M_.endo_names = char(M_.endo_names, 'infl');
M_.endo_names_tex = char(M_.endo_names_tex, 'infl');
M_.endo_names_long = char(M_.endo_names_long, 'infl');
M_.endo_names = char(M_.endo_names, 'r');
M_.endo_names_tex = char(M_.endo_names_tex, 'r');
M_.endo_names_long = char(M_.endo_names_long, 'r');
M_.endo_names = char(M_.endo_names, 'rr');
M_.endo_names_tex = char(M_.endo_names_tex, 'rr');
M_.endo_names_long = char(M_.endo_names_long, 'rr');
M_.endo_names = char(M_.endo_names, 'u');
M_.endo_names_tex = char(M_.endo_names_tex, 'u');
M_.endo_names_long = char(M_.endo_names_long, 'u');
M_.endo_names = char(M_.endo_names, 'a');
M_.endo_names_tex = char(M_.endo_names_tex, 'a');
M_.endo_names_long = char(M_.endo_names_long, 'a');
M_.endo_names = char(M_.endo_names, 'ytildestar');
M_.endo_names_tex = char(M_.endo_names_tex, 'ytildestar');
M_.endo_names_long = char(M_.endo_names_long, 'ytildestar');
M_.endo_names = char(M_.endo_names, 'ybarstar');
M_.endo_names_tex = char(M_.endo_names_tex, 'ybarstar');
M_.endo_names_long = char(M_.endo_names_long, 'ybarstar');
M_.endo_names = char(M_.endo_names, 'ystar');
M_.endo_names_tex = char(M_.endo_names_tex, 'ystar');
M_.endo_names_long = char(M_.endo_names_long, 'ystar');
M_.endo_names = char(M_.endo_names, 'infstar');
M_.endo_names_tex = char(M_.endo_names_tex, 'infstar');
M_.endo_names_long = char(M_.endo_names_long, 'infstar');
M_.endo_names = char(M_.endo_names, 'rstar');
M_.endo_names_tex = char(M_.endo_names_tex, 'rstar');
M_.endo_names_long = char(M_.endo_names_long, 'rstar');
M_.endo_names = char(M_.endo_names, 'rrstar');
M_.endo_names_tex = char(M_.endo_names_tex, 'rrstar');
M_.endo_names_long = char(M_.endo_names_long, 'rrstar');
M_.endo_names = char(M_.endo_names, 'ustar');
M_.endo_names_tex = char(M_.endo_names_tex, 'ustar');
M_.endo_names_long = char(M_.endo_names_long, 'ustar');
M_.endo_names = char(M_.endo_names, 'astar');
M_.endo_names_tex = char(M_.endo_names_tex, 'astar');
M_.endo_names_long = char(M_.endo_names_long, 'astar');
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
M_.endo_names = char(M_.endo_names, 'infstarl');
M_.endo_names_tex = char(M_.endo_names_tex, 'infstarl');
M_.endo_names_long = char(M_.endo_names_long, 'infstarl');
M_.endo_names = char(M_.endo_names, 'infstarl2');
M_.endo_names_tex = char(M_.endo_names_tex, 'infstarl2');
M_.endo_names_long = char(M_.endo_names_long, 'infstarl2');
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
M_.param_names = char(M_.param_names, 'sigma0');
M_.param_names_tex = char(M_.param_names_tex, 'sigma0');
M_.param_names_long = char(M_.param_names_long, 'sigma0');
M_.param_names = char(M_.param_names, 'beta');
M_.param_names_tex = char(M_.param_names_tex, 'beta');
M_.param_names_long = char(M_.param_names_long, 'beta');
M_.param_names = char(M_.param_names, 'lambda');
M_.param_names_tex = char(M_.param_names_tex, 'lambda');
M_.param_names_long = char(M_.param_names_long, 'lambda');
M_.param_names = char(M_.param_names, 'rhoa');
M_.param_names_tex = char(M_.param_names_tex, 'rhoa');
M_.param_names_long = char(M_.param_names_long, 'rhoa');
M_.param_names = char(M_.param_names, 'rhou');
M_.param_names_tex = char(M_.param_names_tex, 'rhou');
M_.param_names_long = char(M_.param_names_long, 'rhou');
M_.param_names = char(M_.param_names, 'sigma');
M_.param_names_tex = char(M_.param_names_tex, 'sigma');
M_.param_names_long = char(M_.param_names_long, 'sigma');
M_.param_names = char(M_.param_names, 'kappa0');
M_.param_names_tex = char(M_.param_names_tex, 'kappa0');
M_.param_names_long = char(M_.param_names_long, 'kappa0');
M_.param_names = char(M_.param_names, 'delta1');
M_.param_names_tex = char(M_.param_names_tex, 'delta1');
M_.param_names_long = char(M_.param_names_long, 'delta1');
M_.param_names = char(M_.param_names, 'kappa');
M_.param_names_tex = char(M_.param_names_tex, 'kappa');
M_.param_names_long = char(M_.param_names_long, 'kappa');
M_.param_names = char(M_.param_names, 'phi');
M_.param_names_tex = char(M_.param_names_tex, 'phi');
M_.param_names_long = char(M_.param_names_long, 'phi');
M_.param_names = char(M_.param_names, 'theta');
M_.param_names_tex = char(M_.param_names_tex, 'theta');
M_.param_names_long = char(M_.param_names_long, 'theta');
M_.param_names = char(M_.param_names, 'gamma1');
M_.param_names_tex = char(M_.param_names_tex, 'gamma1');
M_.param_names_long = char(M_.param_names_long, 'gamma1');
M_.exo_det_nbr = 0;
M_.exo_nbr = 7;
M_.endo_nbr = 26;
M_.param_nbr = 46;
M_.orig_endo_nbr = 26;
M_.aux_vars = [];
M_.Sigma_e = zeros(7, 7);
M_.Correlation_matrix = eye(7, 7);
M_.H = 0;
M_.Correlation_matrix_ME = 1;
M_.sigma_e_is_diagonal = 1;
options_.linear = 1;
options_.block=0;
options_.bytecode=0;
options_.use_dll=0;
erase_compiled_function('NK_CGG02AL_static');
erase_compiled_function('NK_CGG02AL_dynamic');
M_.lead_lag_incidence = [
 0 16 42;
 0 17 43;
 0 18 44;
 0 19 45;
 0 20 0;
 0 21 0;
 1 22 0;
 2 23 0;
 3 24 46;
 0 25 47;
 0 26 48;
 4 27 49;
 5 28 0;
 0 29 0;
 6 30 0;
 7 31 0;
 8 32 0;
 0 33 0;
 9 34 50;
 10 35 0;
 11 36 0;
 12 37 0;
 13 38 0;
 0 39 0;
 14 40 0;
 15 41 0;]';
M_.nstatic = 5;
M_.nfwrd   = 6;
M_.npred   = 12;
M_.nboth   = 3;
M_.nsfwrd   = 9;
M_.nspred   = 15;
M_.ndynamic   = 21;
M_.equations_tags = {
};
M_.static_and_dynamic_models_differ = 0;
M_.exo_names_orig_ord = [1:7];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(26, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(7, 1);
M_.params = NaN(46, 1);
M_.NNZDerivatives = zeros(3, 1);
M_.NNZDerivatives(1) = 100;
M_.NNZDerivatives(2) = 0;
M_.NNZDerivatives(3) = -1;
M_.params( 36 ) = 0.99;
beta = M_.params( 36 );
M_.params( 38 ) = 0.9;
rhoa = M_.params( 38 );
M_.params( 39 ) = 0;
rhou = M_.params( 39 );
M_.params( 40 ) = 7;
sigma = M_.params( 40 );
M_.params( 44 ) = 1;
phi = M_.params( 44 );
M_.params( 45 ) = 0.75;
theta = M_.params( 45 );
M_.params( 46 ) = 0.5;
gamma1 = M_.params( 46 );
M_.params( 41 ) = M_.params(40)*M_.params(46)-M_.params(46);
kappa0 = M_.params( 41 );
M_.params( 43 ) = M_.params(40)+M_.params(44)-M_.params(41);
kappa = M_.params( 43 );
M_.params( 35 ) = M_.params(40)-M_.params(41);
sigma0 = M_.params( 35 );
M_.params( 42 ) = (1-M_.params(45))*(1-M_.params(45)*M_.params(36))/M_.params(45);
delta1 = M_.params( 42 );
M_.params( 37 ) = M_.params(42)*M_.params(43);
lambda = M_.params( 37 );
thispath = cd;                                                           
cd('..');                                                                
load policy_param.mat;                                                   
for i=1:33                                                               
deep_parameter_name = M_.param_names(i,:);                           
eval(['M_.params(i)  = ' deep_parameter_name ' ;'])                  
end                                                                      
cd(thispath);   
AL_Info.forwards={'inflationq','infstar','ytildestar','ytilde','infl','ybar','ystar', 'ybarstar','y'};
AL_Info.states_long={'astar','a','inflationq','inflationql','inflationql2','infstar','infstarl','infstarl2','rstar','interest',};
AL_Info.states_short={'astar','a','inflationq','infstar','rstar','interest'};
save AL_Info AL_Info 
%
% SHOCKS instructions
%
make_ex_;
M_.exo_det_length = 0;
M_.Sigma_e(2, 2) = 0.01;
M_.Sigma_e(3, 3) = 0.015;
M_.Sigma_e(4, 4) = 0.02;
M_.Sigma_e(5, 5) = 0.012;
M_.Sigma_e(6, 6) = 0.013;
M_.Sigma_e(7, 7) = 0;
save('NK_CGG02AL_results.mat', 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save('NK_CGG02AL_results.mat', 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save('NK_CGG02AL_results.mat', 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save('NK_CGG02AL_results.mat', 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save('NK_CGG02AL_results.mat', 'estimation_info', '-append');
end


disp(['Total computing time : ' dynsec2hms(toc) ]);
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
diary off
