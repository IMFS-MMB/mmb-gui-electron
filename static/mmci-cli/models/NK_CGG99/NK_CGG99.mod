//**************************************************************************
// A New Comparative Approach to Macroeconomic Modeling and Policy Analysis
//
// Volker Wieland, Tobias Cwik, Gernot J. Mueller, Sebastian Schmidt and
// Maik Wolters
//
// Working Paper, 2009
//**************************************************************************

// Model: NK_CGG99

// Further references:
// Clarida, R., J. Gal?and M. Gertler. 1999. "The Science of Monetary Policy: A New Keynesian Perspective."
// Journal of Economic Literature 37(4), pp. 1661-1707.

// Last edited: 10/08/26 by S. Schmidt

// This file simulates the dynamic response of the model to specific shocks.
// This version uses the extended version of the model (starting on page 1691),
// which adds output persistence and endogenous inflation to the baseline model.
// We use the same parameters as in Rotemberg Woodford (1997) and add a backward looking
// inflation share of 0.48 and a backward looking part of output of 0.44.


var x i pi

//**************************************************************************
// Modelbase Variables                                                   //*
    interest inflation inflationq outputgap;                             //*
//**************************************************************************

varexo inflation_ demand_

//**************************************************************************
// Modelbase Shocks                                                      //*
        interest_;                                                       //*
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
 theta sigma phi lambda beta;

theta  =  0.44;
lambda =  0.0244;
phi    =  0.48;
sigma  = -6.25;
beta   =  1/(1+0.035/4);

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
coffispol = 0;                                                           //*
//**************************************************************************

model(linear);

//**************************************************************************
// Definition of Modelbase Variables in Terms of Original Model Variables //*

interest   = i*4;                                                        //*
inflation  = pi+pi(-1)+pi(-2)+pi(-3);                                    //*
inflationq = pi*4;                                                       //*
outputgap  = x;                                                          //*
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
           + std_r_ *interest_;                                          //*
//**************************************************************************

// Original Model Code:

// Original interest rate rule from table 1 in Clarida et al. (1999)
//i = 0.79*i(-1)+(1-0.79)*(2.15*pi(+1)+(0.93/4)*x);
// We devide the original output gap coefficient by 4, since Clarida et al. (2000)
// report that they use annualized quarterly inflation and interest rate data
// to estimate the rule.

x  =  sigma *( i - pi(+1) ) + theta * x(-1)  + (1-theta) * x(+1) + demand_;
pi   =  lambda*x + phi * pi(-1) + (1-phi) * beta *  pi(+1) + inflation_;
end;


shocks;
var demand_;
stderr 0.63;
var inflation_;
stderr 0.4;
end;


//stoch_simul(irf = 0, ar=100, noprint);
