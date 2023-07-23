//**************************************************************************
// A New Comparative Approach to Macroeconomic Modeling and Policy Analysis
//
// Volker Wieland, Tobias Cwik, Gernot J. Mueller, Sebastian Schmidt and
// Maik Wolters
//
// Working Paper, 2009
//**************************************************************************

// Model: BRA_SAMBA08

// Further references:
// Gouvea, Solange, Andr� Minella, Rafael Santos, and Nelson Souza-Sobrinho (September 2008)
//"Samba: Stochastic Analytical Model with a Bayesian Approach".
// Working Paper.

// Created by: 2010/08/02 by Ali Mazyaki
// Last edited: S. Schmidt, 2010/10/07

// See pages Gouvea et al. (2008) for model equations

var co crot c no nrot n q wr k u fii qi i x m rk mc pi bystar nxy r gy syhat
bby g y yva piva pibar sgbar zc zn zi zfiistar zfii a zr zg  mstar pistar rstar g_

//**************************************************************************
// Modelbase Variables                                                   //*
   interest inflation inflationq outputgap output fispol;                //*

//**************************************************************************

varexo pibar_ gbar_ c_ n_ i_ fiistar_ fii_ a_ mstar_ pistar_ rstar_ r_

//**************************************************************************
// Modelbase Shocks                                                      //*
       interest_  fiscal_;                                                //*
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
beta alpha sigma pessi kappa h omegabarb tet nuu kuu vi del dela
dels sc si sg sm sx sva sd omegabarc omegabarn iok fiistar rstarC bystarC rC
byC gamar gamapi gamay gamag gamas gamab rhoa rhoc rhoi rhon rhoq rhor rhog
rhosbar rhopi rhofii rhofiistar rhomstar rhorstar rhopistar;


beta = 0.98;
alpha = 0.4;
sigma = 0.823;
pessi=0.04;
kappa = 1.014;
h = 0.218;
omegabarb=0.239;
tet=0.906;
nuu=0.338;
kuu=1.406;
vi=0.672;
del=0.025;
dela=1;
dels=3.997;
sc=0.555;
si=0.147;
sg=0.176;
sm=0.109;
sx=0.121;
sva=0.891;
sd=0.891;
omegabarc=0.4;
omegabarn=0.8;
iok=0.03;
fiistar=1.016;
rstarC=1.009;
bystarC=0.033;
rC=1.042;
byC=1.028;

gamar=0.682;
gamapi=1.523;
gamay=0.839;
gamag=0.695;
gamas=0.465;
gamab=0.17;

rhoa = 0.985;
rhoc = 0.7;
rhoi = 0.28;
rhon = 0.74;
rhoq = 0.0;
rhor = 0.0;
rhog = 0.0;
rhosbar = 0.915;
rhopi = 0.937;
rhofii = 0.867;
rhofiistar = 0.64;
rhomstar = 0.257;
rhorstar = 0.848;
rhopistar = -0.139;



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
std_r_ = 1;
                                                                         //*
// Definition of Discretionary Fiscal Policy Parameter                   //*
coffispol = 1;                                                           //*
//**************************************************************************

model(linear);

//**************************************************************************
// Definition of Modelbase Variables in Terms of Original Model Variables //*

interest   = r*4;                                                       //*
inflation = (1/4)*(4*pi+4*pi(-1)+4*pi(-2)+4*pi(-3))*1;     	          //*
inflationq  = pi*4;                                                     //*
outputgap  = yva*1;                                                     //*
output = y*1;                                                           //*
fispol = g_;                                                              //*
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
fispol = coffispol*fiscal_;                                              //*
//**************************************************************************

// Original Taylor rule:
// r = gamar*r(-1)+(1-gamar)*(gamapi*(pi(+1)-pibar(+1))+pibar+gamay*yva)+zr;

// Original fiscal policy rule:
gy = gamag*gy(-1)+(1-gamag)*(gamas*syhat(-1)- gamab*bby(-1)) + zg;

// Original Model Code:
co = (1/(1+h))*co(+1)+(h/(1+h))*co(-1)-sigma^(-1)*((1-h)/(1+h))*(r-pi(+1))+sigma^(-1)*((1-h)/(1+h))*(1-rhoc)*zc;
crot= wr+nrot;
c = (1-omegabarc)*co + omegabarc*crot;
no = nuu^(-1)*(wr-(sigma/(1-h))*(co-h*co(-1))-zn);
nrot = nuu^(-1)*(wr-(sigma/(1-h))*(crot-h*crot(-1))-zn);
n = (1-omegabarn)*no + omegabarn*nrot;
q = q(+1)-((r-pi(+1))-(rstar+fii-pistar(+1)));
n = y-(1-kuu)*a-(kuu+alpha*(1-kuu))*wr+alpha*(1-kuu)*rk+kuu*mc;
k(-1) + u = y-(1-kuu)*a-(1-alpha*(1-kuu))*rk+(1-kuu)*(1-alpha)*wr+kuu*mc;
fii = -pessi*bystar+vi*zfiistar+zfii;
qi = beta*(1-del)*qi(+1)+(1-beta*(1-del))*rk(+1)-(r-pi(+1));
i = (1/(dels*(1+beta)))*qi+(beta/(1+beta))*i(+1)+(1/(1+beta))*i(-1)+((1-rhoi*beta)/(1+beta))*zi;
k = (1-del)*k(-1)+iok*i;
x = mstar+kappa*q;
m = y-kuu*(q-mc);
rk = dela*u;
mc = sd*(alpha*rk+(1-alpha)*wr-a)+(1-sd)*q;
pi = ((1-tet*beta)*(1-omegabarb)*(1-tet)/(tet+omegabarb*(1-tet*(1-beta))))*mc+(omegabarb/(tet+omegabarb*(1-tet*(1-beta))))*pi(-1)+(tet*beta/(tet+omegabarb*(1-tet*(1-beta))))*pi(+1);
bystar = fiistar*rstarC*(bystar(-1)+nxy+bystarC*(yva(-1)-yva+(1/sva)*(q-q(-1))-pistar))+bystarC*(fii+rstar);
nxy = (sx/sva)*x-(sm/sva)*m-((sx-sm)/sva)*yva-(sm/sva)*((1-sx)/sva)*q;

syhat + sgbar = -gy;
bby = rC*(bby(-1)+gy-byC*(yva-yva(-1)+piva))+byC*r;
g = yva+(sva/sg)*gy-(sm/sva)*q;
y = sc*c+si*i+sg*g+sx*x;
yva = (1/sva)*y-(sm/sva)*m;
piva = pi-(sm/sva)*(q-q(-1));
pibar = rhopi*pibar(-1)+pibar_;
sgbar = rhosbar*sgbar(-1)+gbar_;
zc = rhoc*zc(-1) + c_;
zn = rhon*zn(-1) + n_;
zi = rhoi*zi(-1) + i_;
zfiistar = rhofiistar*zfiistar(-1) + fiistar_;
zfii = rhofii*zfii(-1) + fii_;
a = rhoa*a(-1) + a_;
zr = rhor*zr(-1) + r_;
zg = rhog*zg(-1) + g_;
mstar = rhomstar*mstar(-1) + mstar_;
pistar = rhopistar*pistar(-1) + pistar_;
rstar = rhorstar*rstar(-1) + rstar_;
end;


shocks;
var c_ = 0.081^2;
var r_ = 0.003^2;
var mstar_ = 0.013^2;
var pibar_= 0;
var gbar_= 0;
var n_ = 0.011^2;
var i_ = 0.24^2;
var fiistar_ = 0.004^2;
var fii_ = 0.001^2;
var a_ = 0.022^2;
var fiscal_ = 0.005^2;  // replaces g_
var pistar_ = 0.002^2;
var rstar_ = 0;
end;


//stoch_simul(irf = 21, ar=100, nograph);
