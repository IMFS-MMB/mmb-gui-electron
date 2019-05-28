//**************************************************************************
// A New Comparative Approach to Macroeconomic Modeling and Policy Analysis
//
// Volker Wieland, Tobias Cwik, Gernot J. Mueller, Sebastian Schmidt and
// Maik Wolters
//
//**************************************************************************
% Model: NK_GM07

% Further Reference:
% Goodfriend, M., B.T. McCallum. 2007. " Banking and interest raets in monetary policy analysis: A quantitative exploration".
% Journal of Monetary Economics 54, pp. 1480-1507.

% Created by Felix Strobel (02.10.17)

% for replicating figures 3-7 adjust parameters mu_1, mu_2, and mu_3, in the following way:
% Fig 3: mu_1 = 50;     mu_2 = 0.0; mu_3 = 0.0;
% Fig 4: mu_1 = 1.5;    mu_2 = 0.5; mu_3 = 0.0;
% Fig 5: mu_1 = 50;     mu_2 = 0.0; mu_3 = 0.0;
% Fig 6: mu_1 = 50;     mu_2 = 0.0; mu_3 = 0.0;
% Fig 7: mu_1 = 1.5;    mu_2 = 0.5; mu_3 = 0.8;

%********************************************************************************************************************

var dp, mc, omega, lambda, xi, w, n, m, c, q, p, h, b, a1, a2, a3, CEFP, UEFP, rT, rIB, rL, rB
//**************************************************************************
// Modelbase Variables                                                   //*
   interest inflation inflationq output outputgap fispol;                //*
//**************************************************************************

varexo eps_a1, eps_a2, eps_a3

//**************************************************************************
// Modelbase Shocks                                                      //*
       interest_;                                                       //*
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
        std_r_ std_r_quart coffispol                                     //*
//**************************************************************************

phi, eta, theta, beta, kappa, alpha, k, delta, gamma, rr, V, boc F
K, n_ss, m_ss, c_ss, w_ss, b_ss, omega_ss, lambda_ss, mc_ss, UEFP_ss, CEFP_ss, rT_ss, rIB_ss, rL_ss, rB_ss,
rho_h, rho_a1, rho_a2, rho_a3,
mu_1, mu_2, mu_3;


// parameters

phi = 0.4;
eta = 0.36;
theta = 10;
mc_ss = 1/1.1;
beta = 0.99;
kappa = 0.05;
alpha = 0.65;
k = 0.2;
delta = 0.025;
gamma = 0.005;
V = 0.31;
rr = 0.005;
boc=0.56;
F=9;

// persistence parameters

rho_h  = 0.6;  %Fig 1: 0.6 Fig 2: 0.99
rho_a1 = 0.99;
rho_a2 = 0.99;
rho_a3 = 0.9;


// monetary policy

mu_1 = 1.5;   %Fig 3&5&6: 50  Fig 4: 1.50 Fig 7: 1.5
mu_2 = 0.5;   %Fig 3&5&6: 0.0 Fig 4: 0.50 Fig 7: 0.5
mu_3 = 0.0;   %Fig 3&5&6: 0.0 Fig 4: 0.00 Fig 7: 0.8


// steady-state "parameters"

K = 9.19;
n_ss = 0.3195;
m_ss = 0.0063;
c_ss = 0.8409;
w_ss = 1.949;
b_ss = boc*c_ss;
omega_ss = 0.237;
lambda_ss = 0.457;
CEFP_ss = (V * w_ss * m_ss) / ((1 - rr) * c_ss);
UEFP_ss = (V * w_ss * m_ss) / ((1 - alpha) * (1 - rr) * c_ss);
rT_ss = 0.015;
rIB_ss = 0.0021;
rL_ss = 0.0066;
rB_ss = 0.0052;

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

//**************************************************************************

model;

//########################
//#### baseline model ####
//########################

//(32)
dp = beta * dp(+1) + kappa * mc;

//(33)
mc = xi - lambda;

//(34)
//(34')
%h - h(-1) = rho_h * (h(-1) - h(-2)) + eps_h;

//(35)
h = c + p;

//(36)
lambda + w = (n_ss / (1 - n_ss - m_ss)) * n + (m_ss / (1 - n_ss - m_ss)) * m;

//(37)
w + m + ((c_ss * (1 - alpha)) / (m_ss * w_ss)) * c + (1 + (c_ss * (1 - alpha)) / (m_ss * w_ss)) * lambda = 0;

//(38)
omega = ((k * K / c_ss) / (b_ss + (k * K / c_ss))) * (c - q - a3) - (b_ss / (b_ss + (k * K / c_ss))) * b;

//(39)
c = (1 + (delta * K / c_ss)) * (1 - eta) * (n + a1) - (delta * K / c_ss) * q;

//(40)
c = (1 - alpha) * (a2 + m) + (alpha * b_ss * c_ss / (b_ss * c_ss + k * K * (1 + gamma)) * (b + c) + (alpha * k * K * (1 + gamma) / (b_ss * c_ss + k * K * (1 + gamma))) * (a3 + q));

//(41)
mc = w + n - c;

//(42)
dp = p - p(-1);

//(43)
((k * omega_ss * phi) / (c_ss * lambda_ss)) * c = k * omega_ss * (phi / (c_ss * lambda_ss) - 1) * (omega + a3) + (k * omega_ss * ( phi / (c_ss * lambda_ss) - 1) - 1 ) * q + (beta / (1 + gamma)) * (1 - delta ) * q(+1) + (beta / (1 + gamma)) * (1 - delta + eta * mc_ss * (n_ss / K)^(1 - eta)) * lambda(+1) + ((beta * eta * mc_ss / (1 + gamma)) * (n_ss / K)^(1 - eta)) * (mc(+1) + (1 - eta) * (n(+1) + a1(+1))) - (k * omega_ss * phi / (c_ss * lambda_ss) + (beta / (1 + gamma)) * (1 - delta + eta * mc_ss * (n_ss / K)^(1 - eta))) * lambda;

//**************************************************************************
// Definition of Modelbase Variables in Terms of Original Model Variables//*

interest = rIB*4;
inflation = dp+dp(-1)+dp(-2)+dp(-3);
inflationq = dp*4;
outputgap = mc*4;
%outputgap = 0;
output = c;
fispol = 0;
//**************************************************************************
%rIB = (1 - mu_3) * ((1 + mu_1) * dp(+1) + mu_2 * (mc)) + mu_3 * (rIB(-1)) + eps_i;
%mu_3 =cofintintb1
%mu_1 = cofintinff1
%mu_2 = cofintout
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
           + std_r_ *interest_;                                          //*
                                                                         //*
//########################
//#### interest-rates ####
//########################
% comment: here, EFPs and interest rates are in absolute deviations from their steady state
% alternatively, one can define the EFPs in term of log-deviations to obtain EFP=w+m-c as in the paper (page 1498).
% Then, the use of CEFP and UEFP in equations (20) and (21) has to be adjusted accordingly (multiplied by their respective steady states).
% To reproduce the results of the paper, treat the CEFP and UEFP as log-devations in the definition of the EFP
% and inconsistently as absolute deviations in equations 20 and 21.

//Definition of the EFP
CEFP/CEFP_ss = (w + m - c);
UEFP/UEFP_ss = (w + m - c);

//(16)
rT = 1/beta*1/(1+gamma)*(dp(+1) + lambda - lambda(+1));
//(17)
rT - rB = omega_ss * (phi / (c_ss * lambda_ss)) * (omega - c - lambda) - omega_ss * omega;
//(20)
rT - rIB =  UEFP;
//(22)
rL - rIB =  CEFP;




//########################
//##### policy rules #####
//########################


//Policy determination of constant bonds to consumption
b = 0;



//########################
//### shock-processes ####
//########################

a1 = rho_a1 * a1(-1) + eps_a1;
a2 = rho_a2 * a2(-1) + eps_a2;
a3 = rho_a3 * a3(-1) - eps_a3;


end;



%steady;
shocks;

var	eps_a1;  stderr 1;
var interest_; stderr 1;
var eps_a2;  stderr 1;
var eps_a3;  stderr 1;

%var	eps_h;  stderr 1;

end;

%check;

%stoch_simul(order=1,irf=20) n, w, m, q, rIB, mc, c, lambda, EFP, rB, dp, rT;stoch_simul(order=1,irf=20) n, w, m, q, rIB, mc, c, lambda, EFP, rB, dp, rT;
