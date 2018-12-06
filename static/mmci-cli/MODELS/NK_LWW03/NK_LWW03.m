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
M_.fname = 'NK_LWW03';
M_.dynare_version = '4.5.4';
oo_.dynare_version = '4.5.4';
options_.dynare_version = '4.5.4';
%
% Some global variables initialization
%
global_initialization;
diary off;
diary('NK_LWW03.log');
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
M_.endo_names = char(M_.endo_names, 'AUX_ENDO_LEAD_71');
M_.endo_names_tex = char(M_.endo_names_tex, 'AUX\_ENDO\_LEAD\_71');
M_.endo_names_long = char(M_.endo_names_long, 'AUX_ENDO_LEAD_71');
M_.endo_names = char(M_.endo_names, 'AUX_ENDO_LEAD_75');
M_.endo_names_tex = char(M_.endo_names_tex, 'AUX\_ENDO\_LEAD\_75');
M_.endo_names_long = char(M_.endo_names_long, 'AUX_ENDO_LEAD_75');
M_.endo_names = char(M_.endo_names, 'AUX_ENDO_LEAD_79');
M_.endo_names_tex = char(M_.endo_names_tex, 'AUX\_ENDO\_LEAD\_79');
M_.endo_names_long = char(M_.endo_names_long, 'AUX_ENDO_LEAD_79');
M_.endo_names = char(M_.endo_names, 'AUX_ENDO_LEAD_106');
M_.endo_names_tex = char(M_.endo_names_tex, 'AUX\_ENDO\_LEAD\_106');
M_.endo_names_long = char(M_.endo_names_long, 'AUX_ENDO_LEAD_106');
M_.endo_names = char(M_.endo_names, 'AUX_ENDO_LEAD_110');
M_.endo_names_tex = char(M_.endo_names_tex, 'AUX\_ENDO\_LEAD\_110');
M_.endo_names_long = char(M_.endo_names_long, 'AUX_ENDO_LEAD_110');
M_.endo_names = char(M_.endo_names, 'AUX_ENDO_LEAD_114');
M_.endo_names_tex = char(M_.endo_names_tex, 'AUX\_ENDO\_LEAD\_114');
M_.endo_names_long = char(M_.endo_names_long, 'AUX_ENDO_LEAD_114');
M_.endo_names = char(M_.endo_names, 'AUX_ENDO_LAG_1_1');
M_.endo_names_tex = char(M_.endo_names_tex, 'AUX\_ENDO\_LAG\_1\_1');
M_.endo_names_long = char(M_.endo_names_long, 'AUX_ENDO_LAG_1_1');
M_.endo_names = char(M_.endo_names, 'AUX_ENDO_LAG_1_2');
M_.endo_names_tex = char(M_.endo_names_tex, 'AUX\_ENDO\_LAG\_1\_2');
M_.endo_names_long = char(M_.endo_names_long, 'AUX_ENDO_LAG_1_2');
M_.endo_names = char(M_.endo_names, 'AUX_ENDO_LAG_9_1');
M_.endo_names_tex = char(M_.endo_names_tex, 'AUX\_ENDO\_LAG\_9\_1');
M_.endo_names_long = char(M_.endo_names_long, 'AUX_ENDO_LAG_9_1');
M_.endo_names = char(M_.endo_names, 'AUX_ENDO_LAG_9_2');
M_.endo_names_tex = char(M_.endo_names_tex, 'AUX\_ENDO\_LAG\_9\_2');
M_.endo_names_long = char(M_.endo_names_long, 'AUX_ENDO_LAG_9_2');
M_.endo_names = char(M_.endo_names, 'AUX_ENDO_LAG_9_3');
M_.endo_names_tex = char(M_.endo_names_tex, 'AUX\_ENDO\_LAG\_9\_3');
M_.endo_names_long = char(M_.endo_names_long, 'AUX_ENDO_LAG_9_3');
M_.endo_names = char(M_.endo_names, 'AUX_ENDO_LAG_6_1');
M_.endo_names_tex = char(M_.endo_names_tex, 'AUX\_ENDO\_LAG\_6\_1');
M_.endo_names_long = char(M_.endo_names_long, 'AUX_ENDO_LAG_6_1');
M_.endo_names = char(M_.endo_names, 'AUX_ENDO_LAG_6_2');
M_.endo_names_tex = char(M_.endo_names_tex, 'AUX\_ENDO\_LAG\_6\_2');
M_.endo_names_long = char(M_.endo_names_long, 'AUX_ENDO_LAG_6_2');
M_.endo_names = char(M_.endo_names, 'AUX_ENDO_LAG_6_3');
M_.endo_names_tex = char(M_.endo_names_tex, 'AUX\_ENDO\_LAG\_6\_3');
M_.endo_names_long = char(M_.endo_names_long, 'AUX_ENDO_LAG_6_3');
M_.endo_names = char(M_.endo_names, 'AUX_ENDO_LAG_8_1');
M_.endo_names_tex = char(M_.endo_names_tex, 'AUX\_ENDO\_LAG\_8\_1');
M_.endo_names_long = char(M_.endo_names_long, 'AUX_ENDO_LAG_8_1');
M_.endo_names = char(M_.endo_names, 'AUX_ENDO_LAG_8_2');
M_.endo_names_tex = char(M_.endo_names_tex, 'AUX\_ENDO\_LAG\_8\_2');
M_.endo_names_long = char(M_.endo_names_long, 'AUX_ENDO_LAG_8_2');
M_.endo_names = char(M_.endo_names, 'AUX_ENDO_LAG_8_3');
M_.endo_names_tex = char(M_.endo_names_tex, 'AUX\_ENDO\_LAG\_8\_3');
M_.endo_names_long = char(M_.endo_names_long, 'AUX_ENDO_LAG_8_3');
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
M_.param_partitions = struct();
M_.exo_det_nbr = 0;
M_.exo_nbr = 3;
M_.endo_nbr = 27;
M_.param_nbr = 40;
M_.orig_endo_nbr = 10;
M_.aux_vars(1).endo_index = 11;
M_.aux_vars(1).type = 0;
M_.aux_vars(2).endo_index = 12;
M_.aux_vars(2).type = 0;
M_.aux_vars(3).endo_index = 13;
M_.aux_vars(3).type = 0;
M_.aux_vars(4).endo_index = 14;
M_.aux_vars(4).type = 0;
M_.aux_vars(5).endo_index = 15;
M_.aux_vars(5).type = 0;
M_.aux_vars(6).endo_index = 16;
M_.aux_vars(6).type = 0;
M_.aux_vars(7).endo_index = 17;
M_.aux_vars(7).type = 1;
M_.aux_vars(7).orig_index = 2;
M_.aux_vars(7).orig_lead_lag = -1;
M_.aux_vars(8).endo_index = 18;
M_.aux_vars(8).type = 1;
M_.aux_vars(8).orig_index = 2;
M_.aux_vars(8).orig_lead_lag = -2;
M_.aux_vars(9).endo_index = 19;
M_.aux_vars(9).type = 1;
M_.aux_vars(9).orig_index = 10;
M_.aux_vars(9).orig_lead_lag = -1;
M_.aux_vars(10).endo_index = 20;
M_.aux_vars(10).type = 1;
M_.aux_vars(10).orig_index = 10;
M_.aux_vars(10).orig_lead_lag = -2;
M_.aux_vars(11).endo_index = 21;
M_.aux_vars(11).type = 1;
M_.aux_vars(11).orig_index = 10;
M_.aux_vars(11).orig_lead_lag = -3;
M_.aux_vars(12).endo_index = 22;
M_.aux_vars(12).type = 1;
M_.aux_vars(12).orig_index = 7;
M_.aux_vars(12).orig_lead_lag = -1;
M_.aux_vars(13).endo_index = 23;
M_.aux_vars(13).type = 1;
M_.aux_vars(13).orig_index = 7;
M_.aux_vars(13).orig_lead_lag = -2;
M_.aux_vars(14).endo_index = 24;
M_.aux_vars(14).type = 1;
M_.aux_vars(14).orig_index = 7;
M_.aux_vars(14).orig_lead_lag = -3;
M_.aux_vars(15).endo_index = 25;
M_.aux_vars(15).type = 1;
M_.aux_vars(15).orig_index = 9;
M_.aux_vars(15).orig_lead_lag = -1;
M_.aux_vars(16).endo_index = 26;
M_.aux_vars(16).type = 1;
M_.aux_vars(16).orig_index = 9;
M_.aux_vars(16).orig_lead_lag = -2;
M_.aux_vars(17).endo_index = 27;
M_.aux_vars(17).type = 1;
M_.aux_vars(17).orig_index = 9;
M_.aux_vars(17).orig_lead_lag = -3;
M_.Sigma_e = zeros(3, 3);
M_.Correlation_matrix = eye(3, 3);
M_.H = 0;
M_.Correlation_matrix_ME = 1;
M_.sigma_e_is_diagonal = 1;
M_.det_shocks = [];
options_.linear = 1;
options_.block=0;
options_.bytecode=0;
options_.use_dll=0;
M_.hessian_eq_zero = 1;
erase_compiled_function('NK_LWW03_static');
erase_compiled_function('NK_LWW03_dynamic');
M_.orig_eq_nbr = 10;
M_.eq_nbr = 27;
M_.ramsey_eq_nbr = 0;
M_.set_auxiliary_variables = exist(['./' M_.fname '_set_auxiliary_variables.m'], 'file') == 2;
M_.lead_lag_incidence = [
 0 19 46;
 1 20 47;
 2 21 0;
 3 22 0;
 0 23 0;
 4 24 0;
 5 25 0;
 0 26 0;
 6 27 48;
 7 28 49;
 0 29 50;
 0 30 51;
 0 31 52;
 0 32 53;
 0 33 54;
 0 34 55;
 8 35 0;
 9 36 0;
 10 37 0;
 11 38 0;
 12 39 0;
 13 40 0;
 14 41 0;
 15 42 0;
 16 43 0;
 17 44 0;
 18 45 0;]';
M_.nstatic = 2;
M_.nfwrd   = 7;
M_.npred   = 15;
M_.nboth   = 3;
M_.nsfwrd   = 10;
M_.nspred   = 18;
M_.ndynamic   = 25;
M_.equations_tags = {
};
M_.static_and_dynamic_models_differ = 0;
M_.exo_names_orig_ord = [1:3];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(27, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(3, 1);
M_.params = NaN(40, 1);
M_.NNZDerivatives = [87; 0; -1];
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
%
% SHOCKS instructions
%
M_.exo_det_length = 0;
M_.Sigma_e(1, 1) = (1-M_.params(39)^2)*13.8384;
M_.Sigma_e(2, 2) = (1-M_.params(40)^2)*5.0625;
M_.Sigma_e(3, 3) = 0;
save('NK_LWW03_results.mat', 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save('NK_LWW03_results.mat', 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save('NK_LWW03_results.mat', 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save('NK_LWW03_results.mat', 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save('NK_LWW03_results.mat', 'estimation_info', '-append');
end
if exist('dataset_info', 'var') == 1
  save('NK_LWW03_results.mat', 'dataset_info', '-append');
end
if exist('oo_recursive_', 'var') == 1
  save('NK_LWW03_results.mat', 'oo_recursive_', '-append');
end


disp(['Total computing time : ' dynsec2hms(toc(tic0)) ]);
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
diary off
