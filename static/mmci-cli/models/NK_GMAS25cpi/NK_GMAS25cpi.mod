//**************************************************************************
// A New Comparative Approach to Macroeconomic Modeling and Policy Analysis
//
// Volker Wieland, Tobias Cwik, Gernot J. Mueller, Sebastian Schmidt and
// Maik Wolters
//
// Working Paper, 2009
//**************************************************************************

// Model: NK_GM05

// Further references:
// Gal , Jordi, and Tommaso Monacelli (2005)  Monetary Policy and Exchange Rate
// Volatility in a Small Open Economy  Review of Economic Studies 72, 707-734.
// The Version presented here includes Tariff Shocks of 10%, equations derived by Z.Abdullayev & L.Schmitz
// CPI Targeting is used to be conform with the MMB
// Created by Zafar Abdullayev, Luca Schmitz
// Last edited: 2025/06/23

// See the original paper and the comments below for the model equations.


var pih x y ynat rnat r s pi p ph e ystar a pistar tar pf

//**************************************************************************
// Modelbase Variables                                                   //*
   interest inflation inflationq outputgap output;                       //*
//**************************************************************************


varexo ystar_ a_ tar_

//**************************************************************************
// Modelbase Shocks                                                      //*
       interest_;                                                        //*
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
sigmaa sigma eta fi rho tau Z alpha theta xi beta kappa omega phipi rhoa rhoy rhotar phiy rhor;

sigmaa  = 1;
sigma = 1;
eta =  0;
fi =  1;
rho     = 0.0101;
tau     = 1;
Z = 0;
alpha   = 0.4;
theta   = 0;
beta    = 0.99;
kappa   = 0.3433;
omega   = -0.1277;
xi      = 0;
phipi   = 1.5;

rhoa    = 0.66;
rhoy    = 0.86;
rhotar  = 0.9576;


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
std_r_=1;                                                          //*
//**************************************************************************

model(linear);


//**************************************************************************
// Definition of Modelbase Variables in Terms of Original Model Variables//*

interest   = r*4;                                                      //*
inflation = (1/4)*(4*pi+4*pi(-1)+4*pi(-2)+4*pi(-3));			         //*
inflationq  = pi*4;                                                    //*
outputgap  = x;                                                      //*
output = y;                                                          //*
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
//**************************************************************************

// Original Model Code:

x    = x(+1) - sigma^(-1)*( r - pih(+1) - rnat) ;                              //1  New IS Curve of SOE, equ. (37) in the paper
rnat = -sigmaa*tau*(1-rhoa)*a + alpha*sigmaa*(theta+xi)*(rhoy-1)*ystar - sigmaa*( Z + ( alpha / sigma * (theta + (alpha*theta - 1)*(sigma*eta - 1)) ) ) * (rhotar - 1)*tar;          //2  def. of nature rate of interest rate of SOE, the last term of pluged E[d_ystar(t+1)]=(rhoy-1)*ystar in the equ below (37)
pih  = beta * pih(+1)+ kappa*x;                                                //3  Philips Curve of the SOE, equ. (36) in the paper
ynat = tau*a + alpha*xi*ystar - Z*(tar);                                                 //4  def. of nature level of output of SOE, equ. (35) in the paper
x    = y - ynat;                                                               //5  def. of outout gap of SOE
                                                                               //6* monetary policy rule, choosen by users
y    = ystar + sigmaa^(-1)*s - ( (1 + alpha*(sigma*eta - 1))/sigma )*tar;                                                   //9  wedge between deomestic and world output, equ (29)
pi   = pih + alpha*(s-s(-1));                                                  //10 wedge (gap) between demestic and CPI inflation, equ (14)
pi   = p - p(-1);                                                              //11 def. of CPI inflation
pih  = ph - ph(-1);                                                            //12 def. of domestic inflation (PPI)
p = (1-alpha)*ph+(alpha)*(pf+tar);                                             //13  Price Level
s = s(-1) + e - e(-1) + pistar - pih + (tar - tar(-1));                        //14 from def. of TOT, first difference of equ (15), pi_star=0
//r    = e(+1) - e;                                                            //15 not include here, Uncovered Interest rate Parity, set world interest rate to zero(see p724), equ (19)
pistar = 0;                                                                    //16 foreign inflation is set to be zero
a    = rhoa*a(-1) + a_;                                                        //7  exogenous process of productivity in SOE,
ystar= rhoy*ystar(-1) + ystar_;                                                //8  exogenous process of world output,
tar = rhotar * tar(-1) + tar_;                                                 //17 tariff shock

end;


shocks;
var a_ = 0.0071^2;                                                               //the SD of productivity
var ystar_ = 0.0078^2;                                                           //the SD of world output
var a_, ystar_ = 0.3*0.0071*0.0078;                                              
var tar_ = 0.01;                                                                 // 10% Tariff shock


end;

//stoch_simul (irf = 0, ar=100, noprint);
