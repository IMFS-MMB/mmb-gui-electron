//**************************************************************************
// A New Comparative Approach to Macroeconomic Modeling and Policy Analysis
//
// Volker Wieland, Tobias Cwik, Gernot J. Mueller, Sebastian Schmidt and
// Maik Wolters
//
// Working Paper, 2009
//**************************************************************************

// Model: EA_CW05ta

// Further references:
// Coenen, G., and V. Wieland. 2005. "A Small Estimated Euro Area Model with Rational Expectations and Nominal Rigidities."
// European Economic Review 49(5), pp. 1081-1104.

// Last edited: 10/08/26 by S. Schmidt


var q lagq1 cwp lagcwp1 lagcwp2 pi1 lagpi11 lagpi12 infl is lagis1 dis il rl

//**************************************************************************
// Modelbase Variables                                                   //*
   interest inflation inflationq outputgap output;                       //*
//**************************************************************************


varexo e_cw e_d

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
s f0 f1 f2 f3 gamma1 delta0 delta1 delta2 delta3 sigma_e_d sigma_e_cw;



s = 0.0456;
f0 = 0.25+(1.5-0)*s;
f1 = 0.25+(1.5-1)*s;
f2 = 0.25+(1.5-2)*s;
f3 = 0.25+(1.5-3)*s;
gamma1 = 0.0115;
delta0 =  0.0027;
delta1 =  1.1807;
delta2 = -0.2045;
delta3 = -0.0947;
sigma_e_d  = 1.00;
sigma_e_cw = 1.00;

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
std_r_ = 100;                                                            //*

coffispol = 0;
//**************************************************************************

model(linear);

//**************************************************************************
// Definition of Modelbase Variables in Terms of Original Model Variables //*

interest   = is*100;                                                     //*
inflation  = infl*100;                                                    //*
inflationq = pi1*4*100;                                                  //*
outputgap  = q*100;                                                      //*
output     = q*100;                                                      //*
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

// Original monetary policy rule (excluding constants)
// is = infl + 0.5*infl + 0.5*q;

q         = delta1*q(-1) + delta2*lagq1(-1) + delta3*rl(-1) + sigma_e_d*e_d;
lagq1     = q(-1);
cwp       = (f1+f2+f3)*pi1(+1) + (f2+f3)*pi1(+2) + f3*pi1(+3) + gamma1*(f0*q + f1*q(+1) + f2*q(+2) + f3*q(+3)) + sigma_e_cw*e_cw;
lagcwp1   = cwp(-1);
lagcwp2   = lagcwp1(-1);
pi1       = (f0*cwp + f1*cwp(-1) + f2*lagcwp1(-1) + f3*lagcwp2(-1) - (f2+f3)*pi1(-1) - f3*lagpi11(-1))/(f1+f2+f3);
lagpi11   = pi1(-1);
lagpi12   = lagpi11(-1);
infl       = pi1 + pi1(-1) + lagpi11(-1) + lagpi12(-1);
lagis1    = is(-1);
dis       = is - is(-1);
il        = (is + is(+1) + is(+2) + is(+3) + is(+4) + is(+5) + is(+6) + is(+7))/8;
rl        = il - (pi1(+8) + pi1(+7) + pi1(+6) + pi1(+5) + pi1(+4) + pi1(+3) + pi1(+2) + pi1(+1))/2;
end;

shocks;
var e_d = 2.94329732052579e-05;  // demand shock
var e_cw, e_d = -6.44793273694892e-06;
var e_cw = 2.36391556785721e-05; 	 // contract wage shock
end;

//stoch_simul (irf = 0, ar=100, noprint);
