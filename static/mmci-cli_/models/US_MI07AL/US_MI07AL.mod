//**************************************************************************
// A New Comparative Approach to Macroeconomic Modeling and Policy Analysis
//
// Volker Wieland, Tobias Cwik, Gernot J. Mueller, Sebastian Schmidt and 
// Maik Wolters
//
// Working Paper, 2009
//**************************************************************************

// Model: US_MI07AL

// Further references:
// Milani, F. "Expectations, learning and macroeconomic persistence."
// Journal of Monetary Economics 54 (2007), pp. 2065-2082.

// Last edited: 11/08/01 by P. Kuang & D. Stijepic


var i pi pi_tilde x x_tilde r_n u 

//**************************************************************************
// Modelbase Variables                                                   //*    
   interest inflation inflationq outputgap output                     	 //*
   inflationql inflationql2 inflationqls;                                //*
//**************************************************************************

varexo v_r v_u

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
//************************************************************************** *
  
beta sigma gamma xi_p omega eta phi_r phi_u;

beta = 0.9897;
sigma= 2.666; //sigma=1/(phi*(1-beta*eta)), where phi=3.813
gamma= 0.885;
xi_p=0.001;
omega=0.837;
eta=0.911;
phi_r=0.87;
phi_u=0.02;

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
coffispol = 1;  
// State and forward variables for learning setup                        //*

AL_Info.forwards = {'pi','pi_tilde','inflationq','x','x_tilde',};
AL_Info.states_long  = {'x',  'inflationq','inflationqls', 'r_n', 'u'};
AL_Info.states_short = {'x',  'inflationq', 'r_n', 'u'};;
save AL_Info AL_Info                                                            
model(linear);

//**************************************************************************
// Definition of Modelbase Variables in Terms of Original Model Variables//*
									                                     //*
interest   = i*4;  
inflationql = inflationq(-1);                                            //*
inflationql2 = inflationql(-1);                                          //*
inflationqls = inflationql + inflationql2;                               //*                                                      //*
inflationq  = pi*4;                                                      //*
outputgap  = x;                                                          //*	
output  = x;                                                          //*			
inflation =0.25 * (inflationq + inflationql + inflationql2 + inflationql2(-1));//*			        		
		                                                                 //*
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
//           + 0.25*cofintinff1*pinf(+1)                                   //* 
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

// Original Model Code:
x_tilde=x_tilde(+1)-(1-beta*eta)*sigma*(i-pi(+1)-r_n);
pi_tilde=xi_p*(omega*x+((1-beta*eta)*sigma)^(-1)*x_tilde)+beta*pi_tilde(+1)+u;

pi_tilde=pi-gamma*pi(-1);
x_tilde=(x-eta*x(-1))-beta*eta*(x(+1)-eta*x);

r_n=phi_r*r_n(-1)+v_r;
u=phi_u*u(-1)+v_u;
                     
end;


shocks;

var v_r= 1.67^2;
var v_u=1.15^2;
var interest_=1;
end;

//stoch_simul (irf = 0, ar=100, noprint);