// Model: US_CPS10

// References:
// Title: "Inflation-Gap Persistence in the US"
// Journal published: American Economic Journal: Macroeconomics, Vol. 2, No. 1 (January 2010, pp. 43-69)
// Authors: Timothy Cogley, Giorgio E. Primiceri and Thomas J. Sargent 

// Created by Balint Tatar
// Last edited: 13/03/17 by Changnam Son


var p y lambdda w R z lambddap  b  pit // gov inflgap  realR


//%flexible-price counterparts

ystar lambddastar wstar Rstar


//**************************************************************************
// Modelbase Variables                                                   //*
        interest inflation inflationq outputgap output;// fispol;        //*
//**************************************************************************
 

varexo zs lambddaps bs pits // Rs 

//% zs=Technology, lambddaps=mark-up, pits=inflation target, bs=intertemporal preference, Rs=MP


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

niu lambddapss iotap gamma100 pss100 Fbeta hparam xip rhoz rholambddap rhob sdz sdlambddap sdb gamma betta rss rss100 expg rhopit sdpit; 
// fp fy rhoR  sdr 

//%Calibrated parameters
niu=2;
lambddapss=0.1;
iotap=0; // There is no inflation indexation
rhopit=0.995; 

/*
%Values from page 60 for the period 1960-1979
gamma100=0.468;	
pss100=0.501;	
Fbeta=0.159;	
hparam=0.445;	
xip=0.782;	
fp=1.557;	
fy=0.643;	
rhoR=0.704;	
rhoz=0.264;	
rholambddap=0.598;	
rhob=0.699;	
sdr=0.160;	
sdz=0.641;	
sdlambddap=0.118;	
sdpit=0.081;	
sdb=2.533;
*/

/*
%Counterfactual
%Values from page 60 for the period 1960-1979, fp changed from 1.557 to 1.784
gamma100=0.468;	
pss100=0.501;	
Fbeta=0.159;	
hparam=0.445;	
xip=0.782;	
fp=1.784; //	
fy=0.643;	
rhoR=0.704;	
rhoz=0.264;	
rholambddap=0.598;	
rhob=0.699;	
sdr=0.160;	
sdz=0.641;	
sdlambddap=0.118;	
sdpit=0.081;	
sdb=2.533;
*/



//%Values from page 60 for the period 1982-2006
// We use these estimates
gamma100=0.484;	
pss100=0.516;	
Fbeta=0.255;	
hparam=0.526;  
xip=0.800;  
// fp=1.784; inflation gap parameter in the MP rule	
// fy=0.66;	 output gap paramenter in the MP rule
// rhoR=0.633;	AR 1 parament in the MP rule
rhoz=0.297;	
rholambddap=0.255;	// corresponding to rho_theta in the paper p.60
rhob=0.876;	
// sdr=0.069;  standard deviation of MP shock
sdz=0.493;	
sdlambddap=0.126;	// corresponding to 100*sigma_theta in the paper p.60
sdpit=0.049; // standard deviation of target shock	
sdb=2.429;


//%Steady state values:
gamma=gamma100/100;
betta=100/(Fbeta+100);
rss=exp(gamma)/betta-1;
rss100=rss*100;

expg=exp(gamma);




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

interest   = 4*R;                                                        //*
inflation  = p+p(-1)+p(-2)+p(-3);                                        //*
//inflationq = 4*p;                                                      //*
inflationq = 4*(p-pit);   // consider inflation gap instead of inflation //*
outputgap  = y-ystar;                                                    //*
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

// Original Model Code:

//% eq 1, Phillips Curve (p)
p -betta/(1+iotap*betta)*p(+1) -lambddap -((1-betta*xip)*(1-xip)/((1+iotap*betta)*xip*(1+niu*(1+1/lambddapss))))*w=iotap/(1+iotap*betta)*p(-1);

//% eq 1b, where b means the corresponding equation for the "star" economy under flexible price-> the same in the below
wstar=0;

//% eq 2, marginal utility of consumption
(expg-hparam*betta)*(expg-hparam)*lambdda -(expg-hparam*betta*rhob)*(expg-hparam)*b -(betta*hparam*expg*rhoz-hparam*expg)*z +(expg^2+betta*hparam^2)*y -betta*hparam*expg*y(+1)=expg*hparam*y(-1);

//% eq 2b
(expg-hparam*betta)*(expg-hparam)*lambddastar -(expg-hparam*betta*rhob)*(expg-hparam)*b -(betta*hparam*expg*rhoz-hparam*expg)*z + (expg^2+betta*hparam^2)* ystar -betta*hparam*expg*ystar(+1)=expg*hparam*ystar(-1);

//% eq 3, euler equation
lambdda-R-lambdda(+1)+p(+1)+rhoz*z=0;

//% eq 3b
lambddastar-Rstar-lambddastar(+1)+rhoz*z=0;

//% eq 4, labor supply equation
w-b-niu*y+lambdda=0;

//% eq 4b, labor supply equation
wstar-b-niu*ystar+lambddastar=0;

//% eq 5, MP rule- commented out for common MP rule in the MMB
//R -(1-rhoR)*fp/4*p +(1-rhoR)*(fp)*pit -(1-rhoR)*fy*y +(1-rhoR)*fy*ystar = rhoR*R(-1) +(1-rhoR)*fp/4*p(-1) +(1-rhoR)*fp/4*p(-2) +(1-rhoR)*fp/4*p(-3)+Rs;

//% eq 6 - 9, exogenous shocks
z=rhoz*z(-1)+zs;
lambddap=rholambddap*lambddap(-1)+lambddaps;
pit=rhopit*pit(-1)+pits;
b=rhob*b(-1)+bs;



//% definition of inflation gap
// inflgap=p-pit;

//% definition of real interest rate
// realR=R-p;


end;


shocks;

//var Rs = sdr^2; 
var zs = sdz^2;
var lambddaps = sdlambddap^2;
//var fiscal_ = 1;
var pits = 1; // for the sake of unit shock
//var pits = sdpit^2; 
var bs = sdb^2;



end;

 //stoch_simul(irf=20);  
