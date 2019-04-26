//**************************************************************************
// A New Comparative Approach to Macroeconomic Modeling and Policy Analysis
//
// Volker Wieland, Tobias Cwik, Gernot J. Mueller, Sebastian Schmidt and 
// Maik Wolters
//
// Working Paper, 2009
//**************************************************************************

// Model: NK_IR04

// Further references:
// Ireland, Peter N. "Money's Role In The Monetary Business Cycle," 
// "Journal of Money, Credit and Banking, 2004, v36(6,Dec), 969-983.


// Last edited: 11/09/07 by S. Schmidt 

// Comment: Due to the real balance effect, we have to make an assumption about the evolution
// of the nominal interest rate under flexible prices in order to calculate the natural rate
// of output and hence the output gap. Following Ravenna & Walsh (2006), we impose
// an interest rate peg for the flexible price equilibrium.


var y m pi r a e z

//**************************************************************************
// Modelbase Variables                                                  //*    
   interest inflation inflationq outputgap output;                      //*
//**************************************************************************

varexo epsa_ epse_ epsz_ 

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
omega1 omega2 psi gamma1 gamma2 gamma3 rhor rhoy rhopi rhoa rhoe rhoz sigmaa sigmae sigmaz sigmar lny lnm lnpi lnr yss mss piss rss;


// parameters of constrained model
omega1 = 1;
omega2 = 0.25;
psi = 0.1;
gamma1 = 0.0158;
gamma2 = 0.1251;
gamma3 = 0.9977;
rhor = 0.5481;
rhoy = 0.0000;
rhopi = 0.5680;
rhoa = 0.9575;
rhoe = 0.9867;
rhoz = 0.9904;
sigmaa = 0.0187;
sigmae = 0.0088;
sigmaz = 0.0098;
sigmar = 0.0025;
lny = 8.8747;
lnm = 9.7383;
lnpi = 0.0100;
lnr = 0.0186;
yss = 7148.8015;
mss = 16954.6939;
piss = 1.0101;
rss = 1.0188;

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

model(linear);

//**************************************************************************
// Definition of Modelbase Variables in Terms of Original Model Variables//*                                                                        
interest = 4*r;                                                          //*
inflation = pi + pi(-1) + pi(-2) + pi(-3);		          	             //*
inflationq  = 4*pi;                                                      //*
outputgap = y - (omega1*z-omega2*gamma2*0+omega2*(gamma3-1)*e)/(1-omega2*gamma1); //*
output = y;                                                              //*
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
           + std_r_ *interest_;                                          //* 
//**************************************************************************

// Original Model Code:

//r = rhor*r(-1) + rhoy*y(-1) + rhopi*pi(-1) + interest_;  //original interest rate rule

a = rhoa*a(-1) + epsa_;
e = rhoe*e(-1) + epse_;
z = rhoz*z(-1) + epsz_;
y = y(+1) - omega1*(r - pi(+1)) + omega2*((m - e) - (m(+1) - e(+1))) + omega1*(a - a(+1));
m = gamma1*y - gamma2*r + gamma3*e;
pi = (piss/rss)*pi(+1) + psi*((1/omega1)*y - (omega2/omega1)*(m-e)-z);

end;


shocks;
var epsa_ = 10000*sigmaa^2;
var epse_ = 10000*sigmae^2;
var epsz_ = 10000*sigmaz^2;
var interest_ = 10000*sigmar^2;
end;


//stoch_simul (irf = 16);