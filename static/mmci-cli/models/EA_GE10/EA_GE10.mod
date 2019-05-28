//**************************************************************************
// A New Comparative Approach to Macroeconomic Modeling and Policy Analysis
//
// Volker Wieland, Tobias Cwik, Gernot J. Mueller, Sebastian Schmidt and
// Maik Wolters
//
// Working Paper, 2009
//**************************************************************************

// Model: EA_GE10

// Further references:
// Gelain, Paolo. 2010. "The external finance premium in the euro area: A dynamic stochastic general equilibrium analysis"
// North american Journal of Economics and finance 21, pp. 49-71.


// This is a version of the model with financial accelerator and
// estimation with data from ECB until 2008 q3 without epi
// and without S as a varobs (author's comment)

// Last edited: 03/08/11 by M.Jancokova

var   r c l inv q k nw rk y pi z mc a x eb el S g rn wp EMP ypot
      cf invf qf rkf rf kf wpf lf zf mcf ug
      //thetae; epi

//**************************************************************************
// Modelbase Variables                                                   //*
   interest inflation inflationq output outputgap fispol;                //*
//**************************************************************************

varexo ux ub ul ua ulambdapi uw
       //uq; uthetae upi  ur

//**************************************************************************
// Modelbase Shocks                                                      //*
       interest_ fiscal_;                                                //*
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
             alpha beta delta theta RR S_ss rhob vkappa thetae  phim rhol rhox rhopi rhoa  NWK KNW Rk  xie
             rpi ry  h rhog sigmal sigmac  cw  gammaw  lambdaw gammapi pis FI  phi rdeltapi rdeltay
             GAMMA thetaest c_y gz
             //Xi //epsilon //thetaf //rhothetae //GY //Z_ss //KY

            //additional local variables defined
            Z_ss mc_ss abar w_ss l_k k_y inv_y GY c_kap kap_ss
            cons_ss inv_ss Y_ss lab_ss KY ZF_ss mcF_ss wF_ss l_kF
            k_yF inv_yF g_yF c_kF kapF_ss consF_ss invF_ss yF_ss labF_ss KYF;


//calibrated parameters

beta=0.99;                  //discount factor
RR=(1/beta);
delta=0.025;                //capital depreciation rate
S_ss=1+(0.02/4);            //SS level of the finance premium
alpha=0.3;                  //capital share on output
Rk=S_ss*RR;
KNW=2;                      //capital net worth ratio
NWK=1/KNW;
rhopi=1;
lambdaw=3;                  //SS wage markup
//KY=8.8;
//thetaf=0.00000001;
//GY=0.195;
//Z=0.04;
thetaest=6;                 //goods elasticity of substitution
c_y=0.6;                    //consumption-output ratio
gz=1;

//posterior means of estimated parameters

vkappa=0.0267;              //elasticity of external finance premium w.r.t. the leverage ratio
phim=0.9075;                //smooth parameter in instrument rule
thetae=0.9797;              //entrepreneur's rate of survival
rhob=0.8969;                //persistence param. preference shock
rhol=0.9707;                //persistence param. labor supply shock
rhox=0.6941;                //persistence param. invest.specific shock
rhoa=0.9644;                //persistence param. technology shock
rhog=0.8685;                //persistence param. gov.spending shock
rpi=1.6633;                 //response of int.rate to inflation
ry=0.1054;                  //response of int.rate to output
h=0.6551;                   //habit formation
sigmal=2.0183;              //inverse of the elasticity of work effort w.r.t. real wage
sigmac=1.5081;              //inverse of elasticity of substitution in consumption
gammaw=0.3892;              //past wage indexation
gammapi=0.2784;             //past inflation indexation
cw=0.8768;                  //Calvo wage
theta=0.8618;               //Calvo price
pis=6.5431;                 //inverse of investments adjustment cost
phi=0.1657;                 //fixed cost over output
FI=0.0294;                  //inverse elast. capital util. cost function
rdeltapi=0.1417;            //response of int.rate to infl. first diff.
rdeltay=0.2061;             //response of int.rate to output growth
xie=0.7458;                 //Calvo employment


Z_ss=S_ss*(1/beta)-1+delta;
mc_ss=(thetaest-1)/thetaest;
abar=alpha^alpha*(1-alpha)^(1-alpha);
w_ss=(mc_ss*abar/Z_ss^alpha)^(1/(1-alpha));
l_k=(1-alpha)/alpha*(Z_ss/gz)/w_ss;
k_y=l_k^(alpha-1)*(1+phi)*gz^alpha;
inv_y=delta*l_k^(alpha-1)*(1+phi); //inv/y
GY=1-(c_y+inv_y);
c_kap=(1-GY)/(1+phi)*l_k^(1-alpha)-delta;  // c/k
kap_ss=( w_ss*(lambdaw-1)/lambdaw*((1-h)*c_kap)^(-sigmac)*l_k^(-sigmal) )^(1/(sigmac+sigmal));
cons_ss=c_kap*kap_ss;
inv_ss=delta*kap_ss;
Y_ss=(cons_ss+inv_ss)/(1-GY);
lab_ss=l_k*kap_ss;
KY=kap_ss/Y_ss;

ZF_ss=1/beta-1+delta;
mcF_ss=(thetaest-1)/thetaest;
wF_ss=(mcF_ss*abar/ZF_ss^alpha)^(1/(1-alpha));
l_kF=(1-alpha)/alpha*(ZF_ss/gz)/wF_ss;
k_yF=l_kF^(alpha-1)*(1+phi)*gz^alpha;
inv_yF=delta*l_kF^(alpha-1)*(1+phi);
g_yF=1-(c_y+inv_yF);
c_kF=(1-g_yF)/(1+phi)*l_kF^(1-alpha)-delta;  //c/k
kapF_ss=( wF_ss*(lambdaw-1)/lambdaw*((1-h)*c_kF)^(-sigmac)*l_kF^(-sigmal) )^(1/(sigmac+sigmal));
consF_ss=c_kF*kapF_ss;
invF_ss=delta*kapF_ss;
yF_ss=(consF_ss+invF_ss)/(1-g_yF);
labF_ss=l_kF*kapF_ss;
KYF=kapF_ss/yF_ss;

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
                                                                         //*
coffispol = 1/GY;                                                        //*
//**************************************************************************

model;

//**************************************************************************
// Definition of Modelbase Variables in Terms of Original Model Variables//*
                                                                         //*
interest   = rn*4;                                                       //*
inflation  = pi+pi(-1)+pi(-2)+pi(-3);                                    //*
inflationq = pi*4;                                                       //*
outputgap  = y-ypot;                                                     //*
output     = y;                                                          //*
fispol     = ug;                                                         //*
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


// WARNING:  z IS THE MARGINAL PRODUCTIVITY OF CAPITAL AND IT IS ALSO THE RENTAL RATE OF CAPITAL
//                HENCE IN THE PRODCTION FUNCTION AND IN THE LABOUR DEMAND EQUATION THERE IS NOT RK,
//                WHIHC IS THE RETURN ON CAPITAL, BUT z. (author's note)


//**********************************
//STICKY ECONOMY (prices and wages)
//**********************************

//Resource constraint
y=(1-delta*KY-GY)*c+delta*KY*inv+GY*g+KY*FI*Z_ss*z+KY*(Rk-RR)*(1-NWK)*(rk+q(-1)+k);

//Euler equation
c=(1/(1+h))*c(+1)+(h/(1+h))*c(-1)-((1-h)/((1+h)*sigmac))*(rn-pi(+1))+
     ((1-h)/((1+h)*sigmac))*(eb);

//External finance premium (Financial accelerator mechanism)
rk(+1)=r-vkappa*(nw-q(-1)-k);

//Ex-post aggregate return to capital
rk = (Z_ss*z+(1-delta)*q)/(1-delta+Z_ss)-q(-1);

//Real marginal cost
z=mc+y-k(-1);

//Investment dynamics
inv=(1/(1+beta))*inv(-1)+(beta/(1+beta))*inv(+1)+((1/pis)/(1+beta))*q+x;

//Production function
y/(1+phi) = alpha*(k(-1)+FI*z)+(1-alpha)*l+a;

//Wage equation
wp=(beta/(1+beta))*wp(+1)+(1/(1+beta))*wp(-1)+(beta/(1+beta))*pi(+1)-((1+beta*gammaw)/(1+beta))*pi
    +(gammaw/(1+beta))*pi(-1)-(1/(1+beta))*(((1-beta*cw)*(1-cw))/((1+(((1+lambdaw)*sigmal)/lambdaw))*cw))
    *(wp-sigmal*l-(sigmac/(1-h))*(c-h*c(-1))+el)+uw; //% condition on labour supply wiht wage stickiness and time varying wage mark up

//Return on capital
l=-wp+(1+FI)*z+k(-1);

//NK Phillips curve
pi=((((1-theta)*(1-theta*beta))/theta)/(1+(beta*gammapi)))*(mc)+(beta/
    (1+(beta*gammapi)))*(pi(+1))+(gammapi/(1+(beta*gammapi)))*(pi(-1))+ulambdapi;

//Capital's law of motion
k=(1-delta)*k(-1)+(delta)*(inv+pis*x) ;

//Aggregate entrepreneurial net worth
nw=thetae*((KNW)*RR*(S_ss*rk(-1)-r(-1))+(KNW)*RR*(S_ss-1)*(q(-2)+k(-1))+RR*(r(-1)+nw(-1)));

//Real interest rate
r=rn-pi(+1);

//Monetary policy rule
//rn=phim*rn(-1)+(1-phim)*(rpi*(pi(-1))+ry*(y(-1)-ypot(-1)))+rdeltapi*(pi-pi(-1))
//   +rdeltay*(y-ypot-(y(-1)-ypot(-1)))+ur; %%%% FOR FLEXIBLE ECONOMY without epi

//log SS finance premium
S=rk(+1)-r;

(EMP-EMP(-1)) = beta*(EMP(+1)-EMP)+(1-xie)*(1-xie*beta)/(xie)*(l-EMP);


//************************************
//FLEXIBLE ECONOMY (prices and wages)
//************************************

ypot=(1-delta*KYF-g_yF)*cf+delta*KYF*invf+g_yF*g-KYF*FI*ZF_ss*zf;

cf=(1/(1+h))*cf(+1)+(h/(1+h))*cf(-1)-((1-h)/((1+h)*sigmac))*(rf)+
    ((1-h)/((1+h)*sigmac))*(eb);

rkf(+1)=rf;

rkf = (ZF_ss*zf+(1-delta)*qf)/(1-delta+ZF_ss)-qf(-1);

zf=mcf+ypot-kf(-1);

invf=(1/(1+beta))*invf(-1)+(beta/(1+beta))*invf(+1)+((1/pis)/(1+beta))*qf+x;

ypot/(1+phi) = alpha*(kf(-1)+FI*zf)+(1-alpha)*lf+a;

wpf=sigmal*lf+((sigmac)/(1-h))*cf-((sigmac)/(1-h))*cf(-1)+el;

lf=-wpf+(1+FI)*zf+kf(-1);

mcf=0;

kf =  (1-delta)*kf(-1)+(delta)*(invf+pis*x) ;

//***********************
//AR(1) shock processes
//***********************

eb=rhob*eb(-1)+ub;          // preference shock
a=rhoa*a(-1)+ua;            // technology shock
x=rhox*x(-1)+ux;            // investment specific shock
el=rhol*el(-1)+ul;          // labour supply shock
g=rhog*g(-1)+ug;            // government expenditure shock
end;

//check;

shocks;
var ub=0.2665^2;            // preference shock
var ul=1.415^2;             // labor supply shock
var ux=0.3237^2;            // inv.specific shock
var ua=0.7534^2;            // technology shock
//var ur=0.1325^2;            // MP shock
//var ug=1.2456^2;            // gov.spending shock
var uw=0.2079^2;            // wage markup shock
var ulambdapi=0.1743^2;     // price markup shock

var fiscal_=1.2456^2;  //instead of ug
var interest_=0;
end;










