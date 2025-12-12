//**************************************************************************
% Blanchard, O. J., & Riggi, M. (2013)
% Why are the 2000s so different from the 1970s? A structural 
% interpretation of changes in the macroeconomic effects of oil prices.
% Journal of the European Economic Association, 11(5), 1032–1052.
// Integrated into MMB by Sodik Umurzakov & Hendrik Hegemann
% The code replicates the IRFs from Figure 3 on page 1044.

//@#define parameterization = 2
parameterization = 2; 
%% 0: calibrated, 1: estimated Pre-1984, 2: estimated Post-1984
//**************************************************************************

var 
    c         // Aggregate consumption (log deviation from steady state)
    p_m       // Log nominal price of oil
    i         // Nominal interest rate (e.g., federal funds rate)
    pi_e_c    // Expected CPI inflation (next period)
    w         // Log nominal wage
    p_c       // Log CPI (consumption price index)
    n         // Employment (or hours worked)
    s         // Real price of oil (p_m - p_q)
    u         // Markup shock (cost-push shock, deviation from steady state)
    pi_q      // Inflation of domestic output price (log p_q - log p_q(-1))
    pi_e_q    // Expected domestic inflation (next period)
    x_f       // Welfare-relevant output gap (actual output - efficient output)
    y         // Output (value added, GDP)
    y_f       // Efficient (first-best) output level
    n_f       // Efficient (first-best) employment
    q         // Gross output (domestic production before oil adjustment)
    p_q       // Log domestic output price level
    pi_c      // CPI inflation (log p_c - log p_c(-1))
    p_y       // GDP deflator

//**************************************************************************
// Modelbase Variables                                                   //*
        interest inflation inflationq outputgap output;           //*
//**************************************************************************

varexo
eps_o     //oil price shock
//**************************************************************************
// Modelbase Shocks                                                      //*
        interest_;                                                       //*
//**************************************************************************

predetermined_variables pi_e_c, pi_e_q;
%----------------------------------------------------------------
% Parametrization 
%----------------------------------------------------------------
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
//**************************************************************************

beta alpha_n alpha_m chi phi rho_s sigma epsilon h gamma theta
phi_pi phi_x rho_i lambda lambda_p eta M Gamma_q Gamma_x Gamma_xl Gamma_s Gamma_sl;

beta    = 0.99;        // Time discount factor
phi     = 1;           // Inverse Frisch elasticity of labor supply
rho_s   = 0.999;       // Persistence of the oil price shock
epsilon = 6;           // Elasticity of substitution between differentiated goods
h       = 0.8;         // Habit formation in consumption
if parameterization == 0
    alpha_m = 0.015;
    alpha_n = 1 - alpha_m;
    chi     = 0.023;
    sigma   = 0.1;
    gamma   = 0.8;
    theta   = 0.95;
    phi_pi  = 1.2;
    phi_x   = 0.5;
    rho_i   = 0.8;
    lambda  = 1;
elseif parameterization == 1
    alpha_m = 0.015;
    alpha_n = 1 - alpha_m;
    chi     = 0.023;
    sigma   = 0.39;
    gamma   = 0.8;
    theta   = 0.95;
    phi_pi  = 1.33;
    phi_x   = 0;
    rho_i   = 0.49;
    lambda  = 0;
elseif parameterization == 2
    alpha_m = 0.012;
    alpha_n = 1 - alpha_m;
    chi     = 0.017;
    sigma   = 0.26;
    gamma   = 0;
    theta   = 0.59;
    phi_pi  = 1.08;
    phi_x   = 0;
    rho_i   = 0.54;
    lambda  = 1;
end

M        = epsilon / (epsilon - 1);            // Steady-state markup
eta      = alpha_m / (M - alpha_m);            // Oil intensity adjusted for markup
lambda_p = ((1 - theta) * (1 - beta * theta) / theta) * ((alpha_m + alpha_n) / (1 + (1 - alpha_m - alpha_n) * (epsilon - 1)));                                  // Slope of Phillips curve (degenerate if 0)
Gamma_q  = (gamma * (1 - h) + h * (1 - gamma) * sigma * (eta * (1 - alpha_m) - alpha_m)) / ((1 - h) + (1 - gamma) * sigma * (eta * (1 - alpha_m) - alpha_m));
Gamma_x = ((1-alpha_n-alpha_m)*(1-h)+phi*(1-alpha_m)*(1-gamma)*(1-h)+(1-gamma)*sigma*alpha_n)/((1-h)+(1-gamma)*sigma*(eta*(1-alpha_m)-alpha_m));
Gamma_xl = (gamma*(1-alpha_n-alpha_m)*(1-h)+h*(1-gamma)*sigma*alpha_n)/((1-h)+(1-gamma)*sigma*(eta*(1-alpha_m)-alpha_m));
Gamma_s = ((alpha_m+(1-alpha_m)*chi)*(1-h-(1-gamma)*sigma))/((1-h)+(1-gamma)*sigma*(eta*(1-alpha_m)-alpha_m));
Gamma_sl = (h*(1-gamma)*sigma*(chi*(1-alpha_m)+alpha_m)-gamma*(1-h)*(alpha_m+(1-alpha_m)*chi))/((1-h)+(1-gamma)*sigma*(eta*(1-alpha_m)-alpha_m));
//**************************************************************************
// Specification of Modelbase Parameters                                 //*
thispath = pwd;
cd('..');
load policy_param.mat;
for i=1:33
    deep_parameter_name = M_.param_names(i,:);
    eval(['M_.params(i) = ' deep_parameter_name ';']);
end
cd(thispath);
//**************************************************************************

model(linear);
//**************************************************************************
// Definition of Modelbase Variables in Terms of Original Model Variables//*
interest   = i;
inflation  = pi_q+pi_q(-1)+pi_q(-2)+pi_q(-3);
inflationq = 4*pi_q;
output     = y;
outputgap  = x_f;
//**************************************************************************
// Policy Rule                                                           //*
interest=cofintintb1*interest(-1)
        +cofintintb2*interest(-2)
        +cofintintb3*interest(-3)
        +cofintintb4*interest(-4)
        +cofintinf0*inflationq
        +cofintinfb1*inflationq(-1)
        +cofintinfb2*inflationq(-2)
        +cofintinfb3*inflationq(-3)
        +cofintinfb4*inflationq(-4)
        +cofintinff1*inflationq(+1)
        +cofintinff2*inflationq(+2)
        +cofintinff3*inflationq(+3)
        +cofintinff4*inflationq(+4)
        +cofintout*outputgap
        +cofintoutb1*outputgap(-1)
        +cofintoutb2*outputgap(-2)
        +cofintoutb3*outputgap(-3)
        +cofintoutb4*outputgap(-4)
        +cofintoutf1*outputgap(+1)
        +cofintoutf2*outputgap(+2)
        +cofintoutf3*outputgap(+3)
        +cofintoutf4*outputgap(+4)
        +cofintoutp*output
        +cofintoutpb1*output(-1)
        +cofintoutpb2*output(-2)
        +cofintoutpb3*output(-3)
        +cofintoutpb4*output(-4)
        +cofintoutpf1*output(+1)
        +cofintoutpf2*output(+2)
        +cofintoutpf3*output(+3)
        +cofintoutpf4*output(+4)
        +std_r_*interest_;
//**************************************************************************

// Model equations
s = p_m-p_q;                                     // Real price of oil
p_c = p_q+chi*s;                                 // CPI definition
c = (h/(1+h))*c(-1)+(1/(1+h))*c(+1)-((1-h)/((1+h)*sigma))*(i-pi_e_c(+1)); // Consumption Euler equation
w-p_c = phi*n+(sigma/(1-h))*(c-h*c(-1));         // Labor supply (real wage)
(1-alpha_m)*(w-p_c)+(alpha_m+(1-alpha_m)*chi)*s+(1-alpha_n-alpha_m)*n+u=0; // Factor cost condition
pi_q = beta*pi_e_q(+1)-lambda_p*u;               // Phillips curve (degenerate, since lambda_p=0)
pi_q = p_q-p_q(-1);                              // Price inflation definition
p_y = p_q-(alpha_m/(1-alpha_m))*s;               // GDP deflator
c = (alpha_n/(1-alpha_m))*n-(chi+alpha_m/(1-alpha_m))*s+(eta-alpha_m/(1-alpha_m))*u; // Consumption-output relationship
c = q-chi*s+eta*u;                                // Final good consumption
y = q+(alpha_m/(1-alpha_m))*s+eta*u;             // GDP identity
//i = rho_i*i(-1)+(1-rho_i)*(phi_pi*pi_q+phi_x*x_f); // Taylor rule
pi_e_q(+1) = (1-lambda)*pi_q+lambda*pi_q(+1);    // Inflation expectations
pi_e_c(+1) = pi_e_q(+1)+chi*(s(+1)-s);           // Expected CPI inflation

//Appendix
//output gap - equation (C.6)
x_f = y - (alpha_n * sigma * (h / (1 - h))) / (phi * (1 - alpha_m) + alpha_n * (sigma / (1 - h)) + (1 - alpha_n - alpha_m)) * y_f(-1)
      + ((alpha_m + (1 - alpha_m) * chi) * (1 - (sigma / (1 - h))) * (alpha_n / (1 - alpha_m))) / (phi * (1 - alpha_m) + alpha_n * (sigma / (1 - h)) + (1 - alpha_n - alpha_m)) * s
      + (sigma * (h / (1 - h)) * (alpha_m + chi * (1 - alpha_m)) * (alpha_n / (1 - alpha_m))) / (phi * (1 - alpha_m) + alpha_n * (sigma / (1 - h)) + (1 - alpha_n - alpha_m)) * s(-1);
//first best value added - equation (C.5) - Efficient output
y_f = (alpha_n / (1 - alpha_m)) * n_f;

// Efficient employment
n_f = ((alpha_n * sigma * (h / (1 - h))) / (phi * (1 - alpha_m) + alpha_n * (sigma / (1 - h)) + (1 - alpha_n - alpha_m))) * n_f(-1)
    - (((alpha_m + (1 - alpha_m) * chi) * (1 - (sigma / (1 - h)))) / (phi * (1 - alpha_m) + alpha_n * (sigma / (1 - h)) + (1 - alpha_n - alpha_m))) * s
    - ((sigma * (h / (1 - h)) * (alpha_m + chi * (1 - alpha_m))) / (phi * (1 - alpha_m) + alpha_n * (sigma / (1 - h)) + (1 - alpha_n - alpha_m))) * s(-1);

pi_c = p_c-p_c(-1);                              // CPI inflation
s = rho_s*s(-1)+ (0.1*100)*eps_o;                // Oil price shock



//x_f = y-Gamma_x*y_f(-1)+Gamma_s*s+Gamma_sl*s(-1); // Output gap definition
//y_f = (alpha_n/(1-alpha_m))*n_f;                 // Efficient output
//n_f = Gamma_xl*n_f(-1)-Gamma_s*s-Gamma_sl*s(-1); // Efficient employment

end;

//**************************************************************************

//**************************************************************************
// Shock Specifications                                                  //*
//**************************************************************************
shocks;
var eps_o; stderr 1;            // Oil price shock
var interest_; stderr 1;        // Monetary policy shock (Modelbase-specific, via policy rule)
end;