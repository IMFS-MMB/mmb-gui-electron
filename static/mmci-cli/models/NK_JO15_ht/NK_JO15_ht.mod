// Model: NK_JO15_ht

// Title: Productivity Shocks and Monetary Policy in a Two-Country Model 
// Authors: Tae-Seok Jang, Eiji Okano
// Publication: Front. Econ. China, 2015, 10(1): 7-37. 

// Implemented to the MMB by: Lazar Milivojevic (lazar.milivojevic@hotmail.com) 2019

// Version of the model: High level of trade (alpha=0.9)


// Variables

var x pi_H r pi x_star pi_F_star r_star pi_star r_bar r_bar_star a a_star mc mc_star y y_star y_bar y_bar_star
p p_star e s q

//**************************************************************************
// Modelbase Variables                                                   //*
        interest inflation inflationq outputgap output                    //*                                                                    
        ;                                                                //*
//**************************************************************************

varexo xi_star xi m_star
//m
//**************************************************************************
// Modelbase Shocks                                                      //*       
       interest_
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
        std_r_ std_r_quart                                              //*
                                                                         //*
//**************************************************************************

sigma eta beta theta_H theta_F alpha varphi kappa_H kappa_F omega_2 omega_4 psi varsigma 
delta sigma_omega oomega_2 rho rho_star phi_pi phi_pi_star phi_x phi_x_star varrho varrho_star;

//**************************************************************************
// Specification of Modelbase Parameters                                 //*
                                                                         //*
// Load Modelbase Monetary Policy Parameters                             //*
thispath = cd;                                                           
cd('..');                                                                
load policy_param.mat;                                                   
for i=1:33                                                               
    deep_parameter_name = M_.param_names(i,:);                           
    eval(['M_.params(i)  = ' deep_parameter_name ' ;'])                  
end                                                                      
cd(thispath);           
std_r_ = 100;                                                        //*
                                                              //*
//**************************************************************************

//Calibration

sigma = 4.5;
eta = 2.5;
beta = 0.99;
theta_H = 0.9;
theta_F = 0.75;
alpha = 0.9;
kappa_H = (1-theta_H)*(1-theta_H*beta)/theta_H;
kappa_F = (1-theta_F)*(1-theta_F*beta)/theta_F;
varphi = 3;
omega_2 = alpha*2*(1-alpha)*(sigma*eta-1);
omega_4 = alpha*4*(1-alpha)*(sigma*eta-1);
psi = (omega_4+1)*(1+varphi);
varsigma = (omega_2+1)*sigma+(omega_4+1)*varphi;
delta = sigma^2*(2*omega_2+1)+2*sigma*varphi*(omega_2+1)*(omega_4+1)+(omega_4+1)^2*varphi^2;
sigma_omega = (omega_2+1)*sigma/(omega_4+1);
oomega_2 = alpha*sigma*(1+varphi)*(varsigma+omega_2*sigma)/delta;
rho = 0.55;
rho_star = 0.55;
phi_pi = 1.5;
phi_pi_star = 1.5;
phi_x = 0.5;
phi_x_star = 0.5;
varrho = 0.4;
varrho_star = 0.4;

// Model equations

model (linear);

//**************************************************************************
// Definition of Modelbase Variables in Terms of Original Model Variables //*
// Defined from the perspective of domestic economy
interest   = 4*r;                                           
inflation  = (pi + pi(-1) + pi(-2) + pi(-3));                          
inflationq = 4*pi;                                                              
outputgap  = x;                                             
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
           + std_r_ *interest_;                                          //* 

//**************************************************************************

x = x(+1)-(omega_4+1)/((omega_2+1)*sigma)*r+(omega_4+1)/((omega_2+1)*sigma)*pi_H(+1)+omega_2/(omega_2+1)*x_star(+1)-omega_2/(omega_2+1)*x_star+(omega_4+1)/((omega_2+1)*sigma)*r_bar;
pi_H = beta*pi_H(+1)+kappa_H*varsigma/(omega_4+1)*x+kappa_H*omega_2*sigma/(omega_4+1)*x_star+kappa_H*r;

x_star = x_star(+1)-(omega_4+1)/((omega_2+1)*sigma)*r_star+(omega_4+1)/((omega_2+1)*sigma)*pi_F_star(+1)+omega_2/(omega_2+1)*x(+1)-omega_2/(omega_2+1)*x+(omega_4+1)/((omega_2+1)*sigma)*r_bar_star;
pi_F_star = beta*pi_star(+1)+kappa_F*varsigma/(omega_4+1)*x_star+kappa_F*omega_2*sigma/(omega_4+1)*x+kappa_F*r_star;

// r = varrho*r(-1) + (1-varrho)*phi_pi*pi + (1-varrho)*phi_x*x + m;
r_star = varrho_star*r_star(-1)+(1-varrho_star)*phi_pi_star*pi_star+(1-varrho_star)*phi_x_star*x_star+m_star;

r_bar = -sigma*(1-rho)*psi*((omega_2+1)*varsigma-omega_2^2*sigma)/((omega_4+1)*delta)*a-sigma*(1-rho)*omega_2*psi*(varsigma-sigma*(omega_2+1))/((omega_4+1)*delta)*a_star;
r_bar_star = -sigma*(1-rho)*psi*((omega_2+1)*varsigma-omega_2^2*sigma)/((omega_4+1)*delta)*a_star-sigma*(1-rho)*omega_2*psi*(varsigma-sigma*(omega_2+1))/((omega_4+1)*delta)*a;

pi = pi_H+alpha*sigma/(omega_4+1)*x-alpha*sigma/(omega_4+1)*x(-1)-alpha*sigma/(omega_4+1)*x_star+alpha*sigma/(omega_4+1)*x_star(-1)+oomega_2*a-oomega_2*a(-1)-oomega_2*a_star+oomega_2*a_star(-1);
pi_star = pi_F_star+alpha*sigma/(omega_4+1)*x_star-alpha*sigma/(omega_4+1)*x_star(-1)-alpha*sigma/(omega_4+1)*x+alpha*sigma/(omega_4+1)*x(-1)+oomega_2*a_star-oomega_2*a_star(-1)-oomega_2*a+oomega_2*a(-1);

mc = varsigma/(omega_4+1)*x + omega_2*sigma/(omega_4+1)*x_star + r;
mc_star = varsigma/(omega_4+1)*x_star + omega_2*sigma/(omega_4+1)*x + r_star;

y_bar = varsigma*psi/delta*a - omega_2*sigma*psi/delta*a_star;
y_bar_star = varsigma*psi/delta*a_star - omega_2*sigma*psi/delta*a;

y = x + y_bar;
y_star = x_star + y_bar_star;

p = pi + p(-1);
p_star = pi_star+ p_star(-1);
s = sigma/(omega_4+1)*y - sigma/(omega_4+1)*y_star;

q = (1-2*alpha)*s;
e = q - p_star + p;

a = rho*a(-1) + xi;
a_star = rho_star*a_star(-1) + xi_star;

end;

initval;
x = 0;
pi_H = 0;
r = 0;
pi = 0;
x_star = 0;
pi_F_star = 0;
r_star = 0;
pi_star = 0;
xi = 0;
xi_star = 0;
end;

steady;
check;

shocks;

var xi_star;
stderr 1;
//var xi;
//stderr 1;
//var m_star;
//stderr 1;
end;


//stoch_simul(irf=40, nograph) p_star e s q;