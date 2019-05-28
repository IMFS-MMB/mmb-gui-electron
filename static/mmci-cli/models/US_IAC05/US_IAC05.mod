//**************************************************************************
// A New Comparative Approach to Macroeconomic Modeling and Policy Analysis
//
// Volker Wieland, Tobias Cwik, Gernot J. Mueller, Sebastian Schmidt and
// Maik Wolters
//
// Working Paper, 2009
//**************************************************************************

// Model: US_IAC05

// Further references:
// Matteo Iacoviello. 2005. "House Prices, Borrowing Constraints, and Monetary Policy in the Business Cycle"
// the American Economic Review 95, pp. 739-764.

// Implemented by Denis Gorea
// Flexible price case added by E. Afanasyeva
// Last edited: 2010/04/28 by E. Afanasyeva

// This code is an adoption of the code provided on the author's webpage
// Comment: Flexible price case is added.


var
//% basic endogenous variables
Yhat chat c1hat c2hat Ihat Khat Xhat qhat bhat b2hat hhat h2hat pihat Rhat rrhat
// flexible price counterparts
Yhatf chatf c1hatf c2hatf Ihatf Khatf qhatf bhatf b2hatf hhatf h2hatf rrhatf

//% Endogenous variables with exogenous dynamics
jhat,
Ahat,
uhat,

//**************************************************************************
// Modelbase Variables                                                   //*
    interest inflation inflationq output outputgap;                      //*
//**************************************************************************


//% Declaration of exogenous variables (shocks)
varexo
ejhat,
euhat,
eAhat,
//eRhat,

//**************************************************************************
// Modelbase Shocks                                                      //*
        interest_;                                                       //*
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
        std_r_ std_r_quart                                               //*
//**************************************************************************
//% deep parameters
beta,
beta2,
gamma,
j,
eta,
my,
ypsilon,
psi,
delta,
fie,
fih,
X,
theta,
alfa,
m,
m2,
rhou,
rhoj,
rhoA,
sigmau,
sigmaj,
sigmaA,
//%sigmaR,
rR,
rpi,
rY,
h1ss,                      //% h1ss is steady state stock of houses owned by
                           //% patient hoeseholds
gammae,
gammah,
omega,
kappa,
s1,
s2,
qhtoY,
btoY,
c1toY,
qh1toY,
qh2toY,
htoh1,
h2toh1,
b2toY,
c2toY,
ctoY,
ItoY,
jota,
jota2,
R;



//% Setting of numerical values for parameters
beta = 0.99;
beta2 = 0.95;
gamma = 0.98;
j = 0.1;
eta = 1.01;
my = 0.3;
ypsilon = 0.03;
psi = 2;
delta = 0.03;
fie = 0;
fih = 0;
X = 1.05;
theta = 0.75;
alfa = 0.64;
m = 0.89;
m2 = 0.55;
rhou = 0.59;
rhoj = 0.85;
rhoA = 0.03;
sigmau = 0.17;
sigmaj = 24.89;
sigmaA = 2.24;
sigmaR = 0.29;
rR = 0.73;
rpi = 0.27;
rY = 0.13;

//%rY=0;
//%alfa=0.99999;
//%my=0;


//% Defined parameters
gammae = (1-m)*gamma + m*beta;
gammah = beta2+m2*(beta-beta2);
omega = (beta2-m2*beta2)/(1-m2*beta);
kappa = (1-theta)*(1-beta*theta)/theta;
s1 = (alfa*(1-my-ypsilon)+X-1)/X;
s2 = (1-alfa)*(1-my-ypsilon)/X;
qhtoY = gamma*ypsilon/(X*(1-gammae));
btoY = beta*m*qhtoY;


qh1toY = j*s1/(1-beta)+j*m*qhtoY+j*m2*s2/(1-beta2-m2*(beta-beta2-j*(1-beta)));
qh2toY = j*s2/(1-beta2-m2*(beta-beta2-j*(1-beta)));

c1toY = s1+(1-beta)*(m*qhtoY+m2*qh2toY) ;

htoh1 = qhtoY/qh1toY;
h2toh1 = qh2toY/qh1toY;

b2toY = j*beta*m2/(1-beta2-m2*(beta-beta2)+j*m2*(1-beta))*s2 ;

c2toY = s2*(1-beta2-m2*(beta-beta2))/(1-beta2-m2*(beta-beta2)+j*m2*(1-beta));

ctoY = (my+ypsilon-delta*gamma*my/(1-gamma*(1-delta))-(1-beta)*m*X*qhtoY)/X;
ItoY = 1-ctoY-c1toY-c2toY;
jota = (1-beta)*htoh1;
jota2 = (1-beta)*h2toh1;
R = 1/beta;

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

interest   = Rhat*4;                                                     //*
inflation  = pihat+pihat(-1)+pihat(-2)+pihat(-3);                        //*
inflationq = pihat*4;                                                    //*
output  = Yhat;                                                          //*
outputgap = Yhat-Yhatf;                                                  //*
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

Yhat = ctoY*chat+c1toY*c1hat+c2toY*c2hat+ItoY*Ihat;

c1hat = c1hat(+1)-rrhat;

Ihat = Khat(-1)+gamma*(Ihat(+1)-Khat)+(1-gamma*(1-delta))*(Yhat(+1)-Xhat(+1)-Khat)/(psi)
     +(chat-chat(+1))/(psi);

qhat = gammae*qhat(+1)+(1-gammae)*(Yhat(+1)-Xhat(+1)-hhat)-m*beta*rrhat
     -(1-m*beta)*(chat(+1)-chat)-fie*(hhat-hhat(-1)-gamma*(hhat(+1)-hhat));

qhat = gammah*qhat(+1)+(1-gammah)*(jhat-h2hat)-m2*beta*rrhat+(1-m2*beta)*(c2hat-omega*c2hat(+1))
     -fih*(h2hat-h2hat(-1)-beta2*(h2hat(+1)-h2hat));

qhat = beta*qhat(+1)+(1-beta)*jhat+jota*hhat+jota2*h2hat+c1hat-beta*c1hat(+1)
     +fih*(htoh1*(hhat-hhat(-1))+h2toh1*(h2hat-h2hat(-1))-beta*htoh1*(hhat(+1)-hhat)-beta*h2toh1*(h2hat(+1)-h2hat));

bhat = qhat(+1)+hhat-rrhat;

b2hat = qhat(+1)+h2hat-rrhat;

Yhat = eta*(Ahat+ypsilon*hhat(-1)+my*Khat(-1))/(eta-(1-ypsilon-my))
     -(1-ypsilon-my)*(Xhat+alfa*c1hat+(1-alfa)*c2hat)/(eta-(1-ypsilon-my));

pihat = beta*pihat(+1)-kappa*Xhat+uhat;

Khat = delta*Ihat+(1-delta)*Khat(-1);

btoY*bhat = ctoY*chat+qhtoY*(hhat-hhat(-1))+ItoY*Ihat+R*btoY*(Rhat(-1)+bhat(-1)-pihat)
          -(1-s1-s2)*(Yhat-Xhat);

b2toY*b2hat = c2toY*c2hat+qh2toY*(h2hat-h2hat(-1))+R*b2toY*(b2hat(-1)+Rhat(-1)-pihat)-s2*(Yhat-Xhat);

//%Rhat = (1-rR)*(1+rpi)*pihat(-1)+rY*(1-rR)*Yhat(-1)+rR*Rhat(-1)+eRhat;

//% Defined variable(s)
rrhat = Rhat-pihat(+1);

//% equations for variables with exogenous AR(1)-dynamics
jhat = rhoj*jhat(-1)+ejhat;
uhat = rhou*uhat(-1)+euhat;
Ahat = rhoA*Ahat(-1)+eAhat;

//Flexible Economy Equations

Yhatf = ctoY*chatf+c1toY*c1hatf+c2toY*c2hatf+ItoY*Ihatf;

c1hatf = c1hatf(+1)-rrhatf;

Ihatf = Khatf(-1)+gamma*(Ihatf(+1)-Khatf)+(1-gamma*(1-delta))*(Yhatf(+1)-Khatf)/(psi)
     +(chatf-chatf(+1))/(psi);

qhatf = gammae*qhatf(+1)+(1-gammae)*(Yhatf(+1)-hhatf)-m*beta*rrhatf
     -(1-m*beta)*(chatf(+1)-chatf)-fie*(hhatf-hhatf(-1)-gamma*(hhatf(+1)-hhatf));

qhatf = gammah*qhatf(+1)+(1-gammah)*(jhat-h2hatf)-m2*beta*rrhatf+(1-m2*beta)*(c2hatf-omega*c2hatf(+1))
     -fih*(h2hatf-h2hatf(-1)-beta2*(h2hatf(+1)-h2hatf));

qhatf = beta*qhatf(+1)+(1-beta)*jhat+jota*hhatf+jota2*h2hatf+c1hatf-beta*c1hatf(+1)
     +fih*(htoh1*(hhatf-hhatf(-1))+h2toh1*(h2hatf-h2hatf(-1))-beta*htoh1*(hhatf(+1)-hhatf)-beta*h2toh1*(h2hatf(+1)-h2hatf));

bhatf = qhatf(+1)+hhatf-rrhatf;

b2hatf = qhatf(+1)+h2hatf-rrhatf;

Yhatf = eta*(Ahat+ypsilon*hhatf(-1)+my*Khatf(-1))/(eta-(1-ypsilon-my))
     -(1-ypsilon-my)*(alfa*c1hatf+(1-alfa)*c2hatf)/(eta-(1-ypsilon-my));

Khatf = delta*Ihatf+(1-delta)*Khatf(-1);

btoY*bhatf = ctoY*chatf+qhtoY*(hhatf-hhatf(-1))+ItoY*Ihatf+R*btoY*(rrhatf(-1)+bhatf(-1))
          -(1-s1-s2)*(Yhatf);

b2toY*b2hatf = c2toY*c2hatf+qh2toY*(h2hatf-h2hatf(-1))+R*b2toY*(b2hatf(-1)+rrhatf(-1))-s2*(Yhatf);

end;                        //% End of model block

shocks;
//var eRhat;
//stderr sigmaR;
var euhat;
stderr sigmau;
var ejhat;
stderr sigmaj;
var eAhat;
stderr sigmaA;
end;

//steady;
//stoch_simul(moments,irf=20) Rhat pihat qhat Yhat Xhat;
