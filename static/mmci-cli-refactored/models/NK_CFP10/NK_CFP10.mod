//**************************************************************************
// A New Comparative Approach to Macroeconomic Modeling and Policy Analysis
//
// Volker Wieland, Tobias Cwik, Gernot J. Mueller, Sebastian Schmidt and 
// Maik Wolters
//
// Working Paper, 2009
//**************************************************************************

// Model: NK_CFP10

// Model replication coded by: Philipp Lieberknecht, 
//                             e_mail: philipp.lieberknecht@gmail.com
// Last edited: 18/01/2018

// Charles T. Carlstrom & Timothy S. Fuerst & Matthias Paustian, 2010.
// "Optimal Monetary Policy in a Model with Agency Costs" 
// Journal of Money, Credit and Banking, Blackwell Publishing, vol. 42(s1), pages 37-70, September.
//**************************************************************************

var 
y       // output
yeff    // output without price and credit frictions
yg      // output gap
R       // gross nominal interest rate
pi      // gross quarterly inflation 
z       // marginal costs
phi     // credit distortion
e       // entrepreneur's equity share holdings
q       // asset price
d       // dividends
L       // labor input 1
u       // labor input 2
r       // rental rate of capital
w       // real wage

yf      // output flex
ygf     // output gap flex
Rf      // gross real interest rate flex
zf      // marginal costs flex
phif    // credit distortion flex
ef      // entrepreneur's equity share holdings flex
qf      // asset price flex
df      // dividends flex
Lf      // labor input 1 flex
uf      // labor input 2 flex
rf      // rental rate of capital flex
wf      // real wage flex

a       // technology shock
eps_pi  // mark-up shock
n       // net worth shock
//eps_R   // monetary policy shock

//**************************************************************************
// Modelbase Variables                                                   //*
        interest inflation inflationq outputgap output; //fispol         //*
//**************************************************************************

varexo
eta_a   // technology shock innovation
eta_pi  // mark-up shock innovation
eta_n   // net worth shock innovation
//eta_R   // monetary policy shock innovation

//**************************************************************************
// Modelbase Shocks                                                      //*       
       interest_; //fiscal_                                             //*
//**************************************************************************

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

betta   $\beta$             // discount factor
sig     $\sigma$            // CRRA utility parameter
thet    $\thet$             // inverse Frisch labor supply elasticity
eps     $\epsilon$          // Dixit-Stiglitz elasticity of substitution
alfa    $\alpha$            // labor share
b                           // Collateral constraint Cobb-Douglas parameter
Lam     $\Lambda$           // auxiliary variable
varphi  $\varphi$           // Rotemberg adjustment cost parameter
lam     $\lambda$           // Philips curve slope wrt marginal costs
rho_a   $\rho_a$            // persistence technology shock
rho_R   $\rho_R$            // persistence monetary policy shock
rho_pi  $\rho_\pi$          // persistence price mark-up shock
rho_n   $\rho_n$            // persistence net worth shock
tau     $\tau$              // Taylor rule coefficient inflation
tau_g   $\tau_g$            // Taylor rule coefficient output gap
;

betta   = 0.99;
sig     = 0.16;
thet    = 0.47;
eps     = 10;
alfa    = 0.50;
b       = 0.20;
Lam     = (b-1);
varphi  = 173.08;
lam     = (eps-1)/varphi;
rho_a   = 0.95;
rho_n   = 0.90;
rho_pi  = 0.90;
rho_R   = 0.40;
tau     = 1.5;
tau_g   = 0.5;


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


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Model %%%
model(linear); 

//**************************************************************************
// Definition of Modelbase Variables in Terms of Original Model Variables //*

interest   = R*4;                                                        //*
inflation  = pi+pi(-1)+pi(-2)+pi(-3);                                    //*
inflationq = pi*4;                                                       //*
outputgap  = y-yf;                                                       //*
output     = y;
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
           + std_r_/100 *interest_;                                          //* 
                                                                         //*
// Discretionary Government Spending                                     //*
                                                                         //*
//fispol = coffispol*fiscal_;                                            //*
//**************************************************************************

//Sticky price economy
[name='(A1)']
sig*y + thet*L = w;
[name='(A2)']
sig*y + thet*u = r;
[name='(A3)']
sig*(y(+1)-y) = R - pi(+1);
[name='(A4) rewritten as in (35)']
phi = (1+thet)/(1+Lam)*(yg(+1)-yg) - (1-alfa*b)/(1+Lam)*(phi(+1)-phi) - (sig-1)*(1+thet)/((sig+thet)*(1+Lam))*(a(+1)-a) - 1/(1+Lam)*n(+1);
[name='(A5)']
e + q = z + y + Lam*phi;
[name='(A6) rewritten as in (34)']
e = 1/betta*(e(-1) - eps*(1-betta)*(sig+thet)*yg + (1+betta*Lam - alfa*eps*(1-betta)*b)*phi + n);
[name='(A7) rewritten as in (19)']
z = (sig+thet)*yg + alfa*b*phi;
[name='(A8)']
y = a + (1-alfa)*u + alfa*L;
[name='(A9)']
pi = lam*z + betta*pi(+1) + lam*eps_pi;
[name='(A10)']
d = y - (eps-1)*z;
[name='(A11)']
b*phi = z + y -w - L;
//[name='Taylor Rule']
//R = tau*pi + tau_g*yg + eps_R;
[name='Output without price and credit frictions']
yeff = (1+thet)/(sig+thet)*a;
[name='Output gap']
yg = y-yeff;

//Flexible price economy
[name='(A1f)']
sig*yf + thet*Lf = wf;
[name='(A2f)']
sig*yf + thet*uf = rf;
[name='(A3f)']
sig*(yf(+1)-yf) = Rf;
[name='(A4) rewritten as in (35)']
phif = (1+thet)/(1+Lam)*(ygf(+1)-ygf) - (1-alfa*b)/(1+Lam)*(phif(+1)-phif) - (sig-1)*(1+thet)/((sig+thet)*(1+Lam))*(a(+1)-a) - 1/(1+Lam)*n(+1);
[name='(A5)']
ef + qf = zf + yf + Lam*phif;
[name='(A6) rewritten as in (34)']
ef = 1/betta*(ef(-1) - eps*(1-betta)*(sig+thet)*ygf + (1+betta*Lam - alfa*eps*(1-betta)*b)*phif + n);
[name='(A7) rewritten as in (19)']
zf = (sig+thet)*ygf + alfa*b*phif;
[name='(A8)']
yf = a + (1-alfa)*uf + alfa*Lf;
[name='(A9)']
zf = 0;
[name='(A10)']
df = yf - (eps-1)*zf;
[name='(A11)']
b*phif = zf + yf -wf - Lf;
[name='Output gap']
ygf = yf-yeff;

// Shocks
[name='Technology']
a = rho_a*a(-1) + eta_a;
[name='Mark-up shock']
eps_pi = rho_pi*eps_pi(-1) + eta_pi;
[name='Net worth shock']
n = rho_n*n(-1) + eta_n;
//[name='Monetary policy shock']
//eps_R = rho_R*eps_R(-1)+ eta_R;
end;

shocks;
var eta_a;      stderr 1;
var eta_pi;     stderr 1;
var eta_n;      stderr 1;
//var eta_R;      stderr 2.205993;
var interest_;  stderr 1;
end;

%check;
%steady;
%close all;
%stoch_simul(order=1,irf=21, noprint) outputgap inflation interest output;