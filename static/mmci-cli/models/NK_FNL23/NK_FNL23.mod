//**************************************************************************
// A New Comparative Approach to Macroeconomic Modeling and Policy Analysis
//
// Volker Wieland, Tobias Cwik, Gernot J. Mueller, Sebastian Schmidt and 
// Maik Wolters
//
// Working Paper, 2009
//**************************************************************************

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%Ferrari and Nispi Landi (IJCB 2023)%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This code simulates business cycle fluctuations

close all;
warning off

% Specify the intratemporal elasticity between green and brown sector: if ela=1, csi=1 and final output is cobb douglas
tfp_stand=0.017;  %0.017
mon_stand=0.0025;
%%%%%%%%%%%%%%%%%%%%%%%Endogenous Variables %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
var
lam
c 
rkG
rkB
w 
h
hB
hG
y 
k 
kB
kG
q
I
r
pI
pi
yB
yG
pG
pB
rB
rG
bHG
bHB
bCB
bCG
mu
e
X
G
rGE
rBE
sp
price
X_ea

tau
re
a
epsI

ylog
clog
ilog
klog
hlog
piA
rGA
rBA
elog
yGlog
Xealog
Xlog

lamf
cf
rkGf
rkBf
wf
hf
hBf
hGf
yf
kf 
kBf
kGf
qf
If
rf
pIf
pif
yBf
yGf
pGf
pBf
rBf
rGf
bHGf
bHBf
bCBf
bCGf
muf
ef
Xf
Gf
rGEf
rBEf
spf
pricef
X_eaf

tauf
ref
af
epsIf

ylogf
clogf
ilogf
klogf
hlogf
piAf
rGAf
rBAf
elogf
yGlogf
Xealogf
Xlogf
vg

//**************************************************************************
// Modelbase Variables                                                   //*
         interest inflation inflationq outputgap output fispol;          //*
//**************************************************************************


%%
%%%%%%%%%%%%%%%%%%%%%%%Exogenous Variables%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
varexo 
%vm
va
%vg
vi
//**************************************************************************
// Modelbase Shocks                                                      //*
       interest_ fiscal_ ;                                               //*
//************************************************************************** 
    
%%
%%%%%%%%%%%%%%%%%%%%%%%Parameters%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

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


betta 
alfa 
epsilon
delta
phi
chi
csi
theta
deltax
zeta
g 
nuM
nuE
dC
nuG
nuB

rG_start
rB_start
y_start
pB_start
mu_start
X_start
bCG_start
re_start
bCB_start
rss
piss
kappaI
phipi
rhor
kappaP
kappaG
kappaB
S1
S2
S3
tau_start
varsig
iota
erow

rhoa
rhoi
standa
standi
standm
standg
rhog
;

alfa=0.297489809034116;
bCB_start=0;
bCG_start=0;
betta=0.998805970149254;
chi=1.6;
csi=2;
dC=3.59511888395468;
delta=0.025;
deltax=0.0035;
e_start=0.868546660937556;
epsilon=3.8571;
erow=13.2974493789539;
g=0.483094100031411;
iota=0;
kappaB=8.93666666666632;
kappaG=8.92999999999966;
kappaI=10.78;
kappaP=71.2043014337046;
kGshare=0.205240771528513;
mu_start=0;
nuB=3.06625603734664E-14;
nuE=0.484624976727562;
nuG=15.1575821053026;
nuM=0.1924;
pB_start=0.741843835083861;
phi=2;
phipi=2.74;
piss=1.005;
rB_start=1.005375;
re_start=3.59511888395468;
rG_start=1.004625;
rhor=0.93;
rss=1.010025;
S1=1345.11268085813;
S2=0.446705684833127;
S3=3.67;
tau_start=0;
theta=1.0038;
varsig=0.8;
X_start=1947.92148285521;
y_start=2.24694930247167;
zeta=0.8;


rhoa=0.92;
rhoi=0.95;
rhog=0.95;
standa=tfp_stand;
standm=mon_stand;
standi=0.00;  
standg=0.00;

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
coffispol = exp(1);                                                       //*
//**************************************************************************


%%
%%%%%%%%%%%%%%%%%%%%%%%Non-Linear Model%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
model;

//**************************************************************************
// Definition of Modelbase Variables in Terms of Original Model Variables//*
interest   = log(r/rss)*4;                                            //*
inflationq = log(pi/piss)*4;                                            //*
inflation = inflationq;
output     = log(y/y_start);                                              //*
outputgap  = log(y/yf);                                               //*                                          //*
fispol     = vg;                                                         //*
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

%Households 
h^(phi)=w*lam;                                                         %(1)
1=betta*lam(1)/(lam*theta)*r/pi(1);                                    %(2)
1=betta*lam(1)/(lam*theta)*rG(1)+nuG/lam*bHG^(-kappaG);                %(3)
1=betta*lam(1)/(lam*theta)*rB(1)-nuB/lam*bHB^ (kappaB);                %(4)
% Intermediated Firms
y^((csi-1)/csi)=(1-zeta)^(1/csi)*(yG)^((csi-1)/csi)+(zeta)^(1/csi)*(yB)^((csi-1)/csi);  %(5b)
yG=(1-zeta)*(pG/pI)^(-csi)*y;                                          %(6)
yB=zeta    *(pB/pI)^(-csi)*y;                                          %(7)
(pi-pi(-1)^(iota)*piss^(1-iota))*pi=betta*lam(1)/lam*y(1)/y*pi(1)*(pi(1)-pi^(iota)*piss^(1-iota))+epsilon/kappaP*(pI-(epsilon-1)/epsilon); %(8)
% Basic Firms
yG=a*(kG(-1)/theta)^(alfa)*hG^(1-alfa);                                  %(9)
yB=a*(kB(-1)/theta)^(alfa)*hB^(1-alfa);                                 %(10)
(1-alfa)*pG                                        *yG=w*hG;          %(11)
(1-alfa)*(pB-tau*(1-mu)*nuE-nuM/(1+chi)*mu^(1+chi))*yB=w*hB;          %(12)
alfa*pG                                        *yG=rkG*kG(-1)/theta;  %(13)
alfa*(pB-tau*(1-mu)*nuE-nuM/(1+chi)*mu^(1+chi))*yB=rkB*kB(-1)/theta;  %(14)
rkG=rG*q(-1)-(1-delta)*q;                                             %(15)
rkB=rB*q(-1)-(1-delta)*q;                                             %(16)
mu=0;                                                                 %(17)
% Pollution
X=(1-deltax)*X(-1)/theta+e+erow;                                      %(18)
e=(1-mu)*nuE*yB;                                                      %(19)
%Capital-firms
k=(1-delta)*k(-1)/theta+epsI*(1-kappaI/2*(I/I(-1)*theta-theta)^2)*I;  %(20)
1=epsI*q*(1-kappaI/2*(I/I(-1)*theta-theta)^2-kappaI*(I/I(-1)*theta-theta)*I/I(-1)*theta)+kappaI*betta*lam(1)/(lam*theta)*q(1)*epsI(1)*(I(1)/I*theta-theta)*(I(1)/I*theta)^2; %(21)   
% Market clearing                
h=hG+hB;                                                              %(22)
k=kG+kB;                                                              %(23) 30
bHG+bCG=q*kG;                                                         %(24)
bHB+bCB=q*kB;                                                         %(25)
y=c+I+G+ yB*nuM/(1+chi)*mu^(1+chi)+y*kappaP/2*(pi-pi(-1)^(iota)*piss^(1-iota))^2;            %(26)
% Policy
bCG+bCB+dC=re;                                                        %(27)
% r/(rss)=((pi/piss)^(phipi))^(1-rhor)*(r(-1)/rss)^(rhor); -vm;           %(28)
log(G)=(1-rhog)*log(g)+rhog*log(G(-1))+vg;
% Other variables
lam=1/(c-varsig*c(-1)/theta)-betta*varsig/(c(1)*theta-varsig*c);      %(29)
log(a)=rhoa*log(a(-1))+va;
log(epsI)=rhoi*log(epsI(-1))+vi;
re=re_start;
tau=tau_start;  %40
sp=rG(1)-rB(1);
rGE=rG(1);
rBE=rB(1);
bCB=bCB_start;
price=tau*S1*S2/S3; 
X_ea=(1-deltax)*X_ea(-1)/theta+e;
ylog=log(y);
clog=log(c);
ilog=log(I);
klog=log(k); %50
hlog=log(h);
piA=4*pi;
rGA=4*rG(1);
rBA=4*rB(1);
elog=log(e);
yGlog=log(yG);
Xealog=log(X_ea);
Xlog=log(X);

%%%flexible economy

hf^(phi)=wf*lamf;                                                         %(1) 60
1=betta*lamf(1)/(lamf*theta)*rf/pif(1);                                    %(2)
1=betta*lamf(1)/(lamf*theta)*rGf(1)+nuG/lamf*bHGf^(-kappaG);                %(3)
1=betta*lamf(1)/(lamf*theta)*rBf(1)-nuB/lamf*bHBf^ (kappaB);                %(4)
% Intermediated Firms
yf^((csi-1)/csi)=(1-zeta)^(1/csi)*(yGf)^((csi-1)/csi)+(zeta)^(1/csi)*(yBf)^((csi-1)/csi);  %(5b)
yGf=(1-zeta)*(pGf/pIf)^(-csi)*yf;                                          %(6)
yBf=zeta    *(pBf/pIf)^(-csi)*yf;                                          %(7)
 0 = (1-epsilon) + epsilon*pIf; %(pi-pi(-1)^(iota)*piss^(1-iota))*pi=betta*lam(1)/lam*y(1)/y*pi(1)*(pi(1)-pi^(iota)*piss^(1-iota))+epsilon/kappaP*(pI-(epsilon-1)/epsilon); %(8)
% Basic Firms
yGf=a*(kGf(-1)/theta)^(alfa)*hGf^(1-alfa);                                  %(9)
yBf=a*(kBf(-1)/theta)^(alfa)*hBf^(1-alfa);                                 %(10)
(1-alfa)*pGf                                        *yGf=wf*hGf;          %(11)
(1-alfa)*(pBf-tau*(1-muf)*nuE-nuM/(1+chi)*muf^(1+chi))*yBf=wf*hBf;          %(12)
alfa*pGf                                        *yGf=rkGf*kGf(-1)/theta;  %(13)
alfa*(pBf-tau*(1-muf)*nuE-nuM/(1+chi)*muf^(1+chi))*yBf=rkBf*kBf(-1)/theta;  %(14)
rkGf=rGf*qf(-1)-(1-delta)*qf;                                             %(15)
rkBf=rBf*qf(-1)-(1-delta)*qf;                                             %(16)
muf=0;                                                                 %(17)
% Pollution
Xf=(1-deltax)*Xf(-1)/theta+ef+erow;                                      %(18)
ef=(1-muf)*nuE*yBf;                                                      %(19)
%Capital-firms
kf=(1-delta)*kf(-1)/theta+epsIf*(1-kappaI/2*(If/If(-1)*theta-theta)^2)*If;  %(20)
1=epsIf*qf*(1-kappaI/2*(If/If(-1)*theta-theta)^2-kappaI*(If/If(-1)*theta-theta)*If/If(-1)*theta)+kappaI*betta*lamf(1)/(lamf*theta)*qf(1)*epsIf(1)*(If(1)/If*theta-theta)*(If(1)/If*theta)^2; %(21)   
% Market clearing                
hf=hGf+hBf;                                                              %(22)
kf=kGf+kBf;                                                              %(23)
bHGf+bCGf=qf*kGf;                                                         %(24)
bHBf+bCBf=qf*kBf;                                                         %(25)
yf=cf+If+Gf+ yBf*nuM/(1+chi)*muf^(1+chi); %y=c+I+G+ yB*nuM/(1+chi)*muf^(1+chi)+y*kappaP/2*(pi-pi(-1)^(iota)*piss^(1-iota))^2;            %(26)
% Policy
bCGf+bCBf+dC=ref;                                                        %(27)
log(rf/rss)*4=cofintintb1*log(rf(-1)/rss)*4+cofintintb2*log(rf(-2)/rss)*4+cofintintb3*log(rf(-3)/rss)*4+cofintintb4*log(rf(-4)/rss)*4+cofintinf0*log(pif/piss)*4+cofintinfb1*log(pif(-1)/piss)*4+cofintinfb2*log(pif(-2)/piss)*4+cofintinfb3*log(pif(-3)/piss)*4+cofintinfb4*log(pif(-4)/piss)*4+cofintinff1*log(pif(+1)/piss)*4+cofintinff2*log(pif(+2)/piss)*4+cofintinff3*log(pif(+3)/piss)*4+cofintinff4*log(pif(+4)/piss)*4+cofintoutp*log(yf/y_start)+cofintoutpb1*log(yf(-1)/y_start)+cofintoutpb2*log(yf(-2)/y_start)+cofintoutpb3*log(yf(-3)/y_start)+cofintoutpb4*log(yf(-4)/y_start)+cofintoutpf1*log(yf(+1)/y_start)+cofintoutpf2*log(yf(+2)/y_start)+cofintoutpf3*log(yf(+3)/y_start)+cofintoutpf4*log(yf(+4)/y_start)+std_r_*interest_;                                          //* 
%rf/(rss)=((pif/piss)^(phipi))^(1-rhor)*(rf(-1)/rss)^(rhor)-vm;           %(28) change this 
log(Gf)=(1-rhog)*log(g)+rhog*log(Gf(-1))+vg;
% Other variables
lamf=1/(cf-varsig*cf(-1)/theta)-betta*varsig/(cf(1)*theta-varsig*cf);      %(29)
log(af)=rhoa*log(af(-1))+va;
log(epsIf)=rhoi*log(epsIf(-1))+vi;
ref=re_start;
tauf=tau_start;
spf=rGf(1)-rBf(1);
rGEf=rGf(1);
rBEf=rBf(1);
bCBf=bCB_start;
pricef=tauf*S1*S2/S3; 
X_eaf=(1-deltax)*X_eaf(-1)/theta+e;
ylogf=log(yf);
clogf=log(cf);
ilogf=log(If);
klogf=log(kf);
hlogf=log(hf);
piAf=4*pif;
rGAf=4*rGf(1);
rBAf=4*rBf(1);
elogf=log(ef);
yGlogf=log(yG);
Xealogf=log(X_eaf);
 Xlogf=log(Xf);
%log(Gf)=(1-rhog)*log(Gf)+rhog*log(Gf(-1))+vg


end;


%steady_state_model;
initval;
pi=piss;
q=1;
r=pi*theta/betta;             
rG=rG_start;                        
rB=rB_start;                        
rkG=rG-(1-delta);             
rkB=rB-(1-delta);             
pI=(epsilon-1)/epsilon;  
y=y_start;
pB=pB_start;
mu=mu_start;
X=X_start;
e=(1-(1-deltax)/theta)*X-erow;                       
bCG=bCG_start;
re=re_start;
pG=(1/(1-zeta)*(pI^(1-csi)-zeta*(pB)^(1-csi)))^(1/(1-csi));
yB=zeta*((pB/pI)^(-csi)*y);
yG=(1-zeta)*(pG/pI)^(-csi)*y;   
tau=nuM/nuE*mu^(chi);
kG=alfa*theta*pG*yG/(rkG);
kB=alfa*theta*(pB-tau*(1-mu)*nuE-nuM/(1+chi)*mu^(1+chi))*yB/(rkB);                       
hB=(yB/((kB/theta)^(alfa)))^(1/(1-alfa));
hG=(yG/((kG/theta)^(alfa)))^(1/(1-alfa));
k=kG+kB;
I=(1-(1-delta)/theta)*k;                           
w=(1-alfa)*pG*yG/hG;
h=hB+hG;
bCB=re-dC-bCG;
bHG=kG-bCG;
bHB=kB-bCB;
c=y-I-g-nuM/(1+chi)*mu^(1+chi)*yB;   
sp=rG-rB;
rGE=rG;
rBE=rB;
price=tau*S1*S2/S3; 
X_ea=e/(1-(1-deltax)/theta);
ylog=log(y);
yGlog=log(yG);
Xealog=log(X_ea);
 Xlog=log(X);
clog=log(c);
ilog=log(I);
klog=log(k);
hlog=log(h);
piA=4*pi;
a=1;
epsI=1;
rGA=4*rG;
rBA=4*rB;
elog=log(e);
lam=(theta-betta*varsig)/(c*(theta-varsig));
G=g;
interest   = 0;                                                        //*
inflation  = 0;                                                 	 //*
inflationq = 0;                                                 	 //*
outputgap  = 0;                                                       //*
output     = 0;
%interest   = rss;                                                        //*
%inflation  = piss;                                                 	 //*
%inflationq = piss*4;                                                 	 //*
%outputgap  = 0;                                                       //*
%output     = y_start;

pif=piss;
qf=1;
rf=pi*theta/betta;             
rGf=rG_start;                        
rBf=rB_start;                        
rkGf=rG-(1-delta);             
rkBf=rB-(1-delta);             
pIf=(epsilon-1)/epsilon;  
yf=y_start;
pBf=pB_start;
muf=mu_start;
Xf=X_start;
ef=(1-(1-deltax)/theta)*X-erow;                       
bCGf=bCG_start;
ref=re_start;
pGf=(1/(1-zeta)*(pI^(1-csi)-zeta*(pB)^(1-csi)))^(1/(1-csi));
yBf=zeta*((pB/pI)^(-csi)*y);
yGf=(1-zeta)*(pG/pI)^(-csi)*y;   
tauf=nuM/nuE*muf^(chi);
kGf=alfa*theta*pG*yG/(rkG);
kBf=alfa*theta*(pB-tau*(1-muf)*nuE-nuM/(1+chi)*muf^(1+chi))*yB/(rkB);                       
hBf=(yB/((kB/theta)^(alfa)))^(1/(1-alfa));
hGf=(yG/((kG/theta)^(alfa)))^(1/(1-alfa));
kf=kG+kB;
If=(1-(1-delta)/theta)*k;                           
wf=(1-alfa)*pG*yG/hG;
hf=hB+hG;
bCBf=re-dC-bCG;
bHGf=kG-bCG;
bHBf=kB-bCB;
cf=y-I-g-nuM/(1+chi)*muf^(1+chi)*yB;   
spf=rG-rB;
rGEf=rG;
rBEf=rB;
pricef=tau*S1*S2/S3; 
X_eaf=e/(1-(1-deltax)/theta);
ylogf=log(y);
yGlogf=log(yG);
Xealogf=log(X_ea);
 Xlogf=log(X);
clogf=log(c);
ilogf=log(I);
klogf=log(k);
hlogf=log(h);
piAf=4*pi;
af=1;
epsIf=1;
rGAf=4*rG;
rBAf=4*rB;
elogf=log(e);
lamf=(theta-betta*varsig)/(c*(theta-varsig));
Gf=g;

end;

steady;
%check;


shocks;
var va; stderr standa;   
var vi; stderr standi; 
% var vm; stderr standm;  
% var vg; stderr standg;  
var interest_ = 1;
var fiscal_ = 1;
end;

%% IRFs
%stoch_simul(irf=20,order=1) ylog clog ilog pi elog piA hlog klog Xealog ;