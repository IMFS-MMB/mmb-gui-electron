//**************************************************************************
// A New Comparative Approach to Macroeconomic Modeling and Policy Analysis
//
// Volker Wieland, Tobias Cwik, Gernot J. Mueller, Sebastian Schmidt and
// Maik Wolters
//
//**************************************************************************

//Model: US_CFP17exo

//Model replication code by: Alina T�nzer (alina.taenzer@hof.uni-frankfurt.de)

//Last edited: November 2017

//Reference:
//Charles T. Carlstrom, Timothy S. Fuerst, Matthias Paustian
//"Targeting Long rates in a Model with Segmented Markets"
//In: American Economic Journal (2017)
//**************************************************************************

var         rn mrs pinw mkw mk gy gi spread g_bonds infl ffr bb2 qnat r10s assets qi m lev muc c L w a r1 r2 rk pin y mp
            q f d b2 nw k i pk mc ann_pin r10 ann_r2 ann_r1 term_prem r10_nat muinv r_lend u_psi mucf cf r1f pinf pkf mf rkf
            qif r2f Lf wf yf kf if ff nwf term_premf r10f r10_natf qnatf qf b2f ygap levf r10obs PCE_inf y_growth i_growth labor_dist

//**********************************************************************
//Modelbase Variables                                                   //*
            interest inflation inflationq outputgap output;             //*
//**********************************************************************

varexo      eps_a eps_mp eps_i eps_psi eps_mk eps_mkw eps_b2 eps_rn

//**********************************************************************
//Modelbase Shocks                                                      //*
            interest_                                ;                  //*
//**********************************************************************

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
        std_r_ std_r_quart                                              //*
        //**************************************************************************
            alpha b beta delta eta gamma h kappa kappa_i psi_i psi_n zeta tau_p tau_y tau_pi tauy_long taupi_long tau_prem rho_m
            eps_p eps_w theta_p theta_w i_p i_w kappaw kappapc sigmamk sigmamkw sigmab2 sigmarn sigmaea sigmaeb sigmaeph sigmaer sigmaemu dur
            rhomkw rhomk rhod3 rhod4 rhoi rho_a rho1_b rho2_b rho_phi rho_mu rho_rn rhoi_long Y_ss I_ss C_ss R1ss R2ss b2ss dss nwss xss premss b2n;


load parameterfile;
            set_param_value('alpha',alpha);           set_param_value('b',b);                   set_param_value('beta',beta);
            set_param_value('delta',delta);           set_param_value('eta',eta);               set_param_value('gamma',gamma);
            set_param_value('h',h);                   set_param_value('kappa',kappa);           set_param_value('kappa_i',kappa_i);
            set_param_value('psi_i',psi_i);           set_param_value('psi_n',psi_n);           set_param_value('zeta',zeta);
            set_param_value('tau_p',tau_p);           set_param_value('tau_y',tau_y);           set_param_value('tau_pi',tau_pi);
            set_param_value('tau_prem',tau_prem);     set_param_value('tauy_long',tauy_long);   set_param_value('taupi_long',taupi_long);
               set_param_value('nwss',nwss);
            set_param_value('theta_p',theta_p);       set_param_value('theta_w',theta_w);       set_param_value('i_p',i_p);
            set_param_value('i_w',i_w);               set_param_value('kappaw',kappaw);         set_param_value('kappapc',kappapc);
            set_param_value('sigmaea',sigmaea);       set_param_value('sigmaeb',sigmaeb);       set_param_value('sigmaeph',sigmaeph);
            set_param_value('sigmaer',sigmaer);       set_param_value('sigmaemu',sigmaemu);     set_param_value('sigmarn',sigmarn);
            set_param_value('sigmamk',sigmamk);       set_param_value('sigmamkw',sigmamkw);     set_param_value('sigmab2',sigmab2);
            set_param_value('rhoi',rhoi);             set_param_value('rho_a',rho_a);           set_param_value('rho1_b',rho1_b);
            set_param_value('rho2_b',rho2_b);         set_param_value('rho_phi',rho_phi);       set_param_value('rho_mu',rho_mu); set_param_value('rho_m',rho_m);
            set_param_value('rho_rn',rho_rn);         set_param_value('rhomk',rhomk);
            set_param_value('rhomkw',rhomkw);         set_param_value('rhoi_long',rhoi_long);
            set_param_value('C_ss',C_ss);             set_param_value('I_ss',I_ss);             set_param_value('R1ss',R1ss);
            set_param_value('R2ss',R2ss);             set_param_value('Y_ss',Y_ss);             set_param_value('premss',premss);

// calibrate to 40% of bank assets held as securities:
            b2n = .4*gamma;       b2ss = b2n*nwss;
            fn  = gamma - b2n;    fss  = nwss*fn;
            xss = fss + b2ss;     dss  = (gamma-1)*nwss;


kappa_i = (duration_i-1)/(duration_i);

//**************************************************************************
// Specification of Modelbase Parameters                                 //*
                                                                         //*
// Load Modelbase Monetary Policy Parameters                             //*
thispath = pwd;
cd('..');
load policy_param.mat;
for i=1:33                                                      //change?
    deep_parameter_name = M_.param_names(i,:);
    eval(['M_.params(i)  = ' deep_parameter_name ' ;'])
end
cd(thispath);
                                                                         //*
// Definition of Discretionary Fiscal Policy Parameter                   //*
//coffispol = 1;                                                           //*
//**************************************************************************


model;

//**************************************************************************
// Definition of Modelbase Variables in Terms of Original Model Variables //*

interest   =   ann_r1*100;                                              //*
inflation =    (pin + pin(-1) + pin(-2) + pin(-3))*100;                                                //*
inflationq  =  400*pin; //(1/4)*infl*100;                                          //*
outputgap  =   ygap*100;                                                    //*
output =       y*100;                                                       //*                                                            //*
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
//**************************************************************************

%POLICY
b2 = -bb2;
b2f = b2;
%term_prem = 0;  %Endogenous policy vars
%term_premf = 0;

labor_dist = (y-L)-mrs;

% (32) Marginal Utility of Consumption:
muc  = (beta*h*c(+1) - (1+beta*h^2)*c+h*c(-1))/((1-h*beta)*(1-h)) + rn*(1-h*beta*rho_rn)/((1-h*beta));
mucf = (beta*h*cf(+1)-(1+beta*h^2)*cf+h*cf(-1))/((1-h*beta)*(1-h)) + rn*(1-h*beta*rho_rn)/((1-h*beta));


% (33) Labor Supply:

mrs = eta*L + rn - muc;
wf = eta*Lf + rn - mucf;


% (34) Fisher Equation:
r1 - pin(+1) + muc(+1) = muc;
r1f - pinf(+1) + mucf(+1) = mucf; //raus?

% (35) Euler Equation:
muc + pk + m = muc(+1) + (1-beta*(1-delta))*rk(+1) + beta*(1-delta)*(pk(+1)+m(+1));
mucf + pkf + mf = mucf(+1) + (1-beta*(1-delta))*rkf(+1) + beta*(1-delta)*(pkf(+1)+mf(+1));

% (36) Bond Issuance Equation:
muc + qi + m = muc(+1) + beta*kappa_i*(qi(+1)+m(+1))-pin(+1);
mucf + qif + mf = mucf(+1) + beta*kappa_i*(qif(+1) + mf(+1))-pinf(+1);

% (37) Link between f and investment:
(1-kappa_i)*(i+pk) = f - kappa_i*(f(-1)+qi-qi(-1)-pin);
(1-kappa_i)*(if+pkf) = ff - kappa_i*(ff(-1)+qif-qif(-1)-pinf);

% (39a) Return on the FI's Real Asset Portfolio:
r2 = kappa_i*qi(+1)/R2ss - qi;
r2f = kappa_i*qif(+1)/R2ss - qif;

% (39b) Return on the FI's Real Asset Portfolio:
r2 = kappa*q(+1)/R2ss - q;
r2f = kappa*qf(+1)/R2ss - qf;

% (40) Return on a 10-year Bond Available to FI:
r10 = -4*((R2ss-kappa)/(R2ss))*q;
r10f = -4*((R2ss-kappa)/(R2ss))*qf;

% (41) One Period Spread:
(r2-r1)*(gamma-1) = lev + (1+gamma*(premss-1))*u_psi;
(r2f-r1f)*(gamma-1) = levf + (1+gamma*(premss-1))*u_psi;

% (42) Net Worth Adjustment Cost:
psi_n*nw = (premss*gamma*(r2-r1)+(gamma*(premss-1))*lev) / (1+gamma*(premss-1));
psi_n*nwf = (premss*gamma*(r2f-r1f)+(gamma*(premss-1))*levf) / (1+gamma*(premss-1));

% (43) Hold-up Constaint:
lev = (b2ss/xss)*b2 + (1-b2ss/xss)*f - nw;
levf = (b2ss/xss)*b2f + (1-b2ss/xss)*ff - nwf;

(b2ss/nwss)*b2 + (gamma-b2ss/nwss)*f = nw + (gamma-1)*d;

% (43a) Total Assets:
assets = (b2ss/xss)*b2 + (1-b2ss/xss)*f;

% (44) Real Wage:
w = mc + y - L;
wf = yf - Lf;

% (45) Real Rental Rate:
rk = mc + y - k(-1);
rkf = yf - kf(-1);

% (46) Phillips Curves for Price and Wages:
pin*(1+beta*i_p) = i_p*pin(-1) + kappapc*mc + beta*pin(+1) - mk;
pinw - i_w*pin(-1) = kappaw*(mrs-w) + beta*(pinw(+1)-i_w*pin) - mkw;

% (47) Investment Supply Decision:
pk = psi_i*(i-i(-1)-beta*(i(+1)-i)) - muinv;
pkf = psi_i*(if-if(-1) - beta*(if(+1)-if)) - muinv;

% (48a) Accounting Identity:
(C_ss/Y_ss)*c + (I_ss/Y_ss)*i = y;
(C_ss/Y_ss)*cf + (I_ss/Y_ss)*if = yf;

% (48b) Output:
y = a + alpha*k(-1) + (1-alpha)*L;
yf = a + alpha*kf(-1) + (1-alpha)*Lf;

% (49) Capital Accumulation:
k = (1-delta)*k(-1) + delta*(i+muinv);
kf = (1-delta)*kf(-1) + delta*(if+muinv);

% (53) Price of EH Bond:
r1 = kappa*qnat(+1)/R1ss - qnat;
r1f = kappa*qnatf(+1)/R1ss - qnatf;

% (54) Yield of EH Bond:
r10_nat = -4*((R1ss-kappa)/(R1ss))*qnat;
r10_natf = -4*((R1ss-kappa)/(R1ss))*qnatf;

% (55) Term Premium:
term_prem = r10 - r10_nat;
term_premf = r10f - r10_natf;

% (C1) Output Gap:
ygap = y - yf;

% (C2) Annual Output Growth:
gy = 4*(y-y(-1));
gi = 4*(i-i(-1));

% (56) Relationship between Price and Wage Inflation:
w = w(-1) + pinw - pin;

% (C3) Annual Interest Rate Spread:
spread = ann_r2 - ann_r1;

% (A1) Productivity Shock:
a = rho_a*a(-1) + eps_a;

% (A2) Credit Shock (psi=PHI in nonlinear):
u_psi = rho_phi*u_psi(-1) + eps_psi;

% (A3) Investment Shock:
muinv = rho_mu*muinv(-1) + eps_i;

% (A4) Monetary Policy Residual:
mp = rho_m*mp(-1) + eps_mp;

% (A5)Natural rate Shock: scaled as in estimation code
rn = rho_rn*rn(-1) + eps_rn/(1-rho_rn);

% (A6) Wage Markup Shock:
mkw = rhomkw*mkw(-1) + eps_mkw;

% (A7) Price Markup Shock:
mk = rhomk*mk(-1) + eps_mk;

% (57) QE POLICY RULE:
bb2 = rho1_b*bb2(-1) + rho2_b*bb2(-2) + eps_b2;

% (58) MONETARY POLICY RULE:
%r1 = rhoi*r1(-1) + (1-rhoi)*(tau_pi*pin + tau_y*ygap + tau_prem*term_prem/4)+mp;
r1f  =rhoi*r1f(-1) + (1-rhoi)*(tau_pi*pinf + tau_prem*term_premf/4)+mp;


% (59) TERM PREMIUM POLICY RULE:
//term_prem = rhoi_long*term_prem(-1)+(1-rhoi_long)*(4*tauy_long*y+4*taupi_long*pin)+r10s;
r10s = 0;

% (C4) Define Annual Inflation and Rates:
ann_pin = 4*pin;    infl    = ann_pin;
ann_r1  = 4*r1;     ann_r2  = 4*r2;
r_lend  = ann_r2;

% (C5) Redefine Variables for IRF Graphs:
g_bonds  = b2;      ffr      = ann_r1;
r10obs   = r10;     PCE_inf  = ann_pin;
y_growth = gy;      i_growth = gi;

end;

initval;
    muc=0;      spread=0;     infl=0;     ffr=0;    qi=0;   lev=0;   y_growth=0;
    PCE_inf=0;  r10obs=0;     pin=0;      pinf=0;   i=0;    mkw=0;   i_growth=0;
    mk = 0;                   c=0;        L=0;      w=0;    a=0;
    u_psi=0;    muinv=0;      mp=0;       r10=0;    r1=0;   r2=0;    pin=0;
    y=0;        mp=0;         q=0;        f=0;      d=0;    b2=0;    nw=0;
    k=0;        i=0;          pk=0;       mc=0;     infl=0; ffr=0;   ann_pin=0;
    r10=0;
end;

%steady;
%check;

shocks;
    var eps_a   = sigmaea ^2;      var eps_i   = sigmaemu^2;
    var eps_psi = sigmaeph^2;      var eps_mp  = sigmaer ^2;
    var eps_mk  = sigmamk ^2;      var eps_mkw = sigmamkw^2;
    var eps_b2  = sigmab2 ^2;      var eps_rn  = sigmarn ^2;
end;

%stoch_simul(linear,  irf=20) pinf yf r10 ffr y i c labor_dist infl term_prem b2;



