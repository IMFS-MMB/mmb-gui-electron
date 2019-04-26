//**************************************************************************
// A New Comparative Approach to Macroeconomic Modeling and Policy Analysis
//
// Volker Wieland, Tobias Cwik, Gernot J. Mueller, Sebastian Schmidt and 
// Maik Wolters
//
// Working Paper, 2009
//**************************************************************************

// Model: NK_GK09

// Model replication coded by: Tong Wang, e_mail: Tong.Wang@hof.uni-frankfurt.de
//                             Xiaobei He, e_mail: xihe@wiwi.uni-frankfurt.de

// Last edited: 02/03/2011

// Further references:
// Gertler, M. and Karadi, P. ``A Model of Unconvetional Monetary Policy''
// In: Journal of Monetary Economics (2010)
//**************************************************************************

var nu rk r uc eta x z phi n ne nn q k delta u l y i c pmn pi
rn epsilon a pm efp lambda erk psi phic f f1 pistar ym mc d in   
nuf rkf rf ucf xf etaf zf phif nf nef nnf qf kf deltaf uf lf yf if cf 
epsilonf af efpf lambdaf erkf psif phicf inf1 

//**************************************************************************
// Modelbase Variables                                                   //*
        interest inflation inflationq outputgap output;                  //*
//**************************************************************************

varexo e_rn e_a e_epsilon e_n       
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
        std_r_ std_r_quart coffispol           
//************************************************************************** 
theta beta divert omega alpha deltac b zeta chi etai vphi rhoa
rhoeps rhoi kappa_pi kappa_mc gamma gammap PMss veps h Iss PIss RNss Gss 
PHIss EFPss Rss ETAss NUss Zss Xss RKss DELTAss YKss IKss CKss KLss Lss Kss
Yss Nss NEss NNss Css PMNss  LAMBDAss PSIss upsilon UCss IYss Dss Fss F1ss

PMfss Yfss YKfss Lfss KLfss Kfss Ifss RNfss Gfss bfss IKfss CKfss Cfss UCfss  
Nfss NEfss NNfss deltacf;



beta = 0.99;
alpha = 0.33;
veps = 4.167;
h = 0.815;
zeta = 7.2;
etai = 1.728;
chi = 3.409;
vphi = 0.276;
gamma = 0.779;
gammap = 0.241;
kappa_pi = 2.043;
kappa_mc = 0.5/4;
rhoi = 0;
rhoa = 0.9;
rhoeps = 0.66;
PMss = (veps-1)/veps;
theta = 0.972;
Rss = 1/beta;
EFPss = 0.01/4;
PHIss = 4.08;
omega = (1-theta*(EFPss*PHIss+Rss))*1/PHIss;
Zss = EFPss*PHIss + Rss;
Xss = Zss;
NUss = (1-theta)*beta*EFPss/(1-beta*theta*Xss);
ETAss = (1-theta)*beta*Rss/(1-beta*theta*Zss);
RKss = Rss + EFPss;
DELTAss = 0.025;
YKss = (RKss - (1-DELTAss))/alpha/PMss;
IKss = 0.025;
IYss=IKss/YKss;
KLss = YKss^(1/(alpha-1));
Lss = (((1-alpha)*(1-beta*h)*PMss)/((1-h)*chi*(0.8-IYss)))^(1/(1+vphi));
Kss = KLss*Lss;
b = alpha*YKss;
Yss=Kss^alpha*Lss^(1-alpha);
Gss = 0.2*Yss;
Iss = IYss*Yss;
RNss=log(Rss);                                                 
PIss = 1;
PMNss = PMss;
deltac = DELTAss - b/(1+zeta); 
divert = ETAss/PHIss + NUss;
Nss = Kss/PHIss;
NEss = theta*Zss*Nss;
NNss = omega*Kss;
Css = Yss-Iss-Gss;
Fss = Yss*PMNss/(1-beta*gamma);
F1SS = Yss/(1-beta*gamma*PIss^(gammap-1));
LAMBDAss = 1;
PSIss=1;                        
upsilon=0;                          
UCss=(1-beta*h)/((1-h)*Css); 
Fss = Yss*PMss/(1-beta*gamma);
F1ss = Yss/(1-beta*gamma);
Dss=1;

PMfss=1;
YKfss = (RKss - (1-DELTAss))/alpha/PMfss;
IKfss = 0.025;
IYfss=IKfss/YKfss;
KLfss = YKfss^(1/(alpha-1));
Lfss = (((1-alpha)*(1-beta*h)*PMfss)/((1-h)*chi*(0.8-IYfss)))^(1/(1+vphi));
Kfss = KLfss*Lfss;
bfss = alpha*YKfss;
Yfss=Kfss^alpha*Lfss^(1-alpha);
Gfss = 0.2*Yfss;
Ifss = IYfss*Yfss;
deltacf = DELTAss - bfss/(1+zeta); 
Nfss = Kfss/PHIss;
NEfss = theta*Zss*Nfss;
NNfss = omega*Kfss;
Cfss = Yfss-Ifss-Gfss;
UCfss=(1-beta*h)/((1-h)*Cfss); 


//**************************************************************************
// Specification of Modelbase Parameters                                 //*
                                                                         //*
// Load Modelbase Monetary Policy Parameters                             //*
thispath = cd;                                                           
cd('..');                                                                
load policy_param.mat;                                                   
for i=1:24                                                               
    deep_parameter_name = M_.param_names(i,:);                           
    eval(['M_.params(i)  = ' deep_parameter_name ' ;'])                  
end                                                                      
cd(thispath);  
                                                          
// Definition of Discretionary Fiscal Policy Parameter                   //*
coffispol = 0;//1/GY;                                                    //*   
//**************************************************************************

model(linear);

//**************************************************************************
// Definition of Modelbase Variables in Terms of Original Model Variables //*

interest   = 4*rn;                                                       //*
inflation  = pi+pi(-1)+pi(-2)+pi(-3);                                    //*
inflationq = 4*pi;                                                       //*
outputgap  = y-yf;                                                       //*
output     = y;                                                          //*  
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
           + std_r_ *interest_;                                          //* 
                                                                         //*
// Discretionary Government Spending                                     //*
                                                                         //*
//fispol = coffispol*fiscal_;                                              //*  
//**************************************************************************
// Original Model Code:

NUss*nu = (1-theta)*beta*(RKss*rk(1)-Rss*r) + (1-theta)*beta*(RKss-Rss)*lambda(1) + beta*theta*Xss*NUss*(lambda(1)+x(1)+nu(1));
ETAss*eta = (1-theta)*beta*LAMBDAss*Rss*(lambda(+1)+r)+beta*theta*Zss*ETAss*(lambda(1)+z(1)+eta(1));    
divert*PHIss*phi-PHIss*NUss*(phi+nu)=ETAss*eta;
Zss*z = PHIss*(RKss*rk-Rss*r(-1)) + PHIss*(RKss-Rss)*phi(-1) + Rss*r(-1);
x = phi - phi(-1) + z;
n = NEss/Nss*ne + NNss/Nss*nn - e_n;
ne = z + n(-1);
nn = q + k + epsilon;  
RKss*Kss*(rk+q(-1)+k(-1))=alpha*PMss*Yss*(pm+ym)+Kss*(q+epsilon+k(-1))-DELTAss*Kss*(delta+epsilon+k(-1));
ym = a + alpha*u + alpha*epsilon + alpha*k(-1)+(1-alpha)*l;
DELTAss/(DELTAss-deltac)*delta = (1+zeta)*u;    
pm + ym - u = zeta*u + epsilon + k(-1);
in = Iss*i - DELTAss*Kss*(k(-1)+epsilon+delta);
q = etai*(in-in(-1))/Iss - beta*etai*(in(1)-in)/Iss;
Kss*k = Kss*k(-1) + Kss*epsilon + in;
uc = -1/((1-beta*h)*(1-h))*(c-h*c(-1)-beta*h*(c(1)-h*c));
lambda = uc - uc(-1);
lambda(1) + r = 0;
Yss*y = Css*c + Iss*i;
pm + ym - l = -uc + vphi*l;
pm = pmn  - pi;  
mc=-pm; 
y=ym+d;
Dss*d=gamma*Dss*PIss^(veps*(1-gammap))*(-gammap*veps*pi(-1)+veps*pi+d(-1))+veps/(1-gamma)*((1-gamma*PIss^((gamma-1)*(1-gammap)))/(1-gamma))^(-veps/(1-gamma))*gamma*PIss^((gamma-1)*(1-gammap))*((gamma-1)*pi+gammap*(1-gamma)*pi(-1));
Fss*f = Yss*PMss*(y+pm) + beta*gamma*LAMBDAss*Fss*(lambda(1)-gammap*veps*pi+veps*pi(1)+f(1));
F1ss*f1 = Yss*y + beta*gamma*LAMBDAss*PIss^(gammap-1)*F1ss*(lambda(1)+gammap*(1-veps)*pi-(1-veps)*pi(1)+f1(1));
pistar = f - f1 + pi;                
pi = gamma*gammap*pi(-1) + (1-gamma)*pistar;
rn = r + pi(1);
//rn = rhoi*rn(-1) + (1-rhoi)*(kappa_pi*pi+kappa_mc*mc) + e_rn;
efp = rk(1)-r;
a = rhoa*a(-1) - e_a;
epsilon = rhoeps*epsilon(-1) - e_epsilon;
erk = rk(+1);
PSIss*psi = -upsilon*EFPss*efp;
q + k = phic + n;
phic + psi = phi;

// Flexible price model (not explicitly treated in original model)

NUss*nuf = (1-theta)*beta*(RKss*rkf(1)-Rss*rf) + (1-theta)*beta*(RKss-Rss)*lambdaf(1) + beta*theta*Xss*NUss*(lambdaf(1)+xf(1)+nuf(1));
ETAss*etaf = (1-theta)*beta*LAMBDAss*Rss*(lambdaf(+1)+rf)+beta*theta*Zss*ETAss*(lambdaf(1)+zf(1)+etaf(1));    
divert*PHIss*phif-PHIss*NUss*(phif+nuf)=ETAss*etaf;
Zss*zf = PHIss*(RKss*rkf-Rss*rf(-1)) + PHIss*(RKss-Rss)*phif(-1) + Rss*rf(-1);
xf = phif - phif(-1) + zf;
nf = NEfss/Nfss*nef + NNfss/Nfss*nnf - e_n;
nef = zf + nf(-1);
nnf = qf + kf;  
RKss*Kfss*(rkf+qf(-1)+kf(-1))=alpha*PMfss*Yfss*(yf)+Kfss*(qf+epsilonf+kf(-1))-DELTAss*Kfss*(deltaf+epsilonf+kf(-1));
yf = af + alpha*uf + alpha*epsilonf + alpha*kf(-1)+(1-alpha)*lf;
DELTAss/(DELTAss-deltacf)*deltaf = (1+zeta)*uf;    
yf - uf = zeta*uf + epsilonf + kf(-1);
inf1 = Ifss*if - DELTAss*Kfss*(kf(-1)+epsilonf+deltaf);
qf = etai*(inf1-inf1(-1))/Ifss - beta*etai*(inf1(1)-inf1)/Ifss;
Kfss*kf = Kfss*kf(-1) + Kfss*epsilonf + inf1;
ucf = -1/((1-beta*h)*(1-h))*(cf-h*cf(-1)-beta*h*(cf(1)-h*cf));
lambdaf = ucf - ucf(-1);
lambdaf(1) + rf = 0;
Yfss*yf = Cfss*cf + Ifss*if;
yf - lf = -ucf + vphi*lf;
efpf = rkf(1)-rf;
af = rhoa*af(-1) - e_a;
epsilonf = rhoeps*epsilonf(-1) - e_epsilon;
erkf = rkf(+1);
PSIss*psif = -upsilon*EFPss*efpf;
qf + kf = phicf + nf;
phicf + psif = phif;
end;


shocks;
var e_rn; stderr 0;
var e_a; stderr 0;
var e_n; stderr 0;
var e_epsilon; stderr 0;

end;

//stoch_simul(order=1,irf=40); 
