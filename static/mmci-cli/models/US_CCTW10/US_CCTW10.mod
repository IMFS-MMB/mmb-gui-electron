//**************************************************************************
// A New Comparative Approach to Macroeconomic Modeling and Policy Analysis
//
// Volker Wieland, Tobias Cwik, Gernot J. Mueller, Sebastian Schmidt and
// Maik Wolters
//
// Working Paper, 2009
//**************************************************************************

// Model: US_CCTW10
// Describtion: Smets, Wouters (2007) model reestimated by Cogan et al. (2010) allowing for rule of thumb consumers

// Further references:

// Cogan, J.F., T. Cwik, J.B. Taylor and V. Wieland. 2010.
// "New Keynesian versus Old Keynesian Government Spending Multipliers", Journal of Economic Dynamics and Control 34, pp. 281-295.

// Smets, F., and R. Wouters. 2007. "Shocks and Frictions in US Business Cycles: A Bayesian DSGE-Approach."
// American Economic Review 97(3), pp. 586-606.


// Last edited: 10/12/10 by S. Schmidt

var labobs robs pinfobs dy dc dinve dw ewma epinfma zcapf rkf kf pkf cf invef
    yf labf wf rrf mc zcap rk k pk c inve y lab pinf w r a  b g qs  ms  spinf
    sw kpf kp pinf4 c_lc c_nlc debt t c_lcf c_nlcf debtf tf eg
    pinflag1 pinflag2 dlab realinterest mcf pinfobs4 gry  robs4

//**************************************************************************
// Modelbase Variables
        interest inflation inflationq outputgap output fispol;
//**************************************************************************

varexo ea eb eqs em epinf ew

//**************************************************************************
// Modelbase Shocks
  fiscal_ interest_;
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
           curvw cgy curvp constelab constepinf constebeta cmaw cmap calfa
           czcap cbeta csadjcost ctou csigma chabb ccs cinvs cfc cindw cprobw
           cindp cprobp csigl clandaw crdpi crpi crdy cry crr crhoa crhob
           crhog crhoqs crhoms crhopinf crhow ctrend cg cgamma clandap cbetabar
           cr cpie crk cw cikbar cik clk cky ciy ccy crkky cwhlc cwly conster rstar
           phi_b phi_g omega;


// fixed parameters
ctou=.025; //depreciation rate
clandaw=1.5; // SS markup labor market
cg=0.18; //exogenous spending GDP-ratio
curvp=10; //curvature Kimball aggregator goods market
curvw=10; //curvature Kimball aggregator labor market

//Set quarterly real interest rate and quarterly SS inflation rate
//rstar=0.762576;// target quarterly real interest rate
//rstar=0.5;// target quarterly gross real interest rate



// estimated parameters initialisation (mean)
crhoa=    0.9602;
crhob=    0.2222;
crhog=    0.9776;
crhoqs=   0.7054;
crhoms=0.1409;
crhopinf=0.9076;
crhow=0.9800;
cmap = 0.7029;
cmaw  = 0.8945;
csadjcost= 5.8809; //investment adjustment cost
csigma=1.2855;//coefficient of realtive risk aversion
chabb=    0.6733;  // habit persistence
cprobw=   0.7304;  //calvo parameter labor market
csigl=    1.8688;
cprobp=   0.6448; //calvo parameter goods market
cindw=    0.6170; //indexation labor market
cindp=    0.2211; //indexation goods market
czcap=    0.5146;//capital utilization
cfc=      1.6503;
crpi=     2.0520; //Taylor rule reaction to inflation
crr=      0.8180;//Taylor rule interest rate smoothing
cry=      0.0830;//Taylor rule long run reaction to output gap
crdy=     0.2321;//Taylor rule short run reaction to output gap
constepinf=0.8034; //quarterly SS inflation rate
//constepinf=0.5;
constebeta=0.1855;
//constebeta=100*((rstar/100+1)*cgamma^(-csigma)-1);
constelab=0.5839;
ctrend=0.4444; //quarterly trend growth rate to GDP
cgy=0.5223;
calfa=0.1914; //labor share in production
omega=0.5;//.2651;
phi_b=0.0531;
phi_g=0.1242;



// derived from steady state
cpie=1+constepinf/100;
cgamma=1+ctrend/100 ;
cbeta=1/(1+constebeta/100); //discount factor

clandap=cfc;
cbetabar=cbeta*cgamma^(-csigma);
//rstar=(1/cbetabar-1)*100;
cr=cpie/(cbeta*cgamma^(-csigma));
crk=(cbeta^(-1))*(cgamma^csigma) - (1-ctou);
cw = (calfa^calfa*(1-calfa)^(1-calfa)/(clandap*crk^calfa))^(1/(1-calfa));
cikbar=(1-(1-ctou)/cgamma);
cik=(1-(1-ctou)/cgamma)*cgamma;
clk=((1-calfa)/calfa)*(crk/cw);
cky=cfc*(clk)^(calfa-1);
ciy=cik*cky;
ccy=1-cg-cik*cky;
crkky=crk*cky;
cwhlc=(1/clandaw)*(1-calfa)/calfa*crk*cky/ccy;
cwly=1-crk*cky;
conster=(cr-1)*100;
//conster= constepinf+rstar;

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
coffispol = 1;                                                           //*
//**************************************************************************


model;

//**************************************************************************
// Definition of Modelbase Variables in Terms of Original Model Variables //*

interest   = r*4;                                                        //*
inflation  = pinf4;                                                 	 //*
inflationq = 4*pinf;                                                 	 //*
outputgap  = y-yf;                                                       //*
output     = y;                                                          //*
fispol     = eg;                                                         //*
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


// Original Model Code:


// flexible economy

	      0*(1-calfa)*a + 1*a =  calfa*rkf+(1-calfa)*(wf)  ;
	      zcapf =  (1/(czcap/(1-czcap)))* rkf  ;
	      rkf =  (wf)+labf-kf ;
	      kf =  kpf(-1)+zcapf ;
          //investment Euler equation
	      invef = (1/(1+cbetabar*cgamma))* (  invef(-1) + cbetabar*cgamma*invef(1)+(1/(cgamma^2*csadjcost))*pkf ) +qs ;
          pkf = -rrf-0*b+(1/((1-chabb/cgamma)/(csigma*(1+chabb/cgamma))))*b +(crk/(crk+(1-ctou)))*rkf(1) +  ((1-ctou)/(crk+(1-ctou)))*pkf(1) ;
          //Consumption Ricardian HH
	      c_nlcf = (chabb/cgamma)/(1+chabb/cgamma)*c_nlcf(-1) + (1/(1+chabb/cgamma))*c_nlcf(+1) +((csigma-1)*cwhlc/(csigma*(1+chabb/cgamma)))*(labf-labf(+1)) - (1-chabb/cgamma)/(csigma*(1+chabb/cgamma))*(rrf+0*b) + b ;
          // Consumption of Non-Ricardian HH
          c_lcf=cwhlc*(wf+labf)-1/ccy*tf;
          //aggregate consumption
          cf=(1-omega)*c_nlcf+omega*c_lcf;
          //aggregate resource constraint
	      yf = ccy*cf+ciy*invef+g  +  crkky*zcapf ;
          // aggregate production function
	      yf = cfc*( calfa*kf+(1-calfa)*labf +a );
	      wf = csigl*labf 	+(1/(1-chabb/cgamma))*c_nlcf - (chabb/cgamma)/(1-chabb/cgamma)*c_nlcf(-1) ;
          //accumulation of installed capital
	      kpf =  (1-cikbar)*kpf(-1)+(cikbar)*invef + (cikbar)*(cgamma^2*csadjcost)*qs ;
          //government budget constraint
          debtf=cr*(1/cpie*debtf(-1)+g-tf);
          //fiscal rule
          tf=phi_b*debtf(-1)+phi_g*g;


// sticky price - wage economy
          //marginal cost
	      mc =  calfa*rk+(1-calfa)*(w) - 1*a - 0*(1-calfa)*a ;
          // capital utilization
	      zcap =  (1/(czcap/(1-czcap)))* rk ;
          //rental rate of capital
	      rk =  w+lab-k ;
          // Capital installed used one period later in production
	      k =  kp(-1)+zcap ;
          //accumulation of installed capital
	      kp =  (1-cikbar)*kp(-1)+cikbar*inve + cikbar*cgamma^2*csadjcost*qs ;
          //investment Euler equation
	      inve = (1/(1+cbetabar*cgamma))* (  inve(-1) + cbetabar*cgamma*inve(1)+(1/(cgamma^2*csadjcost))*pk ) +qs ;
          //arbitrage equation for value of capital
          pk = -r+pinf(1)-0*b +(1/((1-chabb/cgamma)/(csigma*(1+chabb/cgamma))))*b +  (crk/(crk+(1-ctou)))*rk(1)+((1-ctou)/(crk+(1-ctou)))*pk(1) ;
           // Consumption of Ricardian HH
	      c_nlc = (chabb/cgamma)/(1+chabb/cgamma)*c_nlc(-1) + (1/(1+chabb/cgamma))*c_nlc(+1) +((csigma-1)*cwhlc/(csigma*(1+chabb/cgamma)))*(lab-lab(+1)) - (1-chabb/cgamma)/(csigma*(1+chabb/cgamma))*(r-pinf(+1) + 0*b) +b ;
          // Consumption of Non-Ricardian HH
          c_lc=cwhlc*(w+lab)-1/ccy*t;
          //aggregate consumption
          c=(1-omega)*c_nlc+omega*c_lc;
          //aggregate resource constraint
	      y = ccy*c+ciy*inve+g + 1*crkky*zcap ;
          // aggregate production function
	      y = cfc*( calfa*k+(1-calfa)*lab +a );
          //Phillips Curve
	      pinf =  (1/(1+cbetabar*cgamma*cindp)) * ( cbetabar*cgamma*pinf(1) +cindp*pinf(-1)
               +((1-cprobp)*(1-cbetabar*cgamma*cprobp)/cprobp)/((cfc-1)*curvp+1)*(mc)  )  + spinf ;
	      w =  (1/(1+cbetabar*cgamma))*w(-1)
               +(cbetabar*cgamma/(1+cbetabar*cgamma))*w(1)
               +(cindw/(1+cbetabar*cgamma))*pinf(-1)
               -(1+cbetabar*cgamma*cindw)/(1+cbetabar*cgamma)*pinf
               +(cbetabar*cgamma)/(1+cbetabar*cgamma)*pinf(1)
               +(1-cprobw)*(1-cbetabar*cgamma*cprobw)/((1+cbetabar*cgamma)*cprobw)*(1/((clandaw-1)*curvw+1))*
               (csigl*lab + (1/(1-chabb/cgamma))*c_nlc - ((chabb/cgamma)/(1-chabb/cgamma))*c_nlc(-1) -w)
               + 1*sw ;
          //Monetary Policy Rule
	      //r =  crpi*(1-crr)*pinf +cry*(1-crr)*(y-yf) +crdy*(y-yf-y(-1)+yf(-1))+crr*r(-1) +ms  ;
          //government budget constraint
          debt=cr*(1/cpie*debt(-1)+g-t);
          //fiscal rule
          t=phi_b*debt(-1)+phi_g*g;
	      a = crhoa*a(-1)  + ea;
	      b = crhob*b(-1) + eb;
          // exogenous spending (also including net exports)
	      g = crhog*(g(-1)) +eg;
	      qs = crhoqs*qs(-1) + eqs;
	      ms = crhoms*ms(-1) + em;
          //cost push shock
	      spinf = crhopinf*spinf(-1) + epinfma - cmap*epinfma(-1);
	          epinfma=epinf;
	      sw = crhow*sw(-1) + ewma - cmaw*ewma(-1) ;
	          ewma=ew;

          //Change in hours worked
          dlab=lab(+1)-lab;
          //marginal cost flexible wages
        mcf =  calfa*rkf+(1-calfa)*(wf) - 1*a ;

// measurement equations

dy=y-y(-1)+ctrend;
dc=c-c(-1)+ctrend;
dinve=inve-inve(-1)+ctrend;
dw=w-w(-1)+ctrend;
pinfobs = 1*(pinf) + constepinf;
pinfobs4=pinfobs*4;
pinf4= pinf + pinf(-1) + pinflag2 + pinflag2(-1);
pinflag1=pinf(-1);
pinflag2=pinflag1(-1);
robs =    1*(r) + conster;
robs4=robs*4;
labobs = lab + constelab;
//Real interest rate (observable)
realinterest=robs4-pinfobs4;
gry=4*dy;
end;

shocks;
var ea;
stderr 0.4558;
var eb;
stderr 0.3007;
var fiscal_;     //eg
stderr 0.5324;
var eqs;
stderr 0.4620;
var em;
stderr 0.2434;
var epinf;
stderr 0.1356;
var ew;
stderr 0.2527;
end;


