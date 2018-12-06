//**************************************************************************
// A New Comparative Approach to Macroeconomic Modeling and Policy Analysis
//
// Volker Wieland, Tobias Cwik, Gernot J. Mueller, Sebastian Schmidt and 
// Maik Wolters
//
// Working Paper, 2009
//**************************************************************************

// Model: NK_RW97

// Further references:
// Rotemberg, J., and M. Woodford. 1997. "An Optimization-Based Econometric Framework for the Evaluation of Monetary Policy."
// NBER Macroeconomics Annual 12, pp. 297-346.

// Last edited: 10/08/26 by S. Schmidt

// See Woodford(2003) p.246 for the model equations.


var pi y ynat rnat i x u g g_

//**************************************************************************
// Modelbase Variables                                                   //*    
   interest inflation inflationq outputgap output fispol;                //*
//**************************************************************************

varexo u_ 

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
 beta sigma alpha theta omega kappa rhou rhog stdinflation_ stdfiscal_;  

beta = 1/(1+0.035/4);  // 0.9913
sigma= 6.25;
alpha= 0.66;
theta= 7.66;
omega= 0.47;
kappa= (((1-alpha)*(1-alpha*beta))/alpha)*(((1/sigma)+omega)/(1+omega*theta));
rhou=0;
stdinflation_=0.154;
rhog= 0.8;
stdfiscal_=1.524;

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

interest   = i*4;                                                        //*
inflation = (1/4)*(4*pi+4*pi(-1)+4*pi(-2)+4*pi(-3));			         //*
inflationq  = pi*4;                                                      //*
outputgap  = x;                                                          //*
output = y;                                                              //*
fispol = g_;                                                             //*
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

pi   =  beta * pi(+1)+ kappa*x+ u;
u=rhou*u(-1)+u_;
x  =  x(+1) - sigma *( i - pi(+1) - rnat) ;
rnat = sigma^(-1)*((g-ynat)- (g(+1)-ynat(+1)));
ynat = sigma^(-1)*g /(sigma^(-1)+omega);
x = y-ynat;
g = rhog*g(-1) + g_;
// i=phipi*pi + phix*x;   
end;


shocks;
var fiscal_= 1.524^2;
var u_=0.154^2;
end;

//stoch_simul (irf = 0, ar=100, noprint);