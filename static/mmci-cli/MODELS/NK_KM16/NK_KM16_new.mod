//*****************************************
// A small scale NK DSGE model 
// with money, debt maturity,  
// imperfect information and learning
//
// Krause M. and Moyen S., 02/12/2016 
//*****************************************


var   Y $Y$, Disp, C, H, Mu $\mu$ , M,Int_new $i^{new}$ , Int_D $i^D$, D, D_new $D^{new}$, Tau $\tau$, Tax_obs,Mu_obs,        
      Q1, Pie $\pi$, Lambda $\lambda$ , Mc $mc$ ,Int $i$ ,AW,Z1,Z2,
      Q2, Ptild $\tilde\pi$, W, DG,A_t $A$,Dbs,DI_obs,Rrate $R^{obs}$,Delta $\Delta$, 
      Y_obs $Y^{obs}$ Int_obs $i^{obs}$ Int_new_obs $i^{new,obs}$ Pie_obs $\pi^{obs}$ H_obs $H^{obs}$ W_obs $W^{obs}$ C_obs $C^{obs}$ Tau_obs $\tau^{obs}$ D_obs $D^{obs}$   
      D_new_obs $D^{new,obs}$  Int_D_obs $i^{D,obs}$ 
      PIESTAR $\pi^{\ast}$ EPSI_R $\epsilon^i$  PIESTAR_frcst PIESTAR_est EPSI_R_est EPSI_R_frcst ETA_PIE_est ETA_R_est
       M_obs $M^{obs}$  PIESTAR4      
      Mcn $mc^n$ , Wn $W^n$,Z1n $Z1^n$,Z2n$Z2^n$,Lambdan $\lambda^n$,Taun $\tau^n$,Hn $H^n$,Mn $M^n$,D_newn $D^{new^n}$,Int_Dn $i^{D^n}$,Dn $D^n$,Rn $R^n$,Pien $\pi^n$ ,Yn $Y^n$,
      Cn $C^n$,Taun_obs $\tau^{n,obs}$,Yn_obs $Y^{n,obs}$,Int_newn $i^{new^n}$,Mun $\mu^n$,Intn $i^n$,Dn_obs $D^{n,obs}$;
     

varexo epsiA epsiG epsiD ETA_R ETA_PIESTAR epsiDelta;
  

parameters 

           Lambdas $\lambda_s$,Cs $C^s$,Disps ,alphaa $\alpha$,B0,DHS,kappa $\kappa$,gamma1w $\gamma^w_1$,markupw $\mu_w$,phiw $\phi_w$,sigmam $\sigma_m$,SMY,
           gamma1 $\gamma_1$, gamma2 $\gamma_2$, betta $\beta$, phi $\phi$,epsi $\epsilon_i$ , epsps, Pies $\pi_s$,Int_news,D_news, Int_Ds,
           rhoi $\rho_i$, phipie $\phi_{\pi}$, phiy $\phi_y$, sigmac $\sigma_c$, sigmah $\sigma_h$, Ints,ws $w^s$,trs,epsim, rhoto $\rho^{\tau,obs}$, xi_b $\xi_b$,xi_y $\xi_y$,
           Ys, Hs, Ptilds, markup $\mu$, Mcs $mc^s$, Q1s, Q2s,xi$\xi$, Ws $W^s$, As $A^s$, DGs,Taus $\tau^s$,Ds $D^s$,rhoD $\rho^D$,Tauns,Cns,Yns,Mns,Hns,
           rhoA $\rho_A$ rhoG $\rho_G$ rho $\rho$ gpi gx rhor $\rho^r$ rhopi $\rho_{\pi}$ sR spistar kappa1 $\kappa_1$ kappa2 $\kappa_2$ Ms $M^s$ sigmat $\sigma_t$ rhoDel Mus;

//*****************************************
// Structural Parameters
//*****************************************
sigmat = 1;

betta  = 0.99;  
phi    = 0.75;
phiw   = 0*0.75;   
sigmac = 1.5;
sigmah = 2; 
sigmam = 2.56;
epsi   = 6;
epsiw  = 6;
markup = epsi/(epsi-1);
markupw = epsiw/(epsiw-1);
gamma1 = 0;
gamma2 = 1-gamma1;   
gamma1w = 0;   
alphaa = 0.0472; 
B0 = 0.20; 
SMY = 0.07;

//Shock persistence 
rhoA = 0.95;
rhoD = 0;
rhoG = 0;
rhoDel = 0.9; 

//Monetary policy rule
phipie = 1.5;
phiy = 0.5;
rhoi = 0.75;

// Tax rule
// Baseline
rhoto = 0.5;
xi_b  = 0.0037;  
xi_y  = 0;   


//*****************************************
// Parameters governing the learning process
//*****************************************
    
rho     = 0.75 ; 
gpi     = 1.5  ; 
gx      = 0.5  ; 
rhor    = 0.01 ; 
rhopi   = 0.99 ; // 0.75
sR      = 0.17 ; 
spistar = 0.1  ; 

[KV] = Kalman_Gain

kappa1 = KV(1);
kappa2 = KV(2);

model;


//*****************************************
// Natural block
//*****************************************
Mcn-1/markup;
Mcn - Wn/A_t;
(markupw*Z1n/Z2n)^(-1/(markupw*(1+sigmah)-1)) = Wn^(1/(1-markupw));   
Z1n = kappa*Hn^(1+sigmah)*Wn^((1+sigmah)*markupw/(markupw-1));
Z2n = (1-Taun)*Lambdan*Hn*Wn^(markupw/(markupw-1));                              
Yn - Cn - DG;
Yn-Hn*A_t;   
Mn  = (xi*Cn^sigmac*(1+Intn)/Intn)^(1/sigmam);
1 = (betta*Delta)*(Cn(+1)/Cn)^(-sigmac)*Rn;
1 = (betta*Delta)*(Cn(+1)/Cn)^(-sigmac)/Pien(+1)*(1+Int_newn- Mun(+1)*(1-alphaa)*(Int_newn(+1)-Int_newn));
Mun = (betta*Delta)*(Cn(+1)/Cn)^(-sigmac)/Pien(+1)*(1+Mun(+1)*(1-alphaa));
Lambdan - (Cn)^(-sigmac);
Dn = (1-alphaa)*D(-1)/Pien + D_newn + Dbs;
(1-alphaa)*Int_D(-1)/Pien*D(-1) + Int_newn*D_newn = Int_Dn*Dn -Int_Dn*Dbs; 
Taun*Wn*Hn + Mn - M(-1)/Pien + D_newn = DG + (alphaa+Int_D(-1))*D(-1)/Pien ;
Taun_obs/4 = rhoto*Taun_obs(-1)/4 + xi_b*Dn_obs/4 + xi_y*Yn_obs/4;
Pien = Pies*exp(PIESTAR/100);
Rn = (1+Intn)/Pien(+1);

//*****************************************
//Price dynamics
//*****************************************
Q1 - Y*Lambda*Mc - phi*betta*Pie(+1)^(epsi)*Pie^(-gamma1*epsi)*(Pies*exp(PIESTAR(+1)/100))^(-epsi*(1-gamma1))*Q1(+1);   //PIESTAR(+1)
Q2 - Y*Lambda - phi*betta*Pie(+1)^(epsi-1)*Pie^(gamma1*(1-epsi))*(Pies*exp(PIESTAR(+1)/100))^((1-epsi)*(1-gamma1))*Q2(+1);//PIESTAR(+1)
Ptild-markup*Q1/Q2;
1-phi*(Pies*exp(PIESTAR/100))^((1-gamma1)*(1-epsi))*Pie(-1)^(gamma1*(1-epsi))*Pie^(epsi-1)-(1-phi)*Ptild^(1-epsi); //PIESTAR
Mc - W/A_t;

//*****************************************
// Wage dynamics
//*****************************************
AW = Pie*Pie(-1)^(-gamma1w) * (Pies*exp(PIESTAR/100))^(gamma1w-1);
W^(1/(1-markupw)) = (1-phiw)*(markupw*Z1/Z2)^(-1/(markupw*(1+sigmah)-1))+ phiw*W(-1)^(1/(1-markupw))*AW^(-1/(1-markupw));                                         
Z1 = kappa*H^(1+sigmah)*W^((1+sigmah)*markupw/(markupw-1))+ betta*phiw*AW(1)^((1+sigmah)*markupw/(markupw-1))*Z1(1);                                     
Z2 = (1-Tau)*Lambda*H*W^(markupw/(markupw-1)) + betta*phiw * AW(1)^(1/(markupw-1))*Z2(1) ;                             

//*****************************************
//Aggregate output
//*****************************************
Y - C - DG;
Y - H*A_t/Disp;

//*****************************************
//Price dispersion
//*****************************************
Disp-(1-phi)*(Ptild)^(-epsi)-phi*Pie^(epsi)*(Pies*exp(PIESTAR/100))^(-epsi*(1-gamma1))*Pie(-1)^(-epsi*gamma1)*Disp(-1);

//*****************************************    
//First-order conditions of consumers
//*****************************************
1 = (betta*Delta)*(C(+1)/C)^(-sigmac)*Pie(+1)^(-1)*(1+Int);
M = (xi*C^sigmac*(1+Int)/Int)^(1/sigmam);
1 = (betta*Delta)*(C(+1)/C)^(-sigmac)*Pie(+1)^(-1)*(1+Int_new- Mu(+1)*(1-alphaa)*(Int_new(+1)-Int_new));
Mu = (betta*Delta)*(C(+1)/C)^(-sigmac)*Pie(+1)^(-1)*(1+Mu(+1)*(1-alphaa));
Lambda - (C)^(-sigmac);

//*****************************************
// Maturity structure
//*****************************************
D = (1-alphaa)*D(-1)/Pie + D_new + Dbs;  
(1-alphaa)*Int_D(-1)/Pie*D(-1) + Int_new*(D_new) = Int_D*(D) - Int_D*Dbs;

//*****************************************
// Government Budget Constraint
//*****************************************
Tau*W*H + M - M(-1)/Pie + D_new = DG + (alphaa+Int_D(-1))/Pie*D(-1); 

//*****************************************
// Fiscal Rule
//*****************************************
Tau_obs = rhoto*Tau_obs(-1) + xi_b*D_obs; 

//*****************************************
// Interest rate rule
//*****************************************

Int_obs/4 = (1-rho)*(PIESTAR + gpi*(Pie_obs/4 - PIESTAR)+ gx*(Y_obs-Yn_obs)) + rho*(Int_obs(-1))/4 + EPSI_R;

PIESTAR = rhopi*PIESTAR(-1) + ETA_PIESTAR;
EPSI_R = rhor*EPSI_R(-1) + ETA_R;

//*****************************************
//Technology shock
//*****************************************
A_t/As-((A_t(-1)/As)^rhoA)*exp(epsiA);

//*****************************************
//Government spending shock
//*****************************************
DG/DGs-((DG(-1)/DGs)^rhoG)*exp(epsiG/100); 

//*****************************************
//Debt shock
//*****************************************
Dbs = rhoD*Dbs(-1)+ epsiD;

//*****************************************
//Discount factor shock
//*****************************************
log(Delta) = rhoDel*log(Delta(-1)) + epsiDelta;

//*****************************************
//Observed variables
//*****************************************

Pie_obs = 100*log(Pie/Pies)*4;          
Int_obs = 100*(Int-Ints)*4;
Int_new_obs = 100*(Int_new-Ints)*4;
Int_D_obs = 100*(Int_D-Int_Ds)*4;
Y_obs = 100*log(Y/Ys);
Yn_obs = 100*log(Yn/Ys);

C_obs = 100*log(C/Cs);
W_obs = 100*log(W/Ws);
H_obs = 100*log(H/Hs);
Tau_obs = 100*(Tau-Taus);
Taun_obs = 100*(Taun-Taus);
D_obs = 100*log(D/Ds);
Dn_obs = 100*log(Dn/Ds);
D_new_obs = 100*log(D_new/D_news); 
M_obs = 100*log(M/Ms);
PIESTAR4 = PIESTAR*4;
DI_obs = D_obs + Int_D_obs;
Tax_obs = Tau_obs+W_obs+H_obs;
Rrate = Int_obs - Pie_obs(+1); 
Mu_obs = 100*log(Mu/Mus);

//*****************************************
// Imperfect information and learning 
//*****************************************

PIESTAR_frcst = (rhopi-kappa1*(1-rho)*(1-gpi))*PIESTAR_frcst(-1)-kappa1*EPSI_R_frcst(-1)+kappa1*(1-rho)*(1-gpi)*PIESTAR+kappa1*EPSI_R;               

EPSI_R_frcst = -kappa2*(1-rho)*(1-gpi)*PIESTAR_frcst(-1) + (rhor-kappa2)*EPSI_R_frcst(-1)+kappa2*(1-rho)*(1-gpi)*PIESTAR+kappa2*EPSI_R;

PIESTAR_est = 1/rhopi*((rhopi-kappa1*(1-rho)*(1-gpi))*PIESTAR_frcst(-1)-kappa1*EPSI_R_frcst(-1)+kappa1*(1-rho)*(1-gpi)*PIESTAR+kappa1*EPSI_R);

EPSI_R_est = 1/rhor*(-kappa2*(1-rho)*(1-gpi)*PIESTAR_frcst(-1)+(rhor-kappa2)*EPSI_R_frcst(-1)+kappa2*(1-rho)*(1-gpi)*PIESTAR + kappa2*EPSI_R);

ETA_PIE_est = PIESTAR_est - PIESTAR_frcst(-1);

ETA_R_est = EPSI_R_est - EPSI_R_frcst(-1);   
end;

shocks;
var epsiA  = 1;
var epsiG = 0;
var ETA_R;
stderr 0.17;
var ETA_PIESTAR; 
stderr 1; 
var epsiD; 
stderr 0.107;
var epsiDelta; 
stderr 0.03;
end;

Fig2= 1;

if Fig2 == 0
    
    // Plots figure 2
    steady;
    warning('OFF');
    stoch_simul(order = 1, irf = 100, noprint,nograph)D_obs,D_new_obs,Pie_obs,Int_obs,Int_new_obs,Int_D_obs,Y_obs,Rrate,DI_obs,W_obs,Tau_obs,Tax_obs, Int, PIESTAR4, ETA_PIE_est, ETA_R_est, PIESTAR, EPSI_R;
    
    extension =['Baseline'];
    save_irf;
    
    // Tax rule variant
    
    Params_list = str2mat('rhoto','xi_b');
    Params_vals = [0.5;0.035];
    
    nparams = size(Params_list,1)
    pindx = [ ];
    
    for i=1:nparams
        pindx = strmatch(Params_list(i,:),M_.param_names,'exact')
        M_.params(pindx) = Params_vals(i)
    end
    warning('OFF');
    stoch_simul(order = 1, irf = 100, noprint,nograph)D_obs,D_new_obs,Pie_obs,Int_obs,Int_new_obs,Int_D_obs,Y_obs,Rrate,DI_obs,W_obs,Tau_obs,Tax_obs, Int, PIESTAR4, ETA_PIE_est, ETA_R_est, PIESTAR, EPSI_R;
    
    extension =['Taxes'];
    save_irf;
    
    plot_irfs(80,'DS_1')
    
else
    
    // Plots figures 3 to 5
    steady;
    warning('OFF');
    stoch_simul(order = 1, irf = 100, noprint,nograph)D_obs,D_new_obs,Pie_obs,Int_obs,Int_new_obs,Int_D_obs,Y_obs,Rrate,DI_obs,W_obs,Tau_obs,Tax_obs, Int, PIESTAR4, ETA_PIE_est, ETA_R_est, PIESTAR, EPSI_R;
    
    save_irf;
    
    Learn_Irfs_1(str2mat('EPSI_R','PIESTAR4'),80,'Baseline');
    
    Learn_Irfs_2(str2mat('D_obs','D_new_obs','Pie_obs','Int_obs','Int_new_obs','Int_D_obs','Y_obs','Rrate','DI_obs','W_obs','Tau_obs','Tax_obs'),80,'Baseline');
    
end
