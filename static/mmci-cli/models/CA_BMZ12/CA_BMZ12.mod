// Title: Macroprudential Rules and Monetary Policy when Financial Frictions Matter
// Authors: Jeannine Bailliu, Cesaire Meh and Yahong Zhang
// Publication: Bank of Canada Working Paper 2012-6

//This is the program for simulation for BMZ, July 07, 2010
//values based on results from estimation_bmz
//data for estimation under Dynare 3 is corporate yield data from 97:1 to 09:3
//Yahong Zhang, June 29, 2010
//This mod file is adjusted to be simulated under Dynare 4 and
//implemented in the Macromodel Base by Leonhard Czerny and Sungtaek Kwon.
//The baseline policy regime is 'standard Taylor rule plus macroprudential policy rule 
//which reacts to credit growth rate with rhotau  = 0.5'.


// Last edited by Jinhyuk Yoo in 05.09.2014

close all
// global Gamma_y

%----------------------------------------------------------------
% 1. Preamble Defining variables and parameters
%----------------------------------------------------------------

var  
auxt, bigXt, bigZt, ct, eqti, ht, it, kt, lambdat, llt, mct, nt, pit, pref, pstart, qt, 
rkt, rnt, st, xt, yt, zt, auxtfp, ctfp, htfp, itfp, ktfp, lambdatfp, 
lltfp, mctfp, qtfp, rktfp, rntfp, ytfp, ygap, lnyt, 
lnit, lnygap, ft, taut, bt, cgn, cg, mpl, kl, mpk, rw, mcl, 
mck, mcb, mcc, mcd, mce, htb, qgap, expi, lev, kc, ce, ste,efc,
uu, vf, 
// pitfp, pstartfp, et, 
//**************************************************************************
// Modelbase Variables                                                   //*
        interest inflation inflationq outputgap output;                  //*
//**************************************************************************


// Define 4 exogenous shocks (technology, monetary, investment, preference)
varexo epszt,  epsxt, epspt, epsft  //epset,
//**************************************************************************
// Modelbase Shocks                                                      //*       
       interest_;                                                        //*
//**************************************************************************


// Define 14 structural parameters and STEADY STATE values
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
        std_r_ std_r_quart                                               //*
                                                                         //*
//**************************************************************************
b, a, chi, d,  g, te, veps, xi, nu, tau, r_p, r_r, r_y, rho_z, rho_e, rho_x, mub, tau1, rho_p, 
aux_ss, pi_ss, q_ss, z_ss, e_ss, mc_ss, rn_ss, rk_ss, s_ss, ik_ss, eqti_ss, 
yk_ss, ck_ss, yc_ss, h_ss, k_ss, n_ss, c_ss, i_ss, y_ss, 
lambda_ss, bigX_ss, bigZ_ss, pstar_ss, x_ss, p_ss, ll_ss ,
qfp_ss,  sfp_ss,  rkfp_ss,
ykfp_ss, ckfp_ss, ycfp_ss, hfp_ss, kfp_ss, nfp_ss, cfp_ss, ifp_ss, 
yfp_ss,  lambdafp_ss, pstarfp_ss, llfp_ss,  ygap_ss, eta, 
nkratio, lny_ss, lni_ss, lnygap_ss, r_q, f_ss, rho_f,
r_c, rhotau, taut_ss, bt_ss, cgn_ss, cg_ss, r_s, hbar, mpl_ss, kl_ss,
mpk_ss, rw_ss, mcl_ss, mck_ss, mcb_ss, mcc_ss, mcd_ss, mce_ss, htb_ss, expi_ss, lev_ss, kc_ss, ce_ss,
ste_ss, efc_ss
lnyt_ss lnit_ss qgap_ss; 
  
// Set parameter and SS values

//////policy experiment parameters
r_q   = 0;//0.1;//asset prices
r_s   = 0;//risk premium
r_c   = 0.5;//credit growth

rhotau  = 0.5;//macroprudential
hbar   = 0;
rho_f = 0.7980;//mode//risk premium shock

/////other parameters

b     = 0.99;
a     = 2/3;

// parameter for the ad-hoc cost of external funds
//ela of ext finance cost

chi   = 0.0594;//mode;
nkratio = 0.6;
d     = 0.025;
eta  = 0.9728;
g     = 1;
te    = 5.75;//1;//0.195;
veps  =6;
xi   =0.2603;

tau   = 0; //tau   = 0.9179; 
tau1 = 0; //tau1 =19.6422;
nu = 0.4824;
r_p   = 1.7062;//1.01;//1.3;//1.3009;//3;  // mode
r_y   = 0.0776;//0.015;//0;//0.015; // mode
r_r   = 0.7145;//0.8;//0.99;//0.8;//0.95; // mode

rho_z = 0.8342;
rho_e = 0.0;
rho_x = 0.8810;
rho_p = 0.9546;

mub   = 1.005;

// Compute SS

pi_ss     = mub;
z_ss      = 1;
e_ss      = 1;
x_ss      = 1;
p_ss      = 1;
f_ss      = 1;
expi_ss   = pi_ss;

pstar_ss  = ((1-nu*pi_ss^(veps-1))/(1-nu))^(1/(1-veps));
ll_ss     = pstar_ss^(-veps)*(1-nu)/(1-nu*mub^veps);
mc_ss     = ((veps-1)/veps)*pstar_ss*((1-nu*b*pi_ss^veps)/(1-nu*b*pi_ss^(veps-1)));
rn_ss     = pi_ss/b;
rk_ss     = 1/eta;
aux_ss    = rn_ss/pi_ss;
s_ss      = rk_ss/(rn_ss/pi_ss);
ik_ss     = d;                       
yk_ss     = (1/((1-a)*mc_ss))*(rk_ss-(1-d))/ll_ss;
ck_ss     = yk_ss-ik_ss;
yc_ss     = yk_ss/ck_ss;
h_ss      = ((a/te)*(yc_ss*ll_ss*mc_ss))^(1/(1+g));
k_ss      = (h_ss)/((yk_ss*ll_ss)^(1/a));
c_ss      = ck_ss*k_ss;
i_ss      = ik_ss*k_ss;
y_ss      = yk_ss*k_ss;
n_ss      = k_ss*nkratio;
lambda_ss = 1/c_ss;
bigX_ss   = mc_ss*y_ss/(1-nu*b*pi_ss^veps);
bigZ_ss   = y_ss/(1-nu*b*pi_ss^(veps-1));
q_ss      = 1;
lny_ss    = 0;
lni_ss    = 0;
eqti_ss   = (tau/2)*i_ss;
ste_ss    = s_ss;
efc_ss    = s_ss*rn_ss/pi_ss;

bt_ss     = k_ss*q_ss-n_ss;
taut_ss   = pi_ss^rhotau;
cgn_ss    = pi_ss;
cg_ss     = 1;
mpl_ss    = a*y_ss*ll_ss/h_ss;
kl_ss     = k_ss/h_ss;
mpk_ss    = (1-a)*y_ss*ll_ss/k_ss;
rw_ss     = te*h_ss^g*c_ss;
mcl_ss    = rw_ss/mpl_ss;
mck_ss    = rk_ss/mpk_ss;
mcb_ss    = mcl_ss+mck_ss;
mcc_ss    = (rw_ss/a)*(rk_ss*a/(rw_ss*(1-a)))^(1-a);
mcd_ss    = rw_ss/mpl_ss;
mce_ss       = (rk_ss*q_ss-(1-d)*q_ss)/((1-a)*y_ss*ll_ss/k_ss);
htb_ss    = h_ss;
lev_ss    = q_ss*k_ss/n_ss;
ce_ss     = (1-eta)*n_ss;

pstarfp_ss  = 1;
llfp_ss     = 1;
rkfp_ss     = rk_ss;
sfp_ss      = s_ss;              
ykfp_ss     = (1/((1-a)*mc_ss))*(rkfp_ss-(1-d))/llfp_ss;
ckfp_ss     = ykfp_ss-ik_ss;
ycfp_ss     = ykfp_ss/ckfp_ss;
hfp_ss      = (a/te*(ycfp_ss*llfp_ss*mc_ss))^(1/(1+g));
kfp_ss      = (hfp_ss)/((ykfp_ss*llfp_ss)^(1/a));
iyfp_ss     = ik_ss/ykfp_ss;
cyfp_ss     = ckfp_ss/ykfp_ss;
cfp_ss      = ckfp_ss*kfp_ss;
ifp_ss      = ik_ss*kfp_ss;
yfp_ss      = ykfp_ss*kfp_ss;
lambdafp_ss = 1/cfp_ss;
nfp_ss      = kfp_ss*nkratio;
qfp_ss      = 1;
ygap_ss     = y_ss-yfp_ss;
lnygap_ss   = 0;
uu_ss       = log(c_ss)-te*(h_ss^(1+g))/(1+g);
vf_ss       = uu_ss/(1-b);
kc_ss       = 0;
lnyt_ss     = 0;
lnit_ss     = 0; 
qgap_ss     = q_ss-qfp_ss;

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
                                                                         //*
// Definition of Discretionary Fiscal Policy Parameter                   //*
// coffispol = 1;                                                        //*   
//**************************************************************************


%----------------------------------------------------------------
% (2.) Model
%----------------------------------------------------------------

model;

//**************************************************************************
// Definition of Modelbase Variables in Terms of Original Model Variables   //*
interest   = log(rnt/rn_ss)*400;                                            //*
inflationq = log(pit/pi_ss)*400;                                            //*
inflation  = 1/4*(inflationq+inflationq(-1)+inflationq(-2)+inflationq(-3)); //*
output     = log(yt/y_ss)*100;                                              //*
outputgap  = log(yt/ytfp)*100;                                              //*
//fispol   = e_g;                                                           //*    
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
// fispol = coffispol*fiscal_;                                           //*  
//**************************************************************************

// Model equations:

//equations for sticky price model

lambdat     = pref/ct;
lambdat     = rnt*b*(lambdat(+1)/pit(+1));
rkt         = ((1-a)*((yt*llt)/kt(-1))*mct+(1-d)*qt)/qt(-1);
auxt        = rnt/pit(+1);//real interest rate
expi        = pit(+1);
rkt(+1)     = st*auxt;
efc         = st*auxt;
nt          = eta*(rkt*qt(-1)*kt(-1)-st(-1)*auxt(-1)*(qt(-1)*kt(-1)-nt(-1)));
ce          = (1-eta)*nt;
xt*qt      = 1+xi*(it/kt(-1)-d)+tau*it/(xt^tau1);
kt         = (1-d)*kt(-1)+it*xt;
eqti       = tau*it/(2*(xt^tau1));
yt         = ct+it+(xi/2)*(it/kt(-1)-d)^2*kt(-1)+(tau/(2*xt^tau1))*it^2;
llt*yt     = (((zt*ht)^a)*(kt(-1)^(1-a)));
te*ht^g    = lambdat*a*((yt*llt)/ht)*mct;
llt        = (1-nu)*pstart^(-veps)+nu*pit^(veps)*llt(-1);
lnyt       = log(yt)-log(y_ss);
lnit       = log(it)-log(i_ss);
uu         = log(ct)-te*(ht^(1+g))/(1+g);
vf         = uu+b*vf(+1);
mpl        = a*yt*llt/ht;
mpk        = (1-a)*yt*llt/kt;
kl         = kt/ht;
rw         = te*ht^g/lambdat;
mcl        = rw/mpl;
mck        = rkt/mpk;
mcb        = mcl+mck;
mcc        =(rw/a)*(rkt*a/(rw*(1-a)))^(1-a);
mcd        = rw/mpl;
mce        = (rkt*qt(-1)-(1-d)*qt)/((1-a)*yt*llt/kt(-1));
htb^a        = (llt*yt)/(kt(-1)^(1-a)*zt^a);

st         = ft*(qt*kt/nt)^chi*taut;//shock on risk premium
ste        = (qt*kt/nt)^chi;
//st         = taut*(qt*kt/nt)^(chi*ft);//risk shock
//st         = (qt*kt/nt)^chi*taut; //benchmark no financial shock
//st         = (qt*kt/((1-hbar*taut)*nt))^(chi*ft);//haircut
//nt          = ft*eta*(rkt*qt(-1)*kt(-1)-st(-1)*auxt(-1)*(qt(-1)*kt(-1)-nt(-1)));//shock on net worth

bt         = qt*kt-nt;
taut       = (cgn/cgn_ss)^rhotau;
//taut       = (qt/qtfp)^rhotau;
//taut = (exp(qt/qtfp-1)/(1+exp(qt/qtfp-1)))^rhotau;


cgn        = (bt/bt(-1)*pit);
cg         = bt/bt(-1);
lev        = qt*kt/nt;
kc         = (xi/2)*(it/kt(-1)-d)^2*kt(-1);

// Policy rule:

//rnt/rn_ss  = ((rnt(-1)/rn_ss)^r_r)*(((pit/pi_ss)^r_p)*((yt/ytfp)^r_y))^(1-r_r)*et;
//rnt/rn_ss  = ((rnt(-1)/rn_ss)^r_r)*(((pit/pi_ss)^r_p)*((qt/qtfp)^r_q)*((yt/ytfp)^r_y))^(1-r_r)*et;
//rnt/rn_ss  = ((rnt(-1)/rn_ss)^r_r)*(((pit/pi_ss)^r_p)*((st/s_ss)^r_s)*((yt/ytfp)^r_y))^(1-r_r)*et;//risk premium
//rnt/rn_ss  = ((rnt(-1)/rn_ss)^r_r)*(((pit/pi_ss)^r_p)*((bt/bt(-1)*pit)^r_c)*((yt/ytfp)^r_y))^(1-r_r)*et;//credit growth
//rnt/rn_ss  = ((rnt(-1)/rn_ss)^r_r)*(((pit(-1)/pi_ss)^r_p)*((bt/bt(-1)*pit)^r_c)*((yt/ytfp)^r_y))^(1-r_r)*et;//credit growth
//rnt/rn_ss  = ((rnt(-1)/rn_ss)^r_r)*(((pit/pi_ss)^r_p)*((bt/bt(-1))^r_c)*((yt/ytfp)^r_y))^(1-r_r)*et;//credit growth
//rnt/rn_ss  = ((rnt(-1)/rn_ss)^r_r)*(((pit/pi_ss)^r_p)*((bt/bt_ss)^r_c)*((yt/ytfp)^r_y))^(1-r_r)*et;//credit gap
//rnt/rn_ss  = ((rnt(-1)/rn_ss)^r_r)*(((pit/pi_ss)^r_p)*((qt/q_ss)^r_q)*((yt/y_ss)^r_y))^(1-r_r)*et;
//rnt/rn_ss  = ((rnt(-1)/rn_ss)^r_r)*(((pit/pi_ss)^r_p)*((cgn/cgn_ss)^r_c)*((yt/ytfp)^r_y))^(1-r_r)*et;//credit growth
//rnt/rn_ss  = ((rnt(-1)/rn_ss)^r_r)*(((pit/pi_ss)^r_p)*((cgn/cgn_ss)^r_c)*((yt/y_ss)^r_y))^(1-r_r)*et;//credit growth


//pit        = pi_ss;


// Prices:

pstart = (veps/(veps-1))*(bigXt/bigZt);
pstart = ((1-nu*pit^(veps-1))/(1-nu))^(1/(1-veps));
bigXt  = mct*yt + nu*b*(lambdat(+1)/lambdat)*(pit(+1)^(veps))*bigXt(+1);
bigZt  = yt + nu*b*(lambdat(+1)/lambdat)*(pit(+1)^(veps-1))*bigZt(+1);



//equations for flexible price model

lambdatfp     = pref/ctfp;
lambdatfp     = rntfp*b*(lambdatfp(+1)/pi_ss);
rktfp         = ((1-a)*((ytfp)/ktfp(-1))*mctfp+(1-d)*qtfp)/qtfp(-1);
auxtfp        = rntfp/pi_ss;
rktfp(+1)     = auxtfp*s_ss;
xt*qtfp      = 1+xi*(itfp/ktfp(-1)-d);
ktfp         = (1-d)*ktfp(-1)+itfp*xt;
ytfp         = ctfp+itfp+(xi/2)*(itfp/ktfp(-1)-d)^2*ktfp(-1);
lltfp*ytfp   = (((zt*htfp)^a)*(ktfp(-1)^(1-a)));
te*htfp^g    = lambdatfp*a*((ytfp*lltfp)/htfp)*mctfp;
lltfp        = 1;
ygap         = yt-ytfp;
lnygap       = log(ygap)-log(ygap_ss);
qgap         = qt-qtfp;

// Policy rule:

//rntfp/rn_ss  = ((rntfp(-1)/rn_ss)^r_r)*(((pitfp/pi_ss)^r_p)*((ytfp/ytfp)^r_y))^(1-r_r)*et;
//rntfp/rn_ss  = ((rntfp(-1)/rn_ss)^r_r)*(((pitfp/pi_ss)^r_p)*((qtfp/qtfp)^r_q)*((ytfp/ytfp)^r_y))^(1-r_r)*et; //asset price
//rntfp/rn_ss  = ((rntfp(-1)/rn_ss)^r_r)*(((pitfp/pi_ss)^r_p)*((bt/bt(-1)*pit)^r_c)*((ytfp/ytfp)^r_y))^(1-r_r)*et;//credit growth
//rntfp/rn_ss  = ((rntfp(-1)/rn_ss)^r_r)*(((pitfp/pi_ss)^r_p)*((bt/bt(-1))^r_c)*((ytfp/ytfp)^r_y))^(1-r_r)*et;//credit growth

// Prices:
// pitfp =pi_ss;
mctfp=(veps-1)/veps*pstarfp_ss;
// pstartfp = (veps/(veps-1))*mctfp;
// pstartfp = 1;


// Shocks:

log(zt)   = rho_z*log(zt(-1)) + epszt;
// log(et)   = rho_e*log(et(-1)) + epset;
log(xt)   = rho_x*log(xt(-1)) + epsxt;
log(pref) = rho_p*log(pref(-1)) + epspt;
log(ft)   = rho_f*log(ft(-1)) - epsft;
end;

// Define the initial value of the variables for the simulation

initval;

auxt   = rn_ss/pi_ss;
bigXt  = bigX_ss;
bigZt  = bigZ_ss;
ct     = c_ss;
eqti   = eqti_ss;
// et     = e_ss; 
ht     = h_ss; 
it     = i_ss;
kt     = k_ss;
lambdat = lambda_ss;
llt    = ll_ss;
mct    = mc_ss;
nt     = n_ss;
pit    = pi_ss;
pref   = p_ss;
pstart = pstar_ss;
qt     = q_ss;
rkt    = rk_ss;
rnt    = rn_ss;
st     = s_ss;
xt     = x_ss;
yt     = y_ss;
zt     = z_ss;
auxtfp   = rn_ss/pi_ss;
ctfp     = cfp_ss;
htfp     = hfp_ss; 
itfp     = ifp_ss;
ktfp     = kfp_ss;
lambdatfp = lambdafp_ss;
lltfp    = llfp_ss;
mctfp    = mc_ss;
// pitfp    = pi_ss;
// pstartfp = pstarfp_ss;
qtfp     = qfp_ss;
rktfp    = rkfp_ss;
rntfp    = rn_ss;
ytfp     = yfp_ss;
ygap     = ygap_ss;
lnyt     = lnyt_ss;
lnit     = lnit_ss;
lnygap   = 0;
uu       = uu_ss;
vf       = vf_ss;
ft       = 1;
taut     = taut_ss;
bt       = bt_ss;
cgn    = cgn_ss;
cg     = cg_ss;
mpl    = mpl_ss;
kl     = kl_ss;
mpk    = mpk_ss;
rw     = rw_ss;
mcl    = mcl_ss;
mck    = mck_ss;
mcb    = mcb_ss;
mcc    = mcc_ss;
mcd    = mcd_ss;
mce    = mce_ss;
htb    = htb_ss;
qgap   = qgap_ss;
expi   = pi_ss;
lev    = lev_ss;
kc     = kc_ss;
ce     = ce_ss;
ste    = ste_ss;
efc    = efc_ss;

end;

// steady;
// check;

// Estimated version
shocks;
var epszt = 0.0060^2;
// var epset = 0.0021^2;//0.0067^2;//0.0067^2;
var epsxt = 0.0050^2;
var epspt = 0.0211^2;
var epsft = 0.0018^2;//mode and mean;//0.0016^2;//0.01^2;//0.0016^2;//risk premium shock


end;

// stoch_simul(order=2, irf=20, noprint, nograph) yt llt pit cgn nt rnt ft zt qt st it ct ht kt rkt mct cg qtfp ygap ytfp bt taut et xt pref mpl kl mpk rw mcl mck mcb mcc mcd mce htb auxt qgap bt rkt expi lev ce ytfp ste efc;
// mat_res_1 = [yt_epsft/y_ss pit_epsft/pi_ss cgn_epsft/cgn_ss nt_epsft/n_ss rnt_epsft/rn_ss ft_epsft qt_epsft/q_ss st_epsft/s_ss it_epsft/i_ss ct_epsft/c_ss ht_epsft/h_ss kt_epsft/k_ss rkt_epsft/rk_ss mct_epsft/mc_ss cg_epsft qtfp_epsft ygap_epsft/yfp_ss mpl_epsft/mpl_ss kl_epsft/kl_ss mpk_epsft/mpk_ss rw_epsft/rw_ss  mcl_epsft/mcl_ss mck_epsft/mck_ss mcb_epsft/mcb_ss mcc_epsft/mcc_ss mcd_epsft/mcd_ss mce_epsft/mce_ss htb_epsft/htb_ss auxt_epsft/aux_ss bt_epsft/bt_ss rkt_epsft/rk_ss expi_epsft/pi_ss lev_epsft/lev_ss ce_epsft ytfp_epsft/yfp_ss ste_epsft/ste_ss efc_epsft/efc_ss];
// mat_res_2 = [yt_epszt/y_ss pit_epszt/pi_ss cgn_epszt/cgn_ss nt_epszt/n_ss rnt_epszt/rn_ss zt_epszt qt_epszt/q_ss st_epszt/s_ss it_epszt/i_ss ct_epszt/c_ss ht_epszt/h_ss kt_epszt/k_ss rkt_epszt/rk_ss mct_epszt/mc_ss cg_epszt qtfp_epszt ygap_epszt/yfp_ss mpl_epszt/mpl_ss kl_epszt/kl_ss mpk_epszt/mpk_ss rw_epszt/rw_ss  mcl_epszt/mcl_ss mck_epszt/mck_ss mcb_epszt/mcb_ss mcc_epszt/mcc_ss mcd_epszt/mcd_ss mce_epszt/mce_ss htb_epszt/htb_ss auxt_epszt/aux_ss bt_epszt/bt_ss rkt_epszt/rk_ss expi_epszt/pi_ss lev_epszt/lev_ss ce_epszt ytfp_epszt/yfp_ss ste_epszt/ste_ss efc_epszt/efc_ss];
