//**************************************************************************
// A New Comparative Approach to Macroeconomic Modeling and Policy Analysis
//
// Volker Wieland, Tobias Cwik, Gernot J. Mueller, Sebastian Schmidt and 
// Maik Wolters
//
// Working Paper, 2009
//**************************************************************************

//**************************************************************************
// Oil supply shocks and the U.S. economy: An estimated DSGE model
//
// Balke, N., Brown, S. (2018)
//
// Energy Policy, Volume 116, Pages 357-372
//**************************************************************************

// Model: US_BB18

var 
    l                //1.  total labor supply
    c                //2.  total consumption services
    cn               //3.  nondurable and services
    ksc              //4.  capital services in consumption
    ec               //5.  oil efficiecy/intensity in consumption
    oc               //6.  oil consumption in consumption
    kc               //7.  stock of capital (autos) in consumption
    Ic               //8. investment in consumer durables (autos)
    xec              //9. investment in energy efficiency
    yf               //10. output of the final good
    ym               //11. intermediate good output/input
    zm               //12. intermediate good productivity shock
    lm               //13. labor input in intermediate good
    ksm              //14. capital services input in intermediate good
    km               //15. capital stock input in capital services of intermediate good
    Im               //16. investment in intermediate good capital
    om               //17. oil input in intermediate good
    em               //18. oil efficiency/intensity in intermediate good
    xem              //19. investment in oil efficiency intermediate goods
    transf           //20. transportation output/input in production of final good
    ztransf          //21. transportation productivity shock
    lf               //22. labor input in intermediate good
    ksf              //23. capital services input in intermediate good
    kf               //24. capital stock input in capital services of intermediate good
    If               //25. investment in intermediate good capital
    of               //26. oil input in intermediate good
    ef               //27. oil efficiency/intensity in intermediate good
    xef              //28. investment in oil efficiency intermediate goods
    yo               //29. oil production
    zo               //30. oil productivity shock
    lo               //31. labor input in oil
    ko               //32. capital stock input in capital services of oil
    Io               //33. investment in oil capital
    pif              //34. inflation in price of final good
    pm               //35. price of intermediate good
    po               //36. price of oil
    prow             //37. price of foreign final good (in domestic currency)
    rm               //38. price of capital services in intermediate good
    w                //39. wage rate
    lambdac          //40. shadow price of consumption services
    lambdal          //41. shadow price of labor services
    lambdaksc        //42. shadow price capital services for consumption
    lambdakc         //43. shadow price of capital (durables) for consumption
    lambdaec         //44. shadow price of oil efficiency/intensity in consumption
    lambdam          //45. marginal cost of intermediate goods producers
    lambdakm         //46. shadow price of capital for intermediate goods
    lambdaem         //47. shadow price of oil efficiency/intensity in intermediate goods
    lambdakf         //48. shadow price of capital for transportation
    lambdaef         //49. shadow price of oil efficiency/intensity in transportation
    lambdako         //50. shadow price of capital for oil
    M                //51. stochastic discout factor
    h                //52. external habits 
    netexpf          //53. net exports of domestic final good to ROW
    importo          //54. domestic oil imports
    rowsupply        //55. ROW oil supply
    rowdemand        //56. ROW oil demand
    zoil             //57. ROW oil supply shock
    rowgdp           //58. ROW economic activity6
    zdoil            //59. oil demand shock variable
    zrowgdp          //60. shock to row economic activity
    znetexpf         //61. shock to net exports of final good
    mkshock          //62. shock to price markup
    zc               //63. shock to consumption
    R                //64
    zprow            //65
    wf               //66   
    wm               //67
    wo               //68
    g                //69
    zI               //70
    zpermoil         //71
    zrisk            //72

//auxiliary variables

    yfout            //73
    cout             //74
    Iout             //75
    poout            //76
    lout             //77
    usoilprod        //78
    oilimports       //79
    rer              //80
    worldoil    	 //81
    transinvest 	 //82  
    oil_in_c         //83
    oiltrans 	     //84
    netexports       //85
    ROW_y            //86
    int_rate         //87
    pi               //88
    gout             //89
    oilexpend        //90
    usoilcons        //91

// additional variable for sticky wage/price model

    pim                   //92
    lambdatransf          //93
    zksc                  //94
    zksf                  //95 
    zksm                  //96 
    zkso                  //97 
    zf                    //98
    pifstar               //99

//***FLEX***
    l_flex                //1.  total labor supply
    c_flex                //2.  total consumption services
    cn_flex               //3.  nondurable and services
    ksc_flex              //4.  capital services in consumption
    ec_flex               //5.  oil efficiecy/intensity in consumption
    oc_flex               //6.  oil consumption in consumption
    kc_flex               //7.  stock of capital (autos) in consumption
    Ic_flex               //8. investment in consumer durables (autos)
    xec_flex              //9. investment in energy efficiency
    yf_flex               //10. output of the final good
    ym_flex               //11. intermediate good output/input
    zm_flex               //12. intermediate good productivity shock
    lm_flex               //13. labor input in intermediate good
    ksm_flex              //14. capital services input in intermediate good
    km_flex               //15. capital stock input in capital services of intermediate good
    Im_flex               //16. investment in intermediate good capital
    om_flex               //17. oil input in intermediate good
    em_flex               //18. oil efficiency/intensity in intermediate good
    xem_flex              //19. investment in oil efficiency intermediate goods
    transf_flex           //20. transportation output/input in production of final good
    ztransf_flex          //21. transportation productivity shock
    lf_flex               //22. labor input in intermediate good
    ksf_flex              //23. capital services input in intermediate good
    kf_flex               //24. capital stock input in capital services of intermediate good
    If_flex               //25. investment in intermediate good capital
    of_flex               //26. oil input in intermediate good
    ef_flex               //27. oil efficiency/intensity in intermediate good
    xef_flex              //28. investment in oil efficiency intermediate goods
    yo_flex               //29. oil production
    zo_flex               //30. oil productivity shock
    lo_flex               //31. labor input in oil
    ko_flex               //32. capital stock input in capital services of oil
    Io_flex               //33. investment in oil capital
    pif_flex              //34. inflation in price of final good
    pm_flex               //35. price of intermediate good
    po_flex               //36. price of oil
    prow_flex             //37. price of foreign final good (in domestic currency)
    rm_flex               //38. price of capital services in intermediate good
    w_flex                //39. wage rate
    lambdac_flex          //40. shadow price of consumption services
    lambdal_flex          //41. shadow price of labor services
    lambdaksc_flex        //42. shadow price capital services for consumption
    lambdakc_flex         //43. shadow price of capital (durables) for consumption
    lambdaec_flex         //44. shadow price of oil efficiency/intensity in consumption
    lambdam_flex          //45. marginal cost of intermediate goods producers
    lambdakm_flex         //46. shadow price of capital for intermediate goods
    lambdaem_flex         //47. shadow price of oil efficiency/intensity in intermediate goods
    lambdakf_flex         //48. shadow price of capital for transportation
    lambdaef_flex         //49. shadow price of oil efficiency/intensity in transportation
    lambdako_flex         //50. shadow price of capital for oil
    M_flex                //51. stochastic discout factor
    h_flex                //52. external habits
    netexpf_flex          //53. net exports of domestic final good to ROW
    importo_flex          //54. domestic oil imports
    rowsupply_flex        //55. ROW oil supply
    rowdemand_flex        //56. ROW oil demand
    zoil_flex             //57. ROW oil supply shock
    rowgdp_flex           //58. ROW economic activity
    zdoil_flex            //59. oil demand shock variable
    zrowgdp_flex          //60. shock to row economic activity
    znetexpf_flex         //61. shock to net exports of final good
    mkshock_flex          //62. shock to price markup
    zc_flex               //63. shock to consumption
    R_flex                //64
    zprow_flex            //65
    wf_flex               //66   
    wm_flex               //67
    wo_flex               //68
    g_flex                //69
    zI_flex               //70
    zpermoil_flex         //71
    zrisk_flex            //72

//auxiliary variables

    yfout_flex            //73
    cout_flex             //74
    Iout_flex             //75
    poout_flex            //76
    lout_flex             //77
    usoilprod_flex        //78
    oilimports_flex       //79
    rer_flex              //80
    worldoil_flex    	  //81
    transinvest_flex 	  //82  
    oil_in_c_flex         //83
    oiltrans_flex 	      //84
    netexports_flex       //85
    ROW_y_flex            //86
    int_rate_flex         //87
    pi_flex               //88
    gout_flex             //89
    oilexpend_flex        //90
    usoilcons_flex        //91

// additional variable for sticky wage/price model

    pim_flex                   //92
    lambdatransf_flex          //93
    zksc_flex                  //94
    zksf_flex                  //95 
    zksm_flex                  //96 
    zkso_flex                  //97 
    zf_flex                    //98
    pifstar_flex               //99

//**************************************************************************
// Modelbase Variables                                                   //*    
  interest inflation inflationq outputgap output; 		                 //*
//**************************************************************************



varexo vzm vzc vzo vzoil vzrowgdp vznetexpf vmk vzprow vzI vzrisk vzdoil vpifstar 

//**************************************************************************
// Modelbase Shocks                                                      //*       
       interest_; 		                                                 //*
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
        std_r_ std_r_quart 			                                     //*
//**************************************************************************

   shco 
   shfo 
   shmo 
   shoo 
   shcn 
   shfm 
   shfl 
   shol 
   shml 
   soimport 

   soworld 
   wss 
   poss 
   lambdacss 
   lss 
   rowgdpss 
   zoilss 
   zdoilss 
   yfss 
   zfss 

   css 
   zcss
   yoss 
   zoss 
   cnss
   Ifss
   kfss 
   Imss
   kmss
   Ioss 
 
   koss 
   Icss 
   kcss 
   ocss 
   ofss 
   omss 
   ooss 
   lmss 
   lfss 
   loss 

   transfss 
   ztransfss 
   ymss 
   zmss 
   ksfss 
   zksfss 
   kscss 
   zkscss 
   ksmss 
   zksmss 

   ksoss 
   zksoss
   psico  
   psifo  
   psioo 
   psicn 
   psifm 
   psifl
   psiol 
   psiml

   lambdamss
   pmss 
   rmss
   ecss
   efss 
   emss
   eoss 
   xecss 
   xefss 
   xemss 

   xeoss 
   lambdakfss
   lambdakcss 
   lambdakmss 
   lambdakoss
   lambdaecss 
   lambdaefss  
   lambdaemss  
   lambdaeoss 
   lambdakscss 

   prowss
   netexpfss
   importoss
   psimo
   chi
   gss

   pifss
   gshare
   xc               //1.   weight on habit in utility
   thetah
   delta            //2.   depreciation rates on capital
   beta             //3.   discout factor
   rhoc             //5.   e-1/e e=elasticity of substitution in consumption
   rhoksc           //7.   e-1/e=elasticity of substitution in consumption capital services
   rhof             //9.   e-1/e=elasticity of substitution in final goods (between intermediate and transport)
   rhotrans         //11.  e-1/e=elasticity of subsutution between labor and capital services
   rhoksf           //13.  e-1/e=  elasticity of substition rhom psiml psimo rhoksm psiol rhokso psioo
   rhoksm           //18.  e-1/e e=elasticity of substitution in intermediate captial services
   rhokso             //19.  e-1/e e=elasticity of substitution between labor and capital services in oil production
   rhoo             //20.  e-1/e e=elasticity of sbustitution oil capital services
   rhom
   
   af am ao         //xx-xxx adjustment cost parameters for labor allocatioin
   akc              //xxx  adjustment cost parameters for capital in consumption
   aec              //xxx  adjustment cost parameters for oil efficienc in consumption
   akf              //xxx  adjustment cost parameters for capital in transport
   aef              //xxx  adjustment cost parameters for oil efficiency in transport
   akm              //xxx  adjustment cost parameters for capital in intermediate goods
   aem              //xxx  adjustment cost parameters for oil efficiency in intermediate goods
   ako              //xxx  adjustment cost parameters for capital in oil
   aeo              //xxx  adjustment cost parameters for oil efficiency in oil
   bec              //xxx  adjustment cost parameters for oil efficienc in consumption
   bef              //xxx  adjustment cost parameters for oil efficiency in transport
   bem              //xxx  adjustment cost parameters for oil efficiency in intermediate goods
   beo              //xxx  adjustment cost parameters for oil efficiency in oil

mkshockss
markup 
sigma 
eta 
oilsupplyelasticity 
oildemandelasticity 
oilincomeelasticity 
thetaworld1  
thetaworld2  
thetaworldp0   
thetaworldp1   
thetaworldp2  
thetaworldpoil0  
thetaworldpoil1 
thetaworldpoil2  

thetasupply  
thetademand  

srnxelasticity  
tp1 
tp2  
tpne1  
tpne2  
srnxrow0
srnxrow1
srnxrow2  

phiBparam  

rhow 

growth_trend

sdzf
zf1
sdzc
zc1
sdzm
zm1
sdzo
zo1
sdztransf 
ztransf1 
sdzoil
zoil1
sdzrowgdp
zrowgdp1
sdznetexpf
znetexpf1
sdmk
mkshock1
sdvR
sdvec 
sdvef 
sdvem 
sdveo 

Rss
arR1
gammapi
gammay

sdzprow
zprow1
arprow1
arprow2
nxprow0
nxprow1
nxprow2

rowsupplyss 
arg1
sdvg

sdzdoil
zdoil1

sdzI
zI1
zIss

rhocmod 
rhokscmod
rhofmod
rhotransmod
rhoksfmod
rhoksmmod
rhoksomod
rhoomod

markupw

sdzpermoil 
zpermoil1 

sdzrisk 
zrisk1 

alphap
alphaw
indexp
indexw

lambdalss

thetaworldus0 
thetaworldus1
thetaworldus2
thetaworldnx1
thetaworldnx2

srnxpoil0
srnxpoil1
srnxpoil2
srnxus0
srnxus1
srnxus2

rowprow0
rowprow1
rowprow2
poilprow0
poilprow1
poilprow2
yusprow0
yusprow1
yusprow2

rowdemandss
pifstar1
sdpifstar
;

// Steady state variables of the model with frictions

//MMB ADDITION*

shco=0.3220; 
shfo=0.5000; 
shmo=0.0375; 
shoo=0; 
shcn=0.9068; 
shfm=0.9700; 
shfl=0.5000;
shol=0.1500; 
shml=0.6000; 
soimport=2.0000; 
soworld=0.0860; 
wss=1.6728; 
poss=0.0123; 
lambdacss=0.5788; 
lss=0.3000; 
rowgdpss=1; 
zoilss=319.0740; 
zdoilss=1.4086;
yfss=1; 
zfss=0.9336; 
css=1; 
zcss=1.8020;
yoss=1; 
zoss=54.2341; 
cnss=0.5248;
Ifss=0.0053;
kfss=0.2137; 
Imss=0.2217;
kmss=8.8661;
Ioss=0.0075; 
koss=0.2986; 
Icss=0.0260; 
kcss=1.0418; 
ocss=1.4083; 
ofss=0.6083; 
omss=0.9834; 
ooss=0; 
lmss=0.2899; 
lfss=0.0090; 
loss=0.0011; 
transfss=0.2381; 
ztransfss=1; 
ymss=1.0917; 
zmss=1; 
ksfss=0.4757; 
zksfss=1; 
kscss=1.1621; 
zkscss=1; 
ksmss=7.9765; 
zksmss=1; 
ksoss=0.2986; 
zksoss=1;
psico=0.6609; 
psifo=0.9811; 
psioo=0; 
psicn=0.7540; 
psifm=0.9985; 
psifl=0.1398; 
psiol=0.6490; 
psiml=0.6000; 
lambdamss=0.7404;
pmss=0.8885; 
rmss=0.0405;
ecss=1;
efss=1; 
emss=1;
eoss=1; 
xecss=1; 
xefss=1; 
xemss=1; 
xeoss=1; 
lambdakfss=1;
lambdakcss=1; 
lambdakmss=1; 
lambdakoss=1;
lambdaecss=0.4947;
lambdaefss=0.2137; 
lambdaemss=0.3454; 
lambdaeoss=0; 
lambdakscss=0.0464;
prowss=1;
netexpfss=0.0247;
importoss=2.0000;
psimo=0.0264;
chi=5.4907e+04;
gss=0.1900;

mkshockss = 1;
thetah = 0.1;
xc = 0.7;
markup = 1.2;
markupw = 1.2;
delta =.025;
beta = .99;
sigma = 2;
eta = 1/2;
oilsupplyelasticity = .7;
oildemandelasticity = .7;
oilincomeelasticity = .7;
thetaworld1 = 0.01; 
thetaworld2= 0.01; 
thetaworldp0 = 0.00; 
thetaworldp1 = 0.01; 
thetaworldp2 = 0.01;
thetaworldpoil0 = 0.01;
thetaworldpoil1= 0.01;
thetaworldpoil2 = 0.01;

thetasupply = .8;
thetademand = .8;
srnxelasticity = .4;
tp1 = 0.01;
tp2 = 0.01;
tpne1 = 0.01;
tpne2 = 0.01;
srnxrow = 0.00;
srnxrow1 = 0.01;
srnxrow2 = 0.01;

pifss = 1;
growth_trend = 1.00; % growth factor
phiBparam = .001;
Rss = pifss/beta;

% deep parameters set to match shares 
rhocmod = 1/(1+.1);
rhokscmod = 1/(1+10.1);
rhofmod = 1/(1+.1);
rhotransmod = 1/(1+.1);
rhoksfmod = 1/(1+10.1);
rhoksmmod = 1/(1+10.1);
rhoksomod = 1/(1+10.1);
rhoomod = 1/(1+.1);

rhoc = (rhocmod-1)/rhocmod;
rhoksc = (rhokscmod-1)/rhokscmod;
rhof = (rhofmod-1)/rhofmod;
rhotrans = (rhotransmod-1)/rhotransmod;
rhoksf = (rhoksfmod-1)/rhoksfmod;
rhom = 1/markup;
rhoksm = (rhoksmmod-1)/rhoksmmod;
rhokso = (rhoksomod-1)/rhoksomod;
rhoo = (rhoomod-1)/rhoomod;
rhow = 1/markupw;

aec = shco/(1-shco);
aef = shfo/(1-shfo);
aem = shmo/(1-shmo);
aeo = shoo/(1-shoo);
   bec = 30.01;           //xxx  adjustment cost parameters for oil efficienc in consumption
   bef = 30.01;             //xxx  adjustment cost parameters for oil efficiency in transport
   bem = 30.01;             //xxx  adjustment cost parameters for oil efficiency in intermediate goods
   beo = 30.01;             //xxx  adjustment cost parameters for oil efficiency in oil

sdzf = .1;
zf1 = .7;
sdzc = .1;
zc1 = .7;
sdzm = .1;
zm1 = .7;
sdzo = .1;
zo1 = .7;
sdztransf = .1;
ztransf1 = .7;
sdzoil = .1;
zoil1 = .7;
sdzrowgdp = .1;
zrowgdp1 = 0.0;
sdznetexpf = .1;
znetexpf1 = 0.0;
sdmk = .1;
mkshock1 = .7;
sdvR = .1;
arR1 = .7;
sdvec = .0000000000;
sdvef = .0000000000;
sdvem = .0000000000;
sdveo = .0000000000;


gammapi = 1.5;
gammay = .3;


af = 0.01;
am = 0.01;
ao = 0.01;
akc = 100.01;
akf = 100.01;
akm = 100.01;
ako = 100.01;

sdzprow = .1;
zprow1 = 0.00;

rowsupplyss = ((poss)*oilsupplyelasticity+zoilss)       ; //67.  row supply of oil
arg1 = .7;
sdvg = .1;
gshare = gss/yfss;

sdzdoil = .1;
zdoil1 = .7;
sdzI = .1;
zI1 = .7;
zIss = 0;

sdzpermoil = .1;
zpermoil1 = .99;

zrisk1 = .7;
sdzrisk = .1;
alphap = 100.0;
alphaw = .7;
indexp = .1;
indexw = .1;

lambdalss = rhow*wss;

thetaworld1 = .7; 
thetaworld2 = 0;
thetaworldus0 = 0;
thetaworldus1 = 0.01;
thetaworldus2 = 0;
thetaworldpoil0 = 0;
thetaworldpoil1 = 0.01;
thetaworldpoil2 = 0;
thetaworldnx1 = 0.01;
thetaworldnx2 = 0;

tpne1 = .7;
tpne2 = 0;
srnxrow0 = 0;
srnxrow1 =0.01 ;
srnxrow2 = 0;
srnxpoil0 = 0;
srnxpoil1 = 0.01;
srnxpoil2 = 0;
srnxus0 = 0;
srnxus1 = 0.01;
srnxus2 = 0;

thetaworldp1 = 0.01;
thetaworldp2 = 0;
tp1 = 0.01;
tp2 = 0;

arprow1 = .7;
arprow2 = 0;
nxprow0 = 0;
nxprow1 = 0.01;
nxprow2 = 0;
rowprow0 = 0;
rowprow1 = 0.01;
rowprow2 = 0;
poilprow0 = 0;
poilprow1 = 0.01;
poilprow2 = 0;
yusprow0 = 0;
yusprow1 = 0.01;
yusprow2 = 0;

sdzrowgdp = .1;
sdznetexpf=.1;
sdzprow=.1;

rowsupplyss = (poss/prowss)^oilsupplyelasticity*zoilss; // 
rowdemandss = (poss/prowss)^(-oildemandelasticity)*zdoilss; // 

pifstar1 = .7;
sdpifstar = .1;

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
//**************************************************************************
std_r_=1;
model(linear);

//**************************************************************************
// Definition of Modelbase Variables in Terms of Original Model Variables //*

interest   = R*4;                                                       //*
inflation  = pi+pi(-1)+pi(-2)+pi(-3);                                   //*
inflationq = 4*pi;                                                 	    //*
outputgap  = yf-yf_flex;                                                //*
output     = yf;                                                        //*

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
                                                                      //*

// household utility


l = lfss/lss*lf + lmss/lss*lm + loss/lss*lo; //(1)

c-zc-(shcn*cn+(1-shcn)*ksc)=0; //(2)

ksc-zksc - (shco*(ec(-1)+oc)+(1-shco)*kc(-1)) = 0 ; //(3)

h = thetah*h(-1)+(1-thetah)*c(-1); //(4) external habit


//  focs
-(eta*l+lambdac)+(lambdal+(-sigma/(1-xc)*c-(-sigma*xc/(1-xc))*h)) = 0; //(5) foc wrt to l

lambdac+(1-rhoc)*(c-cn)+rhoc*zc = 0; //(6) foc wrt to nondurables

lambdac+(1-rhoc)*(c-ksc)+rhoc*zc-lambdaksc = 0; //(7) foc wrt durable services

lambdaksc + (1-rhoksc)*(ksc-(ec(-1)+oc)) + rhoksc*zksc + ec(-1) - po  = 0; //(8) foc wrt oil

-lambdakc + M(+1) + (1-beta*(1-delta))*(lambdac(+1)+(1-rhoc)*(c(+1)-ksc(+1))+rhoc*zc(+1)+(1-rhoksc)*(ksc(+1)-kc)+rhoksc*zksc(+1)) + beta*(1-delta)*lambdakc(+1) + beta*akc*delta^2*(Ic(+1)-kc)=0; // (9)  foc wrt capital

zI + lambdakc - aec*xecss*xec - akc*delta^2*(Ic -kc(-1)) = 0; // (10) foc wrt to investment

lambdaecss*delta*ecss/xecss*(lambdaec+ec-xec) - aec*Icss*Ic - bec*xecss*Icss*xec = 0; // (11) foc wrt to new efficiency

-(lambdaec+ec) + M(+1) + (1-beta*(1-delta))*(po(+1)+oc(+1)) + beta*(1-delta)*(lambdaec(+1)+ec(+1)) = 0; // (12) foc wrt to total efficiency

kc = delta*(zI+Ic)+(1-delta)*kc(-1); // (13) capital accumulation equation

ec = delta*xec+(1-delta)*ec(-1); //(14) efficiency evolution equation

M(+1)+R-zrisk-pif(+1) = 0; //(15) euler equation domestic bonds

M = zrisk(-1)+(-sigma/(1-xc))*(c-c(-1))-(-sigma*xc/(1-xc))*(h-h(-1))+lambdac(-1)-lambdac ; // (16)

//R = (gammapi*(pi)+gammay*yfout)*(1-arR1)+arR1*R(-1)+sdvR*vR; // (17)

w=alphaw*w(-1)+(1-alphaw)*lambdal; // (18) Blanchard and Gali real wage rigidities 

-w - af*(lf-lf(-1)) + beta*af*(lf(+1)-lf) + wf = 0; // (19)

-w - am*(lm-lm(-1)) + beta*am*(lm(+1)-lm) + wm = 0; // (20)

-w - ao*(lo-lo(-1)) + beta*ao*(lo(+1)-lo) + wo = 0; // (21)


// final goods producer

yf-zf-(shfm*ym+(1-shfm)*transf)=0; //(22) final goods

transf-ztransf - (shfl*lf+(1-shfl)*ksf) = 0 ; //(23) transport

ksf-zksf - (shfo*(ef(-1)+of)+(1-shfo)*kf(-1)) = 0 ; //(24) transport capital servies


(1-rhof)*(yf-transf)+rhof*zf-lambdatransf = 0; //(25) demand for transport

(1-rhof)*(yf-ym)+rhof*zf-pm = 0; //(26) demand for intermediate goods

lambdatransf+(1-rhotrans)*(transf-lf)+rhotrans*ztransf-wf = 0; //(27) demand for labor

lambdatransf + (1-rhotrans)*(transf-ksf)+rhotrans*ztransf+(1-rhoksf)*(ksf-(ef(-1)+of)) + rhoksf*zksf + ef(-1) - po = 0; //(28) foc wrt oil

-lambdakf + M(+1) + (1-beta*(1-delta))*(lambdatransf(+1)+(1-rhotrans)*(transf(+1)-ksf(+1))+rhotrans*ztransf(+1)+(1-rhoksf)*(ksf(+1)-kf)+rhoksf*zksf(+1)) + beta*(1-delta)*lambdakf(+1) + beta*akf*delta^2*(If(+1)-kf)=0; // (29)  foc wrt capital

zI + lambdakf - aef*xefss*xef - akf*delta^2*(If-kf(-1)) = 0; // (30) foc wrt to investment

lambdaefss*delta*efss/xefss*(lambdaef+ef-xef) - aef*Ifss*If - bef*xefss*Ifss*xef = 0; //(31) foc wrt to new efficiency

-(lambdaef+ef) + M(+1) + (1-beta*(1-delta))*(po(+1)+of(+1)) + beta*(1-delta)*(lambdaef(+1)+ef(+1)) = 0; // (32) foc wrt to total efficiency

kf = delta*(zI+If)+(1-delta)*kf(-1); // (33) capital accumulation equation

ef = delta*xef+(1-delta)*ef(-1); // (34) efficiency evolution equation

//  intermediate goods producers

ym = zm+psiml*lm+(1-psiml)*ksm ; // (35)
lm = lambdam-wm+ym; //(36)
ksm = (lambdam-rm+ym) ; //(37)

-alphap*pifss^((1-indexp)*2)*(pim-indexp*pim(-1)) + beta*alphap*pifss^((1-indexp)*2)*(pim(+1)-pim) + (lambdam+mkshock-pm)/(1-rhom) = 0 ; // (38)
pim = (pm-pm(-1))+pif; //(39)

//  capital services producer

ksm-zksm - (shmo*(em(-1)+om)+(1-shmo)*km(-1)) = 0 ; //(40) intermediate capital servies

rm + (1-rhoksm)*(ksm-(em(-1)+om)) + rhoksm*zksm + em(-1) - po = 0; //(41) foc wrt oil

-lambdakm + M(+1) + (1-beta*(1-delta))*(rm(+1)+(1-rhoksm)*(ksm(+1)-km)+rhoksm*zksm(+1)) + beta*(1-delta)*lambdakm(+1) + beta*akm*delta^2*(Im(+1)-km)=0; // (42)  foc wrt capital

zI + lambdakm - aem*xemss*xem - akm*delta^2*(Im -km(-1)) = 0; // (43) foc wrt to investment

lambdaemss*delta*emss/xemss*(lambdaem+em-xem) - aem*Imss*Im - bem*xemss*Imss*xem = 0; // (44) foc wrt to new efficiency

-(lambdaem+em) + M(+1) + (1-beta*(1-delta))*(po(+1)+om(+1)) + beta*(1-delta)*(lambdaem(+1)+em(+1)) = 0; // (45) foc wrt to total efficiency

km = delta*(zI+Im)+(1-delta)*km(-1); // (46) capital accumulation equation

em = delta*xem+(1-delta)*em(-1); // (47) efficiency evolution equation



// domestimc oil producers


yo-zo - (shol*lo+(1-shol)*ko(-1)) = 0 ; //(48) CES for oil production

po+(1-rhoo)*(yo-lo)+rhoo*zo-wo = 0; //(49) demand for labor

-lambdako + M(+1) + (1-beta*(1-delta))*(po(+1)+(1-rhoo)*(yo(+1)-ko)+rhoo*zo(+1)) + beta*(1-delta)*lambdako(+1) + beta*ako*delta^2*(Io(+1)-ko)=0; // (50)  foc wrt capital

zI + lambdako - ako*delta^2*(Io -ko(-1)) = 0; // (51) foc wrt to investment

ko = delta*(zI+Io)+(1-delta)*ko(-1); // (52) capital accumulation equation


//market clearing

yf - cnss/yfss*cn - aec*xecss*Icss/yfss*xec - Icss/yfss*Ic - aef*xefss*Ifss/yfss*xef - Ifss/yfss*If - aem*xemss*Imss/yfss*xem - Imss/yfss*Im - Ioss/yfss*Io - (netexpfss/yfss)*netexpf -  gss/yfss*g = 0;  // (53) final goods

yo - ocss/yoss*oc - ofss/yoss*of - omss/yoss*om + importoss/yoss*importo = 0; // (54) domestic oil

importoss*importo - rowsupplyss*rowsupply + rowdemandss*rowdemand = 0; // (55)

rowsupply = thetasupply*rowsupply(-1)+((oilsupplyelasticity*(po-prow))+zoil+zpermoil)*(1-thetasupply); // (56) row supply of oil
rowdemand = thetademand*rowdemand(-1)+(-oildemandelasticity*(po-prow)+zdoil+rowgdp*oilincomeelasticity)*(1-thetademand); // (57) row demand for oil

rowgdp= thetaworld1*rowgdp(-1) + thetaworldnx1*(netexpf(-1) - po(-1)-importo(-1)) + thetaworldp1*prow(-1) + thetaworldpoil0*po+ thetaworldpoil1*po(-1) + thetaworldus0*yf + thetaworldus1*yf(-1) +  zrowgdp ; %// (58) world gdp
netexpf = po+importo+tpne1*(netexpf(-1) - po(-1)-importo(-1)) + srnxrow0*rowgdp + srnxrow1*rowgdp(-1) + tp1*prow(-1)  + srnxpoil0*po + srnxpoil1*po(-1) + srnxus0*yf + srnxus1*yf(-1) + znetexpf ; %// (59);
prow=rowprow0*rowgdp + rowprow1*rowgdp(-1)  + nxprow0*(netexpf - po-importo)  + nxprow1*(netexpf(-1) - po(-1)-importo(-1)) + arprow1*prow(-1) + poilprow0*po + poilprow1*po(-1) + yusprow0*yf + yusprow1*yf(-1) + zprow  ; %// (60) world gdp



//***FLEX***


// household utility


l_flex = lfss/lss*lf_flex + lmss/lss*lm_flex + loss/lss*lo_flex; //(1)

c_flex-zc_flex-(shcn*cn_flex+(1-shcn)*ksc_flex)=0; //(2)

ksc_flex-zksc_flex - (shco*(ec_flex(-1)+oc_flex)+(1-shco)*kc_flex(-1)) = 0 ; //(3)

h_flex = thetah*h_flex(-1)+(1-thetah)*c_flex(-1); //(4) external habit


//  focs
-(eta*l_flex+lambdac_flex)+(lambdal_flex+(-sigma/(1-xc)*c_flex-(-sigma*xc/(1-xc))*h_flex)) = 0; //(5) foc wrt to l

lambdac_flex+(1-rhoc)*(c_flex-cn_flex)+rhoc*zc_flex = 0; //(6) foc wrt to nondurables

lambdac_flex+(1-rhoc)*(c_flex-ksc_flex)+rhoc*zc_flex-lambdaksc_flex = 0; //(7) foc wrt durable services

lambdaksc_flex + (1-rhoksc)*(ksc_flex-(ec_flex(-1)+oc_flex)) + rhoksc*zksc_flex + ec_flex(-1) - po_flex = 0; //(8) foc wrt oil

-lambdakc_flex + M_flex(+1) + (1-beta*(1-delta))*(lambdac_flex(+1)+(1-rhoc)*(c_flex(+1)-ksc_flex(+1))+rhoc*zc_flex(+1)+(1-rhoksc)*(ksc_flex(+1)-kc_flex)+rhoksc*zksc_flex(+1)) + beta*(1-delta)*lambdakc_flex(+1) + beta*akc*delta^2*(Ic_flex(+1)-kc_flex)=0; // (9)  foc wrt capital

zI_flex + lambdakc_flex - aec*xecss*xec_flex - akc*delta^2*(Ic_flex -kc_flex(-1)) = 0; // (10) foc wrt to investment

lambdaecss*delta*ecss/xecss*(lambdaec_flex+ec_flex-xec_flex) - aec*Icss*Ic_flex - bec*xecss*Icss*xec_flex = 0; // (11) foc wrt to new efficiency

-(lambdaec_flex+ec_flex) + M_flex(+1) + (1-beta*(1-delta))*(po_flex(+1)+oc_flex(+1)) + beta*(1-delta)*(lambdaec_flex(+1)+ec_flex(+1)) = 0; // (12) foc wrt to total efficiency

kc_flex = delta*(zI_flex+Ic_flex)+(1-delta)*kc_flex(-1); // (13) capital accumulation equation

ec_flex = delta*xec_flex+(1-delta)*ec_flex(-1); //(14) efficiency evolution equation

M_flex(+1)+R_flex-zrisk_flex-pif_flex(+1) = 0; //(15) euler equation domestic bonds

M_flex = zrisk_flex(-1)+(-sigma/(1-xc))*(c_flex-c_flex(-1))-(-sigma*xc/(1-xc))*(h_flex-h_flex(-1))+lambdac_flex(-1)-lambdac_flex ; // (16)

//R_flex = (gammapi*(pi_flex)+gammay*yfout_flex)*(1-arR1)+arR1*R_flex(-1);//+sdvR*vR; // (17)
//use same rule for flex
R_flex*4=cofintintb1*R_flex(-1)*4+cofintintb2*R_flex(-2)*4+cofintintb3*R_flex(-3)*4+cofintintb4*R_flex(-4)*4+cofintinf0*pi_flex*4+cofintinfb1*pi_flex(-1)*4+cofintinfb2*pi_flex(-2)*4+cofintinfb3*pi_flex(-3)*4+cofintinfb4*pi_flex(-4)*4+cofintinff1*pi_flex(+1)*4+cofintinff2*pi_flex(+2)*4+cofintinff3*pi_flex(+3)*4+cofintinff4*pi_flex(+4)*4+cofintoutp*yf_flex+cofintoutpb1*yf_flex(-1)+cofintoutpb2*yf_flex(-2)+cofintoutpb3*yf_flex(-3)+cofintoutpb4*yf_flex(-4)+cofintoutpf1*yf_flex(+1)+cofintoutpf2*yf_flex(+2)+cofintoutpf3*yf_flex(+3)+cofintoutpf4*yf_flex(+4)+std_r_*interest_;                                          //* 

w_flex=alphaw*w_flex(-1)+(1-alphaw)*lambdal_flex; // (18) Blanchard and Gali real wage rigidities 

-w_flex - af*(lf_flex-lf_flex(-1)) + beta*af*(lf_flex(+1)-lf_flex) + wf_flex = 0; // (19)

-w_flex - am*(lm_flex-lm_flex(-1)) + beta*am*(lm_flex(+1)-lm_flex) + wm_flex = 0; // (20)

-w_flex - ao*(lo_flex-lo_flex(-1)) + beta*ao*(lo_flex(+1)-lo_flex) + wo_flex = 0; // (21)


// final goods producer

yf_flex-zf_flex-(shfm*ym_flex+(1-shfm)*transf_flex)=0; //(22) final goods

transf_flex-ztransf_flex - (shfl*lf_flex+(1-shfl)*ksf_flex) = 0 ; //(23) transport

ksf_flex-zksf_flex - (shfo*(ef_flex(-1)+of_flex)+(1-shfo)*kf_flex(-1)) = 0 ; //(24) transport capital servies


(1-rhof)*(yf_flex-transf_flex)+rhof*zf_flex-lambdatransf_flex = 0; //(25) demand for transport

(1-rhof)*(yf_flex-ym_flex)+rhof*zf_flex-pm_flex = 0; //(26) demand for intermediate goods

lambdatransf_flex+(1-rhotrans)*(transf_flex-lf_flex)+rhotrans*ztransf_flex-wf_flex = 0; //(27) demand for labor

lambdatransf_flex + (1-rhotrans)*(transf_flex-ksf_flex)+rhotrans*ztransf_flex+(1-rhoksf)*(ksf_flex-(ef_flex(-1)+of_flex)) + rhoksf*zksf_flex + ef_flex(-1) - po_flex = 0; //(28) foc wrt oil

-lambdakf_flex + M_flex(+1) + (1-beta*(1-delta))*(lambdatransf_flex(+1)+(1-rhotrans)*(transf_flex(+1)-ksf_flex(+1))+rhotrans*ztransf_flex(+1)+(1-rhoksf)*(ksf_flex(+1)-kf_flex)+rhoksf*zksf_flex(+1)) + beta*(1-delta)*lambdakf_flex(+1) + beta*akf*delta^2*(If_flex(+1)-kf_flex)=0; // (29)  foc wrt capital

zI_flex + lambdakf_flex - aef*xefss*xef_flex - akf*delta^2*(If_flex-kf_flex(-1)) = 0; // (30) foc wrt to investment

lambdaefss*delta*efss/xefss*(lambdaef_flex+ef_flex-xef_flex) - aef*Ifss*If_flex - bef*xefss*Ifss*xef_flex = 0; //(31) foc wrt to new efficiency

-(lambdaef_flex+ef_flex) + M_flex(+1) + (1-beta*(1-delta))*(po_flex(+1)+of_flex(+1)) + beta*(1-delta)*(lambdaef_flex(+1)+ef_flex(+1)) = 0; // (32) foc wrt to total efficiency

kf_flex = delta*(zI_flex+If_flex)+(1-delta)*kf_flex(-1); // (33) capital accumulation equation

ef_flex = delta*xef_flex+(1-delta)*ef_flex(-1); // (34) efficiency evolution equation

//  intermediate goods producers

ym_flex = zm_flex+psiml*lm_flex+(1-psiml)*ksm_flex ; // (35)
lm_flex = lambdam_flex-wm_flex+ym_flex; //(36)
ksm_flex = (lambdam_flex-rm_flex+ym_flex) ; //(37)

//-alphap*pifss^((1-indexp)*2)*(pim_flex-indexp*pim_flex(-1)) + beta*alphap*pifss^((1-indexp)*2)*(pim_flex(+1)-pim_flex) + (lambdam_flex+mkshock_flex-pm_flex)/(1-rhom) = 0 ; // (38)
-0*pifss^((1-indexp)*2)*(pim_flex-indexp*pim_flex(-1)) + beta*0*pifss^((1-indexp)*2)*(pim_flex(+1)-pim_flex) + (lambdam_flex+mkshock_flex-pm_flex)/(1-rhom) = 0 ; // (38)
pim_flex = (pm_flex-pm_flex(-1))+pif_flex; //(39)

//  capital services producer

ksm_flex-zksm_flex - (shmo*(em_flex(-1)+om_flex)+(1-shmo)*km_flex(-1)) = 0 ; //(40) intermediate capital servies

rm_flex + (1-rhoksm)*(ksm_flex-(em_flex(-1)+om_flex)) + rhoksm*zksm_flex + em_flex(-1) - po_flex = 0; //(41) foc wrt oil

-lambdakm_flex + M_flex(+1) + (1-beta*(1-delta))*(rm_flex(+1)+(1-rhoksm)*(ksm_flex(+1)-km_flex)+rhoksm*zksm_flex(+1)) + beta*(1-delta)*lambdakm_flex(+1) + beta*akm*delta^2*(Im_flex(+1)-km_flex)=0; // (42)  foc wrt capital

zI_flex + lambdakm_flex - aem*xemss*xem_flex - akm*delta^2*(Im_flex -km_flex(-1)) = 0; // (43) foc wrt to investment

lambdaemss*delta*emss/xemss*(lambdaem_flex+em_flex-xem_flex) - aem*Imss*Im_flex - bem*xemss*Imss*xem_flex = 0; // (44) foc wrt to new efficiency

-(lambdaem_flex+em_flex) + M_flex(+1) + (1-beta*(1-delta))*(po_flex(+1)+om_flex(+1)) + beta*(1-delta)*(lambdaem_flex(+1)+em_flex(+1)) = 0; // (45) foc wrt to total efficiency

km_flex = delta*(zI_flex+Im_flex)+(1-delta)*km_flex(-1); // (46) capital accumulation equation

em_flex = delta*xem_flex+(1-delta)*em_flex(-1); // (47) efficiency evolution equation



// domestimc oil producers


yo_flex-zo_flex - (shol*lo_flex+(1-shol)*ko_flex(-1)) = 0 ; //(48) CES for oil production

po_flex+(1-rhoo)*(yo_flex-lo_flex)+rhoo*zo_flex-wo_flex = 0; //(49) demand for labor

-lambdako_flex + M_flex(+1) + (1-beta*(1-delta))*(po_flex(+1)+(1-rhoo)*(yo_flex(+1)-ko_flex)+rhoo*zo_flex(+1)) + beta*(1-delta)*lambdako_flex(+1) + beta*ako*delta^2*(Io_flex(+1)-ko_flex)=0; // (50)  foc wrt capital

zI_flex + lambdako_flex - ako*delta^2*(Io_flex -ko_flex(-1)) = 0; // (51) foc wrt to investment

ko_flex = delta*(zI_flex+Io_flex)+(1-delta)*ko_flex(-1); // (52) capital accumulation equation


//market clearing

yf_flex - cnss/yfss*cn_flex - aec*xecss*Icss/yfss*xec_flex - Icss/yfss*Ic_flex - aef*xefss*Ifss/yfss*xef_flex - Ifss/yfss*If_flex - aem*xemss*Imss/yfss*xem_flex - Imss/yfss*Im_flex - Ioss/yfss*Io_flex - (netexpfss/yfss)*netexpf_flex -  gss/yfss*g_flex = 0;  // (53) final goods

yo_flex - ocss/yoss*oc_flex - ofss/yoss*of_flex - omss/yoss*om_flex + importoss/yoss*importo_flex = 0; // (54) domestic oil

importoss*importo_flex - rowsupplyss*rowsupply_flex + rowdemandss*rowdemand_flex = 0; // (55)

rowsupply_flex = thetasupply*rowsupply_flex(-1)+((oilsupplyelasticity*(po_flex-prow_flex))+zoil_flex+zpermoil_flex)*(1-thetasupply); // (56) row supply of oil
rowdemand_flex = thetademand*rowdemand_flex(-1)+(-oildemandelasticity*(po_flex-prow_flex)+zdoil_flex+rowgdp_flex*oilincomeelasticity)*(1-thetademand); // (57) row demand for oil

rowgdp_flex= thetaworld1*rowgdp_flex(-1) + thetaworldnx1*(netexpf_flex(-1) - po_flex(-1)-importo_flex(-1)) + thetaworldp1*prow_flex(-1) + thetaworldpoil0*po_flex+ thetaworldpoil1*po_flex(-1) + thetaworldus0*yf_flex + thetaworldus1*yf_flex(-1) +  zrowgdp_flex ; %// (58) world gdp
netexpf_flex = po_flex+importo_flex+tpne1*(netexpf_flex(-1) - po_flex(-1)-importo_flex(-1)) + srnxrow0*rowgdp_flex + srnxrow1*rowgdp_flex(-1) + tp1*prow_flex(-1)  + srnxpoil0*po_flex + srnxpoil1*po_flex(-1) + srnxus0*yf_flex + srnxus1*yf_flex(-1) + znetexpf_flex ; %// (59);
prow_flex=rowprow0*rowgdp_flex + rowprow1*rowgdp_flex(-1)  + nxprow0*(netexpf_flex - po_flex-importo_flex)  + nxprow1*(netexpf_flex(-1) - po_flex(-1)-importo_flex(-1)) + arprow1*prow_flex(-1) + poilprow0*po_flex + poilprow1*po_flex(-1) + yusprow0*yf_flex + yusprow1*yf_flex(-1) + zprow_flex  ; %// (60) world gdp

// exogenous shock processes

//g = (sdvg*vg)+g(-1)*arg1; // (61)
g = 0;
zc = (sdzc*vzc)+(zc(-1))*zc1; //(62)
zm = (sdzm*vzm)+(zm(-1))*zm1; //(63)
zo = (sdzo*vzo)+(zo(-1))*zo1; //(64)
//ztransf = (sdztransf*vztransf)+(ztransf(-1))*ztransf1; //(65)
ztransf = 0;
zoil = (sdzoil*vzoil)+(zoil(-1))*zoil1; //(66)
zrowgdp = sdzrowgdp*vzrowgdp; //(67)
znetexpf = sdznetexpf*vznetexpf; //(68)
mkshock = (sdmk*vmk)+(mkshock(-1))*mkshock1; //(69)
zdoil = (sdzdoil*vzdoil)+(zdoil(-1))*zdoil1; //(70)
zprow = sdzprow*vzprow;       //(71)
zI = (sdzI*vzI)+(zI(-1))*zI1; //(72)
//zpermoil = (sdzpermoil*vzpermoil)+(zpermoil(-1))*zpermoil1; //(73)
zpermoil = 0; // (73)
zrisk = (sdzrisk*vzrisk)+(zrisk(-1))*zrisk1; // (74)


//auxiliary variables

yfout = (yf*yfss/(yfss-poss*importoss+poss*ocss)) - importo*poss*importoss/(yfss-poss*importoss+poss*ocss) + oc*poss*ocss/(yfss-poss*importoss+poss*ocss); // (75) GDP

cout = cnss/(cnss+Icss+poss*ocss)*cn+aec*xecss*Icss/(cnss+Icss+poss*ocss)*xec+Icss/(cnss+Icss+poss*ocss)*Ic+poss*ocss/(cnss+Icss+poss*ocss)*(po+oc) - (yfss/(yfss-poss*(importoss-ocss))*yf-poss*importoss/(yfss-poss*(importoss-ocss))*(po+importo)+poss*ocss/(yfss-poss*(importoss-ocss))*(po+oc)); // (76)

Iout = aef*xefss*Ifss/(Ifss+Imss+Ioss)*xef+Ifss/(Ifss+Imss+Ioss)*If + aem*xemss*Imss/(Ifss+Imss+Ioss)*xem+Imss/(Ifss+Imss+Ioss)*Im + Ioss/(Ifss+Imss+Ioss)*Io - (yfss/(yfss-poss*(importoss-ocss))*yf-poss*importoss/(yfss-poss*(importoss-ocss))*(po+importo)+poss*ocss/(yfss-poss*(importoss-ocss))*(po+oc)); //(77)

poout = (1+poss*(importoss-ocss))/(yfss-poss*(importoss-ocss))*po; //(78)

lout = lmss/lss*lm + lfss/lss*lf + loss/lss*lo;  //(79)

usoilprod = yo; //(80)

oilimports = (po+importo) - (yfss/(yfss-poss*(importoss-ocss))*yf-poss*importoss/(yfss-poss*(importoss-ocss))*(po+importo)+poss*ocss/(yfss-poss*(importoss-ocss))*(po+oc)); //(81)

rer = prow; //(82)

worldoil = rowsupply; //(83)

transinvest = aef*xefss*Ifss/(Ifss)*xef+If - (yfss/(yfss-poss*(importoss-ocss))*yf-poss*importoss/(yfss-poss*(importoss-ocss))*(po+importo)+poss*ocss/(yfss-poss*(importoss-ocss))*(po+oc)); //(84)

oil_in_c = (po+oc)  - (yfss/(yfss-poss*(importoss-ocss))*yf-poss*importoss/(yfss-poss*(importoss-ocss))*(po+importo)+poss*ocss/(yfss-poss*(importoss-ocss))*(po+oc)); //(85)

oiltrans = ocss/(ocss+ofss)*oc + ofss/(ocss+ofss)*of - (ocss/(ocss+ofss+omss)*oc + ofss/(ocss+ofss+omss)*of + omss/(ocss+ofss+omss)*om); //(86)

netexports = netexpfss/(yfss-poss*(importoss-ocss))*netexpf - netexpfss/(yfss-poss*(importoss-ocss))*(po+importo) - netexpfss/(yfss-poss*(importoss-ocss))*(yfss/(yfss-poss*(importoss-ocss))*yf-poss*importoss/(yfss-poss*(importoss-ocss))*(po+importo)+poss*ocss/(yfss-poss*(importoss-ocss))*(po+oc)); //(87)

ROW_y = rowgdp; //(88)

int_rate = (R-(pifstar+pif - (po-po(-1))*poss*importoss/(yfss-poss*(importoss-ocss)) + (po-po(-1))*poss*ocss/(yfss-poss*(importoss-ocss)))); // (89);

pi = pifstar+(pif- (po-po(-1))*poss*importoss/(yfss-poss*importoss+poss*ocss) + (po-po(-1))*poss*ocss/(yfss-poss*(importoss-ocss))); // (90);

gout = g - (yfss/(yfss-poss*(importoss-ocss))*yf-poss*importoss/(yfss-poss*(importoss-ocss))*(po+importo)+poss*ocss/(yfss-poss*(importoss-ocss))*(po+oc)); //(91)

oilexpend = (po+(ocss*oc+ofss*of+omss*om)/(ocss+ofss+omss)) - (yfss/(yfss-poss*(importoss-ocss))*yf-poss*importoss/(yfss-poss*(importoss-ocss))*(po+importo)+poss*ocss/(yfss-poss*(importoss-ocss))*(po+oc)); //(92)

usoilcons = (ocss*oc+ofss*of+omss*om)/(ocss+ofss+omss); //(93)

zksc = 0; //(94)
zksf = 0; //(95)
zksm = 0; //(96)
zkso = 0; //(97)
zf = 0;  //(98)
pifstar = pifstar1*pifstar(-1)+sdpifstar*vpifstar; //(99)


// exogenous shock processes

//g = (sdvg*vg)+g(-1)*arg1; // (61)
g_flex = 0;
zc_flex = (sdzc*vzc)+(zc_flex(-1))*zc1; //(62)
zm_flex = (sdzm*vzm)+(zm_flex(-1))*zm1; //(63)
zo_flex = (sdzo*vzo)+(zo_flex(-1))*zo1; //(64)
//ztransf = (sdztransf*vztransf)+(ztransf(-1))*ztransf1; //(65)
ztransf_flex = 0;
zoil_flex = (sdzoil*vzoil)+(zoil_flex(-1))*zoil1; //(66)
zrowgdp_flex = sdzrowgdp*vzrowgdp; //(67)
znetexpf_flex = sdznetexpf*vznetexpf; //(68)
mkshock_flex = (sdmk*vmk)+(mkshock_flex(-1))*mkshock1; //(69)
zdoil_flex = (sdzdoil*vzdoil)+(zdoil_flex(-1))*zdoil1; //(70)
zprow_flex = sdzprow*vzprow;       //(71)
zI_flex = (sdzI*vzI)+(zI_flex(-1))*zI1; //(72)
//zpermoil = (sdzpermoil*vzpermoil)+(zpermoil(-1))*zpermoil1; //(73)
zpermoil_flex = 0; // (73)
zrisk_flex = (sdzrisk*vzrisk)+(zrisk_flex(-1))*zrisk1; // (74)


//auxiliary variables

yfout_flex = (yf_flex*yfss/(yfss-poss*importoss+poss*ocss)) - importo_flex*poss*importoss/(yfss-poss*importoss+poss*ocss) + oc_flex*poss*ocss/(yfss-poss*importoss+poss*ocss); // (75) GDP

cout_flex = cnss/(cnss+Icss+poss*ocss)*cn_flex+aec*xecss*Icss/(cnss+Icss+poss*ocss)*xec_flex+Icss/(cnss+Icss+poss*ocss)*Ic_flex+poss*ocss/(cnss+Icss+poss*ocss)*(po_flex+oc_flex) - (yfss/(yfss-poss*(importoss-ocss))*yf_flex-poss*importoss/(yfss-poss*(importoss-ocss))*(po_flex+importo_flex)+poss*ocss/(yfss-poss*(importoss-ocss))*(po_flex+oc_flex)); // (76)

Iout_flex = aef*xefss*Ifss/(Ifss+Imss+Ioss)*xef_flex+Ifss/(Ifss+Imss+Ioss)*If_flex + aem*xemss*Imss/(Ifss+Imss+Ioss)*xem_flex+Imss/(Ifss+Imss+Ioss)*Im_flex + Ioss/(Ifss+Imss+Ioss)*Io_flex - (yfss/(yfss-poss*(importoss-ocss))*yf_flex-poss*importoss/(yfss-poss*(importoss-ocss))*(po_flex+importo_flex)+poss*ocss/(yfss-poss*(importoss-ocss))*(po_flex+oc_flex)); //(77)

poout_flex = (1+poss*(importoss-ocss))/(yfss-poss*(importoss-ocss))*po_flex; //(78)

lout_flex = lmss/lss*lm_flex + lfss/lss*lf_flex + loss/lss*lo_flex;  //(79)

usoilprod_flex = yo_flex; //(80)

oilimports_flex = (po_flex+importo_flex) - (yfss/(yfss-poss*(importoss-ocss))*yf_flex-poss*importoss/(yfss-poss*(importoss-ocss))*(po_flex+importo_flex)+poss*ocss/(yfss-poss*(importoss-ocss))*(po_flex+oc_flex)); //(81)

rer_flex = prow_flex; //(82)

worldoil_flex = rowsupply_flex; //(83)

transinvest_flex = aef*xefss*Ifss/(Ifss)*xef_flex+If_flex - (yfss/(yfss-poss*(importoss-ocss))*yf_flex-poss*importoss/(yfss-poss*(importoss-ocss))*(po_flex+importo_flex)+poss*ocss/(yfss-poss*(importoss-ocss))*(po_flex+oc_flex)); //(84)

oil_in_c_flex = (po_flex+oc_flex)  - (yfss/(yfss-poss*(importoss-ocss))*yf_flex-poss*importoss/(yfss-poss*(importoss-ocss))*(po_flex+importo_flex)+poss*ocss/(yfss-poss*(importoss-ocss))*(po_flex+oc_flex)); //(85)

oiltrans_flex = ocss/(ocss+ofss)*oc_flex + ofss/(ocss+ofss)*of_flex - (ocss/(ocss+ofss+omss)*oc_flex + ofss/(ocss+ofss+omss)*of_flex + omss/(ocss+ofss+omss)*om_flex); //(86)

netexports_flex = netexpfss/(yfss-poss*(importoss-ocss))*netexpf_flex - netexpfss/(yfss-poss*(importoss-ocss))*(po_flex+importo_flex) - netexpfss/(yfss-poss*(importoss-ocss))*(yfss/(yfss-poss*(importoss-ocss))*yf_flex-poss*importoss/(yfss-poss*(importoss-ocss))*(po_flex+importo_flex)+poss*ocss/(yfss-poss*(importoss-ocss))*(po_flex+oc_flex)); //(87)

ROW_y_flex = rowgdp_flex; //(88)

int_rate_flex = (R_flex-(pifstar_flex+pif_flex - (po_flex-po_flex(-1))*poss*importoss/(yfss-poss*(importoss-ocss)) + (po_flex-po_flex(-1))*poss*ocss/(yfss-poss*(importoss-ocss)))); // (89);

pi_flex = pifstar_flex+(pif_flex- (po_flex-po_flex(-1))*poss*importoss/(yfss-poss*importoss+poss*ocss) + (po_flex-po_flex(-1))*poss*ocss/(yfss-poss*(importoss-ocss))); // (90);

gout_flex = g_flex - (yfss/(yfss-poss*(importoss-ocss))*yf_flex-poss*importoss/(yfss-poss*(importoss-ocss))*(po_flex+importo_flex)+poss*ocss/(yfss-poss*(importoss-ocss))*(po_flex+oc_flex)); //(91)

oilexpend_flex = (po_flex+(ocss*oc_flex+ofss*of_flex+omss*om_flex)/(ocss+ofss+omss)) - (yfss/(yfss-poss*(importoss-ocss))*yf_flex-poss*importoss/(yfss-poss*(importoss-ocss))*(po_flex+importo_flex)+poss*ocss/(yfss-poss*(importoss-ocss))*(po_flex+oc_flex)); //(92)

usoilcons_flex = (ocss*oc_flex+ofss*of_flex+omss*om_flex)/(ocss+ofss+omss); //(93)

zksc_flex = 0; //(94)
zksf_flex = 0; //(95)
zksm_flex = 0; //(96)
zkso_flex = 0; //(97)
zf_flex = 0;  //(98)
pifstar_flex = pifstar1*pifstar_flex(-1)+sdpifstar*vpifstar; //(99)

end;

shocks;
var vzc = 1;
var vzm = 1;
var vzo = 1;
var vzoil = 1;
var vzrowgdp = 1;
var vznetexpf = 1;
var vmk = 1;
//var vR = 1;
var vzprow = 1;
var vzdoil = 1;
var vzI = 1;
var vzrisk = 1;
var vpifstar = 1;
var interest_=1;
end;


//stoch_simul(order = 1,k_order_solver,print,nograph,irf=0);

//stoch_simul(order = 1,irf_shocks=(interest_),irf=50);