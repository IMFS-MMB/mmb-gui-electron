//**************************************************************************
// A New Comparative Approach to Macroeconomic Modeling and Policy Analysis
//
// Volker Wieland, Tobias Cwik, Gernot J. Mueller, Sebastian Schmidt and 
// Maik Wolters
//
// Working Paper, 2009
//**************************************************************************

//**************************************************************************
// An estimated DSGE model of energy, costs and inflation in the United Kingdom
//
// Stephen Millard, 2011
//
// BoE Working Paper No. 432
//**************************************************************************

// Model: UK_SM11

// Model replication coded by: Thilo Leitzbach and Hendrik Hegemann
//                            
// based on code by Stephen Millard
// Last edited: 11/05/2022

//**************************************************************************

var 
    c           // consumption
    lam         // lagrange multiplier
    pdot        // inflation
    w           // nominal wage
    cn          // consumption non-energy   
    cp          // consumption petrol
    ce          // consumption energy 
    cu          // consumption utilities
    pc          // relative price of consumption
    pu          // relative price of utilities
    pp          // relative price of petrol
    va          // value added
    h           // hours worked
    k           // capital
    pvc         //
    wk          //
    q           // Output
    b           // 
    e           // energy 
    vn          // vallue-added non-energy
    mn          //
    ip          //
    iu          //
    wdot        // wage inflation
    mu          //
    qu          // 
    ig          //
    vu          // value-added utilities
    qp          //
    io          //
    vp          // value-added petrol
    ppb         //
    rg          // nominal interest rate
    xo          // 
    xg          //
    s           // exchange rate
    bfc         //
    z           //
    pe          // relative price of energy
    xn          //
    pm          //
    pg          // relative price of gas
    pudot       // inflation utilities
    ppbdot      //
    ppdot       // inflation petrol
    po          // relative price oil
    pmfshock    //
    ashock      // productivity shock
    ishock      // monetary policy shock
    gshock      // domestic demand shock
    poshock     // oil price shock
    yfshock     //
    rfshock     //
    mushock     //
    pgshock     // gas price shock
    bshock      //
    cf         //
    lamf       //
    wf         //
    cnf        //
    cpf        //
    cef        //
    cuf        //
    pcf        //
    puf        //
    ppf        //
    vaf        //
    hf         //
    kf         //
    pvcf       //
    wkf        //
    qf         //
    bf         //
    ef         //
    vnf        //  
    mnf        //
    ipf        //
    iuf        //
    quf        //
    igf        //
    vuf        //
    qpf        //
    iof        //
    vpf        //
    ppbf       //
    rf         //
    xof        //
    xgf        //
    sf         //
    bff        //
    zf         //
    pef        //
    xnf        //
    pmf        //
    pgf        //
    pof        //
    pcdot       // inflation consumption
    pcdot4      // annualized inflation consumption
    pdot4       // annualized inflation
    ppdot4      // annualized inflation petrol
    pudot4      // annualized inflation utilities
    rga         //
    inv         // investment
    wdot4       //
    csharep     // consumption share petrol
    cshareu     // consumption share utilities
    csharen     // consumption share non-energy
    contpp      //
    contpu      //
    contpq      //
    nomw        //
    rcw         //
    et          //
    dfrgap      //
    pedot4      //
    encost4     //
    pmcost4     //
    wcost4      //
    profits     // profits
    pmdot4      //
    vagap       //
    qgap        // output gap
    invshock    // investment shock
    wshock      // wage shock

//**************************************************************************
// Modelbase Variables                                                   //*
       
interest inflation inflationq outputgap output fispol;         //*
//**************************************************************************

varexo eps_a eps_g eps_po eps_yf eps_pmf eps_rf eps_pg eps_mu eps_b
       eps_inv eps_w eps_i

//**************************************************************************
// Modelbase Shocks                                                      //*
        interest_ fiscal_;                                               //*
//**************************************************************************

// Parameters

parameters 

//**************************************************************************
// Modelbase Parameters
        cofintintb1 cofintintb2 cofintintb3 cofintintb4                  //*
        cofintinf0 cofintinfb1 cofintinfb2 cofintinfb3 cofintinfb4       //*
        cofintinff1 cofintinff2 cofintinff3 cofintinff4                  //*
        cofintout cofintoutb1 cofintoutb2 cofintoutb3 cofintoutb4        //*
        cofintoutf1 cofintoutf2 cofintoutf3 cofintoutf4                  //*
        cofintoutp cofintoutpb1 cofintoutpb2 cofintoutpb3 cofintoutpb4   //*
        cofintoutpf1 cofintoutpf2 cofintoutpf3 cofintoutpf4  
        std_r_ std_r_quart coffispol
//**************************************************************************

           beta delta chiz psie psip alphaq alphav alphab psin psiqp psiu
           psid sigmac psihab chibf chik epsilonk phiz sigmaw sigmah psiw
           epsilonw sigmae sigmap sigmav sigmaq epsilon chip epsilonu
           chiu epsilonpp chipp psix etax epsilonpm psipm thetarg
           thetapdot rhoa rhoi rhog rhomu cncratio cucratio xoioratio xgigratio
           vnvratio vuvratio cpqpratio cuquratio cnqratio kqratio cgqratio
           xnqratio mnqratio xoqratio xgqratio rhob psiwc thetay
           lshareq mshareq eshareq rhoinv rhow;




//Fixed parameters, taken from SM(2011), Tables A-H

beta   = 0.9925;
delta   = 0.013;
chiz    = 1/beta-1+delta;
psie    = 0.0526;
psip    = 0.5913;
alphaq  = 0.0528;
alphav  = 0.1701; 
alphab  = 0.3154;
psin    = 0.3096;
psiqp   = 0.1844;
psiu    = 0.4834;
psid    = 0.617;
chibf   = 0.001;
sigmaw  = 3.8906;
sigmae  = 0.4;
sigmap  = 0.1;
sigmav  = 0.5;
sigmaq  = 0.15;
etax    = 1.5;

//Estimated parameters, taken from SM(2011), Tables A-H

psiwc = 0.4974;
sigmac = 0.6256;
psihab = 0.5876;
chik = 116.52;
epsilonk = 0.1871;
phiz = 0.4591;
sigmah = 0.3423;
psiw = 0.4719;
epsilonw = 0.1882;
epsilon = 0.1491;
chip = 0.8968;
chiu = 0.5760;
chipp = 0.2371;
epsilonu = 0.2073;
epsilonpp = 0.4622;
psix = 0.4152;
epsilonpm = 0.8296;
psipm = 0.4169;
thetarg = 0.7640;
thetapdot = 1.1951;
thetay = 0.1494;
rhoa = 0.8747;
rhob = 0.6656;
rhoi = 0.3174;
rhog = 0.6621;
rhomu = 0.2398;
rhow = 0.2247;
rhoinv = 0.4323;

//  Steady-state shares and ratios
 
cncratio = 0.9474;
cucratio = 0.0215;
vnvratio = 0.9815;
vuvratio = 0.0145;
cpqpratio =0.4204;
cuquratio = 0.4054;
xoioratio = 0.4551;
xgigratio =-0.0792;
cnqratio = 0.5802;
kqratio = 4.7202;
cgqratio = 0.1032;
xnqratio = 0.2552;
mnqratio = 0.2581;
xoqratio = 0.0035;
xgqratio = -0.0007;
lshareq = 0.4648;
mshareq = 0.2581;
eshareq = 0.0456;

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
coffispol = 1/cgqratio;                                                           //*

//**************************************************************************

model (linear);

//**************************************************************************
// Definition of Modelbase Variables in Terms of Original Model Variables//*
                                                                         //*
interest     = rg*4;                                                     //*
inflation    = pcdot4;                                                   //*
inflationq   = pcdot*4;                                                  //*
outputgap    = vagap;                                                    //* 
output       = va;                                                       //*
fispol       = et;                                                       //*
//**************************************************************************

//**************************************************************************
// Policy Rule                                                           //*
                                                                         //*
// Monetary Policy                                                       //*
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
           + std_r_ *interest_;     

                                                                         //*
// Discretionary Government Spending                                     //*
                                                                         //*
fispol = coffispol*fiscal_;                                              //*
//**************************************************************************

// Sticky-Price Economy

// IS curve

lam = psihab*(1/sigmac-1)*c(-1)-c/sigmac-pc;
lam = rg+lam(1)-pdot(1)+bshock;

// Real UIP

s = s(1)-lam(1)+lam+chibf*bf-rfshock;

// Investment and capital utilisation

lam = lam(1)+(chik*(k(1)-(1+epsilonk)*k+epsilonk*k(-1))+chiz*wk(1))/(1-delta+chiz)-chik*(k-(1+epsilonk)*k(-1)+epsilonk*k(-2))+invshock;
wk = phiz*z;                     // eq (3)

// Wage setting

wdot = psiw*(1-beta*(1-psiw))*(h/sigmah-lam-w)/((1+sigmaw/sigmah)*(1-psiw)*(1+epsilonw*beta))+epsilonw*wdot(-1)/(1+epsilonw*beta)+beta*wdot(1)/(1+epsilonw*beta)+wshock;
w = wdot + w(-1) - pdot;         // eq (11)

// Relative consumption and relative prices

cn = (c-psie*ce)/(1-psie);  // eq (5) reordered for cn
ce = (1-psip)*cu+psip*cp;   // eq (4)
cu = sigmap*(cn/sigmae-pu-(1/sigmae-1/sigmap)*ce);
cp = cu + sigmap*(pu-pp);
pc = cncratio*cn + cucratio*(pu+cu) + (1-cncratio-cucratio)*(pp+cp) - c;
pe = psin*pp + (1-psin)*pu;

// Production functions

va = (1-alphav)*h+alphav*(z+k(-1));		// eq (19)
q = (1-alphaq)*b+alphaq*e+ashock;		// eq (12)
b = (1-alphab)*vn+alphab*mn;			// eq (13)

// Factor demands

qu = vu;
qp = vp;
ig = qu;
io = qp;
ip = e;
iu = e;
h = va + sigmav*(pvc-w-psiwc*(rg+bshock));
z = va - k(-1) + sigmav*(pvc-wk);
pvc = mu+(1-1/sigmaq)*ashock+q/sigmaq+(1-1/sigmaq)*b-vn;
mn = mu+(1-1/sigmaq)*ashock+q/sigmaq+(1-1/sigmaq)*b-pm;
pe = mu+(1-1/sigmaq)*ashock+q/sigmaq-e/sigmaq;

// New Keynesian Phillips Curves

pdot = epsilon*pdot(-1)/(1+beta*epsilon)+beta*pdot(1)/(1+beta*epsilon)+(1-chip)*(1-beta*chip)*mu/(chip*(1+beta*epsilon))+mushock;                                       // eq (18)
pudot = epsilonu*pudot(-1)/(1+beta*epsilonu)+beta*pudot(1)/(1+beta*epsilonu)+(1-chiu)*(1-beta*chiu)*(psiu*pvc+(1-psiu)*pg-pu)/(chiu*(1+beta*epsilonu));                 // eq (27)
pudot = pu-pu(-1)+pdot;
ppbdot = epsilonpp*ppbdot(-1)/(1+beta*epsilonpp)+beta*ppbdot(1)/(1+beta*epsilonpp)+(1-chipp)*(1-beta*chipp)*(psiqp*pvc+(1-psiqp)*po-ppb)/(chipp*(1+beta*epsilonpp));    // eq (25)
ppbdot = ppb-ppb(-1)+pdot;

// Taylor rule

// rg = thetarg*rg(-1) + (1-thetarg)*(thetapdot*(pc+pdot-pc(-1))+thetay*(va-vaf)) + ishock;	// eq (30)

// Taxes and duties

pp = (1-psid)*ppb;				// eq (31)
ppdot = (1-psid)*ppbdot;

// Rest of the world

xn = psix*xn(-1)+(1-psix)*(yfshock-etax*s);		// eq (35)
po = poshock - s;                               // eq (32)
pg = pgshock - s;                               // eq (33)
pdot = pm(-1)-pm+beta*(pm(1)+pdot(1)-pm)/(1+beta*epsilonpm)+epsilonpm*(pm(-1)+pdot(-1)-pm(-2))/(1+beta*epsilonpm)+(1-beta*(1-psipm))*psipm*(pmfshock-s-pm)/((1+beta*epsilonpm)*(1-psipm));

//  Market clearing

va = vnvratio*vn + vuvratio*vu + (1-vnvratio-vuvratio)*vp;                          // eq (37)
q = cnqratio*cn+kqratio*(k-(1-delta)*k(-1)+chiz*z)+xnqratio*xn+cgqratio*gshock;		// eq (42)
qp = cpqpratio*cp+(1-cpqpratio)*ip;							// eq (38)
qu = cuquratio*cu+(1-cuquratio)*iu;							// eq (39)	
io = -xoioratio*xo;                         				// eq (40)
ig = -xgigratio*xg;                                 		// eq (41)
bfc = bfc(-1)/beta + xnqratio*xn - mnqratio*(pm+mn) + xgqratio*(pg+xg) + xoqratio*(po+xo);// eq (43)

// Productivity shocks
ashock = rhoa*ashock(-1) + eps_a;               // eq (44)
invshock = rhoinv*invshock(-1) + eps_inv;       // eq (49)

// Monetary policy shock
ishock = rhoi*ishock(-1) + eps_i;               // eq (47)

// Demand shocks
bshock = rhob*bshock(-1) + eps_b;               // eq (45)
gshock = rhog*gshock(-1) + et + eps_g;               // eq (46)

// Mark-up shocks
mushock = rhomu*mushock(-1) + eps_mu;           // eq (48)
wshock = rhow*wshock(-1) + eps_w;               // eq (50)

// World shocks
yfshock = 0.9061*yfshock(-1) + eps_yf;          // eq (51) and (56)
pmfshock = 0.8991*pmfshock(-1) + eps_pmf;       // eq (52) and (57)
poshock = 0.7283*poshock(-1) + eps_po;          // eq (58)
pgshock = 0.5940*pgshock(-1) + eps_pg;          // eq (59)
// poshock = 0.9999*poshock(-1) + eps_po;          // eq (53)
// pgshock = 0.9999*pgshock(-1) + eps_pg;          // eq (54)
rfshock = 0.8738*rfshock(-1) + eps_rf;          // eq (55) and eq (60)

// Flex-Price Economy

// IS curve

lamf = psihab*(1/sigmac-1)*cf(-1)-cf/sigmac-pcf;
lamf = rf+lamf(1)+bshock;

// Real UIP

sf = sf(1)-lamf(1)+lamf+chibf*bff-rfshock;

// Investment and capital utilisation

lamf = lamf(1)+(chik*(kf(1)-(1+epsilonk)*kf+epsilonk*kf(-1))+chiz*wkf(1))/(1-delta+chiz)-chik*(kf-(1+epsilonk)*kf(-1)+epsilonk*kf(-2))+invshock;
wkf = phiz*zf;

// Labour supply

wf = hf/sigmah-lamf;

// Relative consumption and relative prices

cnf = (cf-psie*cef)/(1-psie);
cef = (1-psip)*cuf+psip*cpf;
cuf = sigmap*(cnf/sigmae-puf-(1/sigmae-1/sigmap)*cef);
cpf = cuf + sigmap*(puf-ppf);
pcf = cncratio*cnf + cucratio*(puf+cuf) + (1-cncratio-cucratio)*(ppf+cpf) - cf;
pef = psin*ppf + (1-psin)*puf;

// Production functions

vaf = (1-alphav)*hf+alphav*(zf+kf(-1));
qf = (1-alphaq)*bf+alphaq*ef+ashock;
bf = (1-alphab)*vnf+alphab*mnf;

// Factor demands

quf = vuf;
qpf = vpf;
igf = quf;
iof = qpf;
ipf = ef;
iuf = ef;
hf = vaf + sigmav*(pvcf-wf-psiwc*(rf+bshock));
zf = vaf - kf(-1) + sigmav*(pvcf-wkf);
pvcf = (1-1/sigmaq)*ashock+qf/sigmaq+(1-1/sigmaq)*bf-vnf;
mnf = (1-1/sigmaq)*ashock+qf/sigmaq+(1-1/sigmaq)*bf-pmf;
pef = (1-1/sigmaq)*ashock+qf/sigmaq-ef/sigmaq;

// Supply curves for petrol and utilities

puf = psiu*pvcf+(1-psiu)*pgf;
ppbf = psiqp*pvcf+(1-psiqp)*pof;

// Petrol duty

ppf = (1-psid)*ppbf;

// Rest of the world

xnf = psix*xnf(-1)+(1-psix)*(yfshock-etax*sf);
pof = poshock - sf;
pgf = pgshock - sf;
pmf = pmfshock-sf;

//  Market clearing

vaf = vnvratio*vnf + vuvratio*vuf + (1-vnvratio-vuvratio)*vpf;
qf = cnqratio*cnf+kqratio*(kf-(1-delta)*kf(-1)+chiz*zf)+xnqratio*xnf+cgqratio*gshock;
qpf = cpqpratio*cpf+(1-cpqpratio)*ipf;
quf = cuquratio*cuf+(1-cuquratio)*iuf;
iof = -xoioratio*xof;
igf = -xgigratio*xgf;
bff = bff(-1)/beta + xnqratio*xnf - mnqratio*(pmf+mnf) + xgqratio*(pgf+xgf) + xoqratio*(pof+xof);

// Definitions
pcdot = pc - pc(-1) + pdot;
pcdot4 = pcdot + pcdot(-1) + pcdot(-2) + pcdot(-3);
ppdot4 = ppdot + ppdot(-1) + ppdot(-2) + ppdot(-3);
pudot4 = pudot + pudot(-1) + pudot(-2) + pudot(-3);
pdot4 = pdot + pdot(-1) + pdot(-2) + pdot(-3);
pedot4 = pe - pe(-4) + pdot4;
pmdot4 = pm - pm(-4) + pdot4;
rga = 400*rg;
inv = (k-(1-delta)*k(-1)+chiz*z)/delta;
wdot4 = wdot + wdot(-1) + wdot(-2) + wdot(-3);
csharep = pp+cp-pc-c;
cshareu = pu+cu-pc-c;
csharen = cn-pc-c;
contpp = (1-cncratio-cucratio)*ppdot4;
contpu = cucratio*pudot4;
contpq = cncratio*pdot4;
nomw = nomw(-1) + wdot;
rcw = w - pc;
dfrgap = (1-alphav)*h;
encost4 = eshareq*pedot4;
pmcost4 = mshareq*pmdot4;
wcost4 = lshareq*wdot4;
profits = pdot4 - encost4 - pmcost4 - wcost4;
vagap = va-vaf;
qgap = q-qf;

end;

// Shock variances

shocks;

//  Estimated Table D: 

var eps_a = 0.0123^2;
var eps_b = 0.0041^2;
var eps_i = 0.0015^2;
var eps_g = 0.0923^2;
var eps_mu = 0.0028^2;
var eps_inv = 0.0612^2;
var eps_w = 0.0098^2;
var eps_yf = 0.0142^2;
var eps_pmf = 0.0075^2;
var eps_po = 0.141^2;
var eps_pg = 0.2544^2;
var eps_rf = 0.0012^2;
var interest_=1;
var fiscal_=1;
end;

//stoch_simul(irf=21) pcdot4 contpp contpu contpq h inv pdot4 encost4 pmcost4 wcost4 profits rcw nomw rga s cn dfrgap va c wdot4 vaf q;
//stoch_simul(irf=21) inflation output outputgap interest;