//**************************************************************************
// A New Comparative Approach to Macroeconomic Modeling and Policy Analysis
//
// Volker Wieland, Tobias Cwik, Gernot J. Mueller, Sebastian Schmidt and 
// Maik Wolters
//
// Working Paper, 2009
//**************************************************************************

% Model US_KK14

% Martin Kliem and Alexander Kriwoluzky (2014). Toward a Taylor Rule for Fiscal Policy
% Review of Economic Dynamics 

% Last edited: 16/05/23 by F. Strobel

% Endogenous variables 
var  
MRS     % marginal rate of substitution C,l 
muc     % marginal utility of C
w       % real wage
q       % price of capital
y       % output
inf_p   % inflation
mc      % marginal cost
u       % utilization rate
Rb      % real return on bonds
I       % investment
c       % consumption
l       % labor
rk      % real return on capital
R       % nominal interest rate
k       % capital
inf_w   % wage inflation
tax     % tax revenue (total)  
b       % government bonds
tau_w   % wage income tax rate
tau_k   % capital gains tax rate
cg      % consumption of government
eps_i   % investment-specific shock
eps_z   % technology shock
eps_q   % preference shock
eps_pm  % price markup shock
eps_wm  % wage markup shock
tr      % transfers
GDP     % GDP = output - resource costs of capital utilization rate adjustment
tax_rev_tauw    % revenue from wage income tax
tax_rev_tauk   % revenue from capital income tax

%flex price/wage eq. 
    MRSf mucf wf qf yf uf Rbf If cf lf rkf kf taxf bf tau_wf tau_kf GDPf 
    eps_cg

//**************************************************************************
// Modelbase Variables                                                   //*
        interest inflation inflationq outputgap output fispol;           //*
//**************************************************************************
      
varexo e_i e_z e_q eps_tr eps_tauk eps_tauw e_pm e_wm e_y
//**************************************************************************
// Modelbase Shocks                                                      //*       
       interest_ fiscal_;                                                //*
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

            beta, alpha, sigma_l, sigma_c, theta_w, theta_p, gamma_w, gamma_p, delta, nu, sigma_u, h,
            rho_R, rho_pi, rho_y, rho_w, rho_k, rho_cg,  rho_eps_i, rho_eps_z,rho_eps_q, rho_tr, 
            cgy, tau_k_SS, tau_w_SS, l_SS, R_SS, tr_o_y, 
            etaWb, etaWy, etaWh etaKb, etaKy, etaKI rho_eps_pm rho_eps_wm
            inf_p_SS mc_SS rk_SS w_SS lk_bar ckbar psi_l lp_SS k_SS FC y_SS c_SS
            I_SS cg_SS tax_SS tr_SS b_SS;

            
% calibrated prior to estimation
beta=0.9935;        % discount factor 
alpha=0.36;         % output elasticity of capital
delta=0.025;        % depreciation rate
theta_p=6;          % price elasticity of goods demand
theta_w=11;         % wage elasticity of labor demand
R_SS=(1.053)^(1/4); % steady state nominal interest rate 
cgy=0.085;          % government consumption to GDP ratio
tr_o_y=0.105;       % transfer to GDP ratio 
tau_k_SS=0.1929;    % steady state capital tax rate 
tau_w_SS=0.2088;    % steady state wage tax rate l_ss
l_SS=1/3;           % steady state labor input

% posterior mean of recommended model
sigma_c=1.927;      % coefficient of relative risk aversion
h=0.566;            % habit formation
sigma_l=3.405;      % inverse of Frisch elasticity
sigma_u=1.746;      % adjustment cost paramter for capital utilization
nu=3.207;           % investment adjustment cost parameter
gamma_p=0.687;      % Calvo parameter for price setting
gamma_w=0.663;      % Calvo parameter for wage setting

rho_R=0.833;        % interest rate smoothing
rho_pi= 1.933;      % Taylor rule coefficient for inflation
rho_y= 0.035;       % Taylor rule coefficient for GDP

rho_w=0.826;        % labor tax smoothing
etaWb=0.097;        % feedback coefficient for gov. debt 
etaWy=0;            % feedback coefficient for GDP
etaWh=0.76;         % feedback coefficient for labor hours
rho_k=0.849;        % capital tax smoothing
etaKb=0.454;        % feedback coefficient for gov. debt
etaKy=0;            % feedback coefficient for GDP
etaKI=0.498;        % feedback coefficient for investment

rho_tr= 0.85;       % AR(1) Parameter for transfer shock
rho_eps_i= 0.85;    % AR(1) Parameter investment specific shock
rho_eps_z= 0.85;    % AR(1) Parameter for technology shock
rho_eps_q=0.85 ;    % AR(1) Parameter for preference shock
rho_eps_pm=0.928;   % AR(1) Parameter for price markup shock
rho_eps_wm=0.0;     % AR(1) Parameter for wage markup shock
rho_cg=0.85;        % AR(1) Parameter for gov. consumption shock
   
inf_p_SS= R_SS*beta;
mc_SS   = (theta_p-1)/theta_p;
rk_SS   = (1-beta*(1-delta))/(1-tau_k_SS)/beta;
w_SS    = mc_SS^(1/(1-alpha))*(1-alpha)*alpha^(alpha/(1-alpha))*rk_SS^(-alpha/(1-alpha));
lk_bar  = (1-alpha)/alpha*rk_SS/w_SS;
ckbar   = (1-cgy)*(mc_SS*lk_bar^(1-alpha))-delta;
psi_l   = (w_SS^(1)*(theta_w-1)/theta_w *(1-h)^(-sigma_c)*(1-tau_w_SS)*(1-beta*h) *ckbar^(-sigma_c)*lk_bar^(sigma_c))/l_SS^(sigma_c+sigma_l);
lp_SS   = l_SS;
k_SS    = lp_SS/lk_bar;
FC      = (1-mc_SS)*(k_SS)^alpha*lp_SS^(1-alpha);
y_SS    = k_SS^alpha*lp_SS^(1-alpha)-FC;
c_SS    = ckbar*k_SS;
I_SS    = delta*k_SS;
cg_SS   = y_SS-c_SS-I_SS;
tax_SS  = tau_w_SS*w_SS*lp_SS+tau_k_SS*(rk_SS*k_SS+y_SS-rk_SS*k_SS-w_SS*lp_SS);
tr_SS   = tr_o_y*y_SS;
b_SS    = 1/(1-1/beta)*(tr_SS+cg_SS-tax_SS);

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
coffispol = 1/cgy;                                                     //*
//**************************************************************************

model(linear); 

//**************************************************************************
// Definition of Modelbase Variables in Terms of Original Model Variables //*

interest   = R*4;                                                        //*
inflation  = 1/4*(inflationq+inflationq(-1)+inflationq(-2)+inflationq(-3));                                                 	 //*
inflationq = 4*inf_p;                                                 	 //*
outputgap  = y - yf;                                                     //*
output     = y;                                                          //*
fispol     = eps_cg;                                                     //*
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
fispol = coffispol*fiscal_;                                              //*
//**************************************************************************                                                                    

% marginal utility of consumption
(1-beta*h)*muc=eps_q-sigma_c/(1-h)*(c-h*c(-1))-h*beta*eps_q(+1)+h*beta*sigma_c/(1-h)*(c(+1)-h*c);

% marginal rate of substitution between consumption and leisure
MRS=sigma_l*l-muc;

% Euler equation for consumption
muc = muc(+1) + R - inf_p(+1);

% Arbitrage between bonds and capital assets
Rb +q= beta*((1-tau_k_SS)*rk_SS*rk(+1)-tau_k_SS*rk_SS*tau_k(+1)+(1-delta)*q(+1));

% Fisher equation
Rb=R-inf_p(+1);

% capital accumulation
k=(1-delta)*k(-1)+delta*I+delta*eps_i;

% investment Euler
I=I(-1)/(1+beta)+beta/(1+beta)*I(+1)+ q/nu/(1+beta)+eps_i/nu/(1+beta);

% FOC for variable capital utilization
sigma_u*u=rk-tau_k_SS/(1-tau_k_SS)*tau_k;

% Staggered Prices & Wages 
inf_w =beta*inf_w(+1)+(1-gamma_w)*(1-gamma_w*beta)/gamma_w/(1+theta_w*sigma_l)*(MRS-w+ tau_w_SS/(1-tau_w_SS)*tau_w);
inf_w=w-w(-1)+inf_p;
inf_p =beta*inf_p(+1)+(1-gamma_p)*(1-gamma_p*beta)/gamma_p*(mc);

%Firm's demand for labor and capital
w  = mc+(1-alpha)*eps_z+alpha*(u+k(-1))-alpha*l;
rk = mc+(1-alpha)*eps_z+(alpha-1)*(u+k(-1))+(1-alpha)*l;

% Aggregate Supply & Demand
y_SS*y = k_SS^(alpha)*lp_SS^(1-alpha)*(alpha*u+alpha*k(-1)+(1-alpha)*l+ (1-alpha)*eps_z);
y_SS*y = c_SS*c+I_SS*I+cg_SS*cg+rk_SS*(1-tau_k_SS)*k_SS*u + e_y;
GDP    = y-rk_SS*(1-tau_k_SS)*k_SS/y_SS*u;

% Interest Rate Rule
%R = rho_R*R(-1) + (1-rho_R)*(rho_pi*inf_p+rho_y*GDP)+eps_m; 

% Government budget constraint
b_SS*b-b_SS/beta*(R(-1)-inf_p+b(-1))=cg_SS*cg+tr_SS*tr-tax_SS*tax;

% Tax revenue
tax_SS*tax=tau_w_SS*w_SS*lp_SS*(tau_w+w+l)+tau_k_SS*rk_SS*k_SS*(tau_k+rk+u+k(-1))+tau_k_SS*(y_SS*y-rk_SS*k_SS*(rk+u+k(-1))-w_SS*lp_SS*(w+l));

% Fiscal Policy Rules
tau_w=  rho_w*tau_w(-1)+(1-rho_w)*(etaWb*b(-1)+etaWy*GDP+etaWh*l)+eps_tauw;
tau_k=  rho_k*tau_k(-1)+(1-rho_k)*(etaKb*b(-1)+etaKy*GDP+etaKI*I)+eps_tauk;

% Exogenous Variables
cg    = rho_cg*cg(-1)+eps_cg;
tr    = rho_tr*tr(-1)+eps_tr;
eps_i = rho_eps_i*eps_i(-1)+e_i;
eps_z = rho_eps_z*eps_z(-1)+e_z;
eps_q = rho_eps_q*eps_q(-1)+e_q;
eps_pm = rho_eps_pm*eps_pm(-1)+e_pm;
eps_wm = rho_eps_wm*eps_wm(-1)+e_wm;

% Definitions of tax revenues for wage tax and capital tax
tax_rev_tauw = tau_w+w+l;
tax_rev_tauk = tau_k+rk+u+k(-1) + (y_SS*y-rk_SS*k_SS*(rk+u+k(-1))-w_SS*lp_SS*(w+l))/(rk_SS*k_SS);

%FLEXPRICE EQ.
% marginal utility of consumption
(1-beta*h)*mucf=eps_q-sigma_c/(1-h)*(cf-h*cf(-1))-h*beta*eps_q(+1)+h*beta*sigma_c/(1-h)*(cf(+1)-h*cf);
MRSf=sigma_l*lf-mucf;
mucf = mucf(+1) + Rbf;
Rbf +qf= beta*((1-tau_k_SS)*rk_SS*rkf(+1)-tau_k_SS*rk_SS*tau_kf(+1)+(1-delta)*qf(+1));
kf=(1-delta)*kf(-1)+delta*If+delta*eps_i;
If=If(-1)/(1+beta)+beta/(1+beta)*If(+1)+ qf/nu/(1+beta)+eps_i/nu/(1+beta);
sigma_u*uf=rkf-tau_k_SS/(1-tau_k_SS)*tau_kf;
wf = MRSf + tau_w_SS/(1-tau_w_SS)*tau_wf;
wf  = (1-alpha)*eps_z+alpha*(uf+kf(-1))-alpha*lf;
rk = (1-alpha)*eps_z+(alpha-1)*(uf+kf(-1))+(1-alpha)*lf;
y_SS*yf = k_SS^(alpha)*lp_SS^(1-alpha)*(alpha*uf+alpha*kf(-1)+(1-alpha)*lf+ (1-alpha)*eps_z);
y_SS*yf = c_SS*cf+I_SS*If+cg_SS*cg+rk_SS*(1-tau_k_SS)*k_SS*uf;
GDPf    = yf-rk_SS*(1-tau_k_SS)*k_SS/y_SS*uf;
b_SS*bf-b_SS/beta*(Rbf(-1)+bf(-1))=cg_SS*cg+tr_SS*tr-tax_SS*taxf;
tax_SS*taxf=tau_w_SS*w_SS*lp_SS*(tau_wf+wf+lf)+tau_k_SS*rk_SS*k_SS*(tau_kf+rkf+uf+kf(-1))+tau_k_SS*(y_SS*yf-rk_SS*k_SS*(rkf+uf+kf(-1))-w_SS*lp_SS*(wf+lf));
tau_wf=  rho_w*tau_wf(-1)+(1-rho_w)*(etaWb*bf(-1)+etaWy*GDPf+etaWh*lf)+eps_tauw;
tau_kf=  rho_k*tau_kf(-1)+(1-rho_k)*(etaKb*bf(-1)+etaKy*GDPf+etaKI*If)+eps_tauk;
end; 
 
shocks; 
var e_i; stderr  3.030/100;       % investment-specific shock
var e_z; stderr 0.643/100;        % technology shock
var e_q; stderr 2.158/100;        % preference shock
var interest_; stderr 0.158/100;  % interest rate shock
var eps_tauw; stderr 0.02167;     % wage tax rate shock
var eps_tauk; stderr 0.03789;     % capital tax rate shock
var eps_tr; stderr 4.99/100;      % transfer shock
var fiscal_; stderr 0.0267;       % government spending shock
var e_pm; stderr 1.48/100;        % price markup shock
var e_wm; stderr 0.729/100;       % wage markup shock
var e_y; stderr 1.116/100;        % measurement error GDP
end; 

%steady;
%check;

%stoch_simul(irf=40, order = 1, nomoments, noprint) inflation interest output outputgap;
