// NK_DT12
// Based on De Fiore & Tristani (2012)
// With coefficients a' la Woodford

// implemented by Christian Muecke and Johannes Binder
// code based on authors code, '%' comments are ours

// Endogenous variables
var cons_h, i_dep, infl, omeg_t, s_t, chi_t, thet1_t, thet2_t, 
y_t, spread, q_t, ygap, cons_e, mon_cost, Bankrupt, fo_t, ho_t,  i_l, credit, stdoi_t, %% deleted fo_prime
Util, Welf,
i_e, y_e, a_t, mu_t, tau_t

//**************************************************************************
// Modelbase Variables                                                   //*
        interest inflation inflationq outputgap output                   //*
        //fispol                                                         //*   
        ;                                                                //*
//**************************************************************************


// Disturbances;
varexo epsA, epsmu,epstau,epsstd 				// ,epspol

//**************************************************************************
// Modelbase Shocks                                                      //*       
       interest_                                                         //*
       //fiscal_                                                           //*   
       ;                                                                 //*
//**************************************************************************


//PARAMETERS
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
        std_r_ std_r_quart coffispol                                    //*
                                                                         //*
//**************************************************************************

psai, phi, sig, mu_hat, bet, rho_mu, epsil, thet, Omega1, 
mu_oi, std_oi, rho_a, tau, nbeta, zet_hous, rho_pol, y_t_ss, y_e_ss; 		// poly, zet, zet_gap, rhoint,



// Calibrated parameter values
phi = 0.11;
psai = 1.35;  % scaling disutility of labor 
sig = 0.16 ; % risk aversion

epsil = 11.0 ; % elasticity of substitution across goods
thet = .66 ; % probability of not adjusting prices  
mu_hat = 0.12 ; % WAS ==>> 0.15 <<== SS financial mark-up  
bet = .99 ; % discount factor
rho_mu = .7317 ; % persistence of financial shocks: as in the endogenous case
% rho_pol = 0.5 ; % persistence of policy shocks
rho_a = 0.9 ; % persistence of tech shocks

tau = 0.046 ;  % DT case with entr. cons, Woodford parameters
gam = .08 ;

mu_oi = 1.0 ;
std_oi = 0.073 ; %   DT case with entr. cons, Woodford parameters

% zet_hous = 1/(1 + cons_h^(-sig)) ;     
zet_hous = 1/(1 + 0.309669908^(-sig)) ;  % DT case

% Omega1 = chi_t*q_t
Omega1 = epsil/(epsil-1)*1.02215437 ;     % DT case with entr. cons, Woodford parameters

nbeta = bet;

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

%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% MODEL EQUATIONS %%%%
%%%%%%%%%%%%%%%%%%%%%%%%%

model;        

//**************************************************************************
// Definition of Modelbase Variables in Terms of Original Model Variables //*

interest   = 4*(i_dep-steady_state(i_dep));                               //*         
inflation  = infl+infl(-1)+infl(-2)+infl(-3) - 4*steady_state(infl);      //*       
inflationq = 4*(infl-steady_state(infl));                                 //*     
outputgap  = ygap;                                                        //*
output     =  y_t-steady_state(y_t) ;                                     //*  
				                                                          //*    
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
           + std_r_ *interest_;                                         //* 
                                                                         //*
// Discretionary Government Spending                                     //*
                                                                         //*
//  fispol = coffispol*fiscal_;                                          //*  
//**************************************************************************

// Original Model Code:

// Welfare
exp(Util) = zet_hous*(exp(cons_h)^(1-sig)/(1-sig) - psai/(1+phi)*(exp(s_t)*exp(y_t)/exp(a_t))^(1+phi))+
     (1-zet_hous)*exp(cons_e) ;   
exp(Welf) = exp(Util) + nbeta*exp(Welf(+1));

// Actual economy
%% EQ: (9) using feasability of contract
- exp(spread) + exp(omeg_t)/(1 - exp(mu_t)*exp(Bankrupt) - exp(fo_t));
%% Appendix EQ (5) using EQ (5)
- psai*exp(cons_h)^sig*exp(s_t)^phi*exp(y_t)^phi + exp(a_t)^(1+phi)*Omega1/exp(q_t)/exp(chi_t) ; 

- exp(chi_t)*exp(i_dep)*exp(tau_t)*exp(a_t)^0 + exp(s_t)*exp(y_t)*exp(fo_t)*(1+exp(mu_t)*exp(ho_t)/( 
        - (1-erf((log(exp(omeg_t))-log(mu_oi))/sqrt(2)/exp(stdoi_t)))/2    )) ;  %replaced fo_prime
%% EQ: (7)  %replaced fo_prime        
- exp(q_t) + exp(i_dep)/(1 - exp(mu_t)*exp(Bankrupt) + exp(mu_t)*exp(fo_t)*exp(ho_t)/( 
        - (1-erf((log(exp(omeg_t))-log(mu_oi))/sqrt(2)/exp(stdoi_t)))/2    )) ;  

%% Distributions
- exp(Bankrupt) + (1+erf((log(exp(omeg_t))-log(mu_oi))/sqrt(2)/exp(stdoi_t)))/2 ;

- exp(fo_t) + (exp(log(mu_oi)+exp(stdoi_t)^2/2)/2*(1+erf((log(mu_oi)+exp(stdoi_t)^2-log(exp(omeg_t)))/sqrt(2)/exp(stdoi_t)))
    - exp(omeg_t)/2*(1-erf((log(exp(omeg_t))-log(mu_oi))/sqrt(2)/exp(stdoi_t)))) ;

- exp(ho_t) + 1/exp(omeg_t)*normpdf(omeg_t,log(mu_oi),exp(stdoi_t));

%%-  exp(fo_prime) - (1-erf((log(exp(omeg_t))-log(mu_oi))/sqrt(2)/exp(stdoi_t)))/2 ;
%%

%% Appendix: EQ (1)
- exp(cons_h) + exp(y_t)*(1 - exp(fo_t)*exp(s_t)/exp(chi_t)) ;		
%% Appendix: EQ (6)
- 1/exp(i_dep) + bet*exp(cons_h(+1))^(-sig)/(exp(cons_h)^(-sig))/exp(infl(+1)) ;	
%% Appendix: EQ (7)
- 1 + thet*exp(infl)^(epsil-1) + (1-thet)*(epsil/(epsil-1)*exp(thet1_t)/exp(thet2_t))^(1-epsil) ;	
%% Appendix: EQ (8)
- exp(thet1_t) + exp(y_t)/exp(chi_t) + thet*bet*exp(infl(+1))^(epsil-1)*exp(cons_h(+1))^(-sig)/(exp(cons_h)^(-sig))*exp(thet1_t(+1)) ;		
%% Appendix: EQ (9)
- exp(thet2_t) + exp(y_t) + thet*bet*exp(infl(+1))^(epsil-2)*exp(cons_h(+1))^(-sig)/(exp(cons_h)^(-sig))*exp(thet2_t(+1)) ;			
%% Appendix: EQ (10)
- exp(s_t) + (1-thet)*((1-thet*exp(infl)^(epsil-1))/(1-thet))^(-epsil/(1-epsil)) + thet*exp(infl)^epsil*exp(s_t(-1)) ;		
%% Output gap as defined on p.914
- exp(ygap) + exp(y_t-y_e-y_t_ss+(y_e_ss)); 		

- exp(cons_e) + exp(y_t) - exp(cons_h);

- exp(mon_cost) + exp(mu_t)*exp(Bankrupt);

- exp(i_l) + exp(i_dep)*exp(spread);
%% x_t-tau_t using EQ (8)
- exp(credit) + exp(tau_t)*exp(a_t)^0*exp(q_t)*(1 - exp(mu_t)*exp(Bankrupt) - exp(fo_t))/(exp(i_dep) - exp(q_t)*(1 - exp(mu_t)*exp(Bankrupt) - exp(fo_t)));		

%// Original Monetary Policy Rule
%// - exp(i_dep) + poly + (1/bet*exp(infl)^zet*exp(ygap)^zet_gap)^(1-rhoint) * (exp(i_dep(-1)))^rhoint * exp(interest_1);

// Exogenous Shocks 
- psai*exp(y_e)^(sig+phi) + exp(a_t)^(1+phi)/(epsil/(epsil-1))*Omega1 ;

1/exp(i_e)-bet*exp(y_e(+1))^(-sig)/(exp(y_e)^(-sig)) ;

mu_t-(1-rho_mu)*log(mu_hat)-rho_mu*mu_t(-1)-epsmu ;

tau_t-(1-rho_mu)*log(tau)-rho_mu*tau_t(-1)-epstau ;

stdoi_t-(1-rho_mu)*log(std_oi)-rho_mu*stdoi_t(-1)-epsstd ;

a_t-rho_a*a_t(-1)-epsA;

% interest_1-rho_pol*interest_1(-1)-interest_;

end;

steady;
%check;

shocks;
var epsA; stderr 1.0 ; // in percentage terms
var epstau; stderr 1.0; 
var interest_; stderr 0; // in percentage terms % previously: var interest_; stderr 0.25; 
var epsstd; stderr 0.6;
end;

% stoch_simul(order=1,irf=12, irf_shocks = (epsA, interest_)) infl ygap i_dep spread credit cons_h q_t chi_t tau_t a_t interest_1 stdoi_t  Bankrupt cons_e omeg_t s_t y_t y_e; 


