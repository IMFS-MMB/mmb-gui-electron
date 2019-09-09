//**************************************************************************
// A New Comparative Approach to Macroeconomic Modeling and Policy Analysis
//
// Volker Wieland, Tobias Cwik, Gernot J. Mueller, Sebastian Schmidt and 
// Maik Wolters
//
// Working Paper, 2009
//**************************************************************************

// Model: US_HL16

// Further references:
// Hollander, H. and G. Liu: "The equity price channel in a New-Keynesian DSGE model
// with financial frictions and banking"
// In: Economic Modelling (2016)

// Original code provided by Hylton Hollander 
//Implemented in the MMB by Nora Lamersdorf. Last edited: 2019/03/04 


var c_b i_d pi i_h psi_b q_psi div lambda l_h w nu_h h_s h_b
    d c_s psi_s
    x
    y k_e h l_e q_k i_e nu_e lambda_e v 
    k_B pi_B i_l l k_BL 
    c  
    xi_z xi_d varepsilon_e varepsilon_h  xi_psi xi_p 
    pi_obs q_psi_obs   y_obs  l_h_obs l_e_obs d_obs i_d_obs i_h_obs i_e_obs

% flexprice counterparts
    c_bf i_df i_hf psi_bf q_psif divf lambdaf l_hf wf nu_hf h_sf h_bf
    df c_sf psi_sf
    xf
    yf k_ef hf l_ef q_kf i_ef nu_ef lambda_ef vf 
    k_Bf pi_Bf i_lf lf k_BLf 
    cf  
    xi_zf xi_df varepsilon_ef varepsilon_hf  xi_psif xi_pf 
    pi_obsf q_psi_obsf  y_obsf  l_h_obsf l_e_obsf d_obsf i_d_obsf i_h_obsf i_e_obsf

//**************************************************************************
// Modelbase Variables                                                   //*
     interest inflation inflationq outputgap output;                    //*
//**************************************************************************  

varexo epsilon_p epsilon_z  epsilon_d epsilon_h epsilon_e epsilon_nu_h epsilon_nu_e epsilon_psi 
        % epsilon_i
//**************************************************************************
// Modelbase Shocks                                                      //*       
    interest_ ;                                                         //*
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

beta_b phi R_d R_h R_psi Nu_h phi_w eta gamma gamma_b
           beta_s
           theta_R theta_Rf varepsilon_p gamma_p
           alpha Nu_e phi_k R_e beta_e delta_e
           kappa_v
           phi_s 
           delta_B kappa_k tau kappa_e varepsilon_ess beta_B kappa_h varepsilon_hss L_hL L_eL phi_psi phi_B phi_div
           kappa_i kappa_pi kappa_y  
           CY K_BY LY PsiY  
           rho_z rho_d rho_i rho_e rho_h rho_nuh rho_nue rho_psi rho_p 
           i_h_ss i_e_ss i_d_ss pi_ss; 

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
std_r_=1;
                                                                         //*
// Definition of Discretionary Fiscal Policy Parameter                   //*
//coffispol = 1;                                                        //*   
//**************************************************************************

//Calibrated Parameters

//households

beta_b = 0.96;     // 0.95 0.96 discount factor for borrower must be less than (1/R_h)
phi = 0.5;         // habit formation
R_d = 1.01;     // 1.01187 gross real return to deposit
R_h = 1.033;     // 1.03343 gross return to HH loans #Lambda = 1/R_h - beta_b must be bigger than zero in steady state. Therefore R_h corresponds to beta_b
R_psi = 1.035;  // 1.026 // from shiller dividend yield data monthly 1982:01 - 2015:04
Nu_h = 0.75;        // loan-to-value for HH
phi_w = 0.5;       // weight on wage income in borrowing constraint
eta = 1;           // inverse labour elasticity
gamma_b = 2;      // borrower RRA

beta_s = 0.99;    // 0.988 related to steady state equity return discount factor for savers = 1/R_d = opportunity cost for holding funds for savers
gamma = 2;        // constant relative risk aversion coefficient

//entrepreneurs

beta_e = 0.95;     // 0.95 0.96 entrepreneurs discount factor must be less than 1/R_e
R_e = 1.039;      // 1.039375 // 1.0247 gross return to Entrepreneurs loans see R_h above
Nu_e = 0.65;       // loan-to-value ratio for entrepreneurs
phi_k = 0.5;       // weight on the value of capital in borrowing constraint
alpha = 0.33;      // 0.25 share of capital in firm production
delta_e = 0.025;    // depreciation rate of capital
varepsilon_p = 11;   // 7.667 11 // 21 (Iacoviello 2005) or 6 (Christiano et al 2010 for intermediate goods) price elasticity of demand(substitution) across differentiated retail goods
kappa_v = 2;         // physical capital adjustment cost

//Retailers and unions

theta_R = 0.65;     // probability of retail prices remaining unchanged in NKPC, theta_R = 0 for fully flexible prices
theta_Rf = 0.0001;
gamma_p = 0.25;     // degree of price indexation

phi_s = 0.53;       // weight on (or share of) saver households in unions/economy

//banking sector

beta_B = 0.99;            // 0.988 banking discount factor is equal to the patient HHs' discount factor in Gerali et al. 2010
delta_B = 0.4;         // Gerali 0.1049 USmodel 0.1044 Cost for managing the banks capital position
kappa_k = 4;              // parameter governing adjustment costs in banking
kappa_e = 8;            // parameter governing firm loan rate adjustment costs
kappa_h = 8;            // parameter governing HH loan rate adjustment costs
tau = 0.11;               // target capital-to-loans ratio or capital requirement (leverage ratio) this is inconsistent with the data setup!! should be 0.5-0.7
varepsilon_ess = 1.341;   // USdata 3.9375 steady state markup, varepsilon_ess/(varepsilon_ess - 1) is the markup on the loan rate to entrepreneurs
varepsilon_hss = 1.427;   // USdata 3.342955 steady state markup, varepsilon_hss/(varepsilon_hss - 1) is the markup on the loan rate to HHs
L_hL = 0.45;              // 0.46 HH loans to total loans ratio
L_eL = 0.55;              // 0.54 Entrepreneurial loans to total loans ratio
phi_psi = 0.25;           // share of bank retained earnings paid out as dividends to households
phi_B = 0.5;             // pass through of equity price PCH in bank cap accum eqn
phi_div = 0.85;

//monetary policy and aggregates

kappa_i = 0.65;          // Taylor rule coefficient on i
kappa_pi = 1.5;            // Taylor rule coefficient on pi
kappa_y = 0.25;          // Taylor rule coefficient on y

CY = 0.653;             // 0.6734 0.7 parameter ratios in aggregate resource eqn
K_BY = 0.165;            // 0.1804 0.165  // 0.115 gives 0.07 K_B/L
LY = 1.5;                // 0.9 1.5 actual 1.52
PsiY = 0.81625;              // 0.7672 0.8 0.9 total equity to output ratio

//shock parameters

rho_z = 0.75;             // AR(1) parameter for productivity shock
rho_d = 0.5;             // AR(1) parameter for deposit shock
rho_i = 0.5;             // AR(1) parameter for MP shock
rho_e = 0.5;             // AR(1) parameter for entrep shock
rho_h = 0.5;             // AR(1) parameter for HH interest elasticity  shock
rho_nuh = 0.75;         //AR(1) parameter for LTV shock
rho_nue = 0.75;         //AR(1) parameter for LTV shock
rho_psi = 0.75;          //AR(1) parameter for Equity shock
rho_p = 0.5;            //AR(1) parameter for Cost-push shock

pi_ss = 0.005887;           // inflation steady-state
i_h_ss = 0.078998;         // steady state interest rate level
i_e_ss = 0.08487;
i_d_ss = 0.04558;         // fed funds i_ss replaces i_d_ss 0.0596 in this setup


% *****************************************************************
% LOADING MEDIAN OF POSTERIOR
% *****************************************************************

load median_param_BEP.mat;
coeffs = median_param;

gamma	=	coeffs(1);
gamma_b	=	coeffs(2);
phi	=	coeffs(3);
theta_R	=	coeffs(4);
gamma_p	=	coeffs(5);
phi_w	=	coeffs(6);
Nu_h	=	coeffs(7);
phi_k	=	coeffs(8);
Nu_e	=	coeffs(9);
phi_B	=	coeffs(10);
kappa_k	=	coeffs(11);
kappa_e	=	coeffs(12);
kappa_h	=	coeffs(13);
kappa_i	=	coeffs(14);
kappa_pi	=	coeffs(15);
kappa_y	=	coeffs(16);
rho_z	=	coeffs(17);
rho_d	=	coeffs(18);
rho_i	=	coeffs(19);
rho_e	=	coeffs(20);
rho_h	=	coeffs(21);
rho_nuh	=	coeffs(22);
rho_nue	=	coeffs(23);
rho_psi	=	coeffs(24);
rho_p	=	coeffs(25);


load median_std_BEP.mat;
coeffs_std = median_std;

std_z	=	coeffs_std(1);
std_i	=	coeffs_std(2);
std_d	=	coeffs_std(3);
std_e	=	coeffs_std(4);
std_h	=	coeffs_std(5);
stde_nu_h	=	coeffs_std(6);
std_nu_e	=	coeffs_std(7);
std_psi	=	coeffs_std(8);
std_p	=	coeffs_std(9);


model(linear);

//**************************************************************************
// Definition of Modelbase Variables in Terms of Original Model Variables//*

interest   = i_d*4;                                                        //*        
inflation = pi+pi(-1)+pi(-2)+pi(-3);                                     //*        
inflationq  = pi*4;                                                      //*        
outputgap  = y-yf;                                                       //*        
output = y;                                                              //*       
// fispol = g_;                                                          //*    
//**************************************************************************


//**************************************************************************                                                                    
// Policy Rule                                                           //*
                                                                         //*
// Monetary Policy  
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
           + std_r_*interest_;                                          //* 
    
                              //*
                                                                         //*
// Discretionary Government Spending                                     //*
                                                                         //*
//fispol = coffispol*fiscal_;                                              //*  
//**************************************************************************


#gamma_psib = PsiY/CY;   // 1.225  calculated from PsiY and CY
#Gamma_w = ((1/R_h) - beta_b)*Nu_h*phi_w;                                    // 

#gamma_ds = 0.789;     // 0.789 calibrated
#gamma_psis = PsiY/CY;  //   calculated from PsiY and CY

#Upsilon_k = ((1/R_e) - beta_e)*Nu_e*phi_k;            // parameter in FOC K_e

#X = varepsilon_p/(varepsilon_p - 1);                             //steady state markup
#beta_R = beta_s;                                            // discount factor for retailers

#HY = (1-alpha)/X;
#K_eY = (alpha/X)*(1/(1 - beta_e*(1 - delta_e) - Upsilon_k)); //  model steady state approx. 5

#Div_eY = (alpha)/X - (R_e - 1)*L_eL*LY - delta_e*K_eY;    // entrep flow of funds   approx. 0.0456
#DL = 1 - tau;                                             // bank deposit to loan ratio 0.89
#Pi_BL = (R_h - 1)*L_hL + (R_e - 1)*L_eL - (R_d - 1)*DL;   // bank profit to loans ratio approx. 0.0272
#DivY = Div_eY + phi_psi*Pi_BL*LY;                         // total HH dividends to output share approx. 0.066
#PsiBKB = 1 - delta_B;


//EQUATIONS

//BORROWERS
     
psi_b = beta_b*(gamma_psib/(1 - phi))*(q_psi(+1) + (R_psi - 1)*div(+1) - (R_psi)*(gamma_b/(1 - phi))*(c_b(+1) - phi*c_b)) + (gamma_psib/(1 - phi))*((gamma_b/(1 - phi))*(c_b - phi*c_b(-1)) - q_psi) 
        + (gamma_psib/(1 - phi))*Nu_h*(1-phi_w)*((1/R_h) - beta_b)*(R_psi*(lambda + nu_h + pi(+1)) + q_psi(+1) + (R_psi - 1)*div(+1));      //   

l_h = (phi_w/R_h)*(w(+1) + h_b) + ((1 - phi_w)/(R_h*R_psi))*(q_psi(+1) + (R_psi - 1)*div(+1) + R_psi*psi_b) - i_h + (1/R_h)*pi(+1) + (1/R_h)*nu_h;                    

((1/R_h) - beta_b)*lambda = beta_b*((gamma_b/(1 - phi))*(c_b(+1) - phi*c_b) + pi(+1)) - (1/R_h)*((gamma_b/(1 - phi))*(c_b - phi*c_b(-1)) + i_h);                                                   

w = (gamma_b/(1 - phi))*(c_b - phi*c_b(-1)) + (1 + Gamma_w)*eta*h_b - Gamma_w*(lambda + nu_h + w(+1) + pi(+1));      // FOC H with w see p. 20 dynare manual

 
//SAVERS

d = (gamma_ds/(1 - phi))*(gamma/(1 - phi))*(c_s - phi*c_s(-1)) - (beta_s*R_d*(gamma_ds/(1 - phi)))*((gamma/(1 - phi))*(c_s(+1) - phi*c_s) - i_d + pi(+1)); // FOC for D_s

psi_s = beta_s*(gamma_psis/(1 - phi))*(q_psi(+1) + (R_psi - 1)*div(+1) - (R_psi)*(gamma/(1 - phi))*(c_s(+1) - phi*c_s)) + (gamma_psis/(1 - phi))*((gamma/(1 - phi))*(c_s - phi*c_s(-1)) - q_psi); //  

w = eta*h_s + (gamma/(1 - phi))*(c_s - phi*c_s(-1)); // 

   //Saver household flow of funds constraint
c_s + gamma_ds*(d) + gamma_psis*(q_psi + psi_s) = ((1-alpha)/X)*(1/(CY))*(w + h_s) + R_d*gamma_ds*(i_d(-1) + d(-1) - pi) + gamma_psis*(q_psi + psi_s(-1)) + (R_psi - 1)*gamma_psis*(div + psi_s(-1));


//RETAILERS

pi = (beta_R/(1 + beta_R*gamma_p))*pi(+1) + (gamma_p/(1 + beta_R*gamma_p))*pi(-1) - (1/(1 + beta_R*gamma_p))*(((1 - theta_R)*(1 - theta_R*beta_R))/theta_R)*x + xi_p; //with indexation

// ENTREPRENEURS

h = y - x - w;                                             // FOC H
((1/R_e) - beta_e)*lambda_e = beta_e*(pi(+1)) - (1/R_e)*(i_e); // FOC L_e
  
(v - k_e(-1)) = (beta_e)*(v(+1) - k_e) + (1/kappa_v)*(1 - beta_e*(1 - delta_e) - Upsilon_k)*(y(+1) - x(+1) - k_e) + (1/kappa_v)*(Upsilon_k)*(lambda_e + nu_e + q_k(+1)); // FOC K_e determines the investment schedule

q_k = kappa_v*(v - k_e(-1));   // Shadow price of capital

l_e = (phi_k/R_e)*(q_k(+1) + k_e) + ((1 - phi_k)/R_e)*(q_psi(+1)) - i_e + (1/R_e)*pi(+1) + (1/R_e)*nu_e; // Borrowing constraint

y = alpha*k_e(-1) + (1 - alpha)*h + xi_z;        // production function
k_e = (1 - delta_e)*k_e(-1) + delta_e*v;       // Capital accumulation equation

//Banking Sector
 //Wholesale branch

k_B = (1 - delta_B)*k_B(-1) + delta_B*pi_B(-1) + (phi_B*PsiBKB)*(q_psi - q_psi(-1)) - (1 - phi_B*PsiBKB)*pi; //

i_l = i_d - ((1/(R_d - 1))*kappa_k*((tau)^3))*(k_B - l);  //  - xi_t  spread between the wholesale loan and wholesale deposit rate

 //Retail: loan branch
i_e = (kappa_e/(varepsilon_ess - 1 + kappa_e + kappa_e*beta_B))*i_e(-1) + (beta_B*kappa_e/(varepsilon_ess - 1 + kappa_e + kappa_e*beta_B))*i_e(+1)
      + ((varepsilon_ess - 1)/(varepsilon_ess - 1 + kappa_e + kappa_e*beta_B))*i_l 
      - (varepsilon_e/(varepsilon_ess - 1 + kappa_e + kappa_e*beta_B));              // loan rate setting charged to entrepreneurs; the simplified case where varepsilon is a constant, drop last term. 

i_h = (kappa_h/(varepsilon_hss - 1 + kappa_h + kappa_h*beta_B))*i_h(-1) + (beta_B*kappa_h/(varepsilon_hss - 1 + kappa_h + kappa_h*beta_B))*i_h(+1)
      + ((varepsilon_hss - 1)/(varepsilon_hss - 1 + kappa_h + kappa_h*beta_B))*i_l 
      - (varepsilon_h/(varepsilon_hss - 1 + kappa_h + kappa_h*beta_B));              // loan rate setting charged to HHs; the simplified case where varepsilon is a constant, drop last term.

//Retained earnings net dividend payments
Pi_BL*pi_B = (R_h - 1)*L_hL*(i_h + l_h) + (R_e - 1)*L_eL*(i_e + l_e) - (R_d - 1)*DL*(i_d + d);  //

//MONETARY POLICY

% i_d = kappa_i*i_d(-1) + kappa_pi*(1 - kappa_i)*pi + kappa_y*(1 - kappa_i)*(y - y(-1)) + xi_i; // conventional nominal interest rate (Taylor-type) rule

//MARKET CLEARING - aggregate resource constraints

y = phi_s*CY*c_s + (1-phi_s)*CY*c_b + delta_e*K_eY*v + delta_B*K_BY*k_B(-1) - (delta_B*K_BY)*pi;

c = phi_s*c_s + (1 - phi_s)*c_b;                                      // aggregate consumption
h = phi_s*h_s + (1 - phi_s)*h_b;
q_psi = (1 - phi_s)*((gamma_b/(1 - phi))*(c_b - phi*c_b(-1)) + beta_b*(q_psi(+1) + (R_psi - 1)*div(+1) - R_psi*(gamma_b/(1 - phi))*(c_b(+1) - phi*c_b)) + Nu_h*(1-phi_w)*((1/R_h) - beta_b)*(R_psi*(lambda + nu_h + pi(+1)) + q_psi(+1) + (R_psi - 1)*div(+1)))
      + phi_s*((gamma/(1 - phi))*(c_s - phi*c_s(-1)) + beta_s*(q_psi(+1) + (R_psi - 1)*div(+1) - R_psi*(gamma/(1 - phi))*(c_s(+1) - phi*c_s))) - xi_psi;

div = (phi_div)*(R_psi - 1)*q_psi + (1 - phi_div)*pi_B;

l = L_hL*l_h + L_eL*l_e;                                              // aggregate loans

l = tau*k_B + DL*(d  - xi_d);  //  - xi_d bank balance sheet identity Gerali et al 2010 

//Shocks
xi_z = rho_z*xi_z(-1) + epsilon_z;                      // productivity shock
xi_d = rho_d*xi_d(-1) + epsilon_d;                      // deposit shock
% xi_i = rho_i*xi_i(-1) + epsilon_i;                      // MP shock
varepsilon_e = rho_e*varepsilon_e(-1) + epsilon_e;      // interest elasticity shocks
varepsilon_h = rho_h*varepsilon_h(-1) + epsilon_h;      //
nu_h = rho_nuh*nu_h(-1) + epsilon_nu_h;
nu_e = rho_nue*nu_e(-1) + epsilon_nu_e;                 // LTV shocks
xi_psi = rho_psi*xi_psi(-1) + epsilon_psi;              // Equity price shock

xi_p = rho_p*xi_p(-1) + epsilon_p;              // Cost-push shock

k_BL = k_B - l;   // bank capital-asset ratio

pi_obs = pi + pi_ss;
q_psi_obs = q_psi - q_psi(-1) + 0.01537;
y_obs = y - y(-1) + 0.0039;
l_h_obs = l_h - l_h(-1) + 0.007885;
l_e_obs = l_e - l_e(-1) + 0.006;
d_obs = d - d(-1) + 0.0046;
i_h_obs = i_h + i_h_ss;
i_e_obs = i_e + i_e_ss;
i_d_obs = i_d + i_d_ss;


// FLEXPRICE ECONOMY

//BORROWERS
     
psi_bf = beta_b*(gamma_psib/(1 - phi))*(q_psif(+1) + (R_psi - 1)*divf(+1) - (R_psi)*(gamma_b/(1 - phi))*(c_bf(+1) - phi*c_bf)) + (gamma_psib/(1 - phi))*((gamma_b/(1 - phi))*(c_bf - phi*c_bf(-1)) - q_psif) 
        + (gamma_psib/(1 - phi))*Nu_h*(1-phi_w)*((1/R_h) - beta_b)*(R_psi*(lambdaf + nu_hf ) + q_psif(+1) + (R_psi - 1)*divf(+1));      //   

l_hf = (phi_w/R_h)*(wf(+1) + h_bf) + ((1 - phi_w)/(R_h*R_psi))*(q_psif(+1) + (R_psi - 1)*divf(+1) + R_psi*psi_bf) - i_hf  + (1/R_h)*nu_hf;                    

((1/R_h) - beta_b)*lambdaf = beta_b*((gamma_b/(1 - phi))*(c_bf(+1) - phi*c_bf) ) - (1/R_h)*((gamma_b/(1 - phi))*(c_bf - phi*c_bf(-1)) + i_hf);                                                   

wf = (gamma_b/(1 - phi))*(c_bf - phi*c_bf(-1)) + (1 + Gamma_w)*eta*h_bf - Gamma_w*(lambdaf + nu_hf + wf(+1) );      // FOC H with w see p. 20 dynare manual

 
//SAVERS

df = (gamma_ds/(1 - phi))*(gamma/(1 - phi))*(c_sf - phi*c_sf(-1)) - (beta_s*R_d*(gamma_ds/(1 - phi)))*((gamma/(1 - phi))*(c_sf(+1) - phi*c_sf) - i_df ); // FOC for D_s

psi_sf = beta_s*(gamma_psis/(1 - phi))*(q_psif(+1) + (R_psi - 1)*divf(+1) - (R_psi)*(gamma/(1 - phi))*(c_sf(+1) - phi*c_sf)) + (gamma_psis/(1 - phi))*((gamma/(1 - phi))*(c_sf - phi*c_sf(-1)) - q_psif); //  

wf = eta*h_sf + (gamma/(1 - phi))*(c_sf - phi*c_sf(-1)); // 

   //Saver household flow of funds constraint
c_sf + gamma_ds*(df) + gamma_psis*(q_psif + psi_sf) = ((1-alpha)/X)*(1/(CY))*(wf + h_sf) + R_d*gamma_ds*(i_df(-1) + df(-1) ) + gamma_psis*(q_psif + psi_sf(-1)) + (R_psi - 1)*gamma_psis*(divf + psi_sf(-1));


//RETAILERS

0 = (beta_R/(1 + beta_R*gamma_p))*0 + (gamma_p/(1 + beta_R*gamma_p))*0 - (1/(1 + beta_R*gamma_p))*(((1 - theta_Rf)*(1 - theta_R*beta_R))/theta_Rf)*xf + xi_pf; //with indexation

// ENTREPRENEURS

hf = yf - xf - wf;                                             // FOC H
((1/R_e) - beta_e)*lambda_ef = beta_e*0 - (1/R_e)*(i_ef); // FOC L_e
  
(vf - k_ef(-1)) = (beta_e)*(vf(+1) - k_ef) + (1/kappa_v)*(1 - beta_e*(1 - delta_e) - Upsilon_k)*(yf(+1) - xf(+1) - k_ef) + (1/kappa_v)*(Upsilon_k)*(lambda_ef + nu_ef + q_kf(+1)); // FOC K_e determines the investment schedule

q_kf = kappa_v*(vf - k_ef(-1));   // Shadow price of capital

l_ef = (phi_k/R_e)*(q_kf(+1) + k_ef) + ((1 - phi_k)/R_e)*(q_psif(+1)) - i_ef + (1/R_e)*0 + (1/R_e)*nu_ef; // Borrowing constraint

yf = alpha*k_ef(-1) + (1 - alpha)*hf + xi_zf;        // production function
k_ef = (1 - delta_e)*k_ef(-1) + delta_e*vf;       // Capital accumulation equation

//Banking Sector
 //Wholesale branch

k_Bf = (1 - delta_B)*k_Bf(-1) + delta_B*pi_Bf(-1) + (phi_B*PsiBKB)*(q_psif - q_psif(-1)) - (1 - phi_B*PsiBKB)*0; //

i_lf = i_df - ((1/(R_d - 1))*kappa_k*((tau)^3))*(k_Bf - lf);  //  - xi_t  spread between the wholesale loan and wholesale deposit rate

 //Retail: loan branch
i_ef = (kappa_e/(varepsilon_ess - 1 + kappa_e + kappa_e*beta_B))*i_ef(-1) + (beta_B*kappa_e/(varepsilon_ess - 1 + kappa_e + kappa_e*beta_B))*i_ef(+1)
      + ((varepsilon_ess - 1)/(varepsilon_ess - 1 + kappa_e + kappa_e*beta_B))*i_lf 
      - (varepsilon_ef/(varepsilon_ess - 1 + kappa_e + kappa_e*beta_B));              // loan rate setting charged to entrepreneurs; the simplified case where varepsilon is a constant, drop last term. 

i_hf = (kappa_h/(varepsilon_hss - 1 + kappa_h + kappa_h*beta_B))*i_hf(-1) + (beta_B*kappa_h/(varepsilon_hss - 1 + kappa_h + kappa_h*beta_B))*i_hf(+1)
      + ((varepsilon_hss - 1)/(varepsilon_hss - 1 + kappa_h + kappa_h*beta_B))*i_lf
      - (varepsilon_hf/(varepsilon_hss - 1 + kappa_h + kappa_h*beta_B));              // loan rate setting charged to HHs; the simplified case where varepsilon is a constant, drop last term.

//Retained earnings net dividend payments
Pi_BL*pi_Bf = (R_h - 1)*L_hL*(i_hf + l_hf) + (R_e - 1)*L_eL*(i_ef + l_ef) - (R_d - 1)*DL*(i_df + df);  //

//MONETARY POLICY

% i_df = kappa_i*i_df(-1) + kappa_pi*(1 - kappa_i)*0 + kappa_y*(1 - kappa_i)*(yf - yf(-1)) + xi_if; // conventional nominal interest rate (Taylor-type) rule

//MARKET CLEARING - aggregate resource constraints

yf = phi_s*CY*c_sf + (1-phi_s)*CY*c_bf + delta_e*K_eY*vf + delta_B*K_BY*k_Bf(-1) - (delta_B*K_BY)*0;

cf = phi_s*c_sf + (1 - phi_s)*c_bf;                                      // aggregate consumption
hf = phi_s*h_sf + (1 - phi_s)*h_bf;
q_psif = (1 - phi_s)*((gamma_b/(1 - phi))*(c_bf - phi*c_bf(-1)) + beta_b*(q_psif(+1) + (R_psi - 1)*divf(+1) - R_psi*(gamma_b/(1 - phi))*(c_bf(+1) - phi*c_bf)) + Nu_h*(1-phi_w)*((1/R_h) - beta_b)*(R_psi*(lambdaf + nu_hf ) + q_psif(+1) + (R_psi - 1)*divf(+1)))
      + phi_s*((gamma/(1 - phi))*(c_sf - phi*c_sf(-1)) + beta_s*(q_psif(+1) + (R_psi - 1)*divf(+1) - R_psi*(gamma/(1 - phi))*(c_sf(+1) - phi*c_sf))) - xi_psif;

divf = (phi_div)*(R_psi - 1)*q_psif + (1 - phi_div)*pi_Bf;

lf = L_hL*l_hf + L_eL*l_ef;                                              // aggregate loans

lf = tau*k_Bf + DL*(df  - xi_df);  //  - xi_d bank balance sheet identity Gerali et al 2010 

//Shocks
xi_zf = rho_z*xi_zf(-1) + epsilon_z;                      // productivity shock
xi_df = rho_d*xi_df(-1) + epsilon_d;                      // deposit shock
% xi_if = rho_i*xi_if(-1) + epsilon_i;                      // MP shock
varepsilon_ef = rho_e*varepsilon_ef(-1) + epsilon_e;      // interest elasticity shocks
varepsilon_hf = rho_h*varepsilon_hf(-1) + epsilon_h;      //
nu_hf = rho_nuh*nu_hf(-1) + epsilon_nu_h;
nu_ef = rho_nue*nu_ef(-1) + epsilon_nu_e;                 // LTV shocks
xi_psif = rho_psi*xi_psif(-1) + epsilon_psi;              // Equity price shock

xi_pf = rho_p*xi_pf(-1) + epsilon_p;              // Cost-push shock

k_BLf = k_Bf - lf;   // bank capital-asset ratio

pi_obsf = 0 + pi_ss;
q_psi_obsf = q_psif - q_psif(-1) + 0.01537;
y_obsf = yf - yf(-1) + 0.0039;
l_h_obsf = l_hf - l_hf(-1) + 0.007885;
l_e_obsf = l_ef - l_ef(-1) + 0.006;
d_obsf = df - df(-1) + 0.0046;
i_h_obsf = i_hf + i_h_ss;
i_e_obsf = i_ef + i_e_ss;
i_d_obsf = i_df + i_d_ss;

end;

steady;
check;

shocks;
var epsilon_z =   std_z^2;
%var epsilon_i    = std_i^2;
var epsilon_d    = std_d^2;
var epsilon_e    = std_e^2;
var epsilon_h    = std_h^2;
var epsilon_nu_h    = stde_nu_h^2;
var epsilon_nu_e    = std_nu_e^2;
var epsilon_psi    = std_psi^2;
var epsilon_p    = std_p^2;
end;


%stoch_simul(order=1, irf=15 , nograph;
%stoch_simul(order=1, irf=15 , irf_shocks=(epsilon_z, epsilon_i)) y i_d q_psi pi;

