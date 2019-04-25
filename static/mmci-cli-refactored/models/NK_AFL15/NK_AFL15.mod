//**************************************************************************
// A New Comparative Approach to Macroeconomic Modeling and Policy Analysis
    //
// Volker Wieland, Tobias Cwik, Gernot J. Mueller, Sebastian Schmidt and 
// Maik Wolters
//
// Journal of Economic Behavior & Organization, vol. 83(3), 2015, pp. 523-541.
//**************************************************************************

//**************************************************************************
// Implementation of "Monetary Policy and Risk Taking"
// 
// Ignazio Angeloni, Ester Faia and Marco Lo Duca 
// 
// Journal of Economic Dynamics and Control, vol. 52 Issue C, 2015, pp. 285-307
//
// Implemented by:
// Sören Karau, soerenkarau@gmail.com
// Philipp Lieberknecht, philipp.lieberknecht@gmail.com
//**************************************************************************

//-------------------------------------------------------------------------
// 1. Variable declaration
//-------------------------------------------------------------------------

global mcss SIG ALFA PHI CoY zss;  

var c pai rn  k  z  y  mc  n  q  inv  rok  uc  un  Fk  Fn  bk  d  deprat  ra  br  fai  rd  crun cpai  
    cf    rnf kf zf yf mcf nf qf invf rokf ucf unf Fkf Fnf bkf df depratf raf brf faif rdf crunf // flex price
    a g ug // moved ug to endogenous variables to implement MMB fiscal shock, deleted rsh (monetary policy shock)

//**************************************************************************
// Modelbase Variables                                                   //*
    inflation inflationq  interest output outputgap fispol;              //* 
//**************************************************************************

varexo ua // deleted ur to omplement MMB monetary policy shock, moved ug

//**************************************************************************
// Modelbase Shocks                                                      //*       
  interest_ fiscal_;                                                     //*
//**************************************************************************     
                      
//-------------------------------------------------------------------------
//2. Parameter declaration
//-------------------------------------------------------------------------

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

PSI calvo ritcapss YoK IoK CoY PAIss css rnss kss zss yss mcss nss 
qss invss rokss gss ucss unss Fkss Fnss bkss dss depratss rass brss faiss rdss 
crunss cpaiss XXss OMP SIG PHI BETTA RHOa ALFA RHOg GY OMK THETA  DELTA EPSI  
BET HH vP vY vQ vR VV CR a_ss;

a_ss	= 0;
SIG     = 1;			%intertemporal elasticity of consumption
PHI     = 3;			%labour elasticity
OMK     = 2;			%adjustment cost parameter
EPSI 	= 6;			%elasticity of demand
RHOa    = 0.95;         %persistence productivity shock
RHOg    = 0.9;          %persistence gov spending shock
BETTA   = 0.995;        %discount rate
ALFA    = 1/3;			%capital share
PAIss	= 1;			%s.s. GROSS quarterly inflation rate
DELTA   = 0.025;        %capital depreciation
GY      = 0.2;          %gov spend output ratio
calvo   = 0.75;         %price stickiness
CR      = 0.10;         %cost of run 
BET     = 0.45;         %liquidity ratio
HH	    = 0.40;         %dispersion of uniform distriution, in the paper the variable that represents the range of the shock which is added to bank returns 'h'
VV	    = PHI;          
THETA   = 0.97;         %probability exit bankers

//Policy Rule parameters
vP      = 1.5;
vY      = (0.5)/4;
vQ      = 0;
vR      = 0;

//calibrations steady state
stst2=fsolve(@(stst2) (1-BETTA*(stst2+HH)/(2-BET+CR*(1+BET)))-THETA*((1-BETTA*(stst2+HH)/(2-BET+CR*(1+BET)))+(stst2+HH-(stst2+HH)/(2-BET))^2/(8*HH)-0.135)-0,[1]);
rass=stst2;
qss=1;
zss=rass-(1-DELTA);
rokss=zss+(1-DELTA);
rnss=PAIss/BETTA;
mcss=(EPSI-1)/EPSI;
YoK=zss/(mcss*ALFA);
IoK=DELTA;
IoY=IoK/YoK;
CoY=1-GY-IoY;
//stst=fsolve(@SteadyState_ynonlin, [1]);
//yss=stst;
//nss=(1-ALFA)*mcss/(PHI*CoY^SIG*yss^(SIG-1)+(1-ALFA)*mcss);
CoK=CoY*YoK;
XXss=((1-ALFA)*(mcss/VV)*YoK/CoK);             %with U = log(C) + vlog(1-N)
nss = XXss/(1+XXss);
kss=YoK^(1/(ALFA-1))*nss;
bkss=(1-BETTA*(rass+HH)/(2-BET+CR*(1+BET)))*qss*kss;
depratss=BETTA*(rass+HH)/(2-BET+CR*(1+BET));
dss=depratss*qss*kss;
brss=(1/2)*(1-(rass-rnss*depratss)/HH);
yss = (kss^ALFA)*(nss^(1-ALFA))-CR*brss*rass*kss;
Fkss=ALFA*YoK;
Fnss=(1-ALFA)*yss/nss;
invss=IoK*kss;
gss=GY*yss;
css=CoY*yss;
ucss=css^(-SIG);
unss=PHI/(nss-1);
ritcapss=(rass+HH-rnss*depratss)^2/(8*HH);
faiss=brss*(.25*(1+BET)*(1-CR)*(rnss+(rass-HH)/depratss));                    %risk premium on deposits 
rdss=rnss*(1-faiss);                                                          %Return on deposits with risk
OMP=yss*(EPSI-1)*calvo/((1-BETTA*calvo)*(1-calvo));
//PSI=THETA*qss*kss*(-0.075);
PSI=THETA*qss*kss*(-0.135);
crunss=CR*brss*rass*qss*kss;
cpaiss=0;

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
               
// Definition of Discretionary Fiscal Policy Parameter                   //*
coffispol = 0.01/GY;
//*
//**************************************************************************

//-------------------------------------------------------------------------
//3. Defining the model
//-------------------------------------------------------------------------

model;

//**************************************************************************
// Definition of Modelbase Variables in Terms of Original Model Variables//*
                                                                         //* 
interest     = 400*(log(rn) - log(rnss));                                            //* 
inflation    = 100*(log(pai) + log(pai(-1)) + log(pai(-2)) + log(pai(-3)) - 4*log(PAIss));            //*
inflationq   = 400*(log(pai) - log(PAIss));                                          //*     
outputgap    = 100*(log(y) - log(yf) - (log(yss) - steady_state(log(yf))));                      //*
output       = 100*(log(y) - log(yss));                                                //*
fispol       = ug;                                                       //*
//**************************************************************************

//**************************************************************************                                                                    
// Monetary Policy                                                        //*
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

// Original model code, sticky price economy
// 1.Marginal utility consumption
uc=c^(-SIG);

// 2.MU labour
un=PHI*(1/(n-1)); 

// 3.Marginal productivity capital
Fk=ALFA*y/k(-1);// 

// 4.MP labour
Fn=(1-ALFA)*y/n;  

// 5.Productivity shock
a=RHOa*a(-1)+1/100*ua;  

// 6.Gov spending shock
//(g/gss)=(g(-1)/gss)^(RHOg)*exp(ug); 
log(g)-log(gss)=RHOg*(log(g(-1))-log(gss))+ug;

// 7.Euler
uc=BETTA*uc(+1)*rd; 

//8. Return on deposits
rd =   (rn*(1-fai))/pai(+1);                                                              

// 9.Marginal cost
mc*Fn=-un/uc; 

// 10.FOC on k
mc*Fk=z; 

// 11.Tobin's q
q=(1-OMK*(inv/k(-1)-DELTA))^(-1); 

// 12.Return on capital
ra/pai(+1)=rok(+1)/q;

// 13.Return on capital (unitary)
rok=z+q*(1-DELTA+OMK*(inv/k(-1)-DELTA)*inv/k(-1)-OMK/2*(inv/k(-1)-DELTA)^2); 

// 14.Philipps curve
uc*pai*(pai-PAIss)=BETTA*uc(+1)*pai(+1)*(pai(+1)-PAIss)+uc*(exp(a))*k(-1)^ALFA*n^(1-ALFA)*(EPSI/OMP)*(mc-((EPSI-1)/EPSI));

// 15.Capital accumulation  
k=(1-DELTA)*k(-1)+inv-OMK/2*(inv/k(-1)-DELTA)^2*k(-1); 

// 16.Resource constraint
y=c+inv+cpai+crun+g;

// 17.Cost of inflation
cpai=(OMP/2)*(pai-PAIss)^2;

// 18.Cost of run
crun=CR*br*ra*q*k;

// 19.Taylor rule
//log(rn/rnss)=vR*log(rn(-1)/rnss)+(1-vR)*(vP*log(pai/PAIss)+vQ*log(q/qss)+vY*log((y-crun)/yss))+rsh;

// 20. Monetary policy shock
//rsh=0.2*rsh(-1)+ur; 

// 21.Production function
y=exp(a)*(k(-1)^ALFA)*(n^(1-ALFA)); 

// 22.Optimal bank capital    
bk=(1-(1/rn)*(ra+HH)/(2-BET+CR*(1+BET)))*q*k(-1);

// 23.Total loans
d+bk=q*k(-1);

// 24.Accumulation of bank capital
bk(+1)=THETA*(bk+((ra(+1)+HH-(ra(+1)+HH)/(2-BET))^2/(8*HH))*q(+1)*k)+PSI; 

// 25.Deposit ratio
deprat=d/(q*k(-1));

// 26.Bank riskiness
br=(1/2)*(1-(ra-rn*deprat)/HH); 

// 27. Premium on deposits
fai= br*(.25*(1+BET)*(1-CR)*(rn+(ra-HH)/deprat));                                                                      

// flex-price economy, added to define output gap
// 1f.Marginal utility consumption
ucf=cf^(-SIG);

// 2f.MU labour
unf=PHI*(1/(nf-1)); 

// 3f.Marginal productivity capital
Fkf=ALFA*yf/kf(-1);// 

// 4f.MP labour
Fnf=(1-ALFA)*yf/nf;  

// 7f.Euler
ucf=BETTA*ucf(+1)*rdf; 

// 8f. Return on deposits
rdf =   (rnf*(1-faif));                                                              

// 9f.Marginal cost
mcf*Fnf=-unf/ucf; 

// 10f.FOC on kf
mcf*Fkf=zf; 

// 11f.Tobin's qf
qf=(1-OMK*(invf/kf(-1)-DELTA))^(-1); 

// 12f.Return on capital
raf=rokf(+1)/qf;

// 13f.Return on capital (unitary)
rokf=zf+qf*(1-DELTA+OMK*(invf/kf(-1)-DELTA)*invf/kf(-1)-OMK/2*(invf/kf(-1)-DELTA)^2); 

// 14f.Philipps curve
0 = ucf*yf*((1-EPSI)+EPSI*mcf);

// 15f.Capital accumulation  
kf=(1-DELTA)*kf(-1)+invf-OMK/2*(invf/kf(-1)-DELTA)^2*kf(-1); 

// 16f.Resource constraint
yf=cf+invf+cpai+crunf+g;

// 18f.Cost of run
crunf=CR*brf*raf*qf*kf;

// 21f.Production function
yf=exp(a)*(kf(-1)^ALFA)*(nf^(1-ALFA)); 

// 22f.Optimal bank capital    
bkf=(1-(1/rnf)*(raf+HH)/(2-BET+CR*(1+BET)))*qf*kf(-1);

// 23f.Total loans
df+bkf=qf*kf(-1);

// 24f.Accumulation of bank capital
bkf(+1)=THETA*(bkf+((raf(+1)+HH-(raf(+1)+HH)/(2-BET))^2/(8*HH))*qf(+1)*kf)+PSI; 

// 25f.Deposit ratio
depratf=df/(qf*kf(-1));

// 26f.Bank riskiness
brf=(1/2)*(1-(raf-rnf*depratf)/HH); 

// 27f. Premium on deposits
faif= brf*(.25*(1+BET)*(1-CR)*(rnf+(raf-HH)/depratf));    

end;

//-------------------------------------------------------------------------
//4. Shocks
//-------------------------------------------------------------------------
shocks;
var ua=0.01;
//var ug=0;
var fiscal_ = 1;
//var ur=1;
var interest_ = 1;
end;

//-------------------------------------------------------------------------
//5. Steady state
//-------------------------------------------------------------------------

steady_state_model;
c = css;
pai = PAIss;
rn = rnss;
k = kss;
z = zss;
y = yss+crunss;
mc = mcss;
n = nss;
q = qss;
inv = invss;
rok = rokss;
a = a_ss;
g = gss;
uc = ucss;
un = unss;
Fk = Fkss;
Fn = Fnss;
bk = bkss;
d = dss;
deprat = depratss;
ra = rass;
br = brss;
fai = faiss;                     
rd = rdss;                                                          
crun = crunss;
cpai = cpaiss;
//rsh = 0;
cf = css;
rnf = rnss;
kf = kss;
zf = zss;
yf = yss+crunss;
mcf = mcss;
nf = nss;
qf = qss;
invf = invss;
rokf = rokss;
ucf = ucss;
unf = unss;
Fkf = Fkss;
Fnf = Fnss;
bkf = bkss;
df = dss;
depratf = depratss;
raf = rass;
brf = brss;
faif = faiss;                     
rdf = rdss;                                                          
crunf = crunss;
ug = 0;
interest = 0;
inflation = 0;
inflationq = 0;
output = 0;
outputgap = 0;
fispol = 0;
end;

steady(nocheck);

//-------------------------------------------------------------------------
//6. Simulation
//-------------------------------------------------------------------------
//Computes IRF
//stoch_simul(irf=40,order=1,nograph) y pai c inv deprat br;


