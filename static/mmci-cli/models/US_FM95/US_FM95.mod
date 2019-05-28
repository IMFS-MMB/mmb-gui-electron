//**************************************************************************
// A New Comparative Approach to Macroeconomic Modeling and Policy Analysis
//
// Volker Wieland, Tobias Cwik, Gernot J. Mueller, Sebastian Schmidt and
// Maik Wolters
//
// Working Paper, 2009
//**************************************************************************

// Model: US_FM95

// Further references:
// Fuhrer, J. 1997. "Inflation/Output Variance Trade-Offs and Optimal Monetary Policy." Journal of Money, Credit and Banking 29. pp 214-234.
// Fuhrer, J., and G. Moore. 1995. "Inflation Persistence." Quaterly Journal of Economics 110(1), pp. 127-159.
// Fuhrer, J., and G. Moore. 1995. "Monetary Policy Trade-offs and the Correlation between Nominal Interest Rates and Real Output."
// American Economic Review 85(1), pp. 219-239.
// Levin, A., V. Wieland, and J. Williams. 2003. "The Performance of Forecast-Based Monetary Policy Rules under Model Uncertainty."
// American Economic Review 93(3), pp. 622-645.

// Last edited: 10/09/07 by S. Schmidt

// The parametrization is taken from Fuhrer (1997).


var p x ytilde ypsilon f infl rho

//**************************************************************************
// Modelbase Variables                                                   //*
   interest inflation inflationq outputgap output;                       //*
//**************************************************************************

varexo epsilon_p epsilon_y

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
//**************************************************************************
s f0 f1 f2 f3 D a0 a1 a2 arho gamma;




s    =  0.113;
gamma = 0.002;


f0   =  0.25+(1.5-0)*s;
f1   =  0.25+(1.5-1)*s;
f2   =  0.25+(1.5-2)*s;
f3   =  0.25+(1.5-3)*s;
D    =  40; //120

a0   =  0.012;
a1   =  1.447;
a2   = -0.468;
arho = -0.335;

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

interest   = f+a0/arho;                                                  //*
inflation  = (1/4)*(infl+ infl(-1)+ infl(-2)+ infl(-3));                 //*
inflationq = infl;                                                       //*
outputgap  = ytilde;                                                     //*
output     = ytilde;                                                     //*
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
//**************************************************************************

// Original Model Code:

// Original interest rate rule from Fuhrer and Moore (1995), equation (9)
//f-f(-1) = 0.126*(f(-1)-f(-2))-0.397*(f(-2)-f(-3))+0.060*infl(-1)+0.130*infl(-2)-0.116*infl(-3)+0.102*ytilde;

p       = f0 * x + f1 * x(-1) + f2 * x(-2) + f3 * x(-3);
x - p   = f0 * (ypsilon  + gamma*ytilde) + f1 * (ypsilon(+1) + gamma*ytilde(+1)) +
	  f2 * (ypsilon(+2) + gamma*ytilde(+2)) + f3 * (ypsilon(+3) + gamma*ytilde(+3)) + epsilon_p;
ypsilon = f0 * (x-p) + f1 * (x(-1) - p(-1)) + f2 * (x(-2) - p(-2)) + f3 * (x(-3) - p(-3));
ytilde  = a0 + a1 * ytilde(-1) + a2 * ytilde(-2) + arho * rho(-1)+epsilon_y;
rho - D*(rho(+1) -rho) = f - infl(+1);
infl      = 4*(p-p(-1));
end;

initval;
ytilde = 0;
ypsilon = 0;
f = -a0/arho;
infl = 0;
rho = -a0/arho;
inflation = 0;
inflationq = 0;
interest = 0;
output = 0;
outputgap = 0;
end;

shocks;
var epsilon_p            =  10000*2.78656791760000e-06;
var epsilon_p, interest_ =  0                   ;
var epsilon_p, epsilon_y   = 10000*(-2.67932176090000e-06);
var interest_          =  0;
var interest_, epsilon_y =  0;
var epsilon_y            =  10000*3.63551004125000e-05;
end;


//stoch_simul (irf = 0, ar=100, noprint, periods=2000);
