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
M_.fname = 'NK_GM07';
M_.dynare_version = '4.5.4';
oo_.dynare_version = '4.5.4';
options_.dynare_version = '4.5.4';
%
% Some global variables initialization
%
global_initialization;
diary off;
diary('NK_GM07.log');
M_.exo_names = 'eps_a1';
M_.exo_names_tex = 'eps\_a1';
M_.exo_names_long = 'eps_a1';
M_.exo_names = char(M_.exo_names, 'eps_a2');
M_.exo_names_tex = char(M_.exo_names_tex, 'eps\_a2');
M_.exo_names_long = char(M_.exo_names_long, 'eps_a2');
M_.exo_names = char(M_.exo_names, 'eps_a3');
M_.exo_names_tex = char(M_.exo_names_tex, 'eps\_a3');
M_.exo_names_long = char(M_.exo_names_long, 'eps_a3');
M_.exo_names = char(M_.exo_names, 'interest_');
M_.exo_names_tex = char(M_.exo_names_tex, 'interest\_');
M_.exo_names_long = char(M_.exo_names_long, 'interest_');
M_.endo_names = 'dp';
M_.endo_names_tex = 'dp';
M_.endo_names_long = 'dp';
M_.endo_names = char(M_.endo_names, 'mc');
M_.endo_names_tex = char(M_.endo_names_tex, 'mc');
M_.endo_names_long = char(M_.endo_names_long, 'mc');
M_.endo_names = char(M_.endo_names, 'omega');
M_.endo_names_tex = char(M_.endo_names_tex, 'omega');
M_.endo_names_long = char(M_.endo_names_long, 'omega');
M_.endo_names = char(M_.endo_names, 'lambda');
M_.endo_names_tex = char(M_.endo_names_tex, 'lambda');
M_.endo_names_long = char(M_.endo_names_long, 'lambda');
M_.endo_names = char(M_.endo_names, 'xi');
M_.endo_names_tex = char(M_.endo_names_tex, 'xi');
M_.endo_names_long = char(M_.endo_names_long, 'xi');
M_.endo_names = char(M_.endo_names, 'w');
M_.endo_names_tex = char(M_.endo_names_tex, 'w');
M_.endo_names_long = char(M_.endo_names_long, 'w');
M_.endo_names = char(M_.endo_names, 'n');
M_.endo_names_tex = char(M_.endo_names_tex, 'n');
M_.endo_names_long = char(M_.endo_names_long, 'n');
M_.endo_names = char(M_.endo_names, 'm');
M_.endo_names_tex = char(M_.endo_names_tex, 'm');
M_.endo_names_long = char(M_.endo_names_long, 'm');
M_.endo_names = char(M_.endo_names, 'c');
M_.endo_names_tex = char(M_.endo_names_tex, 'c');
M_.endo_names_long = char(M_.endo_names_long, 'c');
M_.endo_names = char(M_.endo_names, 'q');
M_.endo_names_tex = char(M_.endo_names_tex, 'q');
M_.endo_names_long = char(M_.endo_names_long, 'q');
M_.endo_names = char(M_.endo_names, 'p');
M_.endo_names_tex = char(M_.endo_names_tex, 'p');
M_.endo_names_long = char(M_.endo_names_long, 'p');
M_.endo_names = char(M_.endo_names, 'h');
M_.endo_names_tex = char(M_.endo_names_tex, 'h');
M_.endo_names_long = char(M_.endo_names_long, 'h');
M_.endo_names = char(M_.endo_names, 'b');
M_.endo_names_tex = char(M_.endo_names_tex, 'b');
M_.endo_names_long = char(M_.endo_names_long, 'b');
M_.endo_names = char(M_.endo_names, 'a1');
M_.endo_names_tex = char(M_.endo_names_tex, 'a1');
M_.endo_names_long = char(M_.endo_names_long, 'a1');
M_.endo_names = char(M_.endo_names, 'a2');
M_.endo_names_tex = char(M_.endo_names_tex, 'a2');
M_.endo_names_long = char(M_.endo_names_long, 'a2');
M_.endo_names = char(M_.endo_names, 'a3');
M_.endo_names_tex = char(M_.endo_names_tex, 'a3');
M_.endo_names_long = char(M_.endo_names_long, 'a3');
M_.endo_names = char(M_.endo_names, 'CEFP');
M_.endo_names_tex = char(M_.endo_names_tex, 'CEFP');
M_.endo_names_long = char(M_.endo_names_long, 'CEFP');
M_.endo_names = char(M_.endo_names, 'UEFP');
M_.endo_names_tex = char(M_.endo_names_tex, 'UEFP');
M_.endo_names_long = char(M_.endo_names_long, 'UEFP');
M_.endo_names = char(M_.endo_names, 'rT');
M_.endo_names_tex = char(M_.endo_names_tex, 'rT');
M_.endo_names_long = char(M_.endo_names_long, 'rT');
M_.endo_names = char(M_.endo_names, 'rIB');
M_.endo_names_tex = char(M_.endo_names_tex, 'rIB');
M_.endo_names_long = char(M_.endo_names_long, 'rIB');
M_.endo_names = char(M_.endo_names, 'rL');
M_.endo_names_tex = char(M_.endo_names_tex, 'rL');
M_.endo_names_long = char(M_.endo_names_long, 'rL');
M_.endo_names = char(M_.endo_names, 'rB');
M_.endo_names_tex = char(M_.endo_names_tex, 'rB');
M_.endo_names_long = char(M_.endo_names_long, 'rB');
M_.endo_names = char(M_.endo_names, 'interest');
M_.endo_names_tex = char(M_.endo_names_tex, 'interest');
M_.endo_names_long = char(M_.endo_names_long, 'interest');
M_.endo_names = char(M_.endo_names, 'inflation');
M_.endo_names_tex = char(M_.endo_names_tex, 'inflation');
M_.endo_names_long = char(M_.endo_names_long, 'inflation');
M_.endo_names = char(M_.endo_names, 'inflationq');
M_.endo_names_tex = char(M_.endo_names_tex, 'inflationq');
M_.endo_names_long = char(M_.endo_names_long, 'inflationq');
M_.endo_names = char(M_.endo_names, 'output');
M_.endo_names_tex = char(M_.endo_names_tex, 'output');
M_.endo_names_long = char(M_.endo_names_long, 'output');
M_.endo_names = char(M_.endo_names, 'outputgap');
M_.endo_names_tex = char(M_.endo_names_tex, 'outputgap');
M_.endo_names_long = char(M_.endo_names_long, 'outputgap');
M_.endo_names = char(M_.endo_names, 'fispol');
M_.endo_names_tex = char(M_.endo_names_tex, 'fispol');
M_.endo_names_long = char(M_.endo_names_long, 'fispol');
M_.endo_names = char(M_.endo_names, 'AUX_ENDO_LEAD_227');
M_.endo_names_tex = char(M_.endo_names_tex, 'AUX\_ENDO\_LEAD\_227');
M_.endo_names_long = char(M_.endo_names_long, 'AUX_ENDO_LEAD_227');
M_.endo_names = char(M_.endo_names, 'AUX_ENDO_LEAD_231');
M_.endo_names_tex = char(M_.endo_names_tex, 'AUX\_ENDO\_LEAD\_231');
M_.endo_names_long = char(M_.endo_names_long, 'AUX_ENDO_LEAD_231');
M_.endo_names = char(M_.endo_names, 'AUX_ENDO_LEAD_235');
M_.endo_names_tex = char(M_.endo_names_tex, 'AUX\_ENDO\_LEAD\_235');
M_.endo_names_long = char(M_.endo_names_long, 'AUX_ENDO_LEAD_235');
M_.endo_names = char(M_.endo_names, 'AUX_ENDO_LEAD_262');
M_.endo_names_tex = char(M_.endo_names_tex, 'AUX\_ENDO\_LEAD\_262');
M_.endo_names_long = char(M_.endo_names_long, 'AUX_ENDO_LEAD_262');
M_.endo_names = char(M_.endo_names, 'AUX_ENDO_LEAD_266');
M_.endo_names_tex = char(M_.endo_names_tex, 'AUX\_ENDO\_LEAD\_266');
M_.endo_names_long = char(M_.endo_names_long, 'AUX_ENDO_LEAD_266');
M_.endo_names = char(M_.endo_names, 'AUX_ENDO_LEAD_270');
M_.endo_names_tex = char(M_.endo_names_tex, 'AUX\_ENDO\_LEAD\_270');
M_.endo_names_long = char(M_.endo_names_long, 'AUX_ENDO_LEAD_270');
M_.endo_names = char(M_.endo_names, 'AUX_ENDO_LEAD_297');
M_.endo_names_tex = char(M_.endo_names_tex, 'AUX\_ENDO\_LEAD\_297');
M_.endo_names_long = char(M_.endo_names_long, 'AUX_ENDO_LEAD_297');
M_.endo_names = char(M_.endo_names, 'AUX_ENDO_LEAD_301');
M_.endo_names_tex = char(M_.endo_names_tex, 'AUX\_ENDO\_LEAD\_301');
M_.endo_names_long = char(M_.endo_names_long, 'AUX_ENDO_LEAD_301');
M_.endo_names = char(M_.endo_names, 'AUX_ENDO_LEAD_305');
M_.endo_names_tex = char(M_.endo_names_tex, 'AUX\_ENDO\_LEAD\_305');
M_.endo_names_long = char(M_.endo_names_long, 'AUX_ENDO_LEAD_305');
M_.endo_names = char(M_.endo_names, 'AUX_ENDO_LAG_0_1');
M_.endo_names_tex = char(M_.endo_names_tex, 'AUX\_ENDO\_LAG\_0\_1');
M_.endo_names_long = char(M_.endo_names_long, 'AUX_ENDO_LAG_0_1');
M_.endo_names = char(M_.endo_names, 'AUX_ENDO_LAG_0_2');
M_.endo_names_tex = char(M_.endo_names_tex, 'AUX\_ENDO\_LAG\_0\_2');
M_.endo_names_long = char(M_.endo_names_long, 'AUX_ENDO_LAG_0_2');
M_.endo_names = char(M_.endo_names, 'AUX_ENDO_LAG_25_1');
M_.endo_names_tex = char(M_.endo_names_tex, 'AUX\_ENDO\_LAG\_25\_1');
M_.endo_names_long = char(M_.endo_names_long, 'AUX_ENDO_LAG_25_1');
M_.endo_names = char(M_.endo_names, 'AUX_ENDO_LAG_25_2');
M_.endo_names_tex = char(M_.endo_names_tex, 'AUX\_ENDO\_LAG\_25\_2');
M_.endo_names_long = char(M_.endo_names_long, 'AUX_ENDO_LAG_25_2');
M_.endo_names = char(M_.endo_names, 'AUX_ENDO_LAG_25_3');
M_.endo_names_tex = char(M_.endo_names_tex, 'AUX\_ENDO\_LAG\_25\_3');
M_.endo_names_long = char(M_.endo_names_long, 'AUX_ENDO_LAG_25_3');
M_.endo_names = char(M_.endo_names, 'AUX_ENDO_LAG_26_1');
M_.endo_names_tex = char(M_.endo_names_tex, 'AUX\_ENDO\_LAG\_26\_1');
M_.endo_names_long = char(M_.endo_names_long, 'AUX_ENDO_LAG_26_1');
M_.endo_names = char(M_.endo_names, 'AUX_ENDO_LAG_26_2');
M_.endo_names_tex = char(M_.endo_names_tex, 'AUX\_ENDO\_LAG\_26\_2');
M_.endo_names_long = char(M_.endo_names_long, 'AUX_ENDO_LAG_26_2');
M_.endo_names = char(M_.endo_names, 'AUX_ENDO_LAG_26_3');
M_.endo_names_tex = char(M_.endo_names_tex, 'AUX\_ENDO\_LAG\_26\_3');
M_.endo_names_long = char(M_.endo_names_long, 'AUX_ENDO_LAG_26_3');
M_.endo_names = char(M_.endo_names, 'AUX_ENDO_LAG_22_1');
M_.endo_names_tex = char(M_.endo_names_tex, 'AUX\_ENDO\_LAG\_22\_1');
M_.endo_names_long = char(M_.endo_names_long, 'AUX_ENDO_LAG_22_1');
M_.endo_names = char(M_.endo_names, 'AUX_ENDO_LAG_22_2');
M_.endo_names_tex = char(M_.endo_names_tex, 'AUX\_ENDO\_LAG\_22\_2');
M_.endo_names_long = char(M_.endo_names_long, 'AUX_ENDO_LAG_22_2');
M_.endo_names = char(M_.endo_names, 'AUX_ENDO_LAG_22_3');
M_.endo_names_tex = char(M_.endo_names_tex, 'AUX\_ENDO\_LAG\_22\_3');
M_.endo_names_long = char(M_.endo_names_long, 'AUX_ENDO_LAG_22_3');
M_.endo_names = char(M_.endo_names, 'AUX_ENDO_LAG_24_1');
M_.endo_names_tex = char(M_.endo_names_tex, 'AUX\_ENDO\_LAG\_24\_1');
M_.endo_names_long = char(M_.endo_names_long, 'AUX_ENDO_LAG_24_1');
M_.endo_names = char(M_.endo_names, 'AUX_ENDO_LAG_24_2');
M_.endo_names_tex = char(M_.endo_names_tex, 'AUX\_ENDO\_LAG\_24\_2');
M_.endo_names_long = char(M_.endo_names_long, 'AUX_ENDO_LAG_24_2');
M_.endo_names = char(M_.endo_names, 'AUX_ENDO_LAG_24_3');
M_.endo_names_tex = char(M_.endo_names_tex, 'AUX\_ENDO\_LAG\_24\_3');
M_.endo_names_long = char(M_.endo_names_long, 'AUX_ENDO_LAG_24_3');
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
M_.param_names = char(M_.param_names, 'phi');
M_.param_names_tex = char(M_.param_names_tex, 'phi');
M_.param_names_long = char(M_.param_names_long, 'phi');
M_.param_names = char(M_.param_names, 'eta');
M_.param_names_tex = char(M_.param_names_tex, 'eta');
M_.param_names_long = char(M_.param_names_long, 'eta');
M_.param_names = char(M_.param_names, 'theta');
M_.param_names_tex = char(M_.param_names_tex, 'theta');
M_.param_names_long = char(M_.param_names_long, 'theta');
M_.param_names = char(M_.param_names, 'beta');
M_.param_names_tex = char(M_.param_names_tex, 'beta');
M_.param_names_long = char(M_.param_names_long, 'beta');
M_.param_names = char(M_.param_names, 'kappa');
M_.param_names_tex = char(M_.param_names_tex, 'kappa');
M_.param_names_long = char(M_.param_names_long, 'kappa');
M_.param_names = char(M_.param_names, 'alpha');
M_.param_names_tex = char(M_.param_names_tex, 'alpha');
M_.param_names_long = char(M_.param_names_long, 'alpha');
M_.param_names = char(M_.param_names, 'k');
M_.param_names_tex = char(M_.param_names_tex, 'k');
M_.param_names_long = char(M_.param_names_long, 'k');
M_.param_names = char(M_.param_names, 'delta');
M_.param_names_tex = char(M_.param_names_tex, 'delta');
M_.param_names_long = char(M_.param_names_long, 'delta');
M_.param_names = char(M_.param_names, 'gamma');
M_.param_names_tex = char(M_.param_names_tex, 'gamma');
M_.param_names_long = char(M_.param_names_long, 'gamma');
M_.param_names = char(M_.param_names, 'rr');
M_.param_names_tex = char(M_.param_names_tex, 'rr');
M_.param_names_long = char(M_.param_names_long, 'rr');
M_.param_names = char(M_.param_names, 'V');
M_.param_names_tex = char(M_.param_names_tex, 'V');
M_.param_names_long = char(M_.param_names_long, 'V');
M_.param_names = char(M_.param_names, 'boc');
M_.param_names_tex = char(M_.param_names_tex, 'boc');
M_.param_names_long = char(M_.param_names_long, 'boc');
M_.param_names = char(M_.param_names, 'F');
M_.param_names_tex = char(M_.param_names_tex, 'F');
M_.param_names_long = char(M_.param_names_long, 'F');
M_.param_names = char(M_.param_names, 'K');
M_.param_names_tex = char(M_.param_names_tex, 'K');
M_.param_names_long = char(M_.param_names_long, 'K');
M_.param_names = char(M_.param_names, 'n_ss');
M_.param_names_tex = char(M_.param_names_tex, 'n\_ss');
M_.param_names_long = char(M_.param_names_long, 'n_ss');
M_.param_names = char(M_.param_names, 'm_ss');
M_.param_names_tex = char(M_.param_names_tex, 'm\_ss');
M_.param_names_long = char(M_.param_names_long, 'm_ss');
M_.param_names = char(M_.param_names, 'c_ss');
M_.param_names_tex = char(M_.param_names_tex, 'c\_ss');
M_.param_names_long = char(M_.param_names_long, 'c_ss');
M_.param_names = char(M_.param_names, 'w_ss');
M_.param_names_tex = char(M_.param_names_tex, 'w\_ss');
M_.param_names_long = char(M_.param_names_long, 'w_ss');
M_.param_names = char(M_.param_names, 'b_ss');
M_.param_names_tex = char(M_.param_names_tex, 'b\_ss');
M_.param_names_long = char(M_.param_names_long, 'b_ss');
M_.param_names = char(M_.param_names, 'omega_ss');
M_.param_names_tex = char(M_.param_names_tex, 'omega\_ss');
M_.param_names_long = char(M_.param_names_long, 'omega_ss');
M_.param_names = char(M_.param_names, 'lambda_ss');
M_.param_names_tex = char(M_.param_names_tex, 'lambda\_ss');
M_.param_names_long = char(M_.param_names_long, 'lambda_ss');
M_.param_names = char(M_.param_names, 'mc_ss');
M_.param_names_tex = char(M_.param_names_tex, 'mc\_ss');
M_.param_names_long = char(M_.param_names_long, 'mc_ss');
M_.param_names = char(M_.param_names, 'UEFP_ss');
M_.param_names_tex = char(M_.param_names_tex, 'UEFP\_ss');
M_.param_names_long = char(M_.param_names_long, 'UEFP_ss');
M_.param_names = char(M_.param_names, 'CEFP_ss');
M_.param_names_tex = char(M_.param_names_tex, 'CEFP\_ss');
M_.param_names_long = char(M_.param_names_long, 'CEFP_ss');
M_.param_names = char(M_.param_names, 'rT_ss');
M_.param_names_tex = char(M_.param_names_tex, 'rT\_ss');
M_.param_names_long = char(M_.param_names_long, 'rT_ss');
M_.param_names = char(M_.param_names, 'rIB_ss');
M_.param_names_tex = char(M_.param_names_tex, 'rIB\_ss');
M_.param_names_long = char(M_.param_names_long, 'rIB_ss');
M_.param_names = char(M_.param_names, 'rL_ss');
M_.param_names_tex = char(M_.param_names_tex, 'rL\_ss');
M_.param_names_long = char(M_.param_names_long, 'rL_ss');
M_.param_names = char(M_.param_names, 'rB_ss');
M_.param_names_tex = char(M_.param_names_tex, 'rB\_ss');
M_.param_names_long = char(M_.param_names_long, 'rB_ss');
M_.param_names = char(M_.param_names, 'rho_h');
M_.param_names_tex = char(M_.param_names_tex, 'rho\_h');
M_.param_names_long = char(M_.param_names_long, 'rho_h');
M_.param_names = char(M_.param_names, 'rho_a1');
M_.param_names_tex = char(M_.param_names_tex, 'rho\_a1');
M_.param_names_long = char(M_.param_names_long, 'rho_a1');
M_.param_names = char(M_.param_names, 'rho_a2');
M_.param_names_tex = char(M_.param_names_tex, 'rho\_a2');
M_.param_names_long = char(M_.param_names_long, 'rho_a2');
M_.param_names = char(M_.param_names, 'rho_a3');
M_.param_names_tex = char(M_.param_names_tex, 'rho\_a3');
M_.param_names_long = char(M_.param_names_long, 'rho_a3');
M_.param_names = char(M_.param_names, 'mu_1');
M_.param_names_tex = char(M_.param_names_tex, 'mu\_1');
M_.param_names_long = char(M_.param_names_long, 'mu_1');
M_.param_names = char(M_.param_names, 'mu_2');
M_.param_names_tex = char(M_.param_names_tex, 'mu\_2');
M_.param_names_long = char(M_.param_names_long, 'mu_2');
M_.param_names = char(M_.param_names, 'mu_3');
M_.param_names_tex = char(M_.param_names_tex, 'mu\_3');
M_.param_names_long = char(M_.param_names_long, 'mu_3');
M_.param_partitions = struct();
M_.exo_det_nbr = 0;
M_.exo_nbr = 4;
M_.endo_nbr = 51;
M_.param_nbr = 69;
M_.orig_endo_nbr = 28;
M_.aux_vars(1).endo_index = 29;
M_.aux_vars(1).type = 0;
M_.aux_vars(2).endo_index = 30;
M_.aux_vars(2).type = 0;
M_.aux_vars(3).endo_index = 31;
M_.aux_vars(3).type = 0;
M_.aux_vars(4).endo_index = 32;
M_.aux_vars(4).type = 0;
M_.aux_vars(5).endo_index = 33;
M_.aux_vars(5).type = 0;
M_.aux_vars(6).endo_index = 34;
M_.aux_vars(6).type = 0;
M_.aux_vars(7).endo_index = 35;
M_.aux_vars(7).type = 0;
M_.aux_vars(8).endo_index = 36;
M_.aux_vars(8).type = 0;
M_.aux_vars(9).endo_index = 37;
M_.aux_vars(9).type = 0;
M_.aux_vars(10).endo_index = 38;
M_.aux_vars(10).type = 1;
M_.aux_vars(10).orig_index = 1;
M_.aux_vars(10).orig_lead_lag = -1;
M_.aux_vars(11).endo_index = 39;
M_.aux_vars(11).type = 1;
M_.aux_vars(11).orig_index = 1;
M_.aux_vars(11).orig_lead_lag = -2;
M_.aux_vars(12).endo_index = 40;
M_.aux_vars(12).type = 1;
M_.aux_vars(12).orig_index = 26;
M_.aux_vars(12).orig_lead_lag = -1;
M_.aux_vars(13).endo_index = 41;
M_.aux_vars(13).type = 1;
M_.aux_vars(13).orig_index = 26;
M_.aux_vars(13).orig_lead_lag = -2;
M_.aux_vars(14).endo_index = 42;
M_.aux_vars(14).type = 1;
M_.aux_vars(14).orig_index = 26;
M_.aux_vars(14).orig_lead_lag = -3;
M_.aux_vars(15).endo_index = 43;
M_.aux_vars(15).type = 1;
M_.aux_vars(15).orig_index = 27;
M_.aux_vars(15).orig_lead_lag = -1;
M_.aux_vars(16).endo_index = 44;
M_.aux_vars(16).type = 1;
M_.aux_vars(16).orig_index = 27;
M_.aux_vars(16).orig_lead_lag = -2;
M_.aux_vars(17).endo_index = 45;
M_.aux_vars(17).type = 1;
M_.aux_vars(17).orig_index = 27;
M_.aux_vars(17).orig_lead_lag = -3;
M_.aux_vars(18).endo_index = 46;
M_.aux_vars(18).type = 1;
M_.aux_vars(18).orig_index = 23;
M_.aux_vars(18).orig_lead_lag = -1;
M_.aux_vars(19).endo_index = 47;
M_.aux_vars(19).type = 1;
M_.aux_vars(19).orig_index = 23;
M_.aux_vars(19).orig_lead_lag = -2;
M_.aux_vars(20).endo_index = 48;
M_.aux_vars(20).type = 1;
M_.aux_vars(20).orig_index = 23;
M_.aux_vars(20).orig_lead_lag = -3;
M_.aux_vars(21).endo_index = 49;
M_.aux_vars(21).type = 1;
M_.aux_vars(21).orig_index = 25;
M_.aux_vars(21).orig_lead_lag = -1;
M_.aux_vars(22).endo_index = 50;
M_.aux_vars(22).type = 1;
M_.aux_vars(22).orig_index = 25;
M_.aux_vars(22).orig_lead_lag = -2;
M_.aux_vars(23).endo_index = 51;
M_.aux_vars(23).type = 1;
M_.aux_vars(23).orig_index = 25;
M_.aux_vars(23).orig_lead_lag = -3;
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
erase_compiled_function('NK_GM07_static');
erase_compiled_function('NK_GM07_dynamic');
M_.orig_eq_nbr = 28;
M_.eq_nbr = 51;
M_.ramsey_eq_nbr = 0;
M_.set_auxiliary_variables = exist(['./' M_.fname '_set_auxiliary_variables.m'], 'file') == 2;
M_.lead_lag_incidence = [
 1 24 75;
 0 25 76;
 0 26 0;
 0 27 77;
 0 28 0;
 0 29 0;
 0 30 78;
 0 31 0;
 0 32 0;
 0 33 79;
 2 34 0;
 0 35 0;
 0 36 0;
 3 37 80;
 4 38 0;
 5 39 0;
 0 40 0;
 0 41 0;
 0 42 0;
 0 43 0;
 0 44 0;
 0 45 0;
 6 46 0;
 0 47 0;
 7 48 81;
 8 49 82;
 9 50 83;
 0 51 0;
 0 52 84;
 0 53 85;
 0 54 86;
 0 55 87;
 0 56 88;
 0 57 89;
 0 58 90;
 0 59 91;
 0 60 92;
 10 61 0;
 11 62 0;
 12 63 0;
 13 64 0;
 14 65 0;
 15 66 0;
 16 67 0;
 17 68 0;
 18 69 0;
 19 70 0;
 20 71 0;
 21 72 0;
 22 73 0;
 23 74 0;]';
M_.nstatic = 15;
M_.nfwrd   = 13;
M_.npred   = 18;
M_.nboth   = 5;
M_.nsfwrd   = 18;
M_.nspred   = 23;
M_.ndynamic   = 36;
M_.equations_tags = {
};
M_.static_and_dynamic_models_differ = 0;
M_.exo_names_orig_ord = [1:4];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(51, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(4, 1);
M_.params = NaN(69, 1);
M_.NNZDerivatives = [175; 0; -1];
M_.params( 35 ) = 0.4;
phi = M_.params( 35 );
M_.params( 36 ) = 0.36;
eta = M_.params( 36 );
M_.params( 37 ) = 10;
theta = M_.params( 37 );
M_.params( 56 ) = 0.9090909090909091;
mc_ss = M_.params( 56 );
M_.params( 38 ) = 0.99;
beta = M_.params( 38 );
M_.params( 39 ) = 0.05;
kappa = M_.params( 39 );
M_.params( 40 ) = 0.65;
alpha = M_.params( 40 );
M_.params( 41 ) = 0.2;
k = M_.params( 41 );
M_.params( 42 ) = 0.025;
delta = M_.params( 42 );
M_.params( 43 ) = 0.005;
gamma = M_.params( 43 );
M_.params( 45 ) = 0.31;
V = M_.params( 45 );
M_.params( 44 ) = 0.005;
rr = M_.params( 44 );
M_.params( 46 ) = 0.56;
boc = M_.params( 46 );
M_.params( 47 ) = 9;
F = M_.params( 47 );
M_.params( 63 ) = 0.6;
rho_h = M_.params( 63 );
M_.params( 64 ) = 0.99;
rho_a1 = M_.params( 64 );
M_.params( 65 ) = 0.99;
rho_a2 = M_.params( 65 );
M_.params( 66 ) = 0.9;
rho_a3 = M_.params( 66 );
M_.params( 67 ) = 1.5;
mu_1 = M_.params( 67 );
M_.params( 68 ) = 0.5;
mu_2 = M_.params( 68 );
M_.params( 69 ) = 0.0;
mu_3 = M_.params( 69 );
M_.params( 48 ) = 9.19;
K = M_.params( 48 );
M_.params( 49 ) = 0.3195;
n_ss = M_.params( 49 );
M_.params( 50 ) = 0.0063;
m_ss = M_.params( 50 );
M_.params( 51 ) = 0.8409;
c_ss = M_.params( 51 );
M_.params( 52 ) = 1.949;
w_ss = M_.params( 52 );
M_.params( 53 ) = M_.params(46)*M_.params(51);
b_ss = M_.params( 53 );
M_.params( 54 ) = 0.237;
omega_ss = M_.params( 54 );
M_.params( 55 ) = 0.457;
lambda_ss = M_.params( 55 );
M_.params( 58 ) = M_.params(45)*M_.params(52)*M_.params(50)/(M_.params(51)*(1-M_.params(44)));
CEFP_ss = M_.params( 58 );
M_.params( 57 ) = M_.params(45)*M_.params(52)*M_.params(50)/(M_.params(51)*(1-M_.params(44))*(1-M_.params(40)));
UEFP_ss = M_.params( 57 );
M_.params( 59 ) = 0.015;
rT_ss = M_.params( 59 );
M_.params( 60 ) = 0.0021;
rIB_ss = M_.params( 60 );
M_.params( 61 ) = 0.0066;
rL_ss = M_.params( 61 );
M_.params( 62 ) = 0.0052;
rB_ss = M_.params( 62 );
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
M_.Sigma_e(1, 1) = (1)^2;
M_.Sigma_e(2, 2) = (1)^2;
M_.Sigma_e(3, 3) = (1)^2;
M_.Sigma_e(4, 4) = (1)^2;
save('NK_GM07_results.mat', 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save('NK_GM07_results.mat', 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save('NK_GM07_results.mat', 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save('NK_GM07_results.mat', 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save('NK_GM07_results.mat', 'estimation_info', '-append');
end
if exist('dataset_info', 'var') == 1
  save('NK_GM07_results.mat', 'dataset_info', '-append');
end
if exist('oo_recursive_', 'var') == 1
  save('NK_GM07_results.mat', 'oo_recursive_', '-append');
end


disp(['Total computing time : ' dynsec2hms(toc(tic0)) ]);
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
diary off
