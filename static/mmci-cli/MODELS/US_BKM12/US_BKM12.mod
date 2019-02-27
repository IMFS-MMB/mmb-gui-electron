// Model: US_BKM12

// References:
// Title: "Reset Price Inflation and the Impact of Monetary Policy Shocks"
// Journal published: American Economic Review 2012, 102(6): 2798--2825
// Authors: Mark Bils, Peter J. Klenow, and Benjamin A. Malin
// This model is corresponding to Table 4(1) in the paper.

// Important note:
// Some parameters are adjusted for corresponding to quarterly frequency. 
// (Only in case that clear logics for the change can be provided, for example, 
// AR(1) coefficients, the adjustments are made) 
// References for parameter adjustments: Monacelli et al. (2010): 541--542, 
// Smets and Wouters (2007): 593, Bils et al.(2012): appendix.
// Last edited: 26/04/18 by Changnam Son

var   labobs robs pinfobs dy dc dinve dw ewma epinfma
	  zcapf rkf kf pkf cf invef yf labf wf rrf kpf
	  mc zcap rk k pk c inve y lab pinf w r kp 
	  a b g qs  spinf sw // ms


//**************************************************************************
// Modelbase Variables                                                   //*
        interest inflation inflationq outputgap output; // fispol;       //*
//**************************************************************************
 

varexo ea eb eg eqs epinf ew // em 


//**************************************************************************
// Modelbase Shocks                                                      //*       
       interest_ ;// fiscal_                                             //*
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

 curvw cgy curvp constelab constepinf constebeta cmaw cmap calfa  czcap 
 cbeta  csadjcost ctou csigma chabb cfc cindw cprobw cindp cprobp csigl
 clandaw crpi crdy cry crr  crhoa crhob crhog crhoqs crhoms crhopinf crhow  
 ctrend conster cg cgamma clandap cbetabar cr cpie crk cw cikbar cik clk 
 cky ciy ccy crkky cwhlc cwly ;


// Fixed parameters (Baseline model, correspoding to table 4 (a))
//        adjusted (quarterly) // how to adjust               // parameter description 
ctou=          0.025;          //   0.017*(3/2)               // depreciation rate  
clandaw=       1.5  ;          //                             // SS markup in the labor market
cg=            0.18 ;          //                             // spending-GDP ratio 
curvp=         10   ;          //                             // curvature in the goods market
curvw=         10   ;          //                             // curvature in the labor market



// Estimated parameters (Baseline model, correspoding to table 4 (a))
//        adjusted (quarterly) // how to adjust               // parameter description  
csadjcost=     5.499*3/2;      //                             // adjustment cost (i)  *reference: 
csigma=        1.144;          //                             // EIS
chabb=         0.637*2/3;      //                             // external habit 
cprobw=        0.819;          // 1-(1-0.879)*(3/2)           // Calvo (w): adjusted to have the same average duration,  cf) SW(07): 0.70
csigl=         0.964;          //                             // elasticity of labor supply   
cprobp=        0.877;          // 1-(1-0.918)*(3/2)           // Calvo (p): adjusted to have the same average duration,  cf) SW(07): 0.66
cindw=         0.314;          //                             // indexation (w): weight between Pi(-1) and SS Pi
cindp=         0.671;          //                             // indexation (p): weight between Pi(-1) and SS Pi
czcap=         0.590;          //                             // capacity utilization elasticity
cfc=	       1.586;          //                             // 1+share of fixed cost in production

//crpi=        1.127;          //                             // MP rule: inflation
//crr=         0.929;          // 0.952^(3/2)                 // MP rule: AR(1)
//cry=         0.269;          // 0.179*(3/2)                 // MP rule: output gap
//crdy=        0.042;          // 0.028*(3/2)                 // MP rule: output gap change

constepinf =   0.762;          // 0.508*(3/2)                 // SS inflation
constebeta =   0.258;          // 100*((1+0.172/100)^(3/2)-1) // discount rate: constebeta=100*(1/beta-1)
constelab =   -2.792;          //                             // SS hours worked, which is normalized to zero
ctrend =       0.350;          // 0.233*(3/2)                 // trend growth rate
calfa=         0.209;          //                             // share of capital

crhoa=         0.930;          // 0.953^(3/2)                 // AR(1) productivity disturbance
crhob=         0.952;          // 0.968^(3/2)                 // AR(1) risk premium disturbance 
crhog=         0.949;          // 0.966^(3/2)                 // AR(1) government spending disturbance
crhoqs=        0.967;          // 0.978^(3/2)                 // AR(1) investment disturbance
//crhoms=      0.397;          // 0.540^(3/2)                 // AR(1) monetary policy disturbance
crhopinf=      0.165;          // 0.301^(3/2)                 // AR(1) price mark-up disturbance
crhow=         0.063;          // 0.159^(3/2)                 // AR(1) wage mark-up disturbance
cmap =         0.462;          // 0.598^(3/2)                 // MA(1) price mark-up disturbance
cmaw =         0.188;          // 0.328^(3/2)                 // MA(1) wage mark-up disturbance
cgy  =         1.166;          //                             // reaction of government spending to productivity shock


// Derived parameters 
cpie=1+constepinf/100;
cgamma=1+ctrend/100 ;
cbeta=1/(1+constebeta/100);
clandap=cfc;
cbetabar=cbeta*cgamma^(-csigma);
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


//**************************************************************************
// Specification of Modelbase Parameters                                 //*
                                                                         //*
// Load Modelbase Monetary Policy Parameters                             //*
thispath = cd;                                                           
cd('..');                                                                
load policy_param.mat;                                                   
for i=1:33                                                               
    deep_parameter_name = M_.param_names(i,:);                           
    eval(['M_.params(i)  = ' deep_parameter_name ' ;'])                  
end                                                                      
cd(thispath);       
                                                                         //*
// Definition of Discretionary Fiscal Policy Parameter                   //*
// coffispol = 1;                                                        //*
//**************************************************************************



model(linear); 

//**************************************************************************
// Definition of Modelbase Variables in Terms of Original Model Variable //*

interest   = 4*r;                                                        //*
inflation  = pinf+pinf(-1)+pinf(-2)+pinf(-3);                            //*
inflationq = 4*pinf;                                                     //*
outputgap  = y-yf;                                                       //*
output     = y;                                                          //*
//fispol   = epsinno_G;                                                  //*
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
// fispol = coffispol*fiscal_;                                           //*
//**************************************************************************

// flexible economy

	      0*(1-calfa)*a + 1*a =  calfa*rkf+(1-calfa)*(wf)  ;
	      zcapf =  (1/(czcap/(1-czcap)))* rkf  ;
	      rkf =  (wf)+labf-kf ;
	      kf =  kpf(-1)+zcapf ;
	      invef = (1/(1+cbetabar*cgamma))* (  invef(-1) + cbetabar*cgamma*invef(1)+(1/(cgamma^2*csadjcost))*pkf ) +qs ;
          pkf = -rrf-0*b+(1/((1-chabb/cgamma)/(csigma*(1+chabb/cgamma))))*b +(crk/(crk+(1-ctou)))*rkf(1) +  ((1-ctou)/(crk+(1-ctou)))*pkf(1) ;
	      cf = (chabb/cgamma)/(1+chabb/cgamma)*cf(-1) + (1/(1+chabb/cgamma))*cf(+1) +((csigma-1)*cwhlc/(csigma*(1+chabb/cgamma)))*(labf-labf(+1)) - (1-chabb/cgamma)/(csigma*(1+chabb/cgamma))*(rrf+0*b) + b ;
	      yf = ccy*cf+ciy*invef+g  +  crkky*zcapf ;
	      yf = cfc*( calfa*kf+(1-calfa)*labf +a );
	      wf = csigl*labf 	+(1/(1-chabb/cgamma))*cf - (chabb/cgamma)/(1-chabb/cgamma)*cf(-1) ;
	      kpf =  (1-cikbar)*kpf(-1)+(cikbar)*invef + (cikbar)*(cgamma^2*csadjcost)*qs ;

// sticky price - wage economy

	      mc =  calfa*rk+(1-calfa)*(w) - 1*a - 0*(1-calfa)*a ;
	      zcap =  (1/(czcap/(1-czcap)))* rk ;
	      rk =  w+lab-k ;
	      k =  kp(-1)+zcap ;
	      inve = (1/(1+cbetabar*cgamma))* (  inve(-1) + cbetabar*cgamma*inve(1)+(1/(cgamma^2*csadjcost))*pk ) +qs ;
          pk = -r+pinf(1)-0*b +(1/((1-chabb/cgamma)/(csigma*(1+chabb/cgamma))))*b + (crk/(crk+(1-ctou)))*rk(1) +  ((1-ctou)/(crk+(1-ctou)))*pk(1) ;
	      c = (chabb/cgamma)/(1+chabb/cgamma)*c(-1) + (1/(1+chabb/cgamma))*c(+1) +((csigma-1)*cwhlc/(csigma*(1+chabb/cgamma)))*(lab-lab(+1)) - (1-chabb/cgamma)/(csigma*(1+chabb/cgamma))*(r-pinf(+1) + 0*b) +b ;
	      y = ccy*c+ciy*inve+g  +  1*crkky*zcap ;
	      y = cfc*( calfa*k+(1-calfa)*lab +a );

	     pinf = (1/(1+cbetabar*cgamma*cindp)) * ( cbetabar*cgamma*pinf(1) +cindp*pinf(-1)
               +((1-cprobp)*(1-cbetabar*cgamma*cprobp)/cprobp)/((cfc-1)*curvp+1)*(mc)  )  + spinf ;
      
      // without pric indexation 
      // pinf = cbetabar*cgamma* (cprobp + (1-cprobp*cpie^(1/(clandap-1)))^(clandap)/(1-cprobp)^(clandap-1)/cpie^(1+1/(clandap-1))) * pinf(1)
      //       +((1-cbetabar*cgamma*cprobp)*(1-cprobp*cpie^(1/(clandap-1)))^(clandap)/cprobp/(1-cprobp)^(clandap-1)/cpie^(1/(clandap-1)))/((clandap-1)*curvp+1)*(mc)
      // 	   + spinf ;

	      w =  (1/(1+cbetabar*cgamma))*w(-1)
               +(cbetabar*cgamma/(1+cbetabar*cgamma))*w(1)
               +(cindw/(1+cbetabar*cgamma))*pinf(-1)
               -(1+cbetabar*cgamma*cindw)/(1+cbetabar*cgamma)*pinf
               +(cbetabar*cgamma)/(1+cbetabar*cgamma)*pinf(1)
               +(1-cprobw)*(1-cbetabar*cgamma*cprobw)/((1+cbetabar*cgamma)*cprobw)*(1/((clandaw-1)*curvw+1))*
               (csigl*lab + (1/(1-chabb/cgamma))*c - ((chabb/cgamma)/(1-chabb/cgamma))*c(-1) -w)
               + 1*sw ;
          kp =  (1-cikbar)*kp(-1)+cikbar*inve + cikbar*cgamma^2*csadjcost*qs ;

	   // r =  crpi*(1-crr)*pinf
       //      +cry*(1-crr)*(y-yf)
       //      +crdy*(y-yf-y(-1)+yf(-1))
       //      +crr*r(-1)
       //      +ms  ;
	      a = crhoa*a(-1)  + ea;
	      b = crhob*b(-1) + eb;
	      g = crhog*(g(-1)) + eg + cgy*ea;
	      qs = crhoqs*qs(-1) + eqs;
	   // ms = crhoms*ms(-1) + em;
	      spinf = crhopinf*spinf(-1) + epinfma - cmap*epinfma(-1);
	              epinfma=epinf;
	      sw = crhow*sw(-1) + ewma - cmaw*ewma(-1) ;
	           ewma=ew;
	 

// measurment equations

	dy=y-y(-1)+ctrend;
	dc=c-c(-1)+ctrend;
	dinve=inve-inve(-1)+ctrend;
	dw=w-w(-1)+ctrend;
	pinfobs = 1*(pinf) + constepinf;
	robs =    1*(r) + conster;
	labobs = lab + constelab;

end;


// Variable initialization;

initval;

labobs = constelab;
robs = ((1 + constepinf/100)/((1/(1+constebeta/100))*(1 + ctrend/100)^(-csigma))-1)*100;
pinfobs = constepinf;
dy = ctrend;
dc = ctrend;
dinve = ctrend;
dw = ctrend;
ewma = 0;
epinfma = 0;
zcapf = 0;
rkf = 0;
kf = 0;
pkf = 0;
cf = 0;
invef = 0;
yf = 0;
labf = 0;
wf = 0;
rrf = 0;
mc = 0;
zcap = 0;
rk = 0;
k = 0;
pk = 0;
c = 0;
inve = 0;
y = 0;
lab = 0;
pinf = 0;
w = 0;
r = 0;
a = 0;
b = 0;
g = 0;
qs = 0;
//ms = 0;
spinf = 0;
sw = 0;
kpf = 0;
kp = 0;

end;


shocks;
//        adjusted (quarterly) // how to adjust               // parameter description   
var ea;
stderr         1.260*1/3;          //                             // productivity
var eb;
stderr         0.030*1/3;          //                             // risk premium     
var eg;
stderr         0.573*1/3;          //                             // government spending      
var eqs;
stderr         0.240*1/3;          //                             // investment     
//var em;
//stderr       0.044*1/3;          //                             // monetary policy
var epinf;
stderr         0.283*1/3;          //                             // price-markup
var ew;
stderr         0.519*1/3;          //                             // wage-markup     
end;


//steady;

// The execution command we run is:
// stoch_simul(order = 1, noprint, IRF=0, periods = 12102, drop = 200);
// stoch_simul(order = 1, noprint, IRF=100, periods = 12102, drop = 200) r w mc y c inve lab pinf wf yf cf invef; %construct impulse responses; 
