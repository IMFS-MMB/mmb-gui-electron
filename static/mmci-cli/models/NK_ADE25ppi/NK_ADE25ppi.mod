//**************************************************************************
// Trade wars and the optimal design of monetary rules 
//
// Stéphane Auray, Michael B. Devereux, Aurélien Eyquem
//
// Journal of Monetary Economics, 2025
//**************************************************************************

// Model: NK_ADE25

var Pih Pif Utilh Utilf C Cs Y Ys L Ls S 
    Util Mc Mcs X Xs D Ds Dx Dxs P Ps Px Pxs 
    tb A As Welf omega omegas nfa T Ts eR eRs R Rs
    Pih_f Pif_f Utilh_f Utilf_f C_f Cs_f Y_f Ys_f L_f Ls_f S_f 
    Util_f Mc_f Mcs_f X_f Xs_f D_f Ds_f Dx_f Dxs_f P_f Ps_f Px_f Pxs_f 
    tb_f A_f As_f Welf_f omega_f omegas_f nfa_f T_f Ts_f R_f Rs_f


//**************************************************************************
// Modelbase Variables                                                   //*
   interest inflation inflationq outputgap output ;                //*
//**************************************************************************

varexo eA eAs eT eTs epsR epsRs 
//**************************************************************************
// Modelbase Shocks                                                      //*
       interest_ ;                                                //*
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
        std_r_                                    //*
//**************************************************************************
bet sigma psi size x gamh gamf gamxh gamxf lamb subs elas phi chi 
           rhoa alpha taubar adj ssnfa mu Pihtar Piftar T_init Ts_init
            rhoR rhoRs phi_f
            Pih_ss Pif_ss Utilh_ss Utilf_ss C_ss Cs_ss Y_ss Ys_ss L_ss 
            Ls_ss S_ss Util_ss Mc_ss Mcs_ss X_ss Xs_ss D_ss Ds_ss Dx_ss 
            Dxs_ss P_ss Ps_ss Px_ss Pxs_ss tb_ss A_ss As_ss Welf_ss omega_ss 
            omegas_ss nfa_ss T_ss Ts_ss eR_ss eRs_ss R_ss Rs_ss Pih_f_ss Pif_f_ss 
            Utilh_f_ss Utilf_f_ss C_f_ss Cs_f_ss Y_f_ss Ys_f_ss L_f_ss Ls_f_ss 
            S_f_ss Util_f_ss Mc_f_ss Mcs_f_ss X_f_ss Xs_f_ss D_f_ss Ds_f_ss 
            Dx_f_ss Dxs_f_ss P_f_ss Ps_f_ss Px_f_ss Pxs_f_ss tb_f_ss A_f_ss 
            As_f_ss Welf_f_ss omega_f_ss omegas_f_ss nfa_f_ss T_f_ss Ts_f_ss 
            R_f_ss Rs_f_ss
            ;



adj       = 0.0025;
ssnfa     = 0;
Pihtar = 1;
Piftar = 1;
T_init = 0.1;
Ts_init = 0.1;
rhoR = 0.7;
rhoRs = 0.7;
phi_f = 0;

bet    = 0.99; 
size   = 0.5; 
x      = 0.4; 
sigma  = 1; 
psi    = 2.5; 
gamh   = size + x * (1 - size); 
gamf   = (1 - size) + x * size; 
gamxh  = gamh; 
gamxf  = gamf; 
lamb   = 5; 
elas   = 6; %6/5-1; %20 pct markup
mu     = 1.5; % MP response to PPI inflation
distorted = 1; 
subs   = distorted * 0 + (1 - distorted) * (1 / (elas - 1));  
phi    = 40; 
chi    = 1; 
rhoa   = 0.95; 
alpha  = 0.4; 
taubar = 0;

//Steady State Results
//**************************************************************************
Pih_ss = 1;
Pif_ss = 1;
Utilh_ss = -1.41477;
Utilf_ss = -1.41477;
C_ss = 0.320226;
Cs_ss = 0.320226;
Y_ss = 0.52869;
Ys_ss = 0.52869;
L_ss = 0.990211;
Ls_ss = 0.990211;
S_ss = 1;
Util_ss = -1.41477;
Mc_ss = 1;
Mcs_ss = 1;
X_ss = 0.206259;
Xs_ss = 0.206259;
D_ss = 0.417571;
Ds_ss = 0.417571;
Dx_ss = 0.111119;
Dxs_ss = 0.111119;
P_ss = 1.0253;
Ps_ss = 1.0253;
Px_ss = 1.0253;
Pxs_ss = 1.0253;
tb_ss = 0;
A_ss = 1;
As_ss = 1;
Welf_ss = -35.3693;
omega_ss = 0.96;
omegas_ss = 0.96;
nfa_ss = 0;
T_ss = 0.1;
Ts_ss = 0.1;
eR_ss = 0;
eRs_ss = 0;
R_ss = 1.0101;
Rs_ss = 1.0101;

Pih_f_ss = 1;
Pif_f_ss = 1;
Utilh_f_ss = -1.41477;
Utilf_f_ss = -1.41477;
C_f_ss = 0.320226;
Cs_f_ss = 0.320226;
Y_f_ss = 0.52869;
Ys_f_ss = 0.52869;
L_f_ss = 0.990211;
Ls_f_ss = 0.990211;
S_f_ss = 1;
Util_f_ss = -1.41477;
Mc_f_ss = 1;
Mcs_f_ss = 1;
X_f_ss = 0.206259;
Xs_f_ss = 0.206259;
D_f_ss = 0.417571;
Ds_f_ss = 0.417571;
Dx_f_ss = 0.111119;
Dxs_f_ss = 0.111119;
P_f_ss = 1.0253;
Ps_f_ss = 1.0253;
Px_f_ss = 1.0253;
Pxs_f_ss = 1.0253;
tb_f_ss = 0;
A_f_ss = 1;
As_f_ss = 1;
Welf_f_ss = -35.3693;
omega_f_ss = 0.96;
omegas_f_ss = 0.96;
nfa_f_ss = 0;
T_f_ss = 0.1;
Ts_f_ss = 0.1;
R_f_ss = 1.0101;
Rs_f_ss = 1.0101;

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

                                                        //*
//**************************************************************************


model;
//**************************************************************************
// Definition of Modelbase Variables in Terms of Original Model Variables //*

interest   = (log(R) - log(R_ss));                                                        //*
inflation = (log(Pih) + log(Pih(-1)) + log(Pih(-2)) + log(Pih(-3))); 			         //*
inflationq  =  4 * (log(Pih));                                                    //*
outputgap  = (log(Y) - log(Y_f));                                                          //*
output = (log(Y)-log(Y_ss));                                                              //*
                                                            //*
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
                                          //*
//**************************************************************************


//Eq conditions
P       = (gamh + (1 - gamh) * ((1 + T) * S)^(1 - lamb))^(1 / (1 - lamb));
Ps      = (gamf + (1 - gamf) * ((1 + Ts) / S)^(1 - lamb))^(1 / (1 - lamb));
Px      = (gamxh + (1 - gamxh) * ((1 + T) * S)^(1 - lamb))^(1 / (1 - lamb));
Pxs     = (gamxf + (1 - gamxf) * ((1 + Ts) / S)^(1 - lamb))^(1 / (1 - lamb));
Mc      = (chi * P * C^sigma * L^psi)^(1 - alpha) * Px^alpha / (A * alpha^alpha * (1 - alpha)^(1 - alpha));
Mcs     = (chi * Ps * Cs^sigma * Ls^psi)^(1 - alpha) * Pxs^alpha / (As * alpha^alpha * (1 - alpha)^(1 - alpha));
X       = (chi * P * C^sigma * L^(alpha + psi) / ((1 - alpha) * Mc * A))^(1 / alpha);
Xs      = (chi * Ps * Cs^sigma * Ls^(alpha + psi) / ((1 - alpha) * Mcs * As))^(1 / alpha);
Y       = A * L^(1 - alpha) * X^alpha;
Ys      = As * Ls^(1 - alpha) * Xs^alpha;
D       = gamh * P^lamb * (C + adj * (nfa - ssnfa)^2/2) + gamxh * Px^lamb * X;
Ds      = gamf * Ps^lamb * Cs + gamxf * Pxs^lamb * Xs;
Dx      = (size / (1 - size)) * (S * (1 + T))^(-lamb) * ((1 - gamh) * P^lamb * (C + adj * (nfa - ssnfa)^2/2) + (1 - gamxh) * Px^lamb * X);
Dxs     = ((1 - size) / size) * ((1 + Ts) / S)^(-lamb) * ((1 - gamf) * Ps^lamb * Cs + (1 - gamxf) * Pxs^lamb * Xs);
omega   = bet * (P / P(+1)) * (C / C(+1))^sigma;
omegas  = bet * (Ps / Ps(+1)) * (Cs / Cs(+1))^sigma;
tb      = (size * Dxs - S * (1 - size) * Dx) / Y;
T = T_init + eT;
Ts = Ts_init + eTs;
eR = rhoR * eR(-1) + epsR;
eRs = rhoRs * eRs(-1) + epsRs;

Utilh   = log(C) - chi * L^(1 + psi) / (1 + psi);
Utilf   = log(Cs) - chi * Ls^(1 + psi) / (1 + psi);

Util    = size * Utilh + (1 - size) * Utilf;
Welf    = Util + bet * Welf(+1);

log(A)  = rhoa * log(A(-1)) + eA;
log(As) = rhoa * log(As(-1)) + eAs;
// 
//Constraints
Y * (1 - phi * (Pih - 1)^2 / 2) - D - Dxs;
Ys * (1 - phi * (Pif - 1)^2 / 2) - Ds - Dx;
(1 + subs) * (1 - elas) + elas * Mc - phi * ((Pih * (Pih - 1) - omega * (Y(+1) / Y) * Pih(+1) * (Pih(+1) - 1)));
(1 + subs) * (1 - elas) + elas * Mcs - phi * ((Pif * (Pif - 1) - omegas * (Ys(+1) / Ys) * Pif(+1) * (Pif(+1) - 1)));
nfa - S * P(-1) * nfa(-1) / (S(-1) * P * omegas(-1)) - (Dxs - S * ((1 - size) / size) * Dx) / P;
S(+1) * omega / (S * omegas * (1 + adj * (nfa - ssnfa))) = 1; 
//(S * Ps / P) * (1 - size) * nfas + size * nfa;
(omega * R / Pih(+1)) = 1;
(omegas * Rs / Pif(+1)) = 1;

//Explicit definition of Interest Rate

//R = (1 / bet) *  (Pih/Pihtar)^mu * exp(eR);
Rs = (1 / bet) *  (Pif/Piftar)^mu * exp(eRs);



//*************Flexible price block*******************************************************
// Price indices
P_f       = (gamh + (1 - gamh) * ((1 + T_f) * S_f)^(1 - lamb))^(1 / (1 - lamb));
Ps_f      = (gamf + (1 - gamf) * ((1 + Ts_f) / S_f)^(1 - lamb))^(1 / (1 - lamb));
Px_f      = (gamxh + (1 - gamxh) * ((1 + T_f) * S_f)^(1 - lamb))^(1 / (1 - lamb));
Pxs_f     = (gamxf + (1 - gamxf) * ((1 + Ts_f) / S_f)^(1 - lamb))^(1 / (1 - lamb));

// Marginal cost
Mc_f      = (chi * P_f * C_f^sigma * L_f^psi)^(1 - alpha) * Px_f^alpha / (A_f * alpha^alpha * (1 - alpha)^(1 - alpha));
Mcs_f     = (chi * Ps_f * Cs_f^sigma * Ls_f^psi)^(1 - alpha) * Pxs_f^alpha / (As_f * alpha^alpha * (1 - alpha)^(1 - alpha));

// Intermediate goods
X_f       = (chi * P_f * C_f^sigma * L_f^(alpha + psi) / ((1 - alpha) * Mc_f * A_f))^(1 / alpha);
Xs_f      = (chi * Ps_f * Cs_f^sigma * Ls_f^(alpha + psi) / ((1 - alpha) * Mcs_f * As_f))^(1 / alpha);

// Output
Y_f       = A_f * L_f^(1 - alpha) * X_f^alpha;
Ys_f      = As_f * Ls_f^(1 - alpha) * Xs_f^alpha;

// Demand
D_f       = gamh * P_f^lamb * (C_f + adj * (nfa_f - ssnfa)^2 / 2) + gamxh * Px_f^lamb * X_f;
Ds_f      = gamf * Ps_f^lamb * Cs_f + gamxf * Pxs_f^lamb * Xs_f;

Dx_f      = (size / (1 - size)) * (S_f * (1 + T_f))^(-lamb) * ((1 - gamh) * P_f^lamb * (C_f + adj * (nfa_f - ssnfa)^2 / 2) + (1 - gamxh) * Px_f^lamb * X_f);
Dxs_f     = ((1 - size) / size) * ((1 + Ts_f) / S_f)^(-lamb) * ((1 - gamf) * Ps_f^lamb * Cs_f + (1 - gamxf) * Pxs_f^lamb * Xs_f);

// Euler equations
omega_f   = bet * (P_f / P_f(+1)) * (C_f / C_f(+1))^sigma;
omegas_f  = bet * (Ps_f / Ps_f(+1)) * (Cs_f / Cs_f(+1))^sigma;

// Trade balance
tb_f      = (size * Dxs_f - S_f * (1 - size) * Dx_f) / Y_f;

// Shocks and taxes
T_f       = T_init + eT;
Ts_f      = Ts_init + eTs;

// Utility

Utilh_f   = log(C_f) - chi * L_f^(1 + psi) / (1 + psi);
Utilf_f   = log(Cs_f) - chi * Ls_f^(1 + psi) / (1 + psi);

Util_f    = size * Utilh_f + (1 - size) * Utilf_f;
Welf_f    = Util_f + bet * Welf_f(+1);

// Productivity
log(A_f)  = rhoa * log(A_f(-1)) + eA;
log(As_f) = rhoa * log(As_f(-1)) + eAs;

// Resource constraints (no price adjustment costs)
Y_f - D_f - Dxs_f;
Ys_f - Ds_f - Dx_f;

// Phillips Curve here: flexible prices

(1 + subs) * (1 - elas) + elas * Mc_f - phi_f * ((Pih_f * (Pih_f - 1) - omega_f * (Y_f(+1) / Y_f) * Pih_f(+1) * (Pih_f(+1) - 1)));
(1 + subs) * (1 - elas) + elas * Mcs_f - phi_f * ((Pif_f * (Pif_f - 1) - omegas_f * (Ys_f(+1) / Ys_f) * Pif_f(+1) * (Pif_f(+1) - 1)));

// Net foreign assets
nfa_f - S_f * P_f(-1) * nfa_f(-1) / (S_f(-1) * P_f * omegas_f(-1)) - (Dxs_f - S_f * ((1 - size) / size) * Dx_f) / P_f;

// UIP
S_f(+1) * omega_f / (S_f * omegas_f * (1 + adj * (nfa_f - ssnfa))) = 1;

// Policy rules
(omega_f * R_f/ Pih_f(+1)) = 1;
(omegas_f * Rs_f / Pif_f(+1)) = 1;

R_f = (1 / bet) *  (Pih_f/Pihtar)^mu * exp(eR);
Rs_f = (1 / bet) *  (Pif_f/Piftar)^mu * exp(eRs);

end;

initval;
Pih    	=	 1;
Pif    	=	 1;
C      	=	 0.283554;
Cs     	=	 0.283554;
Y      	=	 0.425072;
Ys     	=	 0.425072;
L      	=	 0.90975;
Ls     	=	 0.90975;
S      	=	 1;
Mc     	=	 0.833333;
Mcs    	=	 0.833333;
X      	=	 0.13576;
Xs     	=	 0.13576;
D      	=	 0.36348;
Ds     	=	 0.36348;
Dx     	=	 0.0615913;
Dxs    	=	 0.0615913;
P      	=	 1.04368;
Ps     	=	 1.04368;
Px     	=	 1.04368;
Pxs    	=	 1.04368;
tb     	=	 0;
A      	=	 1;
As     	=	 1;
omega  	=	 0.96;
omegas 	=	 0.96;
nfa    	=	 0;
R     =  1;
Rs     =  1;
eR      =    0;
eRs      =    0;

Pih_f     = 1;
Pif_f     = 1;
C_f       = 0.283554;
Cs_f      = 0.283554;
Y_f       = 0.425072;
Ys_f      = 0.425072;
L_f       = 0.90975;
Ls_f      = 0.90975;
S_f       = 1;
Mc_f      = 0.833333;
Mcs_f     = 0.833333;
X_f       = 0.13576;
Xs_f      = 0.13576;
D_f       = 0.36348;
Ds_f      = 0.36348;
Dx_f      = 0.0615913;
Dxs_f     = 0.0615913;
P_f       = 1.04368;
Ps_f      = 1.04368;
Px_f      = 1.04368;
Pxs_f     = 1.04368;
tb_f      = 0;
A_f       = 1;
As_f      = 1;
omega_f   = 0.96;
omegas_f  = 0.96;
nfa_f     = 0;
R_f     =  1;
Rs_f     =  1;


end;




shocks;
  var eA; stderr 0.01;
  var eAs; stderr 0.01;
  var eT; stderr 0.01;
  var eTs; stderr 0.01;
  var interest_; stderr 1;
end;


distorted = 0;
subs      = 1 / (elas - 1);

steady(nocheck);
// stoch_simul(order=1, irf=40, nograph);

