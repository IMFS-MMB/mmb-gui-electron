var 

// Model Variables
A G e_g
C Inv S_Inv dS_Inv H Y tau K N Ng LY QK GDP
R Q pI RK rK rr ERQ w infl_w X1w X2w mc infl X1p X2p Delta_p CY Spr phi

// Flexible price variables
C_f Inv_f S_Inv_f dS_Inv_f H_f Y_f tau_f K_f N_f Ng_f LY_f QK_f GDP_f
R_f R0_f Q_f pI_f RK_f rK_f ERQ_f w_f mc_f CY_f Spr_f phi_f


//**************************************************************************
// Modelbase Variables                                                   //*
        interest inflation inflationq outputgap output                   //*
        fispol                                                           //*   
        ;                                                                //*
//**************************************************************************

varexo              
e_a e_phi
//**************************************************************************
// Modelbase Shocks                                                      //*       
       interest_                                                         //*
       fiscal_                                                           //*   
       ;                                                                 //*
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
                                                                         //*
//**************************************************************************
 

% Structural parameters
rho_a rho_g G_Y
beta sigma nu kappa theta gamma Gamma delta s0 lambda_w lambda_p xi_w xi_p

% Policy rules parameters
psi_p psi_y rho_i psi_k psi_tau rho_phi

% Steady state values
Y_ss C_ss I_ss K_ss H_ss R_ss Q_ss RK_ss rK_ss w_ss tau_ss LY_ss A_ss phi_ss
Y_f_ss CY_ss;

beta=0.99347;
sigma=1;
nu=1;
theta=0.79246;
kappa=0.009486;
delta=0.024291;
gamma=0.34002;
s0=0.75;
xi_p=0.75;
xi_w=0.75;
lambda_p=0.1;
lambda_w=0.1;
psi_p=1.5;
psi_y=0.125;
rho_i=0;
psi_tau=0.1;

R_ss=1.0055;
A_ss=1;
phi_ss=0.3092;
LY_ss=1.6;
Y_ss=2.6779;
K_ss=29.2064;
H_ss=0.90345;
I_ss=0.70945;
C_ss=1.9685;
Q_ss=1.0223;
RK_ss=0.031176;
rK_ss=0.031176;
CY_ss=0.0011116;
w_ss=1.9563;
tau_ss=0.023387;
KY_ratio=10.9064;
KH_ratio=32.3277;
IY_ratio=0.26493;
CY_ratio=0.73507;
Gamma=0.26779;

psi_k=-4.8064;
rho_phi=0.9525;
rho_g = 0.97;
rho_a = 0.95;
G_Y = 0.21;

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
                                                                         //*
//**************************************************************************

model;

//**************************************************************************
// Definition of Modelbase Variables in Terms of Original Model Variables //*

interest   = 4*log(R/steady_state(R));                                    //*
inflation  = log(infl)+log(infl(-1))+log(infl(-2))+log(infl(-3));         //*
inflationq = 4*log(infl/steady_state(infl));                              //*
outputgap  = log(Y/steady_state(Y)) - log(Y_f/steady_state(Y_f));         //*
output     = log(Y/steady_state(Y));                                      //*
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
// 1) Euler equation for bonds C
C^(-sigma) = beta * (C(+1)^(-sigma)) * rr * ( 1 + kappa * (Q(+1) - pI(+1)) / (pI(+1) - theta * Q(+1)) );

// 2) Euler equation for equity Q
C^(-sigma) = beta *  (C(+1)^(-sigma)) * ( (RK(+1) + (1 - delta) * Q(+1)) / Q ) *
(1 + kappa * (Q(+1) - pI(+1)) * (RK(+1) + phi(+1) * (1 - delta) * Q(+1)) / ( (pI(+1) - theta * Q(+1)) * (RK(+1) + (1 - delta) * Q(+1)) ) ) ;

// 3) Investment equation Inv
(pI - theta * Q) * Inv = kappa * ( (RK + phi * (1 - delta) * Q) * N(-1) + R(-1) * LY(-1) * Y(-1) / infl - tau ); 

// 4) Price of investment pI
pI = 1 + S_Inv + dS_Inv * (Inv / I_ss);
// + beta * ((C(+1) / C)^(-sigma)) * dS_Inv(+1) * (Inv(+1) / Inv)^2;

// 5) Investment adjustment cost function S_Inv
S_Inv = s0 * (Inv / I_ss - 1)^2 / 2;

// 6) First derivative of investment adjustment cost function dS_Inv
dS_Inv = s0 * (Inv / I_ss - 1);

// 7) Production function Y
Y * Delta_p = A * (K(-1)^gamma) * (H^(1-gamma)) - Gamma;

// 8) MPK
rK = gamma * mc * A * (H / K(-1))^(1-gamma);

// 9) MPL
w = (1 - gamma) * mc * A * (K(-1) / H)^gamma;

// 10) Rental rate RK
RK * K(-1) =  Y - w * H + (pI - (1 + S_Inv)) * Inv;

// 11) Market clearing condition for capital N
K = N + Ng;

// 12) Law of motion of capital K
K = (1 - delta) * K(-1) + Inv; 

// 13) Price Phillips curve infl
X1p = X2p * ( (1 - xi_p * infl^(1 / lambda_p)) / (1 - xi_p) )^(- lambda_p);

// 14) PDV of real marginal costs X1p
X1p = (1 + lambda_p) * (C^(-sigma)) * Y * mc + beta * xi_p * ( infl(+1)^((1 + lambda_p) / lambda_p) ) * X1p(+1);

// 15) PDV of real marginal revenues X2p
X2p = (C^(-sigma)) * Y + beta * xi_p * ( infl(+1)^(1 / lambda_p) ) * X2p(+1);

// 16) Wage Phillips curve infl_w
X1w = X2w * ( (1 - xi_w * infl_w^(1 / lambda_w)) / (1 - xi_w) )^(- (lambda_w + (1 + lambda_w) * nu));

// 17) PDV of marginal disutility of work X1w
X1w = (1 + lambda_w) * H^(1+nu) + beta * xi_w * ( infl_w(+1)^((1 + lambda_w) * (1 + nu) / lambda_w) ) * X1w(+1);

// 18) PDV of real wage X2w
X2w = (C^(-sigma)) * w * H + beta * xi_w * ( infl_w(+1)^(1 / lambda_w) ) * X2w(+1);

// 19) Relation between real wage and inflation rates
w * infl = w(-1) * infl_w;

// 20) Price dispersion Delta_p
Delta_p = xi_p * Delta_p(-1) * infl^((1 + lambda_p) / lambda_p) + (1 - xi_p) * ( (1 - xi_p * infl^(1 / lambda_p)) / (1 - xi_p) )^(1 + lambda_p);

// 21) Taylor rule R
// R = (R_ss^(1-rho_i)) * (R(-1)^rho_i) * (infl^psi_p) * ((Y/Y_ss)^psi_y);

// 22) Liquidity intervention Ng
Ng = psi_k * (phi - phi_ss);

// 23) Tax rule tau
tau = tau_ss + psi_tau * (R(-1) * LY(-1) * Y(-1) / infl - R_ss * LY_ss * Y_ss - Q * Ng(-1));

// 24) Government budget constraint LY
Q * Ng + R(-1) * LY(-1) * Y(-1) / infl = tau - G + (RK + (1 - delta) * Q) * Ng(-1) + LY * Y;

// 25) Resource constraint rK
Y = C + (1 + S_Inv) * Inv + G; 

// 26) Real rate
rr = R / infl(+1);

// 27) Expected return on illiquid asset
ERQ = (RK(+1) + (1 - delta) * Q(+1)) / Q;
 
// 28) Spread equity-bonds
Spr = ERQ - rr;
 
// 29) Convenience yield
CY = kappa * (Q(+1) - pI(+1)) / (pI(+1) - theta * Q(+1));

// 30) Value of capital
QK = Q * K(-1);

// 31) GDP
GDP = C + pI * Inv;

// 32) Borrowing constraint shock phi
phi = (1 - rho_phi) * phi_ss + rho_phi * phi(-1) + e_phi;

A = (1-rho_a)*A_ss + rho_a * A(-1) + e_a;

G = (1-rho_g)*(G_Y*steady_state(Y)) + rho_g * G(-1) + e_g;

// Flexible price model
// 1) Euler equation for bonds C_f
C_f^(-sigma) = beta * (C_f(+1)^(-sigma)) * R_f * ( 1 + kappa * (Q_f(+1) - pI_f(+1)) / (pI_f(+1) - theta * Q_f(+1)) );

// 2) Euler equation for equity Q_f
C_f^(-sigma) = beta * (C_f(+1)^(-sigma)) * ( (RK_f(+1) + (1 - delta) * Q_f(+1)) / Q_f ) *
(1 + kappa * (Q_f(+1) - pI_f(+1)) * (RK_f(+1) + phi_f(+1) * (1 - delta) * Q_f(+1)) / ( (pI_f(+1) - theta * Q_f(+1)) * (RK_f(+1) + (1 - delta) * Q_f(+1)) ) ) ;

// 3) Investment equation Inv_f
(pI_f - theta * Q_f) * Inv_f = kappa * ( (RK_f + phi_f * (1 - delta) * Q_f) * N_f(-1) + R_f(-1) * LY_f(-1) * Y_f(-1) - tau_f ); 

// 4) Price of investment pI_f
pI_f = 1 + S_Inv_f + dS_Inv_f * (Inv_f / I_ss);
// + beta * ((C_f(+1) / C_f)^(-sigma)) * dS_Inv_f(+1) * (Inv_f(+1) / Inv_f)^2;

// 5) Investment adjustment cost function S_Inv_f
S_Inv_f = s0 * (Inv_f / I_ss - 1)^2 / 2;

// 6) First derivative of investment adjustment cost function dS_Inv_f
dS_Inv_f = s0 * (Inv_f / I_ss - 1);

// 7) Production function Y_f
Y_f = A * (K_f(-1)^gamma) * (H_f^(1-gamma)) - Gamma;

// 8) MPK
rK_f = gamma * mc_f * A * (H_f / K_f(-1))^(1-gamma);

// 9) MPL
w_f = (1 - gamma) * mc_f * A * (K_f(-1) / H_f)^gamma;

// 10) Rental rate RK_f
RK_f * K_f(-1) =  Y_f - w_f * H_f + (pI_f - (1 + S_Inv_f)) * Inv_f;

// 11) Market clearing condition for capital N_f
K_f = N_f + Ng_f;

// 12) Law of motion of capital K_f
K_f = (1 - delta) * K_f(-1) + Inv_f; 

// 13) Price mark-up
(1 + lambda_p) * mc_f = 1;

// 14) Wage mark-up
(1 + lambda_w) * H_f^nu = (C_f^(-sigma)) * w_f;

// 15) Liquidity intervention Ng_f
Ng_f = psi_k * (phi_f - phi_ss);

// 16) Tax rule tau_f
tau_f = tau_ss + psi_tau * (R_f(-1) * LY_f(-1) * Y_f(-1) - R_ss * LY_ss * Y_ss - Q_f * Ng_f(-1));

// 17) Government budget constraint LY_f
Q_f * Ng_f + R_f(-1) * LY_f(-1) * Y_f(-1) = tau_f - G + (RK_f + (1 - delta) * Q_f) * Ng_f(-1) + LY_f * Y_f;

// 18) Resource constraint rK
Y_f = C_f + (1 + S_Inv_f) * Inv_f + G; 

// 19) Expected return on illiquid asset
ERQ_f = (RK_f(+1) + (1 - delta) * Q_f(+1)) / Q_f;
 
// 20) Spread equity-bonds
Spr_f = ERQ_f - R_f;
 
// 21) Convenience yield
CY_f = kappa * (Q_f(+1) - pI_f(+1)) / (pI_f(+1) - theta * Q_f(+1));

// 22) Value of capital
QK_f = Q_f * K_f(-1);

// 23) GDP
GDP_f = C_f + pI_f * Inv_f;

// 24) Return on illiquid security
C_f^(-sigma) = beta * (C_f(+1)^(-sigma) * R0_f);

// 25) Borrowing constraint shock phi_f
phi_f = (1 - rho_phi) * phi_ss + rho_phi * phi_f(-1) + e_phi;

end;

//initval;
//	e_g = 0;
//	G = G_Y*Y_ss;
//	C = C_ss;
//	Inv = I_ss;
//	S_Inv = 0;
//	dS_Inv = 0;
//	H = H_ss;
//	Y = Y_ss; 
//	LY = LY_ss;
//	tau = tau_ss;
//	K = K_ss;
//	N = K_ss;
//	Ng = 0;
//	R = R_ss;
//	rr = R_ss;
//	ERQ = RK_ss / Q_ss + (1 - delta);
//	Spr = ERQ - rr;
//	Q = Q_ss;
//	pI = 1;
//	RK = RK_ss;
//	rK = rK_ss;
//	CY = CY_ss;
//	w = w_ss;
//	infl_w = 1;
//	X1w = (1 + lambda_w) * H_ss^(1+nu) / (1 - beta * xi_w);
//	X2w = (C_ss^(-sigma)) * w_ss * H_ss / (1 - beta * xi_w);
//	mc = 1 / (1 + lambda_p);
//	infl = 1;
//	X1p = (C_ss^(-sigma)) * Y_ss / (1 - beta * xi_p);
//	X2p = (C_ss^(-sigma)) * Y_ss / (1 - beta * xi_p);
//	Delta_p = 1;
//	phi = phi_ss;
	
	
//	C_f = C_ss;
//	Inv_f = I_ss;
//	S_Inv_f = 0;
//	dS_Inv_f = 0;
//	H_f = H_ss;
//	Y_f = Y_ss; 
//	LY_f = LY_ss;
//	tau_f = tau_ss;
//	K_f = K_ss;
//	N_f = K_ss;
//	Ng_f = 0;
//	R_f = R_ss;
//	R0_f = R_ss * (1 + CY_ss);
//	ERQ_f = RK_ss / Q_ss + (1 - delta);
//	Spr_f = ERQ_f - R_f;
//	Q_f = Q_ss;
//	pI_f = 1;
//	RK_f = RK_ss;
//	rK_f = rK_ss;
//	CY_f = CY_ss;
//	w_f = w_ss;
//	mc_f = 1 / (1 + lambda_p);
//	phi_f = phi_ss;
	
//	QK = Q_ss * K_ss;
//	QK_f = Q_ss * K_ss;
//	GDP = C_ss + I_ss;
//	GDP_f = C_ss + I_ss;


//end;

//steady(solve_algo=3);
steady;
//resid(1);
check;
