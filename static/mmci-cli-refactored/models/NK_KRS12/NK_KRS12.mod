// NK_KRS12 model

// Kannan, Rabanal, Scott (2012). Monetary and Macroprudential Policy Rules in a Model with House Price Booms. 

// Implemented in the MMB by: Jiajin Huang and Qianchao Qu


var 
   q
   c
   i
   mu
   d
   r
   deltac
   deltap
   deltapC
   b
   p
   pC
   pD
   deltapD
   lC
   lD
   wC
   wD
   cB
   deltacB
   iB
   muB
   dB
   lCB
   lDB
   rL
   bB
   aC
   xiD
   v
   lCtot
   lDtot
   y
   ystar
   yC
   yD
   yCstar
   yDstar
   dstar
   deltabB

//**************************************************************************
// Modelbase Variables                                                   //*    
    interest inflation inflationq output outputgap;                             //*
//**************************************************************************

varexo eps_A eps_D eps_v

//**************************************************************************
// Modelbase Shocks                                                      //*       
        interest_;                                                       //*
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
epsilon eta beta delta lL phi alpha gamma betaB CB IB RL BB W LB kappa kappaC kappaD phiC phiD lambda thetaC thetaD C D DB L gammaR gammapi gammay gammab tau rhoC rhoD rhov;
epsilon = 0.8;
eta = 0.5;
beta = 0.99;
delta = 0.025;
lL = 1;
phi = 1;
alpha = 0.9;
gamma = 0.5378;
betaB = 0.98;

CB = 1.3705;
IB = 0.1323;
RL = 1.0204;
BB = 4.2349;
W = 0.9;
LB = 1.7659;
C = 1.5893;
D = 7.8610;
DB = 5.2936;
L = 1.5228;

kappa = 0.02; //0.05; otherwise not possible to replicate IRFs in the paper
kappaC= 0.0858;
kappaD= 0.0858;
phiC = 1;
phiD = 1;
lambda = 0.5;
thetaC = 0.75;
thetaD = 0.75;
//monetary policy rule 
gammaR = 0.7;
gammapi = 1.3;
gammay = 0.125;
gammab = 0;
//macroprudential policy rule
tau = 0;

rhoC = 0.98;
rhoD = 0.95;
rhov = 0.95;
                                                          
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
coffispol = 0;                                                           //*
//**************************************************************************                                                                     

model(linear);

//**************************************************************************
// Definition of Modelbase Variables in Terms of Original Model Variables //*

interest   = r*4;                                                         //*
inflation  = deltapC+deltapC(-1)+deltapC(-2)+deltapC(-3);                 //*
inflationq = deltapC*4;                                                   //*
output =    y;                                                            //*
outputgap  = y-ystar;                                                     //*
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
           + std_r_*interest_;                                          //* 
//**************************************************************************


// Original model code
// For Savers
q=pD-pC;
deltac=c-c(-1);
deltap=p-p(-1);
deltapC=pC-pC(-1);
deltapD=pD-pD(-1);
q-(c-epsilon*c(-1))/(1-epsilon)+eta*(i-i(-1))=mu+beta*eta*(i(+1)-i);
(1-beta*(1-delta))*(xiD-d)=mu-beta*(1-delta)*mu(+1);
epsilon*deltac=deltac(+1)-(1-epsilon)*(r-deltapC(+1));
(c-epsilon*c(-1))/(1-epsilon)+((phi-lL)*alpha+lL)*lC+(phi-lL)*(1-alpha)*lD=wC;
(c-epsilon*c(-1))/(1-epsilon)+((phi-lL)*(1-alpha)+lL)*lD+(phi-lL)*alpha*lC=wD;

// For Borrowers
deltacB=cB-cB(-1);
q-(cB-epsilon*cB(-1))/(1-epsilon)+eta*(iB-iB(-1))=muB+betaB*eta*(iB(+1)-iB);
(1-betaB*(1-delta))*(xiD-dB)=muB-betaB*(1-delta)*muB(+1);
epsilon*deltacB=deltacB(+1)-(1-epsilon)*(rL-deltapC(+1));
(cB-epsilon*cB(-1))/(1-epsilon)+((phi-lL)*alpha+lL)*lCB+(phi-lL)*(1-alpha)*lDB=wC;
(cB-epsilon*cB(-1))/(1-epsilon)+((phi-lL)*(1-alpha)+lL)*lDB+(phi-lL)*alpha*lCB=wD;

//Budget Constraint
CB*cB+IB*(q+iB)+RL*BB*(rL(-1)+bB(-1)-deltapC)=BB*bB+alpha*W*LB*(wC+lCB)+(1-alpha)*W*LB*(wD+lDB);

//The effective interest rate for borrowers
rL=r+kappa*(bB-dB-q)-v+tau*(bB(-1)-bB(-2)+deltapC(-1));
//the aggregate price index
deltap=gamma*deltapC+(1-gamma)*deltapD;

//the relatvie price of housing
//q=q(-1)+deltapD-deltapC;
//the production functions
yC=aC+lCtot;
yD=lDtot;
//the pricing equations
deltapC-phiC*deltapC(-1)=beta*(deltapC(+1)-phiC*deltapC)+kappaC*(wC-aC);
deltapD-phiD*deltapD(-1)=beta*(deltapD(+1)-phiD*deltapD)+kappaD*(wD-q);
//the market clearing conditons
yC=(lambda*C*c+(1-lambda)*CB*cB)/(lambda*C+(1-lambda)*CB);
yD=(lambda*delta*D*i+(1-lambda)*delta*DB*iB)/(lambda*delta*D+(1-lambda)*delta*DB);

//the law of motion of the two types of housing stocks
d=(1-delta)*d(-1)+delta*i;
dB=(1-delta)*dB(-1)+delta*iB;

//working hours in each sector
lCtot=(lambda*L*lC+(1-lambda)*LB*lCB)/(gamma*L+(1-lambda)*LB);
lDtot=(lambda*L*lD+(1-lambda)*LB*lDB)/(gamma*L+(1-lambda)*LB);

//market clearing conditions
lambda*b+(1-lambda)*bB=0;
deltabB=bB-bB(-1)+deltapC;

//Monetary policy 
//r=gammaR*r(-1)+(1-gammaR)*(gammapi*deltapC(-1)+gammay*(y(-1)-ystar(-1))+gammab*(bB(-1)-bB(-2)+deltapC(-1)));

y=alpha*yC+(1-alpha)*yD;
ystar=alpha*yCstar+(1-alpha)*yDstar;
yCstar = (0.326667*aC(-1)+2/3*yCstar(-1)+1/3*eps_A);
yDstar = (-0.344897*dstar(-1)+0.24879*xiD(-1)+0.2653*yDstar(-1)+0.26188*eps_D);
dstar=(1-delta)*dstar(-1)+delta*yDstar;
//shocks
aC=rhoC*aC(-1)+eps_A;
xiD=rhoD*xiD(-1)+eps_D;
v=rhov*v(-1)+eps_v;
end;

%steady;

%check;

shocks;
var eps_A; stderr 1.5;
var eps_D; stderr 2.5;
var eps_v; stderr 0.125;
end;


