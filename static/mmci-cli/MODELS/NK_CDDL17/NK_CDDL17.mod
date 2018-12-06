//**************************************************************************
// Optimal Monetary and Prudential Policies 
//
// 
// 
//
// Working Paper, 2009
//**************************************************************************

// Model: NK_RW97

// Further references:k
// 
// 

//

// 

//Endogenous variables 
var cnk  ,ynk  ,ink  ,knk  ,hnk  ,lnk  ,psink  ,pnnk  ,pdnk  ,dpnk  ,dynk  ,enk  ,dnk  ,Rsnk  ,Rdnk  ,Rrnk  ,lbnk  ,lsnk  ,lrnk, Util, Welf; 
var cnk_f,ynk_f,ink_f,knk_f,hnk_f,lnk_f,psink_f,pnnk_f,pdnk_f,dpnk,dynk_f,enk_f,dnk_f,Rsnk_f,Rdnk_f,Rrnk_f,lbnk_f,lsnk_f,lrnk_f; 
//var cnk  ,ynk  ,ink  ,knk  ,hnk  ,lnk  ,psink  ,nu1  ,nu2  ,dpnk  ,dynk  ,enk  ,dnk  ,Rsnk  ,Rdnk  ,Rrnk  ,lbnk  ,lsnk  ,lrnk; 
//var cnk_f,ynk_f,ink_f,knk_f,hnk_f,lnk_f,psink_f,nu1_f,nu2_f       ,dynk_f,enk_f,dnk_f,Rsnk_f,Rdnk_f,Rrnk_f,lbnk_f,lsnk_f,lrnk_f; 


var z,etar,psil,kap,qnk; 

//var lmult1,  lmult2,  lmult3,  lmult4,  lmult5,  lmult6,  lmult7,   
//    lmult8,  lmult9,  lmult10,  lmult11,  lmult12,  lmult13,  lmult14,   
//    lmult15,  lmult16,  lmult17,  lmult18; 

//**************************************************************************
// Modelbase Variables                                                   //*    
   var interest inflation inflationq outputgap output;                   //*
//**************************************************************************

var r_flex;
varexo ez,et,eps

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
nbeta,chi,thh, nu,delta,sigma,mup, xi,dpss,tau, psilss,gammass,phiss,  
rz,rt,rp,etss, xi_f, kpss; 

nbeta   = 1.0276^(-0.25); // time preference parameter
chi     = 0.276; // parameter of labor component of utility *
thh     = 3.409; // weight of labor component of utility
nu      = 0.33; // parameter of production function (intermediate good prosucer)*
delta   = 0.025; // depreciation parameter
sigma   = 7; // aggregation parameter *
mup     = sigma/(sigma-1); // markup
xi      = 0.779; // price stickiness parameter according to Calvo
xi_f    = 0; // flexible counterpart
psiss   = 1/mup; 
dpss    = 1;
tau     = 0.0229; //tax
etss    = 0.0492/4; 
kpss    = 0.12;
oms     = exp(0.0226/4);
psilss  = log(oms)-tau*0.10/(1-tau);
phiss   = 0.0338099574025002; // computed in calib.m
omr     = exp(etss);
gammass = phiss*((1-tau)*psilss+kpss)/((1-phiss)*(1-tau+tau*kpss)*(omr-1)+(1-tau)*(1-phiss)*psilss*omr-phiss*kpss);
rz      = 0.966230; // Estimated using Fernald TFP_util 1993Q1-2012Q4
rt      = 0.905011; //case 2007
rp      = 0.677908; //Estimated using spread 1993Q1-2007Q3
sez     = 0.006799;
set     = 6.014478243327080e-04; //case 2007
sep     = 0; 3.573303779883895e-04;
%
% Actual Calibration
%
KP      = 0.1;
for iexp=1:length(KP)
kpss    = KP(iexp);  

Rdss    = dpss/nbeta;
// Rsss    = Rdss*(1+gammass)*(1+tau*kpss/(1-tau)+phiss*kpss/((1-tau)*(1-phiss))+psilss/((1+gammass)*(1-phiss)))/(1+gammass*exp(etss));
Rsss    = oms*Rdss;
Rrss    = omr*Rsss;
ksy     = nu/(mup*(Rsss-(1-delta)));
lssy    = ksy/(1+gammass*exp(etss)*(1-phiss));
lrsy    = gammass*lssy;
lsy     = (1+gammass)*lssy;
isy     = lsy-(1-delta)*ksy; 
csy     = 1-isy-psilss*lssy; 
hss     = ((1-nu)/(mup*csy*thh))^(1/(1+chi));
yss     = ksy^(nu/(1-nu))*hss; 
css     = csy*yss; 
lbss    = 1/css; 
lbkss   = lbss; 
qxss    = 1; 
iss     = isy*yss; 
lsss    = lssy*yss;
lrss    = lrsy*yss;
lss     = lsss+lrss; 
kss     = ksy*yss;
pnss    = lbss*yss/(1-nbeta*xi); 
pdss    = pnss; 
dyss    = 1;
ess     = kpss*lss; 
dss     = lss-ess; 
qss     = nu/(mup*ksy)+1-delta;
wss     = (sigma-1)*(1-nu)*yss/(sigma*hss);
zss     = nu*wss*hss/((1-nu)*kss);
xss     = lss;

// Ramsey multipliers 

//xx           = log([css yss iss kss hss psiss pnss pdss dpss dyss Rsss Rdss lbss ess dss lss psilss etss kpss]);
//[er,lmk]     = comp_lambda_model2(xx);
//lmult1_SS    = lmk(1);
//lmult2_SS    = lmk(2);
//lmult3_SS    = lmk(3);
//lmult4_SS    = lmk(4);
//lmult5_SS    = lmk(5);
//lmult6_SS    = lmk(6);
//lmult7_SS    = lmk(7);
//lmult8_SS    = lmk(8);
//lmult9_SS    = lmk(9);
//lmult10_SS   = lmk(10);
//lmult11_SS   = lmk(11);
//lmult12_SS   = lmk(12);
//lmult13_SS   = lmk(13);
//lmult14_SS   = lmk(14);
//lmult15_SS   = lmk(15);
//lmult16_SS   = lmk(16); 



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
//std_r_=100;
                                                                         
// Definition of Discretionary Fiscal Policy Parameter                   //*
coffispol = 1;                                                           //*
//**************************************************************************

model;     

//**************************************************************************
// Definition of Modelbase Variables in Terms of Original Model Variables //*
interest   = 4*(Rdnk-steady_state(Rdnk));                                                        //*
inflation = (1/4)*(4*dpnk+4*dpnk(-1)+4*dpnk(-2)+4*dpnk(-3));			         //*
inflationq  = dpnk*4;                                                      //*
outputgap  = ynk-ynk_f;                                                          //*
output = ynk;                                                              //*
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


    // Standard block 
    cnk+lbnk    = 0; 
    log(thh)+(1+chi)*hnk   = log(1-nu)+lbnk+psink+ynk; 
    dynk+ynk    = z+nu*knk(-1)+(1-nu)*hnk; 
    exp(lnk)    = exp(ink)+(1-delta)*exp(knk(-1)); 
    exp(knk)    = (1-phiss)*exp(etar)*exp(lrnk)+exp(lsnk); 
    exp(ynk)    = exp(cnk)+exp(ink)+exp(psil+lsnk);
    lbnk        = log(nbeta)+lbnk(+1)+Rdnk-dpnk(+1); 
    exp(lbnk(+1)-dpnk(+1)+Rsnk)=(nu*exp(lbnk(+1)+psink(+1)+ynk(+1)-knk)+exp(lbnk(+1))*(1-delta)); 
 
    // Nominal aspects 
    exp(pnnk)   = mup*exp(lbnk+ynk+psink)+nbeta*xi*dpss^(-sigma)*exp(pnnk(+1)+sigma*dpnk(+1)); 
    exp(pdnk)   = exp(lbnk+ynk)+nbeta*xi*dpss^(1-sigma)*exp(pdnk(+1)+(sigma-1)*dpnk(+1)); 
    1           = xi*dpss^(1-sigma)*exp((sigma-1)*dpnk)+(1-xi)*exp((1-sigma)*(pnnk-pdnk)); 
    exp(dynk)   = xi*dpss^(-sigma)*exp(dynk(-1)+sigma*dpnk)+(1-xi)*exp(-sigma*(pnnk-pdnk)); 
    //dynk + nu1 = log(mup)+nu2;
    //nu1 = (sigma-1)*dpnk+ynk+log(nbeta*xi)+lbnk(+1)-lbnk+(sigma-1)*dpnk+nu1(+1);
    //nu2 = psink + sigma*dpnk+ynk+log(nbeta*xi)+lbnk(+1)-lbnk+(sigma-1)*dpnk+nu2(+1);
    //exp((1-sigma)*dpnk) = xi+(1-xi)*exp((1-sigma)*dynk); 


    // Banking aspects 
    enk         = log(kpss)+lnk; 
    exp(lnk)    = exp(dnk)+exp(enk);  
    exp(lnk)    = exp(lsnk)+exp(lrnk); 
    exp(lrnk)   = gammass*exp(lsnk);   
    //(1-tau)*exp(psil)= (1-tau)*(exp(Rsnk-Rdnk)-1)-tau*(1-tau)*((1-phiss)*gammass*(exp(etar)-1)+exp(psil)*((1-phiss)*gammass*exp(etar)-phiss))/(phiss*(1+gammass)-gammass*tau*(1-phiss)*(exp(etar)-1)); 
    exp(Rsnk-Rdnk)*(1+gammass*exp(etar))=(1+gammass)*(1+tau*kpss/(1-tau)+phiss*kpss/((1-tau)*(1-phiss))+psilss/((1+gammass)*(1-phiss))); 
    Rrnk        = Rsnk+etar; 
 
    // Standard block _f
    cnk_f+lbnk_f    = 0; 
    log(thh)+(1+chi)*hnk_f   = log(1-nu)+lbnk_f+psink_f+ynk_f; 
    dynk_f+ynk_f    = z+nu*knk_f(-1)+(1-nu)*hnk_f; 
    exp(lnk_f)    = exp(ink_f)+(1-delta)*exp(knk_f(-1)); 
    exp(knk_f)    = (1-phiss)*exp(etar)*exp(lrnk_f)+exp(lsnk_f); 
    exp(ynk_f)    = exp(cnk_f)+exp(ink_f)+exp(psil+lnk_f); 
    lbnk_f        = log(nbeta)+lbnk_f(+1)+Rdnk_f-dpnk(+1); 
    exp(lbnk_f(+1)-dpnk(+1)+Rsnk_f)=(nu*exp(lbnk_f(+1)+psink_f(+1)+ynk_f(+1)-knk_f)+exp(lbnk_f(+1))*(1-delta)); 
 
    // Nominal aspects _f
    exp(pnnk_f)   = mup*exp(lbnk_f+ynk_f+psink_f)+nbeta*xi_f*dpss^(-sigma)*exp(pnnk_f(+1)+sigma*dpnk(+1)); 
    exp(pdnk_f)   = exp(lbnk_f+ynk_f)+nbeta*xi_f*dpss^(1-sigma)*exp(pdnk(+1)+(sigma-1)*dpnk(+1)); 
    1             = xi_f*dpss^(1-sigma)*exp((sigma-1)*dpnk)+(1-xi)*exp((1-sigma)*(pnnk_f-pdnk_f)); 
    exp(dynk_f)   = xi_f*dpss^(-sigma)*exp(dynk_f(-1)+sigma*dpnk)+(1-xi)*exp(-sigma*(pnnk_f-pdnk_f)); 
    //dynk_f + nu1_f = mup+nu2_f;
    //nu1_f = (sigma-1)*dpnk+ynk_f+log(nbeta*xi_f)+lbnk_f(+1)-lbnk_f+(sigma-1)*dpnk+nu1_f(+1);
    //nu2_f = psink_f + sigma*dpnk+ynk_f+log(nbeta*xi_f)+lbnk(+1)-lbnk_f+(sigma-1)*dpnk+nu2_f(+1);
    //exp((1-sigma)*dpnk) = xi_f+(1-xi)*exp((1-sigma)*dynk_f); 
    
    // Banking aspects _f
    enk_f         = log(kpss)+lnk_f; 
    exp(lnk_f)    = exp(dnk_f)+exp(enk_f);  
    exp(lnk_f)    = exp(lsnk_f)+exp(lrnk_f); 
    exp(lrnk_f)   = gammass*exp(lsnk_f); 
    //(1-tau)*exp(psil)= (1-tau)*(exp(Rsnk_f-Rdnk_f)-1)-tau*(1-tau)*((1-phiss)*gammass*(exp(etar)-1)+exp(psil)*((1-phiss)*gammass*exp(etar)-phiss))/(phiss*(1+gammass)-gammass*tau*(1-phiss)*(exp(etar)-1)); 
    exp(Rsnk_f-Rdnk_f)*(1+gammass*exp(etar))=(1+gammass)*(1+tau*kpss/(1-tau)+phiss*kpss/((1-tau)*(1-phiss))+psilss/((1+gammass)*(1-phiss))); 
    Rrnk_f        = Rsnk_f+etar; 

 
    // Welfare 
    Util    = cnk-thh*exp((1+chi)*hnk)/(1+chi); 
    Welf    = Util+nbeta*Welf(+1); 
 
 // Policymaker's First-Order Conditions 
 //   lmult1 - lmult5*exp(cnk) + 1; 
 //   -lmult13*exp(dnk); 
 //   lmult6(-1)/nbeta - (lmult7(-1)*exp(Rsnk(-1) - dpnk + lbnk))/nbeta - dpss^(1 - sigma)*lmult10*xi*exp(dpnk*(sigma - 1))*(sigma - 1) - (lmult11*sigma*xi*exp(dynk(-1) + dpnk*sigma))/dpss^sigma - (lmult8(-1)*sigma*xi*exp(pnnk + dpnk*sigma))/dpss^sigma - dpss^(1 - sigma)*lmult9(-1)*xi*exp(pdnk + dpnk*(sigma - 1))*(sigma - 1); 
 //   lmult3 + lmult11*exp(dynk) - (lmult11(+1)*nbeta*xi*exp(dynk + dpnk(+1)*sigma))/dpss^sigma; 
 //   lmult12*exp(enk) - lmult13*exp(enk); 
 //   lmult2*(chi + 1) + lmult3*(nu - 1) - thh*exp(hnk*(chi + 1)); 
 //   - lmult4*exp(ink) - lmult5*exp(ink); 
 //   lmult4*exp(knk) - lmult14*exp(knk) + lmult7*nu*exp(lbnk(+1) - knk + psink(+1) + ynk(+1)) - lmult3(+1)*nbeta*nu + lmult4(+1)*nbeta*exp(knk)*(delta - 1); 
 //   lmult1 - lmult2 + lmult6 - lmult9*exp(lbnk + ynk) - lmult6(-1)/nbeta - lmult8*mup*exp(lbnk + psink + ynk) + (lmult7(-1)*(exp(Rsnk(-1) - dpnk + lbnk) - nu*exp(lbnk - knk(-1) + psink + ynk) + exp(lbnk)*(delta - 1)))/nbeta; 
 //   lmult13*exp(lnk) - lmult5*exp(lnk + psil) + lmult14*exp(lnk) - (lmult12*exp(lnk)*(exp(psil)*(phiss + gammass*exp(etar)*(phiss - 1)) + gammass*(exp(etar) - 1)*(phiss - 1))*(tau - 1))/(phiss*(gammass + 1) + gammass*tau*(exp(etar) - 1)*(phiss - 1)); 
 //   lmult9*exp(pdnk) - dpss^(1 - sigma)*lmult9(-1)*xi*exp(pdnk + dpnk*(sigma - 1)) + lmult10*exp((pdnk - pnnk)*(sigma - 1))*(sigma - 1)*(xi - 1) + lmult11*sigma*exp(sigma*(pdnk - pnnk))*(xi - 1); 
 //   lmult8*exp(pnnk) - (lmult8(-1)*xi*exp(pnnk + dpnk*sigma))/dpss^sigma - lmult10*exp((pdnk - pnnk)*(sigma - 1))*(sigma - 1)*(xi - 1) - lmult11*sigma*exp(sigma*(pdnk - pnnk))*(xi - 1); 
 //   - lmult2 - lmult8*mup*exp(lbnk + psink + ynk) - (lmult7(-1)*nu*exp(lbnk - knk(-1) + psink + ynk))/nbeta; 
 //   - lmult6 - lmult15*exp(Rsnk - Rdnk)*(tau - 1); 
 //   lmult16; 
 //   lmult7*exp(Rsnk - dpnk(+1) + lbnk(+1)) - lmult16 + lmult15*exp(Rsnk - Rdnk)*(tau - 1); 
 //   lmult3 - lmult2 - lmult9*exp(lbnk + ynk) + lmult5*exp(ynk) - lmult8*mup*exp(lbnk + psink + ynk) - (lmult7(-1)*nu*exp(lbnk - knk(-1) + psink + ynk))/nbeta; 

 r_flex = Rdnk_f - dpnk(+1);

// Shocks 
    z   = rz*z(-1)+ez; 
    etar= rt*etar(-1)+(1-rt)*etss+et; 
    psil=rp*psil(-1)+(1-rp)*log(psilss)+eps; 
    kap=kpss;

    exp(qnk)  = nu*exp(psink+ynk-knk(-1))+1-delta;
    end;


resid; 
steady; 
check; 
shocks; 
var ez;stderr sez; 
var et;stderr set; 
var eps;stderr sep; 
end; 
stoch_simul(order=1,irf=20,nograph); 
end
