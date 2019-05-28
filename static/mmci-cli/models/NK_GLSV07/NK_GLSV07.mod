// Model: NK_GLSV07

// Further references:  Gali, J., Lopez-Salido, J.D. and Valles, J., 2007.
// Understanding the effects of government spending on consumption.
// Journal of the European Economic Association, 5(1), pp.227-270.

// Version of the model: Non-competitive labor market

// Implemented to the MMB by: Lazar Milivojevic (lazar.milivojevic@hotmail.com) 2018
// In order to define the output gap I had to add the block of the model under flexible prices.

// Replicated impulse responses do not match the IRFs from the paper precisely for all the variables.
// Qualitatively they are the same.

// Variables

var

n c r pi k b g y e_g

nf cf kf bf yf rf // flex-price variables

//**************************************************************************
// Modelbase Variables                                                   //*
        interest inflation inflationq outputgap output fispol                   //*
        ;                                                                //*
//**************************************************************************



predetermined_variables k, b, kf, bf ;

varexo
// e_g

//**************************************************************************
// Modelbase Shocks                                                      //*
       interest_
       fiscal_
       ;                                                        //*
//**************************************************************************

//Parameters

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
        std_r_ std_r_quart  coffispol                                             //*
                                                                         //*
//**************************************************************************



alpha beta gamma_c gamma_c_bar gamma_g delta eta theta theta_n theta_tau lambda lambda_p my_p rho rho_g sigma_bar phi_b phi_g phi_pi omega psi phicap;

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
cd(thispath);                                                                         //*
// Definition of Discretionary Fiscal Policy Parameter                   //*
coffispol = 1;                                                          //*
//**************************************************************************



//Calibration

alpha=0.33;             %Elasticity of output with respect to capital
beta=0.99;              %Household discount factor
gamma_g=0.2;            %Share of government purchase to output in stedy state
delta=0.025;            %Depreciation rate of capital
eta=1;                  %The elasticity of incestement wrt q
theta=0.75;             %Fraction of firms that keep their price constant
lambda=0.5;             %Amount of rule-of-thumb households
my_p=1.2;               %Steady state price markup
psi=0.2;                %Elasticity of wages wrt hours
phi_pi=1.5;             %The response of the monetary authority to inflation

rho= beta^(-1)-1;
gamma_c= (1-gamma_g) - delta*alpha/((rho+delta)*my_p);
gamma_c_bar= gamma_c + gamma_g;
lambda_p= (1-beta*theta)*(1-theta)/theta;

//parameters describing the fiscal policy rule
phi_b=0.33;
phi_g=0.10;
rho_g=0.9;

//parameter generated for the solution of the model
phicap= 1/(gamma_c*my_p - lambda*(1-alpha));
sigma_bar= 1/((1-lambda)*phicap*gamma_c*my_p);
omega= eta*(1-beta*(1-delta))*(1-gamma_c_bar)  ;
theta_tau= lambda*phicap*my_p ;
theta_n= lambda*phicap*(1-alpha)*(1+psi) ;

model;

//**************************************************************************
// Definition of Modelbase Variables in Terms of Original Model Variables //*

interest   = 4*r;
inflation  = (pi + pi(-1) + pi(-2) + pi(-3));
inflationq = 4*pi;
outputgap  = (y - yf);
output     = y;
fispol     = e_g;
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
           + std_r_ *interest_;                                          //*
                                                                         //*
// Discretionary Government Spending                                     //*
                                                                         //*
fispol = coffispol*fiscal_;                                            //*
//**************************************************************************

// C1
k(+1) = (1-delta+delta*alpha/(1-gamma_c_bar))*k + n*delta*(1-alpha)/(1-gamma_c_bar) - c*delta*gamma_c/(1-gamma_c_bar) - g*delta/(1-gamma_c_bar);

// C3
pi = beta*pi(+1) + lambda_p*c - alpha*lambda_p*k + (alpha + psi)*lambda_p*n;

// C6
c - theta_n*n + r/sigma_bar = c(+1) + pi(+1)/sigma_bar - theta_n*n(+1) + theta_tau*phi_b*(b(+1)-b) + theta_tau*phi_g*(rho_g-1)*g;

// C7
(1-alpha)*n - gamma_c*c - (1-gamma_c_bar-alpha)*k + (1-gamma_c_bar)*eta*r = (omega*(1+psi)+beta*(1-alpha))*n(+1)+(omega-beta*gamma_c)*c(+1)- (omega+beta*(1-gamma_c_bar-alpha))*k(+1) + (1-gamma_c_bar)*eta*pi(+1) + (1-beta*rho_g)*g ;

// 37
b(+1)= (1+rho)*(1-phi_b)*b + (1+rho)*(1-phi_g)*g;

// 21
g=rho_g*g(-1) + e_g;

// 35
y= (1-alpha)*n + alpha*k;

// Monetary policy rule
// r = pi*phi_pi;

// Flexible price model

// C1
kf(+1) = (1-delta+delta*alpha/(1-gamma_c_bar))*kf + nf*delta*(1-alpha)/(1-gamma_c_bar) - cf*delta*gamma_c/(1-gamma_c_bar) - g*delta/(1-gamma_c_bar);

// C3
0 = cf - alpha*kf + (alpha + psi)*nf;

// C6
cf - theta_n*nf + rf/sigma_bar = cf(+1) - theta_n*nf(+1) + theta_tau*phi_b*(bf(+1)-bf) + theta_tau*phi_g*(rho_g-1)*g;

// C7
(1-alpha)*nf - gamma_c*cf - (1-gamma_c_bar-alpha)*kf + (1-gamma_c_bar)*eta*rf = (omega*(1+psi)+beta*(1-alpha))*nf(+1)+(omega-beta*gamma_c)*cf(+1)- (omega+beta*(1-gamma_c_bar-alpha))*kf(+1) + (1-beta*rho_g)*g ;

// 37
bf(+1)= (1+rho)*(1-phi_b)*bf + (1+rho)*(1-phi_g)*g;


// 35
yf= (1-alpha)*nf + alpha*kf;


end;


%steady;

shocks;
// var e_g=1;
var fiscal_; stderr 1;
end;

//stoch_simul(irf=20, noprint, nograph) ;
