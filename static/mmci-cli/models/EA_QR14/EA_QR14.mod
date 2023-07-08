% EA_QR14

% Reference: Dominic Quint and Pau Rabanal (2014).
% "Monetary and Macroprudential Policy in an Estimated DSGE Model of the Euro Area"
% International Journal of Central Banking (June 2014)

// The original code was provided by the authors.
% New Keynesian Model with Housing. Two country model, with borrowers and savers.
% The model is programmed non-linearly so we can take higher order approximations
% Dominic Quint and Pau Rabanal
% Washington-Berlin, 2013

% The MMB team adds the flexible-price economy where we assume no nominal rigidities in both home and foreign countries
% in the presence of financial frictions.
% In the flexible-price economy, all inflations as well as terms of trade are one.
% Last edited by Jinhyuk Yoo in February 2016.


%----------------------------------------------------------------
% 0. Housekeeping
%----------------------------------------------------------------

close all

%----------------------------------------------------------------
% 1. Defining variables
%----------------------------------------------------------------

var
q,c,d,c_borr,d_borr,dpd,dpc,dph,lc_tot,ld_tot,l,l_borr,lc,ld,lc_borr,ld_borr,wc,wd,yc,yd,varrho,inv,varrho_borr,inv_borr,
q_s,c_s,d_s,c_s_borr,d_s_borr,dpd_s,dpc_s,dpf,lc_s_tot,ld_s_tot,l_s,l_s_borr,lc_s,ld_s,
lc_s_borr,ld_s_borr,wc_s,wd_s,yc_s,yd_s,varrho_s,inv_s,varrho_s_borr,inv_s_borr,
ch,cf,c_tot,ch_s,cf_s,c_s_tot,s_s_borr,s_borr,r,r_s,omegaa,omegaa_s,omegap,omegap_s,Fa,Fa_s,Fp,Fp_s,Ga,Ga_s,Gp,Gp_s,terms,dpemu,b,rl,rl_s,rd,rd_s,y,y_s,y_emu,
yctilde,yctilde_s,ydtilde,ydtilde_s,phtilde,pftilde,pdtilde,pdtilde_s,XC1,XC2,XC1_s,XC2_s,XD1,XD2,XD1_s,XD2_s,mcc,mcc_s,mcd,mcd_s,mautil,mautil_s,vc,vc_s,vd,vd_s,
util,util_borr,welf,welf_borr,util_s,util_s_borr,welf_s,welf_s_borr,welf_cor,welf_per,welf_emu,eta,eta_s,return_default,return_nondefault,return_default_s,return_nondefault_s,
prefd,prefd_s,premium,risk,risk_s,prefc,prefc_s,techc,techd,techc_s,techd_s
// variables for flexible-price economy
cff,qf,varrhof,invf,df,rf,lf,lcf,wcf,ldf,
wdf,cff_s,qf_s,varrhof_s,invf_s,df_s,rf_s,lf_s,lcf_s,wcf_s,
ldf_s,wdf_s,ycf,ydf,yf,y_emuf,ycf_s,ydf_s,yf_s,cff_borr,
cff_s_borr,varrhof_borr,varrhof_s_borr,invf_borr,invf_s_borr,df_borr,df_s_borr,lf_borr,lcf_borr,ldf_borr,
lf_s_borr,lcf_s_borr,ldf_s_borr,sf_borr,sf_s_borr,lcf_tot,lcf_s_tot,ldf_tot,ldf_s_tot,cff_tot,
cff_s_tot,rdf,rdf_s,rlf,rlf_s
% need to initialize variables in the following lines below.
Faf Fpf return_defaultf return_nondefaultf Gpf Gaf omegaaf omegapf
Faf_s Fpf_s return_defaultf_s return_nondefaultf_s Gpf_s Gaf_s omegaaf_s omegapf_s
//**************************************************************************
// Modelbase Variables                                                   //*
   interest inflation inflationq output outputgap;                       //*
//**************************************************************************


varexo
e_premium,e_risk,e_risk_s,e_prefd,e_prefd_s,e_prefc,e_prefc_s,e_techc,e_techd,e_techc_s,e_techd_s,e_tech,e_prefd_com,e_techc_com,  // e_m,

//**************************************************************************
// Modelbase Shocks                                                      //*
       interest_;                                                        //*
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
                                                                         //*
//**************************************************************************

beta,beta_borr,lambda,delta,chi,sigma,kappa_b,gamma,alpha,phi,tau,epsilon,epsilon_borr,psi,theta_c,phi_c,theta_d,phi_d,
gamma_s,alpha_s,tau_s,theta_c_s,phi_c_s,theta_d_s,phi_d_s,gamma_r,gamma_pi,iota_C,iota_L,
RR_bar,RL_bar,upsilon,upsilon_borr,upsilon_s,upsilon_borr_s,rho_premium,rho_risk,rho_risk_s,rho_prefd,rho_prefd_s,
rho_prefc,rho_prefc_s,rho_techc,rho_techc_s,rho_techd,rho_techd_s,W_bar,L_total_bar,L_bar,L_borr_bar,C_bar,D_bar,S_borr_bar,Z_bar,D_borr_bar,
C_borr_bar,L_s_total_bar,L_s_bar,L_s_borr_bar,C_s_bar,D_s_bar,S_s_borr_bar,Z_s_bar,D_s_borr_bar,
C_s_borr_bar,n,gamma_y,gamma_eta,gamma_eta_s,RL_s_bar,RD_bar,F_bar,G_bar,sigma_bar,mu,omega_bar;

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
//    std_r_ = 100;                                                        //*
                                                                         //*
// Definition of Discretionary Fiscal Policy Parameter                   //*
//coffispol = ;                                                          //*
//**************************************************************************


%----------------------------------------------------------------
% 2. Declaration of External Function
%----------------------------------------------------------------

external_function(name=logncdf, nargs=3);

%----------------------------------------------------------------
% 3. Calibration
%----------------------------------------------------------------

// Calibrated Parameters

beta=0.99;           % Discount factor savers
//beta_borr = 0.985;    % Discount factor borrowers // THIS IS NOW ENDOGENOUS
delta=.015;          % Depreciation rate
lambda=0.6085;         % Share of savers
chi=0.3;             % One minus LTV
sigma=10;            % Elasticity of substitution between types of goods
kappa_b=0.0043;       % Elasticity of domestic interest rate to level of foreign assets
n = .6;              % Size home country
iota_L=0.7174;         % Labor disutility cost parameter
iota_C=1.9003;         % Elasticity of substitution between home and foreign goods
epsilon=0.7187;        % Habit formation parameter
epsilon_borr=0.4550;   % Habit formation parameter: borrowers
phi=0.3702;            % Labor disutility
psi = 1.7490;          % Adjustment cost parameter for residential investment
F_bar = 0.025;        % fraction of defaults
mu    = 0.2;         % Monitoring costs - CALIBRATED

//gamma=0.9;         % Share of nondurable consumption in CPI (this is computed endogenously) Home country
alpha=0.94; %0.95;    % Size of nondurable sector in GDP Home Country
tau=.94;             % Fraction of home-produced nondurable consumption Home country

//gamma_s=0.9;       % Share of nondurable consumption in CPI (this is computed endogenously) Foreign country
alpha_s=0.94; %0.93;  % Size of nondurable sector in GDP Foreign Country
tau_s=1 -n*(1-tau)/(1-n) ;        % Fraction of foreign-produced nondurable consumption Foreign country

theta_c=0.6252;       % Calvo lottery nondurable sector Home country
theta_d=0.6449;       % Calvo lottery durable sector Home country
phi_c=0.1510;         % Backward looking inflation parameter nondurable sector Home country
phi_d=0.2515;         % Backward looking inflation parameter durable sector Home country

theta_c_s=0.7241;     % Calvo lottery nondurable sector Foreign country
theta_d_s=0.5935;     % Calvo lottery durable sector Foreign country
phi_c_s=0.1276;         % Backward looking inflation parameter nondurable sector Foreign country
phi_d_s=0.4335;         % Backward looking inflation parameter durable sector Foreign country

gamma_pi=1.5579;          % Taylor rule: inflation
gamma_r=0.8016;           % Taylor rule: smoothing
gamma_y=0.2023;           % Taylor rule: output growth

gamma_eta=0;        % Macroprudential regulation home country: reaction to nominal credit growth
gamma_eta_s=0; % Macroprudential regulation foreign country: reaction to nominal credit growth

rho_premium=0.7846;      % AR coefficient, international premium shock
rho_risk=0.8431;     % AR coefficient, risk shock lending rate Home country
rho_risk_s=rho_risk;    % AR coefficient, risk shock lending rate Foreign country
rho_prefd=0.9836;        % AR coefficient, preference shock durable sector Home country
rho_prefd_s=rho_prefd;    % AR coefficient, preference shock durable sector Foreign country
rho_prefc=0.6649;        % AR coefficient, preference shock nondurable sector Home country
rho_prefc_s=rho_prefc;    % AR coefficient, preference shock nondurable sector Foreign country
rho_techc=0.7936;        % AR coefficient, TFP shock nondurable sector Home country
rho_techc_s=rho_techc;    % AR coefficient, TFP shock nondurable sector Foreign country
rho_techd=0.8624;        % AR coefficient, TFP shock durable sector Home country
rho_techd_s=rho_techd;    % AR coefficient, TFP shock durable sector Foreign country

%----------------------------------------------------------------
% 4. Steady State Parameters
%----------------------------------------------------------------
    gamma = call_csolve1_timingI(delta,lambda,epsilon,epsilon_borr,chi,beta,sigma,phi,alpha,mu,F_bar);
    gamma_s = call_csolve1_timingI(delta,lambda,epsilon,epsilon_borr,chi,beta,sigma,phi,alpha_s,mu,F_bar);

    RR_bar=1/beta;

    omega_bar = (1-chi);
    sigma_bar = call_csolve2(F_bar,omega_bar);

    G_bar = 1- normcdf((0.5*sigma_bar^2 -log(omega_bar))/sigma_bar,0,1);

    RL_bar = RR_bar/((1-mu)*G_bar/omega_bar+1-F_bar);
    RL_s_bar=RL_bar;

    beta_borr = (RL_bar*(1-F_bar+G_bar/omega_bar))^(-1);

    RD_bar = G_bar*RL_s_bar/omega_bar;

    upsilon_borr=gamma*(1-beta_borr*(1-delta))/(beta_borr*(1-gamma)*(1-epsilon_borr));
    upsilon=gamma*(1-beta*(1-delta))/(beta*(1-gamma)*(1-epsilon));

    upsilon_borr_s=gamma_s*(1-beta_borr*(1-delta))/(beta_borr*(1-gamma_s)*(1-epsilon_borr));
    upsilon_s=gamma_s*(1-beta*(1-delta))/(beta*(1-gamma_s)*(1-epsilon));

    % Hours worked and consumption by borrowers
    L_borr_bar=(gamma/(1-epsilon_borr)*(1+(delta+G_bar+(1-F_bar-(1/RL_bar))*omega_bar)/upsilon_borr))^(1/(1+phi));
    C_borr_bar=gamma/(1-epsilon_borr)*(1-1/sigma)*L_borr_bar^(-phi);
    W_bar = 1-1/sigma;

    D_borr_bar=C_borr_bar/upsilon_borr;
    S_borr_bar=omega_bar*D_borr_bar/RL_bar;

    L_s_borr_bar=(gamma_s/(1-epsilon_borr)*(1+(delta+G_bar+(1-F_bar-(1/RL_bar))*omega_bar)/upsilon_borr_s))^(1/(1+phi));
    C_s_borr_bar=gamma_s/(1-epsilon_borr)*(1-1/sigma)*L_s_borr_bar^(-phi);

    D_s_borr_bar=C_s_borr_bar/upsilon_borr_s;
    S_s_borr_bar=omega_bar*D_s_borr_bar/RL_s_bar;


    % Hours worked and consumption by savers
    Z_bar=(1-lambda)/lambda*((1-(sigma-1)/sigma)*L_borr_bar+(RR_bar-1)*S_borr_bar+mu*G_bar*D_borr_bar);
    L_bar = call_csolve3(delta,upsilon,phi,W_bar,Z_bar,gamma,epsilon,alpha);

    C_bar=W_bar*gamma/(1-epsilon)*L_bar^(-phi);
    D_bar=C_bar/upsilon;

    Z_s_bar=(1-lambda)/lambda*((1-(sigma-1)/sigma)*L_s_borr_bar+(RR_bar-1)*S_s_borr_bar+mu*G_bar*D_s_borr_bar);
    L_s_bar = call_csolve3(delta,upsilon_s,phi,W_bar,Z_s_bar,gamma_s,epsilon,alpha_s);

    C_s_bar=W_bar*gamma_s/(1-epsilon)*L_s_bar^(-phi);
    D_s_bar=C_s_bar/upsilon_s;


    % Total hours
    L_total_bar=lambda*L_bar+(1-lambda)*L_borr_bar;
    L_s_total_bar=lambda*L_s_bar+(1-lambda)*L_s_borr_bar;



%----------------------------------------------------------------
% 5. Model
%----------------------------------------------------------------


model;

//**************************************************************************
// Definition of Modelbase Variables in Terms of Original Model Variables //*

interest   = 4*(r-log(RR_bar));
inflation  = (dpemu + dpemu(-1) + dpemu(-2) + dpemu(-3))*1;
inflationq = dpemu*4;
outputgap  = (y_emu - y_emuf)*1;
output     = (y_emu - log(L_total_bar))*1;
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
//fispol = coffispol*fiscal_;                                            //*
//**************************************************************************

//******* The Flexible-price economy
//******* there are no nominal rigidities.
//***********************************************************************
//1-2 investment decision borrowers
gamma*exp(prefc)/(exp(cff_borr)-epsilon_borr*exp(cff_borr(-1))/exp(e_tech)) * exp(qf) = beta_borr*exp(varrhof_borr(1))*(1 -psi/2*(exp(invf_borr)*exp(e_tech)/exp(invf_borr(-1))-1)^2 -psi*(exp(invf_borr)*exp(e_tech)/exp(invf_borr(-1))-1)*exp(invf_borr)*exp(e_tech)/exp(invf_borr(-1))) + beta_borr^2*exp(varrhof_borr(2))*psi*(exp(invf_borr(1))/exp(invf_borr)-1)*(exp(invf_borr(1))/exp(invf_borr))^2;
gamma_s*exp(prefc_s)/(exp(cff_s_borr)-epsilon_borr*exp(cff_s_borr(-1))/exp(e_tech)) * exp(qf_s) = beta_borr*exp(varrhof_s_borr(1))*(1 -psi/2*(exp(invf_s_borr)*exp(e_tech)/exp(invf_s_borr(-1))-1)^2 -psi*(exp(invf_s_borr)*exp(e_tech)/exp(invf_s_borr(-1))-1)*exp(invf_s_borr)*exp(e_tech)/exp(invf_s_borr(-1))) + beta_borr^2*exp(varrhof_s_borr(2))*psi*(exp(invf_s_borr(1))/exp(invf_s_borr)-1)*(exp(invf_s_borr(1))/exp(invf_s_borr))^2;

//3-4 demand durable consumption borrowers
(1-gamma)*exp(prefd)/exp(df_borr) = exp(varrhof_borr) -beta_borr*(1-delta)*exp(varrhof_borr(1));
(1-gamma_s)*exp(prefd_s)/exp(df_s_borr) = exp(varrhof_s_borr) -beta_borr*(1-delta)*exp(varrhof_s_borr(1));

//7-8 Euler equation borrowers
1 = beta_borr*((1-exp(Faf))*exp(rlf)+exp(rdf(1))) * exp(prefc(1))/exp(prefc) * (exp(cff_borr) -epsilon_borr*exp(cff_borr(-1))/exp(e_tech))/(exp(cff_borr(1)) -epsilon_borr*exp(cff_borr));
1 = beta_borr*((1-exp(Faf_s))*exp(rlf_s)+exp(rdf_s(1))) * exp(prefc_s(1))/exp(prefc_s) * (exp(cff_s_borr) -epsilon_borr*exp(cff_s_borr(-1))/exp(e_tech))/(exp(cff_s_borr(1)) -epsilon_borr*exp(cff_s_borr));

//9-10 labor supply to non-durable sector borrowers
alpha^(-iota_L)*exp(lf_borr)^(phi-iota_L)*exp(lcf_borr)^iota_L = gamma*exp(prefc)/(exp(cff_borr) -epsilon_borr*exp(cff_borr(-1))/exp(e_tech)) * exp(wcf);
alpha_s^(-iota_L)*exp(lf_s_borr)^(phi-iota_L)*exp(lcf_s_borr)^iota_L = gamma_s*exp(prefc_s)/(exp(cff_s_borr) -epsilon_borr*exp(cff_s_borr(-1))/exp(e_tech)) * exp(wcf_s);

//11-12 labor supply to durable sector borrowers
(1-alpha)^(-iota_L)*exp(lf_borr)^(phi-iota_L)*exp(ldf_borr)^iota_L = gamma*exp(prefc)/(exp(cff_borr) -epsilon_borr*exp(cff_borr(-1))/exp(e_tech)) * exp(wdf);
(1-alpha_s)^(-iota_L)*exp(lf_s_borr)^(phi-iota_L)*exp(ldf_s_borr)^iota_L = gamma_s*exp(prefc_s)/(exp(cff_s_borr) -epsilon_borr*exp(cff_s_borr(-1))/exp(e_tech)) * exp(wdf_s);

//13-14 participation constraint financial intermediaries
exp(eta)*exp(rf) = exp(return_defaultf(1)) +exp(return_nondefaultf(1));
exp(eta_s)*exp(rf_s) = exp(return_defaultf_s(1)) +exp(return_nondefaultf_s(1));

//15-16 foreclosure settlement (as percent of outstanding credit)
exp(return_defaultf) = (1-mu)*exp(Gpf)*exp(qf)*exp(df_borr)*exp(e_tech)/exp(sf_borr(-1));
exp(return_defaultf_s) = (1-mu)*exp(Gpf_s)*exp(qf_s)*exp(df_s_borr)*exp(e_tech)/exp(sf_s_borr(-1));

//17-18 repayment performing credit
exp(return_nondefaultf) = (1-exp(Fpf))*exp(rlf(-1));
exp(return_nondefaultf_s) = (1-exp(Fpf_s))*exp(rlf_s(-1));

//19-20 average interest rates of those who default
exp(rdf) = exp(Gpf)*exp(qf)*exp(df_borr)*exp(e_tech)/exp(sf_borr(-1));
exp(rdf_s) = exp(Gpf_s)*exp(qf_s)*exp(df_s_borr)*exp(e_tech)/exp(sf_s_borr(-1));

//21-22 Ex-ante and ex-post omega's
exp(omegaaf) = exp(rlf)*exp(sf_borr)/(exp(qf(1))*exp(df_borr(1)));
exp(omegaaf_s) = exp(rlf_s)*exp(sf_s_borr)/(exp(qf_s(1))*exp(df_s_borr(1)));
exp(omegapf) = exp(rlf(-1))*exp(sf_borr(-1))/(exp(qf)*exp(df_borr)*exp(e_tech));
exp(omegapf_s) = exp(rlf_s(-1))*exp(sf_s_borr(-1))/(exp(qf_s)*exp(df_s_borr)*exp(e_tech));

//23-26 definition F
exp(Faf) = logncdf(exp(omegaaf),-0.5*(exp(risk))^2,exp(risk));
exp(Fpf) = logncdf(exp(omegapf),-0.5*(exp(risk(-1)))^2,exp(risk(-1)));
exp(Faf_s) = logncdf(exp(omegaaf_s),-0.5*(exp(risk_s))^2,exp(risk_s));
exp(Fpf_s) = logncdf(exp(omegapf_s),-0.5*(exp(risk_s(-1)))^2,exp(risk_s(-1)));

//27-30 definition G
exp(Gaf) = 1- normcdf((0.5*(exp(risk))^2 -log(exp(omegaaf)))/exp(risk),0,1);
exp(Gpf) = 1- normcdf((0.5*(exp(risk(-1)))^2 -log(exp(omegapf)))/exp(risk(-1)),0,1);
exp(Gaf_s) = 1- normcdf((0.5*(exp(risk_s))^2 -log(exp(omegaaf_s)))/exp(risk_s),0,1);
exp(Gpf_s) = 1- normcdf((0.5*(exp(risk_s(-1)))^2 -log(exp(omegapf_s)))/exp(risk_s(-1)),0,1);

//31-32 budget constraint borrowers
exp(cff_borr) +exp(qf)*exp(invf_borr) +(exp(rdf) +(1-exp(Fpf))*exp(rlf(-1)))*exp(sf_borr(-1))/exp(e_tech) = exp(sf_borr) + exp(wcf)*exp(lcf_borr) + exp(wdf)*exp(ldf_borr);
exp(cff_s_borr) +exp(qf_s)*exp(invf_s_borr) +(exp(rdf_s) +(1-exp(Fpf_s))*exp(rlf_s(-1)))*exp(sf_s_borr(-1))/exp(e_tech) = exp(sf_s_borr) + exp(wcf_s)*exp(lcf_s_borr) + exp(wdf_s)*exp(ldf_s_borr);

//33-34 investment decision savers
gamma*exp(prefc)/(exp(cff)-epsilon*exp(cff(-1))/exp(e_tech)) * exp(qf) = beta*exp(varrhof(1))*(1 -psi/2*(exp(invf)*exp(e_tech)/exp(invf(-1))-1)^2 -psi*(exp(invf)*exp(e_tech)/exp(invf(-1))-1)*exp(invf)*exp(e_tech)/exp(invf(-1))) + beta^2*exp(varrhof(2))*psi*(exp(invf(1))/exp(invf)-1)*(exp(invf(1))/exp(invf))^2;
gamma_s*exp(prefc_s)/(exp(cff_s)-epsilon*exp(cff_s(-1))/exp(e_tech)) * exp(qf_s) = beta*exp(varrhof_s(1))*(1 -psi/2*(exp(invf_s)*exp(e_tech)/exp(invf_s(-1))-1)^2 -psi*(exp(invf_s)*exp(e_tech)/exp(invf_s(-1))-1)*exp(invf_s)*exp(e_tech)/exp(invf_s(-1))) + beta^2*exp(varrhof_s(2))*psi*(exp(invf_s(1))/exp(invf_s)-1)*(exp(invf_s(1))/exp(invf_s))^2;

//35-36 demand durable consumption savers
(1-gamma)*exp(prefd)/exp(df) = exp(varrhof) -beta*(1-delta)*exp(varrhof(1));
(1-gamma_s)*exp(prefd_s)/exp(df_s) = exp(varrhof_s) -beta*(1-delta)*exp(varrhof_s(1));

//37-38 Euler equation savers
1 = beta*exp(rf) * exp(prefc(1))/exp(prefc) * (exp(cff) -epsilon*exp(cff(-1))/exp(e_tech))/(exp(cff(1)) -epsilon*exp(cff));
1 = beta* exp(rf_s) * exp(prefc_s(1))/exp(prefc_s) * (exp(cff_s) -epsilon*exp(cff_s(-1))/exp(e_tech))/(exp(cff_s(1)) -epsilon*exp(cff_s));

//39-40 labor supply to non-durable sector savers
alpha^(-iota_L)*exp(lf)^(phi-iota_L)*exp(lcf)^iota_L = gamma*exp(prefc)/(exp(cff) -epsilon*exp(cff(-1))/exp(e_tech)) * exp(wcf);
alpha_s^(-iota_L)*exp(lf_s)^(phi-iota_L)*exp(lcf_s)^iota_L = gamma_s*exp(prefc_s)/(exp(cff_s) -epsilon*exp(cff_s(-1))/exp(e_tech)) * exp(wcf_s);

//41-42 labor supply to durable sector savers
(1-alpha)^(-iota_L)*exp(lf)^(phi-iota_L)*exp(ldf)^iota_L = gamma*exp(prefc)/(exp(cff) -epsilon*exp(cff(-1))/exp(e_tech)) * exp(wdf);
(1-alpha_s)^(-iota_L)*exp(lf_s)^(phi-iota_L)*exp(ldf_s)^iota_L = gamma_s*exp(prefc_s)/(exp(cff_s) -epsilon*exp(cff_s(-1))/exp(e_tech)) * exp(wdf_s);

//43-44 production non-durable sector
exp(ycf) = exp(techc)*exp(lcf_tot);
exp(ycf_s) = exp(techc_s)*exp(lcf_s_tot);

//45-46 production durable sector
exp(ydf) = exp(techd)*exp(ldf_tot);
exp(ydf_s) = exp(techd_s)*exp(ldf_s_tot);

//51-52 total consumption
exp(cff_tot) = lambda*exp(cff) + (1-lambda)*exp(cff_borr);
exp(cff_s_tot) = lambda*exp(cff_s) + (1-lambda)*exp(cff_s_borr);

//61-62 marginal costs non-durable sector
exp(wcf)/exp(techc)=(sigma-1)/sigma;
exp(wcf_s)/exp(techc_s)=(sigma-1)/sigma;

//73-74 marginal costs durable sector
exp(wdf)/exp(techd)/exp(qf)=(sigma-1)/sigma;
exp(wdf_s)/exp(techd_s)/exp(qf_s)=(sigma-1)/sigma;

//85-86 market clearing non-durable sector
n*exp(ycf) = n*tau*exp(cff_tot) +(1-n)*(1-tau_s)*exp(cff_s_tot);
(1-n)*exp(ycf_s) = n*(1-tau)*exp(cff_tot) +(1-n)*tau_s*exp(cff_s_tot);

//87-88 market clearing durable sector
exp(ydf) =  lambda*exp(invf) +(1-lambda)*exp(invf_borr);
exp(ydf_s) = lambda*exp(invf_s) +(1-lambda)*exp(invf_s_borr);

//89-90  law of motion housing stock borrowers
exp(df_borr)*exp(e_tech) = (1-delta)*exp(df_borr(-1)) +exp(invf_borr(-1)) -(psi/2)*(exp(invf_borr(-1))*exp(e_tech(-1))/exp(invf_borr(-2)) -1)^2 *exp(invf_borr(-1));
exp(df_s_borr)*exp(e_tech) = (1-delta)*exp(df_s_borr(-1)) +exp(invf_s_borr(-1)) -(psi/2)*(exp(invf_s_borr(-1))*exp(e_tech(-1))/exp(invf_s_borr(-2)) -1)^2 *exp(invf_s_borr(-1));

//91-92  law of motion housing stock savers
exp(df)*exp(e_tech) = (1-delta)*exp(df(-1)) +exp(invf(-1)) -(psi/2)*(exp(invf(-1))*exp(e_tech(-1))/exp(invf(-2)) -1)^2 *exp(invf(-1));
exp(df_s)*exp(e_tech) = (1-delta)*exp(df_s(-1)) +exp(invf_s(-1)) -(psi/2)*(exp(invf_s(-1))*exp(e_tech(-1))/exp(invf_s(-2)) -1)^2 *exp(invf_s(-1));

//93-94 total hours worked borrowers
exp(lf_borr) = (alpha^(-iota_L)*exp(lcf_borr)^(1+iota_L) +(1-alpha)^(-iota_L)*exp(ldf_borr)^(1+iota_L))^(1/(1+iota_L));
exp(lf_s_borr) = (alpha_s^(-iota_L)*exp(lcf_s_borr)^(1+iota_L) +(1-alpha_s)^(-iota_L)*exp(ldf_s_borr)^(1+iota_L))^(1/(1+iota_L));

//95-96 total hours worked savers
exp(lf) = (alpha^(-iota_L)*exp(lcf)^(1+iota_L) +(1-alpha)^(-iota_L)*exp(ldf)^(1+iota_L))^(1/(1+iota_L));
exp(lf_s) = (alpha_s^(-iota_L)*exp(lcf_s)^(1+iota_L) +(1-alpha_s)^(-iota_L)*exp(ldf_s)^(1+iota_L))^(1/(1+iota_L));

//97-98 total hours non-durable sector
exp(lcf_tot) = lambda*exp(lcf) + (1-lambda)*exp(lcf_borr);
exp(lcf_s_tot) = lambda*exp(lcf_s) + (1-lambda)*exp(lcf_s_borr);

//99-100 total hours durable sector
exp(ldf_tot) = lambda*exp(ldf) + (1-lambda)*exp(ldf_borr);
exp(ldf_s_tot) = lambda*exp(ldf_s) + (1-lambda)*exp(ldf_s_borr);

//101-103 total output
exp(yf) = exp(ycf) +exp(ydf)*exp(qf);
exp(yf_s) = exp(ycf_s) +exp(ydf_s)*exp(qf_s);
exp(y_emuf) = n*exp(yf) +(1-n)*exp(yf_s);


//******* The original code
//***********************************************************************
//1-2 investment decision borrowers
gamma*exp(prefc)/(exp(c_borr)-epsilon_borr*exp(c_borr(-1))/exp(e_tech)) * exp(q) = beta_borr*exp(varrho_borr(1))*(1 -psi/2*(exp(inv_borr)*exp(e_tech)/exp(inv_borr(-1))-1)^2 -psi*(exp(inv_borr)*exp(e_tech)/exp(inv_borr(-1))-1)*exp(inv_borr)*exp(e_tech)/exp(inv_borr(-1))) + beta_borr^2*exp(varrho_borr(2))*psi*(exp(inv_borr(1))/exp(inv_borr)-1)*(exp(inv_borr(1))/exp(inv_borr))^2;
gamma_s*exp(prefc_s)/(exp(c_s_borr)-epsilon_borr*exp(c_s_borr(-1))/exp(e_tech)) * exp(q_s) = beta_borr*exp(varrho_s_borr(1))*(1 -psi/2*(exp(inv_s_borr)*exp(e_tech)/exp(inv_s_borr(-1))-1)^2 -psi*(exp(inv_s_borr)*exp(e_tech)/exp(inv_s_borr(-1))-1)*exp(inv_s_borr)*exp(e_tech)/exp(inv_s_borr(-1))) + beta_borr^2*exp(varrho_s_borr(2))*psi*(exp(inv_s_borr(1))/exp(inv_s_borr)-1)*(exp(inv_s_borr(1))/exp(inv_s_borr))^2;

//3-4 demand durable consumption borrowers
(1-gamma)*exp(prefd)/exp(d_borr) = exp(varrho_borr) -beta_borr*(1-delta)*exp(varrho_borr(1));
(1-gamma_s)*exp(prefd_s)/exp(d_s_borr) = exp(varrho_s_borr) -beta_borr*(1-delta)*exp(varrho_s_borr(1));

//5-6 definition relative prices
exp(q)/exp(q(-1)) = exp(dpd)/exp(dpc);
exp(q_s)/exp(q_s(-1)) = exp(dpd_s)/exp(dpc_s);

//7-8 Euler equation borrowers
1 = beta_borr*((1-exp(Fa))*exp(rl)+exp(rd(1))) * exp(dpc(1))^(-1) * exp(prefc(1))/exp(prefc) * (exp(c_borr) -epsilon_borr*exp(c_borr(-1))/exp(e_tech))/(exp(c_borr(1)) -epsilon_borr*exp(c_borr));
1 = beta_borr*((1-exp(Fa_s))*exp(rl_s)+exp(rd_s(1))) * exp(dpc_s(1))^(-1) * exp(prefc_s(1))/exp(prefc_s) * (exp(c_s_borr) -epsilon_borr*exp(c_s_borr(-1))/exp(e_tech))/(exp(c_s_borr(1)) -epsilon_borr*exp(c_s_borr));

//9-10 labor supply to non-durable sector borrowers
alpha^(-iota_L)*exp(l_borr)^(phi-iota_L)*exp(lc_borr)^iota_L = gamma*exp(prefc)/(exp(c_borr) -epsilon_borr*exp(c_borr(-1))/exp(e_tech)) * exp(wc);
alpha_s^(-iota_L)*exp(l_s_borr)^(phi-iota_L)*exp(lc_s_borr)^iota_L = gamma_s*exp(prefc_s)/(exp(c_s_borr) -epsilon_borr*exp(c_s_borr(-1))/exp(e_tech)) * exp(wc_s);

//11-12 labor supply to durable sector borrowers
(1-alpha)^(-iota_L)*exp(l_borr)^(phi-iota_L)*exp(ld_borr)^iota_L = gamma*exp(prefc)/(exp(c_borr) -epsilon_borr*exp(c_borr(-1))/exp(e_tech)) * exp(wd);
(1-alpha_s)^(-iota_L)*exp(l_s_borr)^(phi-iota_L)*exp(ld_s_borr)^iota_L = gamma_s*exp(prefc_s)/(exp(c_s_borr) -epsilon_borr*exp(c_s_borr(-1))/exp(e_tech)) * exp(wd_s);

//13-14 participation constraint financial intermediaries
exp(eta)*exp(r) = exp(return_default(1)) +exp(return_nondefault(1));
exp(eta_s)*exp(r_s) = exp(return_default_s(1)) +exp(return_nondefault_s(1));

//15-16 foreclosure settlement (as percent of outstanding credit)
exp(return_default) = (1-mu)*exp(Gp)*exp(q)*exp(d_borr)*exp(dpc)*exp(e_tech)/exp(s_borr(-1));
exp(return_default_s) = (1-mu)*exp(Gp_s)*exp(q_s)*exp(d_s_borr)*exp(dpc_s)*exp(e_tech)/exp(s_s_borr(-1));

//17-18 repayment performing credit
exp(return_nondefault) = (1-exp(Fp))*exp(rl(-1));
exp(return_nondefault_s) = (1-exp(Fp_s))*exp(rl_s(-1));

//19-20 average interest rates of those who default
exp(rd) = exp(Gp)*exp(q)*exp(d_borr)*exp(dpc)*exp(e_tech)/exp(s_borr(-1));
exp(rd_s) = exp(Gp_s)*exp(q_s)*exp(d_s_borr)*exp(dpc_s)*exp(e_tech)/exp(s_s_borr(-1));

//21-22 Ex-ante and ex-post omega's
exp(omegaa) = exp(rl)*exp(s_borr)/(exp(q(1))*exp(d_borr(1))*exp(dpc(1)));
exp(omegaa_s) = exp(rl_s)*exp(s_s_borr)/(exp(q_s(1))*exp(d_s_borr(1))*exp(dpc_s(1)));
exp(omegap) = exp(rl(-1))*exp(s_borr(-1))/(exp(q)*exp(d_borr)*exp(dpc)*exp(e_tech));
exp(omegap_s) = exp(rl_s(-1))*exp(s_s_borr(-1))/(exp(q_s)*exp(d_s_borr)*exp(dpc_s)*exp(e_tech));

//23-26 definition F
exp(Fa) = logncdf(exp(omegaa),-0.5*(exp(risk))^2,exp(risk));
exp(Fp) = logncdf(exp(omegap),-0.5*(exp(risk(-1)))^2,exp(risk(-1)));
exp(Fa_s) = logncdf(exp(omegaa_s),-0.5*(exp(risk_s))^2,exp(risk_s));
exp(Fp_s) = logncdf(exp(omegap_s),-0.5*(exp(risk_s(-1)))^2,exp(risk_s(-1)));

//27-30 definition G
exp(Ga) = 1- normcdf((0.5*(exp(risk))^2 -log(exp(omegaa)))/exp(risk),0,1);
exp(Gp) = 1- normcdf((0.5*(exp(risk(-1)))^2 -log(exp(omegap)))/exp(risk(-1)),0,1);
exp(Ga_s) = 1- normcdf((0.5*(exp(risk_s))^2 -log(exp(omegaa_s)))/exp(risk_s),0,1);
exp(Gp_s) = 1- normcdf((0.5*(exp(risk_s(-1)))^2 -log(exp(omegap_s)))/exp(risk_s(-1)),0,1);

//31-32 budget constraint borrowers
exp(c_borr) +exp(q)*exp(inv_borr) +(exp(rd) +(1-exp(Fp))*exp(rl(-1)))*exp(s_borr(-1))/exp(dpc)/exp(e_tech) = exp(s_borr) + exp(wc)*exp(lc_borr) + exp(wd)*exp(ld_borr);
exp(c_s_borr) +exp(q_s)*exp(inv_s_borr) +(exp(rd_s) +(1-exp(Fp_s))*exp(rl_s(-1)))*exp(s_s_borr(-1))/exp(dpc_s)/exp(e_tech) = exp(s_s_borr) + exp(wc_s)*exp(lc_s_borr) + exp(wd_s)*exp(ld_s_borr);

//33-34 investment decision savers
gamma*exp(prefc)/(exp(c)-epsilon*exp(c(-1))/exp(e_tech)) * exp(q) = beta*exp(varrho(1))*(1 -psi/2*(exp(inv)*exp(e_tech)/exp(inv(-1))-1)^2 -psi*(exp(inv)*exp(e_tech)/exp(inv(-1))-1)*exp(inv)*exp(e_tech)/exp(inv(-1))) + beta^2*exp(varrho(2))*psi*(exp(inv(1))/exp(inv)-1)*(exp(inv(1))/exp(inv))^2;
gamma_s*exp(prefc_s)/(exp(c_s)-epsilon*exp(c_s(-1))/exp(e_tech)) * exp(q_s) = beta*exp(varrho_s(1))*(1 -psi/2*(exp(inv_s)*exp(e_tech)/exp(inv_s(-1))-1)^2 -psi*(exp(inv_s)*exp(e_tech)/exp(inv_s(-1))-1)*exp(inv_s)*exp(e_tech)/exp(inv_s(-1))) + beta^2*exp(varrho_s(2))*psi*(exp(inv_s(1))/exp(inv_s)-1)*(exp(inv_s(1))/exp(inv_s))^2;

//35-36 demand durable consumption savers
(1-gamma)*exp(prefd)/exp(d) = exp(varrho) -beta*(1-delta)*exp(varrho(1));
(1-gamma_s)*exp(prefd_s)/exp(d_s) = exp(varrho_s) -beta*(1-delta)*exp(varrho_s(1));

//37-38 Euler equation savers
1 = beta*exp(r) * exp(dpc(1))^(-1) * exp(prefc(1))/exp(prefc) * (exp(c) -epsilon*exp(c(-1))/exp(e_tech))/(exp(c(1)) -epsilon*exp(c));
1 = beta* exp(r_s) * exp(dpc_s(1))^(-1) * exp(prefc_s(1))/exp(prefc_s) * (exp(c_s) -epsilon*exp(c_s(-1))/exp(e_tech))/(exp(c_s(1)) -epsilon*exp(c_s));

//39-40 labor supply to non-durable sector savers
alpha^(-iota_L)*exp(l)^(phi-iota_L)*exp(lc)^iota_L = gamma*exp(prefc)/(exp(c) -epsilon*exp(c(-1))/exp(e_tech)) * exp(wc);
alpha_s^(-iota_L)*exp(l_s)^(phi-iota_L)*exp(lc_s)^iota_L = gamma_s*exp(prefc_s)/(exp(c_s) -epsilon*exp(c_s(-1))/exp(e_tech)) * exp(wc_s);

//41-42 labor supply to durable sector savers
(1-alpha)^(-iota_L)*exp(l)^(phi-iota_L)*exp(ld)^iota_L = gamma*exp(prefc)/(exp(c) -epsilon*exp(c(-1))/exp(e_tech)) * exp(wd);
(1-alpha_s)^(-iota_L)*exp(l_s)^(phi-iota_L)*exp(ld_s)^iota_L = gamma_s*exp(prefc_s)/(exp(c_s) -epsilon*exp(c_s(-1))/exp(e_tech)) * exp(wd_s);

//43-44 production non-durable sector
exp(yctilde) = exp(techc)*exp(lc_tot);
exp(yctilde_s) = exp(techc_s)*exp(lc_s_tot);

//45-46 production durable sector
exp(ydtilde) = exp(techd)*exp(ld_tot);
exp(ydtilde_s) = exp(techd_s)*exp(ld_s_tot);

//47-48 consumption domestic goods
exp(ch) = tau*(1/(tau +(1-tau)*exp(terms)^(1-iota_C)))^(-iota_C/(1-iota_C)) *exp(c_tot);
exp(cf) = (1-tau)*(1/(tau*exp(terms)^(-(1-iota_C)) +(1-tau)))^(-iota_C/(1-iota_C)) *exp(c_tot);

//49-50 consumption foreign goods
exp(cf_s) = tau_s*(1/(tau_s +(1-tau_s)*exp(terms)^(-(1-iota_C))))^(-iota_C/(1-iota_C)) *exp(c_s_tot);
exp(ch_s) = (1-tau_s)*(1/(tau_s*exp(terms)^(1-iota_C) +(1-tau_s)))^(-iota_C/(1-iota_C)) *exp(c_s_tot);

//51-52 total consumption
exp(c_tot) = lambda*exp(c) + (1-lambda)*exp(c_borr);
exp(c_s_tot) = lambda*exp(c_s) + (1-lambda)*exp(c_s_borr);

//53-58 price setting non-durable sector
sigma/(sigma-1) * exp(XC1) = exp(XC2);
exp(XC1) = exp(mautil)*exp(mcc)*exp(yc) +beta*theta_c*(exp(dph)^phi_c/exp(dph(1)))^(-sigma) *exp(XC1(1));
exp(XC2) = exp(mautil)*exp(phtilde)*exp(yc) +beta*theta_c*(exp(dph)^phi_c/exp(dph(1)))^(1-sigma) *exp(phtilde)/exp(phtilde(1)) *exp(XC2(1));

sigma/(sigma-1) * exp(XC1_s) = exp(XC2_s);
exp(XC1_s) = exp(mautil_s)*exp(mcc_s)*exp(yc_s) +beta*theta_c_s*(exp(dpf)^phi_c_s/exp(dpf(1)))^(-sigma) *exp(XC1_s(1));
exp(XC2_s) = exp(mautil_s)*exp(pftilde)*exp(yc_s) +beta*theta_c_s*(exp(dpf)^phi_c_s/exp(dpf(1)))^(1-sigma) *exp(pftilde)/exp(pftilde(1)) *exp(XC2_s(1));

//59-60 marginal utility
exp(mautil) = exp(prefc)/(exp(c)-epsilon*exp(c(-1))/exp(e_tech));
exp(mautil_s) = exp(prefc_s)/(exp(c_s)-epsilon*exp(c_s(-1))/exp(e_tech));

//61-62 marginal costs non-durable sector
exp(mcc) = exp(wc)/exp(techc)*((tau +(1-tau)*exp(terms)^(1-iota_C)))^(1/(1-iota_C));
exp(mcc_s) = exp(wc_s)/exp(techc_s)*((tau_s +(1-tau_s)*exp(terms)^(-(1-iota_C))))^(1/(1-iota_C));

//63-64 price dynamics in the non-durable sector
1 = theta_c*(exp(dph(-1))^phi_c/exp(dph))^(1-sigma) +(1-theta_c)*exp(phtilde)^(1-sigma);
1 = theta_c_s*(exp(dpf(-1))^phi_c_s/exp(dpf))^(1-sigma) +(1-theta_c_s)*exp(pftilde)^(1-sigma);

//65-66 price dispersion in the non-durable sector
exp(vc) = theta_c*(exp(dph(-1))^phi_c/exp(dph))^(-sigma) *exp(vc(-1)) +(1-theta_c)*exp(phtilde)^(-sigma);
exp(vc_s) = theta_c_s*(exp(dpf(-1))^phi_c_s/exp(dpf))^(-sigma) *exp(vc_s(-1)) +(1-theta_c_s)*exp(pftilde)^(-sigma);

//67-72 price setting durable sector
sigma/(sigma-1) * exp(XD1) = exp(XD2);
exp(XD1) = exp(mautil)*exp(mcd)*exp(yd) +beta*theta_d*(exp(dpd)^phi_d/exp(dpd(1)))^(-sigma) *exp(XD1(1));
exp(XD2) = exp(mautil)*exp(pdtilde)*exp(yd) +beta*theta_d*(exp(dpd)^phi_d/exp(dpd(1)))^(1-sigma) *exp(pdtilde)/exp(pdtilde(1)) *exp(XD2(1));

sigma/(sigma-1) * exp(XD1_s) = exp(XD2_s);
exp(XD1_s) = exp(mautil_s)*exp(mcd_s)*exp(yd_s) +beta*theta_d_s*(exp(dpd_s)^phi_d_s/exp(dpd_s(1)))^(-sigma) *exp(XD1_s(1));
exp(XD2_s) = exp(mautil_s)*exp(pdtilde_s)*exp(yd_s) +beta*theta_d_s*(exp(dpd_s)^phi_d_s/exp(dpd_s(1)))^(1-sigma) *exp(pdtilde_s)/exp(pdtilde_s(1)) *exp(XD2_s(1));

//73-74 marginal costs non-durable sector
exp(mcd) = exp(wd)/exp(techd)/exp(q);
exp(mcd_s) = exp(wd_s)/exp(techd_s)/exp(q_s);

//75-76 price dynamics in the non-durable sector
1 = theta_d*(exp(dpd(-1))^phi_d/exp(dpd))^(1-sigma) +(1-theta_d)*exp(pdtilde)^(1-sigma);
1 = theta_d_s*(exp(dpd_s(-1))^phi_d_s/exp(dpd_s))^(1-sigma) +(1-theta_d_s)*exp(pdtilde_s)^(1-sigma);

//77-78 price dispersion in the non-durable sector
exp(vd) = theta_d*(exp(dpd(-1))^phi_d/exp(dpd))^(-sigma) *exp(vd(-1)) +(1-theta_d)*exp(pdtilde)^(-sigma);
exp(vd_s) = theta_d_s*(exp(dpd_s(-1))^phi_d_s/exp(dpd_s))^(-sigma) *exp(vd_s(-1)) +(1-theta_d_s)*exp(pdtilde_s)^(-sigma);

//79-80 output loss due to price dispersion in the non-durable sector
exp(yc) = exp(yctilde)/exp(vc);
exp(yc_s) = exp(yctilde_s)/exp(vc_s);

//81-82 output loss due to price dispersion in the durable sector
exp(yd) = exp(ydtilde)/exp(vd);
exp(yd_s) = exp(ydtilde_s)/exp(vd_s);

//83-84 CPI inflation
exp(dpc)^(1-iota_C) = exp(dph)^(1-iota_C)*(tau +(1-tau)*exp(terms)^(1-iota_C))/(tau +(1-tau)*exp(terms(-1))^(1-iota_C));
exp(dpc_s)^(1-iota_C) = exp(dpf)^(1-iota_C)*(tau_s +(1-tau_s)*exp(terms)^(-(1-iota_C)))/(tau_s +(1-tau_s)*exp(terms(-1))^(-(1-iota_C)));

//85-86 market clearing non-durable sector
n*exp(yc) = n*exp(ch) +(1-n)*exp(ch_s);
(1-n)*exp(yc_s) = n*exp(cf) +(1-n)*exp(cf_s);

//87-88 market clearing durable sector
exp(yd) = lambda*exp(inv) +(1-lambda)*exp(inv_borr);
exp(yd_s) = lambda*exp(inv_s) +(1-lambda)*exp(inv_s_borr);

//89-90  law of motion housing stock borrowers
exp(d_borr)*exp(e_tech) = (1-delta)*exp(d_borr(-1)) +exp(inv_borr(-1)) -(psi/2)*(exp(inv_borr(-1))*exp(e_tech(-1))/exp(inv_borr(-2)) -1)^2 *exp(inv_borr(-1));
exp(d_s_borr)*exp(e_tech) = (1-delta)*exp(d_s_borr(-1)) +exp(inv_s_borr(-1)) -(psi/2)*(exp(inv_s_borr(-1))*exp(e_tech(-1))/exp(inv_s_borr(-2)) -1)^2 *exp(inv_s_borr(-1));

//91-92  law of motion housing stock savers
exp(d)*exp(e_tech) = (1-delta)*exp(d(-1)) +exp(inv(-1)) -(psi/2)*(exp(inv(-1))*exp(e_tech(-1))/exp(inv(-2)) -1)^2 *exp(inv(-1));
exp(d_s)*exp(e_tech) = (1-delta)*exp(d_s(-1)) +exp(inv_s(-1)) -(psi/2)*(exp(inv_s(-1))*exp(e_tech(-1))/exp(inv_s(-2)) -1)^2 *exp(inv_s(-1));

//93-94 total hours worked borrowers
exp(l_borr) = (alpha^(-iota_L)*exp(lc_borr)^(1+iota_L) +(1-alpha)^(-iota_L)*exp(ld_borr)^(1+iota_L))^(1/(1+iota_L));
exp(l_s_borr) = (alpha_s^(-iota_L)*exp(lc_s_borr)^(1+iota_L) +(1-alpha_s)^(-iota_L)*exp(ld_s_borr)^(1+iota_L))^(1/(1+iota_L));

//95-96 total hours worked savers
exp(l) = (alpha^(-iota_L)*exp(lc)^(1+iota_L) +(1-alpha)^(-iota_L)*exp(ld)^(1+iota_L))^(1/(1+iota_L));
exp(l_s) = (alpha_s^(-iota_L)*exp(lc_s)^(1+iota_L) +(1-alpha_s)^(-iota_L)*exp(ld_s)^(1+iota_L))^(1/(1+iota_L));

//97-98 total hours non-durable sector
exp(lc_tot) = lambda*exp(lc) + (1-lambda)*exp(lc_borr);
exp(lc_s_tot) = lambda*exp(lc_s) + (1-lambda)*exp(lc_s_borr);

//99-100 total hours durable sector
exp(ld_tot) = lambda*exp(ld) + (1-lambda)*exp(ld_borr);
exp(ld_s_tot) = lambda*exp(ld_s) + (1-lambda)*exp(ld_s_borr);

//101-103 total output
exp(y) = exp(yc) +exp(yd)*exp(q);
exp(y_s) = exp(yc_s) +exp(yd_s)*exp(q_s);
exp(y_emu) = n*exp(y) +(1-n)*exp(y_s);

//Other definitions
//104  terms of trade
exp(terms)/exp(terms(-1)) = exp(dpf)/exp(dph);

//105 euro-area CPI inflation
exp(dpemu) = exp(dpc)^n *exp(dpc_s)^(1-n);

//106 Taylor rule
//exp(r) = (1/beta)^(1-gamma_r) *(exp(dpemu))^(gamma_pi*(1-gamma_r)) *(exp(y_emu)*exp(e_tech)/exp(y_emu(-1)))^(gamma_y*(1-gamma_r)) *exp(r(-1))^gamma_r*exp(e_m);

//107-108 macroprudential policy rule
exp(eta) = (exp(dpc)*exp(s_borr)*exp(e_tech)/exp(s_borr(-1)))^gamma_eta;
exp(eta_s) = (exp(dpc_s)*exp(s_s_borr)*exp(e_tech)/exp(s_s_borr(-1)))^gamma_eta_s;

//109 UIP condition
exp(r_s) = exp(r) +exp(premium)*exp(kappa_b*b)-1;

//110 evolution of net foreign assets
n*lambda*b = n*lambda*exp(r(-1))*b(-1)/exp(dpc) +(1-n)*(1/(tau +(1-tau)*exp(terms)^(1-iota_C)))^(1/(1-iota_C))*exp(ch_s)/(alpha*L_total_bar) -n*(1/(tau*exp(terms)^(-(1-iota_C)) +(1-tau)))^(1/(1-iota_C)) *exp(cf)/(alpha*L_total_bar);

//111-112 utility borrowers
util_borr = gamma*exp(prefc)*log(exp(c_borr) -epsilon_borr*exp(c_borr(-1))) +(1-gamma)*exp(prefd)*log(exp(d_borr)) -(exp(l_borr))^(1+phi)/(1+phi);
util_s_borr = gamma_s*exp(prefc_s)*log(exp(c_s_borr) -epsilon_borr*exp(c_s_borr(-1))) +(1-gamma_s)*exp(prefd_s)*log(exp(d_s_borr)) -(exp(l_s_borr))^(1+phi)/(1+phi);

//113-114 utility savers
util = gamma*exp(prefc)*log(exp(c) -epsilon*exp(c(-1))) +(1-gamma)*exp(prefd)*log(exp(d)) -(exp(l))^(1+phi)/(1+phi);
util_s = gamma_s*exp(prefc_s)*log(exp(c_s) -epsilon*exp(c_s(-1))) +(1-gamma_s)*exp(prefd_s)*log(exp(d_s)) -(exp(l_s))^(1+phi)/(1+phi);

//115-116 Welfare borrowers
welf_borr = util_borr +beta_borr*welf_borr(1);
welf_s_borr = util_s_borr +beta_borr*welf_s_borr(1);

//117-118 Welfare savers
welf = util +beta*welf(1);
welf_s = util_s +beta*welf_s(1);

//119-121 welfare core, periphery, euro area
welf_cor = lambda*welf +(1-lambda)*welf_borr;
welf_per = lambda*welf_s +(1-lambda)*welf_s_borr;
welf_emu = n*welf_cor +(1-n)*welf_per;

//additional variables
//exp(spread) = exp(rl)/exp(r);
//exp(spread_s) = exp(rl_s)/exp(r_s);
//exp(spread_int) = exp(r_s)/exp(r);
//exp(CtoY) = exp(s_borr)/exp(y);
//exp(CtoY_s) = exp(s_s_borr)/exp(y_s);


//Shocks
//1
premium = rho_premium*premium(-1) + e_premium;

//2
risk = (1-rho_risk)*log(sigma_bar) + rho_risk*risk(-1) + e_risk;

//3
//risk_s = (1-rho_risk)*log(sigma_bar) + rho_risk*risk_s(-1) + e_risk_s;
risk_s = (1-rho_risk)*log(sigma_bar) + rho_risk*risk_s(-1) - e_risk_s;

//4
prefd = rho_prefd*prefd(-1) + e_prefd +e_prefd_com;

//5
prefd_s = rho_prefd*prefd_s(-1) + e_prefd_s +e_prefd_com;

//6
prefc = rho_prefc*prefc(-1) + e_prefc;

//7
prefc_s = rho_prefc*prefc_s(-1) + e_prefc_s;

//8
techc = rho_techc*techc(-1) + e_techc +e_techc_com;

//9
techd = rho_techd*techd(-1) + e_techd;

//10
techc_s = rho_techc*techc_s(-1) + e_techc_s +e_techc_com;

//11
techd_s = rho_techd*techd_s(-1) + e_techd_s;

end;


initval;
q = log(1);
c = log(C_bar);
d = log(D_bar);
c_borr = log(C_borr_bar);
d_borr = log(D_borr_bar);
dpd = log(1);
dpc = log(1);
dph = log(1);
lc_tot = log(alpha*L_total_bar);
ld_tot = log((1-alpha)*L_total_bar);
l = log(L_bar);
l_borr = log(L_borr_bar);
lc = log(alpha*L_bar);
ld = log((1-alpha)*L_bar);
lc_borr = log(alpha*L_borr_bar);
ld_borr = log((1-alpha)*L_borr_bar);
wc = log(W_bar);
wd = log(W_bar);
yc = log(alpha*L_total_bar);
yd = log((1-alpha)*L_total_bar);
varrho = log(gamma/(beta*(1-epsilon)*C_bar));
inv = log(delta*D_bar);
varrho_borr = log(gamma/(beta_borr*(1-epsilon_borr)*C_borr_bar));
inv_borr = log(delta*D_borr_bar);
ch = log(tau*(lambda*C_bar+(1-lambda)*C_borr_bar));
cf = log((1-tau)*(lambda*C_bar+(1-lambda)*C_borr_bar));
c_tot = log(lambda*C_bar+(1-lambda)*C_borr_bar);
s_borr = log(S_borr_bar);
y = log(L_total_bar);

q_s = log(1);
c_s = log(C_s_bar);
d_s = log(D_s_bar);
c_s_borr = log(C_s_borr_bar);
d_s_borr = log(D_s_borr_bar);
dpd_s = log(1);
dpc_s = log(1);
dpf = log(1);
lc_s_tot = log(alpha_s*L_s_total_bar);
ld_s_tot = log((1-alpha_s)*L_s_total_bar);
l_s = log(L_s_bar);
l_s_borr = log(L_s_borr_bar);
lc_s = log(alpha_s*L_s_bar);
ld_s = log((1-alpha_s)*L_s_bar);
lc_s_borr = log(alpha_s*L_s_borr_bar);
ld_s_borr = log((1-alpha_s)*L_s_borr_bar);
wc_s = log(W_bar);
wd_s = log(W_bar);
yc_s = log(alpha_s*L_s_total_bar);
yd_s = log((1-alpha_s)*L_s_total_bar);
varrho_s = log(gamma_s/(beta*(1-epsilon)*C_s_bar));
inv_s = log(delta*D_s_bar);
varrho_s_borr = log(gamma_s/(beta_borr*(1-epsilon_borr)*C_s_borr_bar));
inv_s_borr = log(delta*D_s_borr_bar);
ch_s = log((1-tau_s)*(lambda*C_s_bar+(1-lambda)*C_s_borr_bar));
cf_s = log(tau_s*(lambda*C_s_bar+(1-lambda)*C_s_borr_bar));
c_s_tot = log(lambda*C_s_bar+(1-lambda)*C_s_borr_bar);
s_s_borr = log(S_s_borr_bar);
y_s = log(L_s_total_bar);

r = log(RR_bar);
r_s = log(RR_bar);
omegaa = log(1-chi);
omegaa_s = log(1-chi);
omegap = log(1-chi);
omegap_s = log(1-chi);
Fa = log(F_bar);
Fa_s = log(F_bar);
Fp = log(F_bar);
Fp_s = log(F_bar);
Ga = log(G_bar);
Ga_s = log(G_bar);
Gp = log(G_bar);
Gp_s =log(G_bar);
terms = log(1);
dpemu = log(1);
y_emu = log(L_total_bar);
b = log(1);
rl = log(RL_bar);
rl_s = log(RL_s_bar);
rd = log(RD_bar);
rd_s = log(RD_bar);
risk = log(sigma_bar);
risk_s = log(sigma_bar);

XC1 = log(W_bar*alpha*L_total_bar/((1-epsilon)*C_bar*(1-theta_c*beta)));
XC2 = log(alpha*L_total_bar/((1-epsilon)*C_bar*(1-theta_c*beta)));
XC1_s = log(W_bar*alpha_s*L_s_total_bar/((1-epsilon)*C_s_bar*(1-theta_c_s*beta)));
XC2_s = log(alpha_s*L_s_total_bar/((1-epsilon)*C_s_bar*(1-theta_c_s*beta)));
XD1 = log(W_bar*(1-alpha)*L_total_bar/((1-epsilon)*C_bar*(1-theta_d*beta)));
XD2 = log((1-alpha)*L_total_bar/((1-epsilon)*C_bar*(1-theta_d*beta)));
XD1_s = log(W_bar*(1-alpha_s)*L_s_total_bar/((1-epsilon)*C_s_bar*(1-theta_d_s*beta)));
XD2_s = log((1-alpha_s)*L_s_total_bar/((1-epsilon)*C_s_bar*(1-theta_d_s*beta)));
yctilde = log(alpha*L_total_bar);
yctilde_s = log(alpha_s*L_s_total_bar);
ydtilde = log((1-alpha)*L_total_bar);
ydtilde_s = log((1-alpha_s)*L_s_total_bar);
mcc = log(W_bar);
mcc_s = log(W_bar);
mcd = log(W_bar);
mcd_s = log(W_bar);
mautil = log(1/((1-epsilon)*C_bar));
mautil_s = log(1/((1-epsilon)*C_s_bar));
phtilde = log(1);
pftilde = log(1);
pdtilde = log(1);
pdtilde_s = log(1);
vc = log(1);
vc_s = log(1);
vd = log(1);
vd_s = log(1);

return_default = log((1-mu)*G_bar*D_borr_bar/S_borr_bar);
return_nondefault = log((1-F_bar)*RL_bar);
return_default_s = log((1-mu)*G_bar*D_s_borr_bar/S_s_borr_bar);
return_nondefault_s = log((1-F_bar)*RL_s_bar);

util = gamma*log((1-epsilon)*C_bar) +(1-gamma)*log(D_bar) -(L_bar)^(1+phi)/(1+phi);
util_borr = gamma*log((1-epsilon_borr)*C_borr_bar) +(1-gamma)*log(D_borr_bar) -(L_borr_bar)^(1+phi)/(1+phi);
welf = (gamma*log((1-epsilon)*C_bar) +(1-gamma)*log(D_bar) -(L_bar)^(1+phi)/(1+phi))/(1-beta);
welf_borr = (gamma*log((1-epsilon_borr)*C_borr_bar) +(1-gamma)*log(D_borr_bar) -(L_borr_bar)^(1+phi)/(1+phi))/(1-beta_borr);
util_s = gamma_s*log((1-epsilon)*C_s_bar) +(1-gamma_s)*log(D_s_bar) -(L_s_bar)^(1+phi)/(1+phi);
util_s_borr = gamma_s*log((1-epsilon_borr)*C_s_borr_bar) +(1-gamma_s)*log(D_s_borr_bar) -(L_s_borr_bar)^(1+phi)/(1+phi);
welf_s = (gamma_s*log((1-epsilon)*C_s_bar) +(1-gamma_s)*log(D_s_bar) -(L_s_bar)^(1+phi)/(1+phi))/(1-beta);
welf_s_borr = (gamma_s*log((1-epsilon_borr)*C_s_borr_bar) +(1-gamma_s)*log(D_s_borr_bar) -(L_s_borr_bar)^(1+phi)/(1+phi))/(1-beta_borr);
welf_cor = lambda*(gamma*log((1-epsilon)*C_bar) +(1-gamma)*log(D_bar) -(L_bar)^(1+phi)/(1+phi))/(1-beta) +(1-lambda)*(gamma*log((1-epsilon_borr)*C_borr_bar) +(1-gamma)*log(D_borr_bar) -(L_borr_bar)^(1+phi)/(1+phi))/(1-beta_borr);
welf_per = lambda*(gamma_s*log((1-epsilon)*C_s_bar) +(1-gamma_s)*log(D_s_bar) -(L_s_bar)^(1+phi)/(1+phi))/(1-beta) +(1-lambda)*(gamma_s*log((1-epsilon_borr)*C_s_borr_bar) +(1-gamma_s)*log(D_s_borr_bar) -(L_s_borr_bar)^(1+phi)/(1+phi))/(1-beta_borr);
welf_emu = n*(lambda*(gamma*log((1-epsilon)*C_bar) +(1-gamma)*log(D_bar) -(L_bar)^(1+phi)/(1+phi))/(1-beta) +(1-lambda)*(gamma*log((1-epsilon_borr)*C_borr_bar) +(1-gamma)*log(D_borr_bar) -(L_borr_bar)^(1+phi)/(1+phi))/(1-beta_borr)) +(1-n)*(lambda*(gamma_s*log((1-epsilon)*C_s_bar) +(1-gamma_s)*log(D_s_bar) -(L_s_bar)^(1+phi)/(1+phi))/(1-beta) +(1-lambda)*(gamma_s*log((1-epsilon_borr)*C_s_borr_bar) +(1-gamma_s)*log(D_s_borr_bar) -(L_s_borr_bar)^(1+phi)/(1+phi))/(1-beta_borr));

eta = log(1);
eta_s = log(1);

//spread = log(RR_bar/RL_bar);
//spread_s = log(RR_bar/RL_s_bar);
//spread_int = log(1);
//CtoY = log(S_borr_bar/L_total_bar);
//CtoY_s = log(S_s_borr_bar/L_s_total_bar);

cff = log(C_bar);
qf = log(1);
varrhof = log(gamma/(beta*(1-epsilon)*C_bar));
invf = log(delta*D_bar);
df = log(D_bar);
rf = log(RR_bar);
lf = log(L_bar);
lcf = log(alpha*L_bar);
wcf = log(W_bar);
ldf = log((1-alpha)*L_bar);
wdf = log(W_bar);
cff_s = log(C_s_bar);
qf_s = log(1);
varrhof_s = log(gamma_s/(beta*(1-epsilon)*C_s_bar));
invf_s = log(delta*D_s_bar);
df_s = log(D_s_bar);
rf_s = log(RR_bar);
lf_s = log(L_s_bar);
lcf_s = log(alpha_s*L_s_bar);
wcf_s = log(W_bar);
ldf_s = log((1-alpha_s)*L_s_bar);
wdf_s = log(W_bar);
ycf = log(alpha*L_total_bar);
ydf = log((1-alpha)*L_total_bar);
yf  = log(L_total_bar);
y_emuf = log(L_total_bar);
ycf_s = log(alpha_s*L_s_total_bar);
ydf_s = log((1-alpha_s)*L_s_total_bar);
yf_s = log(L_s_total_bar);
cff_borr = log(C_borr_bar);
varrhof_borr = log(gamma/(beta_borr*(1-epsilon_borr)*C_borr_bar));
invf_borr = log(delta*D_borr_bar);
df_borr = log(D_borr_bar);
lf_borr = log(L_borr_bar);
lcf_borr = log(alpha*L_borr_bar);
ldf_borr = log((1-alpha)*L_borr_bar);
sf_borr  = log(S_borr_bar);
lcf_tot = log(alpha*L_total_bar);
ldf_tot = log((1-alpha)*L_total_bar);
cff_tot = log(lambda*C_bar+(1-lambda)*C_borr_bar);
cff_s_borr = log(C_s_borr_bar);
varrhof_s_borr = log(gamma_s/(beta_borr*(1-epsilon_borr)*C_s_borr_bar));
invf_s_borr = log(delta*D_s_borr_bar);
df_s_borr = log(D_s_borr_bar);
lf_s_borr = log(L_s_borr_bar);
lcf_s_borr = log(alpha_s*L_s_borr_bar);
ldf_s_borr = log((1-alpha_s)*L_s_borr_bar);
sf_s_borr = log(S_s_borr_bar);
lcf_s_tot = log(alpha_s*L_s_total_bar);
ldf_s_tot = log((1-alpha_s)*L_s_total_bar);
cff_s_tot = log(lambda*C_s_bar+(1-lambda)*C_s_borr_bar);
rdf = log(RD_bar);
rdf_s = log(RD_bar);
rlf = log(RL_bar);
rlf_s = log(RL_s_bar);
Faf = log(F_bar);
Fpf = log(F_bar);
return_defaultf = log((1-mu)*G_bar*D_borr_bar/S_borr_bar);
return_nondefaultf = log((1-F_bar)*RL_bar);
Gpf = log(G_bar);
Gaf = log(G_bar);
omegaaf = log(1-chi);
omegapf = log(1-chi);
Faf_s = log(F_bar);
Fpf_s = log(F_bar);
return_defaultf_s = log((1-mu)*G_bar*D_s_borr_bar/S_s_borr_bar);
return_nondefaultf_s = log((1-F_bar)*RL_s_bar);
Gpf_s = log(G_bar);
Gaf_s = log(G_bar);
omegaaf_s = log(1-chi);
omegapf_s = log(1-chi);
interest   = 0;
inflation  = 0;
inflationq = 0;
outputgap  = 0;
output     = 0;
end;


%steady;

//check;

shocks;
//var e_m;stderr 0.0012;
var e_risk;stderr 0.1179;
var e_risk_s;stderr 0.2306;
var e_premium;stderr 0.0020;
var e_prefd;stderr 0.0309;
var e_prefd_s;stderr 0.0325;
var e_prefd_com;stderr 0.0146;
var e_prefc;stderr 0.0187;
var e_prefc_s;stderr 0.0141;
var e_techc;stderr 0.0062;
var e_techd;stderr 0.0162;
var e_techc_s;stderr 0.0066;
var e_techc_com;stderr 0.0074;
var e_techd_s;stderr 0.0143;
var e_tech;stderr 0.0083;
end;



//stoch_simul(order=1,nograph,irf=13) y_emuf y y_s dpc dpc_s dpd dpd_s r spread_int spread spread_s CtoY CtoY_s c_tot c c_borr c_s_tot c_s c_s_borr yd inv inv_borr yd_s inv_s inv_s_borr l l_borr l_s l_s_borr;
//stoch_simul(order=2,irf=0) welf_cor welf_per welf_emu;
