//************************************************************************
// A New Comparative Approach to Macroeconomic Modeling and Policy Analysis
//
// Volker Wieland, Tobias Cwik, Gernot J. Mueller, Sebastian Schmidt and
// Maik Wolters
//
// Working Paper, 2009
//**************************************************************************

// Model: US_RSI09

// Further references:
// Reis, R. (2009). Optimal Monetary Policy Rules in an Estimated Sticky-Information Model
// American Economic Journal: Macroeconomics
// Verona, F. and Wolters, M. (2014). Sticky Information Models in Dynare.
// Computational Economics 43

// Created by Laura Schmidt
// Last edited:

//Allows for 16 lagged information sets to restrict computational time, adjust as desired (note: if so also adjust the parameter value of T in line 81)
@#define lags = [1:16]

var y a l p w yinfn i R pi x yclas deltaa g nuu gam eps z zwage zoutput
//y: output, a: productivity, l: labor, p: price, w: wage, yinfn: output 100 periods ahead (steady state output)
//i: interest rate, R: recursive long real interest rate, pi: inflation, outputgap: outputgap
//yclass: output without sticky information, deltaa: productivity growth, g: government spending (aggregate demand shock)
//nuu: elasticity of substitution (goods), gam: elasticity of substitution (labor)
//z: generic variable to compute the price under sticky information (sticky information Phillips curve)
//zwage: generic variable to compute the wage under sticky information (sticky information wage curve)
//zoutput: generic variable to compute output under sticky information (sticky information IS curve)

//**************************************************************************
// Modelbase Variables                                                   //*
   interest inflation inflationq output outputgap;                       //*
//**************************************************************************

varexo e_deltaa e_g e_nuu e_gam e_eps
//e_deltaa: producitivity shock
//e_g: aggregate demand shock
//e_nuu: goods markup shock
//e_gam: wage markup shock
//e_eps: monetary policy shock

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
beta nu lambda theta delta omega gamma psi phi_pi phi_y rho_deltaa rho_eps rho_g rho_nuu rho_gam;

// POSTERIOR MEAN, see Table 2 in paper
theta      =   1.00000000000000;
psi        =   5.15202697986071;
nu         =   10.0866927574090;
gamma      =   9.09210945073590;
beta       =   0.666666666666667;
rho_deltaa =   0.0285825345078334;
rho_eps    =   0.294610252638720;
rho_g      =   0.996989047437769;
rho_nuu    =   0.280541889680312;
rho_gam    =   0.855785136269719;
phi_pi     =   1.17350494813421;
phi_y      =   0.0625290108287302;
delta      =   0.0822178065824585;
omega      =   0.744214139325477;
lambda     =   0.516437987152365;
T=16;

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

// Definition of Discretionary Fiscal Policy Parameter                   //*
coffispol = 0;                                                           //*
//**************************************************************************


model(linear);
//**************************************************************************
// Definition of Modelbase Variables in Terms of Original Model Variables //*

interest   = 4*i;                                                        //*
inflation  = pi+pi(-1)+pi(-2)+pi(-3);                                    //*
inflationq = 4*pi;                                                       //*
outputgap  = x;                                                          //*
output     = y;                                                          //*
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


// Original Model Code
//production function
y = a + beta*l;

// Phillips Curve
z = p +  (beta*(w-p)+(1-beta)*y-a)/(beta+nu*(1-beta))-(beta*nuu)/((nu-1)*(beta+nu*(1-beta)));

p = lambda*( + z +
 @#for lag in lags
   +EXPECTATION(-@{lag})(z)*((1-lambda)^(@{lag}))
 @#endfor
);

// Recursive long real interest rate
R = i - (p(+1)-p) + R(+1);

// IS Curve
yinfn = y(100);
zoutput = yinfn - theta*R;

y = g + delta*( + zoutput +
 @#for lag in lags
   +EXPECTATION(-@{lag})(zoutput)*((1-delta)^(@{lag}))
 @#endfor
);

// Wage Curve
zwage = p + gamma*(w-p)/(gamma+psi) + l/(gamma+psi) + psi*(yinfn - theta*R)/(theta*(gamma+psi)) - psi*gam/((gamma+psi)*(gamma-1));

w = omega*( + zwage +
 @#for lag in lags
   +EXPECTATION(-@{lag})(zwage)*((1-omega)^(@{lag}))
 @#endfor
);

// definition of inflation
pi = p - p(-1);

// Taylor rule
//i = phi_y*(y-yclas) + phi_pi*pi - eps;

// Classical equilibrium
yclas = a + beta*psi/(1+psi)*(g+gam/(gamma-1)+nuu/(nu-1));

// other variables
deltaa    = a-a(-1);
x = y-yclas;


// shock processes
eps     = rho_eps*eps(-1)         + e_eps;
deltaa  = rho_deltaa *deltaa(-1)  + e_deltaa;
g       = rho_g      *g(-1)       + e_g;
nuu     = rho_nuu    *nuu(-1)     + e_nuu;
gam     = rho_gam    *gam(-1)     + e_gam;

end;

//check;
//steady;

shocks;
var e_deltaa;  stderr 0.660134106707378;
var e_g;       stderr 0.833976978078512;
var e_nuu;     stderr 10.5679076888563;
var e_gam;     stderr 12.3169555240614;
var e_eps; stderr 0.437308817102200;
end;



//stoch_simul(order=1,nomoments,noprint,nograph,irf=32);
//stoch_simul(order=1,noprint,nograph,irf=32) ;
