
// Model: HK_FP13

// Further references: Funke and Paetz (2013)
// Housing prices and the business cycle: An empirical application to Hong Kong
// In Journal of Housing Economics 22 (2013) 62-76

// Model replication coded by: Matthias Burgert, Matthias.BURGERT@ec.europa.eu
//                             Jinhyuk Yoo, yoo@safe.uni-frankfurt.de
// We add the block for the model economy under flexible prices to the original code.
// The flexible output is defined as output when prices are flexible,
//  in other words, the real marginal cost is constant.
// Accordingly, in the flex-price economy variables for any kind of inflation are zero;
// the Phillips curves are ignored; considering the symmetric country structure,
// price mark-up shocks from foreign contry are disregarded: p_d_ast, p_c_ast, p_dc_ast, pi_c_f


// Last edited: October 28, 2013

//DECLARATION OF ENDOGENOUS VARIABLES

var y pi_d_h r pi_c c n d d_b d_s b_b p_dc c_b c_s psi pi_c_h s_c s_d y_c y_d mc_c mc_d n_c n_d wp_d wp_c n_c_b n_d_b n_c_s n_d_s e
    yf rf cf nf df d_bf d_sf b_bf c_bf c_sf psif y_cf y_df n_cf n_df wp_df wp_cf n_c_bf n_d_bf n_c_sf n_d_sf
    epsg
//SHOCKS

a_c a_d shock_mu_c shock_mu_d epsmu_c_aux epsmu_d_aux LTV shock_d_b shock_d_s shock_d_stern c_ast d_ast g p_dc_ast p_d_ast p_c_ast pi_c_f i_d_ast

//**************************************************************************
// Modelbase Variables                                                   //*
   interest inflation inflationq outputgap output fispol;                //*
//**************************************************************************


//DECLARATION OF EXOGENOUS VARIABLES (INNOVATIONS)

varexo epsa_c epsa_d epsmu_c epsmu_d epsLTV epsd_b epsd_s epsc_ast epsd_ast epsd_stern epsp_c_ast epsp_d_ast

//**************************************************************************
// Modelbase Shocks                                                      //*
       interest_ fiscal_;                                                        //*
//**************************************************************************


//DECLARATION OF PARAMETERS

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

gamma xi beta_s delta h_c beta_b chi alpha_c alpha_d  vartheta_c vartheta_d omega  big_phi_c theta_c tau_c kappa_c big_phi_d theta_d tau_d kappa_d phi zeta_c zeta_d eta_c eta_d mu_c mu_d Lambda_b Lambda_s biggamma sigma

//AR(1)-PARAMETERS OF SHOCK PROCESSES

rho_a_c rho_a_d rho_mu_c1 rho_mu_c2 rho_mu_d1 rho_mu_d2 rho_LTV rho_d_b rho_d_s rho_d_stern rho_c_ast rho_d_ast rho_g rho_gac rho_gad rho_p_c_ast rho_p_d_ast

//EQUILIBRIUM VALUES

CBDB PDC CSDS CBC CSC DBD DSD BHCB DBCB DB CB DS CS N ND NC C D NCCB NDCB;

//PARAMETER VALUES

alpha_c = 0.87;//0.5;
alpha_d = 0.45;//0;
xi = 0.1; // share of housing sector in aggregate production // calibrated
gamma = 0.39;//0.25;
mu_c = 0.1;//0.2; // in calibration section in paper, mark-ups in both sectors are indicated to be set to 0.1
mu_d = 0.1;//0.2; // in calibration section in paper, mark-ups in both sectors are indicated to be set to 0.1
beta_s = 0.99; //calibrated
delta = 0.01; //calibrated
h_c = 0.03;// 0.2;
beta_b = 0.96; //calibrated
chi = 0.4;//0.3; // the fraction of residential goods, which can not be used as collateral
omega = 0.15;//0.35;
phi = 12.25;// 5;
zeta_c = 2; //calibrated
eta_c = 2; //calibrated
zeta_d = 2; //calibrated
eta_d = 2; //calibrated
vartheta_c = zeta_c + (1 - alpha_c)*eta_c;
vartheta_d = zeta_d + (1 - alpha_d)*eta_d;
sigma = 0.98;//3;
theta_c  =0.50;// 0.67;
tau_c = 0.21;//0.12;
big_phi_c = (theta_c + tau_c * (1 - theta_c * (1 - beta_s)))^(-1);
kappa_c = (1 - tau_c) * (1 - theta_c) * (1 - beta_s * theta_c) * big_phi_c;
theta_d  = 0.29;//0.67;
tau_d = 0.25;//0.12;
big_phi_d = (theta_d + tau_d * (1 - theta_d * (1 - beta_s)))^(-1);
kappa_d = (1 - tau_d) * (1 - theta_d) * (1 - beta_s * theta_d) * big_phi_d;
biggamma = (sigma + (1 - sigma) * gamma)/(1 - h_c);

//AR(1)-PARAMETERS OF SHOCK PROCESSES

rho_c_ast = 0.7;
rho_d_ast = 0.7;
rho_d_s = 0.89;//0.7;
rho_d_b = 0.74;//0.7;
rho_d_stern = 0.42;//0.7;
rho_g = 0.59;//0.7;
rho_gac = 0; // estimated at 0.74 (see Table 2, however not showing up in equation (25))
rho_gad = 0; // estimated at 0.30 (see Table 2, however not showing up in equation (25))
rho_a_c = 0.65;//0.85;
rho_a_d = 0.31;//0.85;
rho_mu_c1 = 0.77;//0.9;
rho_mu_c2 = 0.07;//0.74;
rho_mu_d1 = 0.3;//0.9;
rho_mu_d2 = 0.3;//0.74;
rho_LTV = 0.3;//0.7;
rho_p_c_ast = 0.98;//0.7;
rho_p_d_ast = 0.39;//0.7;

//EQUILIBRIUM VALUES

N = 0.3;
PDC = (1 + mu_d)/(1 + mu_c);
CBDB = ((1 - gamma)/gamma) * ((1 - beta_b * (1 - delta) - (1 - chi) * (1 - delta) * (beta_s - beta_b))/(1 - h_c)) * PDC;
CSDS = ((1 - gamma)/gamma) *  ((1 - beta_s * (1 - delta))/ (1 - h_c)) * PDC;
DBCB = 1/CBDB;
BHCB = (1 - chi)*(1 - delta) * beta_s * PDC * DBCB;
DB = (1/(1 + mu_c))*N/(CBDB + (delta - (1 - chi)*(1 - delta)*(beta_s -1))* PDC );
CB = CBDB * DB;
ND =  ((1/((1-omega)*delta)) * omega * delta * DB + (1/((1-omega) * CSDS))*(N * ((1/(1 + mu_c)))  - omega*  CB)  ) / ( (1/((1 - omega) * CSDS)) * (1/(1 + mu_c)) + (1 / ((1 - omega) * delta))* (1/(1 + mu_d)) );
NC = N - ND;
DS = (1/((1 - omega) * delta)) * (ND - omega * delta * DB);
CS = CSDS * DS;
C = NC;
D = (1/delta) * ND;
CBC = CB/C;
CSC = CS/C;
DBD = DB/D;
DSD = DS/D;
NCCB = NC/CB;
NDCB = ND/CB;


Lambda_b = ((1-h_c)*gamma/(1-gamma)^(2)) * CBDB *PDC^(-1) - (1 - rho_d_b) * beta_b * (1 - delta) * ((1 - sigma) * gamma * ( log(DB) - log((1 - h_c)*CB)) - (gamma/(1 - gamma)));

Lambda_s = ((1-h_c)*gamma/(1-gamma)^(2)) * CSDS *PDC^(-1) - (1 - rho_d_s) * beta_s * (1 - delta) * ((1 - sigma) * gamma * ( log(DS) - log((1 - h_c)*CS)) - (gamma/(1 - gamma)));

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
coffispol = 1;
                                                                         //*
//**************************************************************************


//THE MODEL

model (linear);

//**************************************************************************
// Definition of Modelbase Variables in Terms of Original Model Variables//*

interest   = r*4;                                                        //*
inflation = (1/4)*(4*pi_c+4*pi_c(-1)+4*pi_c(-2)+4*pi_c(-3));             //*
inflationq  = pi_c*4;                                                    //*
outputgap  = y-yf;                                                       //*
output = y;                                                              //*
fispol = epsg;                                                              //*
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

//********************** Original Model Code:  ***************************//

p_dc = ((1 - h_c)*gamma/(1-gamma)) * CBDB * PDC^(-1) * (((c_b - h_c * c_b(-1))/(1 - h_c)) - d_b)
    + beta_b * (1 - delta) * ( biggamma * ((c_b - h_c * c_b(-1)) - (c_b(+1) - h_c * c_b)) + (1 - sigma) * gamma * (d_b(+1) - d_b)+ p_dc(+1))
    + (beta_s - beta_b) * (1 - chi) * (1 - delta) * (psi + p_dc + pi_d_h(+1) + alpha_d * (s_d(+1) - s_d)  + LTV)+ Lambda_b * shock_d_b;

p_dc = ((1-h_c)*gamma/(1 - gamma)) * CSDS * PDC^(-1) * (((c_s - h_c * c_s(-1))/(1 - h_c)) - d_s)
    + beta_s * (1 - delta) * ( biggamma * ((c_s - h_c * c_s(-1)) - (c_s(+1) - h_c * c_s)) + (1 - sigma) * gamma * (d_s(+1) - d_s) + p_dc(+1)) + Lambda_s * shock_d_s;

r + psi = (beta_b/ (beta_s - beta_b)) * ( biggamma * ((c_b(+1) - h_c * c_b) - (c_b - h_c * c_b(-1))) + (1 - sigma) * gamma * (d_b - d_b(+1)) - (r - pi_c_h(+1)) + alpha_c * (s_c(+1) - s_c) + (1 - sigma)*gamma * (log(DB) - log((1 - h_c)*CB)) * (1 - rho_d_b) *shock_d_b);

c_s = h_c * c_s(-1) + c_s(+1) - h_c *  c_s - biggamma^(-1) * (r - pi_c_h(+1)) + biggamma^(-1) *alpha_c * (s_c(+1) - s_c) - biggamma^(-1) * (1 - sigma) * gamma * (d_s(+1) - d_s)+ biggamma^(-1) * (1-sigma)*gamma*(log(DS)-log((1 - h_c)*CS))*(1 - rho_d_s) * shock_d_s;

c_b = (1/(1-h_c))* BHCB * (b_b - beta_s^(-1) * (r(-1) + b_b(-1) - pi_c_h - alpha_c *(s_c - s_c(-1)))) - PDC *(1/(1-h_c))* DBCB * (delta * p_dc + d_b - (1 - delta) * d_b(-1))
    +(1/(1 + mu_c)) *(1/(1-h_c))* NCCB * ( wp_c + n_c_b) +(1/(1 + mu_d))*(1/(1-h_c)) * NDCB * PDC * ( wp_d + n_d_b);

r + b_b = p_dc(+1) + d_b + pi_c_h(+1) + alpha_c * (s_c(+1) - s_c) + LTV;

y_c = (1 - alpha_c) * c  + alpha_c * c_ast + alpha_c * vartheta_c * s_c + g;

y_d = (1 - alpha_d) * ((1/delta) * d - ((1 - delta)/delta) * d(-1)) + alpha_d * i_d_ast + alpha_d * vartheta_d * s_d + g;

c = omega * CBC * c_b + (1 - omega)* CSC * c_s;

d = omega * DBD * d_b + (1 - omega) *DSD * d_s;

pi_c_h = big_phi_c * (beta_s * theta_c * pi_c_h(+1) + tau_c * pi_c_h(-1)) + kappa_c * mc_c + shock_mu_c;

pi_d_h = big_phi_d * (beta_s * theta_d * pi_d_h(+1) + tau_d * pi_d_h(-1)) + kappa_d * mc_d + shock_mu_d;

mc_c = biggamma * (c - h_c * c(-1)) - (1 - sigma) * gamma * d + phi * n_c -  a_c + alpha_c * s_c - ((1 - sigma) * gamma * (log(D) - log((1 - h_c)*C)) - (gamma/(1 - gamma))) * (omega * shock_d_b + (1 - omega)*shock_d_s);

mc_d = biggamma * (c - h_c * c(-1)) - (1 - sigma) * gamma * d + phi * n_d - a_d + alpha_d * s_d  - p_dc- ((1 - sigma) * gamma * (log(D) - log((1 - h_c)*C)) - (gamma/(1 - gamma))) * (omega * shock_d_b + (1 - omega)*shock_d_s);

(1 - alpha_c) * s_c = biggamma * ((c_s - h_c * c_s(-1)) - (c_ast - h_c * c_ast(-1))) - (1 - sigma) * gamma * (d_s - d_ast) -biggamma^(-1) * (1-sigma)*gamma*(log(DS)-log((1 - h_c)*CS)) * (shock_d_s - shock_d_stern);

y_c =  n_c + a_c;

y_d = n_d + a_d;

wp_d = biggamma * (c - h_c * c(-1)) - (1 - sigma) * gamma * d + phi * n_d- ((1 - sigma) * gamma * (log(D) - log((1 - h_c)*C)) - (gamma/(1 - gamma))) * (omega * shock_d_b + (1 - omega)*shock_d_s);

wp_c = biggamma * (c - h_c * c(-1)) - (1 - sigma) * gamma * d + phi * n_c - ((1 - sigma) * gamma * (log(D) - log((1 - h_c)*C)) - (gamma/(1 - gamma))) * (omega * shock_d_b + (1 - omega)*shock_d_s);

wp_d = biggamma * (c_b - h_c * c_b(-1)) - (1 - sigma) * gamma * d_b + phi * n_d_b  - ((1 - sigma) * gamma * (log(DB) - log((1 - h_c)*CB)) - (gamma/(1 - gamma))) * shock_d_b;

wp_c = biggamma * (c_b - h_c * c_b(-1)) - (1 - sigma) * gamma * d_b +  phi * n_c_b  - ((1 - sigma) * gamma * (log(DB) - log((1 - h_c)*CB)) - (gamma/(1 - gamma))) * shock_d_b ;

wp_d = biggamma * (c_s - h_c * c_s(-1)) - (1 - sigma) * gamma * d_s + phi * n_d_s  - ((1 - sigma) * gamma * (log(DS) - log((1 - h_c)*CS)) - (gamma/(1 - gamma))) * shock_d_s;

wp_c = biggamma * (c_s - h_c * c_s(-1)) - (1 - sigma) * gamma * d_s + phi * n_c_s  - ((1 - sigma) * gamma * (log(DS) - log((1 - h_c)*CS)) - (gamma/(1 - gamma))) * shock_d_s;

p_dc = p_dc(-1) + pi_d_h - pi_c_h + alpha_d * (s_d - s_d(-1)) - alpha_c * (s_c - s_c(-1));

 // original monetary policy rule under e=0
 // pi_c_f =  s_c - s_c(-1) + pi_c_h;

// exchange rate
pi_c_f + e - e(-1)=  s_c - s_c(-1) + pi_c_h;

(1 - alpha_c) * s_c- (1 - alpha_d) * s_d = p_dc - p_dc_ast;

pi_c = pi_c_h + alpha_c * (s_c-s_c(-1));

y = (PDC^(-xi)*C/(PDC^(-xi)*C+delta*PDC^(1-xi) *D)) * (y_c - xi *(p_dc - alpha_d * s_d + alpha_c * s_c))
    + (PDC^(1-xi)*delta*D/(PDC^(-xi)*C+delta*PDC^(1-xi) *D)) * (y_d + (1-xi) *(p_dc - alpha_d * s_d + alpha_c * s_c)) - xi * ln(PDC) * ((omega * shock_d_b + (1 - omega)*shock_d_s) + shock_d_stern);

n = (NC/N)*n_c + (ND/N)*n_d;


//************************* Economy with flexible prices ******************************//

((1 - h_c)*gamma/(1-gamma)) * CBDB * PDC^(-1) * (((c_bf - h_c * c_bf(-1))/(1 - h_c)) - d_bf)
 + beta_b * (1 - delta) * ( biggamma * ((c_bf - h_c * c_bf(-1)) - (c_bf(+1) - h_c * c_bf)) + (1 - sigma) * gamma * (d_bf(+1) - d_bf))
 + (beta_s - beta_b) * (1 - chi) * (1 - delta) * (psif + LTV)+ Lambda_b * shock_d_b
 = ((1-h_c)*gamma/(1 - gamma)) * CSDS * PDC^(-1) * (((c_sf - h_c * c_sf(-1))/(1 - h_c)) - d_sf)
    + beta_s * (1 - delta) * ( biggamma * ((c_sf - h_c * c_sf(-1)) - (c_sf(+1) - h_c * c_sf)) + (1 - sigma) * gamma * (d_sf(+1) - d_sf)) + Lambda_s * shock_d_s;

rf + psif = (beta_b/ (beta_s - beta_b)) * ( biggamma * ((c_bf(+1) - h_c * c_bf) - (c_bf - h_c * c_bf(-1))) + (1 - sigma) * gamma * (d_bf - d_bf(+1))
           - rf + (1 - sigma)*gamma * (log(DB) - log((1 - h_c)*CB)) * (1 - rho_d_b) *shock_d_b);

c_sf = h_c * c_sf(-1) + c_sf(+1) - h_c *  c_sf - biggamma^(-1) * (rf)
      - biggamma^(-1) * (1 - sigma) * gamma * (d_sf(+1) - d_sf)+ biggamma^(-1) * (1-sigma)*gamma*(log(DS)-log((1 - h_c)*CS))*(1 - rho_d_s) * shock_d_s;

c_bf = (1/(1-h_c))* BHCB * (b_bf - beta_s^(-1) * (rf(-1) + b_bf(-1))) - PDC *(1/(1-h_c))* DBCB * (d_bf - (1 - delta) * d_bf(-1))
    +(1/(1 + mu_c)) *(1/(1-h_c))* NCCB * ( wp_cf + n_c_bf) +(1/(1 + mu_d))*(1/(1-h_c)) * NDCB * PDC * ( wp_df + n_d_bf);

rf + b_bf = d_bf + LTV;

y_cf = (1 - alpha_c) * cf  + alpha_c * c_ast + g;

y_df = (1 - alpha_d) * ((1/delta) * df - ((1 - delta)/delta) * df(-1)) + alpha_d * i_d_ast + g;

cf = omega * CBC * c_bf + (1 - omega)* CSC * c_sf;

df = omega * DBD * d_bf + (1 - omega) *DSD * d_sf;

//pi_c_h = big_phi_c * (beta_s * theta_c * pi_c_h(+1) + tau_c * pi_c_h(-1)) + kappa_c * mc_c + shock_mu_c;

//pi_d_h = big_phi_d * (beta_s * theta_d * pi_d_h(+1) + tau_d * pi_d_h(-1)) + kappa_d * mc_d + shock_mu_d;

phi * n_cf - a_c = phi * n_df - a_d;

0 = biggamma * ((c_sf - h_c * c_sf(-1)) - (c_ast - h_c * c_ast(-1))) - (1 - sigma) * gamma * (d_sf - d_ast)
                      -biggamma^(-1) * (1-sigma)*gamma*(log(DS)-log((1 - h_c)*CS)) * (shock_d_s - shock_d_stern);

y_cf =  n_cf + a_c;

y_df = n_df + a_d;

wp_df = biggamma * (cf - h_c * cf(-1)) - (1 - sigma) * gamma * df + phi * n_df- ((1 - sigma) * gamma * (log(D) - log((1 - h_c)*C)) - (gamma/(1 - gamma))) * (omega * shock_d_b + (1 - omega)*shock_d_s);

wp_cf = biggamma * (cf - h_c * cf(-1)) - (1 - sigma) * gamma * df + phi * n_cf - ((1 - sigma) * gamma * (log(D) - log((1 - h_c)*C)) - (gamma/(1 - gamma))) * (omega * shock_d_b + (1 - omega)*shock_d_s);

wp_df = biggamma * (c_bf - h_c * c_bf(-1)) - (1 - sigma) * gamma * d_bf + phi * n_d_bf  - ((1 - sigma) * gamma * (log(DB) - log((1 - h_c)*CB)) - (gamma/(1 - gamma))) * shock_d_b;

wp_cf = biggamma * (c_bf - h_c * c_bf(-1)) - (1 - sigma) * gamma * d_bf +  phi * n_c_bf  - ((1 - sigma) * gamma * (log(DB) - log((1 - h_c)*CB)) - (gamma/(1 - gamma))) * shock_d_b ;

wp_df = biggamma * (c_sf - h_c * c_sf(-1)) - (1 - sigma) * gamma * d_sf + phi * n_d_sf  - ((1 - sigma) * gamma * (log(DS) - log((1 - h_c)*CS)) - (gamma/(1 - gamma))) * shock_d_s;

wp_cf = biggamma * (c_sf - h_c * c_sf(-1)) - (1 - sigma) * gamma * d_sf + phi * n_c_sf  - ((1 - sigma) * gamma * (log(DS) - log((1 - h_c)*CS)) - (gamma/(1 - gamma))) * shock_d_s;

yf = (PDC^(-xi)*C/(PDC^(-xi)*C+delta*PDC^(1-xi) *D)) * y_cf
    + (PDC^(1-xi)*delta*D/(PDC^(-xi)*C+delta*PDC^(1-xi) *D)) * y_df  - xi * ln(PDC) * ((omega * shock_d_b + (1 - omega)*shock_d_s) + shock_d_stern);

nf = (NC/N)*n_cf + (ND/N)*n_df;



//SHOCK STRUCTURE

a_c = rho_a_c * a_c(-1) + epsa_c;

a_d = rho_a_d *a_d (-1) + epsa_d;

shock_mu_c = rho_mu_c1 * shock_mu_c(-1) + epsmu_c - rho_mu_c2 * epsmu_c_aux(-1);

shock_mu_d = rho_mu_d1 * shock_mu_d(-1) + epsmu_d - rho_mu_d2 * epsmu_d_aux(-1);

epsmu_d_aux = epsmu_d;

epsmu_c_aux = epsmu_c;

LTV = rho_LTV * LTV(-1) + epsLTV;

shock_d_s = rho_d_s * shock_d_s(-1) + epsd_s;

shock_d_b = rho_d_b * shock_d_b(-1) + epsd_b;

shock_d_stern = rho_d_stern * shock_d_stern(-1) + epsd_stern;

c_ast = rho_c_ast * c_ast(-1) + epsc_ast;

i_d_ast = rho_d_ast * i_d_ast(-1) + epsd_ast;

i_d_ast = (1/delta)* d_ast - ((1-delta)/delta) * d_ast(-1);

g = rho_g * g(-1) + rho_gac * epsa_c + rho_gad * epsa_d + epsg;

p_dc_ast = p_d_ast - p_c_ast;

p_d_ast = rho_p_d_ast * p_d_ast(-1) + epsp_d_ast;

p_c_ast = rho_p_c_ast * p_c_ast(-1) + epsp_c_ast;

pi_c_f = p_c_ast - p_c_ast(-1);

end;

//STEADY STATE

initval;

pi_c_h = 0;
pi_d_h = 0;
e = 0;

end;

//check;
//steady;

//SHOCKS

shocks;

var epsd_s; stderr 3.17;
var epsd_b; stderr 10.70;

var epsa_c; stderr 2.10;
var epsa_d; stderr 0.67;
var epsmu_c; stderr 4.21;
var epsmu_d; stderr 0.92;
var epsLTV; stderr 0.94;
var epsd_stern; stderr 1.42;
var epsc_ast; stderr 0.55;
var epsd_ast; stderr 0.91;
var fiscal_; stderr 1.87; // var epsg;
var epsp_c_ast; stderr 0.41;
var epsp_d_ast; stderr 0.72;

end;

// stoch_simul(irf=9) y n r c c_b c_s psi b_b d_b d_s pi_c_h pi_d_h y_c y_d;

