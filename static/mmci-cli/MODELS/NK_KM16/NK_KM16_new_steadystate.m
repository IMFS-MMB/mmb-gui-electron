
%*************************************************************
% Computes the KM_debt.mod steady state
%
% Moyen S.
% Oct, 2013
%*************************************************************

function [ys,check] = KM_debt_AEJ_steadystate(ys,exe)
global M_ options_ oo_

format long;

NumberOfParameters = M_.param_nbr;

for i = 1:NumberOfParameters
    paramname = deblank(M_.param_names(i,:));
    eval([ paramname ' = M_.params(' int2str(i) ');']);
end

%*****************************************
% Steady State equations
%*****************************************

Pies = 1.005;
Hs   =0.33;
Ints =Pies/betta-1;
Ptilds = 1; 
Disps  = 1; 
Mcs    = 1/markup; 
As = 1;
Deltas = 1;
Ys = Hs/Disps;
DGs = B0*Ys;
Cs = Ys - DGs;
Lambdas = (Cs)^(-sigmac);
Ws = Mcs;
Wtilds = (Ws^(1/(1-markupw)))^(1-markupw*(1+sigmah));
Q1s = (Ys*Lambdas*Mcs)/(1-phi*betta*Pies^(epsi*(1-gamma1-gamma2)));
Q2s = (Ys*Lambdas)/(1-phi*betta*Pies^((1-epsi)*(gamma1+gamma2-1)));

Ms = SMY*Ys;

xi = Ms^(sigmam)/(Cs^sigmac*(1+Ints)/Ints);
Mus = betta*Pies^(-1)*((1-betta*Pies^(-1)*(1-alphaa)))^(-1);
Ds = 0.5*Ys; %lower than before 0.65
D_news = (1-(1-alphaa)/Pies)*Ds;
Int_Ds =  Ints*D_news/((alphaa-1)/Pies*Ds + Ds);
Taus = (Ms/Pies - Ms - D_news + DGs + (alphaa+Int_Ds)/Pies*Ds)/(Ws*Hs) ;
kappa = (1-Taus)*Ws^(sigmah*markupw/(1-markupw))*Lambdas*Wtilds/(markupw)*(Hs)^(-sigmah);
Z1s = kappa*Hs^(1+sigmah)*Ws^(markupw*(1+sigmah)/(markupw-1))/(1-betta*phiw);
Z2s = (1-Taus)*Lambdas*Hs*Ws^(markupw/(markupw-1))/(1-betta*phiw);
Z1ns = kappa*Hs^(1+sigmah)*Ws^(markupw*(1+sigmah)/(markupw-1));
Z2ns = (1-Taus)*Lambdas*Hs*Ws^(markupw/(markupw-1));

Ptild = Ptilds;
Disp = Disps;
A_t = As;
DG = DGs;
Delta = Deltas;
H = Hs;
Y = Ys;
C = Cs;
Mc = Mcs;
M=Ms;
Mu = Mus;
Q2 = Q2s;
Q1 = Q1s;
Pie = Pies;
Pien = Pies;

Int = Ints;
Rn = (1+Ints)/Pies;
Int_new = Ints;
Int_D = Int_Ds;
test = Ints;
W = Ws;
Lambda = Lambdas;
Pie_obs = 0;
Int_obs = 0;
Int_new_obs = 0;
Y_obs = 0;
C_obs = 0;
W_obs = 0;
H_obs=0;
D = Ds;
D_new = D_news;
D_new_obs = 0;
Tau = Taus;
Tau_obs = 0;
Tax_obs = 0;
M_obs =0;
Hn = Hs;
Cn=Cs;
Yn=Ys;
Mun = Mus;
Mn=Ms;
Intn = Ints;
Int_newn = Ints;
Int_Dn = Int_Ds;
Int_adj = 0;
Taun=Taus;
Dn=Ds;
AW=1;
Z1=Z1s;
Z2=Z2s;
Z1n=Z1ns;
Z2n=Z2ns;
Lambdan = Lambdas;
Wn= Ws;
Mcn= Mcs;
Dn = Ds;
D_newn = D_news;
Dbs = 0;
DI_obs = 0;
D_obs = 0;
Rrate = 0;
dummy = 0;
Int_D_obs =0;
PIESTAR = 0;
EPSI_R =0;
PIESTAR_l = 0;
EPSI_R_l =0;
PIESTAR_frcst =0;
PIESTAR_est =0;
PIESTAR4=0;

EPSI_R_frcst =0;
EPSI_R_est =0;

ETA_PIE_est =0;
ETA_R_est =0;
Taun_obs =0;
Yn_obs =0;
Dn_obs =0;
Mu_obs =0;

LAG0_shadowInt_0 = 0;
LAG0_shadowInt_1 = 0;
LAG0_shadowInt_2 = 0;
LAG0_shadowInt_3 = 0;
LAG0_shadowInt_4 = 0;
LAG0_shadowInt_5 = 0;
LAG0_shadowInt_6 = 0;
LAG0_shadowInt_7 = 0;
LAG0_shadowInt_8 = 0;
LAG0_shadowInt_9 = 0;
LAG0_shadowInt_10 = 0;
LAG0_shadowInt_11 = 0;

LAG1_shadowInt_1 = 0;
LAG1_shadowInt_2 = 0;
LAG1_shadowInt_3 = 0;
LAG1_shadowInt_4 = 0;
LAG1_shadowInt_5 = 0;
LAG1_shadowInt_6 = 0;
LAG1_shadowInt_7 = 0;
LAG1_shadowInt_8 = 0;
LAG1_shadowInt_9 = 0;
LAG1_shadowInt_10 = 0;
LAG1_shadowInt_11 = 0;

LAG2_shadowInt_2 = 0;
LAG2_shadowInt_3 = 0;
LAG2_shadowInt_4 = 0;
LAG2_shadowInt_5 = 0;
LAG2_shadowInt_6 = 0;
LAG2_shadowInt_7 = 0;
LAG2_shadowInt_8 = 0;
LAG2_shadowInt_9 = 0;
LAG2_shadowInt_10 = 0;
LAG2_shadowInt_11 = 0;


LAG3_shadowInt_3 = 0;
LAG3_shadowInt_4 = 0;
LAG3_shadowInt_5 = 0;
LAG3_shadowInt_6 = 0;
LAG3_shadowInt_7 = 0;
LAG3_shadowInt_8 = 0;
LAG3_shadowInt_9 = 0;
LAG3_shadowInt_10 = 0;
LAG3_shadowInt_11 = 0;


LAG4_shadowInt_4 = 0;
LAG4_shadowInt_5 = 0;
LAG4_shadowInt_6 = 0;
LAG4_shadowInt_7 = 0;
LAG4_shadowInt_8 = 0;
LAG4_shadowInt_9 = 0;
LAG4_shadowInt_10 = 0;
LAG4_shadowInt_11 = 0;

LAG5_shadowInt_5 = 0;
LAG5_shadowInt_6 = 0;
LAG5_shadowInt_7 = 0;
LAG5_shadowInt_8 = 0;
LAG5_shadowInt_9 = 0;
LAG5_shadowInt_10 = 0;
LAG5_shadowInt_11 = 0;

LAG6_shadowInt_6 = 0;
LAG6_shadowInt_7 = 0;
LAG6_shadowInt_8 = 0;
LAG6_shadowInt_9 = 0;
LAG6_shadowInt_10 = 0;
LAG6_shadowInt_11 = 0;

LAG7_shadowInt_7 = 0;
LAG7_shadowInt_8 = 0;
LAG7_shadowInt_9 = 0;
LAG7_shadowInt_10 = 0;
LAG7_shadowInt_11 = 0;

LAG8_shadowInt_8 = 0;
LAG8_shadowInt_9 = 0;
LAG8_shadowInt_10 = 0;
LAG8_shadowInt_11 = 0;

LAG9_shadowInt_9 = 0;
LAG9_shadowInt_10 = 0;
LAG9_shadowInt_11 = 0;


NumberOfParameters = M_.param_nbr;
for i = 1:NumberOfParameters
    paramname = deblank(M_.param_names(i,:));
    eval(['M_.params(' int2str(i) ')=' paramname ';']);
end
check = 0;

NumberOfEndogenousVariables = M_.endo_nbr;
ys = zeros(NumberOfEndogenousVariables,1);

for i = 1:NumberOfEndogenousVariables
    varname = deblank(M_.endo_names(i,:));
    eval(['ys(' int2str(i) ') = ' varname ';']);
end
ysold = ys;
 
