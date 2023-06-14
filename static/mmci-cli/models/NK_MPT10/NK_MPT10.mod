//**************************************************************************
// A New Comparative Approach to Macroeconomic Modeling and Policy Analysis
//
// Volker Wieland, Tobias Cwik, Gernot J. Mueller, Sebastian Schmidt and
// Maik Wolters
//
//**************************************************************************

% Model: NK_MPT10

% Further References:  T. Monacelli, R. Perotti, A. Trigari (2010): "Unemployment Fiscal Multiplier",
% Journal of Monetary Economics 57, pp.531-553

% Created by Felix Strobel (26.10.2017)
%**************************************************************************************************

%% For comments on the replication of Figure 7 in the paper, see the corresponding code in the replication folder.
%% In order to facilitate a comparison of this model with other models in the database, the calibration is
%% adjusted from monthly to quarterly frequency.
%% This transforms ...
%% ... beta from 0.99^(1/3) to 0.99
%% ... rho_g from 0.9^(1/3) to 0.9
%% ... delta from 0.025/3 to 0.025
%% ... kappa_pi from 1.5^(1/3) to 1.5
%% ... kappa_y from (0.5/4)^(1/3) to 0.5/4
%% ... gam from 11/12 to 0.75
%% ... rho from 0.965 to 0.895
%% ... p_ss from 0.45 to 1-(1-0.45)^3
%% ... eta_k from 3.24*3 to 3.24
%%     (According to the calibration table in the paper,
%%     3.24 is chosen for monthly calibration. However, to obtain the same persistence
%%     of investment responses as in the Figures of the paper that display IRFs,
%%     3.24*3 is an appropriate value for the monthly calibration. Monacelli et al.,
%%     motivate the  choice of the calibration with the estimation by Christiano,
%%     Eichenbaum, Evans (2005, JPE) who estimate a value of 3.24 for quarterly data).
%**************************************************************************************************



var
//**************************************************************************
// Modelbase Variables                                                   //*
        interest inflation inflationq outputgap output fispol                //*
//**************************************************************************
q rk y k a w lambda F n p theta u i phi c phi_i omega H w_bar w_und S
tau g v m Lambda varphi
r i_nom mc Dis Y infl inflstar P_F P_Z
theta_fe p_fe y_fe rk_fe n_fe a_fe omega_fe k_fe i_fe u_fe v_fe lambda_fe c_fe F_fe
phi_fe w_bar_fe S_fe w_und_fe w_fe H_fe phi_i_fe m_fe Lambda_fe q_fe varphi_fe r_fe mc_fe Y_fe e;


varexo
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
        std_r_ std_r_quart coffispol                                     //*
                                                                         //*
//**************************************************************************
alpha beta rho gamma_m gamma delta eta_k sigma eta b kappa
rho_g Y_over_K K_over_N G_over_Y omega_bar
theta_ss p_ss q_ss Lambda_ss phi_ss phi_i_ss n_ss u_ss v_ss m_ss rk_ss
k_ss y_ss a_ss i_ss omega_ss S_ss F_ss w_ss w_bar_ss w_und_ss
g_ss lambda_ss tau_ss H_ss
rho_i kappa_pi kappa_y epsilon gam gam_P infl_ss inflstar_ss mc_ss P_F_ss P_Z_ss Dis_ss r_ss i_nom_ss Y_ss;

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
std_r_=100;
                                                                         //*
// Definition of Discretionary Fiscal Policy Parameter                   //*
coffispol = 1;                                                           //*
//**************************************************************************

sigma=1; % CRRA
beta=0.99; %discount factor
delta=0.025; %depreciation rate
alpha=1/3; % capital share
eta_k=3.24; % investment adjustment cost parameter
rho_g=0.9; %persistence parameter of government spending shock
rho=0.965; % survival rate
gamma=0.5; %matching elasticity
eta=0.5; % bargaining power
varphi_ss=1; % convexeity of disutility of labor
omega_bar=0.9; % marginal value of non-work activity
G_over_Y = 0.2; % government spending share of output

rho_i=0; % interest rate smoothing parameter
kappa_pi = 1.5; % inflation response in Taylor rule
kappa_y = (0.5/4); % output response in Taylor rule
gam_P = 0; % backward looking fraction of price setters
gam =  3/4; % Calvo Parameter
epsilon = 7.25 ; % Elasticity of subtitution between varieties of final goods

infl_ss = 1; %inflation
inflstar_ss = 1; %optimal price/past price
Dis_ss = 1;    % Price Dispersion
mc_ss = (epsilon-1)/epsilon; % real marginal cost

%//Steady state relations
theta_ss=0.5;  %(pre-set)
%p_ss = 0.45;   %(pre-set)
p_ss = 1-(1-0.45)^3;   %(pre-set)
gamma_m = p_ss*theta_ss^(gamma-1); %(in text)
q_ss = gamma_m*theta_ss^(-gamma);  %(in text)
Lambda_ss = 1;  %(lambda_ss/lambda_ss)
phi_ss = 0; %(pre-set)
phi_i_ss = 0; %(pre-set)
n_ss = p_ss/(1-rho+p_ss); %(9)
u_ss = 1-n_ss; %(in text)
v_ss = theta_ss*u_ss; %(in text)
m_ss = gamma_m*u_ss^(gamma)*v_ss^(1-gamma); %(in text)

rk_ss=1/beta+delta-1; %(14)
r_ss = rk_ss-delta;
%Y_over_K = rk_ss/alpha; % (in text - mpc)
Y_over_K = rk_ss/(alpha*mc_ss); % (in text - mpc)
K_over_N = Y_over_K^(1/(alpha-1)); %(in text - prod.fct.)
k_ss = K_over_N*n_ss;
y_ss = Y_over_K*k_ss;
%a_ss =(1-alpha) * y_ss / n_ss; % (in text - mpn)
a_ss =(1-alpha)*mc_ss* y_ss / n_ss; % (in text - mpn)
i_ss = k_ss*delta; %(7)
g_ss = G_over_Y*y_ss;
tau_ss = g_ss;
Y_ss = y_ss; % final output
i_nom_ss = r_ss;  % nominal interest rate
P_F_ss = 1/(1-beta*gam)*(Y_ss)*(mc_ss); % auxiliary variable for price setting
P_Z_ss = 1/(1-beta*gam)*(Y_ss); % auxiliary variable for price setting

omega_ss=omega_bar*a_ss; %(31)
S_ss = (a_ss - omega_ss)/(1-beta*(rho - eta*p_ss)); %(24)
F_ss = (1-eta)*S_ss; %(in text)
kappa = F_ss*q_ss; %(5)
c_ss = y_ss - g_ss - i_ss - kappa*v_ss;
w_ss = a_ss-(1-rho*beta)*F_ss; %(6)
w_bar_ss = a_ss + (rho * beta * F_ss); %(21)
w_und_ss = w_bar_ss - S_ss; %(20)
b = omega_ss/(c_ss*sigma-(sigma-1)*omega_ss*n_ss);
lambda_ss = (sigma*b/omega_ss)^(sigma);
H_ss = (S_ss-F_ss)*lambda_ss;


model;

//**************************************************************************
// Definition of Modelbase Variables in Terms of Original Model Variables   //*
interest   = log((1+i_nom)/(1+i_nom_ss))*4;                               //*
inflationq = log(infl/infl_ss)*4;                                         //*
inflation  = 1/4*(inflationq+inflationq(-1)+inflationq(-2)+inflationq(-3)); //*
output     = log(Y/Y_ss);                                               //*
outputgap  = log(Y/Y_fe);                                               //*
fispol     = e;
//**************************************************************************

//**************************************************************************
// Policy Rule                                                           //*
%1+i_nom            =   (1+i_nom(-1))^rho_i*((1+i_nom_ss)*infl^kappa_pi*(Y/Y(-1))^(kappa_y))^(1-rho_i);%*(e_i);
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

Lambda = lambda/lambda(-1);                     % (part of) SDF of firms
1 = beta*Lambda(+1)*(1+r);                      % Euler Eq.
rk = mc* alpha*y/k(-1);                         % rental rate of capital
a = mc*(1-alpha) * y / n;                       % marginal product of labor
1+i_nom            =   (1+r)*(infl(+1));
y                  =   (Y)*(Dis);
Dis                =   gam*(Dis(-1))*(infl(-1))^(-gam_P*epsilon)*(infl)^epsilon+(1-gam)*((1-gam*(infl(-1))^(gam_P*(1-epsilon))*(infl)^(epsilon-1))/(1-gam))^(-epsilon/(1-epsilon));
P_F                =   (Y)*(mc)+beta*gam*(Lambda(+1))*(infl(+1))^epsilon*((infl))^(-epsilon*gam_P)*(P_F(+1));
P_Z                =   (Y)+beta*gam*(Lambda(+1))*(infl(+1))^(epsilon-1)*(infl)^(gam_P*(1-epsilon))*(P_Z(+1));
inflstar           =   epsilon/(epsilon-1)*(P_F)/(P_Z)*(infl);//17. Optimal price choice
infl^(1-epsilon)   =   gam*(infl(-1))^(gam_P*(1-epsilon))+(1-gam)*((inflstar))^(1-epsilon); //  Price index
m = gamma_m*u^(gamma)*v^(1-gamma);                      %matching function
p = gamma_m * theta^(1 - gamma);                        %job finding probability
q = gamma_m * theta^(-gamma);                           % probability of finding a worker
theta = v/u;                                            % labor market tightness
n = rho * n(-1) + q * v;                                %law of motion of employment
u = 1 - n(-1);                                          %unemployment
y = k(-1)^(alpha)*n^(1-alpha);                          %aggregate production function
F = kappa/q; %
F = a - w + rho*beta*(Lambda(+1)* F(+1));               % marginal value of another worker for firm
k = (1 - delta) * k(-1) + i * (1 - phi);                % law of motion of capital
phi = (eta_k / 2) * ((i/i(-1)) - 1)^2;                          % investment adjustment cost fct.
phi_i = eta_k * ((i/i(-1)) - 1);                                % derivative of investment adjustment cost fct.
lambda = ((1 + (sigma -1) * b *n) / c)^(sigma);                 % marginal utility of consumption
varphi * (1 - phi - i/i(-1)*phi_i) = 1 - beta*varphi(+1)*Lambda(+1)*(i(+1)/i)^2*phi_i(+1); %investment FOC
varphi = beta*(Lambda(+1)*(varphi(+1)*(1-delta)+rk(+1)));       %FOC capital
H = lambda*(w - omega)+beta*(rho - p(+1))*H(+1);                % marginal value of another employed household member
omega = sigma*b*lambda^(-1/sigma);                              %marginal value of non-work activity
w_bar = a + rho*beta*(Lambda(+1)*F(+1));                        % reservation wage of firm
w_und = omega - beta*((rho-p(+1))*1/lambda*H(+1));              %  reservation wage of worker
w = eta*w_bar + (1 - eta)*w_und;                                % bargained real wage
S = a - omega + beta*((rho - eta*p(+1))*Lambda(+1) * S(+1));    % Nash bargaining Surplus
log(g)=(1 - rho_g)*log(g_ss)+rho_g*log(g(-1)) + e;              % government spending (AR(1))
tau = g;                                                        % government budget constraint
Y = c + g + i + kappa*v;                                        % aggregate resource constraint

mc_fe=mc_ss;
Lambda_fe = lambda_fe/lambda_fe(-1); % (part of) SDF of firms
1 = beta*Lambda(+1)*(1+r_fe); % Euler Eq.
rk_fe = mc_fe* alpha*y_fe/k_fe(-1); % rental rate of capital
a_fe = mc_fe*(1-alpha) * y_fe / n_fe; % marginal product of labor
y_fe =   Y_fe;
m_fe = gamma_m*u_fe^(gamma)*v_fe^(1-gamma); %matching function
p_fe = gamma_m * theta_fe^(1 - gamma); %job finding probability
q_fe = gamma_m * theta_fe^(-gamma); % probability of finding a worker
theta_fe = v_fe/u_fe; % labor market tightness
n_fe = rho * n_fe(-1) + q_fe * v_fe; %law of motion of employment
u_fe = 1 - n_fe(-1); %unemployment
y_fe = k_fe(-1)^(alpha)*n_fe^(1-alpha); %aggregate production function
F_fe = kappa/q_fe; %
F_fe = a_fe - w_fe + rho*beta*(Lambda_fe(+1)* F_fe(+1)); % marginal value of another worker for firm
k_fe = (1 - delta) * k_fe(-1) + i_fe * (1 - phi_fe); % law of motion of capital
phi_fe = (eta_k / 2) * ((i_fe/i_fe(-1)) - 1)^2; % investment adjustment cost fct.
phi_i_fe = eta_k * ((i_fe/i_fe(-1)) - 1); % derivative of investment adjustment cost fct.
lambda_fe = ((1 + (sigma -1) * b *n_fe) / c_fe)^(sigma); % marginal utility of consumption
varphi_fe * (1 - phi_fe - i_fe/i_fe(-1)*phi_i_fe) = 1 - beta*varphi_fe(+1)*Lambda_fe(+1)*(i_fe(+1)/i_fe)^2*phi_i_fe(+1); %investment FOC
varphi_fe = beta*(Lambda_fe(+1)*(varphi_fe(+1)*(1-delta)+rk_fe(+1))); %FOC capital
H_fe = lambda_fe*(w_fe - omega_fe)+beta*(rho - p_fe(+1))*H_fe(+1); % marginal value of another employed household member
omega_fe = sigma*b*lambda_fe^(-1/sigma); %marginal value of non-work activity
w_bar_fe = a_fe + rho*beta*(Lambda_fe(+1)*F_fe(+1));% reservation wage of firm
w_und_fe = omega_fe - beta*((rho-p_fe(+1))*1/lambda_fe*H_fe(+1));%  reservation wage of worker
w_fe = eta*w_bar_fe + (1 - eta)*w_und_fe; % bargained real wage
S_fe = a_fe - omega_fe + beta*((rho - eta*p_fe(+1))*Lambda_fe(+1) * S_fe(+1)); % Nash bargaining Surplus
Y_fe = c_fe + g + i_fe + kappa*v_fe; % aggregate resource constraintend;
end;

initval;
theta = theta_ss;
p = p_ss;
y = y_ss;
rk = rk_ss;
n = n_ss;
a = a_ss;
omega = omega_ss;
k = k_ss;
i = i_ss;
u = u_ss;
v = v_ss;
lambda = lambda_ss;
c = c_ss;
g = g_ss;
tau = tau_ss;
F = F_ss;
phi = phi_ss;
w_bar = w_bar_ss;
S = S_ss;
w_und = w_und_ss;
w = w_ss;
H = H_ss;
phi_i = phi_i_ss;
m = m_ss;
Lambda = Lambda_ss;
q = q_ss;
varphi=varphi_ss;
r = r_ss;
i_nom=i_nom_ss;
mc = mc_ss;
Dis = Dis_ss;
Y = Y_ss;
infl = infl_ss;
inflstar = inflstar_ss;
P_F = P_F_ss;
P_Z = P_Z_ss;
theta_fe = theta_ss;
p_fe = p_ss;
y_fe = y_ss;
rk_fe = rk_ss;
n_fe = n_ss;
a_fe = a_ss;
omega_fe = omega_ss;
k_fe = k_ss;
i_fe = i_ss;
u_fe = u_ss;
v_fe = v_ss;
lambda_fe = lambda_ss;
c_fe = c_ss;
F_fe = F_ss;
phi_fe = phi_ss;
w_bar_fe = w_bar_ss;
S_fe = S_ss;
w_und_fe = w_und_ss;
w_fe = w_ss;
H_fe = H_ss;
phi_i_fe = phi_i_ss;
m_fe = m_ss;
Lambda_fe = Lambda_ss;
q_fe = q_ss;
varphi_fe = varphi_ss;
r_fe = r_ss;
mc_fe = mc_ss;
Y_fe = Y_ss;
outputgap = 0;
end;

shocks;
var fiscal_ = 1;
var interest_ = 1;
end;

%steady;
%check;

%stoch_simul (order=1, irf=40)  y c n u theta w i S outputgap g;
