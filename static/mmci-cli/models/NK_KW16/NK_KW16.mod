//**************************************************************************
// A New Comparative Approach to Macroeconomic Modeling and Policy Analysis
//
// Volker Wieland, Tobias Cwik, Gernot J. Mueller, Sebastian Schmidt and 
// Maik Wolters
//
//**************************************************************************
% Model: NK_KW16

% Further Reference: 
% Kirchner, M., S. van Wijnbergen. 2016. " Fiscal deficits, financial fragility, and the effectiveness of government policies".
% Journal of Monetary Economics 80, pp. 51-68.

% Created by Felix Strobel (10.10.17)
% This code replicates the plot for Bank Financing' in Figure 1 of the article.

var 
//**************************************************************************
// Modelbase Variables                                                   //*
        interest inflation inflationq outputgap output fispol                //*
//**************************************************************************

Y           % final output
Ym          % intermediary output
L           % labor hours
w           % real wage
C           % consumption
U_c         % marginal utility of consumption
Lambda      % stochastic discount factor of households 
I           % investment
K           % capital
Q           % price of capital
a           % technology
ksi         % capital quality
Pm          % price of intermediary goods (real marginal cost for final goood producer)
infl        % inflation
inflstar    % optimal price divided by past price level
F           % auxiliary variable for price setting
Z           % auxiliary variable for price setting
Dis         % price dispersion

Rd          % real deposit rate 
i           % nominal interest rate
Rk          % real rate of capital
Rb          % real rate of bonds held by banks
Rp          % real rate of portfolio by banks
ERk         % ected real rate of capital
ERb         % ected real rate of bonds held by banks
prem        % premium of return on capital - return on deposits
prem2       % premium of return on bonds - return on deposits
Phi         % Leverage ratio of banks
portf_B     % portfolio of banks
N           % net worth of banks
Om          % portfolio share of capital assets
D           % economy-wide deposits
nu_k        % value of having another unit of capital assets
nu_b        % value of having another unit of bonds (for banks)
nu_n        % value of having another unit of net worth
G           % government spending
g           % government spending (shock process)
Gy          % government spending share of output
T           % taxes
B          % government debt

Y_fe           % final output
Ym_fe          % intermediary output
L_fe           % labor hours
w_fe           % real wage
C_fe           % consumption
U_c_fe         % marginal utility of consumption
Lambda_fe      % stochastic discount factor of households 
I_fe           % investment
K_fe           % capital
Q_fe           % price of capital
Pm_fe          % price of intermediary goods (real marginal cost for final goood producer)
Rd_fe          % real deposit rate 
Rk_fe          % real rate of capital
Rb_fe          % real rate of bonds held by banks
Rp_fe          % real rate of portfolio by banks
ERk_fe         % expected real rate of capital
ERb_fe         % expected real rate of bonds held by banks
Phi_fe         % Leverage ratio of banks
portf_B_fe     % portfolio of banks
N_fe           % net worth of banks
Om_fe          % portfolio share of capital assets
D_fe           % economy-wide deposits
nu_k_fe        % value of having another unit of capital assets
nu_b_fe        % value of having another unit of bonds (for banks)
nu_n_fe        % value of having another unit of net worth
Gy_fe          % government spending share of output
T_fe           % taxes
infl_fe        % inflation
inflstar_fe    % optimal price divided by past price level
F_fe           % auxiliary variable for price setting
Z_fe           % auxiliary variable for price setting
Dis_fe         % price dispersion
i_fe           % nominal interest rate
B_fe           % government debt
e_g;


%capital quality, government spending, interest rate, technoy, and net worth shock
varexo e_ksi e_a
//**************************************************************************
// Modelbase Shocks                                                      //*       
       interest_ fiscal_;                                                        //*
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
        std_r_ std_r_quart                                               //*
        coffispol                                                        //*
//**************************************************************************
    beta hh delta varphi eta_i alpha gam epsilon kappa_pi kappa_y G_over_Y B_over_Y theta lambda chi
    rho_i rho_ksi rho_a rho_g sigma_i sigma_ksi sigma_a sigma_g sigma_n gam_fe
    Y_ss L_ss w_ss U_c_ss Y_over_K L_over_K K_ss Ym_ss G_ss I_ss C_ss Z_ss F_ss B_ss N_ss D_ss T_ss
    a_ss ksi_ss g_ss Lambda_ss Pm_ss Phi_ss Q_ss Dis_ss infl_ss inflstar_ss Rd_ss Rp_ss Rb_ss Rk_ss i_ss
    prem_ss nu_b_ss nu_n_ss nu_k_ss portf_B_ss Om_ss Gy_ss;
    
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
std_r_=100;
                                                                         //*
// Definition of Discretionary Fiscal Policy Parameter                   //*
 coffispol = 5;                                                        //*   
//**************************************************************************

% standard Parameters
beta=0.99;          % discount factor 
hh=0.815;           % habit formation
delta = 0.025;      % depreciation rate
varphi = 0.276;     % inverse of Frisch elasticity
eta_i = 1.728;      % inv. adjustment cost parameter
alpha = 0.33;       % output elasticity of capital
gam=0.779;          % Calvo parameter
gam_fe=0.00001;     % Calvo parameter flex price approximation
epsilon=4.167;      % elasiticity of substitution between varieties of final goods
G_over_Y=0.2;       % stst. government spending share of output
B_over_Y=2.4;       % stst. debt/GDP
Phi_ss=4;           % stst. Leverage ratio of banks
theta=1-1/16;       % survival rate of banks

kappa_pi=1.50000000;% Taylor rule coefficient on inflation
kappa_y =0.12500000;% Taylor rule coefficient on output growth

%shock parameters
rho_i=0.8;        % interest rate smoothing
rho_ksi=0.66;     % persistence of capital quality shock
rho_a=0.95;       % persistence of technoy shock
rho_g=0.80;       % persistence of government spending shock
sigma_ksi=0.05;   % std. dev. of capital quality shock
sigma_a=0.01;     % std. dev. of technoy shock
sigma_g=0.05;     % std. dev. of government spending shock
sigma_i=0.0025;   % std. dev. of interest rate shock
sigma_n=0.01;     % std. dev. of net worth shock

%%% steady state values of variables labelled above
Lambda_ss = 1;                     %
Q_ss=1;                            % 
Dis_ss=1;
infl_ss=1;
inflstar_ss=1;
a_ss=1;
g_ss=1;
ksi_ss=1;
Pm_ss = (epsilon-1)/epsilon;       %

prem_ss = 0.01/4;
prem2_ss = prem_ss;
Phi_ss=4;
Rd_ss=1/beta;
i_ss=Rd_ss;
Rk_ss=Rd_ss+prem_ss;
Rb_ss=Rk_ss;
Rp_ss=Rk_ss;
ERk_ss=Rk_ss;
ERb_ss=Rk_ss;
nu_n_ss = (1-theta)*beta*(Rd_ss)/(1-theta*beta);
nu_k_ss = (1-theta)*beta*(Rk_ss-Rd_ss)/(1-theta*beta);
nu_b_ss = nu_k_ss; 
lambda = nu_k_ss + nu_n_ss/Phi_ss;          % tightness parameter on incentive constraint
chi = 1-theta*((Rk_ss-Rd_ss)*Phi_ss+Rd_ss); % share of old net worth that is given to new bankers
w_ss = (alpha^(alpha)*(1-alpha)^(1-alpha)*Pm_ss*(Rk_ss-1+delta)^(-alpha))^(1/(1-alpha));
Y_over_K = (Rk_ss-1+delta)/(alpha*Pm_ss);
L_over_K = (Y_over_K)^(1/(1-alpha));
I_over_Y = delta*(Y_over_K)^(-1);
C_over_Y = 1-G_over_Y-I_over_Y;
habit = (1-beta*hh)/(1-hh);
Y_ss = (L_over_K)^(-alpha*varphi/(1+varphi))*(habit*w_ss*C_over_Y^(-1))^(1/(1+varphi));
Ym_ss= Y_ss;
C_ss = Y_ss*C_over_Y;
G_ss = Y_ss*G_over_Y;
Gy_ss = G_over_Y;
I_ss = Y_ss*I_over_Y;
K_ss = I_ss/delta;
L_ss = L_over_K*K_ss;
U_c_ss = habit/C_ss;
Z_ss = 1/(1-beta*gam)*Y_ss;
F_ss = Z_ss*Pm_ss;
B_ss = Y_ss*B_over_Y;
N_ss = (K_ss+B_ss)/Phi_ss;
Om_ss = K_ss/(K_ss+B_ss);
Rp_ss = Om_ss*(Rk_ss)+(1-Om_ss)*Rb_ss;
T_ss = (Rb_ss-1)*B_ss+G_ss;
portf_B_ss = Phi_ss*N_ss;
D_ss = K_ss + B_ss - N_ss;

model;

//**************************************************************************
// Definition of Modelbase Variables in Terms of Original Model Variables   //*
interest   = log(i/i_ss)*400;                                            //*
inflationq = log(infl/infl_ss)*400;                                            //*
inflation  = 1/4*(inflationq+inflationq(-1)+inflationq(-2)+inflationq(-3)); //*
output     = log(Y/Y_ss)*100;                                              //*
outputgap  = log(Y/Y_fe)*100;                                              //*
fispol     = e_g;
//**************************************************************************

//**************************************************************************                                                                    
// Policy Rule                                                           //*
                                                                         //*
// Monetary Policy                                                       //*
%(i) =   (i(-1))^rho_i* (i_ss*(infl)^kappa_pi*((Y)/(Y(-1)))^(kappa_y))^(1-rho_i)*(exp(-e_i)); % Taylor rule
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
 fispol = coffispol*fiscal_;                                             //*  
//**************************************************************************

% Households
(U_c)  =   ((C)-hh*(C(-1)))^(-1)-beta*hh*((C(+1))-hh*(C))^(-1); % Marginal utility of consumption
(Lambda)  =   (U_c)/(U_c(-1));                                        % Stochastic discount rate
beta*(Rd(+1))*(Lambda(+1))  =   1;                                       % Euler equation
(L)^varphi    = (U_c)*(w);                                            % Labor supply

% Intermediate goods producer
(Rk)     =   ((Pm)*alpha*(Ym)/(K(-1))+(ksi)*(Q)*(1-delta))/(Q(-1)); % Return on capital (Assumption: this = E26)
(Ym)     =   (a)*((ksi)*(K(-1)))^alpha*(L)^(1-alpha); % Production function
(w)      =   (Pm)*(1-alpha)*(Ym)/(L); % Real Wages (Assumption: This replaces E28 (Eq. for mc))

% Capital Goods Producer
%(Q)  =   1 + eta_i/2*((I)/(I(-1))-1)^2
%              + eta_i*((I)/(I(-1))-1)*(I)/(I(-1))
%              - beta*(Lambda(+1))*eta_i*((I(+1))/(I)-1)*((I(+1))/(I))^2;     % Optimal investment decision (check out E29)
1/(Q) =   1 - eta_i/2*((I)/(I(-1))-1)^2 
               - eta_i*((I)/(I(-1))-1)*(I)/(I(-1)) 
               + beta*(Lambda(+1))*eta_i*((I(+1))/(I)-1)*((I(+1))/(I))^2*(Q)/(Q(+1)); //E29
(K)  =   (1-delta)*(ksi)*(K(-1)) + (1 - eta_i/2*((I)/(I(-1))-1)^2)*(I);          % Capital accumulation equation

% Retailer
(Ym)    =   (Y)*(Dis);                                                                             % Retail output
(Dis)    =   gam*(Dis(-1))*(infl)^epsilon + 
                (1-gam)*((1-gam*(infl)^(epsilon-1))/(1-gam))^(-epsilon/(1-epsilon));                     % Price dispersion
(F)       =   (Y)*(Pm) + beta*gam*(Lambda(+1))*(infl(+1))^epsilon    *(F(+1));            % Optimal price choice
(Z)       =   (Y)         + beta*gam*(Lambda(+1))*(infl(+1))^(epsilon-1)*(Z(+1));            % Optimal price choice
(inflstar)   =  epsilon/(epsilon-1)*(F)/(Z)*(infl);                                             % Optimal price choice
(infl)^(1-epsilon)     =   gam + (1-gam)*((inflstar))^(1-epsilon);                                    % Price index


% Financial Intermediaries
(nu_k)=beta*(Lambda(+1))*(((Rk(+1))-(Rd(+1)))*(1-theta)+ 
          theta*(Q(+1))*(K(+1))/((Q)*(K))*(nu_k(+1))); % shadow excess value of loans
(nu_b)=beta*(Lambda(+1))*(((Rb(+1))-(Rd(+1)))*(1-theta)+
          theta*(B(+1))/((B))*(nu_b(+1)));     % shadow value of bonds
(nu_n)=beta*(Lambda(+1))*((Rd(+1))*(1-theta) +
          theta*((N(+1))/(N))*(nu_n(+1)));     % shadow value of equity
(nu_k)=(nu_b);                                 % relation between shadow values of loans and bonds
(Phi)=(nu_n)/(lambda-(nu_k));                  % Leverage of Banks
(N)= theta*(((Rp)-(Rd))*(Phi(-1)) + (Rd))*(N(-1))
     + chi* (N(-1));                    % law of motion for net worth
(N)+(D)= (Q)*(K)+(B);                   % balance sheet identity of banks
(portf_B) = (Q)*(K)+(B);                % Banks' portfolio
(Q)*(K) = (Om) * (Phi) * (N);           % claims on capital assets
(B) = (1 - (Om)) * (Phi) * (N);         % claims on bonds 
(ERk)= (Rk(+1));                        % Expected Return on Capital
(ERb) = (Rb(+1));                       % Expected Return on Bonds
(prem) =   (Rk(+1))-(Rd(+1));           % Loan Premium
(prem2) =   (Rb(+1))-(Rd(+1));          % Bond Premium
(Rp) = (Rk)*(Om(-1))+(Rb)*(1-(Om(-1))); % Return on portfolio

% Fiscal policy
%G = (1-rho_g)*G_ss + rho_g*G(-1) + eg; %
(B) = (Rb)*(B(-1))+(G)-(T); % Government Budget Constraint
(G) = G_ss*(g); % Government consumption
(T) = T_ss; % Taxes
(Gy) = (G)/Y_ss; % Share of gov. consumption in GDP
 
% Additional Equations
(Y) =   (C) +(G) + (I); % Aggregate resource constraint
(i(-1)) =   (Rd)*(infl); % Fisher equation

%%%Flexprice Equilibrium
% Households
(i_fe(-1)) =   (Rd_fe)*(infl_fe); % Fisher equation
(i_fe) =   (i_fe(-1))^rho_i* (i_ss*(infl_fe)^kappa_pi*((Y_fe)/(Y_fe(-1)))^(kappa_y))^(1-rho_i); % Taylor rule
(Dis_fe)    =   gam_fe*(Dis_fe(-1))*(infl_fe)^epsilon + 
                (1-gam_fe)*((1-gam_fe*(infl_fe)^(epsilon-1))/(1-gam_fe))^(-epsilon/(1-epsilon));                     % Price dispersion
(F_fe)       =   (Y_fe)*(Pm_fe) + beta*gam_fe*(Lambda_fe(+1))*(infl_fe(+1))^epsilon    *(F_fe(+1));            % Optimal price choice
(Z_fe)       =   (Y_fe)         + beta*gam_fe*(Lambda_fe(+1))*(infl_fe(+1))^(epsilon-1)*(Z_fe(+1));            % Optimal price choice
(inflstar_fe)   =  epsilon/(epsilon-1)*(F_fe)/(Z_fe)*(infl_fe);                                             % Optimal price choice
(infl_fe)^(1-epsilon)     =   gam_fe + (1-gam_fe)*((inflstar_fe))^(1-epsilon);                                    % Price index
(U_c_fe)  =   ((C_fe)-hh*(C_fe(-1)))^(-1)-beta*hh*((C_fe(+1))-hh*(C_fe))^(-1); % Marginal utility of consumption
(Lambda_fe)  =   (U_c_fe)/(U_c_fe(-1));                                        % Stochastic discount rate
beta*(Rd_fe(+1))*(Lambda_fe(+1))  =   1;                                       % Euler equation
(L_fe)^varphi    = (U_c_fe)*(w_fe);                                            % Labor supply
(Rk_fe)     =   ((Pm_fe)*alpha*(Ym_fe)/(K_fe(-1))+(ksi)*(Q_fe)*(1-delta))/(Q_fe(-1)); % Return on capital (Assumption: this = E26)
(Ym_fe)     =   (a)*((ksi)*(K_fe(-1)))^alpha*(L_fe)^(1-alpha); % Production function
(w_fe)      =   (Pm_fe)*(1-alpha)*(Ym_fe)/(L_fe); % Real Wages (Assumption: This replaces E28 (Eq. for mc))
1/(Q_fe) =   1 - eta_i/2*((I_fe)/(I_fe(-1))-1)^2 
               - eta_i*((I_fe)/(I_fe(-1))-1)*(I_fe)/(I_fe(-1)) 
               + beta*(Lambda_fe(+1))*eta_i*((I_fe(+1))/(I_fe)-1)*((I_fe(+1))/(I_fe))^2*(Q_fe)/(Q_fe(+1)); //E29
(K_fe)  =   (1-delta)*(ksi)*(K_fe(-1)) + (1 - eta_i/2*((I_fe)/(I_fe(-1))-1)^2)*(I_fe);          % Capital accumulation equation
(Ym_fe)    =   (Y_fe);
(nu_k_fe)=beta*(Lambda_fe(+1))*(((Rk_fe(+1))-(Rd_fe(+1)))*(1-theta)+ 
          theta*(Q_fe(+1))*(K_fe(+1))/((Q_fe)*(K_fe))*(nu_k_fe(+1))); % shadow excess value of loans
(nu_b_fe)=beta*(Lambda_fe(+1))*(((Rb_fe(+1))-(Rd_fe(+1)))*(1-theta)+
          theta*(B_fe(+1))/((B_fe))*(nu_b_fe(+1)));     % shadow value of bonds
(nu_n_fe)=beta*(Lambda_fe(+1))*((Rd_fe(+1))*(1-theta) +
          theta*((N_fe(+1))/(N_fe))*(nu_n_fe(+1)));     % shadow value of equity
(nu_k_fe)=(nu_b_fe);                                    % relation between shadow values of loans and bonds
(Phi_fe)=(nu_n_fe)/(lambda-(nu_k_fe));                  % Leverage of Banks
(N_fe)= theta*(((Rp_fe)-(Rd_fe))*(Phi_fe(-1)) + (Rd_fe))*(N_fe(-1)) + chi* (N_fe(-1));    % law of motion for net worth
(N_fe)+(D_fe)= (Q_fe)*(K_fe)+(B_fe);                    % balance sheet identity of banks
(portf_B_fe) = (Q_fe)*(K_fe)+(B_fe);                    % Banks' portfolio
(Q_fe)*(K_fe) = (Om_fe) * (Phi_fe) * (N_fe);            % claims on capital assets
(B_fe)        = (1 - (Om_fe)) * (Phi_fe) * (N_fe);      % claims on bonds 
(ERk_fe)= (Rk_fe(+1));                                  % Expected Return on Capital
(ERb_fe) = (Rb_fe(+1));                                 % Expected Return on Bonds
(Rp_fe) = (Rk_fe)*(Om_fe(-1))+(Rb_fe)*(1-(Om_fe(-1)));  % Return on portfolio
(B_fe) = (Rb_fe)*(B_fe(-1))+(G)-(T_fe);              % Government Budget Constraint
(T_fe) = T_ss; % Taxes
(Gy_fe) = (G)/Y_ss; % Share of gov. consumption in GDP
(Y_fe) =   (C_fe) +(G) + (I_fe); % Aggregate resource constraint

% Shocks
log(a)  =   rho_a*log(a(-1))-e_a; %42. TFP shock
log(ksi)=   rho_ksi*log(ksi(-1))-e_ksi; %43. Capital quality shock
log(g)  =   rho_g*log(g(-1))+e_g; %44. Government consumption shock
end;


initval;
Y=(Y_ss);
Ym=(Ym_ss);
K=(K_ss);
L=(L_ss);
I=(I_ss);
C=(C_ss);
G=(G_ss);
Q=(Q_ss);
U_c=(U_c_ss);
Lambda=(Lambda_ss);
Rk=(Rk_ss);
Rd=(Rd_ss);
N=(N_ss);
Pm=(Pm_ss);
w=(w_ss);
Dis=(Dis_ss);
F=(F_ss);
Z=(Z_ss);
i=(i_ss);
prem=(prem_ss);
a=1;
ksi=1;
g=1;
infl=1;
inflstar=1;
e_a=0.00000000;
e_ksi=0.00000000;
e_g=0.00000000;
B=(B_ss);
D=(D_ss);
T=(T_ss);
Phi=(Phi_ss);
Rb=(Rb_ss);
nu_k=(nu_k_ss);
nu_b=(nu_b_ss);
nu_n=(nu_n_ss);
prem2=(prem2_ss);
ERk=(Rk_ss);
ERb=(Rb_ss);
Rp=(Rp_ss);
portf_B=(portf_B_ss);
Om=(Om_ss);
Gy=(Gy_ss);

infl_fe=1;
inflstar_fe=1;
Dis_fe=(Dis_ss);
F_fe=(F_ss);
Z_fe=(Z_ss);
i_fe=(i_ss);
Y_fe=(Y_ss);
Ym_fe=(Ym_ss);
K_fe=(K_ss);
L_fe=(L_ss);
I_fe=(I_ss);
C_fe=(C_ss);
Q_fe=(Q_ss);
U_c_fe=(U_c_ss);
Lambda_fe=(Lambda_ss);
Rk_fe=(Rk_ss);
Rd_fe=(Rd_ss);
N_fe=(N_ss);
Pm_fe=(Pm_ss);
w_fe=(w_ss);
B_fe=(B_ss);
D_fe=(D_ss);
T_fe=(T_ss);
Phi_fe=(Phi_ss);
Rb_fe=(Rb_ss);
nu_k_fe=(nu_k_ss);
nu_b_fe=(nu_b_ss);
nu_n_fe=(nu_n_ss);
ERk_fe=(Rk_ss);
ERb_fe=(Rb_ss);
Rp_fe=(Rp_ss);
portf_B_fe=(portf_B_ss);
Om_fe=(Om_ss);
Gy_fe=(Gy_ss);
end;

%steady;
%check;

shocks;
var e_a; stderr sigma_a;
var e_ksi; stderr sigma_ksi;
var fiscal_; stderr 1;
var interest_; stderr 1;
end;

%stoch_simul(order = 1, irf=30) Gy G ERb ERk I K Q N Phi C Y;
    