// Model: US_DG08

// Further references:
// De Graeve, Ferre. 2008. "The External Finance Premium and the Macroeconomy :
// US Post-WWII Evidence", Journal of Economic Dynamics and Control 32,
// pp. 3415-3440.

// Created by Melanie Krause
// Last edited: 10/09/07 by S. Schmidt


var C L R Rauxil w pi Y K ren I Q Rk Rkforward Prem  N
Rn eps_B eps_L eps_A eps_I eps_G

//% Consumption, Labor, Real Interest Rate, Wage, Inflation,
//% Output, Capital, Rental Rate of Capital, Investment, Asset Price,
//% Return to Capital, Expected Return to Capital for next period, External Financial Premium
//% Entrepreneurial Net Worth, Nominal Interest Rate,
//% persistent discount factor shock, persistent labor supply shock,
//% persistent total factor productivity shock, persistent investment supply shock,
//% persistent government spending shock

Cf Lf Rf wf Yf Kf renf If Qf

//% the flexble-price counterparts

epsinno_G

//% government spending shock


//**************************************************************************
// Modelbase Variables                                                   //*
        interest inflation inflationq outputgap output fispol;           //*
//**************************************************************************

varexo eta_w eta_p epsinno_B epsinno_L epsinno_A epsinno_I

//% wage markup shock, price markup shock,
//% innovations in the shock processes for discount factor, labor supply,
//% productivity

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
h sigma_c lambda_w beta gamma_w xi_w sigma_1 theta alpha
psi gamma_p xi_p tau phi Rkbar epsilon gamma KbarNbar c_y k_y
rho rpi ry rdeltapi rdeltay rho_B rho_L rho_A rho_I rho_G;



h  = 0.4073;        % habit formation parameter
  sigma_c = 2.1878;   % risk aversion parameter = inverse of intertemporal ela of substitution
  lambda_w = 0.5;  % equilibrium wage markup
  beta = 0.99;      % discount factor
  gamma_w = 0.4294 ;   % partial indexation of wages
  xi_w = 0.8295;      % 1 - Calvo probability to reoptimize wage
  sigma_1 = 2.3152;   % inverse of ela of labor supply w.r.t. real wage
  theta = 1.6949;     % 1 + share of fixed cost in production
  alpha = 0.24;     % capital share in production
  psi = 0.3996;       % ela of capital utilization cost function
  gamma_p = 0.2500;   % partial indexation of prices
  xi_p = 0.9220;      % 1 - Calvo probability to reoptimize price
  tau = 0.025;       % capital depreciation rate
  phi = 5.7670;       % investment adjustment cost parameter
  Rkbar = 1.0131;   % steady state return to capital
  epsilon = 0.1005; % ela of external financial premium to variation in entrepreneurial financial health
  gamma = 0.9923;   % entrepreneurial survival rate
  KbarNbar = 1.4202; % steady state ratio of capital to net worth
  c_y = 0.65;        % steady state ratio of consumption to output
  k_y = 0.17/tau;    % steady state ratio of capital to output
  rho = 0.8977;       % interest rate smoothing
  rpi = 1.4933;      % policy response to inflation deviation
  ry = 0.0882;       % policy response to output deviation
  rdeltapi = 0.0801; % policy response to inflation dynamics
  rdeltay = 0.2749;  % policy response to output dynamics
  rho_B = 0.7011;     % persistence of discount factor shock
  rho_L = 0.9442;     % persistence of labor supply shock
  rho_A = 0.9815 ;   % persistence of productivity shock
  rho_I = 0.6430 ;     % persistence of investment supply shock
  rho_G = 0.9607 ;     % persistence of government spending shock

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
// Definition of Discretionary Fiscal Policy Parameter                   //*
coffispol = 1;                                                           //*
//**************************************************************************

model(linear);

//**************************************************************************
// Definition of Modelbase Variables in Terms of Original Model Variables //*

interest   = Rn*4;                                                       //*
inflation  = pi+pi(-1)+pi(-2)+pi(-3);                                  	 //*
inflationq = 4*pi;                                                       //*
outputgap  = Y-Yf;                                                       //*
output     = Y;                                                          //*
fispol     = epsinno_G;                                                  //*
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

// Original Model Code (with pi-pibar replaced by pi):

// flexible economy

 C = h/(1+h)*C(-1) + 1/(1+h)*C(+1) + (sigma_c - 1)/((1+lambda_w)*(1+h)*sigma_c) * (L - L(+1))
- (1-h)/((1+h)*sigma_c) * Rauxil(-1) + (1-h)/((1+h)*sigma_c) * eps_B;
Rauxil=R(+1);

w = beta/(1+beta) * w(+1) + 1/(1+beta) * w(-1) + beta/(1+beta) * pi(+1)
- (1+beta*gamma_w)/(1+beta)*pi + gamma_w/(1+beta)*pi(-1)
- (1-beta*xi_w)*(1-xi_w)/((1+beta)*(1+(1+lambda_w)*sigma_1/lambda_w)*xi_w)
* (w - sigma_1*L - sigma_c/(1-h)*(C-h*C(-1))-eps_L) + eta_w;

Y = theta * (eps_A + alpha * K(-1) + alpha/psi * ren + (1-alpha)*L);

L = -w + (1+1/psi)*ren + K(-1);

pi = beta/(1+beta*gamma_p)*pi(+1)+gamma_p/(1+beta*gamma_p)*pi(-1)
+1/(1+beta*gamma_p)*(1-beta*xi_p)*(1-xi_p)/xi_p*(alpha*ren+(1-alpha)*w-eps_A)+eta_p;

K = (1-tau) * K(-1) + tau * I(-1) + tau*(1+beta)*phi* eps_I(-1);

I = 1/(1+beta)*I(-1) + beta/(1+beta)*I(+1) + 1/(phi*(1+beta)) *  Q + eps_I;

Rk = (1-tau)/Rkbar*Q + (Rkbar-1+tau)/Rkbar * ren - Q(-1);

Rkforward = Rk(+1);

Rkforward = -epsilon*(N-Q-K)+R;

N = gamma*Rkbar*(KbarNbar*(Rk-Rkforward(-1))+Rkforward(-1)+N(-1));

Y = c_y * C + tau * k_y * I + eps_G + (Rkbar+tau-1)*1/psi*k_y*ren + (Rkbar-1/beta)*(1-1/KbarNbar)*k_y*(Rk+Q(-1)+K);

// Rn = rho*Rn(-1)+(1-rho)*(pibar(-1)+rpi*(pi-pibar)+ry*(Y-Yf))
// + rdeltapi*(pi-pi(-1))+rdeltay*(Y-Yf-(Y(-1)-Yf(-1)))+eta_R;

// pibar = pibar(-1) + etapi;

Rn = R + pi(+1);

Prem = Rkforward - R;

eps_B = rho_B * eps_B(-1) + epsinno_B;

eps_L = rho_L * eps_L(-1) + epsinno_L;

eps_A = rho_A * eps_A(-1) + epsinno_A;

eps_I = rho_I * eps_I(-1) + epsinno_I;

eps_G = rho_G * eps_G(-1) + epsinno_G;


// now the flexible-price equations

Cf = h/(1+h)*Cf(-1) + 1/(1+h)*Cf(+1) + (sigma_c - 1)/((1+lambda_w)*(1+h)*sigma_c) * (Lf - Lf(+1))
- (1-h)/((1+h)*sigma_c) * Rf + (1-h)/((1+h)*sigma_c) * eps_B;

wf = sigma_1 * Lf + sigma_c*(1/(1-h))*Cf -sigma_c* h/(1-h)*Cf(-1) + eps_L;

Yf = theta * (eps_A + alpha * Kf(-1) + alpha/psi * renf + (1-alpha)*Lf);

Lf = -wf + (1+1/psi)*renf + Kf(-1);

alpha * renf + (1-alpha)*wf = eps_A;

Kf = (1-tau) * Kf(-1) + tau * If(-1) + tau *(1+beta)*phi * eps_I(-1);

If = 1/(1+beta)*If(-1) + beta/(1+beta)*If(+1) + 1/(phi*(1+beta)) * Qf + eps_I;

Yf = c_y * Cf + tau * k_y * If + eps_G + (1/beta+tau-1)*1/psi*k_y*renf;

Rf = (1-beta*(1-tau))*renf(+1) + beta*(1-tau)*Qf(+1) - Qf;

end;

shocks;
var eta_w; stderr 0.2733;
var eta_p; stderr 0.2058;
var epsinno_B; stderr 0.5295;
var fiscal_; stderr 0.57; //epsinno_G
var epsinno_L; stderr 3.0478;
var epsinno_A; stderr 0.4695;
var epsinno_I; stderr 0.6893;
end;

 //stoch_simul(irf=20);
