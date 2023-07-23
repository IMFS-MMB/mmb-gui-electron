//**************************************************************************
// A New Comparative Approach to Macroeconomic Modeling and Policy Analysis
//
// Volker Wieland, Tobias Cwik, Gernot J. Mueller, Sebastian Schmidt and 
// Maik Wolters
//
// Working Paper, 2009
//**************************************************************************

// Model: US_CMR14

// Further references:
//Christiano, L. J., Motto, R., Rostagno, M., 2014. Risk shocks. 
//American Economic Review 104 (1), 27–65.

// Last edited: 2016/02/24 by M. Kuete 

var c consumption_obs credit_obs epsil Fp Fw g gamma gdp_obs h hours_obs i inflation_obs investment_obs
    kbar lambdaf lambdaz muup muzstar n networth_obs omegabar phi pi pinvest_obs pitarget premium_obs
    pstar q Re Re_obs RealRe_obs rL rk Rk RL s sigma xi0 xi1 xi2 xi3 xi4 xi5 xi6 xi7 xi8 Spread1_obs
    term volEquity u wage_obs wtilde wstar zetac zetai 
    
    log_zetac  log_lambdaz log_term log_pi log_muzstar log_xi0 log_xi1 log_xi2 log_xi3 log_xi4 log_xi5 log_xi6 log_xi7 log_xi8
    
    cf hf i_f kbarf lambdazf nf omegabarf phif qf Ref rLf rkf Rkf RLf sf  volEquityf uf Fwf wtildef Fpf log_lambdazf //
    y ly lc linv lwage lhours lrealRe lrk lu lkbar lq lrborr lnw EFP e_g  
//**************************************************************************
// Modelbase Variables                                                    //*    
      interest inflation inflationq outputgap output fispol;         //*
//**************************************************************************

varexo e_epsil  e_gamma e_lambdaf e_muup e_muzstar e_sigma e_xi1 e_xi2 e_xi3 e_xi4 e_xi5 //e_pitarget
       e_xi6 e_xi7 e_xi8 e_term e_zetac e_zetai
//**************************************************************************
// Modelbase Shocks                                                      //*       
        interest_ fiscal_;                                               //* e_xp 
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

 actil_p adptil_p adytil_p alpha_p aptil_p aytil_p b_p beta_p bigtheta_p c_p delta_p epsil_p etag_p 
           Fomegabar_p g_p gamma_p i_p iota_p iotamu_p iotaw_p lambdaf_p lambdaw_p mu_p muup_p muzstar_p signal_corr_p
           pi_p pibar_p pitarget_p psik_p psil_p psiL_p Re_p rhoepsil_p rhog_p rhogamma_p rholambdaf_p rhomuup_p rhomuzstar_p
           rhopitarget_p rhosigma_p rhoterm_p rhozetac_p rhozetai_p rhotil_p Sdoupr_p sigmaL_p sigma_p sigmaa_p stdepsil_p
           stdg_p stdgamma_p stdlambdaf_p stdmuup_p stdmuzstar_p stdpitarget_p stdsigma1_p stdterm_p stdxp_p stdzetac_p
           stdzetai_p stdsigma2_p tauc_p taud_p tauk_p taul_p tauo_p term_p upsil_p we_p xip_p xiw_p zeta_p zetac_p zetai_p;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 2. Set parameters
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% when stopshock = 1, then non-risk shocks are all turned off
@# define stopshock = 0

% when stopsignal = 1, then signals on risk are turned off
@# define stopsignal = 0

% when stopunant = 1, then unanticipated risk shock turned off
@# define stopunant = 0

% when signal_corr_nonzero = 1, sig_corr_p can be non zero.
@# define signal_corr_nonzero = 1
@#define possible_signals = ["0", "1", "2", "3", "4", "5", "6", "7", "8"]

stdlambdaf_p   =   0.010955960700000  ;  
stdmuup_p      =   0.003985791800000  ;	 
stdg_p         =   0.022812723300000  ;	 
stdmuzstar_p   =   0.007148784800000  ;	 
stdgamma_p     =   0.008103540300000  ;	 
stdepsil_p     =   0.004633811900000  ;	 
stdxp_p        =   0.489344620900000  ;	 
stdzetac_p     =   0.023325355100000  ;	 
stdzetai_p     =   0.054964824400000  ;	 
stdterm_p      =   0.001603753000000  ;	 
xiw_p          =   0.812796311400000  ;	  
b_p            =   0.735843822700000  ;	 
Fomegabar_p    =   0.005588569300000  ;	 
mu_p           =   0.214894511100000  ;	 
sigmaa_p       =   2.535553419500000  ;	 
Sdoupr_p       =  10.780000003400000  ;	 
xip_p          =   0.741218603400000  ;	 
aptil_p        =   2.396495942700000  ;
rhotil_p       =   0.850296450300000  ;	 
iota_p         =   0.897367052100000  ;	 
iotaw_p        =   0.489073535900000  ;	 
iotamu_p       =   0.936565280700000  ;	 
adytil_p       =   0.364943654300000  ; 
signal_corr_p  =   0.3861343781103740 ;	 
rholambdaf_p   =   0.9108528528580380 ;	 
rhomuup_p      =   0.9870257396836700 ;	 
rhog_p         =   0.9427215849959780 ;	 
rhomuzstar_p   =   0.1459051086113400 ;	 
rhoepsil_p     =   0.8089285617540170 ;	 
rhosigma_p     =   0.9706370265612010 ;	 
rhozetac_p     =   0.8968400853887450 ;	 
rhozetai_p     =   0.9086616567125290 ;	 
rhoterm_p      =   0.9743991813961140 ;	 
stdsigma2_p    =   0.0282985295279650 ;//@# if stopsignal == 0 else 0 
stdsigma1_p    =   0.0700061676650730 ;	 
	
		 

// Calibrated parameters.
actil_p           = 0;
adptil_p          = 0;
alpha_p           = 0.4;
aytil_p           = 0;
beta_p            = 0.998704208591811;
bigtheta_p        = 0.005;
c_p               = 1.545858551297361;
delta_p           = 0.025;
epsil_p           = 1;
etag_p            = 0.2043;
g_p               = 0.586751768198739;
gamma_p           = 0.985;
i_p               = 0.739400293322006;
lambdaf_p         = 1.2;
lambdaw_p         = 1.05;
muup_p            = 1;
muzstar_p         = 1.004124413586981;
pi_p              = 1.006010795406775;
pibar_p           = 1.006010795406775;
pitarget_p        = 1.006010795406775;
psik_p            = 0;
psil_p            = 0;
psiL_p            = 0.7705;
Re_p              = 0.011470654984364;
rhogamma_p        = 0;
rhopitarget_p     = 0.975;
sigmaL_p          = 1;
sigma_p           = 0.327545843119697;
stdpitarget_p     = 0.0001;
tauc_p            = 0.047;
taud_p            = 0;
tauk_p            = 0.32;
taul_p            = 0.241;
tauo_p            = 1;
term_p            = 1;
upsil_p           = 1.004223171829000;
we_p              = 0.005;
zeta_p            = 1;
zetac_p           = 1;
zetai_p           = 1;


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
 std_r_=1;                                                                        
// Definition of Discretionary Fiscal Policy Parameter                   //*
coffispol =  1/etag_p;                                                           //*
//**************************************************************************



//---------------------------------------------------------------------
// 3. Model declaration
//---------------------------------------------------------------------


model;
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Auxiliary expressions.  These simplify the equations without adding
% additional variables.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  # pitilde    = (pitarget^iota_p * pi(-1)^(1-iota_p) * pibar_p^(1-iota_p-(1-iota_p)));
  
  # Kp         = (Fp * ((1 - xip_p * (pitilde / pi)^(1/(1-lambdaf))) / (1 - xip_p))^(1-lambdaf));

  # Kpf        = Fpf ;
  
  # rk_ss      = (steady_state(rk));
  
  # a          = (rk_ss * (exp(sigmaa_p * (u - 1)) - 1) / sigmaa_p);

  # af         = (rk_ss * (exp(sigmaa_p * (uf - 1)) - 1) / sigmaa_p);
    
  # F          = (normcdf(((log(omegabar) + sigma(-1)^2 / 2) / sigma(-1))));

  # Ff          = (normcdf(((log(omegabarf) + sigma(-1)^2 / 2) / sigma(-1))));

  # G           = (normcdf((log(omegabar) + sigma(-1)^2 / 2) / sigma(-1) - sigma(-1)));

  # Gf          = (normcdf((log(omegabarf) + sigma(-1)^2 / 2) / sigma(-1) - sigma(-1)));

  # H           = (normcdf((log(omegabar) + sigma(-1)^2 / 2) / sigma(-1) - 2 * sigma(-1)));

  # Hf          = (normcdf((log(omegabarf) + sigma(-1)^2 / 2) / sigma(-1) - 2 * sigma(-1)));              

  # d           = (((G  + omegabar  * (1 - F )) - ((1 - mu_p) * G  + omegabar  * (1 - F ))) * (1 + Rk ) * q(-1)  * kbar(-1)  / (muzstar * pi));

  # df          = (((Gf + omegabarf * (1 - Ff)) - ((1 - mu_p) * Gf + omegabarf * (1 - Ff))) * (1 + Rkf) * qf(-1) * kbarf(-1) / (muzstar*pibar_p));

  # pitildep1   = (pitarget(+1)^iota_p * pi^(1-iota_p) * pibar_p^(1-iota_p-(1-iota_p)));

  # yz          = (pstar^(lambdaf/(lambdaf-1)) * (epsil * (u * kbar(-1) / (muzstar * upsil_p))^alpha_p 
                     * (h * wstar^(lambdaw_p/(lambdaw_p-1)))^(1-alpha_p) - phi));

  # yzf         = ((epsil * (uf * kbarf(-1) / (muzstar * upsil_p))^alpha_p* hf^(1-alpha_p) - phif));

  # Kpp1       = (Fp(+1) * ((1 - xip_p * (pitildep1 / pi(+1))^(1/(1-lambdaf(+1)))) / (1 - xip_p))^(1-lambdaf(+1)));
  # pitildewp1 = (pitarget(+1)^iotaw_p * pi^(1-iotaw_p) * pibar_p^(1-iotaw_p-(1-iotaw_p)));
  # piwp1      = (pi(+1) * muzstar(+1) * wtilde(+1) / wtilde);
  # piw        = (pi * muzstar * wtilde / wtilde(-1));
  # pitildew   = (pitarget^iotaw_p * pi(-1)^(1-iotaw_p) * pibar_p^(1-iotaw_p-(1-iotaw_p)));
  # Kwp1       = (((1 - xiw_p * (pitildewp1 / piwp1 * muzstar_p^(1-iotamu_p) * muzstar(+1)^iotamu_p)^(1/(1-lambdaw_p))) 
                 / (1-xiw_p))^(1-lambdaw_p*(1+sigmaL_p)) * wtilde(+1) * Fw(+1) / psiL_p);

 # Kwp1f       = (wtildef(+1) * Fwf(+1) / psiL_p);


  # Kw         = (((1 - xiw_p * (pitildew / piw * muzstar_p^(1-iotamu_p) * muzstar^iotamu_p)^(1/(1-lambdaw_p))) 
                 / (1 - xiw_p))^(1-lambdaw_p*(1+sigmaL_p)) * wtilde * Fw / psiL_p);

# Kwf         = (wtildef * Fwf / psiL_p);

  # S          = (exp(sqrt(Sdoupr_p / 2)*(zetai * muzstar * upsil_p * i / i(-1) - muzstar_p * upsil_p))
                 + exp(-sqrt(Sdoupr_p / 2) * (zetai * muzstar * upsil_p * i/i(-1) - muzstar_p * upsil_p)) - 2);

  # Sf          = (exp(sqrt(Sdoupr_p / 2)*(zetai * muzstar * upsil_p * i_f / i_f(-1) - muzstar_p * upsil_p))
               + exp(-sqrt(Sdoupr_p / 2) * (zetai * muzstar * upsil_p * i_f/i_f(-1) - muzstar_p * upsil_p)) - 2);

  # Spr        = (sqrt(Sdoupr_p / 2) * (exp(sqrt(Sdoupr_p / 2) * (zetai * muzstar * upsil_p * i / i(-1) - muzstar_p * upsil_p)) 
                 - exp(-sqrt(Sdoupr_p / 2) * (zetai * muzstar * upsil_p * i / i(-1) - muzstar_p * upsil_p))));

  # Sprf        = (sqrt(Sdoupr_p / 2) * (exp(sqrt(Sdoupr_p / 2) * (zetai * muzstar * upsil_p * i_f / i_f(-1) - muzstar_p * upsil_p)) 
                 - exp(-sqrt(Sdoupr_p / 2) * (zetai * muzstar * upsil_p * i_f / i_f(-1) - muzstar_p * upsil_p))));

  # Sprp1      = (sqrt(Sdoupr_p / 2) * (exp(sqrt(Sdoupr_p / 2) * (zetai(+1) * muzstar(+1) * upsil_p * i(+1) / i - muzstar_p * upsil_p)) 
                 - exp(-sqrt(Sdoupr_p / 2) * (zetai(+1) * muzstar(+1) * upsil_p * i(+1) / i - muzstar_p * upsil_p))));

  # Sprp1f      = (sqrt(Sdoupr_p / 2) * (exp(sqrt(Sdoupr_p / 2) * (zetai(+1) * muzstar(+1) * upsil_p * i_f(+1) / i_f - muzstar_p * upsil_p)) 
                 - exp(-sqrt(Sdoupr_p / 2) * (zetai(+1) * muzstar(+1) * upsil_p * i_f(+1) / i_f - muzstar_p * upsil_p))));
  

  # Fp1        = (normcdf((log(omegabar(+1)) + sigma^2 / 2) / sigma));

  # Fp1f        = (normcdf((log(omegabarf(+1)) + sigma^2 / 2) / sigma));

  # Gp1        = (normcdf((log(omegabar(+1)) + sigma^2 / 2) / sigma - sigma));

  # Gp1f        = (normcdf((log(omegabarf(+1)) + sigma^2 / 2) / sigma - sigma));

  # G_ss       = (normcdf((log(steady_state(omegabar)) + steady_state(sigma)^2 / 2) / steady_state(sigma) - steady_state(sigma), 0, 1));

  # G_ssf       = (normcdf((log(steady_state(omegabarf)) + steady_state(sigma)^2 / 2) / steady_state(sigma) - steady_state(sigma), 0, 1));
  

  # Rk_ss      = (steady_state(Rk));
  # kbar_ss    = (steady_state(kbar));
  
  # n_ss       = (steady_state(n));
  # sigma_ss   = (steady_state(sigma));
   
  # h_ss       = (steady_state(h));
  # g_ss       = (etag_p * (steady_state(c) + steady_state(i)) / (1 - etag_p));
  
  # Gammap1    = (omegabar(+1) * (1 - Fp1) + Gp1);
  
  # Gammap1f    = (omegabarf(+1) * (1 - Fp1f) + Gp1f);

  # Gammaprp1  = (1 - Fp1);

  # Gammaprp1f  = (1 - Fp1f);

  # Gprp1       = (omegabar(+1) * normpdf((log(omegabar(+1)) + sigma^2 / 2) / sigma) / omegabar(+1) / sigma);

  # Gprp1f      = (omegabarf(+1) * normpdf((log(omegabarf(+1)) + sigma^2 / 2) / sigma) / omegabarf(+1) / sigma);

//  # y = g + c + i / muup;

  # yf = g + cf + i_f / muup;

//*****************************************************************************
// Definition of Modelbase Variables in Terms of Original Model Variables   //*

  interest   = 1*( (1+Re)^4 - (1+Re_p)^4 )/((1+Re_p)^4);  // 400*(Re - Re_p);//*
  inflationq = 1*(pi^4-pi_p^4)/(pi_p^4);                                     //*
  inflation  = 1/4*(inflationq+inflationq(-1)+inflationq(-2)+inflationq(-3));  //*  
//  output     = (log(yz)-log(steady_state(yz)))*100;                            //*
//  outputgap  = (log(yz)-log(yzf))*100;                                         //* 
  output     = (log(y)-log(steady_state(y)))*1;                              //*
  outputgap  = (log(y)-log(yf))*1;                                           //*  
  fispol     = e_g;                                                            //*
//**************************************************************************


//**************************************************************************
// Policy Rule                                                           //*

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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Equations characterizing equilibrium.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
//*****************************
//Flexible price economy 
//*****************************
   Fpf = zetac *lambdazf * yzf;
    
   Kpf = zetac * lambdaf * lambdazf * yzf * sf; 
    
   Fwf = zetac * lambdazf * hf * (1 - taul_p) / lambdaw_p;
    
   Kwf = zetac * (hf)^(1+sigmaL_p) * zeta_p;  
   
   rkf = alpha_p * epsil * ((upsil_p * muzstar * hf/(uf * kbarf(-1)))^(1 - alpha_p)) * sf;
  
   rkf = tauo_p * rk_ss * exp(sigmaa_p * (uf - 1));
 
    sf = (rkf / alpha_p)^alpha_p * (wtildef / (1 - alpha_p))^(1-alpha_p) / epsil;
 
   yzf = g + cf + i_f / muup + tauo_p * af * kbarf(-1) / (muzstar * upsil_p) + df + bigtheta_p * (1 - gamma) * (nf - we_p) / gamma;
 
 kbarf = (1 - delta_p) * kbarf(-1) / (muzstar * upsil_p) + (1 - Sf) * i_f;
 
     0 = beta_p * zetac(+1) * lambdazf(+1) / (muzstar(+1) * pibar_p) *(1 + (1 - taud_p) * Ref) - zetac * lambdazf;
 
   (1 + tauc_p) * zetac * lambdazf = muzstar * zetac / (cf * muzstar - b_p * cf(-1))    - b_p * beta_p * zetac(+1) / (cf(+1) * muzstar(+1) - b_p * cf);
 
     0 = (1 - Gammap1f) * (1 + Rkf(+1)) / (1 + Ref) + Gammaprp1f / (Gammaprp1f - mu_p * Gprp1f) * ((1 + Rkf(+1)) / (1 + Ref) * (Gammap1f - mu_p * Gp1f) - 1);

1 + Rkf = ((1 - tauk_p) * (uf * rkf - tauo_p * af) + (1 - delta_p) * qf) *pibar_p    / (upsil_p * qf(-1)) + tauk_p * delta_p;
  
    0 = - zetac * lambdazf / muup + lambdazf * zetac * qf * (-Sprf * zetai * i_f * muzstar * upsil_p / i_f(-1) + 1 - Sf)
         + beta_p * zetac(+1) * lambdazf(+1) * qf(+1) * Sprp1f * (zetai(+1) * i_f(+1) * muzstar(+1) * upsil_p / i_f)^2 / (muzstar(+1) * upsil_p);
 
  nf = gamma / (pibar_p*muzstar)      * (Rkf - Ref(-1)-((Gf + omegabarf * (1 - Ff)) - ((1 - mu_p) * Gf + omegabarf * (1 - Ff))) * (1 + Rkf)) 
        * kbarf(-1) * qf(-1) + we_p + gamma * (1 + Ref(-1)) * nf(-1) / (pibar_p* muzstar);
 
     qf(-1) * kbarf(-1) * (1 + Rkf) * ((1 - mu_p) * Gf + omegabarf * (1 - Ff)) / (nf(-1) * (1 + Ref(-1))) - qf(-1) * kbarf(-1) / nf(-1) + 1;

 volEquityf = (1 + Rkf) * qf(-1) * kbarf(-1) / nf(-1) * sqrt( (exp(sigma(-1)^2)/(1-Ff)*(1-Hf) - ((1-Gf)/(1-Ff))^2) );
 

% Long rate
    log_zetac +log_lambdazf  = 40*(log(1 + RLf ) + log(beta_p)) + log_zetac(+40) +log_lambdazf (+40) 
    @#for index in ["+1", "+2", "+3", "+4", "+5", "+6", "+7", "+8", "+9", "+10", "+11", "+12", "+13", "+14", "+15", "+16", "+17", "+18", "+19", "+20","+21", "+22", "+23", "+24", "+25", "+26", "+27", "+28", "+29", "+30", "+31", "+32", "+33", "+34", "+35", "+36", "+37", "+38", "+39", "+40"] 
      + (log_term(@{index}) -( log(pibar_p)+ log_muzstar(@{index})))
    @#endfor
    ;
     
 % Real risk free 10 year rate
    log_zetac + log_lambdazf   = 40*log(rLf  * beta_p) + log_zetac(+40) + log_lambdazf(+40) 
    @#for index in ["+1", "+2", "+3", "+4", "+5", "+6", "+7", "+8", "+9", "+10", "+11", "+12", "+13", "+14", "+15", "+16", "+17", "+18", "+19", "+20","+21", "+22", "+23", "+24", "+25", "+26", "+27", "+28", "+29", "+30", "+31", "+32", "+33", "+34", "+35", "+36", "+37", "+38", "+39", "+40"] 
      -log_muzstar(@{index})
    @#endfor
    ; 
lambdazf=exp(log_lambdazf);
   
% zetac * lambdazf = ((1 + RLf) * beta_p)^40 * zetac(+40) * lambdazf(+40) 
%    @#for index in ["+1", "+2", "+3", "+4", "+5", "+6", "+7", "+8", "+9", "+10", "+11", "+12", "+13", "+14", "+15", "+16", "+17", "+18", "+19", "+20","+21", "+22", "+23", "+24", "+25", "+26", "+27", "+28", "+29", "+30", "+31", "+32", "+33", "+34", "+35", "+36", "+37", "+38", "+39", "+40"] 
%      * (term(@{index}) / (pibar_p * muzstar(@{index})))
%    @#endfor
%    ;

% zetac * lambdazf  = (rLf * beta_p)^40 * zetac(+40) * lambdazf(+40) 
%   @#for index in ["+1", "+2", "+3", "+4", "+5", "+6", "+7", "+8", "+9", "+10", "+11", "+12", "+13", "+14", "+15", "+16", "+17", "+18", "+19", "+20","+21", "+22", "+23", "+24", "+25", "+26", "+27", "+28", "+29", "+30", "+31", "+32", "+33", "+34", "+35", "+36", "+37", "+38", "+39", "+40"] 
%     /  muzstar(@{index})
%   @#endfor
%   ;
  
//****************************************
//Sticky price economy
//***************************************
  % Eqn 1: Law of motion for \latex{p^*}
    pstar = ((1 - xip_p) * (Kp / Fp)^(lambdaf/(1-lambdaf)) 
            + xip_p * ((pitilde / pi) * pstar(-1))^(lambdaf/(1-lambdaf)))^((1-lambdaf)/lambdaf); 
  
  % Eqn 2: Law of motion for \latex{F_p}.
    Fp = zetac * lambdaz * yz + (pitildep1 / pi(+1))^(1/(1-lambdaf(+1))) * beta_p * xip_p * Fp(+1); 

  % Eqn 3: Law of motion for \latex{K_p}
  % This error is ignored.
  %  Kp = zetac * lambdaf * lambdaz * pstar^(lambdaf/(lambdaf-1)) * yz * s 
  %       + beta_p * xip_p * (pitildep1 / pi(+1))^(lambdaf(+1)/(1-lambdaf(+1))) * Kpp1;
    Kp = zetac * lambdaf * lambdaz * yz * s 
         + beta_p * xip_p * (pitildep1 / pi(+1))^(lambdaf(+1)/(1-lambdaf(+1))) * Kpp1; 

  % Eqn 4: Relationship between \latex{K_p} and \latex{F_p}.
  % This equation is contained in the definitions of Kp and Kpp1 in the
  % auxiliary equations.
  % Eqn 5: Law of motion for \latex{F_w}.
    Fw = zetac * lambdaz * wstar^(lambdaw_p/(lambdaw_p-1)) * h * (1 - taul_p) / lambdaw_p 
         + beta_p * xiw_p * muzstar_p^((1-iotamu_p)/(1-lambdaw_p)) * (muzstar(+1)^(iotamu_p/(1-lambdaw_p)-1))
         * pitildewp1^(1/(1-lambdaw_p)) / pi(+1) * (1 / piwp1)^(lambdaw_p/(1-lambdaw_p))  *  Fw(+1); 
  
% Eqn 6: Law of motion for \latex{K_w}.
    Kw = zetac * (wstar^(lambdaw_p/(lambdaw_p-1)) * h)^(1+sigmaL_p) * zeta_p + beta_p * xiw_p
         * (pitildewp1 / piwp1 * muzstar_p^(1-iotamu_p) * muzstar(+1)^iotamu_p)^(lambdaw_p*(1+sigmaL_p)/(1-lambdaw_p)) * Kwp1; 

  % Eqn 7: Relationship between \latex{F_w} and \latex{K_w}.
  % This equation is contained in the definitions of Kw and Kwp1 in the
  % auxiliary equations.

  % Eqn 8: Law of motion of \latex{w^*}
    wstar = ((1 - xiw_p) * ( ((1 - xiw_p * (pitildew / piw * muzstar_p^(1-iotamu_p) * muzstar^iotamu_p)^(1/(1-lambdaw_p))) 
            / (1 - xiw_p))^lambdaw_p ) + xiw_p * (pitildew / piw * muzstar_p^(1-iotamu_p) * muzstar^iotamu_p 
            * wstar(-1))^(lambdaw_p/(1-lambdaw_p)))^(1/(lambdaw_p/(1-lambdaw_p)));   
 
  % Eqn 9: Efficiency condition for setting captial utilization
    rk  = tauo_p * rk_ss * exp(sigmaa_p * (u  - 1));
 
  % Eqn 10: Rental rate on capital 
    rk  = alpha_p * epsil * ((upsil_p * muzstar * h * wstar^(lambdaw_p/(lambdaw_p-1)) /(u  * kbar(-1) ))^(1 - alpha_p)) *  s;
    
  
  % Eqn 11: Marginal Cost 
    s = (rk  / alpha_p)^alpha_p * (wtilde  / (1 - alpha_p))^(1-alpha_p) / epsil; 

  % Eqn 12: Resource constraint  
    yz  = g + c  + i   / muup + tauo_p * a  * kbar(-1)  / (muzstar * upsil_p) + d  + bigtheta_p * (1 - gamma) * (n  - we_p) / gamma;
   
  % Eqn 13: Law of motion for capital
    kbar  = (1 - delta_p) * kbar(-1)  / (muzstar * upsil_p) + (1 -  S) * i;  

  % Eqn 14: Household FOC w.r.t. risk-free bonds
    0 = beta_p * zetac(+1) * lambdaz(+1)  / (muzstar(+1) * pi(+1))  * (1 + (1 - taud_p) * Re ) - zetac * lambdaz;
  
  % Eqn 15: Household FOC w.r.t. consumption
    (1 + tauc_p) * zetac * lambdaz  = muzstar * zetac / (c  * muzstar -  b_p * c(-1))    - b_p * beta_p * zetac(+1) / (c(+1)  * muzstar(+1) - b_p * c );
 
 % Eqn 16: FOC for capital 
    0 = (1 - Gammap1 ) * (1 + Rk(+1))  / (1 + Re ) + Gammaprp1  / (Gammaprp1  - mu_p * Gprp1 ) * ((1 + Rk(+1))  / (1 + Re)  * (Gammap1  - mu_p * Gp1 ) - 1);
 
 % Eqn 17: Definition of return of entrepreneurs, Rk
    1 + Rk  = ((1 - tauk_p) * (u  * rk  - tauo_p * a ) + (1 - delta_p) * q ) * pi        / (upsil_p * q(-1))  + tauk_p * delta_p;
 
% Eqn 18: Household FOC w.r.t. investment
    0 = - zetac * lambdaz  / muup + lambdaz  * zetac * q  * (-Spr  * zetai * i   * muzstar * upsil_p / i(-1)   + 1 - S )
        + beta_p * zetac(+1) * lambdaz(+1)  * q(+1)  * Sprp1  * (zetai(+1) * i(+1)  * muzstar(+1) * upsil_p / i  )^2 / (muzstar(+1) * upsil_p);
 
  % Eqn 19: Definition of yz.  
   
  % Eqn 20: Monetary Policy Rule
   // log(Re / Re_p) = rhotil_p * log(Re(-1) / Re_p) + (1 / Re_p) * (1 - rhotil_p) 
   //                  * (aptil_p * pi_p * log(pi(+1) / pitarget) + (1 / 4) * adytil_p*log(yz/yzf));% muzstar_p * log(gdp_obs));
     
  // log(Re / Re_p) = rhotil_p * log(Re(-1) / Re_p) + (1 / Re_p) * (1 - rhotil_p) * (aptil_p * pi_p * log(pi(+1) / pitarget) + (1 / 4) * adytil_p * muzstar_p * log(gdp_obs));
 
  % Eqn 21: GDP
  % This is not used.  It is only used in the manuscript in the monetary
  % policy rule.

  
    
  % Eqn 22: Zero profit condition
    q (-1) * kbar (-1) * (1 + Rk ) * ((1 - mu_p) * G  + omegabar  * (1 - F )) / (n(-1)  * (1 + Re(-1) )) - q(-1)  * kbar(-1)  / n(-1)  + 1;
 
 % Eqn 23: Law of motion of net worth
    n = gamma / (pi * muzstar) * (Rk  - Re(-1) -((G  + omegabar  * (1 - F )) - ((1 - mu_p) * G  + omegabar  * (1 - F ))) * (1 + Rk )) 
        * kbar(-1)  * q(-1)  + we_p + gamma * (1 + Re(-1) ) * n(-1)  / (pi * muzstar);
 
 volEquity  = (1 + Rk ) * q(-1)  * kbar(-1)  / n(-1)  * sqrt( (exp(sigma(-1)^2)/(1-F )*(1-H ) - ((1-G )/(1-F ))^2) );
% Long rate
    log_zetac +log_lambdaz  = 40*(log(1 + RL ) + log(beta_p)) + log_zetac(+40) +log_lambdaz (+40) 
    @#for index in ["+1", "+2", "+3", "+4", "+5", "+6", "+7", "+8", "+9", "+10", "+11", "+12", "+13", "+14", "+15", "+16", "+17", "+18", "+19", "+20","+21", "+22", "+23", "+24", "+25", "+26", "+27", "+28", "+29", "+30", "+31", "+32", "+33", "+34", "+35", "+36", "+37", "+38", "+39", "+40"] 
      + (log_term(@{index}) -( log_pi(@{index})+ log_muzstar(@{index})))
    @#endfor
    ;
 zetac=exp(log_zetac);
lambdaz=exp(log_lambdaz);
term=exp(log_term);
pi=exp(log_pi);
muzstar=exp(log_muzstar);
 % Long rate
 %   zetac * lambdaz  = ((1 + RL ) * beta_p)^40 * zetac(+40) * lambdaz (+40) 
 %   @#for index in ["+1", "+2", "+3", "+4", "+5", "+6", "+7", "+8", "+9", "+10", "+11", "+12", "+13", "+14", "+15", "+16", "+17", "+18", "+19", "+20","+21", "+22", "+23", "+24", "+25", "+26", "+27", "+28", "+29", "+30", "+31", "+32", "+33", "+34", "+35", "+36", "+37", "+38", "+39", "+40"] 
 %     * (term(@{index}) / (pi(@{index})* muzstar(@{index})))
 %   @#endfor
 %   ;
     
 % Real risk free 10 year rate
    log_zetac + log_lambdaz   = 40*log(rL  * beta_p) + log_zetac(+40) + log_lambdaz (+40) 
    @#for index in ["+1", "+2", "+3", "+4", "+5", "+6", "+7", "+8", "+9", "+10", "+11", "+12", "+13", "+14", "+15", "+16", "+17", "+18", "+19", "+20","+21", "+22", "+23", "+24", "+25", "+26", "+27", "+28", "+29", "+30", "+31", "+32", "+33", "+34", "+35", "+36", "+37", "+38", "+39", "+40"] 
      -log_muzstar(@{index})
    @#endfor
    ; 

  % Real risk free 10 year rate
  %    zetac * lambdaz   = (rL  * beta_p)^40 * zetac(+40) * lambdaz (+40) 
  %  @#for index in ["+1", "+2", "+3", "+4", "+5", "+6", "+7", "+8", "+9", "+10", "+11", "+12", "+13", "+14", "+15", "+16", "+17", "+18", "+19", "+20","+21", "+22", "+23", "+24", "+25", "+26", "+27", "+28", "+29", "+30", "+31", "+32", "+33", "+34", "+35", "+36", "+37", "+38", "+39", "+40"] 
  %    /  muzstar(@{index})
  %  @#endfor
  %  ; 
   

   
   
   


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Observation equations
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  consumption_obs = c / c(-1) * muzstar / muzstar_p;
 // @#if cee == 0
  credit_obs      = (q * kbar - n) / (q(-1) * kbar(-1) - n(-1)) * muzstar / muzstar_p;
  //@#endif
  gdp_obs         = (c + i / muup + g) / (c(-1) + i(-1) / muup(-1) + g(-1)) * muzstar / muzstar_p;
  hours_obs       = h / h_ss;
  inflation_obs   =  pi / pi_p;
  investment_obs  = i / i(-1) * muzstar / muzstar_p;
  
  networth_obs    = n / n(-1) * muzstar / muzstar_p;
  premium_obs     = exp((((G + omegabar * (1 - F)) - ((1 - mu_p) * G + omegabar * (1 - F))) * (1 + Rk) * q(-1) * kbar(-1) 
                    / (q(-1) * kbar(-1) - n(-1))) - mu_p * G_ss * (1 + Rk_ss) * kbar_ss / (kbar_ss - n_ss));
  
  pinvest_obs     = muup(-1) / muup;
  Re_obs          = exp(Re - Re_p);
  RealRe_obs      = ((1 + Re) / pi(+1))/((1 + Re_p) / pi_p);
  
  Spread1_obs     = 1 + RL - Re;  
  
  wage_obs        = wtilde / wtilde(-1) * muzstar / muzstar_p;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  y = g + c + i / muup;
% percentage deviation variables for comparison exercises
  ly =  (log(y)-log(steady_state(y)))*100;
  lc =  (log(c)-log(steady_state(c)))*100;
  linv = (log(i/muup)-log(steady_state(i))+log(steady_state(muup)))*100;
  lwage =  (log(wtilde)-log(steady_state(wtilde)))*100;
  lhours = (log(h)- log(h_ss))*100;
  lrealRe= (log((1 + Re) / pi(+1)) -log((1 + Re_p) / pi_p))*400;
  % lrk lu lkbar lq lrborr lnw EFP
  lrk = (log(rk) - log(rk_ss))*100;
  lu = log(u)*100;
  lkbar = (log(kbar)- log(kbar_ss))*100;
  lq = log(q);
  lnw = (log(n)- log(n_ss))*100;
  lrborr = (log(q*kbar - n)- log(kbar_ss - n_ss))*100;
  EFP = (log((1+Rk(1))/(1+Re))-log((1+Rk_ss)/(1+Re_p)))*400;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Shock equations
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  log(epsil / epsil_p)       = rhoepsil_p    * log(epsil(-1) / epsil_p)       + (1 - @{stopshock}) * e_epsil;
  log(g / g_ss)              = rhog_p        * log(g(-1) / g_ss)              + (1 - @{stopshock}) * e_g;
  
  log(gamma / gamma_p)       = rhogamma_p    * log(gamma(-1) / gamma_p)       + (1 - @{stopshock}) * e_gamma;
  
  log(lambdaf / lambdaf_p)   = rholambdaf_p  * log(lambdaf(-1) / lambdaf_p)   + (1 - @{stopshock}) * e_lambdaf;
  log(muup / muup_p)         = rhomuup_p     * log(muup(-1) / muup_p)         + (1 - @{stopshock}) * e_muup;
  log(muzstar / muzstar_p)   = rhomuzstar_p  * log(muzstar(-1) / muzstar_p)   + (1 - @{stopshock}) * e_muzstar;
  log(pitarget / pitarget_p) = rhopitarget_p * log(pitarget(-1) / pitarget_p);// + (1 - @{stopshock}) * e_pitarget; 
  log(term / term_p)         = rhoterm_p     * log(term(-1) / term_p)         + (1 - @{stopshock}) * e_term;
  
  log(zetac / zetac_p)       = rhozetac_p    * log(zetac(-1) / zetac_p)       + (1 - @{stopshock}) * e_zetac;
  log(zetai / zetai_p)       = rhozetai_p    * log(zetai(-1) / zetai_p)       + (1 - @{stopshock}) * e_zetai;
  
  
  log(sigma / sigma_ss) = rhosigma_p * log(sigma(-1) / sigma_ss)  + log(xi0) 
   @#for index in ["1", "2", "3", "4", "5", "6", "7", "8"]
    + log_xi@{index}(-@{index})
  @#endfor  
  ;
log_xi0=log(xi0);
log_xi1=log(xi1);
log_xi2=log(xi2);
log_xi3=log(xi3);
log_xi4=log(xi4);
log_xi5=log(xi5);
log_xi6=log(xi6);
log_xi7=log(xi7);
log_xi8=log(xi8);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Signal equations
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  @#if ("8" in possible_signals)
  log(xi8) = stdsigma2_p * e_xi8;
  @#else
  log(xi8) = 0;
  @#endif
  
  @#if ("7" in possible_signals)
  log(xi7) = signal_corr_p * stdsigma2_p * e_xi8 
  @#for index in ["7"]
    + sqrt(1 - signal_corr_p^2) * stdsigma2_p * e_xi@{index}
  @#endfor
  ;
  @#else
  log(xi7) = 0;
  @#endif
  
  @#if ("6" in possible_signals)
  log(xi6) = signal_corr_p^2 * stdsigma2_p * e_xi8
  @#for index in ["7", "6"]
    + sqrt(1 - signal_corr_p^2) * signal_corr_p^(@{index} - 6) * stdsigma2_p * e_xi@{index}
  @#endfor
  ;
  @#else
  log(xi6) = 0;
  @#endif

  @#if ("5" in possible_signals)
  log(xi5) = signal_corr_p^3 * stdsigma2_p * e_xi8
  @#for index in ["7", "6", "5"]
    + sqrt(1 - signal_corr_p^2) * signal_corr_p^(@{index} - 5) * stdsigma2_p * e_xi@{index}
  @#endfor
  ;
  @#else
  log(xi5) = 0;
  @#endif

  @#if ("4" in possible_signals)
  log(xi4) = signal_corr_p^4 * stdsigma2_p * e_xi8
  @#for index in ["7", "6", "5", "4"]
    + sqrt(1 - signal_corr_p^2) * signal_corr_p^(@{index} - 4) * stdsigma2_p * e_xi@{index}
  @#endfor
  ;
  @#else
  log(xi4) = 0;
  @#endif

  @#if ("3" in possible_signals)  
  log(xi3) = signal_corr_p^5 * stdsigma2_p * e_xi8
  @#for index in ["7", "6", "5", "4", "3"]
    + sqrt(1 - signal_corr_p^2) * signal_corr_p^(@{index} - 3) * stdsigma2_p * e_xi@{index}
  @#endfor
  ;
  @#else
  log(xi3) = 0;
  @#endif

  @#if ("2" in possible_signals)  
  log(xi2) = signal_corr_p^6 * stdsigma2_p * e_xi8
  @#for index in ["7", "6", "5", "4", "3", "2"]
    + sqrt(1 - signal_corr_p^2) * signal_corr_p^(@{index} - 2) * stdsigma2_p * e_xi@{index}
  @#endfor
  ;
  @#else
  log(xi2) = 0;
  @#endif
  
  @#if ("1" in possible_signals)
  log(xi1) = signal_corr_p^7 * stdsigma2_p * e_xi8
  @#for index in ["7", "6", "5", "4", "3", "2", "1"]
    + sqrt(1 - signal_corr_p^2) * signal_corr_p^(@{index} - 1) * stdsigma2_p * e_xi@{index}
  @#endfor
  ;
  @#else
  log(xi1) = 0;
  @#endif
  
  @# if ("0" in possible_signals)
  log(xi0) = signal_corr_p^8 * stdsigma1_p * e_xi8
  @#for index in ["7", "6", "5", "4", "3", "2", "1"]
    + sqrt(1 - signal_corr_p^2) * signal_corr_p^(@{index} - 0) * stdsigma1_p * e_xi@{index}
  @#endfor
  + sqrt(1-signal_corr_p^2) * stdsigma1_p * e_sigma;
  @#else
  log(xi0)=0;
  @#endif  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This ensures zero profits.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  phi = steady_state(phi);
  phif = steady_state(phif);

end;

initval;
c=                  		 1.57075;
consumption_obs =   		 1;
credit_obs      =   		 1;
epsil           =   		 1;
Fp              =   		 7.02868;
Fw              =   		 2.37527;
g               =   		 0.608271;
gamma           =   		 0.985;
gdp_obs         =   		 1;
h               =   		 1.01373;
hours_obs       =   		 1;
i               =   		 0.798323;
inflation_obs   =   		 1;
investment_obs  =   		 1;
kbar            =   		 24.1271;
lambdaf         =   		 1.2;
lambdaz         =   		 0.610222;
muup            =   		 1;
muzstar         =   		 1.00412;
n               =   		 11.9712;
networth_obs    =   		 1;
omegabar        =   		 0.500971;
phi             =   		 0.598353;
pi              =   		 1.00601;
pinvest_obs     =   		 1;
pitarget        =   		 1.00601;
premium_obs     =   		 1;
pstar           =   		 1;
q               =   		 1;
Re              =   		 0.0114707;
Re_obs          =   		 1;
RealRe_obs      =   		 1;
rL              =   		 1.00543;
rk              =   		 0.050015;
Rk              =   		 0.0188063;
RL              =   		 0.0114707;
s               =   		 0.833333;
sigma           =   		 0.259199;
xi0             =   		 1;
xi1             =   		 1;
xi2             =   		 1;
xi3             =   		 1;
xi4             =   		 1;
xi5             =   		 1;
xi6             =   		 1;
xi7             =   		 1;
xi8             =   		 1;
Spread1_obs     =   		 1;
term            =   		 1;
volEquity       =   		 0.536401;
u               =   		 1;
wage_obs        =   		 1;
wtilde          =   		 1.77074;
wstar           =   		 1;
zetac           =   		 1;
zetai           =   		 1;
log_zetac       =   		 0;
log_lambdaz     =   		 -0.493933;
log_term        =   		 0;
log_pi          =   		 0.0059928;
log_muzstar     =   		 0.00411593;
log_xi0         =   		 0;
log_xi1         =   		 0;
log_xi2         =   		 0;
log_xi3         =   		 0;
log_xi4         =   		 0;
log_xi5         =   		 0;
log_xi6         =   		 0;
log_xi7         =   		 0;
log_xi8         =   		 0;
cf              =   		 1.57075;
hf              =   		 1.01373;
i_f             =   		 0.798323;
kbarf           =   		 24.1271;
lambdazf        =   		 0.610222;
nf              =   		 11.9712;
omegabarf       =   		 0.500971;
phif            =   		 0.598353;
qf              =   		 1;
Ref             =   		 0.0114707;
rLf             =   		 1.00543;
rkf             =   		 0.050015;
Rkf             =   		 0.0188063;
RLf             =   		 0.0114707;
sf              =   		 0.833333;
volEquityf      =   		 0.536401;
uf              =   		 1;
Fwf             =   		 0.447161;
wtildef         =   		 1.77074;
Fpf             =   		 1.82564;
log_lambdazf    =   		 -0.493933;
y               =   		 2.97734;
ly              =   		 0;
lc              =   		 0;
linv            =   		 0;
lwage           =   		 0;
lhours          =   		 0;
lrealRe         =   		 0;
lrk             =   		 0;
lu              =   		 0;
lkbar           =   		 0;
lq              =   		 0;
lrborr          =   		 0;
lnw             =   		 0;
EFP             =   		 0;
e_g             =   		 0;
interest        =   		 0;
inflation       =   		 0;
inflationq      =   		 0;
outputgap       =   		 0;
output          =   		 0;
fispol          =   		 0;
end;

steady(maxit=1000, solve_algo=1);
%resid;
%check;


shocks; 
//var e_xp;       stderr stdxp_p;
var interest_; stderr 0;
var e_lambdaf;  stderr stdlambdaf_p;
// var e_pitarget; stderr stdpitarget_p;
var e_muup;     stderr stdmuup_p;
var fiscal_;  stderr stdg_p;  //  e_g
var e_muzstar;  stderr stdmuzstar_p;
//@# if cee == 0
var e_gamma;    stderr stdgamma_p;
//@# endif
var e_epsil;    stderr stdepsil_p;
//@# if cee == 0
var e_sigma;    stderr 1-@{stopunant};
//@# endif
var e_zetac;    stderr stdzetac_p;
var e_zetai;    stderr stdzetai_p;
//@# if cee == 0
//@#if Spread1_in_financial_data
var e_term;     stderr stdterm_p;
//@#else
//var e_term;     stderr 0;
//@#endif
var e_xi8;      stderr 1-@{stopsignal};
var e_xi7;      stderr 1-@{stopsignal};
var e_xi6;      stderr 1-@{stopsignal};
var e_xi5;      stderr 1-@{stopsignal};
var e_xi4;      stderr 1-@{stopsignal};
var e_xi3;      stderr 1-@{stopsignal};
var e_xi2;      stderr 1-@{stopsignal};
var e_xi1;      stderr 1-@{stopsignal};
//@# endif


end;
//stoch_simul(order=1, irf=40,nograph);
