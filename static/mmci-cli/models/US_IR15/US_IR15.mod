//**************************************************************************
// A New Comparative Approach to Macroeconomic Modeling and Policy Analysis
//
// Volker Wieland, Tobias Cwik, Gernot J. Mueller, Sebastian Schmidt and
// Maik Wolters
//
// Working Paper, 2009
//**************************************************************************
// Model: US_IR15

// Further references:
//Peter Ireland. ``Monetary policy, bond risk premia, and the economy''
// Journal of Monetary Economics (2015)

// Last edited: 2018/03/15 by M. Kuete

warning off;
var g_r g_pi g_y tau v r pi g_y_obs y_4 y_8 y_12 y_16 y_20
    P_y_4 P_y_8 P_y_12 P_y_16 P_y_20
y_4_a P_y_4_a g_pi_a y_8_a P_y_8_a r_a y_12_a P_y_12_a y_16_a P_y_16_a y_20_a P_y_20_a epsilon_r

//**************************************************************************
// Modelbase Variables                                                   //*
        interest inflation inflationq outputgap output;                  //* fispol
//**************************************************************************


varexo epsilon_pi epsilon_y epsilon_tau epsilon_v eta_4 eta_8 eta_16

//**************************************************************************
// Modelbase Shocks                                                      //*
       interest_;                                                         //*fiscal_;
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

           rhor rhopi rhoy rhov rhotau rhopir rhopipi rhopiy rhopiv rhoyr rhoypi rhoyy rhoyv rhovv
           sigtau sigr sigpi sigy sigv sigpitau sigypi sigytau sigvr sigvpi sigvy sigvtau
           Lambdar Lambdapi Lambday Lambdatau Lambdav
           sig4 sig8 sig16 tauSS piSS rSS gySS grSS y_4SS y_8SS y_12SS y_16SS y_20SS

           U11 U12 U13 U14 U15
           U21 U22 U23 U24 U25
           U31 U32 U33 U34 U35
           U41 U42 U43 U44 U45
           U51 U52 U53 U54 U55
           U61 U62 U63 U64 U65
           U71 U72 U73 U74 U75
           U81 U82 U83 U84 U85

           P11 P12 P13 P14 P15
           P21 P22 P23 P24 P25
           P31 P32 P33 P34 P35
           P41 P42 P43 P44 P45
           P51 P52 P53 P54 P55

           Q11 Q12 Q13 Q14 Q15
           Q21 Q22 Q23 Q24 Q25
           Q31 Q32 Q33 Q34 Q35
           Q41 Q42 Q43 Q44 Q45
           Q51 Q52 Q53 Q54 Q55

           S11 S12 S13 S14 S15
           S21 S22 S23 S24 S25
           S31 S32 S33 S34 S35
           S41 S42 S43 S44 S45
           S51 S52 S53 S54 S55;

piSS=.89;rSS=5.47; tauSS=piSS;grSS=rSS-piSS; gySS=-.526;
y_4SS=5.96; y_8SS=6.166; y_12SS=6.337; y_16SS=6.4683; y_20SS=6.5447;
rhor    = 0.6211;
rhopi   = 0.1922;
rhoy    = 0.1563;
rhov    = 0.0874;
rhotau  = 0.999;
rhopir  = 0.1325;
rhopipi = 0.8537;
rhopiy  = -0.001;
rhopiv  = -0.0213;
rhoyr   = -0.9646;
rhoypi  = 0.0459;
rhoyy   = 1.0128;
rhoyv   = 0.0250;
rhovv   = 0.9001;
sigtau  = 0.0012;
sigr    = 0.0013;
sigpi   = 0.0026;
sigy    = 0.0077;
sigv    = 0.01;
sigpitau= -0.4437;
sigypi  = -0.2267;
sigytau = 0.9585;
sigvr   = 4.6064;
sigvpi  = -0.9421;
sigvy   = -0.8876;
sigvtau = -0.0945;
Lambdar = -7.2018;
Lambdapi= -16.7834;
Lambday = -26.3763;
Lambdatau=-0.0103;
Lambdav = 0;
sig4    = 0.0004;
sig8    = 0.0002;
sig16   = 0.0001;

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
// Definition of Discretionary Fiscal Policy Parameter                   //*
coffispol = 1;                                                           //*
//**************************************************************************

model(linear);

//**************************************************************************
// Definition of Modelbase Variables in Terms of Original Model Variables //*

interest   = g_r*4;                                                      //*
inflation  = g_pi+g_pi(-1)+g_pi(-2)+g_pi(-3);                            //*
inflationq = 4*g_pi;                                                     //*
outputgap  = g_y;                                                        //*
output     = g_y;                                                   //*
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
           + std_r_ *interest_;                                          //*
                                                                         //*
// Discretionary Government Spending                                     //*
                                                                         //*
//fispol = coffispol*fiscal_;                                              //*
//**************************************************************************

epsilon_r = std_r_ *interest_;// set epsilon_r = std_r_ *interest_; to allow for a contemporaneous reaction of other variables to a mp shock as in the paper
r    = U11*g_r + U12*g_pi + U13*g_y + U14*tau + U15*v;
pi   = U21*g_r + U22*g_pi + U23*g_y + U24*tau + U25*v;
g_y_obs  = U31*g_r + U32*g_pi + U33*g_y + U34*tau + U35*v;
y_4  = U41*g_r + U42*g_pi + U43*g_y + U44*tau + U45*v + sig4*eta_4;
y_8  = U51*g_r + U52*g_pi + U53*g_y + U54*tau + U55*v + sig8*eta_8;
y_12 = U61*g_r + U62*g_pi + U63*g_y + U64*tau + U65*v;
y_16 = U71*g_r + U72*g_pi + U73*g_y + U74*tau + U75*v + sig16*eta_16;
y_20 = U81*g_r + U82*g_pi + U83*g_y + U84*tau + U85*v;

//g_r = P11*g_r(-1)+ P12*g_pi(-1)+ P13*g_y(-1)+ P14*tau(-1)+ P15*v(-1)
//      +S11*epsilon_r + S12*epsilon_pi + S13*epsilon_y + S14*epsilon_tau + S15*epsilon_v;

g_pi = P21*g_r(-1)+ P22*g_pi(-1)+ P23*g_y(-1)+ P24*tau(-1)+ P25*v(-1)
       +S21*epsilon_r + S22*epsilon_pi + S23*epsilon_y + S24*epsilon_tau +S25*epsilon_v;

g_y = P31*g_r(-1)+ P32*g_pi(-1)+ P33*g_y(-1)+ P34*tau(-1)+ P35*v(-1)
      +S31*epsilon_r + S32*epsilon_pi + S33*epsilon_y + S34*epsilon_tau + S35*epsilon_v;

tau = P41*g_r(-1)+ P42*g_pi(-1)+ P43*g_y(-1)+ P44*tau(-1)+ P45*v(-1)
      +S41*epsilon_r + S42*epsilon_pi + S43*epsilon_y + S44*epsilon_tau + S45*epsilon_v;

v = P51*g_r(-1)+ P52*g_pi(-1)+ P53*g_y(-1)+ P54*tau(-1)+ P55*v(-1)
      +S51*epsilon_r + S52*epsilon_pi + S53*epsilon_y + S54*epsilon_tau + S55*epsilon_v;


P_y_4 = 4*y_4 - r;
P_y_8 = 4*y_8 - r;
P_y_12 = 4*y_12 - r;
P_y_16 = 4*y_16 - r;
P_y_20 = 4*y_20 - r;
y_4_a  =4*y_4;
P_y_4_a=4*(Q11*g_r+ Q12*g_pi+ Q13*g_y+ Q14*tau+ Q15*v);
g_pi_a =4*g_pi;
y_8_a  =4*y_8 ;
P_y_8_a=4*(Q21*g_r+ Q22*g_pi+ Q23*g_y+ Q24*tau+ Q25*v);
r_a    =4*r;
y_12_a =4*y_12;
P_y_12_a=4*(Q31*g_r+ Q32*g_pi+ Q33*g_y+ Q34*tau+ Q35*v);
y_16_a =4*y_16;
P_y_16_a=4*(Q41*g_r+ Q42*g_pi+ Q43*g_y+ Q44*tau+ Q45*v);
y_20_a =4*y_20;
P_y_20_a=4*(Q51*g_r+ Q52*g_pi+ Q53*g_y+ Q54*tau+ Q55*v);
end;

%resid;
//check;
shocks;
//var epsilon_r  = (10000);
var epsilon_pi = (10000);
var epsilon_y  = (10000);
var epsilon_tau= (10000);
var epsilon_v  = (10000);
var eta_4      = (10000);
var eta_8      = (10000);
var eta_16     = (10000);
//var interest_
end;



//stoch_simul(order=1, irf=20,irf_shocks=(epsilon_y));// ,P_y_4 P_y_8 P_y_12 P_y_16 P_y_20;//epsilon_tau,epsilon_pi
//output y_4_a P_y_4_a inflation y_8_a P_y_8_a r_a y_12_a P_y_12_a v y_16_a P_y_16_a tau y_20_a P_y_20_a;
