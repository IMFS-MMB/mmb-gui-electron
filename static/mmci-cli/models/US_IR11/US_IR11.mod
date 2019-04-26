//**************************************************************************
// A New Comparative Approach to Macroeconomic Modeling and Policy Analysis
//
// Volker Wieland, Tobias Cwik, Gernot J. Mueller, Sebastian Schmidt and 
// Maik Wolters
//
// Working Paper, 2009
//**************************************************************************

// Model: US_IR11

// Further references:
// Ireland, Peter N. (2011): "A New Keynesian Perspective on the Great Recession", 
//        Journal of Money, Credit and Banking Vol.54, No.1, 31-54.
// a small-scale New Keynesian model

// Note that this file produces the right impulse responses to any shocks 
// but a technology shock. It is because the original monetary policy of the paper
// react to a technology shock but any monetary policy rules of the MMB cannot. 

// First edited: 24/08/11 by M.Jancokova
// Last  edited: 12/11/13 by Jinhyuk Yoo

var a lambda y z r pi e g q x

//**************************************************************************
// Modelbase Variables                                                   //*
   interest inflation inflationq output outputgap; //fispol;             //*
//**************************************************************************


varexo epsa epse epsz

//**************************************************************************
// Modelbase Shocks                                                      //*
       interest_; //fiscal_;                                             //*
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
        std_r_ std_r_quart  //coffispol;                                 //*
                                                                         //*
//**************************************************************************
gamma alfa rhopi rhog rhoa rhoe zeta beta psi; 

//Note: the cost-push shock and some related parameters are renormalized to make the 
//          innovation normally distributed with mean zero (see page 40 in the paper)

//estimated parameters (maximum likelihood estimates)
gamma=0.3904;       //habit formation parameter
alfa=0;             //indexation parameter, for alfa=0 the price setting is purely forward looking
rhopi=0.4153;       //response coefficient of the Taylor rule
rhog=0.1270;        //response coefficient of the Taylor rule
rhoa=0.9797;        //persistence in the preference shock
rhoe=0;             //persistence in the renormalized cost-push shock

//calibrated parameters
zeta=1.0046;        //drift of the AR(1) technology process
beta=0.9987;        //discount factor
psi=0.10;           //Phillips Curve parameter; equals the original model parameters (theta-1)/phi

//**************************************************************************
// Specification of Modelbase Parameters                                 //*
                                                                         //*
// Load Modelbase Monetary Policy Parameters                             
	thispath = cd;                                                       
	cd('..');                                                            
	load policy_param.mat; 
    for i=1:33
        deep_parameter_name = M_.param_names(i,:);
        eval(['M_.params(i) = ' deep_parameter_name ' ;'])
    end
	cd(thispath);                                                     	 
//    std_r_=100;                                                        
                                                                         
// Definition of Discretionary Fiscal Policy Parameter                   
                                                                         
// coffispol = 1;                                                        
//**************************************************************************


model (linear);

//**************************************************************************
// Definition of Modelbase Variables in Terms of Original Model Variables//*
                                                                         //*
interest   = r*4;                                                        //*
inflation  = pi+pi(-1)+pi(-2)+pi(-3);                                    //*
inflationq = pi*4;                                                       //*
outputgap  = x;                                                          //*
output     = y;                                                          //*
//fispol   = ;                                                           //*
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
//fispol = coffispol*fiscal_;                                            //*
//**************************************************************************

//law of motion for the preference shock
a=rhoa*a(-1)+epsa;

//marginal utility of consumption in terms of past, present and expected future output with habit formation in preferences
(zeta-beta*gamma)*(zeta-gamma)*lambda=gamma*zeta*y(-1)-(zeta^2+beta*gamma^2)*y+ beta*gamma*zeta*y(+1)+(zeta-beta*gamma*rhoa)*(zeta-gamma)*a-gamma*zeta*z;

//IS curve
lambda=r+lambda(+1)-pi(+1);

//law of motion for the renormalized cost-push shock 
e=rhoe*e(-1)+epse;

//law of motion for the technology shock
z=epsz;

//New Keynesian Phillips Curve
(1+beta*alfa)*pi=alfa*pi(-1)+beta*pi(+1)-psi*lambda+psi*a+e;

//monetary policy rule
//r-r(-1)=rhopi*pi+rhog*g+epsr;

//growth rate of output
g=y-y(-1)+z;

//efficient level of output
0=gamma*zeta*q(-1)-(zeta^2+beta*gamma^2)*q+beta*gamma*zeta*q(+1)+beta*gamma*(zeta-gamma)*(1-rhoa)*a-gamma*zeta*z;

//output gap 
x=y-q;

end;


//steady;
//check;

shocks;
var epsa=(0.0868*100)^2;      //preference shock
var epse=(0.0017*100)^2;      //renormalized cost-push shock
var epsz=(0.0095*100)^2;      //technology shock
// var epsr=(0.0014*100)^2;      //monetary policy shock

var interest_=0;

end;

//stoch_simul(irf=0, ar=0, noprint) output inflationq interest x;