//**************************************************************************
// A New Comparative Approach to Macroeconomic Modeling and Policy Analysis
//
// Volker Wieland, Tobias Cwik, Gernot J. Mueller, Sebastian Schmidt and
// Maik Wolters
//
// Working Paper, 2009
//**************************************************************************

// Model: EA_SW03

// Further references:
// Smets, F., and R. Wouters. 2003. "An Estimated Stochastic Dynamic General Equilibrium Model of the Euro Area."
// Journal of the European Economic Association 1(5), pp. 1123-1175.

// Last edited: 10/09/07 by S. Schmidt


var mcf zcapf rkf kf pkf muf cf invef yf labf pinff wf pf emplf rrf effortf
    rf mc zcap rk k pk mu c inve y lab pinf w p empl ww effort pinf4 r dr
    pinfLAG1 pinfLAG2 ygap a as b g ls qs ps ms scons sinv sy slab spinf sw
    kpf habf kp hab one eg

//**************************************************************************
// Modelbase Variables                                                   //*
        interest inflation inflationq outputgap output fispol;           //*
//**************************************************************************


varexo ea eb els eqs eps eas econs einv ey elab epinf ew em // y_ er

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
                                                                         //*
//**************************************************************************
           calfa ctou cbeta chab ccs cinvs crelwage chabw clabeff chlab csadjcost
           csigma chabb cprobw clandaw csigl cprobp cindw cindp cfc cinvdyn
           czcap csadjlab crpi crdpi crr cry crdy crhoa crhoas crhob crhog
           crhols crhoqs crhops crhoms crhoy crhocons crhoinv crhopinf crhow
           crholab cscaleea cscaleeas cscaleeb cscaleeg cscaleels cscaleeqs
           cscaleeps cscaleem cscaleecons cscaleeinv cscaleey cscaleelab
           cscaleepinf cscaleew cscaleer;



calfa       = 0.3;
ctou        = 0.025;
cbeta       = 0.99;
chab        = 0;
ccs         = 0.6;
cinvs       = 0.22;
crelwage    = 0;
chabw       = 0;
clabeff     = 0;
chlab       = 0;

csadjcost   = 6.7711;
csigma      = 1.3533;
chabb       = 0.5732;
cprobw      = 0.7367;
clandaw     = 1.5;
csigl       = 2.3995;
cprobp      = 0.9082;
cindw       = 0.7627;
cindp       = 0.4694;
cfc         = 1.4077;
cinvdyn     = 1;
czcap       = 0.1690;
csadjlab    = 0.5990;

// reaction function
crpi        = 1.6841;
crdpi       = 0.1398;
crr         = 0.9613;
cry         = 0.0988;
crdy        = 0.1586;

// AR(1) shocks
crhoa       = 0.8232;
crhoas      = 0.9238;
crhob       = 0.8545;
crhog       = 0.9493;
crhols      = 0.8894;
crhoqs      = 0.9273;
crhops      = 0;
crhoms      = 0;
crhoy       = 0;
crhocons    = 0;
crhoinv     = 0;
crhopinf    = 0;
crhow       = 0;
crholab     = 0;

// scaling factor of the innovations
cscaleea    = 0.5978;
cscaleeas   = 0.0165;
cscaleeb    = 0.3361;
cscaleeg    = 0.3247;
cscaleels   = 3.5197;
cscaleeqs   = 0.0851;
cscaleeps   = 0;
cscaleem    = 0.0808;
cscaleecons = 0;
cscaleeinv  = 0.6043;
cscaleey    = 0;
cscaleelab  = 0;
cscaleepinf = 0.1602;
cscaleew    = 0.2892;
cscaleer     = 0.081;

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
coffispol = 1/cscaleeg;                                                  //*
//**************************************************************************

model(linear);

//**************************************************************************
// Definition of Modelbase Variables in Terms of Original Model Variables //*

interest   = r*4;                                                        //*
inflation  = pinf4;                                                      //*
inflationq = pinf*4;                                                     //*
outputgap  = ygap;                                                       //*
output     = y;                                                          //*
fispol     = eg;                                                         //*
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

// Original monetary policy rule (Smets and Wouters, 2003)
// r = crr*r(-1) + (1-crr)*(crpi*pinf+cry*ygap)+crdpi*(pinf-pinf(-1))+crdy*(ygap-ygap(-1))+cscaleer*er;

mcf      =   calfa*rkf + (1-calfa)*wf - a;
zcapf    =   (1/czcap)*rkf;
rkf      =   wf + labf - kf;
kf       =   kpf(-1) + zcapf;
invef    =   (1/(1+cinvdyn*cbeta))*((cinvdyn*invef(-1) + cbeta*invef(+1)) + (1/csadjcost)*pkf) + 0*sinv;
pkf      = - muf - 1*b + muf(+1) + (1-cbeta*(1-ctou))*rkf(+1) + 0*(1-cbeta*(1-ctou))*zcapf(+1) + cbeta*(1-ctou)*pkf(+1) + qs;
muf      =   muf(+1) + rf - pinff(+1) - b;
muf      = - csigma*((1-chab)/(1-chab-chabb))*cf + csigma*(chabb/(1-chab-chabb))*habf;
yf       =   ccs*cf + cinvs*invef + g;
yf       =   cfc*(calfa*kf + (1-calfa)*labf + a);
mcf      = - 0*ps - 0*(1+cbeta*cindp)*(1/((1-cprobp)*(1-cbeta*cprobp)/(cprobp)))*spinf;
wf       = - 1*muf - 1*ls + csigl*labf;
pf       =   0*pf(-1) + pinff;
emplf    =   emplf(-1) + 1*emplf(+1)- 1*emplf + ((1-csadjlab)*(1-csadjlab)/csadjlab)*effortf;
rrf      =   rf - pinff(+1);
effortf  =   labf - emplf;
pinff    =   0;
mc       =   calfa*rk+(1-calfa)*w - a - slab;
zcap     =   (1/czcap)*rk - 0*(1/czcap)*pk;
rk       =   w + lab - k;
k        =   kp(-1) + zcap;
inve     =   (1/(1+cinvdyn*cbeta))*((cinvdyn*inve(-1) + cbeta*inve(+1)) + (1/csadjcost)*pk) + 1*sinv;
pk       = - mu - 1*b - 0*(1-crhols)*ls - 0*scons+mu(+1) + 0*b(+1) + (1-cbeta*(1-ctou))*rk(+1) + 0*(1-cbeta*(1-ctou))*zcap(+1)
             + cbeta*(1-ctou)*pk(+1) + qs + 0*sinv;
mu       =   mu(+1) + r - pinf(+1) - b + 0*b(+1) - scons - 0*(1-crhols)*ls;
mu       = - csigma*((1-chab)/(1-chab-chabb))*c + csigma*(chabb/(1-chab-chabb))*hab;
y        =   ccs*c + cinvs*inve + g + sy;
y        =   cfc*(calfa*k + (1-calfa)*lab + a + slab);
pinf     =   0*as + (1/(1+cbeta*cindp))*((cbeta)*(pinf(+1) - 0*as(+1)) + (cindp)*(pinf(-1) - 0*as(-1))
             + ((1-cprobp)*(1-cbeta*cprobp)/(cprobp))*(mc+ps) + 0*0.1*ps)+ spinf;
w        =   ((1/(((1+cbeta)*cprobw*((clandaw/(1-clandaw))*csigl-1+crelwage)/(1-cprobw))+crelwage+crelwage*cprobw*cbeta*(chabw-1))))
             *(((cprobw*((clandaw/(1-clandaw))*csigl-1+crelwage))/(1-cprobw)+crelwage+crelwage*(chabw-1))*w(-1)
             + (cbeta)*((cprobw*((clandaw/(1-clandaw))*csigl-1+crelwage))/(1-cprobw))*w(+1)
             + (cindw)*(cprobw/(1-cprobw))*((clandaw/(1-clandaw))*csigl-1+crelwage)*(pinf(-1)-0*as(-1))
             - (cindw*cbeta*cprobw*(cprobw/(1-cprobw))*((clandaw/(1-clandaw))*csigl-1+crelwage)
             + (cprobw/(1-cprobw))*((clandaw/(1-clandaw))*csigl-1+crelwage)
             + cprobw*cbeta*cindw*((clandaw/(1-clandaw))*csigl-1))*(pinf - 0*as)
             + (cbeta*cprobw)*(((cprobw/(1-cprobw))*((clandaw/(1-clandaw))*csigl-1+crelwage))
             + ((clandaw/(1-clandaw))*csigl-1))*(pinf(+1) - 0*as(+1))
             + (1-cbeta*cprobw)*(w + 1*mu + 1*ls - clabeff*effort - csigl*(1/(1-chlab))*lab + csigl*(chlab/(1-chlab))*lab(-1)))
             + 0*(1/(1+cbeta))*1*ls + 1*sw;
p        =   0*p(-1) + pinf;
empl     =   empl(-1) + 1*empl(+1) - 1*empl - 0*r + 0*pinf(+1) + 0*csadjlab*effort + ((1-csadjlab)*(1-csadjlab)/csadjlab)*effort
             + 0.0*(a(-1) + cbeta*a(+1) - (1+cbeta)*a);
ww       =   w + 0*(lab - empl);
effort   =   lab - empl;
dr       =   r - r(-1);
pinfLAG1 =   pinf(-1);
pinfLAG2 =   pinfLAG1(-1);
pinf4    =   pinf + pinfLAG1 + pinfLAG2 + pinfLAG2(-1);
ygap     =   y - yf;
a        =   crhoa*a(-1) + cscaleea*ea;
as       =   crhoas*as(-1) + cscaleeas*eas;
b        =   crhob*b(-1) + cscaleeb*eb;
g        =   crhog*g(-1) + cscaleeg*eg;
ls       =   crhols*ls(-1) + cscaleels*els;
qs       =   crhoqs*qs(-1) + cscaleeqs*eqs;
ps       =   crhops*ps(-1) + cscaleeps*eps;
ms       =   crhoms*ms(-1) + cscaleem*em; //Monetary policy innovation
scons    =   crhocons*scons(-1) + cscaleecons*econs;
sinv     =   crhoinv*sinv(-1) + cscaleeinv*einv;
sy       =   crhoy*sy(-1) + cscaleey*ey;
slab     =   crholab*slab(-1) + cscaleelab*elab;
spinf    =   crhopinf*spinf(-1) + cscaleepinf*epinf;
sw       =   crhow*sw(-1) + cscaleew*ew;
kpf      =   (1-ctou)*kpf(-1) + ctou*invef(-1);
habf     =   chab*habf(-1) + (1-chab)*cf(-1);
kp       =   (1-ctou)*kp(-1) + ctou*inve(-1);
hab      =   chab*hab(-1) + (1-chab)*c(-1);
one      =   0*one(-1);
end;


shocks;
var ea       = 1;
var eas      = 1;
var eb       = 1;
var fiscal_  = cscaleeg^2; //1;
var els      = 1;
var eqs      = 1;
var em       = 1;
var econs    = 1;
var einv     = 1;
var ey       = 1;
var elab     = 1;
var epinf    = 1;
var ew       = 1;
//var er       = 1;
end;


//stoch_simul (irf = 0, ar=100, noprint);
