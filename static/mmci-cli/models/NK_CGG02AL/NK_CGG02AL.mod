//**************************************************************************
// A New Comparative Approach to Macroeconomic Modeling and Policy Analysis
//
// Volker Wieland, Tobias Cwik, Gernot J. Mueller, Sebastian Schmidt and 
// Maik Wolters
//
// Working Paper, 2009
//**************************************************************************

// Model: NK_CGG02AL

// Further references:
// Clarida, R., J. Galí, and M. Gertler. 2002. "A simple framework for international monetary policy analysis."
// Journal of Monetary Economics 49, pp. 879-904.
// Galí, J., and T. Monacelli. 2005. "Monetary Policy and Exchange Rate Volatility in a Small Open Economy."
// Review of Economic Studies 72, pp. 707-734.

// Last edited: 01/10/2013 by V. Audzei based on code by S. Schmidt (adaptive learning)

// This file simulates the dynamic response of the model of Clarida et. al (2002)
// to specific shocks. Parameter values are taken from Gali and Monacelli (2005).


var ytilde ybar y infl r rr u a ytildestar ybarstar ystar infstar rstar rrstar ustar astar

//**************************************************************************
// Modelbase Variables                                                   //*
    interest inflation inflationq outputgap output                       //*
	inflationql inflationql2 inflationqls infstarl infstarl2;            //*
//**************************************************************************  


varexo inf_ a_ infstar_ ystar_ rstar_ astar_

//**************************************************************************
// Modelbase Shocks                                                      //*       
       interest_;                                                        //*
//**************************************************************************  

     
parameters 
 //**************************************************************************
// Modelbase Parameters                                                  
                                                                         
        cofintintb1 cofintintb2 cofintintb3 cofintintb4                  
        cofintinf0 cofintinfb1 cofintinfb2 cofintinfb3 cofintinfb4       
        cofintinff1 cofintinff2 cofintinff3 cofintinff4                  
        cofintout cofintoutb1 cofintoutb2 cofintoutb3 cofintoutb4        
        cofintoutf1 cofintoutf2 cofintoutf3 cofintoutf4
        cofintoutp cofintoutpb1 cofintoutpb2 cofintoutpb3 cofintoutpb4   //*
        cofintoutpf1 cofintoutpf2 cofintoutpf3 cofintoutpf4              //*                  
        std_r_ std_r_quart coffispol           
//************************************************************************** 
sigma0 beta lambda rhoa rhou sigma kappa0 delta1 kappa phi theta gamma1;


beta=0.99;
rhoa=0.9;
rhou=0;
sigma=7;//log utility case 
phi=1;
theta=0.75;
gamma1=0.5;
kappa0=sigma*gamma1-gamma1;
kappa=sigma+phi-kappa0;
sigma0=sigma-kappa0;
delta1=((1-theta)*(1-beta*theta))/theta;
lambda=delta1*kappa;

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
//**************************************************************************
// State and forward variables for learning setup                        //*
AL_Info.forwards={'inflationq','infstar','ytildestar','ytilde','infl','ybar','ystar', 'ybarstar','y'};
//states_long={'astar','inflationql',	'inflationql2',	'infstarl',	'infstarl2',	'inflationq',	'rstar',	'ytildestar',	'ustar',	'interest',	'outputgap'};
AL_Info.states_long={'astar','a','inflationq','inflationql','inflationql2','infstar','infstarl','infstarl2','rstar','interest',};
//states_short={'astar','inflationql',	'inflationql2',	'infstarl',	'infstarl2',	'inflationq',	'rstar',	'ytildestar',	'ustar',	'interest',	'outputgap'};
AL_Info.states_short={'astar','a','inflationq','infstar','rstar','interest'};
//states_short={'astar','a','rstar','interest'};
save AL_Info AL_Info 
model(linear);

//**************************************************************************
// Definition of Modelbase Variables in Terms of Original Model Variables //*

interest   = r;                                                             //*
inflationq = infl;                                                          //*
inflationql = inflationq(-1);                                               //*
inflationql2 = inflationql(-1);                                             //*
inflation  = (1/4)*(inflationq+inflationql+inflationql2+inflationql2(-1));  //*
inflationqls=inflationql+inflationql2;	  									//*
outputgap  = ytilde;                                                        //*
output     = y;                                                             //*
infstarl=infstar(-1);                                                       //*
infstarl2=infstarl(-1);                                                     //*
//**************************************************************************


//**************************************************************************                                                                    
// Policy Rule                                                           //*
// For AL model, the policy rule removes all leads and lags beyond the   //*
// first one. This means that only certain rules, such as original SW07, //*
// could be used.                                                        //*
                                                                         //*
// Monetary Policy                                                       //*
                                                                         //*
interest =   cofintintb1*interest(-1)                                    //* 
//         + cofintintb2*interestl(-1)                                   //* 
//         + cofintintb3*interestl2(-1)                                  //* 
//         + cofintintb4*interestl3(-1)                                  //* 
           + cofintinf0*inflationq                                       //* 
           + cofintinfb1*inflationq(-1)                                  //* 
           + cofintinfb2*inflationql(-1)                                 //* 
           + cofintinfb3*inflationql2(-1)                                //* 
//         + cofintinfb4*inflationql3(-1)                                //* 
//           + 0.25*cofintinff1*pinf(+1)                                 //* 
           + cofintinff1*inflationq(+1)                                  //* 
//         + cofintinff2*inflationq(+2)                                  //* 
//         + cofintinff3*inflationq(+3)                                  //* 
//         + cofintinff4*inflationq(+4)                                  //* 
           + cofintout*outputgap 	                                     //* 
           + cofintoutb1*outputgap(-1)                                   //* 
//         + cofintoutb2*outputgap(-2)                                   //* 
//         + cofintoutb3*outputgap(-3)                                   //* 
//         + cofintoutb4*outputgap(-4)                                   //* 
//         + cofintoutf1*outputgap(+1)                                   //* 
//         + cofintoutf2*outputgap(+2)                                   //* 
//         + cofintoutf3*outputgap(+3)                                   //* 
//         + cofintoutf4*outputgap(+4)                                   //* 
           + cofintoutp*output 	                                         //* 
           + cofintoutpb1*output(-1)                                     //* 
//         + cofintoutpb2*output(-2)                                     //* 
//         + cofintoutpb3*output(-3)                                     //* 
//         + cofintoutpb4*output(-4)                                     //* 
//         + cofintoutpf1*output(+1)                                     //* 
//         + cofintoutpf2*output(+2)                                     //* 
//         + cofintoutpf3*output(+3)                                     //* 
//         + cofintoutpf4*output(+4)                                     //* 
           + std_r_ *interest_;                                          //* 
                                                                         //*
// Foreign Country:                                                      //*
rstar =   cofintintb1*rstar(-1)                                          //* 
//        + cofintintb2*rstar(-2)                                        //*
//        + cofintintb3*rstar(-3)                                        //*
//        + cofintintb4*rstar(-4)                                        //*
        + cofintinf0*infstar                                             //*
        + cofintinfb1*infstar(-1)                                        //*
        + cofintinfb2*infstarl(-1)                                       //*
        + cofintinfb3*infstarl2(-1)                                      //*                                   
//        + cofintinfb4*infstar(-4)                                      //*
        + cofintinff1*infstar(+1)                                        //* 
//        + cofintinff2*infstar(+2)                                      //* 
//        + cofintinff3*infstar(+3)                                      //* 
//        + cofintinff4*infstar(+4)                                      //*
        + cofintout*ytildestar                                           //*
        + cofintoutb1*ytildestar(-1)                                     //* 
//        + cofintoutb2*ytildestar(-2)                                   //* 
//        + cofintoutb3*ytildestar(-3)                                   //* 
//        + cofintoutb4*ytildestar(-4)                                   //*
        + cofintoutf1*ytildestar(+1)                                     //*
//        + cofintoutf2*ytildestar(+2)                                   //* 
//        + cofintoutf3*ytildestar(+3)                                   //* 
//        + cofintoutf4*ytildestar(+4)                                   //* 
        + std_r_ * rstar_;                                               //*
                                                                         //*
//**************************************************************************
// Original Model Code:

// Original monetary policy rule (Galí and Monacelli, 2005)
// r = 1.5*infl; //domestic inflation-based Taylor rule (section 5)

//home country
ytilde=ytilde(+1)-(1/sigma0)*(r-infl(+1)-rr);
infl=beta*infl(+1)+lambda*ytilde+u;
rr=sigma0*(ybar(+1)-ybar)+kappa0*(ystar(+1)-ystar);
ybar=(1/kappa)*((1+phi)*a-kappa0*ystar);
ytilde=y-ybar;
a=rhoa*a(-1)+a_;
u=rhou*u(-1)+inf_;

//foreign country
ytildestar=ytildestar(+1)-(1/sigma0)*(rstar-infstar(+1)-rrstar)+ystar_;
infstar=beta*infstar(+1)+lambda*ytildestar+ustar;
rrstar=sigma0*(ybarstar(+1)-ybarstar)+kappa0*(y(+1)-y);
ybarstar=(1/kappa)*((1+phi)*astar-kappa0*y);
ytildestar=ystar-ybarstar;
astar=rhoa*astar(-1)+astar_;
ustar=rhou*ustar(-1)+infstar_;
end;

shocks;
//var inf_ = 0;
var interest_ = 0;
var a_ = 0.01;
var ystar_ = 0.02;
var infstar_ = 0.015;
var rstar_ = 0.012;
var astar_ = 0.013;
end;

//stoch_simul (irf = 0, ar=100, noprint);