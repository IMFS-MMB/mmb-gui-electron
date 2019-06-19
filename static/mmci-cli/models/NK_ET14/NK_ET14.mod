//**************************************************************************
// A New Comparative Approach to Macroeconomic Modeling and Policy Analysis
//
// Volker Wieland, Tobias Cwik, Gernot J. Mueller, Sebastian Schmidt and 
// Maik Wolters
//
// Working Paper, 2009
//**************************************************************************

// Model: NK_ET14

// Model replication coded by: Elisabeth Falck,     
//                             e_mail: elisa.falck@gmail.com
//                             Philipp Lieberknecht, 
//                             e_mail: philipp.lieberknecht@gmail.com

// Last edited: 23/02/2016

// Further references:
// Ellison, M. and Tischbirek, A.: ``Unconventional government debt 
//        purchases as a supplement to conventional monetary policy''
// In: Journal of Economic Dynamics and Control (2014), no. 43, pp. 199–217.
//**************************************************************************


%---------------------------------------------------------------------------
% 0. Housekeeping 
%---------------------------------------------------------------------------

close all;
clc;

%---------------------------------------------------------------------------
% 1. Defining variables
%---------------------------------------------------------------------------

var     // all variables in logs (e.g. C = log(C)) except for qCB (SS = 0). 

Y       // Output
C       // Consumption  
s       // real HH saving  
Ps      // Price of aggregate saving
Pss     // Nominal HH saving (added additionally)
L       // Labor supply
w       // Wage  
Pi      // Inflation
F       // Auxiliary variable in Phillips Curve
K       // Auxiliary variable in Phillips Curve   
PQ      // Price of long-term bond
PB      // Price of short-term bond 
b       // Short-term bond demand by banks
q       // Long-term bond demand by banks
qCB     // Long-term bond demand/supply by central bank
qbar    // Long-term bond supply 
i       // Short-term interest rate
iQ      // Long-term interest rate
D       // Price Dispersion
        
A       // Technology
G       // Government expenditures
theta   // Intratemporal elasticity of substitution
%nu     // Interest rate shock process (commented out) 
ksi     // Unconventional monetary policy shock process
ChiC    // Preference shock process for consumption
ChiL    // Preference shock process for labor supply
epsG    // Government expenditure shock (added additionally) 

Yf      // Flex-price output
Gf      // Flex-price government expenditure

//**************************************************************************
// Modelbase Variables                                                   //*
        interest inflation inflationq outputgap output fispol;           //*
//**************************************************************************

varexo 

epsA    // Technology shock
%epsG   // Government expenditure shock (commented out and defined as endogenous variable to implement fiscal policy shock)
epsthet // Cost-push shock
%epsnu  // Interest rate shock (commented out) 
epsksi  // Unconventional monetary policy shock
epsC    // Preference shock to consumption
epsL    // Preference shock to labor supply


//**************************************************************************
// Modelbase Shocks                                                      //*       
       interest_ fiscal_;                                                //*
//**************************************************************************

%---------------------------------------------------------------------------
% 2. Defining parameters
%---------------------------------------------------------------------------

parameters  

//**************************************************************************
// Modelbase Parameters                                                  
                                                                         
        cofintintb1 cofintintb2 cofintintb3 cofintintb4                  
        cofintinf0 cofintinfb1 cofintinfb2 cofintinfb3 cofintinfb4       
        cofintinff1 cofintinff2 cofintinff3 cofintinff4                  
        cofintout cofintoutb1 cofintoutb2 cofintoutb3 cofintoutb4        
        cofintoutf1 cofintoutf2 cofintoutf3 cofintoutf4   
        cofintoutp cofintoutpb1 cofintoutpb2 cofintoutpb3 cofintoutpb4   
        cofintoutpf1 cofintoutpf2 cofintoutpf3 cofintoutpf4                           
        std_r_ std_r_quart coffispol           
//************************************************************************** 

betta       // HH discount factor            
delta       // Inverse elasticity of intertemporal substitution in consumption
psii        // Inverse Frisch elasticity of labor supply
SStheta     // Steady-state value of intratemporal elasticity of substitution
phi         // Inverse of returns to scale in production
alfa        // Degree of price rigidity
alfaf       // Flex-price rigidity
SSPi        // Steady-state inflation
tau         // Horizon of long-term bond
gbar        // Steady-state ratio of government spending to GDP
tpi         // Share of firm profits received by the government 
f           // Parameter in long-term bond supply rule                                          
a1          // Asset demand
a2          // Asset demand 
gB          // Asset demand (subsistence level of B)
gQ          // Asset demand (subsistence level of Q)
%rhonu      // Persistence of shock to interest rate rule (commented out)
rhoksi      // Persistence of shock to asset purchase rule
rhoC        // Persistence of consumption preference shock
rhoL        // Persistence of labor supply preference shock
rhoG        // Persistence of government spending
rhoA        // Persistence of technology shock
rhotheta    // Persistence of shock to elasticity of substitution    
gampi       // Interest rate rule coefficient on inflation
gamY        // Interest rate rule coefficient on output
gampiQE     // Asset purchase rule coefficient on inflation
gamYQE      // Asset purchase rule coefficient on output
%vepsnu     // Variance of shock to interest rate rule (commented out)
vepsksi     // Variance of shock to asset purchase rule
vepsC       // Variance of consumption preference shock
vepsL       // Variance of labor supply preference shock
vepsG       // Variance of government spending shock
vepsA       // Variance of technology shock
vepsthet    // Variance of shock to elasticity of substitution
vfiscal_;   // Variance of fiscal policy shock

%---------------------------------------------------------------------------
% 3. Calibration
%---------------------------------------------------------------------------

betta    = 0.99;
delta    = 2;
psii     = 0.5;
SStheta  = log(6);      // inserted as log of level
phi      = 1.1;
alfa     = 0.85;
alfaf    = 0;           // flex price 
SSPi 	 = log(1.005);  // inserted as log of level
tau      = 20;
gbar     = 0.4;
tpi      = 0.5;
f        = 0.66;
a1       = 0.95;
a2       = 0;
gB       = 10.21;
gQ       = 0.59;
%rhonu   = 0.1;         // Belongs to orig. MP rule
rhoksi   = 0.1;
rhoC     = 0.1;
rhoL     = 0.7;
rhoG     = 0.1;
rhoA     = 0.7;
rhotheta = 0.95;
gampi    = 1.01; 
gamY     = 0.3;
gampiQE  = 0;           // Baseline value
gamYQE   = 60;          // Baseline value
%vepsnu  = 0.0025^2;    // Belongs to orig. MP rule
vepsksi  = 0.0025^2;
vepsC    = 0.0025^2;
vepsL    = 0.0025^2;
%vepsG   = 0.005^2;     // Belongs to orig. MP rule
vepsA    = 0.01^2; 
vepsthet = 0.06^2;
vfiscal_ = 0.005^2;

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
    std_r_=100;
                                                                         
// Definition of Discretionary Fiscal Policy Parameter                   //*
coffispol = 1;                                                           //*

//**************************************************************************

%---------------------------------------------------------------------------
% 4. Model
%---------------------------------------------------------------------------

model;

//**************************************************************************
// Definition of Modelbase Variables in Terms of Original Model Variables//*
                                                                         //* 
interest     = 400*(i - steady_state(i));                                //* 
inflation    = (Pi + Pi(-1) + Pi(-2) + Pi(-3) - 4*steady_state(Pi))*100; //*
inflationq   = 400*(Pi - steady_state(Pi));                              //*     
outputgap    = (Y - Yf - (steady_state(Y) - steady_state(Yf)))*100;      //*
output       = 100*(Y - steady_state(Y));                                //*
fispol       = epsG;                                                     //*
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

%---------------------------------------------------------------------------
% 5.(a) Original Model Equations 
%---------------------------------------------------------------------------

exp(C) + exp(Ps)*exp(s) + exp(G) = exp(s(-1))*(exp(Pi))^(-1) + tpi*exp(w)*exp(L) + (1-tpi)*exp(Y);                          //(B.1)

1 = betta*exp(ChiC(+1))/exp(ChiC)*(exp(C(+1))/exp(C))^(-delta)*(exp(Ps)*exp(Pi(+1)))^(-1);                                  //(B.2)

exp(w) = exp(ChiL)/exp(ChiC)*exp(L)^(psii)*exp(C)^(delta);                                                                  //(B.3)

(1-alfa*(exp(Pi))^(exp(theta)-1))/(1-alfa) = (exp(F)/exp(K))^((exp(theta)-1)/(exp(theta)*(phi-1)+1));                       //(B.4)

exp(F) = exp(ChiC)*(exp(C))^(-delta)*exp(Y) + alfa*betta*(exp(Pi(+1)))^(exp(theta)-1)*exp(F(+1));                           //(B.5)

exp(K) = exp(theta)*phi/(exp(theta)-1)*exp(ChiL)*exp(L)^(psii)*(exp(Y)/exp(A))^(phi) 
       + alfa*betta*(exp(Pi(+1)))^(exp(theta)*phi)*exp(K(+1));                                                              //(B.6)

exp(s) = exp(b) + 1/tau*(exp(q)                                                                                             //(B.7)
       + exp(q(-1))/exp(Pi) 
       + exp(q(-2))/(exp(Pi)*exp(Pi(-1))) 
       + exp(q(-3))/(exp(Pi)*exp(Pi(-1))*exp(Pi(-2))) 
       + exp(q(-4))/(exp(Pi)*exp(Pi(-1))*exp(Pi(-2))*exp(Pi(-3))) 
       + exp(q(-5))/(exp(Pi)*exp(Pi(-1))*exp(Pi(-2))*exp(Pi(-3))*exp(Pi(-4))) 
       + exp(q(-6))/(exp(Pi)*exp(Pi(-1))*exp(Pi(-2))*exp(Pi(-3))*exp(Pi(-4))*exp(Pi(-5))) 
       + exp(q(-7))/(exp(Pi)*exp(Pi(-1))*exp(Pi(-2))*exp(Pi(-3))*exp(Pi(-4))*exp(Pi(-5))*exp(Pi(-6))) 
       + exp(q(-8))/(exp(Pi)*exp(Pi(-1))*exp(Pi(-2))*exp(Pi(-3))*exp(Pi(-4))*exp(Pi(-5))*exp(Pi(-6))*exp(Pi(-7))) 
       + exp(q(-9))/(exp(Pi)*exp(Pi(-1))*exp(Pi(-2))*exp(Pi(-3))*exp(Pi(-4))*exp(Pi(-5))*exp(Pi(-6))*exp(Pi(-7))*exp(Pi(-8))) 
       + exp(q(-10))/(exp(Pi)*exp(Pi(-1))*exp(Pi(-2))*exp(Pi(-3))*exp(Pi(-4))*exp(Pi(-5))*exp(Pi(-6))*exp(Pi(-7))*exp(Pi(-8))*exp(Pi(-9))) 
       + exp(q(-11))/(exp(Pi)*exp(Pi(-1))*exp(Pi(-2))*exp(Pi(-3))*exp(Pi(-4))*exp(Pi(-5))*exp(Pi(-6))*exp(Pi(-7))*exp(Pi(-8))*exp(Pi(-9))*exp(Pi(-10))) 
       + exp(q(-12))/(exp(Pi)*exp(Pi(-1))*exp(Pi(-2))*exp(Pi(-3))*exp(Pi(-4))*exp(Pi(-5))*exp(Pi(-6))*exp(Pi(-7))*exp(Pi(-8))*exp(Pi(-9))*exp(Pi(-10))*exp(Pi(-11))) 
       + exp(q(-13))/(exp(Pi)*exp(Pi(-1))*exp(Pi(-2))*exp(Pi(-3))*exp(Pi(-4))*exp(Pi(-5))*exp(Pi(-6))*exp(Pi(-7))*exp(Pi(-8))*exp(Pi(-9))*exp(Pi(-10))*exp(Pi(-11))*exp(Pi(-12))) 
       + exp(q(-14))/(exp(Pi)*exp(Pi(-1))*exp(Pi(-2))*exp(Pi(-3))*exp(Pi(-4))*exp(Pi(-5))*exp(Pi(-6))*exp(Pi(-7))*exp(Pi(-8))*exp(Pi(-9))*exp(Pi(-10))*exp(Pi(-11))*exp(Pi(-12))*exp(Pi(-13))) 
       + exp(q(-15))/(exp(Pi)*exp(Pi(-1))*exp(Pi(-2))*exp(Pi(-3))*exp(Pi(-4))*exp(Pi(-5))*exp(Pi(-6))*exp(Pi(-7))*exp(Pi(-8))*exp(Pi(-9))*exp(Pi(-10))*exp(Pi(-11))*exp(Pi(-12))*exp(Pi(-13))*exp(Pi(-14))) 
       + exp(q(-16))/(exp(Pi)*exp(Pi(-1))*exp(Pi(-2))*exp(Pi(-3))*exp(Pi(-4))*exp(Pi(-5))*exp(Pi(-6))*exp(Pi(-7))*exp(Pi(-8))*exp(Pi(-9))*exp(Pi(-10))*exp(Pi(-11))*exp(Pi(-12))*exp(Pi(-13))*exp(Pi(-14))*exp(Pi(-15))) 
       + exp(q(-17))/(exp(Pi)*exp(Pi(-1))*exp(Pi(-2))*exp(Pi(-3))*exp(Pi(-4))*exp(Pi(-5))*exp(Pi(-6))*exp(Pi(-7))*exp(Pi(-8))*exp(Pi(-9))*exp(Pi(-10))*exp(Pi(-11))*exp(Pi(-12))*exp(Pi(-13))*exp(Pi(-14))*exp(Pi(-15))*exp(Pi(-16))) 
       + exp(q(-18))/(exp(Pi)*exp(Pi(-1))*exp(Pi(-2))*exp(Pi(-3))*exp(Pi(-4))*exp(Pi(-5))*exp(Pi(-6))*exp(Pi(-7))*exp(Pi(-8))*exp(Pi(-9))*exp(Pi(-10))*exp(Pi(-11))*exp(Pi(-12))*exp(Pi(-13))*exp(Pi(-14))*exp(Pi(-15))*exp(Pi(-16))*exp(Pi(-17))) 
       + exp(q(-19))/(exp(Pi)*exp(Pi(-1))*exp(Pi(-2))*exp(Pi(-3))*exp(Pi(-4))*exp(Pi(-5))*exp(Pi(-6))*exp(Pi(-7))*exp(Pi(-8))*exp(Pi(-9))*exp(Pi(-10))*exp(Pi(-11))*exp(Pi(-12))*exp(Pi(-13))*exp(Pi(-14))*exp(Pi(-15))*exp(Pi(-16))*exp(Pi(-17))*exp(Pi(-18)))); 

exp(i) = 1/exp(PB);                                                                                                         //(B.8) We define i = 1 + net_interest_rate, different from paper where i = net_interest_rate

exp(PQ) = 1/(tau*(exp(iQ)))*(1-(1/(exp(iQ)))^(tau))/(1-1/(exp(iQ)));                                                        //(B.9) We define i = 1 + net_interest_rate, different from paper where i = net_interest_rate

exp(Pss) = exp(Ps)*exp(s);                                                                                                  // inserted additionally

exp(b) = gB + (exp(Ps)*exp(s) - exp(PB)*gB - exp(PQ)*gQ)/exp(PB)*(a1 + a2*log(exp(PB)/exp(PQ)));                            //(B.10)

exp(q) = gQ + (exp(Ps)*exp(s) - exp(PB)*gB - exp(PQ)*gQ)/exp(PQ)*(1 - a1 - a2*log(exp(PB)/exp(PQ)));                        //(B.11)

exp(qbar) = f*exp(steady_state(Y));                                                                                         //(B.12)

%(exp(i))/(exp(SSi)) = (exp(Pi)/exp(steady_state(Pi)))^(gampi)*(exp(Y)/exp(steady_state(Y)))^(gamY)*exp(nu);                //(B.13) original monetary policy rule (commented out)

(exp(qbar) - qCB)/exp(qbar) = (exp(Pi)/exp(steady_state(Pi)))^(gampiQE)*(exp(Y)/exp(steady_state(Y)))^(gamYQE)*exp(ksi);    //(B.14)

exp(qbar) = exp(q) + qCB;                                                                                                   //(B.15)

exp(Y) = exp(C) + exp(G);                                                                                                   //(B.16)

exp(Y) = exp(A)*(exp(L)/exp(D))^(1/phi);                                                                                    //(B.17)

exp(D) = (1-alfa)*((1-alfa*(exp(Pi))^(exp(theta)-1))/(1-alfa))^(exp(theta)*phi/(exp(theta)-1))
       + alfa*(exp(Pi))^(exp(theta)*phi)*exp(D(-1));                                                                        //(B.18)

ChiC = rhoC*ChiC(-1) +epsC;                                                                                                 //(B.19)

ChiL = rhoL*ChiL(-1)+epsL;                                                                                                  //(B.20)

A = rhoA*A(-1)+epsA;                                                                                                        //(B.21)

theta - steady_state(theta) = rhotheta * (theta(-1) - steady_state(theta)) +epsthet;                                        //(B.22)

G - steady_state(G) = rhoG* (G(-1) - steady_state(G)) + epsG;                                                               //(B.23)

%nu = rhonu*nu(-1) + epsnu;                                                                                                 //(B.24) original monetary policy shock process (commented out)

ksi = rhoksi*ksi(-1) + epsksi;                                                                                              //(B.25) 

%---------------------------------------------------------------------------
% 5.(b) Flexible Model Equations
%---------------------------------------------------------------------------

exp(ChiC)/exp(ChiL)*exp(Yf)^(1-phi-phi*psii)*(exp(Yf)-exp(Gf))^(-delta)*exp(A)^(phi+phi*psii) 
  = exp(theta)*phi/(exp(theta)-1);                                                                                          // Flex Price Output, explicit solution in terms of shocks under alfa = 0

Gf - steady_state(Gf) = rhoG* (Gf(-1) - steady_state(Gf)) + epsG;                                                           //(B.23)

end;

%---------------------------------------------------------------------------
% 6. Shocks
%---------------------------------------------------------------------------

shocks;
%var epsnu   = vepsnu;
var epsksi   = vepsksi;
var epsC     = vepsC;
var epsL     = vepsL; 
%var epsG    = vepsG;
var fiscal_  = vfiscal_;
var epsA     = vepsA;
var epsthet  = vepsthet;
end;