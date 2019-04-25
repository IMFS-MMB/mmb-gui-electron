//**************************************************************************
// A New Comparative Approach to Macroeconomic Modeling and Policy Analysis
//
// Volker Wieland, Tobias Cwik, Gernot J. Mueller, Sebastian Schmidt and 
// Maik Wolters
//
// Working Paper, 2009
//**************************************************************************

// Model: US_SW07

// Further references:
// Smets, F., and R. Wouters. 2007. "Shocks and Frictions in US Business Cycles: A Bayesian DSGE-Approach."
// American Economic Review 97(3), pp. 586-606.

// Last edited: 10/08/26 by S. Schmidt


var 
labobs 	% observed labor
robs 	% observed interest rate
pinfobs	% observed inflation change
dy	% output change
dc	% consumption change
dinve	% change in investments
dw	% change in wages
ewma	% wage markup shock, moving average part
epinfma % price markup shock, moving average part
zcapf	% capital utilization rate in flexible economy
rkf	% rental rate of capital in flex. economy
kf	% capital stock in flex. economy
pkf	% real value of capital in flex. economy
cf 	% consumption in flex. economy
invef	% investment in flex. economy
yf	% output in flex. economy
labf	% labor (working hours)
wf	% marginal rate of substitution between working and consuming
rrf	% ex-ante real interest rate
mc	% marginal costs
zcap	% capital utilization rate
rk	% rental rate of capital
k	% capital stock
pk	% real value of capital
c	% consumption
inve	% investment
y	% output
lab	% labor
pinf	% inflation
w	% real wage
r	% mon. policy interest rate
a	% disturbance to the total factor productivity
b	% disturbance to the wedge between FFR and return on assets (risk-premium)
g	% disturbance to the exogenous spending
qs	% disturbance to the investment-specific technology process
ms	% disturbance to the monetary policy shocks
spinf	% price mark-up disturbance
sw	% wage mark-up disturbance
kpf	% capital installed flexible econ.
kp	% capital installed in sticky-price econ.
pinf4	% Inflation (cumulative over last 4 quarters)
eg	% exogenous spending (fiscal policy) shock

//**************************************************************************
// Modelbase Variables                                                   //*
        interest inflation inflationq outputgap output fispol;           //*
//**************************************************************************

varexo
ea    % productivity shock
eb    % wedge between FFR and return on assets (risk premium)
eqs   % investment-specific technology shock (epsilon^i_t in the paper)
em    % monetary policy shock
epinf % price markup shock
ew    % wage markup shock 


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
curvw cgy curvp constelab constepinf constebeta cmaw cmap calfa 
czcap cbeta csadjcost ctou csigma chabb ccs cinvs cfc cindw cprobw 
cindp cprobp csigl clandaw crdpi crpi crdy cry crr crhoa crhob 
crhog crhoqs crhoms crhopinf crhow ctrend cg cgamma clandap cbetabar 
cr cpie crk cw cikbar cik clk cky ciy ccy crkky cwhlc cwly conster;


// fixed parameters
ctou=.025;   % depreciation rate
clandaw=1.5; % StSt markup labor market
cg=0.18;     % exogenous spending GDP-ratio
curvp=10;    % curvature Kimball aggregator goods market
curvw=10;    % curvature Kimball aggregator labor market

// estimated parameters initialisation
ctrend=0.4312; 			% quarterly trend growth rate to GDP
cgamma=ctrend/100+1;		% growth rate
constebeta=0.1657;          %
cbeta=100/(constebeta+100); 	% discount factor
constepinf=0.7869; 		% average observed quarterly inflation rate
cpie=constepinf/100+1;		% steady state gross inflation rate
constelab=0.5509;		% steady-state hours worked (observation equation)

calfa=0.1901; 			% labor share in production

csigma=1.3808; 	   % inverse of intertemporal elasticity of substitution
cfc=1.6064; 	   % Capital phi in the paper (fixed costs in the production function)
cgy=0.5187; 	   % rho_ga in paper (parameter adjusting the exogenous spending component for TFP caused changes in (exogenous) net exports) 

csadjcost= 5.7606; % investment adjustment cost
chabb=    0.7133;  % habit persistence 
cprobw=   0.7061;  % calvo parameter labor market
csigl=    1.8383;  % elasticity of labor supply w.r.t. real wage
cprobp=   0.6523;  % calvo parameter goods market
cindw=    0.5845;  % indexation labor market
cindp=    0.2432;  % indexation goods market
czcap=    0.5462;  % capital utilization
crpi=     2.0443;  % Taylor rule reaction to inflation
crr=      0.8103;  % Taylor rule interest rate smoothing
cry=      0.0882;  % Taylor rule long run reaction to output gap
crdy=     0.2247;  % Taylor rule short run reaction to output gap

% AR(1) correlation coefficients
crhoa=    0.9577;
crhob=    0.2194;
crhog=    0.9767;
crhoqs=   0.7113;
crhoms=   0.1479;
crhopinf= 0.8895;
crhow=    0.9688;
% Moving average 
cmap =    0.7010; % Moving average part of price mark-up disturbance
cmaw  =   0.8503; % Moving average part of wage mark-up disturbance

// derived from steady state

clandap=cfc;                                % Stst markup in goods market
cbetabar=cbeta*cgamma^(-csigma);            % discount factor adjusted for stst growth
cr=cpie/(cbeta*cgamma^(-csigma));           % stst nominal interest rate
crk=(cbeta^(-1))*(cgamma^csigma) - (1-ctou); % StSt rental rate of capital
cw = (calfa^calfa*(1-calfa)^(1-calfa)/(clandap*crk^calfa))^(1/(1-calfa)); % steady state real wage
cikbar=(1-(1-ctou)/cgamma);     % Stst investment capital ratio
cik=(1-(1-ctou)/cgamma)*cgamma;	 % parameter used in StSt consumption-output ratio calculation
clk=((1-calfa)/calfa)*(crk/cw); %Stst labor-capital ratio
cky=cfc*(clk)^(calfa-1);	 % StSt capital-output ratio
ciy=cik*cky; 		 	 % StSt investment-output ratio
ccy=1-cg-cik*cky; 	 	 % StSt consumption-output ratio
crkky=crk*cky;          % 
cwhlc=(1/clandaw)*(1-calfa)/calfa*crk*cky/ccy;  % coefficient in Euler equation
cwly=1-crk*cky;
conster=(cr-1)*100; % constant of nominal interest rate in observation equation

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
                                                                         
// Definition of Discretionary Fiscal Policy Parameter                   //*
coffispol = 1;                                                           //*
//**************************************************************************

model(linear); 

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

//usmodel_stst;

// flexible economy

0*(1-calfa)*a + 1*a =  calfa*rkf+(1-calfa)*(wf);
zcapf =  (1/(czcap/(1-czcap)))* rkf;
rkf =  (wf)+labf-kf ;
kf =  kpf(-1)+zcapf ;

//investment Euler equation

invef = (1/(1+cbetabar*cgamma))* (  invef(-1) + cbetabar*cgamma*invef(1)+(1/(cgamma^2*csadjcost))*pkf ) +qs ;

%Equation for the value of capital 
pkf = -rrf-0*b+(1/((1-chabb/cgamma)/(csigma*(1+chabb/cgamma))))*b +(crk/(crk+(1-ctou)))*rkf(1) +  ((1-ctou)/(crk+(1-ctou)))*pkf(1) ;

//consumption Euler equation
cf = (chabb/cgamma)/(1+chabb/cgamma)*cf(-1) + (1/(1+chabb/cgamma))*cf(+1) +((csigma-1)*cwhlc/(csigma*(1+chabb/cgamma)))*(labf-labf(+1)) - (1-chabb/cgamma)/(csigma*(1+chabb/cgamma))*(rrf+0*b) + b ;

//aggregate resource constraint
yf = ccy*cf+ciy*invef+g  +  crkky*zcapf ;

// aggregate production function
yf = cfc*(calfa*kf+(1-calfa)*labf +a);
wf = csigl*labf +(1/(1-chabb/cgamma))*cf - (chabb/cgamma)/(1-chabb/cgamma)*cf(-1) ;

//accumulation of installed capital
kpf =  (1-cikbar)*kpf(-1)+(cikbar)*invef + (cikbar)*(cgamma^2*csadjcost)*qs ;

// sticky price - wage economy
          //marginal cost
	      mc =  calfa*rk+(1-calfa)*(w) - 1*a - 0*(1-calfa)*a ;
          // capital utilization 
	      zcap =  (1/(czcap/(1-czcap)))* rk ;
          //rental rate of capital
	      rk =  w+lab-k ;
          // Capital installed used one period later in production 
	      k =  kp(-1)+zcap ;
          //investment Euler equation
	      inve = (1/(1+cbetabar*cgamma))* (  inve(-1) + cbetabar*cgamma*inve(1)+(1/(cgamma^2*csadjcost))*pk ) +qs ;
          //arbitrage equation for value of capital
          pk = -r+pinf(1)-0*b +(1/((1-chabb/cgamma)/(csigma*(1+chabb/cgamma))))*b + (crk/(crk+(1-ctou)))*rk(1) +  ((1-ctou)/(crk+(1-ctou)))*pk(1) ;
          //consumption Euler equation
	      c = (chabb/cgamma)/(1+chabb/cgamma)*c(-1) + (1/(1+chabb/cgamma))*c(+1) +((csigma-1)*cwhlc/(csigma*(1+chabb/cgamma)))*(lab-lab(+1)) - (1-chabb/cgamma)/(csigma*(1+chabb/cgamma))*(r-pinf(+1) + 0*b) +b ;
          //aggregate resource constraint
	      y = ccy*c+ciy*inve+g  +  1*crkky*zcap ;
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
               (csigl*lab + (1/(1-chabb/cgamma))*c - ((chabb/cgamma)/(1-chabb/cgamma))*c(-1) -w) 
               + 1*sw ;
          //Monetary Policy Rule
	      //r =  crpi*(1-crr)*pinf +cry*(1-crr)*(y-yf) +crdy*(y-yf-y(-1)+yf(-1))+crr*r(-1) +ms  ;
	      a = crhoa*a(-1)  + ea;
	      b = crhob*b(-1) + eb;
          // exogenous spending (including net exports)
	      g = crhog*(g(-1)) + eg + cgy*ea;
	      qs = crhoqs*qs(-1) + eqs;
	      ms = crhoms*ms(-1) + em;
          //cost push shock
	      spinf = crhopinf*spinf(-1) + epinfma - cmap*epinfma(-1);
	          epinfma=epinf;
	      sw = crhow*sw(-1) + ewma - cmaw*ewma(-1) ;
	          ewma=ew; 
          //accumulation of installed capital
	      kp =  (1-cikbar)*kp(-1)+cikbar*inve + cikbar*cgamma^2*csadjcost*qs ;

// measurement equations

dy=y-y(-1)+ctrend;				% Output change
dc=c-c(-1)+ctrend;				% Consumption change
dinve=inve-inve(-1)+ctrend;			% Investment change
dw=w-w(-1)+ctrend;				% Wage change
pinfobs = 1*(pinf) + constepinf;		% Inflation change
pinf4= pinf + pinf(-1) + pinf(-2) + pinf(-3);	% Inflation change (cumulative over last 4 quarters)
robs =    1*(r) + conster;			% Interest rate
labobs = lab + constelab;			% Labor change

end; 

shocks;
var ea; 	% productivity shock
stderr 0.4582; 	% standard deviation of productivity shock
var eb; 	% shock to the wedge between FFR and return on assets (risk-premium)
stderr 0.2400;
var fiscal_; 	% exogenous spending / fiscal policy shock
stderr 0.5291;
var eqs;	% investment specific technology shock
stderr 0.4526;
var em;		% monetary policy shock
stderr 0.2449;
var epinf;	% price markup shock
stderr 0.1410;
var ew;		% wage markup shock
stderr 0.2446;
end;

 //stoch_simul(irf=20) dy pinfobs robs ; 
