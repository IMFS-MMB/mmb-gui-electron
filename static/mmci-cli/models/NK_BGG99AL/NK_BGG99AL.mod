// Model: NK_BGG99

// Created by Rasa Pusinskaite, e_mail: pusinskaite@wiwi.uni-frankfurt.de
// Flexible price case added by S. Schmidt
// Last edited: 06/26/2013 by V. Audzei (Adaptive Learning) based on the code by S. Schmidt

// Further references:
// Bernanke, Ben S., Mark Gertler, and Simon Gilchrist (1999) ``The Financial Accelerator in a Quantitative Business Cycle Framework''
// In: Handbook of Macroeconomics. North Holland, Amsterdam.
//**************************************************************************

var yH kH iH rH r_nH r_kH nH cH gH c_eH qH xH hH piH aH
    pi_t1H premiumH e_piH
    e_g
    yHf kHf iHf rHf r_kHf nHf cHf  qHf hHf // flexible-price variables
//**************************************************************************
// Modelbase Variables                                                   //*
        interest inflation inflationq inflationql inflationql2           //*
		inflationqls outputgap output                   				 //*
        fispol;                                                           //*
        //z zf;                                                                //*
//**************************************************************************

varexo e_a
      // e_g
      //e_rn
//**************************************************************************
// Modelbase Shocks                                                      //*
       interest_                                                         //*
       fiscal_                                                           //*
       ;                                                                 //*
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
   muv omegav gammav thetav alphav niv epsilonv etav phiv kappav betav deltav
    X CY YK IY GY C_EY KN R R_K WY GAMMA_WBAR NY DY YN
    rhov rhov_g rhov_a zetav s H;


alphav = 0.35;
omegav = 0.64/(1-alphav);
betav = 0.99;
gammav = 1-0.0272;
muv = 0.12;
deltav = 0.025;
rhov = 0.9;
rhov_a =0.99;
rhov_g = 0.95;

s = 1.005;
KN = 2;
GY = 0.2;
X = 1.1;
H = 0.25;
R = 1/betav;
R_K = s*R;
YK = X/alphav*(R_K - (1 - deltav));                                         // From (4.4) Equation
WY = (1-alphav)*omegav/(H*X);                                               // From (4.11) Equation
GAMMA_WBAR = 1-1/(gammav*s)*(betav/KN - (1-alphav)*(1-omegav)/alphav *(s-(1-deltav*betav)));   // From GNN (2003)
NY = gammav*(1-GAMMA_WBAR)*R_K/YK + (1-alphav)*(1-omegav)/X;                // From (4.13) Equation
DY = 1/YK - NY;                                                             // From (3.2) Equation
CY = WY*H - GY + (X-1)/X + (R-1)*DY;                                        // From (B.2) Equation
IY = 1/YK *deltav;                                                          // From I/K = deltav
C_EY = 1 - CY - IY - GY;                                                    // From (B.8) Equation
YN = 1/NY;
niv = 0.05;                 //0.05;
epsilonv = (1 - deltav)/((1 - deltav) + alphav*YK / X);
phiv = 0.25;
etav = 3;
thetav = 0.75;
kappav = (1-thetav)/thetav*(1-thetav*betav);
zetav = 0.11;

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
coffispol = 1/GY;                                                        //*
//**************************************************************************
// State and forward variables for learning setup                        //*

AL_Info.forwards = {'cH','r_kH','xH','piH','cHf','r_kHf','inflationq','e_piH'};
//forwards = {'cH','r_kH','kH','xH','piH','cHf','r_kHf','inflationq','piHf'};
//states_short = {'kH','rH','nH','gH','qH','aH','pi_t1H','kHf','rHf','nHf','qHf','inflationql','inflationql2','inflationq','interest'};
//states_short = {'kH','rH','nH','gH','qH','aH','pi_t1H','kHf','rHf','nHf','qHf','inflationql','inflationql2','inflationq','outputgap','interest'};
//states_long  = {'kH','rH','nH','gH','qH','aH','pi_t1H','kHf','rHf','nHf','qHf','inflationql','inflationql2','outputgap','inflationq','interest'};
//states_long  = {'kH','nH','qH','aH','kHf','qHf','inflationql','inflationql2','outputgap','inflationq'};
//states_short = {'kH','gH','qH','aH','kHf','qHf','inflationq','outputgap'};
AL_Info.states_short = {'kH','gH','qH','aH','kHf','qHf','outputgap'};
AL_Info.states_long  = {'kH','gH','qH','aH','kHf','qHf','outputgap','inflationql','inflationql2','inflationq'};
save AL_Info AL_Info
model(linear);

//**************************************************************************
// Definition of Modelbase Variables in Terms of Original Model Variables //*

interest   = 4*r_nH;                                                      //*
inflation  = 0.25 * (inflationq+inflationql+inflationql2+inflationql2(-1));//*
inflationq = 4*piH;														  //*
inflationql = inflationq(-1);                                             //*
inflationql2 = inflationql(-1);                                           //*
inflationqls = inflationql + inflationql2;                                //*
outputgap  = yH-yHf;                                                      //*
output     = yH;                                                          //*
fispol     = e_g;                                                         //*
//z=nH+rH;
//zf=nHf+rHf;
//piHf=piH(+1);
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
// Discretionary Government Spending                                     //*
                                                                         //*
fispol = coffispol*fiscal_;                                              //*
//**************************************************************************
// Original Model Code:

// Aggregate demand block
//yH = CY*cH + C_EY*c_eH + IY*iH+GY*gH;
yH = CY*cH+IY*iH+GY*gH;
cH = -rH+cH(+1);
//c_eH = nH;
c_eH = 0;
r_kH(+1) - rH = -niv*(nH-qH-kH);
r_kH = (1-epsilonv)*(yH-kH(-1)-xH)+epsilonv*qH-qH(-1);
qH = phiv*(iH-kH(-1));

// Aggregate supply block
yH = aH + alphav*kH(-1) +(1-alphav)*omegav*hH;
yH -hH-xH-cH = (etav^(-1))*hH;

pi_t1H = kappav*(-1)*xH(+1)+betav *e_piH(+1);
piH = pi_t1H(-1);
e_piH = piH(+1);

// Evolution of state variables:
kH = deltav*iH+(1-deltav)*kH(-1); // capital evolution
nH = gammav*R_K*KN*r_kH - gammav*R*KN*rH(-1)+ gammav*(R_K - R)*KN*(qH(-1) + kH(-1)) + gammav*R*(rH(-1)+nH(-1))+(1-alphav)*(1-omegav)*(YN/X)*(yH - xH);
gH = rhov_g*gH(-1)+e_g;
aH = rhov_a*aH(-1)+e_a;
//r_nH = rhov*r_nH(-1) + zetav*piH - e_rn;
rH = r_nH-piH(+1);
premiumH = r_kH(+1)-rH;


// Flexible price model (not explicitly treated in original model)

// Aggregate demand block

yHf = CY*cHf+IY*iHf+GY*gH;
cHf = -rHf+cHf(+1);
r_kHf(+1) - rHf = -niv*(nHf-qHf-kHf);
r_kHf = (1-epsilonv)*(yHf-kHf(-1))+epsilonv*qHf-qHf(-1);
qHf = phiv*(iHf-kHf(-1));

// Aggregate supply block
yHf = aH + alphav*kHf(-1) +(1-alphav)*omegav*hHf;
yHf -hHf-cHf = (etav^(-1))*hHf;


// Evolution of state variables:
kHf = deltav*iHf+(1-deltav)*kHf(-1); // capital evolution
nHf = gammav*R_K*KN*r_kHf - gammav*R*KN*rHf(-1)+ gammav*(R_K - R)*KN*(qHf(-1) + kHf(-1)) + gammav*R*(rHf(-1)+nHf(-1))+(1-alphav)*(1-omegav)*(YN/X)*(yHf);

end;


shocks;
var e_a; stderr 0.4582;
var fiscal_; stderr 0.05291;  //e_g
var interest_; stderr 0;
end;

//stoch_simul(IRF=0) yH outputgap inflation interest;
