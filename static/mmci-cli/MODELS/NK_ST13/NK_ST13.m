%
% Status : main Dynare file
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

tic0 = tic;
% Save empty dates and dseries objects in memory.
dates('initialize');
dseries('initialize');
% Define global variables.
global M_ options_ oo_ estim_params_ bayestopt_ dataset_ dataset_info estimation_info ys0_ ex0_
options_ = [];
M_.fname = 'NK_ST13';
M_.dynare_version = '4.5.4';
oo_.dynare_version = '4.5.4';
options_.dynare_version = '4.5.4';
%
% Some global variables initialization
%
global_initialization;
diary off;
diary('NK_ST13.log');
M_.exo_names = 'q';
M_.exo_names_tex = 'q';
M_.exo_names_long = 'q';
M_.exo_names = char(M_.exo_names, 'epsilon_theta');
M_.exo_names_tex = char(M_.exo_names_tex, 'epsilon\_theta');
M_.exo_names_long = char(M_.exo_names_long, 'epsilon_theta');
M_.exo_names = char(M_.exo_names, 'j');
M_.exo_names_tex = char(M_.exo_names_tex, 'j');
M_.exo_names_long = char(M_.exo_names_long, 'j');
M_.exo_names = char(M_.exo_names, 'interest_');
M_.exo_names_tex = char(M_.exo_names_tex, 'interest\_');
M_.exo_names_long = char(M_.exo_names_long, 'interest_');
M_.endo_names = 'interest';
M_.endo_names_tex = 'interest';
M_.endo_names_long = 'interest';
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
M_.endo_names = char(M_.endo_names, 'c');
M_.endo_names_tex = char(M_.endo_names_tex, 'c');
M_.endo_names_long = char(M_.endo_names_long, 'c');
M_.endo_names = char(M_.endo_names, 'i');
M_.endo_names_tex = char(M_.endo_names_tex, 'i');
M_.endo_names_long = char(M_.endo_names_long, 'i');
M_.endo_names = char(M_.endo_names, 'y');
M_.endo_names_tex = char(M_.endo_names_tex, 'y');
M_.endo_names_long = char(M_.endo_names_long, 'y');
M_.endo_names = char(M_.endo_names, 'n');
M_.endo_names_tex = char(M_.endo_names_tex, 'n');
M_.endo_names_long = char(M_.endo_names_long, 'n');
M_.endo_names = char(M_.endo_names, 'w');
M_.endo_names_tex = char(M_.endo_names_tex, 'w');
M_.endo_names_long = char(M_.endo_names_long, 'w');
M_.endo_names = char(M_.endo_names, 'k');
M_.endo_names_tex = char(M_.endo_names_tex, 'k');
M_.endo_names_long = char(M_.endo_names_long, 'k');
M_.endo_names = char(M_.endo_names, 'delta_k');
M_.endo_names_tex = char(M_.endo_names_tex, 'delta\_k');
M_.endo_names_long = char(M_.endo_names_long, 'delta_k');
M_.endo_names = char(M_.endo_names, 'm');
M_.endo_names_tex = char(M_.endo_names_tex, 'm');
M_.endo_names_long = char(M_.endo_names_long, 'm');
M_.endo_names = char(M_.endo_names, 'd');
M_.endo_names_tex = char(M_.endo_names_tex, 'd');
M_.endo_names_long = char(M_.endo_names_long, 'd');
M_.endo_names = char(M_.endo_names, 'b');
M_.endo_names_tex = char(M_.endo_names_tex, 'b');
M_.endo_names_long = char(M_.endo_names_long, 'b');
M_.endo_names = char(M_.endo_names, 'l');
M_.endo_names_tex = char(M_.endo_names_tex, 'l');
M_.endo_names_long = char(M_.endo_names_long, 'l');
M_.endo_names = char(M_.endo_names, 'R');
M_.endo_names_tex = char(M_.endo_names_tex, 'R');
M_.endo_names_long = char(M_.endo_names_long, 'R');
M_.endo_names = char(M_.endo_names, 'Rd');
M_.endo_names_tex = char(M_.endo_names_tex, 'Rd');
M_.endo_names_long = char(M_.endo_names_long, 'Rd');
M_.endo_names = char(M_.endo_names, 'Rl');
M_.endo_names_tex = char(M_.endo_names_tex, 'Rl');
M_.endo_names_long = char(M_.endo_names_long, 'Rl');
M_.endo_names = char(M_.endo_names, 'lambda');
M_.endo_names_tex = char(M_.endo_names_tex, 'lambda');
M_.endo_names_long = char(M_.endo_names_long, 'lambda');
M_.endo_names = char(M_.endo_names, 'xi');
M_.endo_names_tex = char(M_.endo_names_tex, 'xi');
M_.endo_names_long = char(M_.endo_names_long, 'xi');
M_.endo_names = char(M_.endo_names, 'psi');
M_.endo_names_tex = char(M_.endo_names_tex, 'psi');
M_.endo_names_long = char(M_.endo_names_long, 'psi');
M_.endo_names = char(M_.endo_names, 'pi');
M_.endo_names_tex = char(M_.endo_names_tex, 'pi');
M_.endo_names_long = char(M_.endo_names_long, 'pi');
M_.endo_names = char(M_.endo_names, 'rmc');
M_.endo_names_tex = char(M_.endo_names_tex, 'rmc');
M_.endo_names_long = char(M_.endo_names_long, 'rmc');
M_.endo_names = char(M_.endo_names, 'yk');
M_.endo_names_tex = char(M_.endo_names_tex, 'yk');
M_.endo_names_long = char(M_.endo_names_long, 'yk');
M_.endo_names = char(M_.endo_names, 'yn');
M_.endo_names_tex = char(M_.endo_names_tex, 'yn');
M_.endo_names_long = char(M_.endo_names_long, 'yn');
M_.endo_names = char(M_.endo_names, 'f');
M_.endo_names_tex = char(M_.endo_names_tex, 'f');
M_.endo_names_long = char(M_.endo_names_long, 'f');
M_.endo_names = char(M_.endo_names, 'EFP');
M_.endo_names_tex = char(M_.endo_names_tex, 'EFP');
M_.endo_names_long = char(M_.endo_names_long, 'EFP');
M_.endo_names = char(M_.endo_names, 'IMP');
M_.endo_names_tex = char(M_.endo_names_tex, 'IMP');
M_.endo_names_long = char(M_.endo_names_long, 'IMP');
M_.endo_names = char(M_.endo_names, 'alpha');
M_.endo_names_tex = char(M_.endo_names_tex, 'alpha');
M_.endo_names_long = char(M_.endo_names_long, 'alpha');
M_.endo_names = char(M_.endo_names, 'omega');
M_.endo_names_tex = char(M_.endo_names_tex, 'omega');
M_.endo_names_long = char(M_.endo_names_long, 'omega');
M_.endo_names = char(M_.endo_names, 'A');
M_.endo_names_tex = char(M_.endo_names_tex, 'A');
M_.endo_names_long = char(M_.endo_names_long, 'A');
M_.endo_names = char(M_.endo_names, 'theta');
M_.endo_names_tex = char(M_.endo_names_tex, 'theta');
M_.endo_names_long = char(M_.endo_names_long, 'theta');
M_.endo_names = char(M_.endo_names, 'c_fe');
M_.endo_names_tex = char(M_.endo_names_tex, 'c\_fe');
M_.endo_names_long = char(M_.endo_names_long, 'c_fe');
M_.endo_names = char(M_.endo_names, 'i_fe');
M_.endo_names_tex = char(M_.endo_names_tex, 'i\_fe');
M_.endo_names_long = char(M_.endo_names_long, 'i_fe');
M_.endo_names = char(M_.endo_names, 'y_fe');
M_.endo_names_tex = char(M_.endo_names_tex, 'y\_fe');
M_.endo_names_long = char(M_.endo_names_long, 'y_fe');
M_.endo_names = char(M_.endo_names, 'n_fe');
M_.endo_names_tex = char(M_.endo_names_tex, 'n\_fe');
M_.endo_names_long = char(M_.endo_names_long, 'n_fe');
M_.endo_names = char(M_.endo_names, 'w_fe');
M_.endo_names_tex = char(M_.endo_names_tex, 'w\_fe');
M_.endo_names_long = char(M_.endo_names_long, 'w_fe');
M_.endo_names = char(M_.endo_names, 'k_fe');
M_.endo_names_tex = char(M_.endo_names_tex, 'k\_fe');
M_.endo_names_long = char(M_.endo_names_long, 'k_fe');
M_.endo_names = char(M_.endo_names, 'delta_k_fe');
M_.endo_names_tex = char(M_.endo_names_tex, 'delta\_k\_fe');
M_.endo_names_long = char(M_.endo_names_long, 'delta_k_fe');
M_.endo_names = char(M_.endo_names, 'm_fe');
M_.endo_names_tex = char(M_.endo_names_tex, 'm\_fe');
M_.endo_names_long = char(M_.endo_names_long, 'm_fe');
M_.endo_names = char(M_.endo_names, 'd_fe');
M_.endo_names_tex = char(M_.endo_names_tex, 'd\_fe');
M_.endo_names_long = char(M_.endo_names_long, 'd_fe');
M_.endo_names = char(M_.endo_names, 'b_fe');
M_.endo_names_tex = char(M_.endo_names_tex, 'b\_fe');
M_.endo_names_long = char(M_.endo_names_long, 'b_fe');
M_.endo_names = char(M_.endo_names, 'l_fe');
M_.endo_names_tex = char(M_.endo_names_tex, 'l\_fe');
M_.endo_names_long = char(M_.endo_names_long, 'l_fe');
M_.endo_names = char(M_.endo_names, 'R_fe');
M_.endo_names_tex = char(M_.endo_names_tex, 'R\_fe');
M_.endo_names_long = char(M_.endo_names_long, 'R_fe');
M_.endo_names = char(M_.endo_names, 'Rd_fe');
M_.endo_names_tex = char(M_.endo_names_tex, 'Rd\_fe');
M_.endo_names_long = char(M_.endo_names_long, 'Rd_fe');
M_.endo_names = char(M_.endo_names, 'Rl_fe');
M_.endo_names_tex = char(M_.endo_names_tex, 'Rl\_fe');
M_.endo_names_long = char(M_.endo_names_long, 'Rl_fe');
M_.endo_names = char(M_.endo_names, 'lambda_fe');
M_.endo_names_tex = char(M_.endo_names_tex, 'lambda\_fe');
M_.endo_names_long = char(M_.endo_names_long, 'lambda_fe');
M_.endo_names = char(M_.endo_names, 'xi_fe');
M_.endo_names_tex = char(M_.endo_names_tex, 'xi\_fe');
M_.endo_names_long = char(M_.endo_names_long, 'xi_fe');
M_.endo_names = char(M_.endo_names, 'psi_fe');
M_.endo_names_tex = char(M_.endo_names_tex, 'psi\_fe');
M_.endo_names_long = char(M_.endo_names_long, 'psi_fe');
M_.endo_names = char(M_.endo_names, 'rmc_fe');
M_.endo_names_tex = char(M_.endo_names_tex, 'rmc\_fe');
M_.endo_names_long = char(M_.endo_names_long, 'rmc_fe');
M_.endo_names = char(M_.endo_names, 'yk_fe');
M_.endo_names_tex = char(M_.endo_names_tex, 'yk\_fe');
M_.endo_names_long = char(M_.endo_names_long, 'yk_fe');
M_.endo_names = char(M_.endo_names, 'yn_fe');
M_.endo_names_tex = char(M_.endo_names_tex, 'yn\_fe');
M_.endo_names_long = char(M_.endo_names_long, 'yn_fe');
M_.endo_names = char(M_.endo_names, 'f_fe');
M_.endo_names_tex = char(M_.endo_names_tex, 'f\_fe');
M_.endo_names_long = char(M_.endo_names_long, 'f_fe');
M_.endo_names = char(M_.endo_names, 'EFP_fe');
M_.endo_names_tex = char(M_.endo_names_tex, 'EFP\_fe');
M_.endo_names_long = char(M_.endo_names_long, 'EFP_fe');
M_.endo_names = char(M_.endo_names, 'IMP_fe');
M_.endo_names_tex = char(M_.endo_names_tex, 'IMP\_fe');
M_.endo_names_long = char(M_.endo_names_long, 'IMP_fe');
M_.endo_names = char(M_.endo_names, 'AUX_ENDO_LEAD_88');
M_.endo_names_tex = char(M_.endo_names_tex, 'AUX\_ENDO\_LEAD\_88');
M_.endo_names_long = char(M_.endo_names_long, 'AUX_ENDO_LEAD_88');
M_.endo_names = char(M_.endo_names, 'AUX_ENDO_LEAD_92');
M_.endo_names_tex = char(M_.endo_names_tex, 'AUX\_ENDO\_LEAD\_92');
M_.endo_names_long = char(M_.endo_names_long, 'AUX_ENDO_LEAD_92');
M_.endo_names = char(M_.endo_names, 'AUX_ENDO_LEAD_96');
M_.endo_names_tex = char(M_.endo_names_tex, 'AUX\_ENDO\_LEAD\_96');
M_.endo_names_long = char(M_.endo_names_long, 'AUX_ENDO_LEAD_96');
M_.endo_names = char(M_.endo_names, 'AUX_ENDO_LEAD_123');
M_.endo_names_tex = char(M_.endo_names_tex, 'AUX\_ENDO\_LEAD\_123');
M_.endo_names_long = char(M_.endo_names_long, 'AUX_ENDO_LEAD_123');
M_.endo_names = char(M_.endo_names, 'AUX_ENDO_LEAD_127');
M_.endo_names_tex = char(M_.endo_names_tex, 'AUX\_ENDO\_LEAD\_127');
M_.endo_names_long = char(M_.endo_names_long, 'AUX_ENDO_LEAD_127');
M_.endo_names = char(M_.endo_names, 'AUX_ENDO_LEAD_131');
M_.endo_names_tex = char(M_.endo_names_tex, 'AUX\_ENDO\_LEAD\_131');
M_.endo_names_long = char(M_.endo_names_long, 'AUX_ENDO_LEAD_131');
M_.endo_names = char(M_.endo_names, 'AUX_ENDO_LEAD_158');
M_.endo_names_tex = char(M_.endo_names_tex, 'AUX\_ENDO\_LEAD\_158');
M_.endo_names_long = char(M_.endo_names_long, 'AUX_ENDO_LEAD_158');
M_.endo_names = char(M_.endo_names, 'AUX_ENDO_LEAD_162');
M_.endo_names_tex = char(M_.endo_names_tex, 'AUX\_ENDO\_LEAD\_162');
M_.endo_names_long = char(M_.endo_names_long, 'AUX_ENDO_LEAD_162');
M_.endo_names = char(M_.endo_names, 'AUX_ENDO_LEAD_166');
M_.endo_names_tex = char(M_.endo_names_tex, 'AUX\_ENDO\_LEAD\_166');
M_.endo_names_long = char(M_.endo_names_long, 'AUX_ENDO_LEAD_166');
M_.endo_names = char(M_.endo_names, 'AUX_ENDO_LAG_2_1');
M_.endo_names_tex = char(M_.endo_names_tex, 'AUX\_ENDO\_LAG\_2\_1');
M_.endo_names_long = char(M_.endo_names_long, 'AUX_ENDO_LAG_2_1');
M_.endo_names = char(M_.endo_names, 'AUX_ENDO_LAG_2_2');
M_.endo_names_tex = char(M_.endo_names_tex, 'AUX\_ENDO\_LAG\_2\_2');
M_.endo_names_long = char(M_.endo_names_long, 'AUX_ENDO_LAG_2_2');
M_.endo_names = char(M_.endo_names, 'AUX_ENDO_LAG_4_1');
M_.endo_names_tex = char(M_.endo_names_tex, 'AUX\_ENDO\_LAG\_4\_1');
M_.endo_names_long = char(M_.endo_names_long, 'AUX_ENDO_LAG_4_1');
M_.endo_names = char(M_.endo_names, 'AUX_ENDO_LAG_4_2');
M_.endo_names_tex = char(M_.endo_names_tex, 'AUX\_ENDO\_LAG\_4\_2');
M_.endo_names_long = char(M_.endo_names_long, 'AUX_ENDO_LAG_4_2');
M_.endo_names = char(M_.endo_names, 'AUX_ENDO_LAG_4_3');
M_.endo_names_tex = char(M_.endo_names_tex, 'AUX\_ENDO\_LAG\_4\_3');
M_.endo_names_long = char(M_.endo_names_long, 'AUX_ENDO_LAG_4_3');
M_.endo_names = char(M_.endo_names, 'AUX_ENDO_LAG_3_1');
M_.endo_names_tex = char(M_.endo_names_tex, 'AUX\_ENDO\_LAG\_3\_1');
M_.endo_names_long = char(M_.endo_names_long, 'AUX_ENDO_LAG_3_1');
M_.endo_names = char(M_.endo_names, 'AUX_ENDO_LAG_3_2');
M_.endo_names_tex = char(M_.endo_names_tex, 'AUX\_ENDO\_LAG\_3\_2');
M_.endo_names_long = char(M_.endo_names_long, 'AUX_ENDO_LAG_3_2');
M_.endo_names = char(M_.endo_names, 'AUX_ENDO_LAG_3_3');
M_.endo_names_tex = char(M_.endo_names_tex, 'AUX\_ENDO\_LAG\_3\_3');
M_.endo_names_long = char(M_.endo_names_long, 'AUX_ENDO_LAG_3_3');
M_.endo_names = char(M_.endo_names, 'AUX_ENDO_LAG_0_1');
M_.endo_names_tex = char(M_.endo_names_tex, 'AUX\_ENDO\_LAG\_0\_1');
M_.endo_names_long = char(M_.endo_names_long, 'AUX_ENDO_LAG_0_1');
M_.endo_names = char(M_.endo_names, 'AUX_ENDO_LAG_0_2');
M_.endo_names_tex = char(M_.endo_names_tex, 'AUX\_ENDO\_LAG\_0\_2');
M_.endo_names_long = char(M_.endo_names_long, 'AUX_ENDO_LAG_0_2');
M_.endo_names = char(M_.endo_names, 'AUX_ENDO_LAG_0_3');
M_.endo_names_tex = char(M_.endo_names_tex, 'AUX\_ENDO\_LAG\_0\_3');
M_.endo_names_long = char(M_.endo_names_long, 'AUX_ENDO_LAG_0_3');
M_.endo_names = char(M_.endo_names, 'AUX_ENDO_LAG_2_3');
M_.endo_names_tex = char(M_.endo_names_tex, 'AUX\_ENDO\_LAG\_2\_3');
M_.endo_names_long = char(M_.endo_names_long, 'AUX_ENDO_LAG_2_3');
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
M_.param_names = char(M_.param_names, 'phi');
M_.param_names_tex = char(M_.param_names_tex, 'phi');
M_.param_names_long = char(M_.param_names_long, 'phi');
M_.param_names = char(M_.param_names, 'rho_alpha');
M_.param_names_tex = char(M_.param_names_tex, 'rho\_alpha');
M_.param_names_long = char(M_.param_names_long, 'rho_alpha');
M_.param_names = char(M_.param_names, 'phi_d');
M_.param_names_tex = char(M_.param_names_tex, 'phi\_d');
M_.param_names_long = char(M_.param_names_long, 'phi_d');
M_.param_names = char(M_.param_names, 'beta');
M_.param_names_tex = char(M_.param_names_tex, 'beta');
M_.param_names_long = char(M_.param_names_long, 'beta');
M_.param_names = char(M_.param_names, 'gamma');
M_.param_names_tex = char(M_.param_names_tex, 'gamma');
M_.param_names_long = char(M_.param_names_long, 'gamma');
M_.param_names = char(M_.param_names, 'chi');
M_.param_names_tex = char(M_.param_names_tex, 'chi');
M_.param_names_long = char(M_.param_names_long, 'chi');
M_.param_names = char(M_.param_names, 'rho_theta');
M_.param_names_tex = char(M_.param_names_tex, 'rho\_theta');
M_.param_names_long = char(M_.param_names_long, 'rho_theta');
M_.param_names = char(M_.param_names, 'phi_p');
M_.param_names_tex = char(M_.param_names_tex, 'phi\_p');
M_.param_names_long = char(M_.param_names_long, 'phi_p');
M_.param_names = char(M_.param_names, 'phi_k');
M_.param_names_tex = char(M_.param_names_tex, 'phi\_k');
M_.param_names_long = char(M_.param_names_long, 'phi_k');
M_.param_names = char(M_.param_names, 'delta');
M_.param_names_tex = char(M_.param_names_tex, 'delta');
M_.param_names_long = char(M_.param_names_long, 'delta');
M_.param_names = char(M_.param_names, 'sigma');
M_.param_names_tex = char(M_.param_names_tex, 'sigma');
M_.param_names_long = char(M_.param_names_long, 'sigma');
M_.param_names = char(M_.param_names, 'rho');
M_.param_names_tex = char(M_.param_names_tex, 'rho');
M_.param_names_long = char(M_.param_names_long, 'rho');
M_.param_names = char(M_.param_names, 'rho_pi');
M_.param_names_tex = char(M_.param_names_tex, 'rho\_pi');
M_.param_names_long = char(M_.param_names_long, 'rho_pi');
M_.param_names = char(M_.param_names, 'sigma_r');
M_.param_names_tex = char(M_.param_names_tex, 'sigma\_r');
M_.param_names_long = char(M_.param_names_long, 'sigma_r');
M_.param_names = char(M_.param_names, 'sigma_theta');
M_.param_names_tex = char(M_.param_names_tex, 'sigma\_theta');
M_.param_names_long = char(M_.param_names_long, 'sigma_theta');
M_.param_names = char(M_.param_names, 'sigma_j');
M_.param_names_tex = char(M_.param_names_tex, 'sigma\_j');
M_.param_names_long = char(M_.param_names_long, 'sigma_j');
M_.param_names = char(M_.param_names, 'sigma_q');
M_.param_names_tex = char(M_.param_names_tex, 'sigma\_q');
M_.param_names_long = char(M_.param_names_long, 'sigma_q');
M_.param_names = char(M_.param_names, 'rho_omega');
M_.param_names_tex = char(M_.param_names_tex, 'rho\_omega');
M_.param_names_long = char(M_.param_names_long, 'rho_omega');
M_.param_names = char(M_.param_names, 'mu');
M_.param_names_tex = char(M_.param_names_tex, 'mu');
M_.param_names_long = char(M_.param_names_long, 'mu');
M_.param_names = char(M_.param_names, 'c_ss');
M_.param_names_tex = char(M_.param_names_tex, 'c\_ss');
M_.param_names_long = char(M_.param_names_long, 'c_ss');
M_.param_names = char(M_.param_names, 'i_ss');
M_.param_names_tex = char(M_.param_names_tex, 'i\_ss');
M_.param_names_long = char(M_.param_names_long, 'i_ss');
M_.param_names = char(M_.param_names, 'y_ss');
M_.param_names_tex = char(M_.param_names_tex, 'y\_ss');
M_.param_names_long = char(M_.param_names_long, 'y_ss');
M_.param_names = char(M_.param_names, 'n_ss');
M_.param_names_tex = char(M_.param_names_tex, 'n\_ss');
M_.param_names_long = char(M_.param_names_long, 'n_ss');
M_.param_names = char(M_.param_names, 'w_ss');
M_.param_names_tex = char(M_.param_names_tex, 'w\_ss');
M_.param_names_long = char(M_.param_names_long, 'w_ss');
M_.param_names = char(M_.param_names, 'k_ss');
M_.param_names_tex = char(M_.param_names_tex, 'k\_ss');
M_.param_names_long = char(M_.param_names_long, 'k_ss');
M_.param_names = char(M_.param_names, 'm_ss');
M_.param_names_tex = char(M_.param_names_tex, 'm\_ss');
M_.param_names_long = char(M_.param_names_long, 'm_ss');
M_.param_names = char(M_.param_names, 'd_ss');
M_.param_names_tex = char(M_.param_names_tex, 'd\_ss');
M_.param_names_long = char(M_.param_names_long, 'd_ss');
M_.param_names = char(M_.param_names, 'b_ss');
M_.param_names_tex = char(M_.param_names_tex, 'b\_ss');
M_.param_names_long = char(M_.param_names_long, 'b_ss');
M_.param_names = char(M_.param_names, 'l_ss');
M_.param_names_tex = char(M_.param_names_tex, 'l\_ss');
M_.param_names_long = char(M_.param_names_long, 'l_ss');
M_.param_names = char(M_.param_names, 'R_ss');
M_.param_names_tex = char(M_.param_names_tex, 'R\_ss');
M_.param_names_long = char(M_.param_names_long, 'R_ss');
M_.param_names = char(M_.param_names, 'Rd_ss');
M_.param_names_tex = char(M_.param_names_tex, 'Rd\_ss');
M_.param_names_long = char(M_.param_names_long, 'Rd_ss');
M_.param_names = char(M_.param_names, 'Rl_ss');
M_.param_names_tex = char(M_.param_names_tex, 'Rl\_ss');
M_.param_names_long = char(M_.param_names_long, 'Rl_ss');
M_.param_names = char(M_.param_names, 'lambda_ss');
M_.param_names_tex = char(M_.param_names_tex, 'lambda\_ss');
M_.param_names_long = char(M_.param_names_long, 'lambda_ss');
M_.param_names = char(M_.param_names, 'xi_ss');
M_.param_names_tex = char(M_.param_names_tex, 'xi\_ss');
M_.param_names_long = char(M_.param_names_long, 'xi_ss');
M_.param_names = char(M_.param_names, 'psi_ss');
M_.param_names_tex = char(M_.param_names_tex, 'psi\_ss');
M_.param_names_long = char(M_.param_names_long, 'psi_ss');
M_.param_names = char(M_.param_names, 'pi_ss');
M_.param_names_tex = char(M_.param_names_tex, 'pi\_ss');
M_.param_names_long = char(M_.param_names_long, 'pi_ss');
M_.param_names = char(M_.param_names, 'rmc_ss');
M_.param_names_tex = char(M_.param_names_tex, 'rmc\_ss');
M_.param_names_long = char(M_.param_names_long, 'rmc_ss');
M_.param_names = char(M_.param_names, 'yk_ss');
M_.param_names_tex = char(M_.param_names_tex, 'yk\_ss');
M_.param_names_long = char(M_.param_names_long, 'yk_ss');
M_.param_names = char(M_.param_names, 'yn_ss');
M_.param_names_tex = char(M_.param_names_tex, 'yn\_ss');
M_.param_names_long = char(M_.param_names_long, 'yn_ss');
M_.param_names = char(M_.param_names, 'f_ss');
M_.param_names_tex = char(M_.param_names_tex, 'f\_ss');
M_.param_names_long = char(M_.param_names_long, 'f_ss');
M_.param_names = char(M_.param_names, 'EFP_ss');
M_.param_names_tex = char(M_.param_names_tex, 'EFP\_ss');
M_.param_names_long = char(M_.param_names_long, 'EFP_ss');
M_.param_names = char(M_.param_names, 'IMP_ss');
M_.param_names_tex = char(M_.param_names_tex, 'IMP\_ss');
M_.param_names_long = char(M_.param_names_long, 'IMP_ss');
M_.param_names = char(M_.param_names, 'alpha_ss');
M_.param_names_tex = char(M_.param_names_tex, 'alpha\_ss');
M_.param_names_long = char(M_.param_names_long, 'alpha_ss');
M_.param_names = char(M_.param_names, 'omega_ss');
M_.param_names_tex = char(M_.param_names_tex, 'omega\_ss');
M_.param_names_long = char(M_.param_names_long, 'omega_ss');
M_.param_names = char(M_.param_names, 'A_ss');
M_.param_names_tex = char(M_.param_names_tex, 'A\_ss');
M_.param_names_long = char(M_.param_names_long, 'A_ss');
M_.param_names = char(M_.param_names, 'theta_ss');
M_.param_names_tex = char(M_.param_names_tex, 'theta\_ss');
M_.param_names_long = char(M_.param_names_long, 'theta_ss');
M_.param_partitions = struct();
M_.exo_det_nbr = 0;
M_.exo_nbr = 4;
M_.endo_nbr = 77;
M_.param_nbr = 79;
M_.orig_endo_nbr = 56;
M_.aux_vars(1).endo_index = 57;
M_.aux_vars(1).type = 0;
M_.aux_vars(2).endo_index = 58;
M_.aux_vars(2).type = 0;
M_.aux_vars(3).endo_index = 59;
M_.aux_vars(3).type = 0;
M_.aux_vars(4).endo_index = 60;
M_.aux_vars(4).type = 0;
M_.aux_vars(5).endo_index = 61;
M_.aux_vars(5).type = 0;
M_.aux_vars(6).endo_index = 62;
M_.aux_vars(6).type = 0;
M_.aux_vars(7).endo_index = 63;
M_.aux_vars(7).type = 0;
M_.aux_vars(8).endo_index = 64;
M_.aux_vars(8).type = 0;
M_.aux_vars(9).endo_index = 65;
M_.aux_vars(9).type = 0;
M_.aux_vars(10).endo_index = 66;
M_.aux_vars(10).type = 1;
M_.aux_vars(10).orig_index = 3;
M_.aux_vars(10).orig_lead_lag = -1;
M_.aux_vars(11).endo_index = 67;
M_.aux_vars(11).type = 1;
M_.aux_vars(11).orig_index = 3;
M_.aux_vars(11).orig_lead_lag = -2;
M_.aux_vars(12).endo_index = 68;
M_.aux_vars(12).type = 1;
M_.aux_vars(12).orig_index = 5;
M_.aux_vars(12).orig_lead_lag = -1;
M_.aux_vars(13).endo_index = 69;
M_.aux_vars(13).type = 1;
M_.aux_vars(13).orig_index = 5;
M_.aux_vars(13).orig_lead_lag = -2;
M_.aux_vars(14).endo_index = 70;
M_.aux_vars(14).type = 1;
M_.aux_vars(14).orig_index = 5;
M_.aux_vars(14).orig_lead_lag = -3;
M_.aux_vars(15).endo_index = 71;
M_.aux_vars(15).type = 1;
M_.aux_vars(15).orig_index = 4;
M_.aux_vars(15).orig_lead_lag = -1;
M_.aux_vars(16).endo_index = 72;
M_.aux_vars(16).type = 1;
M_.aux_vars(16).orig_index = 4;
M_.aux_vars(16).orig_lead_lag = -2;
M_.aux_vars(17).endo_index = 73;
M_.aux_vars(17).type = 1;
M_.aux_vars(17).orig_index = 4;
M_.aux_vars(17).orig_lead_lag = -3;
M_.aux_vars(18).endo_index = 74;
M_.aux_vars(18).type = 1;
M_.aux_vars(18).orig_index = 1;
M_.aux_vars(18).orig_lead_lag = -1;
M_.aux_vars(19).endo_index = 75;
M_.aux_vars(19).type = 1;
M_.aux_vars(19).orig_index = 1;
M_.aux_vars(19).orig_lead_lag = -2;
M_.aux_vars(20).endo_index = 76;
M_.aux_vars(20).type = 1;
M_.aux_vars(20).orig_index = 1;
M_.aux_vars(20).orig_lead_lag = -3;
M_.aux_vars(21).endo_index = 77;
M_.aux_vars(21).type = 1;
M_.aux_vars(21).orig_index = 3;
M_.aux_vars(21).orig_lead_lag = -3;
M_.Sigma_e = zeros(4, 4);
M_.Correlation_matrix = eye(4, 4);
M_.H = 0;
M_.Correlation_matrix_ME = 1;
M_.sigma_e_is_diagonal = 1;
M_.det_shocks = [];
options_.block=0;
options_.bytecode=0;
options_.use_dll=0;
M_.hessian_eq_zero = 0;
erase_compiled_function('NK_ST13_static');
erase_compiled_function('NK_ST13_dynamic');
M_.orig_eq_nbr = 56;
M_.eq_nbr = 77;
M_.ramsey_eq_nbr = 0;
M_.set_auxiliary_variables = exist(['./' M_.fname '_set_auxiliary_variables.m'], 'file') == 2;
M_.lead_lag_incidence = [
 1 28 0;
 0 29 0;
 2 30 105;
 3 31 106;
 4 32 107;
 0 33 0;
 0 34 0;
 0 35 108;
 0 36 0;
 0 37 0;
 5 38 0;
 0 39 109;
 0 40 0;
 6 41 110;
 0 42 0;
 0 43 0;
 0 44 0;
 0 45 0;
 7 46 0;
 8 47 111;
 0 48 0;
 0 49 112;
 0 50 113;
 0 51 0;
 0 52 0;
 0 53 0;
 0 54 0;
 0 55 0;
 0 56 0;
 9 57 0;
 10 58 0;
 0 59 0;
 11 60 0;
 0 61 0;
 0 62 0;
 0 63 0;
 0 64 0;
 0 65 0;
 12 66 0;
 0 67 114;
 0 68 0;
 13 69 115;
 0 70 0;
 0 71 0;
 0 72 0;
 0 73 0;
 14 74 0;
 15 75 116;
 0 76 0;
 0 77 117;
 0 78 0;
 0 79 0;
 0 80 0;
 0 81 0;
 0 82 0;
 0 83 0;
 0 84 118;
 0 85 119;
 0 86 120;
 0 87 121;
 0 88 122;
 0 89 123;
 0 90 124;
 0 91 125;
 0 92 126;
 16 93 0;
 17 94 0;
 18 95 0;
 19 96 0;
 20 97 0;
 21 98 0;
 22 99 0;
 23 100 0;
 24 101 0;
 25 102 0;
 26 103 0;
 27 104 0;]';
M_.nstatic = 35;
M_.nfwrd   = 15;
M_.npred   = 20;
M_.nboth   = 7;
M_.nsfwrd   = 22;
M_.nspred   = 27;
M_.ndynamic   = 42;
M_.equations_tags = {
};
M_.static_and_dynamic_models_differ = 0;
M_.exo_names_orig_ord = [1:4];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(77, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(4, 1);
M_.params = NaN(79, 1);
M_.NNZDerivatives = [296; 274; -1];
thispath = cd;                                                           
cd('..');                                                                
load policy_param.mat;                                                   
for i=1:33                                                               
deep_parameter_name = M_.param_names(i,:);                           
eval(['M_.params(i)  = ' deep_parameter_name ' ;'])                  
end                                                                      
cd(thispath);   
M_.params( 32 ) = 100;
std_r_ = M_.params( 32 );
M_.params( 37 ) = 0.995;
beta = M_.params( 37 );
M_.params( 34 ) = 3;
phi = M_.params( 34 );
M_.params( 38 ) = 0.35;
gamma = M_.params( 38 );
M_.params( 43 ) = 0.025;
delta = M_.params( 43 );
M_.params( 44 ) = 0.00675;
sigma = M_.params( 44 );
M_.params( 36 ) = 10;
phi_d = M_.params( 36 );
M_.params( 35 ) = 0.88;
rho_alpha = M_.params( 35 );
M_.params( 41 ) = 58.25;
phi_p = M_.params( 41 );
M_.params( 42 ) = 4;
phi_k = M_.params( 42 );
M_.params( 45 ) = 0.75;
rho = M_.params( 45 );
M_.params( 46 ) = 1.5;
rho_pi = M_.params( 46 );
M_.params( 47 ) = 0.0025;
sigma_r = M_.params( 47 );
M_.params( 48 ) = 0.008;
sigma_theta = M_.params( 48 );
M_.params( 49 ) = 0.0018;
sigma_j = M_.params( 49 );
M_.params( 50 ) = 0.006;
sigma_q = M_.params( 50 );
M_.params( 51 ) = 0.9;
rho_omega = M_.params( 51 );
M_.params( 39 ) = 0;
chi = M_.params( 39 );
M_.params( 40 ) = 0.95;
rho_theta = M_.params( 40 );
M_.params( 52 ) = 6;
mu = M_.params( 52 );
M_.params( 78 ) = 1;
A_ss = M_.params( 78 );
M_.params( 77 ) = 0.0009;
omega_ss = M_.params( 77 );
M_.params( 76 ) = 0.7;
alpha_ss = M_.params( 76 );
M_.params( 69 ) = 1;
pi_ss = M_.params( 69 );
M_.params( 68 ) = M_.params(37);
psi_ss = M_.params( 68 );
delta_k_ss  = 0;        
M_.params( 79 ) = 0;
theta_ss = M_.params( 79 );
M_.params( 70 ) = (M_.params(52)-1)/M_.params(52);
rmc_ss = M_.params( 70 );
M_.params( 63 ) = 1/M_.params(37);
R_ss = M_.params( 63 );
M_.params( 65 ) = M_.params(44)/M_.params(37)+M_.params(63);
Rl_ss = M_.params( 65 );
M_.params( 64 ) = M_.params(63)-0.00425;
Rd_ss = M_.params( 64 );
M_.params( 71 ) = M_.params(65)*(1-M_.params(37)*(1-M_.params(43)))/(M_.params(37)*M_.params(70));
yk_ss = M_.params( 71 );
y_over_k = yk_ss/gamma;
k_over_n=y_over_k^(1/(gamma-1));
y_over_n=k_over_n^gamma;
M_.params( 72 ) = y_over_n*(1-M_.params(38));
yn_ss = M_.params( 72 );
M_.params( 57 ) = M_.params(70)*M_.params(37)*M_.params(72)/M_.params(65);
w_ss = M_.params( 57 );
M_.params( 66 ) = M_.params(34)/M_.params(57);
lambda_ss = M_.params( 66 );
M_.params( 67 ) = M_.params(37)*M_.params(66)*(M_.params(63)-M_.params(64));
xi_ss = M_.params( 67 );
M_.params( 53 ) = 1/(M_.params(66)*(1+(M_.params(63)-M_.params(64))*M_.params(37)*M_.params(76)));
c_ss = M_.params( 53 );
M_.params( 60 ) = M_.params(76)*M_.params(53);
d_ss = M_.params( 60 );
M_.params( 56 ) = (M_.params(53)+(M_.params(63)-M_.params(64))*M_.params(37)*M_.params(60))/(y_over_n-M_.params(43)*k_over_n-M_.params(44)*M_.params(57)-k_over_n*M_.params(44)*M_.params(43));
n_ss = M_.params( 56 );
M_.params( 55 ) = y_over_n*M_.params(56);
y_ss = M_.params( 55 );
M_.params( 58 ) = k_over_n*M_.params(56);
k_ss = M_.params( 58 );
M_.params( 54 ) = M_.params(43)*M_.params(58);
i_ss = M_.params( 54 );
M_.params( 62 ) = M_.params(57)*M_.params(56)+M_.params(54);
l_ss = M_.params( 62 );
M_.params( 59 ) = (M_.params(63)-M_.params(64))*M_.params(60)/(M_.params(63)-1);
m_ss = M_.params( 59 );
M_.params( 77 ) = M_.params(37)*(M_.params(63)-M_.params(64))*M_.params(59);
omega_ss = M_.params( 77 );
M_.params( 73 ) = M_.params(44)*M_.params(62)+M_.params(60)*M_.params(77)/M_.params(59);
f_ss = M_.params( 73 );
M_.params( 61 ) = M_.params(62)-M_.params(60);
b_ss = M_.params( 61 );
M_.params( 74 ) = M_.params(65)-M_.params(63);
EFP_ss = M_.params( 74 );
M_.params( 75 ) = M_.params(63)-M_.params(64);
IMP_ss = M_.params( 75 );
%
% INITVAL instructions
%
options_.initval_file = 0;
oo_.steady_state( 6 ) = M_.params(53);
oo_.steady_state( 7 ) = M_.params(54);
oo_.steady_state( 8 ) = M_.params(55);
oo_.steady_state( 9 ) = M_.params(56);
oo_.steady_state( 10 ) = M_.params(57);
oo_.steady_state( 11 ) = M_.params(58);
oo_.steady_state( 12 ) = delta_k_ss;
oo_.steady_state( 13 ) = M_.params(59);
oo_.steady_state( 14 ) = M_.params(60);
oo_.steady_state( 15 ) = M_.params(61);
oo_.steady_state( 16 ) = M_.params(62);
oo_.steady_state( 17 ) = M_.params(63);
oo_.steady_state( 18 ) = M_.params(64);
oo_.steady_state( 19 ) = M_.params(65);
oo_.steady_state( 20 ) = M_.params(66);
oo_.steady_state( 21 ) = M_.params(67);
oo_.steady_state( 22 ) = M_.params(68);
oo_.steady_state( 23 ) = M_.params(69);
oo_.steady_state( 24 ) = M_.params(70);
oo_.steady_state( 25 ) = M_.params(71);
oo_.steady_state( 26 ) = M_.params(72);
oo_.steady_state( 27 ) = M_.params(73);
oo_.steady_state( 28 ) = M_.params(74);
oo_.steady_state( 29 ) = M_.params(75);
oo_.steady_state( 30 ) = M_.params(76);
oo_.steady_state( 31 ) = M_.params(77);
oo_.steady_state( 32 ) = M_.params(78);
oo_.steady_state( 33 ) = M_.params(79);
oo_.steady_state( 34 ) = M_.params(53);
oo_.steady_state( 35 ) = M_.params(54);
oo_.steady_state( 36 ) = M_.params(55);
oo_.steady_state( 37 ) = M_.params(56);
oo_.steady_state( 38 ) = M_.params(57);
oo_.steady_state( 39 ) = M_.params(58);
oo_.steady_state( 40 ) = delta_k_ss;
oo_.steady_state( 41 ) = M_.params(59);
oo_.steady_state( 42 ) = M_.params(60);
oo_.steady_state( 43 ) = M_.params(61);
oo_.steady_state( 44 ) = M_.params(62);
oo_.steady_state( 45 ) = M_.params(63);
oo_.steady_state( 46 ) = M_.params(64);
oo_.steady_state( 47 ) = M_.params(65);
oo_.steady_state( 48 ) = M_.params(66);
oo_.steady_state( 49 ) = M_.params(67);
oo_.steady_state( 50 ) = M_.params(68);
oo_.steady_state( 51 ) = M_.params(70);
oo_.steady_state( 52 ) = M_.params(71);
oo_.steady_state( 53 ) = M_.params(72);
oo_.steady_state( 54 ) = M_.params(73);
oo_.steady_state( 55 ) = M_.params(74);
oo_.steady_state( 56 ) = M_.params(75);
oo_.steady_state(57)=oo_.steady_state(3);
oo_.steady_state(58)=oo_.steady_state(57);
oo_.steady_state(59)=oo_.steady_state(58);
oo_.steady_state(60)=oo_.steady_state(4);
oo_.steady_state(61)=oo_.steady_state(60);
oo_.steady_state(62)=oo_.steady_state(61);
oo_.steady_state(63)=oo_.steady_state(5);
oo_.steady_state(64)=oo_.steady_state(63);
oo_.steady_state(65)=oo_.steady_state(64);
oo_.steady_state(66)=oo_.steady_state(3);
oo_.steady_state(67)=oo_.steady_state(66);
oo_.steady_state(68)=oo_.steady_state(5);
oo_.steady_state(69)=oo_.steady_state(68);
oo_.steady_state(70)=oo_.steady_state(69);
oo_.steady_state(71)=oo_.steady_state(4);
oo_.steady_state(72)=oo_.steady_state(71);
oo_.steady_state(73)=oo_.steady_state(72);
oo_.steady_state(74)=oo_.steady_state(1);
oo_.steady_state(75)=oo_.steady_state(74);
oo_.steady_state(76)=oo_.steady_state(75);
oo_.steady_state(77)=oo_.steady_state(67);
if M_.exo_nbr > 0
	oo_.exo_simul = ones(M_.maximum_lag,1)*oo_.exo_steady_state';
end
if M_.exo_det_nbr > 0
	oo_.exo_det_simul = ones(M_.maximum_lag,1)*oo_.exo_det_steady_state';
end
%
% SHOCKS instructions
%
M_.exo_det_length = 0;
M_.Sigma_e(1, 1) = (M_.params(50)^2)^2;
M_.Sigma_e(2, 2) = (M_.params(48)^2)^2;
M_.Sigma_e(3, 3) = (M_.params(49)^2)^2;
M_.Sigma_e(4, 4) = (1)^2;
save('NK_ST13_results.mat', 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save('NK_ST13_results.mat', 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save('NK_ST13_results.mat', 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save('NK_ST13_results.mat', 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save('NK_ST13_results.mat', 'estimation_info', '-append');
end
if exist('dataset_info', 'var') == 1
  save('NK_ST13_results.mat', 'dataset_info', '-append');
end
if exist('oo_recursive_', 'var') == 1
  save('NK_ST13_results.mat', 'oo_recursive_', '-append');
end


disp(['Total computing time : ' dynsec2hms(toc(tic0)) ]);
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
diary off
