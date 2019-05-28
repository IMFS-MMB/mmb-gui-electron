//**************************************************************************
// A New Comparative Approach to Macroeconomic Modeling and Policy Analysis
//
// Volker Wieland, Tobias Cwik, Gernot J. Mueller, Sebastian Schmidt and
// Maik Wolters
//
// Working Paper, 2009
//**************************************************************************

// Model: AL_RW06 (under Adaptive Learning)

// Further references:
// Ravenna, Federico and Walsh, Carl, E. (2006). Optimal monetary policy with the cost channel
// Journal of Monetary Economics 53, 199-216.

//The parameter values are calibrated as described in section 4; p.212-213.

// Last edited: 09/07/13 by M. Kuncl (Adaptive Learning) based on the code by M. Jancokova


var x pi R

//**************************************************************************
// Modelbase Variables                                                   //*
   interest inflation inflationq outputgap output                        //*
   inflationql inflationql2 inflationqls pinf4;                          //*
//**************************************************************************

varexo u

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
sigma eta beta omega kappa;


sigma=1.5;
eta=1;
beta=0.99;
omega=0.75;
kappa=(1-omega)*(1-omega*beta)/omega;

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

AL_Info.forwards = {'pi','inflationq','x'};
AL_Info.states_long  = {'interest','inflationq','inflationql','inflationql2'};
AL_Info.states_short = {'interest','outputgap'};
save AL_Info AL_Info
//**************************************************************************



model(linear);

//**************************************************************************
// Definition of Modelbase Variables in Terms of Original Model Variables//*
                                                                         //*
interest   = R*4;                                                        //*
inflationql = inflationq(-1);                                            //*
inflationql2 = inflationql(-1);                                          //*
inflationqls = inflationql + inflationql2;                               //*
inflation  = pinf4;
//inflation  = pi+pi(-1)+pi(-2)+pi(-3);                                    //*
inflationq = pi*4;                                                       //*
outputgap  = x;                                                          //*
output  = x;                                                             //*
pinf4= 0.25 * (inflationq + inflationq(-1) + inflationqls(-1));
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
                                                                         //*
//**************************************************************************

//IS curve
x=x(+1)-(1/sigma)*(R-pi(+1))+u;

//Phillips curve
pi=beta*pi(+1)+kappa*(sigma+eta)*x+kappa*R;

end;



shocks;
var u =1;
//var interest_ =1;
end;
