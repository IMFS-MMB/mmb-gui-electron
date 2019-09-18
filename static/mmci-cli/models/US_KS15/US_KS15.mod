//**************************************************************************
// A New Comparative Approach to Macroeconomic Modeling and Policy Analysis
//
// Volker Wieland, Tobias Cwik, Gernot J. Mueller, Sebastian Schmidt and 
// Maik Wolters
//
// Working Paper, 2009
//**************************************************************************

% Model US_KS15

% Literatur: A. Kriwoluzky and C. Stoltenberg (2015): Monetary Policy and 
% the Transaction Role of Money in the US. Economic Journal, Vol 125, 1452-1473 

% Last edited: 16/05/24 by F. Strobel

var 
lambda // marginal utility of consumption
c   // consumption
m   // money balances
pit // inflation
z   // transaction costs
nu  // taste
l   // labour
mu  // wage mark-up
w   // wage
R   // nominal interest rate
psi // real marginal costs
a   // productivity
g   // government expenditure
y   // output
RR  // real interest rate
eps_g// government spending shock

% flex-price eq.
lambdaf cf mf lf wf psif yf RRf
//**************************************************************************
// Modelbase Variables                                                   //*
        interest inflation inflationq outputgap output fispol;           //*
//**************************************************************************


varexo eps_z eps_nu eps_mu eps_a
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
eta_cc eta_ch eta_hc_sigma_h sigma_c gamma omega betta alpha
rho_pi rho_y g_o_y rho_z rho_nu rho_mu rho_a rho_g eta_R rho_R;


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

gamma   = 0.0;  // habit formation
betta   = 0.99; // discount factor
omega   = 3.5;  //
sigma_c = 0.99; // according to authors code
alpha   = 0.6051;  // Calvo parameter
g_o_y   = 0.2;  // stst. government spending to output ratio
eta_cc  = 0.01; // according to authors code
eta_R   = 0.12; // according to authors code
rho_R   = 0.0;  // interest rate smoothing
rho_pi  = 2.3829; // Taylor rule coefficient for inflation
rho_y   = 0.0;  // Taylor rule coefficient for output
eta_ch  = 0;    // for R4
eta_hc_sigma_h = 0.85; // eta_hc_sigma_h=eta_hc/sigma_h

rho_z   = 0.9620; // persistence parameter for transaction cost shock
rho_nu  = 0.9638; // persistence parameter for preference shock
rho_mu  = 0.8828; // persistence parameter for labor supply shock
rho_a   = 0.9883; // persistence parameter for technology shock
rho_g   = 0.9472; // persistence parameter for gov. spending shock

model(linear);

//**************************************************************************
// Definition of Modelbase Variables in Terms of Original Model Variables //*

interest   = R*4;                                                        //*
inflation  = 1/4*(inflationq+inflationq(-1)+inflationq(-2)+inflationq(-3));                                                 	 //*
inflationq = 4*pit;                                                 	 //*
outputgap  = y-yf;                                                       //*
output     = y;                                                          //*
fispol     = eps_g;                                                      //*
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
fispol = coffispol*fiscal_;                                              //*
//**************************************************************************                                                                    

lambda=-(eta_cc+sigma_c)*c+ eta_ch*(m(-1)-pit+z)+sigma_c*gamma*c(-1)+nu; // marginal utility of c
lambda=omega*l+mu-w;                                        // Labor supply
lambda=R + lambda(+1)-pit(+1);                              // Euler equation
w=psi+a;                                                    // Labor demand
pit=betta*pit(+1)+(1-alpha)*(1-alpha*betta)/(alpha)*psi;    // NKPC
y=a+l;                                                      // production function
y=(1-g_o_y)*c+g;                                            // aggregate good market clearing
%R=rho_R*R(-1)+rho_pi*pit+rho_y*y+eps_m;                     // interest rate rule
m=-eta_R*R+eta_hc_sigma_h*c(+1)+pit(+1)-z(+1);              // money demand
RR=R-pit(+1);

z=rho_z*z(-1)+eps_z;                            // transaction cost shock
mu=rho_mu*mu(-1)+ eps_mu;                       // labor supply shock
nu=rho_nu*nu(-1)+eps_nu;                        // preference shock
a=rho_a*a(-1)+eps_a;                            // technology shock
g=rho_g*g(-1)+fiscal_;                            // government spending shock


lambdaf=-(eta_cc+sigma_c)*cf+ eta_ch*(mf(-1)+z)+sigma_c*gamma*cf(-1)+nu; // marginal utility of cf
lambdaf=omega*lf+mu-wf;                                        // Labor supply
lambdaf=RRf + lambdaf(+1);                                     // Euler equation
wf = psif +a;
psif=0;
yf=a+lf;                                                      // production function
yf=(1-g_o_y)*cf+g;                                            // aggregate good market clearing
mf= eta_hc_sigma_h*cf(+1) -z(+1);              // money demand

end;

shocks;                     //(posterior post-1982)
var fiscal_;  stderr 0.0053;  // government spending shock
var eps_a;    stderr 0.0044;  // technology shock
var eps_mu;   stderr 0.0188;  // labor supply shock
var eps_z;    stderr 0.0140;  // transaction cost shock
var eps_nu;   stderr 0.0152;  // preference shock
var interest_;stderr 0.0055;  // interest rate shock
end;

%stoch_simul(irf=20, nograph) c y m pit RR R;
%stoch_simul(irf=20) inflation interest output outputgap;

