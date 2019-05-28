//**************************************************************************
// A New Comparative Approach to Macroeconomic Modeling and Policy Analysis
//
// Volker Wieland, Tobias Cwik, Gernot J. Mueller, Sebastian Schmidt and
// Maik Wolters
//
// Working Paper, 2009
//**************************************************************************

// Model: NK_PP17

// Model replication coded by: Philipp Lieberknecht,
//                             e_mail: philipp.lieberknecht@gmail.com
// Last edited: 18/01/2018

// PAOLI, B. D. and PAUSTIAN, M. (2017)
// Coordinating Monetary and Macroprudential Policies.
// Journal of Money, Credit and Banking, 49: 319�349.
//**************************************************************************

var
y       // output
yg      // output gap
R       // gross nominal interest rate
pi      // gross quarterly inflation
phi     // credit distortion
n       // net worth
del     // leverage
S       // macroprudential subsidy
z       // marginal costs

yf      // output flex
ygf     // output gap flex
Rf      // gross nominal interest rate flex
phif    // credit distortion flex
nf      // net worth flex
delf    // leverage flex
Sf      // macroprudential subsidy flex
zf      // marginal costs flex

a       // technology shock
ns      // net worth shock
eps_m   // mark-up shock
//eps_R   // monetary policy shock
lam     // divertable fraction of loans, moral hazard shock

//**************************************************************************
// Modelbase Variables                                                   //*
        interest inflation inflationq outputgap output; //fispol         //*
//**************************************************************************

varexo
eta_a   // technology shock innovation
eta_m   // mark-up shock innovation
eta_n   // net worth shock innovation
//eta_R   // monetary policy shock innovation
eta_l   // moral hazard shock innovation

//**************************************************************************
// Modelbase Shocks                                                      //*
       interest_; //fiscal_                                             //*
//**************************************************************************

parameters

//**************************************************************************
// Modelbase Parameters

        cofintintb1 cofintintb2 cofintintb3 cofintintb4
        cofintinf0 cofintinfb1 cofintinfb2 cofintinfb3 cofintinfb4
        cofintinff1 cofintinff2 cofintinff3 cofintinff4
        cofintout cofintoutb1 cofintoutb2 cofintoutb3 cofintoutb4
        cofintoutf1 cofintoutf2 cofintoutf3 cofintoutf4
        cofintoutp cofintoutpb1 cofintoutpb2 cofintoutpb3 cofintoutpb4
        cofintoutpf1 cofintoutpf2 cofintoutpf3 cofintoutpf4
        std_r_ std_r_quart coffispol
//**************************************************************************

betta   $\beta$             // discount factor
sig     $\sigma$            // CRRA utility parameter
alfa    $\alpha$            // labor share
thet    $\thet$             // inverse Frisch labor supply elasticity
eps     $\epsilon$          // Dixit-Stiglitz elasticity of substitution
del_ss  $\delta_{ss}$       // Steady-state leverage
phi_ss  $\phi_{ss}$         // Steady-state credit spread
varphi  $\varphi$           // Rotemberg adjustment cost parameter
b                           // auxiliary variable
kap     $\kappa$            // slope of Phillips curve wrt marginal costs
rho_a   $\rho_a$            // persistence technology shock
rho_m   $\rho_m$            // persistence mark-up shock
rho_n   $\rho_n$            // persistence net worth shock
rho_R   $\rho_R$            // persistence monetary policy shock
rho_l   $\rho_l$            // persistence moral hazard shock
tau     $\tau$              // Taylor rule coefficient inflation
tau_g   $\tau_g$            // Taylor rule coefficient output gap
;

betta   = 0.99;
sig     = 1;
alfa    = 0.50;
thet    = 0.47; // the text in 4.1 says unitary elasticity, thet = 1
eps     = 10;
del_ss  = 9;
phi_ss  = 0.02;
varphi  = 211; // the text in 4.1 says 173.08, which is the value from CFP(2010)
b       = 1/(1+phi_ss);
kap     = (eps-1)/varphi;
rho_a   = 0.95;
rho_m   = 0.95;
rho_n   = 0;
rho_R   = 0.5;  // not given in paper
rho_l   = 0.5;  // not given in paper
tau     = 1.5;
tau_g   = 0.125;

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
    std_r_=100;

// Definition of Discretionary Fiscal Policy Parameter                   //*
coffispol = 1;                                                           //*

//**************************************************************************


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Model %%%
model(linear);

//**************************************************************************
// Definition of Modelbase Variables in Terms of Original Model Variables //*

interest   = R*4;                                                        //*
inflation  = pi+pi(-1)+pi(-2)+pi(-3);                                    //*
inflationq = pi*4;                                                       //*
outputgap  = y - yf;                                                     //*
output     = y;
//**************************************************************************

//**************************************************************************
// Policy Rule                                                           //*
                                                                         //*
// Monetary Policy                                                       //*
                                                                        //*
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
           + std_r_/100 *interest_;                                          //*
                                                                         //*
// Discretionary Government Spending                                     //*
                                                                         //*
//fispol = coffispol*fiscal_;                                            //*
//**************************************************************************

// Sticky price economy
[name='(22) Phillips curve']
pi = kap*((sig+thet)*yg+alfa*(R+b*phi) + eps_m) + betta*pi(+1);
[name='(23) Euler equation']
R = sig*(yg(+1)-yg) + (thet+1)/(sig+thet)*sig*(a(+1)-a) + pi(+1);
[name='(24) Net worth evolution']
n = n(-1) + R(-1) - pi + 1/(phi_ss*del_ss+1)*(phi_ss*del_ss*del(-1) + del_ss*phi(-1) + (del_ss-1)*S(-1))+ns;
[name='(25) Firms labor demand and bank sector']
del + n = (1+sig+thet)*yg + (thet+1)/(sig+thet)*a - (1-alfa)*(R + b*phi);
[name='(26) Incentive compatability constraint']
del + lam = del_ss*phi + (del_ss - 1)*S + betta*((phi_ss*del_ss+1)*del(+1) + lam(+1));
[name='Macroprudential policy']
S = 0;
//[name='Taylor Rule']
//R = tau*pi + tau_g*yg + eps_R;
[name='Output gap']
yg = y-(1+thet)/(sig+thet)*a;
[name='Marginal costs']
z = kap*((sig+thet)*yg+alfa*(R+b*phi));

// Flexible price economy
[name='Output gap and credit friction']
0 = (sig+thet)*ygf + alfa*b*phif;
[name='(23) Euler equation']
Rf = sig*(ygf(+1)-ygf) + (thet+1)/(sig+thet)*sig*(a(+1)-a);
[name='(24) Net worth evolution']
nf = nf(-1) + Rf(-1) + 1/(phi_ss*del_ss+1)*(phi_ss*del_ss*delf(-1) + del_ss*phif(-1) + (del_ss-1)*Sf(-1))+ns;
[name='(25) Firms labor demand and bank sector']
delf + nf = (1+sig+thet)*ygf + (thet+1)/(sig+thet)*a - (1-alfa)*(Rf + b*phif);
[name='(26) Incentive compatability constraint']
delf + lam = del_ss*phif + (del_ss - 1)*Sf + betta*((phi_ss*del_ss+1)*delf(+1) + lam(+1));
[name='Macroprudential policy']
Sf = 0;
[name='Output gap']
ygf = yf-(1+thet)/(sig+thet)*a;
[name='marginal costs']
zf =  0;

[name='Technology']
a = rho_a*a(-1) - eta_a;
[name='Mark-up shock']
eps_m = rho_m*eps_m(-1) + eta_m;
[name='Net worth shock']
ns = rho_n*ns(-1) - eta_n;
//[name='Monetary policy shock']
//eps_R = rho_R*eps_R(-1) - eta_R;
[name='Moral hazard shock']
lam = rho_l*lam(-1) + eta_l;

end;

shocks;
var eta_a;      stderr 0.5;
var eta_m;      stderr 0.5;
var eta_n;      stderr 4.3;
//var eta_R;      stderr 1;    // not given in paper
var interest_;  stderr 1;
var eta_l;      stderr 1;    // not given in paper
end;

%check;
%steady;
close all;
%stoch_simul(order=1,irf=21, noprint, nograph);
