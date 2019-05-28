//**************************************************************************
// A New Comparative Approach to Macroeconomic Modeling and Policy Analysis
//
// Volker Wieland, Tobias Cwik, Gernot J. Mueller, Sebastian Schmidt and
// Maik Wolters
//
// Working Paper, 2009
//**************************************************************************

// Model: US_RB07

// Further references:
// Pau Rabanal (2007). Does inflation increase after a monetary policy tightening?
// Answers based on an estimated DSGE model.
// Journal of Economic Dynamics & Control 31, p.906-937.

// Implemented by: Asim Farooq and Martina Jancokova
// Last edited: 13/04/11

// Note: There have been two typos in the original code confirmed by the author. Therefore, the
// impulse response functions from this model file do in general not match the impulse responses
// reported in the paper. The adjustments refer to the definition of two parameters.


var pi mc rk w r a u c n l k q i y g rkf wf rrf uf cf nf lf kf qf if yf epsg

//**************************************************************************
// Modelbase Variables                                                   //*
   interest inflation inflationq output outputgap fispol;                //*
//**************************************************************************

varexo epsp epsa

//**************************************************************************
// Modelbase Shocks                                                      //*
       interest_ fiscal_;                                                //*
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
gammab gammaf kappap omegap beta thetap alpha gamma thetaw vaphi phi omegaw kappaw sigma b eta delta rhor gammap
           gammay ISS GSS lambdaSS rhoa rhog sigmaa sigmag sigmaz sigmap;



omegap = 0.99;//price indexation
omegaw = 0.07;//wage indexation
gamma = 0.15;//degree of cost channel
phi = 99.03;//capital utilization variability (phi=0-->highly volatile rk)
sigma = 1.71;//elasticiy of substitution (consumption)
phi = 21;//elasticity of substitution (labor)
eta = 1;//elasticity of labor supply w.r.t. real wage
beta = 0.99;//discount factor
b = 0.83;//habit parameter
vaphi = 0.04;//investment adjustment cost parameter
rhor = 0.94;//interest rate smoothing
gammap = 1.34;//inflation reaction
gammay = 0.53;//output reaction
thetap = 0.83;//Calvo: probability of not being able to reset price
thetaw = 0.37;//wage Calvo
delta = 0.025;//depreciation rate
lambdaSS= 6;//steady state elasticity of substitution
GSS = 0.2;//steady state government spending output ratio
rhoa = 0.94;//technology persistence
rhog = 0.89;//government spending persistence
sigmaa=0.01*100;
sigmag=0.043*100;
sigmaz=0.0024*100;
sigmap=0.159*100;

gammab = omegap/(1+beta*omegap);
gammaf = beta/(1+beta*omegap);
kappap = (1-thetap*beta)*(1-thetap)/((1+beta*omegap)*thetap);
alpha = 0.36;//capital share of output
kappaw = (1-thetaw*beta)*(1-thetaw)/((1+phi*(eta-1))*thetaw);
ISS = delta*alpha*(lambdaSS)/((lambdaSS-1)*(1/beta-(1-delta)));//steady state investment output ratio

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
                                                                         //*
coffispol = 1/GSS;                                                       //*
//**************************************************************************


model(linear);

//**************************************************************************
// Definition of Modelbase Variables in Terms of Original Model Variables//*
                                                                         //*
interest   = r*4;                                                        //*
inflation  = pi+pi(-1)+pi(-2)+pi(-3);                                    //*
inflationq = pi*4;                                                       //*
outputgap  = y-yf;                                                       //*
output     = y;                                                          //*
fispol     = epsg;                                                      //*
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

//********************************************************************************
//Sticky Price-Wage Economy
//********************************************************************************
//Phillips Curve
pi=gammab*pi(-1)+gammaf*pi(+1)+kappap*mc+kappap*epsp;

//Marginal cost
mc = alpha*rk+(1-alpha)*(w+gamma*r)-a;

//capital utilizaiton
u = phi*rk;

//wage Phillips Curve
(1+beta)*w = w(-1)+beta*w(+1)+omegaw*pi(-1)-(1+beta*omegaw)*pi+
beta*pi(+1)-kappaw*(w-sigma/(1-b)*(c-b*c(-1))-eta*n);

//optimal capital-labor ratio
l-u-k(-1) = rk-(w+gamma*r);

//consumption euler eq.
(1+b)*c=b*c(-1)+c(+1)-(1-b)*1/sigma*(r-pi(+1));

//investment price (Tobin's Q)
q = beta*(1-delta)*q(+1)+(1-beta*(1-delta))*rk(+1)-(r-pi(+1));

//capital
k=(1-delta)*k(-1)+delta*i;

//investment
i=1/(1+beta)*(beta*i(+1)+i(-1)+vaphi*q);

//production
y=a+alpha*(u+k(-1))+(1-alpha)*n;

//monetary policy
//r= rhor*r(-1)+(1-rhor)*gammap*pi+(1-rhor)*gammay*y+epsz;

//resource constraint
y=(1-ISS-GSS)*c+ISS*i+GSS*g+alpha*(lambdaSS)/(lambdaSS-1)*u;

//technology shock
a = rhoa*a(-1)+epsa;

//government spending shock
g = rhog*g(-1)+epsg;

// Labor Supply equals Labor Demand
l=n;

//********************************************************************************
//flex price model
//********************************************************************************

//Marginal cost
0=alpha*rkf+(1-alpha)*wf-a;

//capital utilizaiton
uf = phi*rkf;

//wage Phillips Curve
wf=sigma/(1-b)*(cf-b*cf(-1))+eta*nf;

//optimal capital-labor ratio
lf-uf-kf(-1) = rkf-wf;

//consumption euler eq.
(1+b)*cf=b*cf(-1)+cf(+1)-(1-b)*1/sigma*rrf;

//investment price (Tobin's Q)
qf = beta*(1-delta)*qf(+1)+(1-beta*(1-delta))*rkf(+1)-rrf;

//capital
kf=(1-delta)*kf(-1)+delta*if;

//investment
if=1/(1+beta)*(beta*if(+1)+if(-1)+vaphi*qf);

//production
yf=a+alpha*(uf+kf(-1))+(1-alpha)*nf;



//resource constraint
yf=(1-ISS-GSS)*cf+ISS*if+GSS*g+alpha*(lambdaSS)/(lambdaSS-1)*uf;

// Labor Supply equals Labor Demand
lf=nf;

end;

shocks;
var epsa=sigmaa^2;
var fiscal_=sigmag^2;
var epsp=sigmap^2;
var interest_=0;
end;

