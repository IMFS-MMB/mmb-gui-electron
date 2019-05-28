//**************************************************************************
// A New Comparative Approach to Macroeconomic Modeling and Policy Analysis
//
// Volker Wieland, Tobias Cwik, Gernot J. Mueller, Sebastian Schmidt and
// Maik Wolters
//
// Working Paper, 2009
//**************************************************************************

// Model: NK_MM10

// Further references:
// Meh, C., and K. Moran. 2010. "The role of bank capital in the propagation of shocks." Journal of Economic Dynamics and Control.


// Last edited: 15/08/2012 by R. Beyer and N. Balz
// Note: We have added the flexible price & wage economy to the code in order to define the output gap.

var

ch    % 1- household consumption
Ce    % 2- entrepreneurial consumption
Cb    % 3- banking consumption
H     % 4- aggregate (composite) labour input
Y     % 5- Output
I     % 6- Investment
bigN  % 7- entrepreneurial net worth
bigA  % 8- net worth of banking sector (bank capital)
G     % 9- inverse of leverage
q     % 10- relative price of capital goods
rk    % 11- rental rate on capital
infl  % 12 - gross rate of quarterly inflation
w_h   % 13 - wage rate (households)
w_e   % 14 - wage rate (entrepreneurs)
w_b   % 15 - wage rate (bankers)
Rd    % 16 - gross, nominal rate of interest
Ra    % 17 - gross return on bank capital
lam   % 18 - marginal utility of consumption
CA    % Capital-Asset ratio of banking sector
p     % inverse of real money balances
TL    % Aggregate bank lending in the economy
mc    % fraction of HH's financiel assets held as currency
s     % marginal costs
mgrowth % growth rate of money
expinfl % expected rate of inflation at time t+1
smalld  % real value of household deposits
gY   % gross rate of output growth
totC % aggregate consumption
u    % utilization rate on physical capital
keff  % effective capital services
K     % total physical capital
Kb    % holdings of physical capital by banking sector
Ke    % holdings of physical capital by entrepreneurial sector
ptilde % price chosen by reoptimising price-setters
nump   %auxiliary variable used in solving for ptilde
denp   %auxiliary variable used in solving for ptilde
wtilde % price chosen by reoptimising wage-setters
numw   %auxiliary variable used to help solve for wtilde
denw   %auxiliary variable used to help solve for wtilde
lz     % log of exogenous technology z
lmp    % log of monetary policy disturbance
lbk    % log of disturbances to bank capital
log_y  %
log_I

//flex price economy variables

chf    % 1- household consumption
Cef    % 2- entrepreneurial consumption
Cbf    % 3- banking consumption
Hf     % 4- aggregate (composite) labour input
Yf     % 5- Output
If     % 6- Investment
bigNf  % 7- entrepreneurial net worth
bigAf  % 8- net worth of banking sector (bank capital)
Gf     % 9- inverse of leverage
qf     % 10- relative price of capital goods
rkf    % 11- rental rate on capital
smalldf
w_hf   % 13 - wage rate (households)
w_ef   % 14 - wage rate (entrepreneurs)
w_bf   % 15 - wage rate (bankers)
inflf
Raf    % 17 - gross return on bank capital
lamf   % 18 - marginal utility of consumption
CAf
Rdf    % nominal interest rate in flex price economy
sf     % marginal costs
TLf    % Aggregate bank lending in the economy
gYf   % gross rate of output growth
totCf
uf    % utilization rate on physical capital
kefff  % effective capital services
Kf     % total physical capital
Kbf    % holdings of physical capital by banking sector
Kef    % holdings of physical capital by entrepreneurial sector
log_yf  %
log_If
wtildef


//**************************************************************************
// Modelbase Variables                                                   //*
        interest inflation inflationq output outputgap;                  //*
//**************************************************************************



varexo
techShock  % innovation to productivity process


//**************************************************************************
// Modelbase Shocks                                                      //*
  interest_ ;                                                            //*
//**************************************************************************

parameters
//**************************************************************************
// Modelbase Parameters                                                  //*
                                                                         //*
        cofintintb1 cofintintb2 cofintintb3 cofintintb4                  //*
        cofintinf0 cofintinfb1 cofintinfb2 cofintinfb3 cofintinfb4       //*
        cofintinff1 cofintinff2 cofintinff3 cofintinff4                  //*
        cofintout cofintoutb1 cofintoutb2 cofintoutb3 cofintoutb4        //*
        cofintoutf1 cofintoutf2 cofintoutf3 cofintoutf4                  //*
        cofintoutp cofintoutpb1 cofintoutpb2 cofintoutpb3 cofintoutpb4   //*
        cofintoutpf1 cofintoutpf2 cofintoutpf3 cofintoutpf4              //*
        std_r_ std_r_quart                                               //*
//**************************************************************************


habit
bet
delta
reta
psi_l
elas_l
chi1
chi2
pi_ss
xi_w
phi_w
phi_wf
mark_w
eta_h
eta_e
eta_b
xi_p
phi_p
phi_pf
mark_p
theta_k
theta_h
theta_e
theta_b
alphag
mu
mu_ss
bigR
delalpha
smallb
tau_b
tau_e
lam_r
lam_pi
lam_y
bigtheta
bby
nu
rhoz
rhomp
rhobk
sigmaz
sigmamp
sigmabk
;

habit = 0.65;  %parameter governing habit formation (CEE 2005 use 0.65)
bet = 0.99;    %discount factor
delta = 0.02;  %depreciation of physical capital
reta = 0.001832219;
psi_l = 4.55;
elas_l = 0.429;
pi_ss = 1.02^(0.25);
%pi_ss=0;
lam_r = 0.8;
lam_pi = 1.5;
lam_y = 0.1/4;
Rd_temp = pi_ss/bet;

% nominal rigidities and elasticities of substitution, follows CEE (2005)
xi_w = 21;
phi_w = 0.64;
phi_wf = 0.64;
xi_p = 6;
phi_p = 0.6;
phi_pf = 0.6;
mark_p  = xi_p/(xi_p-1);
mark_w = xi_w/(xi_w-1);

eta_h = 0.9;            % measure of agents that are households
eta_e = 0.07;           % measure of agents that are entrepreneurs
eta_b = 1-eta_h-eta_e;    % measure of agents that are bankers

theta_h = 0.639999;   % share of household labor in production
theta_k = 0.36;       % share of capital in production
theta_e = (1.0-theta_h-theta_k)/2.0;    % share of entrepreneurial labor in production
theta_b = 1.0-theta_h-theta_k-theta_e;   % share of bank labor in production

% sector producing physical capital
alphag = 0.9903;
%smallb=0.9;
smallb = 0.1547;
delalpha = 0.2411;
tau_b = 0.7230;
tau_e = 0.7817;
bigR = 1.2118;

mu = 0.025;
mu_ss = 0.025;

% One can shut off the bank channel by putting mu = 0. In order to do so one
% in addition has to disable the control loop in steady_.m that controls whether
% the steady state really solves the model.


bby = 0.000;
% additional capital endowment banks receive every period, as a percentage of output.
% This can be used for experiments with more bank capital; for that, set bby to  0.007


nu = 1.0;

% Parameters related to shock processes
rhoz = 0.95;    %autocorrelation of technology
sigmaz = 0.0035; % s.d. of innovation to technology

%sigmaz = 0.01;

%Parameter related to capital utilisation:
sigma_a = 0.01;  % from CEE(2005) this is (upsilon''(1)/upsilon'(1))


rhomp = 0.0;  %autocorrelation of disturbances to the MP rule
sigmamp = 0.0016; % s.d. of innovations to these disturbances.

rhobk = 0.90;  %autocorrelation of shocks to bank capital
%sigmabk = 2.5; % s.d. of innovations to these disturbances.
sigmabk = 0.000001;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

//**************************************************************************
// Specification of Modelbase Parameters                                 //*
                                                                         //*
// Load Modelbase Monetary Policy Parameters                             //*
thispath = pwd;
cd('..');
load policy_param.mat;
for i=1:33
    deep_parameter_name = M_.param_names(i,:);
    eval(['M_.params(i)  = ' deep_parameter_name ' ;'])
end
cd(thispath);
std_r_ = 100;                                                            //*
                                                                         //*
// Definition of Discretionary Fiscal Policy Parameter                   //*
%coffispol;                                                              //*
//**************************************************************************


//**************************************************************************


// Original Model Code:

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% steady-state computations:


kk1 = delta*theta_k/(alphag*bigR*(1/bet-1+delta));
betatemp  = 1/bet;

infl_temp = pi_ss;

qtemp = kk1*(alphag*tau_b*mu*betatemp/delalpha-(1+mu+alphag*mu/(Rd_temp*delalpha)));

qtemp = qtemp/(alphag*smallb*kk1/(Rd_temp*delalpha)-alphag*bigR*kk1/Rd_temp-theta_e-theta_b-bby-alphag*tau_e*smallb*kk1*betatemp/delalpha);

Gtemp = 1+mu-(qtemp*alphag/Rd_temp)*(bigR-mu/(qtemp*delalpha)-smallb/delalpha);

IY = kk1/qtemp;

KY = alphag*bigR*IY/delta;

KeY = tau_e*alphag*smallb*IY/delalpha;

KbY = tau_b*alphag*mu*IY/(qtemp*delalpha);

KhY = KY - KeY - KbY;

CeY = (1-tau_e)*alphag*smallb*IY*qtemp/delalpha;

CbY = nu*(1-tau_b)*alphag*mu*IY/delalpha;

ChY = 1 + bby - CeY - CbY  - (1+mu)*IY;

essai = (1-bet*habit)*theta_h/((1-habit)*ChY*psi_l*mark_w);

smallh = essai^(1/(1+elas_l));

Htemp = smallh*eta_h^(xi_w/(xi_w-1));

kk2 = (KY^(1/(1-theta_k))) * (eta_e^(theta_e/(1-theta_k)))* (eta_b^(theta_b/(1-theta_k)))* mark_p^(1/(theta_k-1));

Ktemp = Htemp^(theta_h/(1-theta_k))* kk2;

Ytemp = (1/mark_p)* (Ktemp^theta_k)*(Htemp^theta_h)*(eta_e^theta_e)*(eta_b^theta_b);

% fixed cost parameter to ensure zero profits in s.s.
bigtheta = (mark_p-1)*Ytemp;

Itemp = IY*Ytemp;

rktemp = (1/mark_p)*theta_k*(Ktemp^(theta_k-1))*(Htemp^theta_h)*(eta_e^theta_e)*(eta_b^theta_b);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Following Fernandez Villaverde et al. (2010) as well as others,
% set utilisation of capital as
%upsilon(u) = chi_1 (u - 1) + 0.5chi_2 (u - 1)^2
%Set parameters in a way that replicates CEE (2005)
chi1 = rktemp;
chi2 = sigma_a*chi1;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


w_htemp = (1/mark_p)*theta_h*(Ktemp^theta_k)*(Htemp^(theta_h-1))*(eta_e^theta_e)*(eta_b^theta_b);

w_etemp = (1/mark_p)*theta_e*(Ktemp^theta_k)*(Htemp^theta_h)*(eta_e^(theta_e-1))*(eta_b^theta_b);

w_btemp = (1/mark_p)*theta_b*(Ktemp^theta_k)*(Htemp^theta_h)*(eta_e^theta_e)*(eta_b^(theta_b-1));

Ketemp = KeY*Ytemp;

Kbtemp = KbY*Ytemp;

Khtemp = KhY*Ytemp;

Cetemp = CeY*Ytemp;

Cbtemp = CbY*Ytemp;

chtemp = ChY*Ytemp/eta_h;

bigAtemp = eta_b*w_btemp+(rktemp+qtemp*(1-delta))*Kbtemp+bby*Ytemp

bigNtemp = eta_e*w_etemp+(rktemp+qtemp*(1-delta))*Ketemp;

totCtemp = Cetemp+Cbtemp+eta_h*chtemp;

lamtemp = (1-bet*habit)/((1-habit)*(chtemp));

smalldtemp = alphag*qtemp*( bigR - smallb/delalpha - mu/(qtemp*delalpha))*Itemp/(Rd_temp*eta_b);

ptemp = (Rd_temp-1)*lamtemp/ ( (Rd_temp-1)*lamtemp*eta_b*smalldtemp + eta_h*reta);

mctemp = reta*ptemp/((Rd_temp-1)*lamtemp);

Ratemp = alphag*qtemp*(mu/(qtemp*delalpha))*Itemp/bigAtemp;

TLtemp = Itemp-bigNtemp;

CAtemp = bigAtemp/((1+mu)*Itemp-bigNtemp);

wtildetemp = w_htemp*infl_temp*eta_h^(-1/(1-xi_w));

numwtemp =  ( ( (w_htemp*infl_temp)^(xi_w*(1+elas_l)) * Htemp^(1+elas_l) )/(1-bet*phi_w) )^(1/(1+elas_l*xi_w));

denwtemp = ( (w_htemp^(xi_w)*infl_temp^(xi_w-1)*Htemp*lamtemp)/(1-bet*phi_w) )^(1/(1+elas_l*xi_w));

wtildetemp = (mark_w*psi_l)^(1/(1+xi_w*elas_l))*numwtemp/denwtemp;

stemp = 1/mark_p;

mgrowthtemp = infl_temp;

expinfltemp = infl_temp;

gYtemp = 1;

utemp = 1;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



//---------------------------------------------------------------------
// 3. Model declaration
//---------------------------------------------------------------------

model;

//**************************************************************************
// Definition of Modelbase Variables in Terms of Original Model Variables //*
                                                                          //*
//interest   = (Rd^4-steady_state(Rd)^4)/(steady_state(Rd)^4)*100;
interest = log(Rd/steady_state(Rd))*400;
inflationq = log(infl/steady_state(infl))*400;
inflation = 1/4*(inflationq+inflationq(-1)+inflationq(-2)+inflationq(-3));
//inflation  = (infl*infl(-1)*infl(-2)*infl(-3)-steady_state(infl)^4)/(steady_state(infl)^4)*100;    //*
//inflationq = ((infl^4-steady_state(infl)^4)/steady_state(infl)^4)*100;    //*
output     =  (log(Y)-log(steady_state(Y)))*100;                          //*
outputgap  =  (log(Y)-log(Yf))*100;                                        //*
//**************************************************************************

//**************************************************************************
// Policy Rule                                                           //*


interest =   cofintintb1*interest(-1)                                    //*
           + cofintintb2*interest(-2)                                    //*
           + cofintintb3*interest(-3)                                    //*
           + cofintintb4*interest(-4)                                    //*
           + cofintinf0*inflationq                                       //*
           + cofintinfb1*inflationq(-1)                                  //*
           + cofintinfb2*inflationq(-2)                                  //*
           + cofintinfb3*inflationq(-3)                                  //*
           + cofintinfb4*inflationq(-4)                                  //*
           + cofintinff1*inflationq(+1)                                  //*
           + cofintinff2*inflationq(+2)                                  //*
           + cofintinff3*inflationq(+3)                                  //*
           + cofintinff4*inflationq(+4)                                  //*
           + cofintout*outputgap 	                                     //*
           + cofintoutb1*outputgap(-1)                                   //*
           + cofintoutb2*outputgap(-2)                                   //*
           + cofintoutb3*outputgap(-3)                                   //*
           + cofintoutb4*outputgap(-4)                                   //*
           + cofintoutf1*outputgap(+1)                                   //*
           + cofintoutf2*outputgap(+2)                                   //*
           + cofintoutf3*outputgap(+3)                                   //*
           + cofintoutf4*outputgap(+4)                                   //*
           + cofintoutp*output 	                                         //*
           + cofintoutpb1*output(-1)                                     //*
           + cofintoutpb2*output(-2)                                     //*
           + cofintoutpb3*output(-3)                                     //*
           + cofintoutpb4*output(-4)                                     //*
           + cofintoutpf1*output(+1)                                     //*
           + cofintoutpf2*output(+2)                                     //*
           + cofintoutpf3*output(+3)                                     //*
           + cofintoutpf4*output(+4)                                     //*
           + std_r_ *interest_;                                          //*
                                                                         //*
// Discretionary Government Spending                                     //*
                                                                         //*
%fispol = coffispol*fiscal_;                                             //*
//**************************************************************************

//flexible price economy

Rdf = steady_state(Rd);

1/(chf - habit*chf(-1)) - bet*habit*1/(chf(+1) - habit*chf) = lamf;

rkf = chi1 + chi2*(uf - 1);

qf*lamf = bet* (lamf(+1)* ( qf(+1)*(1-delta) + rkf(+1)*uf- ( chi1*(uf-1)+0.5*chi2*(uf(+1)-1)^2 ) ));

lamf = bet*lamf(+1)*Rdf/inflf;

inflf^(1-xi_w) *w_hf^(1-xi_w) = eta_h*wtildef^(1-xi_w);

wtildef^(1+xi_w*elas_l) = ((xi_w *psi_l)/(xi_w-1))*1/lamf*Hf^(elas_l)*w_hf^(xi_w*elas_l)*inflf^(1+xi_w*elas_l);

sf=steady_state(s); //steady_state(sf);

rkf = sf * exp(lz)* theta_k * kefff^(theta_k-1) * Hf^theta_h * eta_e^theta_e *eta_b^(theta_b);

w_hf = sf * exp(lz)* theta_h * kefff^(theta_k) * Hf^(theta_h-1) * eta_e^theta_e * eta_b^(theta_b);

w_ef = sf * exp(lz)* theta_e * kefff^(theta_k) * Hf^(theta_h) * eta_e^(theta_e-1) * eta_b^(theta_b);

w_bf = sf * exp(lz)* theta_b * kefff^(theta_k) * Hf^(theta_h) * eta_e^(theta_e) * eta_b^(theta_b-1);

If = (bigAf+bigNf)/Gf;

bigAf*Raf = alphag * mu*If/delalpha;

Gf = 1+ mu - qf *alphag*( bigR - smallb/delalpha - mu/(qf*delalpha) )/(Rdf);

Rdf*eta_b* smalldf = qf*alphag*( bigR-smallb/delalpha - mu/(qf*delalpha))*If;

Kbf = tau_b*alphag*mu*If/(qf*delalpha);

Kef = tau_e*alphag*smallb*If/delalpha;

bigAf = ( rkf + qf*(1-delta*exp(lbk)))*Kbf(-1) + eta_b*w_bf;

bigNf = ( rkf + qf*(1-delta))*Kef(-1) + eta_e*w_ef;

Cbf = (1-tau_b)*alphag*mu*If/delalpha;

Cef = (1-tau_e)*alphag*qf*smallb*If/delalpha;

eta_h *chf + Cef + Cbf + If + If*mu = Yf;

Kf = (1-delta)*Kf(-1) + alphag*bigR*If;

Yf = exp(lz)* (kefff^theta_k)*(Hf^theta_h)*(eta_e^theta_e)*(eta_b^theta_b) - bigtheta;

CAf = bigAf/((1+mu)*If-bigNf);

kefff = uf*( Kf(-1) - Kef(-1) - Kbf(-1) ) + Kef(-1) + Kbf(-1);

gYf = Yf/Yf(-1);

TLf = I - bigNf;

totCf = eta_h *chf + Cef + Cbf;

log_yf = log(Yf);

log_If = log(If);



// Sticky-price economy

1/(ch - habit*ch(-1)) - bet*habit*1/(ch(+1) - habit*ch) = lam;

reta/(mc/p) = (Rd-1)*lam;

rk = chi1 + chi2*(u - 1);

q*lam = bet* (lam(+1)* ( q(+1)*(1-delta) + rk(+1)*u- ( chi1*(u-1)+0.5*chi2*(u(+1)-1)^2 ) ));

lam = bet*lam(+1)*Rd(+1)/infl(+1);

infl = p*mgrowth/p(-1);

wtilde = (xi_w *psi_l/(xi_w-1))^(1/(1+elas_l*xi_w)) * numw /  denw;

numw =  ( bet*phi_w*(numw(+1)^(1+elas_l*xi_w)) + (H^(1+elas_l)) *(w_h*infl)^(xi_w*(1+elas_l)) )^(1/(1+elas_l*xi_w));

denw =  ( bet*phi_w*(denw(+1)^(1+elas_l*xi_w)) + lam*H*(w_h^xi_w)*(infl^(xi_w-1)) )^(1/(1+elas_l*xi_w)) ;

infl^(1-xi_w) *w_h^(1-xi_w) = eta_h*(1-phi_w)*wtilde^(1-xi_w) + phi_w* infl(-1)^(1-xi_w) *w_h(-1)^(1-xi_w);

ptilde = xi_p * nump/ ((xi_p - 1) * denp );

nump = bet*phi_p*nump(+1) + lam*s*Y*infl^xi_p;

denp = bet*phi_p*denp(+1) + lam*Y*infl^(xi_p-1);

infl^(1-xi_p) = (1-phi_p)*ptilde^(1-xi_p) + phi_p*infl(-1)^(1-xi_p);

rk = s * exp(lz)* theta_k * keff^(theta_k-1) * H^theta_h * eta_e^theta_e *eta_b^(theta_b);

w_h = s * exp(lz)* theta_h * keff^(theta_k) * H^(theta_h-1) * eta_e^theta_e * eta_b^(theta_b);

w_e = s * exp(lz)* theta_e * keff^(theta_k) * H^(theta_h) * eta_e^(theta_e-1) * eta_b^(theta_b);

w_b = s * exp(lz)* theta_b * keff^(theta_k) * H^(theta_h) * eta_e^(theta_e) * eta_b^(theta_b-1);

I = (bigA+bigN)/G;

bigA*Ra = alphag * mu*I/delalpha;

G = 1+ mu - q *alphag*( bigR - smallb/delalpha - mu/(q*delalpha) )/(Rd);

Rd*(1-eta_h*mc)/p = q*alphag*( bigR-smallb/delalpha - mu/(q*delalpha))*I;

Kb = tau_b*alphag*mu*I/(q*delalpha);

Ke = tau_e*alphag*smallb*I/delalpha;

bigA = ( rk + q*(1-delta*exp(lbk)))*Kb(-1) + eta_b*w_b;

bigN = ( rk + q*(1-delta))*Ke(-1) + eta_e*w_e;

Cb = (1-tau_b)*alphag*mu*I/delalpha;

Ce = (1-tau_e)*alphag*q*smallb*I/delalpha;

eta_h *ch + Ce + Cb + I + I*mu = Y;

K = (1-delta)*K(-1) + alphag*bigR*I;

%log(Rd/steady_state(Rd)) = lam_r*log( Rd(-1)/steady_state(Rd) ) + (1-lam_r) * ( lam_pi*log(infl/steady_state(infl)) + lam_y*log(Y/steady_state(Y)) ) + lmp;

Y = exp(lz)* (keff^theta_k)*(H^theta_h)*(eta_e^theta_e)*(eta_b^theta_b) - bigtheta;

CA = bigA/((1+mu)*I-bigN);

eta_b* smalld = (1-eta_h*mc)/p;

keff = u*( K(-1) - Ke(-1) - Kb(-1) ) + Ke(-1) + Kb(-1);

expinfl = infl(+1);

gY = Y/Y(-1);

TL = I - bigN;

totC = eta_h *ch + Ce + Cb;

lz = rhoz*lz(-1)+ techShock;

lmp = rhomp*lmp(-1);

lbk = rhobk*lbk(-1);

log_y = log(Y);

log_I = log(I);


end;

//---------------------------------------------------------------------
// 5. Shock declaration
//
//---------------------------------------------------------------------

shocks;
    var techShock = sigmaz^2;
end;


//stoch_simul(order=1,irf = 100,nograph,hp_filter = 1600);







