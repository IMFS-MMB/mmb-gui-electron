//**************************************************************************
// A New Comparative Approach to Macroeconomic Modeling and Policy Analysis
//
// Volker Wieland, Tobias Cwik, Gernot J. Mueller, Sebastian Schmidt and
// Maik Wolters
//
// Working Paper, 2009
//**************************************************************************

// Model: NK_CGG02

// Further references:
// Clarida, R., J. Gal�, and M. Gertler. 2002. "A simple framework for international monetary policy analysis."
// Journal of Monetary Economics 49, pp. 879-904.
// Gal�, J., and T. Monacelli. 2005. "Monetary Policy and Exchange Rate Volatility in a Small Open Economy."
// Review of Economic Studies 72, pp. 707-734.

// Last edited: 10/09/07 by S. Schmidt

// This file simulates the dynamic response of the model of Clarida et. al (2002)
// to specific shocks. Parameter values are taken from Gali and Monacelli (2005).


var ytilde ybar y infl r rr u a ytildestar ybarstar ystar infstar rstar rrstar ustar astar

//**************************************************************************
// Modelbase Variables                                                   //*
    interest inflation inflationq outputgap output;                      //*
//**************************************************************************


varexo inf_ a_ infstar_ ystar_ rstar_ astar_

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
        std_r_ std_r_quart coffispol                                     //*
                                                                         //*
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
thispath = pwd;
cd('..');
load policy_param.mat;
for i=1:33
    deep_parameter_name = M_.param_names(i,:);
    eval(['M_.params(i)  = ' deep_parameter_name ' ;'])
end
cd(thispath);
//**************************************************************************

model(linear);

//**************************************************************************
// Definition of Modelbase Variables in Terms of Original Model Variables //*

interest   = r;                                                          //*
inflation  = (1/4)*(infl+infl(-1)+infl(-2)+infl(-3));                        //*
inflationq = infl;                                                        //*
outputgap  = ytilde;                                                     //*
output     = y;                                                          //*
//**************************************************************************


//**************************************************************************
// Policy Rule                                                           //*

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
                                                                         //*
// Foreign Country:                                                      //*
rstar =   cofintintb1*rstar(-1)                                          //*
        + cofintintb2*rstar(-2)                                          //*
        + cofintintb3*rstar(-3)                                          //*
        + cofintintb4*rstar(-4)                                          //*
        + cofintinf0*infstar                                             //*
        + cofintinfb1*infstar(-1)                                        //*
        + cofintinfb2*infstar(-2)                                        //*
        + cofintinfb3*infstar(-3)                                        //*
        + cofintinfb4*infstar(-4)                                        //*
        + cofintinff1*infstar(+1)                                        //*
        + cofintinff2*infstar(+2)                                        //*
        + cofintinff3*infstar(+3)                                        //*
        + cofintinff4*infstar(+4)                                        //*
        + cofintout*ytildestar                                           //*
        + cofintoutb1*ytildestar(-1)                                     //*
        + cofintoutb2*ytildestar(-2)                                     //*
        + cofintoutb3*ytildestar(-3)                                     //*
        + cofintoutb4*ytildestar(-4)                                     //*
        + cofintoutf1*ytildestar(+1)                                     //*
        + cofintoutf2*ytildestar(+2)                                     //*
        + cofintoutf3*ytildestar(+3)                                     //*
        + cofintoutf4*ytildestar(+4)                                     //*
//        + cofintoutp*ystar 	                                             //*
//        + cofintoutpb1*ystar(-1)                                        //*
//        + cofintoutpb2*ystar(-2)                                        //*
//        + cofintoutpb3*ystar(-3)                                     //*
//        + cofintoutpb4*ystar(-4)                                     //*
//        + cofintoutpf1*ystar(+1)                                     //*
//        + cofintoutpf2*ystar(+2)                                     //*
//        + cofintoutpf3*ystar(+3)                                     //*
//        + cofintoutpf4*ystar(+4)                                     //*
        + std_r_ * rstar_;                                               //*
                                                                         //*
//**************************************************************************
// Original Model Code:

// Original monetary policy rule (Gal� and Monacelli, 2005)
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
var inf_ = 0.1;
var interest_ = 0.1;
var a_ = 0.1;
var ystar_ = 0.1;
var infstar_ = 0.1;
var rstar_ = 0.1;
var astar_ = 0.1;
end;

//stoch_simul (irf = 0, ar=100, noprint);
