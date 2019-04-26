//**************************************************************************
// A New Comparative Approach to Macroeconomic Modeling and Policy Analysis
//
// Volker Wieland, Tobias Cwik, Gernot J. Mueller, Sebastian Schmidt and 
// Maik Wolters
//
// Working Paper, 2009
//**************************************************************************

// Model: US_FM95

// Further references:
// Fuhrer, J. 1997. "Inflation/Output Variance Trade-Offs and Optimal Monetary Policy." Journal of Money, Credit and Banking 29. pp 214-234.
// Fuhrer, J., and G. Moore. 1995. "Inflation Persistence." Quaterly Journal of Economics 110(1), pp. 127-159.
// Fuhrer, J., and G. Moore. 1995. "Monetary Policy Trade-offs and the Correlation between Nominal Interest Rates and Real Output."
// American Economic Review 85(1), pp. 219-239.
// Levin, A., V. Wieland, and J. Williams. 2003. "The Performance of Forecast-Based Monetary Policy Rules under Model Uncertainty."
// American Economic Review 93(3), pp. 622-645.

// Last edited: 13/06/12 by V.Audzei based on the code by S. Schmidt

// The parametrization is taken from Fuhrer (1997). 


var p x ytilde ypsilon f infl rho

//**************************************************************************
// Modelbase Variables                                                  //*    
   interest inflation inflationq inflationql inflationql2 inflationqls  //*
   outputgap output ytildef ytildeff ytildel ypsilonf ypsilonff 		//*
   z zl zll xl xll; 													//*
//**************************************************************************

varexo epsilon_p epsilon_y

//**************************************************************************
// Modelbase Shocks                                                      //*       
       interest_;                                                        //*
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
s f0 f1 f2 f3 D a0 a1 a2 arho gamma;




s    =  0.113;
gamma = 0.002; 


f0   =  0.25+(1.5-0)*s;
f1   =  0.25+(1.5-1)*s;
f2   =  0.25+(1.5-2)*s;
f3   =  0.25+(1.5-3)*s;
D    =  40; //120

a0   =  0.012;
a1   =  1.447;
a2   = -0.468;
arho = -0.335;

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
//**************************************************************************
// State and forward variables for learning setup                        //*

AL_Info.forwards = {'ypsilon','ytilde','rho','infl','inflationq', 'ytildef', 'ytildeff', 'ypsilonf', 'ypsilonff'};
AL_Info.states_short = {'interest' ,   'inflationql',    'ytildel',    'z',    'zl',    'zll' ,   'ytilde',    'inflationq'};
AL_Info.states_long={'interest' ,   'inflationql',    'inflationql2' ,   'ytildel'  ,  'z'  ,  'zl' ,   'zll' ,   'ytilde' ,   'inflationq'};
save AL_Info AL_Info 
//states_long={'p','x','ytildel','ytilde','rho','inflationql','inflationql2','inflationq'};
//**************************************************************************
model(linear);

//**************************************************************************
// Definition of Modelbase Variables in Terms of Original Model Variables //*

interest   = f+a0/arho;                                                  //*
inflation  = (1/4)*(inflationq+ inflationql+ inflationql2+				 //*
			inflationql2(-1));											 //*
inflationq = infl;														 //*
inflationql = inflationq(-1);                                            //*
inflationql2 = inflationql(-1);                                          //*
inflationqls = inflationql + inflationql2;                               //*
outputgap  = ytilde;                                                     //*
output     = ytilde;                                                     //*
//**************************************************************************


//**************************************************************************                                                                    
// Policy Rule                                                           //*
// For AL model, the policy rule removes all leads and lags beyond the   //*
// first one. This means that only certain rules, such as original SW07, //*
// could be used.                                                        //*
                                                                         //*
// Monetary Policy                                                       //*
                                                                         //*
interest =   cofintintb1*interest(-1)                                    //* 
//         + cofintintb2*interestl(-1)                                   //* 
//         + cofintintb3*interestl2(-1)                                  //* 
//         + cofintintb4*interestl3(-1)                                  //* 
           + cofintinf0*inflationq                                       //* 
           + cofintinfb1*inflationq(-1)                                  //* 
           + cofintinfb2*inflationql(-1)                                 //* 
           + cofintinfb3*inflationql2(-1)                                //* 
//         + cofintinfb4*inflationql3(-1)                                //* 
//           + 0.25*cofintinff1*pinf(+1)                                 //* 
           + cofintinff1*inflationq(+1)                                  //* 
//         + cofintinff2*inflationq(+2)                                  //* 
//         + cofintinff3*inflationq(+3)                                  //* 
//         + cofintinff4*inflationq(+4)                                  //* 
           + cofintout*outputgap 	                                     //* 
           + cofintoutb1*outputgap(-1)                                   //* 
//         + cofintoutb2*outputgap(-2)                                   //* 
//         + cofintoutb3*outputgap(-3)                                   //* 
//         + cofintoutb4*outputgap(-4)                                   //* 
//         + cofintoutf1*outputgap(+1)                                   //* 
//         + cofintoutf2*outputgap(+2)                                   //* 
//         + cofintoutf3*outputgap(+3)                                   //* 
//         + cofintoutf4*outputgap(+4)                                   //* 
           + cofintoutp*output 	                                         //* 
           + cofintoutpb1*output(-1)                                     //* 
//         + cofintoutpb2*output(-2)                                     //* 
//         + cofintoutpb3*output(-3)                                     //* 
//         + cofintoutpb4*output(-4)                                     //* 
//         + cofintoutpf1*output(+1)                                     //* 
//         + cofintoutpf2*output(+2)                                     //* 
//         + cofintoutpf3*output(+3)                                     //* 
//         + cofintoutpf4*output(+4)                                     //* 
           + std_r_ *interest_;                                          //* 
//**************************************************************************
ypsilonf=ypsilon(+1);
ypsilonff=ypsilonf(+1);
ytildef=ytilde(+1);
ytildeff=ytildef(+1);

ytildel=ytilde(-1);
xl=x(-1);
xll=xl(-1);
//pl=p(-1);
//pll=pl(-1);
z=x-p;
zl=z(-1);
zll=zl(-1);
// Original Model Code:

// Original interest rate rule from Fuhrer and Moore (1995), equation (9)
//f-f(-1) = 0.126*(f(-1)-f(-2))-0.397*(f(-2)-f(-3))+0.060*infl(-1)+0.130*infl(-2)-0.116*infl(-3)+0.102*ytilde;

p       = f0 * x + f1 * xl + f2 * xll + f3 * xll(-1); 				    
z       = f0 * (ypsilon  + gamma*ytilde) + f1 * (ypsilonf + gamma*ytildef) + 
	//x-p   = f0 * (ypsilon  + gamma*ytilde) + f1 * (ypsilonf + gamma*ytildef) + 
	  //f2 * (ypsilonff + gamma*ytildeff) + f3 * (ypsilonff(+1) + gamma*ytildeff(+1)) + epsilon_p;     
	  f2 * (ypsilonff + gamma*ytildeff) + f3 * (ypsilonff(+1) + gamma*ytildeff(+1)) + epsilon_p;     
ypsilon = f0 * (z) + f1 * (zl) + f2 * (zll) + f3 * (zll(-1));  
ytilde  = a0 + a1 * ytildel + a2 * ytildel(-1) + arho * rho(-1)+epsilon_y;
rho - D*(rho(+1) -rho) = f - infl(+1);	
infl      = 4*(p-p(-1));
end;

initval;
ytilde = 0;
ypsilon = 0;
f = -a0/arho;
infl = 0;
rho = -a0/arho;
inflation = 0;
inflationq = 0;
interest = 0;
output = 0;
outputgap = 0;
end;

shocks;
var epsilon_p            =  10000*2.78656791760000e-06;
var epsilon_p, interest_ =  0                   ;
var epsilon_p, epsilon_y   = 10000*(-2.67932176090000e-06);
var interest_          =  0;                    
var interest_, epsilon_y =  0;
var epsilon_y            =  10000*3.63551004125000e-05;
end;


//stoch_simul (irf = 0, ar=100, noprint, periods=2000);