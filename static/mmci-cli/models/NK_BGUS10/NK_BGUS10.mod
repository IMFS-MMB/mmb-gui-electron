//**************************************************************************
// A New Comparative Approach to Macroeconomic Modeling and Policy Analysis
//
// Volker Wieland, Tobias Cwik, Gernot J. Mueller, Sebastian Schmidt and 
// Maik Wolters
//
// Working Paper, 2009
//**************************************************************************

// Model: NK_BG10US

// Further references:
// Blanchard, O., and J. Galí. 2010. "Labor Markets and Monetary Policy: 
// A New Keynesian Model with Unemployment."
// AEL: Macroeconomics 2, 2(2), pp. 1-30.

// Last edited: 14/02/18 by Dennis Gram & Johannes Van Vlodrop

// See Blanchard & Galí (2010) pp. 13 for the model equations.
// This version implements the US specification of the model (fluid labor market specification)

var pi mc xhat c a n uhat i xhatf cf nf uhatf r y yf

//**************************************************************************
// Modelbase Variables                                                   //*    
   interest inflation inflationq outputgap output fispol;                //*
//**************************************************************************

varexo a_ 

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
gam alf the bet phi eps lam M gdel ra x_ u del g B chi bphi alfux gmu xi0 xi1 k0 kl kf rho;  

x_  = 0.7;
u  = 0.05; 
B = 5/42;

gam  = 0.5;         
alf  = 1;           
the  = 1;           
bet  = 0.99;        
phi  = 1;           
eps  = 6;           
lam = 1/12;        
M = eps/(eps-1);    
gdel = 0.01;       

ra = 0.9;

del = u*x_/((1-u)*(1-x_));
g = B*x_^alf;

N      = 1-u;
chi    = ((1/M) -(1-bet*(1-del))*(1+the)*g-bet*(1-del)*the*g*x_)/(N^(1+phi)*(1-del*g));
 
bphi = 1-(1-bet*(1-del))*g*M ;
alfux = (lam*(1+phi)*chi*(1-u)^(phi-1))/eps ;
gmu = g*M/(1-u);
xi0 = (1-(1+alf)*g)/(1-del*g) ;
xi1 = g*(1-del)*(1+alf*(1-x_))/(1-del*g) ;
k0 = lam*( (alf*gmu/del)*(1+bet*(1-del)^2*(1-x_))+  bet*(1-del)*gmu*(xi1-xi0));
kl = lam*((alf/del)*gmu*(1-del)*(1-x_) + bet*(1-del)*gmu*xi1 );
kf = lam*bet*(1-del)*gmu*((alf/del)-xi0);
rho = -log(bet);


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
// Definition of Modelbase Variables in Terms of Original Model Variables//*

interest   = i*4;                                                        //*        
inflation = (1/4)*(4*pi+4*pi(-1)+4*pi(-2)+4*pi(-3));			         //*        
inflationq  = pi*4;                                                      //*        
outputgap  = y-yf;                                                       //*        
output = y;                                                              //*       
// fispol = g_;                                                          //*    
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

// Model Code:
// Note, first equation always refers to baseline model, second equation to flexible prices equilibrium

// Phillips Curve
pi   =  bet * pi(+1) + lam*mc;

// Marginal Costs
mc = alf*g*M*xhat-bet*(1-del)*g*M*((c-a)-(c(+1)-a(+1))+alf*xhat(+1))-bphi*gam*a;
alf*g*M*xhatf = bet*(1-del)*g*M*((cf-a)-(cf(+1)-a(+1))+alf*xhatf(+1))+ bphi*gam*a;
// Labor Supply 
del*xhat = n-(1-del)*(1-x_)*n(-1);
del*xhatf = nf-(1-del)*(1-x_)*nf(-1);
// Consumption
c = a + (1-g)/(1-del*g)*n + (g*(1-del))/(1-del*g)*n(-1) - (alf*g)/(1-del*g)*del*xhat;
cf = a + (1-g)/(1-del*g)*nf + (g*(1-del))/(1-del*g)*nf(-1) - (alf*g)/(1-del*g)*del*xhatf;
// Euler
c = c(+1) - (i-pi(+1)-rho);
cf = cf(+1) - (r-rho);
// Unemployment, Employment
uhat = -(1-u)*n;
uhatf = -(1-u)*nf;
// Output
y = a + n;
yf = a + nf;
// Technology
a = ra*a(-1) - a_;

end;


shocks;
var a_;
stderr 1;
end;

// stoch_simul (irf = 30, ar=100);