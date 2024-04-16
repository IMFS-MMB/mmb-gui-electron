//**************************************************************************
// A New Comparative Approach to Macroeconomic Modeling and Policy Analysis
//
// Volker Wieland, Tobias Cwik, Gernot J. Mueller, Sebastian Schmidt and
// Maik Wolters
//
// Working Paper, 2009
//**************************************************************************

// Model: EACZ_GEM03

// Further references:
// Laxton, D., and P. Pesenti. 2003. "Monetary Policy Rules for Small, Open, Emerging Economies."
// Journal of Monetary Economics 50, pp. 1109-1146.

// Last edited: 10/09/07 by S. Schmidt


var AF AH BIGGAMF BIGGAMH BIGGAMIMPF BIGGAMIMPH BIGGAMMF BIGGAMMH BIGGAMNF
    BIGGAMNH BIGGAMQF BIGGAMQH BIGGAM_MONF BIGGAM_MONH BIGGAM_MOTF BIGGAM_MOTH
    BIGGAM_O_NF BIGGAM_O_NH BIGGAM_O_TF BIGGAM_O_TH CAPAF CAPAH CF CF_NAT CH
    CH_NAT CURBALF_RAT CURBALH_RAT DEEF DEEH DEPEX EXPORTSF EXPORTSF_NAT EXPORTSH
    EXPORTSH_NAT EYEF EYEH GAF GAH GAMMAF GAMMAH GDPF GDPF_NAT GDPGAPF GDPGAPH
    GDPH GDPH_NAT GF_NAT GH_NAT GNF GNH HF HH IMPORTSF IMPORTSF_NAT IMPORTSH
    IMPORTSH_NAT KF KH KNF KNF_RAT KNH KNH_RAT KTF KTF_RAT KTH KTH_RAT K_OF
    K_OF_RAT K_OH K_OH_RAT LANDF LANDH LF LH LNF LNH LTF LTH L_OF L_OH MARGUTF
    MARGUTH MF MF_NAT MH MH_NAT M_ONF M_ONH M_OTF M_OTH NF NH NNF NNH O_NF O_NH
    O_TF O_TH PIE4F PIE4H PIE4TARF PIE4TARH PIEBARMF PIEBARMH PIEBARQF PIEBARQH
    PIEF PIEH PIENF PIENH PIEWF PIEWH PSIF PSIH PSIPRIMEF PSIPRIMEH QF QH Q_ONF
    Q_ONH Q_OTF Q_OTH REALBF REALBH REALEX REALEXF REALEXH REALFINH REALMCNF
    REALMCNH REALMCTF REALMCTH REALMONEYF REALMONEYH REALPBARMF REALPBARMH
    REALPBARQF REALPBARQH REALPLANDF REALPLANDH REALPMF REALPMH REALPNF REALPNH
    REALPQF REALPQH REALPXF REALPXH REALP_MOF REALP_MOH REALP_ONF REALP_ONH
    REALP_OTF REALP_OTH REALP_QOF REALP_QOH REALRF REALRH REALTBALF REALTBALH
    REALWF REALWH RNOMF RNOMH SHOPF SHOPH SHOPPRIMEF SHOPPRIMEH TF TH T_OF
    T_OH VELOF VELOH VPRIMEF VPRIMEH XF_NAT XH_NAT XI ZBF ZBH ZEYEF ZEYEH ZNF
    ZNH ZTF ZTH ZUF ZUH ZZ_CF ZZ_CH ZZ_CURBALF_RAT ZZ_CURBALH_RAT ZZ_C_SHARF
    ZZ_C_SHARH ZZ_DPIE4F ZZ_DPIE4H ZZ_DRNOMF ZZ_DRNOMH ZZ_EXPORTSF ZZ_EXPORTSH
    ZZ_EYEF ZZ_EYEH ZZ_EYE_SHARF ZZ_EYE_SHARH ZZ_GDPF ZZ_GDPH ZZ_GDP_PPP_RATH
    ZZ_GF ZZ_GH ZZ_IMPORTSF ZZ_IMPORTSH ZZ_M_ON_SHARF ZZ_M_ON_SHARH ZZ_M_OT_SHARF
    ZZ_M_OT_SHARH ZZ_M_O_SHARF ZZ_M_O_SHARH ZZ_M_SHARF ZZ_M_SHARH ZZ_N_SHARF
    ZZ_N_SHARH ZZ_PIE4F ZZ_PIE4H ZZ_REALEX ZZ_RNOMF ZZ_RNOMH ZZ_UTILITYF
    ZZ_UTILITYH ZZ_XBALF_TOT_RAT ZZ_XBALH_TOT_RAT Z_OF Z_OH E_GAF

//**************************************************************************
// Modelbase Variables                                                   //*
    interest inflation inflationq outputgap output fispol;               //*
//**************************************************************************

varexo E_ZBH E_ZUH E_ZUF E_ZEYEH E_ZEYEF E_GAMMAH E_GAMMAF E_LANDH E_LANDF E_GAH
       E_CAPAH E_CAPAF

//**************************************************************************
// Modelbase Shocks                                                      //*
        interest_ fiscal_;                                               //*
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
           COSTLF COSTLH EPSF EPSH EPSQMF EPSQMH GLAMBDAF GLAMBDAH SIGMAF SIGMAH
           SSF SSH XR1F XR1H XR2F XR2H XR3F XR3H XR4F XR4H ALPHANF ALPHANH ALPHATF
           ALPHATH ALPHA_OF ALPHA_OH A_ONEF A_ONEH A_ZEROF A_ZEROH B0F B0H B1F
           B1H B2F B2H BET CAPAF_SS CAPAH_SS CHI0 CHI1 CHI2 CHI3 COSTF COSTH
           COST_MONF COST_MONH COST_MOTF COST_MOTH COST_O_NF COST_O_NH COST_O_TF
           COST_O_TH DELTAF DELTAH EPS_ONF EPS_ONH EPS_OTF EPS_OTH ETAF ETAH
           E_PIE4TARF E_PIE4TARH E_ZBF GAMA_NF GAMA_NH GAMA_TF GAMA_TH GAMMAF_SS
           GAMMAH_SS GAMMA_LANDF GAMMA_LANDH GA_RATF GA_RATH GDPF_EXOG GDPH_EXOG
           GN_RATF GN_RATH LANDF_SS LANDH_SS LILCAPPA1F LILCAPPA1H LILCAPPA2F
           LILCAPPA2H LILCAPPA3F LILCAPPA3H LILCAPPA4F LILCAPPA4H LILCAPPA5F
           LILCAPPA5H LILCAPPA6F LILCAPPA6H LILCAPPA7F LILCAPPA7H LILCAPPA8F
           LILCAPPA8H NYF NYH NY_NF NY_NH NY_TF NY_TH OMEGA0F OMEGA0H OMEGAF
           OMEGAH PHIF PHIH PIE4TARF_SS PIE4TARH_SS REALEX_EXOG REALPBARMF_EXOG
           REALPBARMH_EXOG REALPNF_EXOG REALPNH_EXOG REALP_MOF_EXOG REALP_MOH_EXOG
           RNOM_EXOGF RNOM_EXOGH THETAF THETAH XDUMF XDUMH XIXI_NF XIXI_NH XIXI_OF
           XIXI_OH XIXI_TF XIXI_TH ZBF_SS ZBH_SS ZEDF ZEDH ZEYEF_SS ZEYEH_SS
           ZNF_SS ZNH_SS ZTF_SS ZTH_SS ZUF_SS ZUH_SS Z_OF_SS Z_OH_SS
           PIE4F_EXOG interest_EXOG PIE4NF_EXOG PIEBAR4QF_EXOG;




COSTLF=5;
COSTLH=5;
EPSF=1.1;
EPSH=1.1;
EPSQMF=4;
EPSQMH=1.1;
GLAMBDAF=0;
GLAMBDAH=0;
SIGMAF=0.333333333333333;
SIGMAH=0.333333333333333;
SSF=0.95;
SSH=0.05;
XR1F=1;
XR1H=0.40;
XR2F=0;
XR2H=0.1;
XR3F=0.5;
XR3H=0.9;
XR4F=0;
XR4H=0;
ALPHANF=0.33;
ALPHANH=0.4;
ALPHATF=0.33;
ALPHATH=0.4;
ALPHA_OF=0.2;
ALPHA_OH=0.2;
A_ONEF=0.075;
A_ONEH=0.075;
A_ZEROF=0.011;
A_ZEROH=0.011;
B0F=1;
B0H=1;
B1F=0.95;
B1H=0.95;
B2F=1;
B2H=1;
BET=0.99263753614514;
CAPAF_SS=11;
CAPAH_SS=11;
CHI0=0.05;
CHI1=.1;
CHI2=0;
CHI3=0;
COSTF=5;
COSTH=5;
COST_MONF=5;
COST_MONH=5;
COST_MOTF=5;
COST_MOTH=5;
COST_O_NF=5;
COST_O_NH=5;
COST_O_TF=5;
COST_O_TH=5;
DELTAF=0.025;
DELTAH=0.025;
EPS_ONF=3;
EPS_ONH=3;
EPS_OTF=3;
EPS_OTH=3;
ETAF=0.35;
ETAH=0.2;
E_PIE4TARF=0;
E_PIE4TARH=0;
E_ZBF=0;
GAMA_NF=0.3;
GAMA_NH=0.1;
GAMA_TF=0.3;
GAMA_TH=0.5;
GAMMAF_SS=0.5;
GAMMAH_SS=0.25;
GAMMA_LANDF=0.1;
GAMMA_LANDH=0.1;
GA_RATF=0.05;
GA_RATH=0.05;
GDPF_EXOG=2.41500497257461;
GDPH_EXOG=2.90512477822209;
GN_RATF=0.1;
GN_RATH=0.1;
LANDF_SS=0.1;
LANDH_SS=0.1;
LILCAPPA1F=0;
LILCAPPA1H=0;
LILCAPPA2F=800;
LILCAPPA2H=400;
LILCAPPA3F=0;
LILCAPPA3H=0;
LILCAPPA4F=800;
LILCAPPA4H=400;
LILCAPPA5F=0;
LILCAPPA5H=0;
LILCAPPA6F=800;
LILCAPPA6H=400;
LILCAPPA7F=0;
LILCAPPA7H=0;
LILCAPPA8F=0;
LILCAPPA8H=0;
NYF=0.98;
NYH=0.0499999999999999;
NY_NF=0.98;
NY_NH=0.0499999999999999;
NY_TF=0.98;
NY_TH=0.02;
OMEGA0F=60;
OMEGA0H=60;
OMEGAF=5;
OMEGAH=5;
PHIF=3;
PHIH=3;
PIE4TARF_SS=1.125;
PIE4TARH_SS=1.125;
REALEX_EXOG=1.3734519289908;
REALPBARMF_EXOG=0.87146958398196;
REALPBARMH_EXOG=1.19072687148694;
REALPNF_EXOG=0.840675522925242;
REALPNH_EXOG=0.902486321747893;
REALP_MOF_EXOG=0.966533486000563;
REALP_MOH_EXOG=1.63690883121281;
RNOM_EXOGF=1.00741707177773;
RNOM_EXOGH=1.00741707177773;
THETAF=6;
THETAH=6;
XDUMF=1;
XDUMH=1;
XIXI_NF=0.75;
XIXI_NH=0.75;
XIXI_OF=0.75;
XIXI_OH=0.75;
XIXI_TF=0.75;
XIXI_TH=0.75;
ZBF_SS=0;
ZBH_SS=0;
ZEDF=2.5;
ZEDH=2.5;
ZEYEF_SS=0;
ZEYEH_SS=0;
ZNF_SS=1;
ZNH_SS=1;
ZTF_SS=1;
ZTH_SS=0.6;
ZUF_SS=1;
ZUH_SS=1;
Z_OF_SS=1;
Z_OH_SS=1;

PIE4F_EXOG=1.125;
interest_EXOG=PIE4F_EXOG^0.25/BET;
PIE4NF_EXOG=1.02988357195356^4;
PIEBAR4QF_EXOG=1.02988357195356^4;

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
std_r_ = 1;                                                            //*
                                                                         //*
// Definition of Discretionary Fiscal Policy Parameter                   //*
coffispol = 1;                                                           //*
//**************************************************************************

model;

//**************************************************************************
// Definition of Modelbase Variables in Terms of Original Model Variables //*

interest         = 1*(RNOMF^4-interest_EXOG^4)/interest_EXOG^4;        //*
inflation        = 1*(PIE4F-PIE4F_EXOG)/PIE4F_EXOG;                    //*
inflationq       = 1*(PIEF^4-PIE4F_EXOG)/PIE4F_EXOG;                   //*
outputgap        = GDPGAPF;                                              //*
output           = GDPF*1;                                             //*
fispol           = E_GAF;                                                //*
// Given inflation target for annual inflation is used as target for annualized quarterly inflation.
//**************************************************************************


//**************************************************************************
// Policy Rule foreign (large) country (main country)                	 //*
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
                                                                         //*

// Use the same policy rule for the home (small) country to get symmetric setup      //*

100*(RNOMH^4-1) = (1-cofintintb1)*(100*((1/BET*PIE4H^0.25)^4-1))                     //*
                      + cofintintb1*100*(RNOMH(-1)^4-1)                              //*
                      + cofintintb2*100*(RNOMH(-2)^4-1)                              //*
                      + cofintintb3*100*(RNOMH(-3)^4-1)                              //*
                      + cofintintb4*100*(RNOMH(-4)^4-1)                              //*
                      + cofintinf0*(100*(PIEH^4-1)-100*(PIE4TARH-1))                  //*
                      + cofintinfb1*(100*(PIEH(-1)^4-1)-100*(PIE4TARH-1))             //*
                      + cofintinfb2*(100*(PIEH(-2)^4-1)-100*(PIE4TARH-1))             //*
                      + cofintinfb3*(100*(PIEH(-3)^4-1)-100*(PIE4TARH-1))             //*
                      + cofintinfb4*(100*(PIEH(-4)^4-1)-100*(PIE4TARH-1))             //*
                      + cofintinff1*(100*(PIEH(+1)^4-1)-100*(PIE4TARH-1))             //*
                      + cofintinff2*(100*(PIEH(+2)^4-1)-100*(PIE4TARH-1))             //*
                      + cofintinff3*(100*(PIEH(+3)^4-1)-100*(PIE4TARH-1))             //*
                      + cofintinff4*(100*(PIEH(+4)^4-1)-100*(PIE4TARH-1))             //*
                      + cofintout*GDPGAPH                                            //*
                      + cofintoutb1*GDPGAPH(-1)                                      //*
                      + cofintoutb2*GDPGAPH(-2)                                      //*
                      + cofintoutb3*GDPGAPH(-3)                                      //*
                      + cofintoutb4*GDPGAPH(-4)                                      //*
                      + cofintoutf1*GDPGAPH(+1)                                      //*
                      + cofintoutf2*GDPGAPH(+2)                                      //*
                      + cofintoutf3*GDPGAPH(+3)                                      //*
                      + cofintoutf4*GDPGAPH(+4)                                     //*
                       + cofintoutp*(100*GDPH) 	                                         //*
                       + cofintoutpb1*(100*GDPH(-1))                                     //*
                       + cofintoutpb2*(100*GDPH(-2))                                     //*
                       + cofintoutpb3*(100*GDPH(-3))                                     //*
                       + cofintoutpb4*(100*GDPH(-4))                                     //*
                       + cofintoutpf1*(100*GDPH(+1))                                     //*
                       + cofintoutpf2*(100*GDPH(+2))                                     //*
                       + cofintoutpf3*(100*GDPH(+3))                                     //*
                       + cofintoutpf4*(100*GDPH(+4));                                     //*
                                                                                     //*
//**************************************************************************************


// Original Model Code:
          ZZ_UTILITYH = (ZUH*(CH-HH)^(1-SIGMAH)-1)/(1-SIGMAH)-CAPAH*LH^(1+ZEDH)/(1+ZEDH) ;
          ZZ_GH = 100*log(GH_NAT) ;
          ZZ_CURBALH_RAT = CURBALH_RAT*100 ;
          ZZ_M_SHARH = REALPBARMH*MH/AH ;
          ZZ_M_O_SHARH = (REALP_MOH*M_ONH+REALP_MOH*M_OTH)/AH ;
          ZZ_M_ON_SHARH = REALP_MOH*M_ONH/AH ;
          ZZ_M_OT_SHARH = REALP_MOH*M_OTH/AH ;
          ZZ_N_SHARH = NH*REALPNH/AH ;
          ZZ_EYE_SHARH = EYEH/GDPH ;
          ZZ_C_SHARH = CH/GDPH ;
          ZZ_GDPH = 100*log(GDPH_NAT) ;
          ZZ_CH = 100*log(CH_NAT) ;
          ZZ_EYEH = 100*log(EYEH) ;
          ZZ_EXPORTSH = 100*log(EXPORTSH_NAT) ;
          ZZ_IMPORTSH = 100*log(IMPORTSH_NAT) ;
          ZZ_XBALH_TOT_RAT = 100*(EXPORTSH_NAT-IMPORTSH_NAT)/GDPH_NAT ;
          ZZ_PIE4H = 100*(PIE4H-1) ;
          ZZ_DPIE4H = ZZ_PIE4H-ZZ_PIE4H(-1) ;
          ZZ_RNOMH = 100*(RNOMH^4-1) ;
          ZZ_DRNOMH = ZZ_RNOMH-ZZ_RNOMH(-1) ;
          100*(PIE4TARH-1) = 1*100*(PIE4TARH_SS-1)+(1-1)*100*(PIE4TARH(-1)-1)+E_PIE4TARH ;

          log(ZUH) = 0.3*log(ZUH_SS)+0.7*log(ZUH(-1))+E_ZUH ;
          ZBH = 0.3*ZBH_SS+0.7*ZBH(-1)+E_ZBH ;
          log(LANDH) = 0.05*log(LANDH_SS)+0.95*log(LANDH(-1))+E_LANDH ;
          log(ZTH) = 0.05*log(ZTH_SS)+0.95*log(ZTH(-1))+E_LANDH ;
          log(ZNH) = 0.05*log(ZNH_SS)+0.95*log(ZNH(-1))+E_LANDH ;
          log(Z_OH) = 0.05*log(Z_OH_SS)+0.95*log(Z_OH(-1))+E_LANDH ;
          ZEYEH = 0.05*ZEYEH_SS+0.95*ZEYEH(-1)+E_ZEYEH ;
          CAPAH = 0.05*CAPAH_SS+0.95*CAPAH(-1)+E_CAPAH ;
          log(GAMMAH) = 0.05*log(GAMMAH_SS)+0.95*log(GAMMAH(-1))+E_GAMMAH ;

          BIGGAM_O_NH = 1-COST_O_NH/2*(O_NH/NH/(O_NH(-1)/NH(-1))-1)^2 ;
          BIGGAM_O_TH = 1-COST_O_TH/2*(O_TH/TH/(O_TH(-1)/TH(-1))-1)^2 ;
          O_NH = GAMA_NH*NH/ZNH*(REALP_ONH/(REALMCNH*ZNH))^(-XIXI_NH)*(BIGGAM_O_NH-COST_O_NH*(O_NH/NH/(O_NH(-1)/NH(-1))-1)*O_NH/NH/(O_NH(-1)/NH(-1)))^XIXI_NH/BIGGAM_O_NH ;
          O_TH = GAMA_TH*TH/ZTH*(REALP_OTH/(REALMCTH*ZTH))^(-XIXI_TH)*(BIGGAM_O_TH-COST_O_TH*(O_TH/TH/(O_TH(-1)/TH(-1))-1)*O_TH/TH/(O_TH(-1)/TH(-1)))^XIXI_NH/BIGGAM_O_TH ;
          NH = ZNH*((1-ALPHANH-GAMA_NH)^(1/XIXI_NH)*LNH^(1-1/XIXI_NH)+ALPHANH^(1/XIXI_NH)*KNH^(1-1/XIXI_NH)+GAMA_NH^(1/XIXI_NH)*(BIGGAM_O_NH*O_NH)^(1-1/XIXI_NH))^(XIXI_NH/(XIXI_NH-1)) ;
          TH = ZTH*((1-ALPHATH-GAMA_TH)^(1/XIXI_TH)*LTH^(1-1/XIXI_TH)+ALPHATH^(1/XIXI_TH)*KTH^(1-1/XIXI_TH)+GAMA_TH^(1/XIXI_TH)*(BIGGAM_O_TH*O_TH)^(1-1/XIXI_TH))^(XIXI_TH/(XIXI_TH-1)) ;

          REALMCNH = 1/ZNH*((1-ALPHANH-GAMA_NH)*REALWH^(1-XIXI_NH)+ALPHANH*REALRH^(1-XIXI_NH)+GAMA_NH*REALP_ONH^(1-XIXI_NH)*(BIGGAM_O_NH-COST_O_NH*(O_NH/NH/(O_NH(-1)/NH(-1))-1)*O_NH/NH/(O_NH(-1)/NH(-1)))^(XIXI_NH-1))^(1/(1-XIXI_NH)) ;
          REALMCTH = 1/ZTH*((1-ALPHATH-GAMA_TH)*REALWH^(1-XIXI_TH)+ALPHATH*REALRH^(1-XIXI_TH)+GAMA_TH*REALP_OTH^(1-XIXI_TH)*(BIGGAM_O_TH-COST_O_TH*(O_TH/TH/(O_TH(-1)/TH(-1))-1)*O_TH/TH/(O_TH(-1)/TH(-1)))^(XIXI_TH-1))^(1/(1-XIXI_TH)) ;
          MARGUTH = (CH-B2H*HH)^(-SIGMAH)*ZUH ;
          HH = (1-B0H)*HH(-1)+B0H*B1H*CH(-1) ;
          VPRIMEH = CAPAH*LH^ZEDH ;
          AH^(1-1/EPSH) = GAMMAH^(1/EPSH)*(NYH^(1/EPSQMH)*QH^(1-1/EPSQMH)+(1-NYH)^(1/EPSQMH)*(MH*BIGGAMIMPH)^(1-1/EPSQMH))^(EPSQMH/(EPSQMH-1)*(1-1/EPSH))+(1-GAMMAH)^(1/EPSH)*NNH^(1-1/EPSH) ;
          QH = GAMMAH*NYH*REALPQH^(-EPSQMH)*AH*REALPXH^(EPSQMH-EPSH) ;
          MH = GAMMAH*(1-NYH)*REALPMH^(-EPSQMH)*AH*REALPXH^(EPSQMH-EPSH)*1/BIGGAMIMPH*(BIGGAMIMPH-COSTH*(MH/AH/(MH(-1)/AH(-1))-1)*MH/AH/(MH(-1)/AH(-1)))^EPSQMH ;
          REALPXH = (NYH*REALPQH^(1-EPSQMH)+(1-NYH)*REALPMH^(1-EPSQMH)*(BIGGAMIMPH-COSTH*(MH/AH/(MH(-1)/AH(-1))-1)*MH/AH/(MH(-1)/AH(-1)))^(EPSQMH-1))^(1/(1-EPSQMH)) ;
          BIGGAMIMPH = 1-COSTH/2*(MH/AH/(MH(-1)/AH(-1))-1)^2 ;
          NNH = (1-GAMMAH)*REALPNH^(-EPSH)*AH ;
          NH = NNH+ETAH*MH+ETAH*QH+GNH ;
          PIENH = REALPNH/REALPNH(-1)*PIEH ;
          BIGGAMNH = LILCAPPA3H/2*(PIENH/PIE4TARH^0.25-1)^2+LILCAPPA4H/2*(PIENH/PIENH(-1)-1)^2 ;
          -(1-BIGGAMNH)*(REALPNH*(1-THETAH)+THETAH*REALMCNH) = -(REALPNH-REALMCNH)*(LILCAPPA3H*PIENH/PIE4TARH^0.25*(PIENH/PIE4TARH^0.25-1)+LILCAPPA4H*PIENH/PIENH(-1)*(PIENH/PIENH(-1)-1))+DEEH*PIEH(+1)*(REALPNH(+1)-REALMCNH(+1))*NH(+1)/NH*(LILCAPPA3H*PIENH(+1)/PIE4TARH^0.25*(PIENH(+1)/PIE4TARH^0.25-1)+LILCAPPA4H*PIENH(+1)/PIENH*(PIENH(+1)/PIENH-1)) ;
          PIEBARQH = PIEH*REALPBARQH/REALPBARQH(-1) ;
          BIGGAMQH = LILCAPPA5H/2*(PIEBARQH/PIE4TARH^0.25-1)^2+LILCAPPA6H/2*(PIEBARQH/PIEBARQH(-1)-1)^2 ;
          -(1-BIGGAMQH)*REALPBARQH/REALPQH*(REALPBARQH*(1-THETAH)+ETAH*REALPNH+THETAH*REALMCTH) = -(REALPBARQH-REALMCTH)*(LILCAPPA5H*PIEBARQH/PIE4TARH^0.25*(PIEBARQH/PIE4TARH^0.25-1)+LILCAPPA6H*PIEBARQH/PIEBARQH(-1)*(PIEBARQH/PIEBARQH(-1)-1))+DEEH*PIEH(+1)*(REALPBARQH(+1)-REALMCTH(+1))*QH(+1)/QH*(LILCAPPA5H*PIEBARQH(+1)/PIE4TARH^0.25*(PIEBARQH(+1)/PIE4TARH^0.25-1)+LILCAPPA6H*PIEBARQH(+1)/PIEBARQH*(PIEBARQH(+1)/PIEBARQH-1)) ;
          REALPQH = REALPBARQH+ETAH*REALPNH ;
          KH = KH(-1)*(1-DELTAH)+PSIH(-1)*KH(-1) ;
          PSIH = EYEH/KH-OMEGAH/2*(EYEH/KH-DELTAH*(1+ZEYEH))^2-OMEGA0H/2*(EYEH/KH-EYEH(-1)/KH(-1))^2 ;
          PSIPRIMEH = 1-OMEGAH*(EYEH/KH-DELTAH*(1+ZEYEH))-OMEGA0H*(EYEH/KH-EYEH(-1)/KH(-1)) ;
          1/PSIPRIMEH = DEEH*PIEH(+1)*(REALRH(+1)+1/PSIPRIMEH(+1)*(1-DELTAH+PSIH(+1)*(1-PSIPRIMEH(+1)*EYEH(+1)/(PSIH(+1)*KH(+1))))) ;
          BIGGAMH = LILCAPPA1H/2*(PIEWH/PIE4TARH^0.25-1)^2+LILCAPPA2H/2*(PIEWH/PIEWH(-1)-1)^2 ;
          PIEH*REALWH/REALWH(-1) = PIEWH ;
          REALWH = PHIH*VPRIMEH/MARGUTH*((PHIH-1)*(1-BIGGAMH)+PIEWH*LILCAPPA1H/PIE4TARH^0.25*(PIEWH/PIE4TARH^0.25-1)+PIEWH/PIEWH(-1)*LILCAPPA2H*(PIEWH/PIEWH(-1)-1)-DEEH*PIEWH(+1)*LH(+1)/LH*LILCAPPA1H*PIEWH(+1)/PIE4TARH^0.25*(PIEWH(+1)/PIE4TARH^0.25-1)-DEEH*PIEWH(+1)*LH(+1)/LH*LILCAPPA2H*PIEWH(+1)/(REALWH/REALWH(-1))*(PIEWH(+1)/PIEWH-1))^(-1) ;
          DEEH = BET*MARGUTH(+1)/PIEH(+1)/MARGUTH*(1+SHOPH+SHOPPRIMEH*VELOH)/(1+SHOPH(+1)+SHOPPRIMEH(+1)*VELOH(+1)) ;
          SHOPH = A_ZEROH*VELOH+A_ONEH/VELOH-2*(A_ZEROH*A_ONEH)^0.5 ;
          SHOPPRIMEH = A_ZEROH-A_ONEH*VELOH^(-2) ;
          VELOH = CH/REALMONEYH ;
          DEEH = 1-SHOPPRIMEH*VELOH^2 ;
          1 = RNOMH*DEEH ;
//        100*(RNOMH^4-1) = (1-XDUMH)*100*(RNOM_EXOGH^4-1)+XDUMH*(XR3H*100*(RNOMH(-1)^4-1)+(1-XR3H)*(100*((1/BET*PIE4H^0.25)^4-1)+XR1H/(1-XR3H)*(100*(PIE4H-1)-100*(PIE4TARH-1))+XR4H/(1-XR3H)*100*(DEPEX^4-1)+XR2H/(1-XR3H)*GDPGAPH)) ;

// original policy rule home country (small economy):
//100*(RNOMH^4-1) = (1-XDUMH)*100*(RNOM_EXOGH^4-1)
//+XDUMH*(XR3H*100*(RNOMH(-1)^4-1)
//+(1-XR3H)*(100*((1/BET*PIE4H^0.25)^4-1))
//+XR1H*(100*(PIE4H-1)-100*(PIE4TARH-1))
//+XR4H*100*(DEPEX^4-1)+XR2H*GDPGAPH) ;



          GDPGAPH = 100*(GDPH_NAT-GDPH_EXOG)/GDPH_EXOG ;
          PIE4H = PIEH*PIEH(-1)*PIEH(-2)*PIEH(-3) ;
          AH = CH*(1+SHOPH)+EYEH+GAH ;
          GAH = .05*(GA_RATH*(GLAMBDAH*GDPH_NAT+(1-GLAMBDAH)*GDPH_EXOG))+.95*GAH(-1)+E_GAH;
          GNH = GN_RATH*(GLAMBDAH*GDPH_NAT+(1-GLAMBDAH)*GDPH_EXOG)/REALPNH_EXOG ;
          PIEBARMH = PIEH*REALPBARMH/REALPBARMH(-1) ;
          BIGGAMMH = LILCAPPA7H/2*(PIEBARMH/PIE4TARH^0.25-1)^2+LILCAPPA8H/2*(PIEBARMH/PIEBARMH(-1)-1)^2 ;
          REALPMH = REALPBARMH+ETAH*REALPNH ;
          KNH_RAT = ALPHANH/(1-ALPHANH-GAMA_NH)*(REALWH/REALRH)^XIXI_NH ;
          KTH_RAT = ALPHATH/(1-ALPHATH-GAMA_TH)*(REALWH/REALRH)^XIXI_TH ;
          KNH_RAT = KNH/LNH ;
          KTH_RAT = KTH/LTH ;
          KH = KTH+KNH+K_OH ;
          LH = (LNH+LTH+L_OH)*(1-COSTLH/2*(LNH/(LTH+L_OH)/(LNH(-1)/(LTH(-1)+L_OH(-1)))-1)^2) ;
          T_OH = Z_OH*((1-ALPHA_OH-GAMMA_LANDH)^(1/XIXI_OH)*L_OH^(1-1/XIXI_OH)+ALPHA_OH^(1/XIXI_OH)*K_OH^(1-1/XIXI_OH)+GAMMA_LANDH^(1/XIXI_OH)*LANDH^(1-1/XIXI_OH))^(XIXI_OH/(XIXI_OH-1)) ;
          Q_ONH = NY_NH*(REALP_QOH/REALP_ONH)^(-EPS_ONH)*O_NH ;
          Q_OTH = NY_TH*(REALP_QOH/REALP_OTH)^(-EPS_OTH)*O_TH ;
          M_ONH = (1-NY_NH)*(REALP_MOH/REALP_ONH)^(-EPS_ONH)*O_NH*(BIGGAM_MONH-COST_MONH*(M_ONH/O_NH/(M_ONH(-1)/O_NH(-1))-1)*M_ONH/O_NH/(M_ONH(-1)/O_NH(-1)))^EPS_ONH/BIGGAM_MONH ;
          M_OTH = (1-NY_TH)*(REALP_MOH/REALP_OTH)^(-EPS_OTH)*O_TH*(BIGGAM_MOTH-COST_MOTH*(M_OTH/O_TH/(M_OTH(-1)/O_TH(-1))-1)*M_OTH/O_TH/(M_OTH(-1)/O_TH(-1)))^EPS_OTH/BIGGAM_MOTH ;
          BIGGAM_MONH = 1-COST_MONH/2*(M_ONH/O_NH/(M_ONH(-1)/O_NH(-1))-1)^2 ;
          BIGGAM_MOTH = 1-COST_MOTH/2*(M_OTH/O_TH/(M_OTH(-1)/O_TH(-1))-1)^2 ;
          K_OH_RAT = ALPHA_OH/(1-ALPHA_OH-GAMMA_LANDH)*(REALWH/REALRH)^XIXI_OH ;
          K_OH_RAT = K_OH/L_OH ;
          REALP_QOH = 1/Z_OH*((1-ALPHA_OH-GAMMA_LANDH)*REALWH^(1-XIXI_OH)+ALPHA_OH*REALRH^(1-XIXI_OH)+GAMMA_LANDH*REALPLANDH^(1-XIXI_OH))^(1/(1-XIXI_OH)) ;
          LANDH = GAMMA_LANDH*(REALPLANDH/(REALP_QOH*Z_OH))^(-XIXI_OH)*T_OH/Z_OH ;
          REALP_ONH = (NY_NH*REALP_QOH^(1-EPS_ONH)+(1-NY_NH)*REALP_MOH^(1-EPS_ONH)*(BIGGAM_MONH-COST_MONH*(M_ONH/O_NH/(M_ONH(-1)/O_NH(-1))-1)*M_ONH/O_NH/(M_ONH(-1)/O_NH(-1)))^(EPS_ONH-1))^(1/(1-EPS_ONH)) ;
          REALP_OTH = (NY_TH*REALP_QOH^(1-EPS_OTH)+(1-NY_TH)*REALP_MOH^(1-EPS_OTH)*(BIGGAM_MOTH-COST_MOTH*(M_OTH/O_TH/(M_OTH(-1)/O_TH(-1))-1)*M_OTH/O_TH/(M_OTH(-1)/O_TH(-1)))^(EPS_OTH-1))^(1/(1-EPS_OTH)) ;
          SSH*TH = SSH*QH+SSF*MF ;
          SSH*T_OH = SSH*Q_ONH+SSH*Q_OTH+SSF*M_ONF+SSF*M_OTF ;
          REALP_MOH = REALP_QOF*REALEXH ;
          ZZ_GDP_PPP_RATH = GDPH/REALEX/GDPF ;
          XI = CHI0*(exp(CHI1*REALEX*REALBH)+CHI2*(REALEX*(REALBH-REALBH(-1)/PIEF)/GDPH)^2+CHI3*(REALEX*(REALBH-REALBH(-1)/PIEF)/GDPH-REALEX(-1)*(REALBH(-1)-REALBH(-2)/PIEF(-1))/GDPH(-1))^2-1)/(exp(CHI1*REALEX*REALBH)+CHI2*(REALEX*(REALBH-REALBH(-1)/PIEF)/GDPH)^2+CHI3*(REALEX*(REALBH-REALBH(-1)/PIEF)/GDPH-REALEX(-1)*(REALBH(-1)-REALBH(-2)/PIEF(-1))/GDPH(-1))^2+1)+ZBH ;
          1 = RNOMF*(1-XI)*DEEH*DEPEX(+1) ;
          DEPEX = PIEH/PIEF*REALEX/REALEX(-1) ;
          REALFINH = RNOMF(-1)*(1-XI(-1))*REALEX*REALBH(-1)/PIEF ;
          SSH*DEEH*PIEH(+1)*REALFINH(+1) = SSH*REALFINH+SSH*RNOMF(-1)*XI(-1)*REALEX*REALBH(-1)/PIEF+REALTBALH ;
          REALEXH = REALEX ;
          REALEXF = 1/REALEXH ;
          ZZ_REALEX = 100*log(REALEX) ;
          -(1-BIGGAMMH)*REALPBARMH/REALPMH*(REALPBARMH/REALEX*(1-THETAF)+ETAH*REALPNH/REALEX+THETAF*REALMCTF) = -(REALPBARMH/REALEX-REALMCTF)*(LILCAPPA7H*PIEBARMH/PIE4TARH^0.25*(PIEBARMH/PIE4TARH^0.25-1)+LILCAPPA8H*PIEBARMH/PIEBARMH(-1)*(PIEBARMH/PIEBARMH(-1)-1))+DEEF*PIEF(+1)*(REALPBARMH(+1)/REALEX(+1)-REALMCTF(+1))*MH(+1)/MH*(LILCAPPA7H*PIEBARMH(+1)/PIE4TARH^0.25*(PIEBARMH(+1)/PIE4TARH^0.25-1)+LILCAPPA8H*PIEBARMH(+1)/PIEBARMH*(PIEBARMH(+1)/PIEBARMH-1)) ;
          GDPH = AH+REALPNH*GNH+EXPORTSH-IMPORTSH+(RNOMF(-1)-1)*REALEX*REALBH(-1)/PIEF ;
          GDPH_NAT = AH+REALPNH_EXOG*GNH+EXPORTSH_NAT-IMPORTSH_NAT ;
          CH_NAT = CH*(1+SHOPH) ;
          GH_NAT = GAH+REALPNH_EXOG*GNH ;
          XH_NAT = SSF/SSH*REALEX_EXOG*REALPBARMF_EXOG*MF ;
          MH_NAT = REALPBARMH_EXOG*MH ;
          CURBALH_RAT = REALEX*(REALBH-REALBH(-1)/PIEF)/GDPH ;
          REALTBALH = SSF*(REALPBARMF*MF+REALP_MOF*M_ONF+REALP_MOF*M_OTF)*REALEX-SSH*(REALPBARMH*MH+REALP_MOH*M_ONH+REALP_MOH*M_OTH) ;
          EXPORTSH = SSF/SSH*(REALPBARMF*MF+REALP_MOF*M_ONF+REALP_MOF*M_OTF)*REALEX ;
          IMPORTSH = REALPBARMH*MH+REALP_MOH*M_ONH+REALP_MOH*M_OTH ;
          EXPORTSH_NAT = SSF/SSH*(REALPBARMF_EXOG*MF+REALP_MOF_EXOG*M_ONF+REALP_MOF_EXOG*M_OTF)*REALEX_EXOG ;
          IMPORTSH_NAT = REALPBARMH_EXOG*MH+REALP_MOH_EXOG*M_ONH+REALP_MOH_EXOG*M_OTH ;
          ZZ_UTILITYF = (ZUF*(CF-HF)^(1-SIGMAF)-1)/(1-SIGMAF)-CAPAF*LF^(1+ZEDF)/(1+ZEDF) ;
          ZZ_GF = 100*log(GF_NAT) ;
          ZZ_CURBALF_RAT = CURBALF_RAT*100 ;
          ZZ_M_SHARF = REALPBARMF*MF/AF ;
          ZZ_M_O_SHARF = (REALP_MOF*M_ONF+REALP_MOF*M_OTF)/AF ;
          ZZ_M_ON_SHARF = REALP_MOF*M_ONF/AF ;
          ZZ_M_OT_SHARF = REALP_MOF*M_OTF/AF ;
          ZZ_N_SHARF = NF*REALPNF/AF ;
          ZZ_EYE_SHARF = EYEF/GDPF ;
          ZZ_C_SHARF = CF/GDPF ;
          ZZ_GDPF = 100*log(GDPF_NAT) ;
          ZZ_CF = 100*log(CF_NAT) ;
          ZZ_EYEF = 100*log(EYEF) ;
          ZZ_EXPORTSF = 100*log(EXPORTSF_NAT) ;
          ZZ_IMPORTSF = 100*log(IMPORTSF_NAT) ;
          ZZ_XBALF_TOT_RAT = 100*(EXPORTSF_NAT-IMPORTSF_NAT)/GDPF_NAT ;
          ZZ_PIE4F = 100*(PIE4F-1) ;
          ZZ_DPIE4F = ZZ_PIE4F-ZZ_PIE4F(-1) ;
          ZZ_RNOMF = 100*(RNOMF^4-1) ;
          ZZ_DRNOMF = ZZ_RNOMF-ZZ_RNOMF(-1) ;
          100*(PIE4TARF-1) = 1*100*(PIE4TARF_SS-1)+(1-1)*100*(PIE4TARF(-1)-1)+E_PIE4TARF ;
          log(ZUF) = 0.3*log(ZUF_SS)+0.7*log(ZUF(-1))+E_ZUF ;
          ZBF = 0.3*ZBF_SS+0.7*ZBF(-1)+E_ZBF ;
          log(LANDF) = 0.05*log(LANDF_SS)+0.95*log(LANDF(-1))+E_LANDF ;
          log(ZTF) = 0.05*log(ZTF_SS)+0.95*log(ZTF(-1))+E_LANDF ;
          log(ZNF) = 0.05*log(ZNF_SS)+0.95*log(ZNF(-1))+E_LANDF ;
          log(Z_OF) = 0.05*log(Z_OF_SS)+0.95*log(Z_OF(-1))+E_LANDF ;
          ZEYEF = 0.05*ZEYEF_SS+0.95*ZEYEF(-1)+E_ZEYEF ;
          CAPAF = 0.05*CAPAF_SS+0.95*CAPAF(-1)+E_CAPAF ;
          log(GAMMAF) = 0.05*log(GAMMAF_SS)+0.95*log(GAMMAF(-1))+E_GAMMAF ;
          BIGGAM_O_NF = 1-COST_O_NF/2*(O_NF/NF/(O_NF(-1)/NF(-1))-1)^2 ;
          BIGGAM_O_TF = 1-COST_O_TF/2*(O_TF/TF/(O_TF(-1)/TF(-1))-1)^2 ;
          O_NF = GAMA_NF*NF/ZNF*(REALP_ONF/(REALMCNF*ZNF))^(-XIXI_NF)*(BIGGAM_O_NF-COST_O_NF*(O_NF/NF/(O_NF(-1)/NF(-1))-1)*O_NF/NF/(O_NF(-1)/NF(-1)))^XIXI_NF/BIGGAM_O_NF ;
          O_TF = GAMA_TF*TF/ZTF*(REALP_OTF/(REALMCTF*ZTF))^(-XIXI_TF)*(BIGGAM_O_TF-COST_O_TF*(O_TF/TF/(O_TF(-1)/TF(-1))-1)*O_TF/TF/(O_TF(-1)/TF(-1)))^XIXI_NF/BIGGAM_O_TF ;
          NF = ZNF*((1-ALPHANF-GAMA_NF)^(1/XIXI_NF)*LNF^(1-1/XIXI_NF)+ALPHANF^(1/XIXI_NF)*KNF^(1-1/XIXI_NF)+GAMA_NF^(1/XIXI_NF)*(BIGGAM_O_NF*O_NF)^(1-1/XIXI_NF))^(XIXI_NF/(XIXI_NF-1)) ;
          TF = ZTF*((1-ALPHATF-GAMA_TF)^(1/XIXI_TF)*LTF^(1-1/XIXI_TF)+ALPHATF^(1/XIXI_TF)*KTF^(1-1/XIXI_TF)+GAMA_TF^(1/XIXI_TF)*(BIGGAM_O_TF*O_TF)^(1-1/XIXI_TF))^(XIXI_TF/(XIXI_TF-1)) ;
          REALMCNF = 1/ZNF*((1-ALPHANF-GAMA_NF)*REALWF^(1-XIXI_NF)+ALPHANF*REALRF^(1-XIXI_NF)+GAMA_NF*REALP_ONF^(1-XIXI_NF)*(BIGGAM_O_NF-COST_O_NF*(O_NF/NF/(O_NF(-1)/NF(-1))-1)*O_NF/NF/(O_NF(-1)/NF(-1)))^(XIXI_NF-1))^(1/(1-XIXI_NF)) ;
          REALMCTF = 1/ZTF*((1-ALPHATF-GAMA_TF)*REALWF^(1-XIXI_TF)+ALPHATF*REALRF^(1-XIXI_TF)+GAMA_TF*REALP_OTF^(1-XIXI_TF)*(BIGGAM_O_TF-COST_O_TF*(O_TF/TF/(O_TF(-1)/TF(-1))-1)*O_TF/TF/(O_TF(-1)/TF(-1)))^(XIXI_TF-1))^(1/(1-XIXI_TF)) ;
          MARGUTF = (CF-B2F*HF)^(-SIGMAF)*ZUF ;
          HF = (1-B0F)*HF(-1)+B0F*B1F*CF(-1) ;
          VPRIMEF = CAPAF*LF^ZEDF ;
          AF^(1-1/EPSF) = GAMMAF^(1/EPSF)*(NYF^(1/EPSQMF)*QF^(1-1/EPSQMF)+(1-NYF)^(1/EPSQMF)*(MF*BIGGAMIMPF)^(1-1/EPSQMF))^(EPSQMF/(EPSQMF-1)*(1-1/EPSF))+(1-GAMMAF)^(1/EPSF)*NNF^(1-1/EPSF) ;
          QF = GAMMAF*NYF*REALPQF^(-EPSQMF)*AF*REALPXF^(EPSQMF-EPSF) ;
          MF = GAMMAF*(1-NYF)*REALPMF^(-EPSQMF)*AF*REALPXF^(EPSQMF-EPSF)*1/BIGGAMIMPF*(BIGGAMIMPF-COSTF*(MF/AF/(MF(-1)/AF(-1))-1)*MF/AF/(MF(-1)/AF(-1)))^EPSQMF ;
          REALPXF = (NYF*REALPQF^(1-EPSQMF)+(1-NYF)*REALPMF^(1-EPSQMF)*(BIGGAMIMPF-COSTF*(MF/AF/(MF(-1)/AF(-1))-1)*MF/AF/(MF(-1)/AF(-1)))^(EPSQMF-1))^(1/(1-EPSQMF)) ;
          BIGGAMIMPF = 1-COSTF/2*(MF/AF/(MF(-1)/AF(-1))-1)^2 ;
          NNF = (1-GAMMAF)*REALPNF^(-EPSF)*AF ;
          NF = NNF+ETAF*MF+ETAF*QF+GNF ;
          PIENF = REALPNF/REALPNF(-1)*PIEF ;
          BIGGAMNF = LILCAPPA3F/2*(PIENF/PIE4TARF^0.25-1)^2+LILCAPPA4F/2*(PIENF/PIENF(-1)-1)^2 ;
          -(1-BIGGAMNF)*(REALPNF*(1-THETAF)+THETAF*REALMCNF) = -(REALPNF-REALMCNF)*(LILCAPPA3F*PIENF/PIE4TARF^0.25*(PIENF/PIE4TARF^0.25-1)+LILCAPPA4F*PIENF/PIENF(-1)*(PIENF/PIENF(-1)-1))+DEEF*PIEF(+1)*(REALPNF(+1)-REALMCNF(+1))*NF(+1)/NF*(LILCAPPA3F*PIENF(+1)/PIE4TARF^0.25*(PIENF(+1)/PIE4TARF^0.25-1)+LILCAPPA4F*PIENF(+1)/PIENF*(PIENF(+1)/PIENF-1)) ;
          PIEBARQF = PIEF*REALPBARQF/REALPBARQF(-1) ;
          BIGGAMQF = LILCAPPA5F/2*(PIEBARQF/PIE4TARF^0.25-1)^2+LILCAPPA6F/2*(PIEBARQF/PIEBARQF(-1)-1)^2 ;
          -(1-BIGGAMQF)*REALPBARQF/REALPQF*(REALPBARQF*(1-THETAF)+ETAF*REALPNF+THETAF*REALMCTF) = -(REALPBARQF-REALMCTF)*(LILCAPPA5F*PIEBARQF/PIE4TARF^0.25*(PIEBARQF/PIE4TARF^0.25-1)+LILCAPPA6F*PIEBARQF/PIEBARQF(-1)*(PIEBARQF/PIEBARQF(-1)-1))+DEEF*PIEF(+1)*(REALPBARQF(+1)-REALMCTF(+1))*QF(+1)/QF*(LILCAPPA5F*PIEBARQF(+1)/PIE4TARF^0.25*(PIEBARQF(+1)/PIE4TARF^0.25-1)+LILCAPPA6F*PIEBARQF(+1)/PIEBARQF*(PIEBARQF(+1)/PIEBARQF-1)) ;
          REALPQF = REALPBARQF+ETAF*REALPNF ;
          KF = KF(-1)*(1-DELTAF)+PSIF(-1)*KF(-1) ;
          PSIF = EYEF/KF-OMEGAF/2*(EYEF/KF-DELTAF*(1+ZEYEF))^2-OMEGA0F/2*(EYEF/KF-EYEF(-1)/KF(-1))^2 ;
          PSIPRIMEF = 1-OMEGAF*(EYEF/KF-DELTAF*(1+ZEYEF))-OMEGA0F*(EYEF/KF-EYEF(-1)/KF(-1)) ;
          1/PSIPRIMEF = DEEF*PIEF(+1)*(REALRF(+1)+1/PSIPRIMEF(+1)*(1-DELTAF+PSIF(+1)*(1-PSIPRIMEF(+1)*EYEF(+1)/(PSIF(+1)*KF(+1))))) ;
          BIGGAMF = LILCAPPA1F/2*(PIEWF/PIE4TARF^0.25-1)^2+LILCAPPA2F/2*(PIEWF/PIEWF(-1)-1)^2 ;
          PIEF*REALWF/REALWF(-1) = PIEWF ;
          REALWF = PHIF*VPRIMEF/MARGUTF*((PHIF-1)*(1-BIGGAMF)+PIEWF*LILCAPPA1F/PIE4TARF^0.25*(PIEWF/PIE4TARF^0.25-1)+PIEWF/PIEWF(-1)*LILCAPPA2F*(PIEWF/PIEWF(-1)-1)-DEEF*PIEWF(+1)*LF(+1)/LF*LILCAPPA1F*PIEWF(+1)/PIE4TARF^0.25*(PIEWF(+1)/PIE4TARF^0.25-1)-DEEF*PIEWF(+1)*LF(+1)/LF*LILCAPPA2F*PIEWF(+1)/(REALWF/REALWF(-1))*(PIEWF(+1)/PIEWF-1))^(-1) ;
          DEEF = BET*MARGUTF(+1)/PIEF(+1)/MARGUTF*(1+SHOPF+SHOPPRIMEF*VELOF)/(1+SHOPF(+1)+SHOPPRIMEF(+1)*VELOF(+1)) ;
          SHOPF = A_ZEROF*VELOF+A_ONEF/VELOF-2*(A_ZEROF*A_ONEF)^0.5 ;
          SHOPPRIMEF = A_ZEROF-A_ONEF*VELOF^(-2) ;
          VELOF = CF/REALMONEYF ;
          DEEF = 1-SHOPPRIMEF*VELOF^2 ;
          1 = RNOMF*DEEF ;

// original policy rule foreign country
//          100*(RNOMF^4-1) = (1-XDUMF)*100*(RNOM_EXOGF^4-1)+XDUMF*(XR3F*100*(RNOMF(-1)^4-1)+(1-XR3F)*(100*((1/BET*PIE4F^0.25)^4-1)+XR1F*(100*(PIE4F-1)-100*(PIE4TARF-1))+XR4F*100*(DEPEX^4-1)+XR2F*GDPGAPF)) ;


          GDPGAPF = 1*(GDPF_NAT-GDPF_EXOG)/GDPF_EXOG ;
          PIE4F = PIEF*PIEF(-1)*PIEF(-2)*PIEF(-3) ;
          AF = CF*(1+SHOPF)+EYEF+GAF ;
          GAF = .05*(GA_RATF*(GLAMBDAF*GDPF_NAT+(1-GLAMBDAF)*GDPF_EXOG))+.95*GAF(-1)+E_GAF;
          GNF = GN_RATF*(GLAMBDAF*GDPF_NAT+(1-GLAMBDAF)*GDPF_EXOG)/REALPNF_EXOG ;
          PIEBARMF = PIEF*REALPBARMF/REALPBARMF(-1) ;
          BIGGAMMF = LILCAPPA7F/2*(PIEBARMF/PIE4TARF^0.25-1)^2+LILCAPPA8F/2*(PIEBARMF/PIEBARMF(-1)-1)^2 ;
          REALPMF = REALPBARMF+ETAF*REALPNF ;
          KNF_RAT = ALPHANF/(1-ALPHANF-GAMA_NF)*(REALWF/REALRF)^XIXI_NF ;
          KTF_RAT = ALPHATF/(1-ALPHATF-GAMA_TF)*(REALWF/REALRF)^XIXI_TF ;
          KNF_RAT = KNF/LNF ;
          KTF_RAT = KTF/LTF ;
          KF = KTF+KNF+K_OF ;
          LF = (LNF+LTF+L_OF)*(1-COSTLF/2*(LNF/(LTF+L_OF)/(LNF(-1)/(LTF(-1)+L_OF(-1)))-1)^2) ;
          T_OF = Z_OF*((1-ALPHA_OF-GAMMA_LANDF)^(1/XIXI_OF)*L_OF^(1-1/XIXI_OF)+ALPHA_OF^(1/XIXI_OF)*K_OF^(1-1/XIXI_OF)+GAMMA_LANDF^(1/XIXI_OF)*LANDF^(1-1/XIXI_OF))^(XIXI_OF/(XIXI_OF-1)) ;
          Q_ONF = NY_NF*(REALP_QOF/REALP_ONF)^(-EPS_ONF)*O_NF ;
          Q_OTF = NY_TF*(REALP_QOF/REALP_OTF)^(-EPS_OTF)*O_TF ;
          M_ONF = (1-NY_NF)*(REALP_MOF/REALP_ONF)^(-EPS_ONF)*O_NF*(BIGGAM_MONF-COST_MONF*(M_ONF/O_NF/(M_ONF(-1)/O_NF(-1))-1)*M_ONF/O_NF/(M_ONF(-1)/O_NF(-1)))^EPS_ONF/BIGGAM_MONF ;
          M_OTF = (1-NY_TF)*(REALP_MOF/REALP_OTF)^(-EPS_OTF)*O_TF*(BIGGAM_MOTF-COST_MOTF*(M_OTF/O_TF/(M_OTF(-1)/O_TF(-1))-1)*M_OTF/O_TF/(M_OTF(-1)/O_TF(-1)))^EPS_OTF/BIGGAM_MOTF ;
          BIGGAM_MONF = 1-COST_MONF/2*(M_ONF/O_NF/(M_ONF(-1)/O_NF(-1))-1)^2 ;
          BIGGAM_MOTF = 1-COST_MOTF/2*(M_OTF/O_TF/(M_OTF(-1)/O_TF(-1))-1)^2 ;
          K_OF_RAT = ALPHA_OF/(1-ALPHA_OF-GAMMA_LANDF)*(REALWF/REALRF)^XIXI_OF ;
          K_OF_RAT = K_OF/L_OF ;
          REALP_QOF = 1/Z_OF*((1-ALPHA_OF-GAMMA_LANDF)*REALWF^(1-XIXI_OF)+ALPHA_OF*REALRF^(1-XIXI_OF)+GAMMA_LANDF*REALPLANDF^(1-XIXI_OF))^(1/(1-XIXI_OF)) ;
          LANDF = GAMMA_LANDF*(REALPLANDF/(REALP_QOF*Z_OF))^(-XIXI_OF)*T_OF/Z_OF ;
          REALP_ONF = (NY_NF*REALP_QOF^(1-EPS_ONF)+(1-NY_NF)*REALP_MOF^(1-EPS_ONF)*(BIGGAM_MONF-COST_MONF*(M_ONF/O_NF/(M_ONF(-1)/O_NF(-1))-1)*M_ONF/O_NF/(M_ONF(-1)/O_NF(-1)))^(EPS_ONF-1))^(1/(1-EPS_ONF)) ;
          REALP_OTF = (NY_TF*REALP_QOF^(1-EPS_OTF)+(1-NY_TF)*REALP_MOF^(1-EPS_OTF)*(BIGGAM_MOTF-COST_MOTF*(M_OTF/O_TF/(M_OTF(-1)/O_TF(-1))-1)*M_OTF/O_TF/(M_OTF(-1)/O_TF(-1)))^(EPS_OTF-1))^(1/(1-EPS_OTF)) ;
          SSF*TF = SSF*QF+SSH*MH ;
          SSF*T_OF = SSF*Q_ONF+SSF*Q_OTF+SSH*M_ONH+SSH*M_OTH ;
          REALP_MOF = REALP_QOH*REALEXF ;
          SSH*REALBH+SSF*REALBF = 0 ;
          REALTBALF = SSF*(REALPBARMF*MF+REALP_MOF*M_ONF+REALP_MOF*M_OTF)-SSH*(REALPBARMH*MH+REALP_MOH*M_ONH+REALP_MOH*M_OTH)*1/REALEX ;
          EXPORTSF = SSH/SSF*(REALPBARMH*MH+REALP_MOH*M_ONH+REALP_MOH*M_OTH)*1/REALEX ;
          IMPORTSF = REALPBARMF*MF+REALP_MOF*M_ONF+REALP_MOF*M_OTF ;
          EXPORTSF_NAT = SSH/SSF*(REALPBARMH_EXOG*MH+REALP_MOH_EXOG*M_ONH+REALP_MOH_EXOG*M_OTH)*1/REALEX_EXOG ;
          IMPORTSF_NAT = REALPBARMF_EXOG*MF+REALP_MOF_EXOG*M_ONF+REALP_MOF_EXOG*M_OTF ;
          -(1-BIGGAMMF)*REALPBARMF/REALPMF*(REALPBARMF*REALEX*(1-THETAH)+ETAF*REALPNF*REALEX+THETAH*REALMCTH) = -(REALPBARMF*REALEX-REALMCTH)*(LILCAPPA7F*PIEBARMF/PIE4TARF^0.25*(PIEBARMF/PIE4TARF^0.25-1)+LILCAPPA8F*PIEBARMF/PIEBARMF(-1)*(PIEBARMF/PIEBARMF(-1)-1))+DEEH*PIEH(+1)*(REALPBARMF(+1)*REALEX(+1)-REALMCTH(+1))*MF(+1)/MF*(LILCAPPA7F*PIEBARMF(+1)/PIE4TARF^0.25*(PIEBARMF(+1)/PIE4TARF^0.25-1)+LILCAPPA8F*PIEBARMF(+1)/PIEBARMF*(PIEBARMF(+1)/PIEBARMF-1)) ;
          GDPF = AF+REALPNF*GNF+EXPORTSF-IMPORTSF+(RNOMF(-1)-1)*REALBF(-1)/PIEF ;
          GDPF_NAT = AF+REALPNF_EXOG*GNF+EXPORTSF_NAT-IMPORTSF_NAT ;
          CF_NAT = CF*(1+SHOPF) ;
          GF_NAT = GAF+REALPNF_EXOG*GNF ;
          XF_NAT = SSH/SSF*1/REALEX_EXOG*REALPBARMH_EXOG*MH ;
          MF_NAT = REALPBARMF_EXOG*MF ;
          CURBALF_RAT = -(REALTBALH/REALEX/SSF/GDPF)+(RNOMF(-1)-1)*REALBF(-1)/PIEF/GDPF ;
end;

initval;
AF=2.17350447531715;
AH=2.61461230039988;
BIGGAMF=0;
BIGGAMH=0;
BIGGAMIMPF=1;
BIGGAMIMPH=1;
BIGGAMMF=0;
BIGGAMMH=0;
BIGGAMNF=0;
BIGGAMNH=0;
BIGGAMQF=0;
BIGGAMQH=0;
BIGGAM_MONF=1;
BIGGAM_MONH=1;
BIGGAM_MOTF=1;
BIGGAM_MOTH=1;
BIGGAM_O_NF=1;
BIGGAM_O_NH=1;
BIGGAM_O_TF=1;
BIGGAM_O_TH=1;
CAPAF=11;
CAPAH=11;
CF=1.77599320017707;
CF_NAT=1.77797456682707;
CH=2.10139281352027;
CH_NAT=2.10373720855446;
CURBALF_RAT=2.20209042676066e-018;
CURBALH_RAT=0;
DEEF=0.963834712172592;
DEEH=0.963834712172592;
DEPEX=1;
EXPORTSF=0.0374229290542059;
EXPORTSF_NAT=0.0374229290542059;
EXPORTSH=0.976573287861717;
EXPORTSH_NAT=0.976573287861717;
EYEF=0.27477965986135;
EYEH=0.365618852934316;
GAF=0.12075024862873;
GAH=0.145256238911104;
GAMMAF=0.5;
GAMMAH=0.25;
GDPF=2.41500497257461;
GDPF_NAT=2.41500497257461;
GDPGAPF=0;
GDPGAPH=0;
GDPH=2.90512477822209;
GDPH_NAT=2.90512477822209;
GF_NAT=0.362250745886191;
GH_NAT=0.435768716733313;
GNF=0.287269571519256;
GNH=0.321902361090147;
HF=1.68719354016822;
HH=1.99632317284426;
IMPORTSF=0.0374229290542059;
IMPORTSF_NAT=0.0374229290542059;
IMPORTSH=0.976573287861718;
IMPORTSH_NAT=0.976573287861718;
KF=10.991186394454;
KH=14.6247541173726;
KNF=6.33686501417153;
KNF_RAT=22.6981730731029;
KNH=11.034700665508;
KNH_RAT=22.8755992006951;
KTF=2.97137434524903;
KTF_RAT=22.6981730731029;
KTH=2.23720856941572;
KTH_RAT=114.377996003476;
K_OF=1.68294703503345;
K_OF_RAT=7.27127622255245;
K_OH=1.35284488244891;
K_OH_RAT=8.16985685739111;
LANDF=0.1;
LANDH=0.1;
LF=0.64153899810027;
LH=0.667528221502678;
LNF=0.279179517830034;
LNH=0.482378650224502;
LTF=0.130908083909629;
LTH=0.019559781143112;
L_OF=0.231451396360608;
L_OH=0.165589790135064;
MARGUTF=2.24145263303312;
MARGUTH=2.11921125101343;
MF=0.0196445696804563;
MF_NAT=0.0171196449669319;
MH=0.438784845846124;
MH_NAT=0.522472906750236;
M_ONF=0.0143006671963624;
M_ONH=0.134410532365428;
M_OTF=0.00670562423725087;
M_OTH=0.143002828997546;
NF=1.91582345366461;
NH=2.609674642079;
NNF=1.31534385473198;
NNH=2.19524942542191;
O_NF=0.387338325509274;
O_NH=0.147043832240678;
O_TF=0.18162406186278;
O_TH=0.148205762233076;
PIE4F=1.125;
PIE4H=1.125;
PIE4TARF=1.125;
PIE4TARH=1.125;
PIEBARMF=1.02988357195356;
PIEBARMH=1.02988357195356;
PIEBARQF=1.02988357195356;
PIEBARQH=1.02988357195356;
PIEF=1.02988357195356;
PIEH=1.02988357195356;
PIENF=1.02988357195356;
PIENH=1.02988357195356;
PIEWF=1.02988357195356;
PIEWH=1.02988357195356;
PSIF=0.025;
PSIH=0.025;
PSIPRIMEF=1;
PSIPRIMEH=1;
QF=0.875241222929181;
QH=0.0238294319885835;
Q_ONF=0.373740369418894;
Q_ONH=0.0132636199615755;
Q_OTF=0.175247940896905;
Q_OTH=0.00547180886242481;
REALBF=0;
REALBH=0;
REALEX=1.3734519289908;
REALEXF=0.728092464608345;
REALEXH=1.3734519289908;
REALFINH=0;
REALMCNF=0.700562935771035;
REALMCNH=0.752071934789911;
REALMCTF=0.700562935771035;
REALMCTH=0.930081384894704;
REALMONEYF=0.558667031035572;
REALMONEYH=0.661026677383566;
REALPBARMF=0.87146958398196;
REALPBARMH=1.19072687148694;
REALPBARQF=0.899522809530009;
REALPBARQH=1.15219711474356;
REALPLANDF=0.554831427212494;
REALPLANDH=0.414697221827051;
REALPMF=1.16570601700579;
REALPMH=1.37122413583652;
REALPNF=0.840675522925242;
REALPNH=0.902486321747893;
REALPQF=1.19375924255384;
REALPQH=1.33269437909314;
REALPXF=1.19317131724075;
REALPXH=1.36926881180313;
REALP_MOF=0.966533486000563;
REALP_MOH=1.63690883121281;
REALP_ONF=1.18566549908199;
REALP_ONH=1.61601524261254;
REALP_OTF=1.18566549908199;
REALP_OTH=1.62845456685201;
REALP_QOF=1.1918209852569;
REALP_QOH=1.32748728078168;
REALRF=0.0324170717777328;
REALRH=0.0324170717777329;
REALTBALF=-6.93889390390723e-018;
REALTBALH=-6.93889390390723e-018;
REALWF=2.42667732699502;
REALWH=2.83454771236558;
RNOMF=1.03752229232945;
RNOMH=1.03752229232945;
SHOPF=0.00111563864647424;
SHOPH=0.00111563864647424;
SHOPPRIMEF=0.00357861859467432;
SHOPPRIMEH=0.00357861859467432;
TF=0.89833516218424;
TH=0.397076255917254;
T_OF=0.563589013545429;
T_OH=0.417854966062653;
VELOF=3.17898336847443;
VELOH=3.17898336847443;
VPRIMEF=3.62618818940983;
VPRIMEH=4.00467026905301;
XF_NAT=0.0200215045456245;
XH_NAT=0.446747178665936;
XI=0;
ZBF=0;
ZBH=0;
ZEYEF=0;
ZEYEH=0;
ZNF=1;
ZNH=1;
ZTF=1;
ZTH=0.6;
ZUF=1;
ZUH=1;
ZZ_CF=57.5474832617676;
ZZ_CH=74.3715386197541;
ZZ_CURBALF_RAT=2.20209042676066e-016;
ZZ_CURBALH_RAT=0;
ZZ_C_SHARF=0.735399396831762;
ZZ_C_SHARH=0.723339950584259;
ZZ_DPIE4F=0;
ZZ_DPIE4H=0;
ZZ_DRNOMF=0;
ZZ_DRNOMH=0;
ZZ_EXPORTSF=-328.547168610049;
ZZ_EXPORTSH=-2.37054799079326;
ZZ_EYEF=-129.17857393452;
ZZ_EYEH=-100.616387362469;
ZZ_EYE_SHARF=0.113780163180538;
ZZ_EYE_SHARH=0.12585306341233;
ZZ_GDPF=88.1701346139521;
ZZ_GDPH=106.647634229781;
ZZ_GDP_PPP_RATH=0.875857186130553;
ZZ_GF=-101.541863874636;
ZZ_GH=-83.0643642588075;
ZZ_IMPORTSF=-328.547168610049;
ZZ_IMPORTSH=-2.37054799079323;
ZZ_M_ON_SHARF=0.0063593490946998;
ZZ_M_ON_SHARH=0.084149297164759;
ZZ_M_OT_SHARF=0.00298191719568198;
ZZ_M_OT_SHARH=0.0895286056899133;
ZZ_M_O_SHARF=0.00934126629038178;
ZZ_M_O_SHARH=0.173677902854672;
ZZ_M_SHARF=0.00787651700806085;
ZZ_M_SHARH=0.19982806118916;
ZZ_N_SHARF=0.741008772713445;
ZZ_N_SHARH=0.90078198910348;
ZZ_PIE4F=12.5;
ZZ_PIE4H=12.5;
ZZ_REALEX=31.7327227026121;
ZZ_RNOMF=15.8749999999999;
ZZ_RNOMH=15.8749999999999;
ZZ_UTILITYF=-1.86610854895021;
ZZ_UTILITYH=-1.9297829736965;
ZZ_XBALF_TOT_RAT=0;
ZZ_XBALH_TOT_RAT=-7.6432037132987e-015;
Z_OF=1;
Z_OH=1;

E_ZBH=0;

E_ZUH=0;
E_ZUF=0;

E_ZEYEH=0;
E_ZEYEF=0;

E_GAMMAH=0;
E_GAMMAF=0;

E_LANDH=0;
E_LANDF=0;

fiscal_ = 0;
E_GAF = 0;

E_CAPAH=0;
E_CAPAF=0;


interest    = 0;
inflation  = 0;
outputgap  = 0;
end;

shocks;

var E_GAMMAF; // Preference shifter Foreign
stderr 0.018;

var E_GAMMAH; // Preference shifter Home
stderr 0.02;
//stderr 0;

var E_LANDF; // Productivity Foreign
stderr 0.0001;
var E_LANDH; // Productivity Home
stderr 0.0020;
//stderr 0;

var E_ZBH;  // Risk Premium Home
stderr 0.017;
//stderr 0;

var E_ZEYEF; // Investment Depreciation Rate Foreign
stderr .005;
var E_ZEYEH; // Investment Depreciation Rate Home
stderr 0.07;
//stderr 0;

var E_ZUF; // Marginal Utility of Consumption Foreign
stderr .001;

var E_ZUH;// Marginal Utility of Consumption Home
stderr 0.004;
//stderr 0;

var E_GAH;// Government absorption/GDP Home
stderr .0035;
//stderr 0;

//var E_GAF;// Government absorption/GDP Foreign (orig. code)
//stderr .00075;

var fiscal_;// Government absorption/GDP Foreign
stderr .00075;

var E_CAPAH;// Marginal Disutility of Labor Home
stderr .1;
//stderr 0;

var E_CAPAF;// Marginal Disutility of Labor Foreign
stderr .01;

var interest_;// Interest Rate Shock (Added by model base to original code)
stderr 0;
end;



