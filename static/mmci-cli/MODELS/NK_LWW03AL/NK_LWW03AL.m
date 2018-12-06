%
% Status : main Dynare file 
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

tic;
global M_ oo_ options_ ys0_ ex0_ estimation_info
options_ = [];
M_.fname = 'NK_LWW03AL';
%
% Some global variables initialization
%
global_initialization;
diary off;
diary('NK_LWW03AL.log');
M_.exo_names = 'rstar_';
M_.exo_names_tex = 'rstar\_';
M_.exo_names_long = 'rstar_';
M_.exo_names = char(M_.exo_names, 'pdotsh_');
M_.exo_names_tex = char(M_.exo_names_tex, 'pdotsh\_');
M_.exo_names_long = char(M_.exo_names_long, 'pdotsh_');
M_.exo_names = char(M_.exo_names, 'interest_');
M_.exo_names_tex = char(M_.exo_names_tex, 'interest\_');
M_.exo_names_long = char(M_.exo_names_long, 'interest_');
M_.endo_names = 'ygap';
M_.endo_names_tex = 'ygap';
M_.endo_names_long = 'ygap';
M_.endo_names = char(M_.endo_names, 'pdot');
M_.endo_names_tex = char(M_.endo_names_tex, 'pdot');
M_.endo_names_long = char(M_.endo_names_long, 'pdot');
M_.endo_names = char(M_.endo_names, 'rff');
M_.endo_names_tex = char(M_.endo_names_tex, 'rff');
M_.endo_names_long = char(M_.endo_names_long, 'rff');
M_.endo_names = char(M_.endo_names, 'rstar');
M_.endo_names_tex = char(M_.endo_names_tex, 'rstar');
M_.endo_names_long = char(M_.endo_names_long, 'rstar');
M_.endo_names = char(M_.endo_names, 'drff');
M_.endo_names_tex = char(M_.endo_names_tex, 'drff');
M_.endo_names_long = char(M_.endo_names_long, 'drff');
M_.endo_names = char(M_.endo_names, 'pdotsh');
M_.endo_names_tex = char(M_.endo_names_tex, 'pdotsh');
M_.endo_names_long = char(M_.endo_names_long, 'pdotsh');
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
M_.param_names = char(M_.param_names, 'discount');
M_.param_names_tex = char(M_.param_names_tex, 'discount');
M_.param_names_long = char(M_.param_names_long, 'discount');
M_.param_names = char(M_.param_names, 'sigma');
M_.param_names_tex = char(M_.param_names_tex, 'sigma');
M_.param_names_long = char(M_.param_names_long, 'sigma');
M_.param_names = char(M_.param_names, 'phi');
M_.param_names_tex = char(M_.param_names_tex, 'phi');
M_.param_names_long = char(M_.param_names_long, 'phi');
M_.param_names = char(M_.param_names, 'wtrl');
M_.param_names_tex = char(M_.param_names_tex, 'wtrl');
M_.param_names_long = char(M_.param_names_long, 'wtrl');
M_.param_names = char(M_.param_names, 'rhorstar');
M_.param_names_tex = char(M_.param_names_tex, 'rhorstar');
M_.param_names_long = char(M_.param_names_long, 'rhorstar');
M_.param_names = char(M_.param_names, 'rhopish');
M_.param_names_tex = char(M_.param_names_tex, 'rhopish');
M_.param_names_long = char(M_.param_names_long, 'rhopish');
M_.exo_det_nbr = 0;
M_.exo_nbr = 3;
M_.endo_nbr = 15;
M_.param_nbr = 40;
M_.orig_endo_nbr = 15;
M_.aux_vars = [];
M_.Sigma_e = zeros(3, 3);
M_.Correlation_matrix = eye(3, 3);
M_.H = 0;
M_.Correlation_matrix_ME = 1;
M_.sigma_e_is_diagonal = 1;
options_.linear = 1;
options_.block=0;
options_.bytecode=0;
options_.use_dll=0;
erase_compiled_function('NK_LWW03AL_static');
erase_compiled_function('NK_LWW03AL_dynamic');
M_.lead_lag_incidence = [
 0 10 25;
 0 11 26;
 1 12 0;
 2 13 0;
 0 14 0;
 3 15 0;
 0 16 0;
 4 17 0;
 0 18 0;
 5 19 27;
 6 20 0;
 7 21 0;
 8 22 0;
 9 23 0;
 0 24 0;]';
M_.nstatic = 4;
M_.nfwrd   = 2;
M_.npred   = 8;
M_.nboth   = 1;
M_.nsfwrd   = 3;
M_.nspred   = 9;
M_.ndynamic   = 11;
M_.equations_tags = {
};
M_.static_and_dynamic_models_differ = 0;
M_.exo_names_orig_ord = [1:3];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(15, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(3, 1);
M_.params = NaN(40, 1);
M_.NNZDerivatives = zeros(3, 1);
M_.NNZDerivatives(1) = 52;
M_.NNZDerivatives(2) = 0;
M_.NNZDerivatives(3) = -1;
M_.params( 35 ) = 0.990;
discount = M_.params( 35 );
M_.params( 36 ) = 6.369426751592357;
sigma = M_.params( 36 );
M_.params( 37 ) = 0.024;
phi = M_.params( 37 );
M_.params( 38 ) = 0.975;
wtrl = M_.params( 38 );
M_.params( 39 ) = 0.35;
rhorstar = M_.params( 39 );
M_.params( 40 ) = 0;
rhopish = M_.params( 40 );
thispath = cd;                                                           
cd('..');                                                                
load policy_param.mat;                                                   
for i=1:33                                                               
deep_parameter_name = M_.param_names(i,:);                           
eval(['M_.params(i)  = ' deep_parameter_name ' ;'])                  
end                                                                      
cd(thispath); 
AL_Info.forwards = {'ygap','pdot','inflationq'};
AL_Info.states_long  = {'rstar','interest','inflationq','inflationql','inflationql2'};
AL_Info.states_short = {'interest','outputgap'};
save AL_Info AL_Info 
%
% SHOCKS instructions
%
make_ex_;
M_.exo_det_length = 0;
M_.Sigma_e(1, 1) = (1-M_.params(39)^2)*13.8384;
M_.Sigma_e(2, 2) = (1-M_.params(40)^2)*5.0625;
M_.Sigma_e(3, 3) = 0;
save('NK_LWW03AL_results.mat', 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save('NK_LWW03AL_results.mat', 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save('NK_LWW03AL_results.mat', 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save('NK_LWW03AL_results.mat', 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save('NK_LWW03AL_results.mat', 'estimation_info', '-append');
end


disp(['Total computing time : ' dynsec2hms(toc) ]);
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
diary off
