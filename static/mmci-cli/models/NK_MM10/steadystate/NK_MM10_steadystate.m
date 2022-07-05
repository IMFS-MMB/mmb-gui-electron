% computes the steady state of BankCapital.mod.
% Taken from an example file by S. Adjemian on Dynare Forum
% January 2011, Kevin Moran

function  [ys,params,check]= BankCapital_steadystate(ys,exo,M_,options_)
% function [ys,params,check] = NK_baseline_steadystate(ys,exo,M_,options_)
% computes the steady state for the NK_baseline.mod and uses a numerical
% solver to do so
% Inputs:
%   - ys        [vector] vector of initial values for the steady state of
%                   the endogenous variables
%   - exo       [vector] vector of values for the exogenous variables
%   - M_        [structure] Dynare model structure
%   - options   [structure] Dynare options structure
%
% Output:
%   - ys        [vector] vector of steady state values for the the endogenous variables
%   - params    [vector] vector of parameter values
%   - check     [scalar] set to 0 if steady state computation worked and to
%                    1 of not (allows to impose restrictions on parameters)

% read out parameters to access them with their name
NumberOfParameters = M_.param_nbr;
for ii = 1:NumberOfParameters
  paramname = M_.param_names{ii};
  eval([ paramname ' = M_.params(' int2str(ii) ');']);
end
% initialize indicator
check = 0;

%%
%% END OF THE FIRST MODEL INDEPENDENT BLOCK.


%% THIS BLOCK IS MODEL SPECIFIC.
%%
%% Here the user has to define the steady state.
%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% steady-state computations:

infl_ss = pi_ss;

Rd_ss = pi_ss/bet;

disp(delta)
disp(theta_k)
disp(alphag)
disp(bigR)
disp(bet)

kk1 = delta*theta_k/(alphag*bigR*(1/bet-1+delta));
betatemp  = 1/bet;

q_ss = kk1*(alphag*tau_b*mu_ss*betatemp/delalpha-(1+mu_ss+alphag*mu_ss/(Rd_ss*delalpha)));
q_ss = q_ss/(alphag*smallb*kk1/(Rd_ss*delalpha)-alphag*bigR*kk1/Rd_ss-theta_e-theta_b-bby-alphag*tau_e*smallb*kk1*betatemp/delalpha);

G_ss = 1+mu_ss-(q_ss*alphag/Rd_ss)*(bigR-mu_ss/(q_ss*delalpha)-smallb/delalpha);

IY = kk1/q_ss;

KY = alphag*bigR*IY/delta;

KeY = tau_e*alphag*smallb*IY/delalpha;

KbY = tau_b*alphag*mu_ss*IY/(q_ss*delalpha);

KhY = KY - KeY - KbY;

CeY = (1-tau_e)*alphag*smallb*IY*q_ss/delalpha;

CbY = nu*(1-tau_b)*alphag*mu_ss*IY/delalpha;

ChY = 1 + bby - CeY - CbY  - (1+mu_ss)*IY;

essai = (1-bet*habit)*theta_h/((1-habit)*ChY*psi_l*mark_w);

smallh = essai^(1/(1+elas_l));

H_ss = smallh*eta_h^(xi_w/(xi_w-1));

kk2 = (KY^(1/(1-theta_k))) * (eta_e^(theta_e/(1-theta_k)))* (eta_b^(theta_b/(1-theta_k)))* mark_p^(1/(theta_k-1));

K_ss = H_ss^(theta_h/(1-theta_k))* kk2;

Y_ss = (1/mark_p)* (K_ss^theta_k)*(H_ss^theta_h)*(eta_e^theta_e)*(eta_b^theta_b);

I_ss = IY*Y_ss;

rk_ss = (1/mark_p)*theta_k*(K_ss^(theta_k-1))*(H_ss^theta_h)*(eta_e^theta_e)*(eta_b^theta_b);

wh_ss = (1/mark_p)*theta_h*(K_ss^theta_k)*(H_ss^(theta_h-1))*(eta_e^theta_e)*(eta_b^theta_b);

we_ss = (1/mark_p)*theta_e*(K_ss^theta_k)*(H_ss^theta_h)*(eta_e^(theta_e-1))*(eta_b^theta_b);

wb_ss = (1/mark_p)*theta_b*(K_ss^theta_k)*(H_ss^theta_h)*(eta_e^theta_e)*(eta_b^(theta_b-1));

Ke_ss = KeY*Y_ss;

Kb_ss = KbY*Y_ss;

Kh_ss = KhY*Y_ss;

Ce_ss = CeY*Y_ss;

Cb_ss = CbY*Y_ss;

ch_ss = ChY*Y_ss/eta_h;

bigA_ss = eta_b*wb_ss+(rk_ss+q_ss*(1-delta))*Kb_ss+bby*Y_ss;

bigN_ss = eta_e*we_ss+(rk_ss+q_ss*(1-delta))*Ke_ss;

totC_ss = Ce_ss+Cb_ss+eta_h*ch_ss;

lam_ss = (1-bet*habit)/((1-habit)*(ch_ss));

smalld_ss = alphag*q_ss*( bigR - smallb/delalpha - mu_ss/(q_ss*delalpha))*I_ss/(Rd_ss*eta_b);

p_ss = (Rd_ss-1)*lam_ss/ ( (Rd_ss-1)*lam_ss*eta_b*smalld_ss + eta_h*reta);

mc_ss = reta*p_ss/((Rd_ss-1)*lam_ss);

Ra_ss = alphag*q_ss*(mu_ss/(q_ss*delalpha))*I_ss/bigA_ss;

TL_ss = I_ss-bigN_ss;

CA_ss = bigA_ss/((1+mu_ss)*I_ss-bigN_ss);

numw_ss =  ( ( (wh_ss*infl_ss)^(xi_w*(1+elas_l)) * H_ss^(1+elas_l) )/(1-bet*phi_w) )^(1/(1+elas_l*xi_w));

denw_ss = ( (wh_ss^(xi_w)*infl_ss^(xi_w-1)*H_ss*lam_ss)/(1-bet*phi_w) )^(1/(1+elas_l*xi_w));

wtilde_ss = (mark_w*psi_l)^(1/(1+xi_w*elas_l))*numw_ss/denw_ss;

s_ss = 1/mark_p;

mgrowth_ss = infl_ss;

expinfl_ss = infl_ss;

gY_ss = 1;

u_ss = 1;

% Now ready to assign these "*_ss values to all variables
s = s_ss;
u = u_ss;
infl = infl_ss;
expinfl = expinfl_ss;
mgrowth = mgrowth_ss;
gY = gY_ss;
Rd = Rd_ss;
interest= 0;
inflation  = 0;
inflationq  = 0;
%interest=(Rd_ss-1)*4
%inflation  = (infl_ss-1)*4;
%inflationq = (infl_ss-1)*4;
output     = 0;
outputgap  = 0;
q = q_ss;
G = G_ss;
H = H_ss;
K = K_ss;
Y = Y_ss;
I = I_ss;
rk = rk_ss;
w_h = wh_ss;
w_e = we_ss;
w_b = wb_ss;
Ke = Ke_ss;
Kb = Kb_ss;
Ce = Ce_ss;
Cb = Cb_ss;
ch = ch_ss;
totC = totC_ss;
lam = lam_ss;
bigA = bigA_ss;
bigN = bigN_ss;
smalld = smalld_ss;
p = p_ss;
mc = mc_ss;
Ra = Ra_ss;
TL = TL_ss;
numw = numw_ss;
denw = denw_ss;
wtilde = wtilde_ss;
nump = (lam_ss * Y_ss * s_ss * infl_ss^xi_p)/(1-bet*phi_p);
denp = (lam_ss * Y_ss * infl_ss^(xi_p-1))/(1-bet*phi_p);
ptilde = xi_p * nump/ ((xi_p - 1) * denp );
lz = 0.0;
lmp = 0.0;
lbk = 0.0;
keff = K_ss;
CA = CA_ss;
log_y = log(Y);
log_I = log(I);
mgrowthf = mgrowth_ss;
chf= ch_ss;    % 1- household consumption
Cef=Ce_ss;    % 2- entrepreneurial consumption
Cbf =Cb_ss;    % 3- banking consumption
Hf = H_ss;     % 4- aggregate (composite) labour input
Yf =Y_ss;   % 5- Output
If =I_ss;    % 6- Investment
bigNf = bigN_ss; % 7- entrepreneurial net worth
bigAf =bigA_ss; % 8- net worth of banking sector (bank capital)
Gf  =G_ss;   % 9- inverse of leverage
qf = q_ss;     % 10- relative price of capital goods
rkf =rk_ss;    % 11- rental rate on capital
smalldf =smalld_ss;
w_hf =wh_ss;  % 13 - wage rate (households)
w_ef =we_ss;  % 14 - wage rate (entrepreneurs)
w_bf =wb_ss;  % 15 - wage rate (bankers)
inflf = infl_ss;
Raf =Ra_ss;   % 17 - gross return on bank capital
lamf =lam_ss;   % 18 - marginal utility of consumption
CAf =CA_ss;
pf = p_ss;    % inverse of real money balances
gYf = gY_ss;
mcrf =mc_ss;   % fraction of HH's financiel assets held as currency
sf = s_ss;    % marginal costs
totCf = totC_ss;
log_yf = log(Yf);
log_If = log(If);
TLf = TL_ss;
expinflf = expinfl_ss;
uf = u_ss;  % utilization rate on physical capital
kefff = K_ss;  % effective capital services
Kf =K_ss;    % total physical capital
Kbf =Kb_ss;   % holdings of physical capital by banking sector
Kef =Ke_ss;    % holdings of physical capital by entrepreneurial sector
ptildef =xi_p * nump/ ((xi_p - 1) * denp );; % price chosen by reoptimising price-setters
numpf = (lam_ss * Y_ss * s_ss * infl_ss^xi_p)/(1-bet*phi_pf);   %auxiliary variable used in solving for ptilde
denpf = (lam_ss * Y_ss * infl_ss^(xi_p-1))/(1-bet*phi_pf);  %auxiliary variable used in solving for ptilde
wtildef = wtilde_ss; % price chosen by reoptimising wage-setters
numwf =  ( ( (wh_ss*infl_ss)^(xi_w*(1+elas_l)) * H_ss^(1+elas_l) ) )^(1/(1+elas_l*xi_w)); %auxiliary variable used to help solve for wtilde
denwf = ( (wh_ss^(xi_w)*infl_ss^(xi_w-1)*H_ss*lam_ss) )^(1/(1+elas_l*xi_w));  %auxiliary variable used to help solve for wtilde
%numwf = numw_ss;
%denwf = denw_ss;
Rdf = Rd_ss;

%%
%% END OF THE MODEL SPECIFIC BLOCK.


%% DO NOT CHANGE THIS PART.
%%
%% Here we define the steady state values of the endogenous variables of
%% the model.
%%
params=NaN(NumberOfParameters,1);
for iter = 1:length(M_.params) %update parameters set in the file
  eval([ 'params(' num2str(iter) ') = ' M_.param_names{iter} ';' ])
end

NumberOfEndogenousVariables = M_.orig_endo_nbr; %auxiliary variables are set automatically
for ii = 1:NumberOfEndogenousVariables
  varname = M_.endo_names{ii};
  eval(['ys(' int2str(ii) ') = ' varname ';']);
end
                                                        % End of the loop.
%%
%% END OF THE SECOND MODEL INDEPENDENT BLOCK.
