//**************************************************************************
// A New Comparative Approach to Macroeconomic Modeling and Policy Analysis
//
// Volker Wieland, Tobias Cwik, Gernot J. Mueller, Sebastian Schmidt and
// Maik Wolters
//
// Working Paper, 2009
//**************************************************************************
// Model: US_FGKR15

// Further references:
// J. Fernandez-Villaverde, P. Guerron-Quintana, K. Kuester, and J. Rubio-Ram?rez.
// Fiscal volatility shocks and economic activity. American Economic Review, 105(11): 3352�84, November 2015

// Last edited 13.03.2017  by:  Irina Popova      (email: ipopova@wiwi.uni-frankfurt.de)
//                              Uliana Sulakshina (email: sulakshina@gmail.com)
//
//**************************************************************************


// 1. Define variables, parameters, etc
var         bdt ct dt gt ht
            inflt invt kt kbt lamt mct
            miut miubt proft Rt
            rkt tauct taukt tauwt utilt
            wt yt gzt gyt gct git gwt
            egt
            sigct siggt sigkt sigwt

            bdtF ctF gtF htF
            infltF invtF ktF kbtF lamtF mctF
            miutF miubtF proftF RtF
            rktF tauctF tauktF tauwtF utiltF
            wtF ytF gytF gctF gitF gwtF



//**************************************************************************
// Modelbase Variables
   interest inflation inflationq output outputgap fispol;
//**************************************************************************

varexo      ect edt /*egt*/ ekt ewt ezt
            uct ugt ukt uwt
	    //emt
//**************************************************************************
// Modelbase Shocks
       interest_ fiscal_;
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
alph bds bet cs phisigk
            deductdepr
            nom_depreciation
            delt eps epsw deltau
            etac etag etak etaw
            gamcb gamcy gamgb gamgy gamkb
            gamky gamwb gamwy gs hs
            infls invs ks kbs lams mcs
            mius miubs mius_lams miubs_lams nomw ome phibd phil
            phiprof phips phiR phiRot phiRotF
            phiRotw phiRotwF phiu1 phiu2 phiy profs
            rhoc rhod rhog rhogc rhogg
            rhogk rhogw rhok
            rhow rhoz rks Rs sigcs
            sigd siggs sigks sigms
            sigws sigz taucs tauks tauws
            taxprofits tbd thetp thetw ups
            ws ys habit kappa rspnd_y rspnd_b gzs;

// 2. Set Parameters
// Growth rate of the economy
gzs  = 1.005 ; // steady-state TFP growth rate

// parameter values
// Preferences and consumer
ome  = 2 ;      // CRRA
bet  = 0.9945*gzs^ome;  // time-discount factor; adjusted to have real rate of 2% in the presence of growth
ups  = 1 ;      // inverse of Frisch elasticity of labor supply (phil: scaling parameter to disutility of work is determined with ss below)
thetw= 0.75 ;   // Calvo-equivalent of Rotemberg wage stickiness (phiRotw=phiw is determined with ss below)
phiRotwF=0;
nomw = 0 ;
//eps = 10;
eps     = 21 ;  // price markup from ACEL
habit = 0.75 ;  // From ACEL

// cost of utilization and investment
phiu2  = 0.01 ; // second derivative for capacity utilization cost function (phiu1, the first derivative, is determined with ss below)
kappa  = 0.75 ;

// Firms
alph    = 0.36 ;   // weight on capital in Cobb-Douglas production function
delt    = 0.010 ;  // rate of depreciation of capital
deltau  = 0.010 ;  // depreciation for tax purposes
thetp = 0.74;
//thetp   = 0.75 ;   // Calvo-equivalent of Rotemberg price stickiness (phiRot=phipt is determined with ss below)
phiRotF = 0;
epsw    = 21;      // wage markup from ACEL
phiprof = 0.00;    // fixed cost in production

// Taylor rule
infls= 1.0045 ;  // inflation target (adjusted for mean ergodic inflation rate)
phiR = 0.7 ;     // smoothing coefficient
phips= 1.35 ;    // steady-state response to inflation
phiy = 0.25 ;    // response to output
phisigk = -0.025 ; // response to tax volatility

// lump-sum taxes
phibd = 0.0005; // response of lump-sum taxes to debt (tbd=Omega, the steady-state level of lump-sum taxes is determined with ss below)
                 // use 0.01 w/o feedback

// government spending process
gs    = 0.2 ;       // steady-state level of spending

// feedback rule
rhog  = 0.99 ;    // autocorrelation
gamgy = -0.004 ;   // response to output
gamgb = -0.008 ;   // response to debt
siggs = -6.20 ;   // steady-state vola
rhogg = 0.92 ;    // persistence of vola shock
etag  = 0.18 ;    // std of inno to vola

// capital taxes
tauks = 0.38 ;    // steady-state level of tax

// feedback rule
rhok  = 0.98 ;    // autocorrelation
gamky = 0.040 ;    // response to output
gamkb = 0.003 ;    // response to debt
sigks = -4.90 ;    // steady-state vola
rhogk = 0.65 ;    //  vola shock
//rhogk = 0.39 ;    // low persistence
//rhogk = 0.86 ;  // high persistence
etak  = 0.40 ;    // std of inno to vola

// consumption taxes
taucs = 0.080 ;    // steady-state level of tax

// feedback rule
rhoc  = 0.99 ;    // autocorrelation
gamcy = 0.001 ;    // response to output
gamcb = 1e-4 ;    // response to debt
sigcs = -7.12 ;    // steady-state vola
rhogc = 0.73 ;     // persistence of vola shock
etac  = 0.45 ;    // std of inno to vola


// labor taxes
tauws= 0.21 ;     // steady-state level of tax

// feedback rule
rhow = 0.99 ;     // autocorrelation
gamwy= 0.040 ;     // response to output
gamwb= 0.003 ;     // response to debt
sigws= -6.0 ;     // steady-state vola
rhogw= 0.46 ;     // persistence of vola shock
etaw = 0.82 ;     // std of inno to vola

// monetary shock
sigms = exp(-5.5) ;   // steady-state vola

// consumption-preference shock
rhod = 1*0.18;       // autocorrelation
sigd = 1*0.08 ;      // vola

// neutral technology shock
rhoz = 0.95 ;  // autocorrelation
sigz = 0.001 ; // vola

// tax system
deductdepr = 1; // depreciation allowance
taxprofits = 0; // tax monopolistic profits of sticky-price firms
nom_depreciation = 0; // depreciation allowances refer to nominal value of investment
rspnd_y    = 1.0;// taxes and spending respond to output
rspnd_b    = 1.0;// taxes and spending respond to debt



// compute steady state

Rs      = gzs^ome*infls/bet ;
miubs_lams   = bet*deltau*tauks*deductdepr/(infls^nom_depreciation*gzs^ome)/(1-bet*(1-deltau)/infls^nom_depreciation/gzs^ome);
mius_lams    = 1 - miubs_lams;
rks     = ( 1 - bet*(1-delt)/gzs^ome )*mius_lams*gzs^ome/bet /(1-tauks) ;
mcs     = (eps-1)/eps ;
phiRot  = eps*mcs/infls^2*thetp/(1-thetp) /(1-thetp*bet*(gzs^(1-ome)));
koverls = gzs*(rks/alph/mcs)^(1/(alph-1));
ws      = (1-alph)*koverls^alph*mcs/gzs^alph;
lk      = (1-alph)*rks/alph/ws/gzs ;
hs      = 1/3;
ys      = lk^(-alph)*hs/gzs^alph - phiprof;
ks      = hs/lk ;
invs    = (1-(1-delt)/gzs)*ks ;
kbs     = infls^nom_depreciation/( infls^nom_depreciation - (1-deltau)/gzs )*invs;
cs      = ys - gs*ys  - invs; //adj cost is zero in steady state
lams    = (1/(1-habit/gzs)^ome-bet*habit/(gzs-habit)^ome)/cs^ome/(1+taucs) ;
mius    = mius_lams*lams;
miubs   = miubs_lams*lams;
phil    = ws*(epsw - 1)*lams*(1-tauws)/epsw/hs^ups ;          // scaling parameter to disutility of work
utils   = 1 ;
phiu1   = lams*rks*(1-tauks)/mius ;
bds     = 1.6*ys ; //
profs   = ys-ws*hs-rks*utils*ks/gzs-phiprof;
tbd     = gs*ys - (ws*hs*tauws + ks*tauks* (  rks*utils -  deductdepr*deltau/infls^nom_depreciation)/gzs
                               + tauks*taxprofits*profs
                               + taucs*cs
                               + bds*(1 - Rs/infls/gzs)) ;
phiRotw = epsw*phil*hs^(1+ups)*thetw*(1+epsw*ups)/ys/lams/(1-bet*thetw*gzs^(1-ome))/(1-thetw)/infls^nomw/gzs^2;

//**************************************************************************
// Specification of Modelbase Parameters

// Load Modelbase Monetary Policy Parameters
thispath = pwd;
cd('..');
load policy_param.mat;
for i=1:33
    deep_parameter_name = M_.param_names(i,:);
    eval(['M_.params(i)  = ' deep_parameter_name ' ;'])
end
cd(thispath);
std_r_=1;
// Definition of Discretionary Fiscal Policy Parameter
coffispol = 1/exp(siggs);
//**************************************************************************


// 4. Define Model
model ;

//**************************************************************************
// Definition of Modelbase Variables in Terms of Original Model Variables

interest     = 4*(Rt-log(Rs));
inflation    = ((inflt+inflt(-1)+inflt(-2)+inflt(-3))) - 4*log(infls);
inflationq   = 4*(inflt-log(infls));
outputgap    = ((exp(yt)/exp(ytF))-1);
output       = (yt-log(ys));
fispol       = egt;

// **************************************************************************

//**************************************************************************
// Policy Rule                                                           //*
                                                                         //*
// Monetary Policy                                                       //*

//interest = phiR*interest(-1) + (1-phiR)*phips*inflationq + (1-phiR)*phiy*4*output + interest_;
//exp(Rt) = Rs*(exp(Rt(-1))/Rs)^phiR*(exp(inflt)/infls)^(phips*(1-phiR))*(exp(yt)/ys)^(phiy*(1-phiR))*exp(emt) ;
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


//**********************************
// ORIGINAL STICKY ECONOMY (prices and wages)
// *********************************

// household sector
// consumption;
exp(dt)/(exp(ct)-habit*exp(ct(-1))/exp(gzt))^ome - exp(dt(1))*habit*bet/(exp(ct(1))*exp(gzt(1))-habit*exp(ct))^ome= exp(lamt)*(1+tauct) ;

// labor;
0 = epsw*phil*exp(dt)*(exp(ht))^(1+ups) - (epsw-1)*exp(lamt)*(1-tauwt)*exp(ht)*exp(wt)
    - phiRotw*exp(yt)*(exp(inflt))^nomw*exp(lamt)*exp(gzt)*exp(wt)/exp(wt(-1))*((exp(inflt))^nomw*exp(gzt)*exp(wt)/exp(wt(-1))-gzs*infls^nomw)
        + bet*phiRotw*(exp(inflt(1)))^nomw*exp(lamt(1))*exp(-ome*gzt(1))*exp(yt(1))*exp(gzt(1))*exp(wt(1))/exp(wt)*exp(gzt(1))*((exp(inflt(1)))^nomw*exp(gzt(1))*exp(wt(1))/exp(wt)-gzs*infls^nomw) ;

// bonds;
exp(lamt) = bet*exp(lamt(1))*exp(Rt)/exp(inflt(1))/exp(gzt(1))^ome ;

// utilization;
exp(lamt)*exp(rkt)*(1-taukt) = exp(miut)*( phiu1 + phiu2*(exp(utilt)-1) ) ;

// capital;
exp(miut) = bet*((1 - delt - phiu1*( exp(utilt(1)) -1 ) - phiu2/2*( exp(utilt(1))-1 )^2 )*exp(miut(1))
                  +  (1-taukt(1))*exp(rkt(1))*exp(utilt(1))*exp(lamt(1)))/exp(gzt(1))^ome ;

// investment;
exp(lamt) = exp(miut)*(1 - exp(gzt)*exp(invt)/exp(invt(-1))*kappa*(exp(gzt)*exp(invt)/exp(invt(-1)) - gzs) - kappa*(exp(gzt)*exp(invt)/exp(invt(-1)) - gzs)^2/2)
                   + bet*(exp(gzt(1))^2*exp(invt(1))/exp(invt))^2*kappa*(exp(gzt(1))*exp(invt(1))/exp(invt) - gzs)*exp(miut(1))/exp(gzt(1))^ome + miubt ;

// tax capital stock;
miubt =   bet*miubt(1)*(1-deltau)/exp(inflt(1))^nom_depreciation/exp(gzt(1))^ome
        + bet*exp(lamt(1))*deltau*taukt(1)/exp(inflt(1))^nom_depreciation*deductdepr/exp(gzt(1))^ome ;

// firm sector;
0 = (1-taxprofits*taukt)*((1-eps) + eps*exp(mct) - phiRot*exp(inflt)*(exp(inflt) - infls) + phiRot*eps*(exp(inflt) - infls)^2/2)
      + bet*phiRot*(exp(lamt(1))/exp(lamt)/exp(gzt(1))^ome)*(1-taxprofits*taukt(1))*(exp(gzt(1))*exp(yt(1))/exp(yt))*exp(inflt(1))*(exp(inflt(1))-infls);

// with linear Phillips curve:
// modified budget constraint below!!!
//exp(inflt) - infls = bet*gzs^(1-ome)*(exp(inflt(1))-infls) + eps*(exp(mct)-mcs)/(infls*phiRot) ;

// marginal cost; checked: ok
exp(mct) = (exp(wt)/(1-alph))^(1-alph)*(exp(rkt)/alph)^alph ;

// FOC factors inputs firm;
exp(utilt)*exp(kt(-1))/exp(ht) = alph*exp(gzt)*exp(wt)/(1-alph)/exp(rkt) ;

// Profits of Calvo firms;
proft = exp(yt) - exp(wt)*exp(ht) - exp(rkt)*exp(utilt)*exp(kt(-1))/exp(gzt) - phiprof - phiRot/2*exp(yt)*(exp(inflt)-infls)^2;

// Government: Taylor rule;
//exp(Rt) = Rs*(exp(Rt(-1))/Rs)^phiR*(exp(inflt)/infls)^(phips*(1-phiR))*(exp(yt)/ys)^(phiy*(1-phiR))*exp(emt) ;
//(interest/400)+Rs = Rs*(((interest(-1)/400)+Rs))/Rs)^phiR*(exp(inflationq/100)/infls)^(phips*(1-phiR))*(exp((output/100)+ys)/ys)^(phiy*(1-phiR))*exp(emt) ;
// This second Taylor rule is for the extended model
//exp(Rt) = Rs*(exp(Rt(-1))/Rs)^phiR*(exp(inflt)/infls)^(phips*(1-phiR))*(exp(yt)/ys)^(phiy*(1-phiR))*(exp(sigkt)/exp(sigks))^(0.005*(1-phiR))*exp(emt) ; //*****

// inflation targeting
// exp(inflt)  = infls ;

// government debt:
bdt     =    bdt(-1)*exp(Rt(-1))/exp(inflt)/exp(gzt) + gt*exp(yt)
            - (tauwt*exp(wt)*exp(ht)
                  + taukt*exp(kt(-1))*( exp(rkt)*exp(utilt) )/exp(gzt)
                  + taukt*exp(kbt(-1))*(  - deductdepr*deltau/exp(inflt)^nom_depreciation )/exp(gzt)
                  + tauct*exp(ct)
                  + proft*taxprofits*taukt
                  + phibd*(bdt(-1)/ys - bds/ys)
                  + tbd ) ;

// resource constraint: production;
exp(yt) = (exp(utilt)*exp(kt(-1))/exp(gzt))^alph*(exp(ht))^(1-alph) - phiprof ;

// resource constraint: demand;
exp(yt) = exp(ct) + exp(invt) + gt*exp(yt) + phiRot/2*exp(yt)*(exp(inflt) - infls)^2
         + phiRotw*exp(yt)*((exp(inflt))^nomw*exp(gzt)*exp(wt)/exp(wt(-1))-gzs*infls^nomw)^2/2 ;

// This version w/o price adjustment cost for linear PC;
//exp(yt) = exp(ct) + exp(invt) + gt*exp(yt) + phiRotw*exp(yt)*((exp(inflt))^nomw*exp(gzt)*exp(wt)/exp(wt(-1))-gzs*infls^nomw)^2/2 ;

// Laws of motion capital
exp(kt) =     (1 - delt - phiu1*(exp(utilt) - 1) - phiu2/2*(exp(utilt)-1)^2 )*exp(kt(-1))/exp(gzt)
            + (1 - kappa/2*(exp(gzt)*exp(invt)/exp(invt(-1))-gzs)^2)*exp(invt) ;
exp(kbt)= (1-deltau)*exp(kbt(-1))/(exp(inflt)^nom_depreciation*exp(gzt)) + exp(invt) ;

// Structural shocks
gt    = (1-rhog)*gs    + rhog*gt(-1)    + rspnd_y*gamgy*((yt(-1))-log(ys)) + rspnd_b*gamgb*(bdt(-1)/exp(yt(-1))-bds/ys) + exp(siggt)*egt ;
taukt = (1-rhok)*tauks + rhok*taukt(-1) + rspnd_y*gamky*((yt(-1))-log(ys)) + rspnd_b*gamkb*(bdt(-1)/exp(yt(-1))-bds/ys) + exp(sigkt)*ekt  ;
tauct = (1-rhoc)*taucs + rhoc*tauct(-1) + rspnd_y*gamcy*((yt(-1))-log(ys)) + rspnd_b*gamcb*(bdt(-1)/exp(yt(-1))-bds/ys) + exp(sigct)*ect ;
tauwt = (1-rhow)*tauws + rhow*tauwt(-1) + rspnd_y*gamwy*((yt(-1))-log(ys)) + rspnd_b*gamwb*(bdt(-1)/exp(yt(-1))-bds/ys) + exp(sigwt)*ewt ;

// Volatility shocks
sigkt = (1-rhogk)*sigks + rhogk*sigkt(-1) + (1-rhogk^2)^(1/2)*etak*ukt ;
sigwt = (1-rhogw)*sigws + rhogw*sigwt(-1) + (1-rhogw^2)^(1/2)*etaw*uwt ;
sigct = (1-rhogc)*sigcs + rhogc*sigct(-1) + (1-rhogc^2)^(1/2)*etac*uct ;
siggt = (1-rhogg)*siggs + rhogg*siggt(-1) + (1-rhogg^2)^(1/2)*etag*ugt ;
// Growth variables 22,23,24,25
gyt   = yt - yt(-1) + gzt ;
gct   = ct - ct(-1) + gzt ;
git   = invt - invt(-1) + gzt ;
gwt   = wt - wt(-1) + gzt ;

//**********************************
//FLEXIBLE PRICES ECONOMY
//**********************************

// household sector
// consumption ;
exp(dt)/(exp(ctF)-habit*exp(ctF(-1))/exp(gzt))^ome - exp(dt(1))*habit*bet/(exp(ctF(1))*exp(gzt(1))-habit*exp(ctF))^ome= exp(lamtF)*(1+tauctF) ;

// labor ;
0 = epsw*phil*exp(dt)*(exp(htF))^(1+ups) - (epsw-1)*exp(lamtF)*(1-tauwtF)*exp(htF)*exp(wtF)
    - phiRotwF*exp(ytF)*(exp(infltF))^nomw*exp(lamtF)*exp(gzt)*exp(wtF)/exp(wtF(-1))*((exp(infltF))^nomw*exp(gzt)*exp(wtF)/exp(wtF(-1))-gzs*infls^nomw)
        + bet*phiRotwF*(exp(infltF(1)))^nomw*exp(lamtF(1))*exp(-ome*gzt(1))*exp(ytF(1))*exp(gzt(1))*exp(wtF(1))/exp(wtF)*exp(gzt(1))*((exp(infltF(1)))^nomw*exp(gzt(1))*exp(wtF(1))/exp(wtF)-gzs*infls^nomw) ;

// bonds ;
exp(lamtF) = bet*exp(lamtF(1))*exp(RtF)/exp(infltF(1))/exp(gzt(1))^ome ;

// utilization ;
exp(lamtF)*exp(rktF)*(1-tauktF) = exp(miutF)*( phiu1 + phiu2*(exp(utiltF)-1) ) ;

// capital ;
exp(miutF) = bet*((1 - delt - phiu1*( exp(utiltF(1)) -1 ) - phiu2/2*( exp(utiltF(1))-1 )^2 )*exp(miutF(1))
                  +  (1-tauktF(1))*exp(rktF(1))*exp(utiltF(1))*exp(lamtF(1)))/exp(gzt(1))^ome ;

// investment ;
exp(lamtF) = exp(miutF)*(1 - exp(gzt)*exp(invtF)/exp(invtF(-1))*kappa*(exp(gzt)*exp(invtF)/exp(invtF(-1)) - gzs) - kappa*(exp(gzt)*exp(invtF)/exp(invtF(-1)) - gzs)^2/2)
                   + bet*(exp(gzt(1))^2*exp(invtF(1))/exp(invtF))^2*kappa*(exp(gzt(1))*exp(invtF(1))/exp(invtF) - gzs)*exp(miutF(1))/exp(gzt(1))^ome + miubtF ;

// tax capital stock ;
miubtF =   bet*miubtF(1)*(1-deltau)/exp(infltF(1))^nom_depreciation/exp(gzt(1))^ome
        + bet*exp(lamtF(1))*deltau*tauktF(1)/exp(infltF(1))^nom_depreciation*deductdepr/exp(gzt(1))^ome ;

// firm sector ;
0 = (1-taxprofits*tauktF)*((1-eps) + eps*exp(mctF) - phiRotF*exp(infltF)*(exp(infltF) - infls) + phiRotF*eps*(exp(infltF) - infls)^2/2)
      + bet*phiRotF*(exp(lamtF(1))/exp(lamtF)/exp(gzt(1))^ome)*(1-taxprofits*tauktF(1))*(exp(gzt(1))*exp(ytF(1))/exp(ytF))*exp(infltF(1))*(exp(infltF(1))-infls);

// marginal cost; checked: ok
exp(mctF) = (exp(wtF)/(1-alph))^(1-alph)*(exp(rktF)/alph)^alph ;

// FOC factors inputs firm ;
exp(utiltF)*exp(ktF(-1))/exp(htF) = alph*exp(gzt)*exp(wtF)/(1-alph)/exp(rktF) ;

// Profits of Calvo firms ;
proftF = exp(ytF) - exp(wtF)*exp(htF) - exp(rktF)*exp(utiltF)*exp(ktF(-1))/exp(gzt) - phiprof - phiRotF/2*exp(ytF)*(exp(infltF)-infls)^2;

// Government: Taylor rule replaced by constant inflation equation;
exp(infltF) = infls;

// government debt:
bdtF     =    bdtF(-1)*exp(RtF(-1))/exp(infltF)/exp(gzt) + gtF*exp(ytF)
            - (     tauwtF*exp(wtF)*exp(htF)
                  + tauktF*exp(ktF(-1))*( exp(rktF)*exp(utiltF) )/exp(gzt)
                  + tauktF*exp(kbtF(-1))*(  - deductdepr*deltau/exp(infltF)^nom_depreciation )/exp(gzt)
                  + tauctF*exp(ctF)
                  + proftF*taxprofits*tauktF
                  + phibd*(bdtF(-1)/ys - bds/ys)
                  + tbd ) ;

// resource constraint: production;
exp(ytF) = (exp(utiltF)*exp(ktF(-1))/exp(gzt))^alph*(exp(htF))^(1-alph) - phiprof ;

// resource constraint: demand;
exp(ytF) = exp(ctF) + exp(invtF) + gtF*exp(ytF) + phiRotF/2*exp(ytF)*(exp(infltF) - infls)^2
         + phiRotwF*exp(ytF)*((exp(infltF))^nomw*exp(gzt)*exp(wtF)/exp(wtF(-1))-gzs*infls^nomw)^2/2 ;

// Laws of motion capital
exp(ktF) =     (1 - delt - phiu1*(exp(utiltF) - 1) - phiu2/2*(exp(utiltF)-1)^2 )*exp(ktF(-1))/exp(gzt)
            + (1 - kappa/2*(exp(gzt)*exp(invtF)/exp(invtF(-1))-gzs)^2)*exp(invtF) ;
exp(kbtF)= (1-deltau)*exp(kbtF(-1))/(exp(infltF)^nom_depreciation*exp(gzt)) + exp(invtF) ;

// Structural shocks
gtF    = (1-rhog)*gs    + rhog*gtF(-1)    + rspnd_y*gamgy*((ytF(-1))-log(ys)) + rspnd_b*gamgb*(bdtF(-1)/exp(ytF(-1))-bds/ys) + exp(siggt)*egt ;
tauktF = (1-rhok)*tauks + rhok*tauktF(-1) + rspnd_y*gamky*((ytF(-1))-log(ys)) + rspnd_b*gamkb*(bdtF(-1)/exp(ytF(-1))-bds/ys) + exp(sigkt)*ekt ;
tauctF = (1-rhoc)*taucs + rhoc*tauctF(-1) + rspnd_y*gamcy*((ytF(-1))-log(ys)) + rspnd_b*gamcb*(bdtF(-1)/exp(ytF(-1))-bds/ys) + exp(sigct)*ect ;
tauwtF = (1-rhow)*tauws + rhow*tauwtF(-1) + rspnd_y*gamwy*((ytF(-1))-log(ys)) + rspnd_b*gamwb*(bdtF(-1)/exp(ytF(-1))-bds/ys) + exp(sigwt)*ewt ;

// Growth variables 22,23,24,25
gytF   = ytF - ytF(-1) + gzt ;
gctF   = ctF - ctF(-1) + gzt ;
gitF   = invtF - invtF(-1) + gzt ;
gwtF   = wtF - wtF(-1) + gzt ;


// ***********************************************************
// structural shocks 26, 27
gzt = log(gzs) + ezt ;
dt = rhod*dt(-1) + edt ;


end ;

initval ;
ct   = log(cs) ;
yt   = log(ys) ;
rkt  = log(rks) ;
gt   = gs ;
kt   = log(ks) ;
kbt  = log(kbs) ;
ht   = log(hs) ;
mct  = log(mcs) ;
wt   = log(ws) ;
inflt= log(infls) ;
Rt   = log(Rs) ;
taukt= tauks ;
tauwt= tauws ;
tauct= taucs ;
lamt = log(lams) ;
miut = log(mius) ;
miubt= miubs ;
invt= log(invs) ;
utilt= 0 ;

sigkt= sigks ;
sigwt= sigws ;
sigct= sigcs ;
siggt= siggs ;

proft= profs;
bdt  = bds ;
gzt  = log(gzs) ;
dt   = 0 ;
gyt  = log(gzs) ;
gct  = log(gzs) ;
git  = log(gzs) ;
gwt  = log(gzs) ;

ctF   = log(cs) ;
ytF   = log(ys) ;
rktF  = log(rks) ;
gtF   = gs ;
ktF   = log(ks) ;
kbtF  = log(kbs) ;
htF   = log(hs) ;
mctF  = log(mcs) ;
wtF   = log(ws) ;
infltF= log(infls) ;
RtF   = log(Rs) ;
tauktF= tauks ;
tauwtF= tauws ;
tauctF= taucs ;
lamtF = log(lams) ;
miutF = log(mius) ;
miubtF= miubs ;
invtF= log(invs) ;
utiltF= 0 ;
proftF= profs;
bdtF  = bds ;
gytF  = log(gzs) ;
gctF  = log(gzs) ;
gitF  = log(gzs) ;
gwtF  = log(gzs) ;

interest = 0;
output = 0;
inflationq = 0;
inflation = 0;
end ;


shocks ;

var ezt = sigz^2 ;
var edt = sigd^2 ;
//var emt = sigms^2;
var ekt = 1 ;
var ect = 1 ;
//var egt = 1 ;
var ewt = 1 ;
var fiscal_ = 1;
var ukt = 1 ;
var uct = 1 ;
var ugt = 1 ;
var uwt = 1 ;

//var emt = (0.01/4)^2;
var interest_ = 1;

end;

%steady ;

//stoch_simul(order = 1, irf = 20) interest inflation inflationq output outputgap;

