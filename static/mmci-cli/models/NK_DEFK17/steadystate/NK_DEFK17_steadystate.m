function [ys,params,check] = US_FV10_steadystate(ys,exo,M_,options_)
% function [ys,check] = NK_baseline_steadystate(ys,exo)
% computes the steady state for the NK_baseline.mod and uses a numerical
% solver to do so
% Inputs: 
%   - ys        [vector] vector of initial values for the steady state of
%                   the endogenous variables
%   - exo       [vector] vector of values for the exogenous variables
%
% Output: 
%   - ys        [vector] vector of steady state values fpr the the endogenous variables
%   - check     [scalar] set to 0 if steady state computation worked and to
%                    1 of not (allows to impos restriction on parameters)


% read out parameters to access them with their name
NumberOfParameters = M_.param_nbr;
for ii = 1:NumberOfParameters
  paramname = M_.param_names{ii};
  eval([ paramname ' = M_.params(' int2str(ii) ');']);
end
% initialize indicator
check = 0;


%% Enter model equations here

A	=	0.999999999653204000000	;
G	=	0.596759348398701000000	;
e_g	=	-0.000000000007624049842	;
C	=	1.466380979489180000000	;
Inv	=	0.776009495103847000000	;
S_Inv	=	0.003300712660022190000	;
dS_Inv	=	0.070363833005919100000	;
H	=	0.953150459995799000000	;
Y	=	2.841711207358420000000	;
tau	=	0.686042060582987000000	;
K	=	31.946379115879700000000	;
N	=	31.946379106446600000000	;
Ng	=	0.000000009435112697320	;
LY	=	3.816529068663750000000	;
QK	=	33.069865782413400000000	;
GDP	=	2.304677630252890000000	;
R	=	0.987803974705847000000	;
Q	=	1.035167887492920000000	;
pI	=	1.080265971083080000000	;
RK	=	0.032516833184162900000	;
rK	=	0.030038719431781200000	;
rr	=	1.008232255833260000000	;
ERQ	=	1.007121134762700000000	;
w	=	1.954195036579340000000	;
infl_w	=	0.979738516651193000000	;
X1w	=	1.903302542736530000000	;
X2w	=	3.233624208818510000000	;
mc	=	0.897053128066428000000	;
infl	=	0.979738516587763000000	;
X1p	=	4.720177275425470000000	;
X2p	=	4.933329460328340000000	;
Delta_p	=	1.012899290815040000000	;
CY	=	-0.001645786128908400000	;
Spr	=	-0.001111121070685070000	;
phi	=	0.309199998037077000000	;
C_f	=	1.718102196832030000000	;
Inv_f	=	0.841775575878003000000	;
S_Inv_f	=	0.013045931151236600000	;
dS_Inv_f	=	0.139888886988457000000	;
H_f	=	1.044329201286710000000	;
Y_f	=	3.167618863886960000000	;
tau_f	=	0.677294366583818000000	;
K_f	=	34.653804943187600000000	;
N_f	=	34.653804943446900000000	;
Ng_f	=	-0.000000000048058110653	;
LY_f	=	3.399002408586150000000	;
QK_f	=	39.987497634315200000000	;
GDP_f	=	2.710578038522800000000	;
R_f	=	1.007479978800850000000	;
R0_f	=	1.006572921175190000000	;
Q_f	=	1.153913648237860000000	;
pI_f	=	1.179026677163050000000	;
RK_f	=	0.035960107206177200000	;
rK_f	=	0.030643564432727900000	;
ERQ_f	=	1.006872602550130000000	;
w_f	=	1.973690724194890000000	;
mc_f	=	0.909090909091938000000	;
CY_f	=	-0.000900323237570230000	;
Spr_f	=	-0.000607376250721312000	;
phi_f	=	0.309199999999953000000	;
interest	=	-0.000000000000017648491	;
inflation	=	-0.081878250915622400000	;
inflationq	=	-0.000000000000002247731	;
outputgap	=	-0.000000000005137275538	;
output	=	0.000000000002406926334	;
fispol	=	-0.000000000009177811777	;

%% end own model equations
params=NaN(NumberOfParameters,1);
for iter = 1:length(M_.params) %update parameters set in the file
  eval([ 'params(' num2str(iter) ') = ' M_.param_names{iter} ';' ])
end

NumberOfEndogenousVariables = M_.orig_endo_nbr; %auxiliary variables are set automatically
for ii = 1:NumberOfEndogenousVariables
  varname = M_.endo_names{ii};
  eval(['ys(' int2str(ii) ') = ' varname ';']);
end