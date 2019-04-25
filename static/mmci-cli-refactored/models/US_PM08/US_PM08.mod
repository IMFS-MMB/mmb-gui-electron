//**************************************************************************
// A New Comparative Approach to Macroeconomic Modeling and Policy Analysis
//
// Volker Wieland, Tobias Cwik, Gernot J. Mueller, Sebastian Schmidt and 
// Maik Wolters
//
// Working Paper, 2009
//**************************************************************************

// Model: US_PM08 stationary version (without financial-real linkages)

// Further references:
// Carabenciov, Ioan, Igor Ermolaev, Charles Freedman, Michel Juillard, 
// Ondra Kamenik, Dmitry Korshunov, and Douglas Laxton (2008).
// “A Small Quarterly Projection Model of the US Economy” 
// IMF Working Paper 08/278.

// Created by Elena Afanasyeva
// Last edited: 10/09/07 by S. Schmidt

var RR_USh RR_US_BARh
    UNR_US_GAP 
    PIE_USh PIE_US4h Y_US  RS_USh 
    E4_PIE_US4h E1_Y_USh E1_PIE_USh 
    //eg

//**************************************************************************
// Modelbase Variables                                                   //*
        interest inflation inflationq outputgap output;                  //* 
//**************************************************************************
 
varexo RES_RR_US_BAR RES_UNR_US_GAP 
        RES_Y_US  RES_PIE_US      
       
       
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
        std_r_ std_r_quart  //coffispol                                  //* 
//**************************************************************************
           rho_us rr_us_bar_ss alpha_us1 alpha_us2
           tau_us growth_us_ss beta_us1 beta_us2 beta_us3 lambda_us1 
           lambda_us2 gamma_us1 gamma_us2 gamma_us4 pietar_us_ss alpha_us3;
           


// estimated and fixed parameters, set at mode value (Table 1, p. 32)
alpha_us1    = 0.7453;
alpha_us2    = 0.1711;
alpha_us3    = 0.3339;
rho_us       = 0.9239;
rr_us_bar_ss = 1.8221;
tau_us      = 0.0768;
growth_us_ss= 2.6016;
beta_us1    = 0.8523;
beta_us2    = 0.1674;
beta_us3    = 0.1270;
lambda_us1  = 0.7272;
lambda_us2  = 0.1937;
gamma_us1   = 0.7087;
gamma_us2   = 1.2679;
gamma_us4   = 0.2192;
pietar_us_ss= 2.5;

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
//coffispol = 1;                                                         //*
//**************************************************************************

model(linear); // original model has been stationarized

//**************************************************************************
// Definition of Modelbase Variables in Terms of Original Model Variables //*

interest   = RS_USh;                                                     //*
inflation  = PIE_US4h;                                                 	 //*
inflationq = PIE_USh;                                                 	 //*
outputgap  = Y_US;                                                       //*
output     = Y_US;                                                       //*
//fispol     = eg;                                                       //*
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

// Model Code (stationarized):
//h denotes deviation from steady state, d denotes first difference

UNR_US_GAP = alpha_us1*UNR_US_GAP(-1) + alpha_us2*Y_US + RES_UNR_US_GAP;

Y_US = beta_us1*Y_US(-1) + beta_us2*Y_US(+1) - beta_us3*(RR_USh(-1) - RR_US_BARh(-1)) + RES_Y_US; 


PIE_USh = lambda_us1*PIE_US4h(+4) + (1-lambda_us1)*PIE_US4h(-1) + lambda_us2*Y_US(-1) - RES_PIE_US;

RR_USh = RS_USh - PIE_USh(+1);

RR_US_BARh =(1-rho_us)*RR_US_BARh(-1) + RES_RR_US_BAR;

PIE_US4h = (PIE_USh + PIE_USh(-1) + PIE_USh(-2) + PIE_USh(-3))/4;

// reporting expectations

E4_PIE_US4h = PIE_US4h(+4);
E1_PIE_USh = PIE_USh(+1);
E1_Y_USh = Y_US(+1);

//MP rule

//RS_USh = gamma_us1*RS_USh(-1) + (1-gamma_us1)*(RR_US_BARh + PIE_US4h(+3) + 
//gamma_us2*(PIE_US4h(+3)-pietar_us_ss) + gamma_us4*Y_US) + RES_RS_US;


end;

shocks; 
var RES_RR_US_BAR;  stderr 0.0934;  // replaced with estimated values (Table 2, p. 33)
var RES_UNR_US_GAP; stderr 0.0943;
var RES_Y_US	;stderr 0.3567;
var RES_PIE_US    ;stderr 1.3598; 

end;


 //stoch_simul(irf=20) dy pinfobs robs ; 
