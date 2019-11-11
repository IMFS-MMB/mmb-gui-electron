//**************************************************************************
// A New Comparative Approach to Macroeconomic Modeling and Policy Analysis
//
// Volker Wieland, Tobias Cwik, Gernot J. Mueller, Sebastian Schmidt and 
// Maik Wolters
//
// Working Paper, 2009
//**************************************************************************

// Model: EA_V16

// Further references:
// "Stefania Villa, S. 2016."Financial frictions in the Euro Area and the United States: a Bayesian assessment"
// Macroeconomic Dynamics, 20(05), pp. 1313-1340.

// Last edited: 19/06/2019 by T. Spital


var y  c  i  w  l  pi r rn zk  u  k  q  rk   ext_pr   n             
    yf cf if wf lf    rf   zkf uf kf qf rkf  ext_prf  nf         
    a g eps_x  eps_p eps_w eps_k e_g  %eps_r

//**************************************************************************
// Modelbase Variables                                                   //*
        interest inflation inflationq outputgap output fispol;           //*
//**************************************************************************
 
varexo e_a e_x e_p e_w e_k %e_r

//**************************************************************************
// Modelbase Shocks                                                      //*       
       interest_ fiscal_;                                                //*
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
alpha beta delta  epsilon epsilon_w M G_Y kappa theta  N_K       
ksi h  sigma_w sigma_p sigma_wi sigma_pi zeta  Theta   
rho_pi rho_dy rho_y rho_r 
rho_a rho_k rho_g rho_x rho_ri rho_p rho_w 
phi  bas_point s_coef;


// calibrated parameters
alpha     = 0.330;    % Capital income share
beta      = 0.990;    % Discount factor
delta     = 0.025;    % Steady state depreciation rate
epsilon_w = 6.000;    % Elasticity across different types of labour, set to target M_w=1.20
epsilon   = 6.000;    % Elasticity of substitution in goods market, set to target M=1.20
M         = 1.200;    % the mark-up  
G_Y       = 0.200;    % G/Y
N_K       = 0.500;    % N/K, net worth-to-capital
theta     = 0.9715;   % Probability the firm survives next period

// estimated parameters initialisation
phi       = 1.34;     % Inverse Frisch elasticity of L supply
Theta     = 1.33;     % FCP: fixed costs in production (in Villa)
ksi       = 4.59;     % 2nd derivative of Inv adjustment cost
h         = 0.69;     % Habit parameter   
zeta      = 0.95;     % EDCU
sigma_w   = 0.77;     % Calvo wages, calvo parameter for unions
sigma_p   = 0.82;     % Calvo prices, calvo parameter for retail firms
sigma_wi  = 0.37;     % Indexation to past wage inflation
sigma_pi  = 0.15;     % indexation to past inflation
kappa     = 0.04;     % Elasticity of external finance 

rho_pi    = 1.8;    % Response to inflation in Taylor rule
rho_r     = 0.88;   % Interest rate smoothing in Taylor rule
rho_y     = 0.09;   % Response to output gap in Taylor rule
rho_dy    = 0.06;

rho_a     = 0.87;   % Persistency of technological shock
rho_k     = 0.99;
rho_g     = 0.92;
rho_x     = 0.97;   % Persistency of shock to K
rho_ri    = 0.25;
rho_p     = 0.81;
rho_w     = 0.59;
 

// derived from steady state
bas_point = 150;
s_coef    = (bas_point + 40000)/40000;

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
                                                                         
// Definition of Discretionary Fiscal Policy Parameter                   //*
coffispol = 1;                                                           //*
//**************************************************************************

model(linear); 

//**************************************************************************
// Definition of Modelbase Variables in Terms of Original Model Variables //*

interest   = rn*4;                                                        //*
inflation  = (1/4)*(4*pi + 4*pi(-1)+ 4*pi(-2)+ 4*pi(-3));                                                 	 //*
inflationq = 4*pi;                                                   	 //*
outputgap  = y-yf;                                                       //*
output     = y;                                                          //*
fispol     = e_g;                                                         //*
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
fispol = coffispol*fiscal_;                                              //*
//**************************************************************************

// Original Model Code:

#R     = 1/beta;
#ZK    = R - (1-delta);
#W     = (alpha^alpha*((1-alpha)^(1-alpha))/(M*((ZK)^alpha)))^(1/(1-alpha));
#K_L   = alpha*W/((1-alpha)*ZK);
#I_K   =  delta;
#Y_K   = (Theta*(K_L^(1-alpha)))^(-1);
#C_K   = Y_K - I_K - G_Y*Y_K;
#K_Y   = Y_K^(-1);
#I_Y   = I_K / Y_K;
#C_Y   = 1 - I_Y - G_Y;
#K_N   = 1/N_K;
#rn_ss=(R-1)*100;  
#RK    = s_coef*R; 


// flexible economy
alpha * zkf = a-(1-alpha)*wf ; 
uf      =  ((1-zeta)/zeta)* zkf  ; 
zkf     =  (wf)+lf-kf(-1)-uf ; 
if      = (1/(1+beta*1))* (if(-1) + beta*1*if(+1)+(1/(1^2*ksi))*(qf +eps_x))  ; 
rkf     = (ZK/RK)*zkf + (1-delta)/RK*(qf+eps_k)- qf(-1);  
ext_prf = kappa*(qf + kf - nf);  
rkf(+1) = ext_prf +rf;  
(1/(theta*RK))*nf = K_N*rkf - (K_N-1)*rf(-1) - kappa*(K_N - 1)*(kf(-1) + qf(-1)) + ((K_N - 1)*kappa+1)*nf(-1);  
cf      = (1/(1+h))* cf(+1) +(h/(1+h))*cf(-1) - ((1-h)/(1+h))*rf ;
yf      = C_Y*cf + I_Y*if + G_Y*g + ZK*K_Y*uf ;
yf      = Theta*(a + alpha*(kf(-1)+eps_k + uf) +(1-alpha)*lf);  
wf      = phi*lf	+ (1/(1-h))*cf - h/(1-h)*cf(-1) ;
kf      = (1-delta)*(kf(-1)+eps_k) + I_K*if + I_K*ksi*eps_x ; 


// sticky price - wage economy
c = (1/(1+h))*c(+1)+(h/(1+h))*c(-1)- ((1-h)/(1+h))*r ;
w =  (1/(1+beta))*(w(-1) + beta*w(+1) + sigma_wi* pi(-1)-(1+beta*sigma_wi)*pi + beta*pi(+1) 
  +  (((1-sigma_w)*(1-beta*sigma_w))/(sigma_w*(1+epsilon_w*phi)))
  *  (phi*l + (1/(1-h))*c - (h/(1-h))*c(-1) - w)) + eps_w ; 
k =  (1-delta)*(k(-1)+eps_k) + I_K*i + I_K*ksi*eps_x ; 
u =  ((1-zeta)/zeta)* zk; 
i = (1/(1+beta))* (i(-1) + beta*i(+1) + (1/ksi)*(q+eps_x)); 
y = C_Y*c + I_Y*i + G_Y*g + ZK*K_Y*u ; 
y = Theta*(a + alpha*(k(-1) + eps_k + u) + (1-alpha)*l);     
zk=  w + l - k(-1) - u ; 
pi=  (1/(1+beta*sigma_pi)) * (sigma_pi*pi(-1) + beta*pi(+1) -((1-sigma_p)
  *(1-beta*sigma_p)/sigma_p)*(a - alpha*zk-(1-alpha)*w)) + eps_p ; 
// rn= rho_r*rn(-1) +(1-rho_r)*(rho_pi*pi +rho_y *(y-yf))+rho_dy*(y-yf-(y(-1)-yf(-1)))+eps_r ;
rn= r + pi(+1);
rk = (ZK/RK)*zk + (1-delta)/RK*(q+eps_k)- q(-1); 
ext_pr= kappa*(q + k - n);  
rk(+1)= ext_pr +r;  
(1/(theta*RK))*n = K_N*rk - (K_N-1)*r(-1) - kappa*(K_N - 1)*(k(-1) + q(-1)) + ((K_N - 1)*kappa+1)*n(-1);  
 
a     = rho_a *     a(-1) - e_a;     % Technology shock
g     = rho_g *     g(-1) + e_g;     % Government shock (so it is in line with other models)
eps_x = rho_x * eps_x(-1) - e_x;     % Investment shock
//eps_r = rho_ri* eps_r(-1) + e_r;   % Montary shock
eps_p = rho_p * eps_p(-1) + e_p;     % Price mark-up shock
eps_w = rho_w * eps_w(-1) + e_w;     % Wage mark-up shock
eps_k = rho_k * eps_k(-1) - e_k;     % Capital quality shock

end; 

 
shocks;
var e_a; stderr  1.09;
var e_k; stderr  0.24;
var fiscal_; stderr  1.46;
var e_x; stderr  2.33;
//var e_r; stderr  0.11;
var e_p; stderr  0.07;
var e_w; stderr  0.12;
 
end;

//stoch_simul(irf=20, irf_shocks=(e_x)) y i pi n ext_pr  ;
