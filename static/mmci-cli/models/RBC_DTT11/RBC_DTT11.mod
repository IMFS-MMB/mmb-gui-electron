// Model: RBC_DTT11

// Created by Natascha Hinterlang & Alina T�nzer, e_mail: Natascha.Hinterlang@hof.uni-frankfurt.de, Alina.Taenzer@hof.uni-frankfurt.de
// Last edited: 13-02-2017

// Further references:
// Fiorella De Fiore, Pedro Teles, and Oreste Tristani (2011) ``Monetary Policy and the Financing of Firms''
// American Economic Journal


//**************************************************************************
var     c_t r_t pi_t z_t zbar_t fo_t CapG_t co_t ho_t omeg_t n_t y_t ni_t rl_t del_t
        lagz_t dumnum_t dumden_t
        a_t mu_t gam_t std_t pol_t
        Util Welf

//**************************************************************************
// Modelbase Variables                                                   //*
   interest inflation inflationq output outputgap     ;                  //*
//**************************************************************************

varexo epsA epsmu epsgam epsstd epspol

//**************************************************************************
// Modelbase Shocks                                                      //*
       interest_ ;                                                       //*
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
alf sig mu gam bet  nbeta zet  poly std_oi rho_a  rho_mu rho_gam rho_std rho_g g bbar;

alf = 5.0 ;         // scaling disutility of labor
sig = 1.0 ;         // risk aversion
mu = 0.12 ;         // monitoring cost   0.12
gam = 0.06 ;        // death probability 0.06
bet = .99 ;         // discount factor
nbeta = bet ;
zet = 1.5 ;         // inflation response parameter in policy rule
poly = 0 ;          // dummy parameter to denote the policy rule
std_oi = 0.07 ;     // standard deviation of idiosyncratic shock   0.07
rho_a = 0.9 ;       // persistence of aggregate shock
rho_mu = 0.9 ;      // persistence of mu shock
rho_gam = 0.0 ;     // persistence of gam shock
rho_std = 0.9 ;     // persistence of std_oi shock
rho_g = 0.9 ;       // persistence of std_oi shock
g = 0.02 ;          // steady state gov expend. in // of output: 0.0000001
bbar = 0.0479 ;     // USED IN DT2  0.05255

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
                                                                         //*

//**************************************************************************

model;

//**************************************************************************
// Definition of Modelbase Variables in Terms of Original Model Variables //*

interest   = 4*r_t;                                                       //*
inflation  = (1/4)*(4*pi_t+4*pi_t(-1)+4*pi_t(-2)+4*pi_t(-3));             //*
inflationq = 4*pi_t;                                                      //*
output     = y_t;                                                       //*
outputgap = 0;                                                              //*
//**************************************************************************

//**************************************************************************
// Policy Rule                                                           //*
                                                                         //*
// Common Monetary Policy Rule                                           //*
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
//**************************************************************************

// Original Model Code:
// The orginial model monetary policy rule has to be commented out, because the common monetary policy rule is introduced

// Welfare
Util = (c_t - alf*exp(n_t)) ;

// Util = (exp(c_t)^(1-sig)/(1-sig) - alf*exp(n_t)) ;
Welf = Util + bet*Welf(+1);

// Actual economy
- dumnum_t + exp(mu_t(+1))*exp(omeg_t(+1))*ho_t(+1) ;
- dumden_t + (1 - co_t(+1)) ;
- lagz_t + z_t(-1) ;
- fo_t + (exp(exp(std_t)^2/2)/2*(1+erf((exp(std_t)^2-omeg_t)/sqrt(2)/exp(std_t))) - exp(omeg_t)/2*(1-erf(omeg_t/sqrt(2)/exp(std_t)))) ;
- CapG_t + exp(exp(std_t)^2/2)/2*(1-erf((exp(std_t)^2-omeg_t)/sqrt(2)/exp(std_t))) ;
- ho_t + exp(-1/2*(omeg_t/exp(std_t))^2)/sqrt(2*3.141592654)/exp(std_t)/exp(omeg_t) ;
- co_t + (1+erf(omeg_t/sqrt(2)/exp(std_t)))/2 ;
- exp(ni_t(+1))*fo_t(+1) + exp(r_t)*exp(z_t)/(1 - dumnum_t/dumden_t) ;
- 1/exp(r_t) + bet*exp(c_t(+1))^(-sig)/(exp(c_t)^(-sig))/exp(pi_t(+1)) ;//EE
- exp(ni_t(+1))*(1 - exp(mu_t(+1))*CapG_t(+1) - fo_t(+1)) + (1-exp(z_t))*exp(r_t) ;
- exp(n_t)*exp(a_t)*exp(z_t(-1)) + exp(ni_t)*exp(zbar_t) ;
- exp(zbar_t)*exp(pi_t)*exp(lagz_t(-1)) + (1-exp(gam_t(-1)))*fo_t(-1)*exp(ni_t(-1))*exp(zbar_t(-1)) ;
- exp(ni_t) + exp(c_t)^(-sig)*exp(a_t)/alf ;
- (1 - g)*exp(a_t)*exp(n_t)*(1 - exp(mu_t)*CapG_t) + exp(c_t) ;
- exp(y_t) + exp(a_t)*exp(n_t) ;
- exp(ni_t) + exp(rl_t(-1))*(1 - exp(z_t(-1)))/exp(omeg_t) ;
- exp(del_t) + exp(rl_t)/exp(r_t);

// Monetary Policy Rule canceled
//- exp(r_t) + poly + 1.0025/bet*(exp(pi_t)/1.0025)^zet*exp(pol_t);

// Exogenous Shocks
a_t - rho_a*a_t(-1) - epsA;
mu_t - (1-rho_mu)*log(mu) - rho_mu*mu_t(-1) - epsmu ;
gam_t - (1-rho_gam)*log(gam) - rho_gam*gam_t(-1) - epsgam ;
std_t - (1-rho_std)*log(std_oi) - rho_std*std_t(-1) - epsstd ;
pol_t - rho_a*pol_t(-1) - epspol;

end;

initval;
z_t = -1.93586;
zbar_t = -3.5818;
c_t = -1.62824;
CapG_t = 0.00921582;
co_t = 0.0110763;
del_t = 0.00444679;
dumden_t = 0.988924;
dumnum_t = 0.0499456;
fo_t = 0.150652;
gam_t = -2.81341;
ho_t = 0.488501;
lagz_t = -1.93586;
mu_t = -2.12026;
n_t = -1.62713;
ni_t = 0.0188031;
omeg_t = -0.160142;
r_t = 0.0100503;
rl_t = 0.0144971;
std_t = -2.65926;
Util = -2.6107;
Welf = -261.07;
y_t = -1.62713;
end;

%steady(solve_algo=2);
check;


shocks;
var epsA; stderr .01 ;   //
//var epspol; stderr .01 ;
var epsmu; stderr 1.2 ;  //
var epsgam; stderr 1.6 ; //
var epsstd; stderr 0.25 ; //
end;

//stoch_simul(order=1,irf=12) a_t mu_t gam_t std_t y_t ni_t c_t omeg_t del_t pi_t z_t zbar_t fo_t CapG_t co_t n_t r_t;



