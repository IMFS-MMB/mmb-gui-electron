// Model: NK_GM16

// Further references:
// Gal�, Jordi, and Tommaso Monacelli (2016) �Understanding the Gains from Wage Flexibility: The Exchange Rate Connection"
// AMERICAN ECONOMIC REVIEW VOL. 106, NO. 12, (pp. 3829-68)

// The code has been provided by the authors.
// Implemented by Lazar Milivojevic 15/02/2019

// World economy exogenous

//--------------------------------------------------------------------------
// 1. Defining variables
//--------------------------------------------------------------------------

// variables are in log deviations from respective steady states
var
y         // output
c         // consumtion
s         // terms of trade (TOT) in SOE
z         // exogenous preference shifter
zx1
zx2    //  Exogenous shocks that are defined by the differential monetary policy responses they elicit from the (foreign) central bank
i         // nominal interest rate in SOE
dpc        // CPI inflation in SOE
e         // nominal exchange rate in SOE
p        // domestic price level
n         // labor
a         // productivity in SOE
dp       // domestic inflation in SOE
t       // labor tax
wp     // real wage
dw       // wage inflation
w         // nominal wages
pc         // price level in SOE
r       // real interest rate
de
ygap // gaps
wgap
sgap
cgap
ngap
ngapx
yn   //flexible price counterparts
sn
cn
nn
ne
wpn


//**************************************************************************
// Modelbase Variables                                                   //*
        interest inflation inflationq  output outputgap;          //*
//**************************************************************************



// exogenous variables
varexo ez ea ezx1 ezx2 et

//**************************************************************************
// Modelbase Shocks                                                      //*
       interest_;                                                 //*
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
        std_r_ std_r_quart                                      //*
//**************************************************************************


bet phi epsp alf epsw thep thew phiy nu lamw lamp  rhoa rhoz rhot rhozx1 rhozx2;

thep = 0.8 ;       % constant price calvo parameter
thew = 0.8;
phiy = 0 ;
//phie = 0.999 ; // for a currency union
//phip =0 ;   // for a currency union
//phie = 0 ;    // domestic inflation targeting
//phip =1 ;     // domestic inflation targeting
//game = 1 ;
phi = 2.22 ;
alf = 0.26 ;
bet = 0.99 ;
nu = 0.3 ;               % openness
epsw = 1/(1-exp(-phi*0.118)) ;        % labor demand elasticity (consistent with u = 11.8%;  phi=2,epsw=2.24 )

epsp = 3.85 ;           % goods demand elasticity

lamp   =   ((1-bet*thep)*(1-thep)/thep)*((1-alf)/(1-alf+alf*epsp)) ;
lamw   =   (1-bet*thew)*(1-thew)/(thew*(1+epsw*phi)) ;

rhoz =  0.9 ;
rhoa =  0.9 ;
rhozx1 =  0.9 ;
rhozx2 =  0.9 ;
rhot =  0.9 ;

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
                                                      //*
//**************************************************************************

model(linear);

//**************************************************************************
// Definition of Modelbase Variables in Terms of Original Model Variables//*

interest   = i*4;                                                      //*
inflation = (1/4)*(4*dp+4*dp(-1)+4*dp(-2)+4*dp(-3));			         //*
inflationq  = dp*4;                                                    //*
outputgap  = ygap;                                                      //*
output = y;                                                          //*
//**************************************************************************

//**************************************************************************
// Monetary Policy                                                        //*
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

z   = rhoz*z(-1) + ez;                  % domestic demand shock
a   = rhoa*a(-1) + ea;                  % technology shock
zx1   = rhozx1*zx1(-1) + ezx1 ;         % export shock
zx2   = rhozx2*zx2(-1) + ezx2 ;         % world interest rate shock
t   = rhot*t(-1) - et;                  % payroll tax shock (sign modified for irfs)

y  = (1-nu)*c + nu*(2-nu)*s + nu*zx1 ;
c = (1-nu)*s + z - zx2 ;
c = c(+1) - (i - dpc(+1)) + (1-rhoz)*z ;
s  = e - p ;
pc = p + nu*s ;
r = i - dp(+1);
n   =  (y - a)/(1-alf) ;

dp  = bet*dp(+1) + (lamp*alf/(1-alf))*ygap + lamp*wgap + lamp*nu*sgap ;
dw  = bet*dw(+1) + (lamw*phi/(1-alf))*ygap - lamw*wgap + lamw*cgap ;

dp = p - p(-1);                         % domestic price inflation
dpc = pc - pc(-1);
dw = w - w(-1);
de = e - e(-1);
wp = w - pc ;     % consumption wage

//i = (1-phie)*(phip*dp+phiy*y) + game*(phie/(1-phie))*e ;             % interest rate rule
//e=0;  // currency union
//dp=0; // domestic inflation targeting

ygap = y - yn;
ngap = n - nn;
ngapx = n - ne;
sgap = s - sn;
cgap = c - cn;
wgap = wp - wpn;

nn  =  - (nu/(1+phi))*(z-zx1-zx2) - (1/(1+phi))*t ;
ne  =   - (nu/(1+phi))*(z-zx1-zx2) ;
yn  =  a + (1-alf)*nn ;
sn  =  a - (z-zx2) - t - (alf+phi)*nn ;
cn  = (z-zx2) + (1-nu)*sn ;
wpn = a - alf*nn - t - nu*sn ;


end;

initval;
ngap = 0; ngapx =  0; ygap = 0; sgap = 0; cgap = 0; wgap = 0; dp = 0 ; dpc = 0 ; dw = 0; i = 0; r = 0;
e = 0; de = 0; y = 0; n = 0; s = 0; c = 0; wpn = 0; yn = 0; nn = 0; ne = 0; sn = 0; cn = 0; a = 0; z = 0;
t = 0; zx1 = 0; zx2 = 0;
end;

options_.noprint = 1;
steady;

shocks;
%var ea = 0.01^2;
%var ez = 0.01^2;
%var ezx1 = (0.01)^2;
%var ezx2 = (0.01)^2;
%var et = (0.01)^2;
var ea = 1;
var ez = 1;
var ezx1 = 1;
var ezx2 = 1;
var et = 1;
end;

//stoch_simul(irf=25) output outputgap interest ;
