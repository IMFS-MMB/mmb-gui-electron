//*******************MMB

//Model: NK_inflation target

var   yn cn hn wn mn Dn Dnewn i_Dn i_Dnewn in Rn pin lamdan mun taun Dbs taun_obs PIESTARn Dn_obs 
y c h w m D Dnew i_D i_Dnew i R pi lamda mu tau PIESTAR pistar MC G D_obs tau_obs i_obs pi_obs y_obs yn_obs
Disp Z1 Z2 c_obs w_obs h_obs Dnew_obs m_obs Rrate mu_obs i_Dnew_obs G_
PIESTAR_frcst EPSI_R_frcst PIESTAR_est EPSI_R_est ETA_PIE_est  ETA_R_est

//**********************************************************************************************************
//Modelbase Variables
interest inflation inflationq outputgap output fispol; 
//**************************************************************************************************************

varexo epsi_D eta_PIESTAR  

//**************************************************************************************************************
//Model base shocks
interest_ fiscal_;
//***************************************************************************************************************

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
        std_r_ std_r_quart coffispol                                             //*
//**************************************************************************
sigmac,sigmam,sigmah,theta,epsi,markup,epsiw,markupw, betta,alphaa,rho_tau,phi_tau_D,rho_D,rho_pi,phi, rho_i,
phipi,phiy, rho_r,rho_G,xi rho gpi gx rhor rhopi sR spistar kappa1 kappa2;


betta=0.99;
theta=0.75 ; //price stickiness phi
sigmac=1.5;
sigmah=2;
sigmam=2.56;
epsi=6;
epsiw=6;
markup=epsi/(epsi-1);
markupw=epsiw/(epsiw-1);
alphaa=0.0472;
xi=7.1406*10^(-6);//5.2*10^(-6);//
phi= 35.4634381498;   //42.553400003;   //35.94;  //



//shock persistence 
 
rho_D=0.00; //persistence of a debt shock
rho_pi=0.99; //persistence of the AR(1) inflation target shock 
rho_G=0;//persistence of a govern.spending shock

//tax rule

rho_tau=0.5; //persistence of tax rule
phi_tau_D=0.0037; // 0.035; // response of tax on debt

// Monetary policy shock
rho_i=0.75; //persistence of the interest rate;
phipi=1.5; //response of i on inflation
phiy=0.5; // response of i on y
rho_r=0.01;//persistence of interest rate shock

rho     = 0.75 ; 
gpi     = 1.5  ; 
gx      = 0.5  ; 
rhor    = 0.01 ; 
rhopi   = 0.99 ; // 0.75
sR      = 0.17 ; 
spistar = 0.1  ; 
kappa1 = 0.01;
kappa2 = 0.01;


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
coffispol =0.01/0.2; //0.2=government spending to GDP
                                                          
                      
model;

//*****************************************************************
//Definition of Modelbase variables in terms of Original Model Variables//*

%interest=4*100*log(i/STEADY_STATE(i));//i*4;
interest=i_obs;//i*4;
inflation=100*(log(pi)+log(pi(-1))+log(pi(-2))+log(pi(-3))-4*log(STEADY_STATE(pi))); //annual inflation
inflationq=100*4*log(pi/STEADY_STATE(pi)); //annualized quarterly inflation
outputgap=100*(log(y)-log(yn));
output=100*(log(y)-log(STEADY_STATE(y)));
fispol=G_;

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
           + std_r_ *interest_;                                         //* 
                                 
// Discretionary Government Spending                                     //*
                                                                         //*
fispol = coffispol*fiscal_;

//Original Model code:

//*******************************************************************************
//******************************Natural block***************************************************//
//**************************************************************************************

Rn=(1+in)/pin(+1); //gross
wn=1/markup;
yn=hn;
yn-cn-G;
mn  = (xi*cn^sigmac*(1+in)/in)^(1/sigmam);
1 = betta*(cn(+1)/cn)^(-sigmac)*Rn;
1 = betta*(cn(+1)/cn)^(-sigmac)/pin(+1)*(1+i_Dnewn- mun(+1)*(1-alphaa)*(i_Dnewn(+1)-i_Dnewn));
mun = betta*(cn(+1)/cn)^(-sigmac)/pin(+1)*(1+mun(+1)*(1-alphaa));
lamdan=(cn)^(-sigmac);
phi*hn^sigmah=cn^(-sigmac)*(1-taun)*wn*(1/markupw);
Dn=(1-alphaa)*Dn(-1)/pin + Dnewn + Dbs;
(1-alphaa)*i_Dn(-1)*Dn(-1)/pin + i_Dnewn*Dnewn = i_Dn*Dn -i_Dn*Dbs;
taun*wn*hn + mn - mn(-1)/pin + Dnewn = G + (alphaa+i_Dn(-1))*Dn(-1)/pin ;
taun_obs = rho_tau*(taun_obs(-1)) + phi_tau_D*(Dn_obs);
pin=STEADY_STATE(pin)*exp(PIESTARn/100);
PIESTARn=rho_pi*PIESTARn(-1)+eta_PIESTAR;
Dbs=rho_D*Dbs(-1)+ epsi_D;


// Gov spending shock

//G/STEADY_STATE(G)=((G(-1)/STEADY_STATE(G))^rho_G)*exp(G_/100);
log(G)-log(STEADY_STATE(G))=G_ ;//rho_G*(log(G(-1))-log(STEADY_STATE(G)))


//*****************************************************************
//****************************STICKY MODEL*************************
//*****************************************************************

R=(1+i)/pi(+1);
w=MC;
y=h/Disp;
y-c-G;
m  = (xi*c^sigmac*(1+i)/i)^(1/sigmam);
1 = betta*(c(+1)/c)^(-sigmac)*R;
1 = betta*(c(+1)/c)^(-sigmac)/pi(+1)*(1+i_Dnew- mu(+1)*(1-alphaa)*(i_Dnew(+1)-i_Dnew));
mu = betta*(c(+1)/c)^(-sigmac)/pi(+1)*(1+mu(+1)*(1-alphaa));
lamda=(c)^(-sigmac);
phi*h^sigmah=c^(-sigmac)*(1-tau)*w*(1/markupw);
D=(1-alphaa)*D(-1)/pi + Dnew + Dbs;
(1-alphaa)*i_D(-1)/pi*D(-1) + i_Dnew*Dnew = i_D*D -i_D*Dbs;
tau*w*h + m - m(-1)/pi + Dnew = G + (alphaa+i_D(-1))*D(-1)/pi ;
tau_obs= rho_tau*(tau_obs(-1))+ phi_tau_D*(D_obs);

//i_obs/4=(1-rho_i)*(PIESTAR+phipi*(pi_obs/4-PIESTAR)+phiy*(y_obs-yn_obs))+rho_i*i_obs(-1)/4+epsi_R;
//epsi_R=rho_r*epsi_R(-1)+eta_r;

PIESTAR=rho_pi*PIESTAR(-1)+eta_PIESTAR;
pistar=STEADY_STATE(pistar)*exp(PIESTAR/100);

Z1=lamda*MC*y+theta*betta*(pi(+1)/pistar(+1))^(epsi)*Z1(+1);
Z2=lamda*y+theta*betta*(pi(+1)/pistar(+1))^(epsi-1)*Z2(+1);
1=theta*pistar^(1-epsi)*pi^(epsi-1)+(1-theta)*(epsi/(epsi-1)*Z1/Z2)^(1-epsi);//aggregate price index
Disp=(theta)*Disp(-1)*(pi/pistar)^(epsi)+(1-theta)*(epsi/(epsi-1)*Z1/Z2)^(-epsi);




//**********************observable variables*******************

pi_obs =100*log(pi/STEADY_STATE(pi))*4; //100*(pi-STEADY_STATE(pi))*4; //
i_obs = 100*(i-STEADY_STATE(i))*4;
y_obs = 100*log(y/STEADY_STATE(y));
yn_obs = 100*log(yn/STEADY_STATE(yn));
tau_obs = 100*(tau-STEADY_STATE(tau));
taun_obs = 100*(taun-STEADY_STATE(taun));
D_obs = 100*log(D/STEADY_STATE(D));
Dn_obs = 100*log(Dn/STEADY_STATE(Dn));

c_obs = 100*log(c/STEADY_STATE(c));
w_obs = 100*log(w/STEADY_STATE(w));
h_obs = 100*log(h/STEADY_STATE(h));
Dnew_obs = 100*log(Dnew/STEADY_STATE(Dnew));
 
m_obs = 100*log(m/STEADY_STATE(m));
//PIESTAR4 = PIESTAR*4;
//DI_obs = D_obs + Int_D_obs;
//Tax_obs = Tau_obs+W_obs+H_obs;
Rrate = i_obs - pi_obs(+1); //linearized
mu_obs = 100*log(mu/STEADY_STATE(mu));
i_Dnew_obs=100*(i_Dnew-STEADY_STATE(i_Dnew))*4;
//G_obs=100*log(G/STEADY_STATE(G));

PIESTAR_frcst = (rhopi-kappa1*(1-rho)*(1-gpi))*PIESTAR_frcst(-1)-kappa1*EPSI_R_frcst(-1)+kappa1*(1-rho)*(1-gpi)*PIESTAR+kappa1*interest_;               
EPSI_R_frcst = -kappa2*(1-rho)*(1-gpi)*PIESTAR_frcst(-1) + (rhor-kappa2)*EPSI_R_frcst(-1)+kappa2*(1-rho)*(1-gpi)*PIESTAR+kappa2*interest_;
PIESTAR_est = 1/rhopi*((rhopi-kappa1*(1-rho)*(1-gpi))*PIESTAR_frcst(-1)-kappa1*EPSI_R_frcst(-1)+kappa1*(1-rho)*(1-gpi)*PIESTAR+kappa1*interest_);
EPSI_R_est = 1/rhor*(-kappa2*(1-rho)*(1-gpi)*PIESTAR_frcst(-1)+(rhor-kappa2)*EPSI_R_frcst(-1)+kappa2*(1-rho)*(1-gpi)*PIESTAR + kappa2*interest_);
ETA_PIE_est = PIESTAR_est - PIESTAR_frcst(-1);
ETA_R_est = EPSI_R_est - EPSI_R_frcst(-1);   

end;

shocks;
var eta_PIESTAR=1;
var  epsi_D=0.107^2;
var interest_=1;
var fiscal_=1;

end;

//***********************STEADY STATE MODEL*********************
//**************************************************************
steady_state_model;

wn=1/markup;
hn=0.33;
yn=hn;
//mn=0.07*yn;
pin=1.005;
Rn=1/betta;
PIESTARn=0;
Dbs=0;
in=Rn*pin-1;
G=0.2*yn;
cn=yn-G;
Dn=0.5*yn;
lamdan=(cn)^(-sigmac);
mn=(xi*cn^sigmac*(1+in)/in)^(1/sigmam);
//xi = mn^(sigmam)/(cn^sigmac*(1+in)/in);
mun=betta/pin*(1-betta/pin*(1-alphaa))^(-1);
Dnewn=(1-(1-alphaa)/pin)*Dn;
i_Dnewn=pin/betta-1;
i_Dn=i_Dnewn*Dnewn*((1-(1-alphaa)/pin)*Dn)^(-1);
taun=(G+(alphaa+i_Dn)*Dn/pin-Dnewn-mn+mn/pin)/(wn*hn);
taun_obs=0;
Dn_obs=0;

//*************************Sticky STEADY STATE******************
//**************************************************************
w=1/1.2; //1/markup;
h=0.33;
MC=w;
Disp=1;
y=h;
//m=0.07*y;
pi=1.005;
pistar=pi;
R=1/betta;
PIESTAR=0;
//Dbs=0;
i=R*pi-1;
//G=0.2*0.33;
c=y-G;
D=0.5*y;
lamda=(c)^(-sigmac);
m=(xi*c^sigmac*(1+i)/i)^(1/sigmam);
//xi = mn^(sigmam)/(cn^sigmac*(1+in)/in);
mu=betta/pi*(1-betta/pi*(1-alphaa))^(-1);
Dnew=(1-(1-alphaa)/pi)*D;
i_Dnew=pi/betta-1;
i_D=i_Dnew*Dnew*((1-(1-alphaa)/pi)*D)^(-1);
tau=(G+(alphaa+i_D)*D/pi-Dnew-m+m/pi)/(w*h);
tau_obs=0;
D_obs=0;
pi_obs=0;
i_obs=0;
y_obs=0;
yn_obs=0;
//epsi_R=0;
Z1=lamda*MC*y/(1-theta*betta);
Z2=lamda*y/(1-theta*betta);

c_obs=0;
w_obs=0;
h_obs=0;
Dnew_obs=0;
m_obs=0;
Rrate=0;
mu_obs=0;
i_Dnew_obs=0;


interest=0;
inflation=0;
inflationq=0;
outputgap=0;
output=0;
fispol=0;
PIESTAR_frcst = 0; 
EPSI_R_frcst = 0;
PIESTAR_est = 0;
EPSI_R_est = 0;
ETA_PIE_est = 0;
ETA_R_est = 0;

end;

steady;
check;
//stoch_simul(irf=40,order=1,nograph) y G G_;











