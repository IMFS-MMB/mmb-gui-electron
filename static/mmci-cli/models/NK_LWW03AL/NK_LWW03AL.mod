//**************************************************************************
// A New Comparative Approach to Macroeconomic Modeling and Policy Analysis
//
// Volker Wieland, Tobias Cwik, Gernot J. Mueller, Sebastian Schmidt and
// Maik Wolters
//
// Working Paper, 2009
//**************************************************************************

// Model: NK_LWW03

// Further references:
// Levin, A., V. Wieland, and J. Williams. 2003. "The Performance of Forecast-Based Monetary Policy Rules under Model Uncertainty."
// American Economic Review 93(3), pp. 622-645.

// Last edited: 10/09/07 by S. Schmidt


var ygap pdot rff rstar drff pdotsh pinf4

//**************************************************************************
// Modelbase Variables                                                   //*
   interest inflation inflationq outputgap  output                       //*
   inflationql inflationql2 inflationqls;
//**************************************************************************

varexo rstar_ pdotsh_

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
discountt sigma phi wtrl rhorstar rhopish;


discountt = 0.990;
sigma	 = 1/(0.157);
phi	 = 0.024;
wtrl	 = 0.975;
rhorstar = 0.35;
rhopish  = 0;

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

// State and forward variables for learning setup                        //*

AL_Info.forwards = {'ygap','pdot','inflationq'};
AL_Info.states_long  = {'rstar','interest','inflationq','inflationql','inflationql2'};
AL_Info.states_short = {'interest','outputgap'};
save AL_Info AL_Info
//**************************************************************************

model(linear);

//**************************************************************************
// Definition of Modelbase Variables in Terms of Original Model Variables //*

interest   = rff;
inflation  = pinf4;                                                        //*
//inflation  = (1/4)*(pdot+ pdot(-1)+ pdot(-2)+ pdot(-3));                 //*
inflationq = pdot;                                                       //*
inflationql = inflationq(-1);                                            //*
inflationql2 = inflationql(-1);                                          //*
inflationqls = inflationql + inflationql2;                               //*
outputgap  = ygap;                                                  	 //*
output  = ygap;                                                           //*
pinf4= 0.25 * (inflationq + inflationql + inflationql2 + inflationql2(-1));
//**************************************************************************


//**************************************************************************
// Policy Rule                                                           //*

// Policy Rule                                                           //*
interest =   cofintintb1*interest(-1)                                    //*
//         + cofintintb2*interestl(-1)                                   //*
//         + cofintintb3*interestl2(-1)                                  //*
//         + cofintintb4*interestl3(-1)                                  //*
           + cofintinf0*inflationq                                       //*
           + cofintinfb1*inflationq(-1)                                  //*
           + cofintinfb2*inflationql(-1)                                 //*
           + cofintinfb3*inflationql2(-1)                                //*
//         + cofintinfb4*inflationql3(-1)                                //*
//           + 0.25*cofintinff1*pinf(+1)                                   //*
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
//**************************************************************************

// Original Model Code:

ygap  =  ygap(+1) - 0.25*sigma *( rff - pdot(+1) -rstar);
pdot  =  discountt*pdot(+1) + 4*phi*ygap + pdotsh;
drff  =  rff - rff(-1);
rstar =  rhorstar*rstar(-1)+ rstar_;
pdotsh = rhopish*pdotsh(-1) + pdotsh_;



end;


shocks;
var pdotsh_=(1-rhopish^2)*2.25^2;
var interest_=0;   //interest rate shock is added
var rstar_=(1-rhorstar^2)*3.72^2;
end;

//stoch_simul (irf = 0, ar=100, noprint);
