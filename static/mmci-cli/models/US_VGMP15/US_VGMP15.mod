//**************************************************************************
// Vásconez, Giraud, Mc Isaac, and Pham (2015)
// Integrated into MMB by Sodik Umurzakov & Hendrik Hegemann
//**************************************************************************

parameterization=0; // 0: estimated theta (Fig 2), 1: calibrated theta (Fig 3)

var
    i        // Nominal interest rate (policy rate set by central bank)
    r_k      // Real return on capital
    pi_k     // Inflation of capital price
    pi_c     // CPI inflation
    pi_q     // Core (domestic) inflation
    w        // Real wage
    mc       // Real marginal cost
    c        // Consumption
    l        // Labor supply
    y        // Real GDP
    e        // Oil usage (log deviation)
    k        // Capital stock
    I_tilde  // Investment (log deviation)
    q        // Domestic output
    F        // Composite auxiliary term (in marginal cost equation)
    a        // Total factor productivity (TFP)
    s_e      // Real price of oil (log deviation)
    s_k      // Real price of capital (log deviation)
    g        // Government spending shock process 
    eps_i    // Monetary policy shock
    eps_p    // Price markup shock
    pi_ca    // Four-quarter cumulative CPI inflation (for plotting/targeting)
    pi_qa   // Core (domestic) inflation (Four-quarter )
    e_g   // Government spending shock

    // Flex Price Economy
    i_flex
    rk_flex
    w_flex
    c_flex
    l_flex
    y_flex
    e_flex
    k_flex
    I_tildef
    q_flex
    F_flex
    pik_flex
    pic_flex
    
    ygap


//**************************************************************************
// Modelbase Variables                                                   //*
        interest inflation inflationq outputgap output fispol;           //*
//**************************************************************************

varexo 
    e_a   // TFP shock
    e_se  // Oil price shock
    e_sk  // Capital price shock
    e_i   // Monetary policy shock
    e_p   // Price markup shockk
//**************************************************************************
// Modelbase Shocks                                                      //*
        interest_ fiscal_;                                               //*
//**************************************************************************
predetermined_variables k k_flex;

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

beta delta omega x epsilon alpha_k alpha_l alpha_e phi phi_pi phi_y theta
rho_a rho_se rho_sk rho_p nu_p rho_g rho_ag rho_i sigma_a sigma_se sigma_sk sigma_p sigma_g sigma_i
alpha r_k_ss CQ_ss L_ss K_ss C_ss I_ss G_ss Q_ss E_ss Y_ss;

	beta    = 0.99;     // Discount factor
	delta   = 0.025;    // Capital depreciation rate
	omega   = 0.18;     // Government spending share in output
	x       = 0.023;    // Share of oil in consumption
	epsilon = 8;        // Elasticity of substitution between differentiated goods

% theta estimated
if parameterization==0
% Mean
%     alpha_k =0.3599;
%     alpha_l =0.6411;
%     alpha_e =0.1254;
%     phi     =0.6308;
%     phi_pi  =1.2253;
%     phi_y   =0.7882;
%     theta   =0.9812;
%     rho_a   =0.8481;
%     rho_se  =0.5611;
%     rho_sk  =0.7080;
%     rho_p   =0.9283;
%     nu_p    =0.9760;
%     rho_g   =0.8995;
%     rho_ag  =0.6127;
%     rho_i   =0.9308;
%     sigma_a =0.4435;
%     sigma_se=1.9373;
%     sigma_sk=0.7675;
%     sigma_p =0.1854;
%     sigma_g =1.7921;
%     sigma_i =0.4566;

% Mode
    alpha_k =0.3728;
    alpha_l =0.6424;
    alpha_e =0.1234;
    phi     =0.6209;
    phi_pi  =1.2235;
    phi_y   =0.8020;
    theta   =0.9812;
    rho_a   =0.8619;
    rho_se  =0.5761;
    rho_sk  =0.7210;
    rho_p   =0.9418;
    nu_p    =0.9796;
    rho_g   =0.9058;
    rho_ag  =0.6904;
    rho_i   =0.9399;
    sigma_a =0.4361;
    sigma_se=2;
    sigma_sk=0.7740;
    sigma_p =0.1814;
    sigma_g =2;
    sigma_i =0.5410;
    

% Calibrated theta
elseif parameterization==1
% Mean    
    alpha_k =0.3809;
    alpha_l =0.5966;
    alpha_e =0.1177;
    phi     =1.2625;
    phi_pi  =1.5307;
    phi_y   =0.0214;
    theta   =0.65;
    rho_a   =0.9401;
    rho_se  =0.9872;
    rho_sk  =0.8924;
    rho_p   =0.9621;
    nu_p    =0.1711;
    rho_g   =0.9312;
    rho_ag  =0.6589;
    rho_i   =0.2104;
    sigma_a =0.4542;
    sigma_se=1.9475;
    sigma_sk=0.5750;
    sigma_p =0.4645;
    sigma_g =1.8359;
    sigma_i =0.4769;
end;

    alpha=alpha_k+alpha_l+alpha_e;
    
    r_k_ss=1/beta-1+delta;
    CQ_ss=1-omega-alpha_e*(epsilon-1)/epsilon-alpha_e*(epsilon-1)/epsilon*delta*alpha_k/(alpha_e*r_k_ss);
    L_ss=((epsilon-1)/epsilon*alpha_l*CQ_ss^(-1))^(1/(1+phi));
    Q_ss=(1*L_ss^alpha_l*((epsilon-1)/epsilon*alpha_l)^alpha_e*((epsilon-1)/epsilon*alpha_k/r_k_ss)^alpha_k)^(1/(1-alpha_e-alpha_k));
    E_ss=alpha_e*((epsilon-1)/epsilon)*Q_ss;
    K_ss=alpha_k/alpha_e*E_ss/r_k_ss;
    C_ss=Q_ss*(1-omega-alpha_e*(epsilon-1)/epsilon-alpha_e*(epsilon-1)/epsilon*delta*alpha_k/(alpha_e*r_k_ss));
    G_ss=Q_ss-E_ss-delta*K_ss-C_ss;
    I_ss=K_ss-(1-delta)*K_ss;
    Y_ss=Q_ss-E_ss;
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

coffispol = 1/sigma_g;
//**************************************************************************

model(linear);
//**************************************************************************
// Definition of Modelbase Variables in Terms of Original Model Variables//*
interest = i*4;
inflation = pi_qa;
inflationq = 4*pi_q;
output = y;
outputgap = ygap;
fispol = e_g;
//**************************************************************************
// Policy Rule                                                           //*
interest =   cofintintb1*interest(-1)
           + cofintintb2*interest(-2)
           + cofintintb3*interest(-3)
           + cofintintb4*interest(-4)
           + cofintinf0*inflationq
           + cofintinfb1*inflationq(-1)
           + cofintinfb2*inflationq(-2)
           + cofintinfb3*inflationq(-3)
           + cofintinfb4*inflationq(-4)
           + cofintinff1*inflationq(+1)
           + cofintinff2*inflationq(+2)
           + cofintinff3*inflationq(+3)
           + cofintinff4*inflationq(+4)
           + cofintout*outputgap
           + cofintoutb1*outputgap(-1)
           + cofintoutb2*outputgap(-2)
           + cofintoutb3*outputgap(-3)
           + cofintoutb4*outputgap(-4)
           + cofintoutf1*outputgap(+1)
           + cofintoutf2*outputgap(+2)
           + cofintoutf3*outputgap(+3)
           + cofintoutf4*outputgap(+4)
           + cofintoutp*output
           + cofintoutpb1*output(-1)
           + cofintoutpb2*output(-2)
           + cofintoutpb3*output(-3)
           + cofintoutpb4*output(-4)
           + cofintoutpf1*output(+1)
           + cofintoutpf2*output(+2)
           + cofintoutpf3*output(+3)
           + cofintoutpf4*output(+4)
           + std_r_*interest_;
// Discretionary Government Spending                                     //*
                                                                         //*
fispol = coffispol*fiscal_;  // No discretionary fiscal policy in this model
//**************************************************************************

%%The Effects of Oil Price Shocks in a New-Keynesian Framework: Appendices page (10)
// Euler equation for capital
    i = (1 - beta*(1 - delta))*r_k(+1) + pi_k(+1);

// Euler equation for bonds
    c = c(+1) - (i - pi_c(+1));

// Labor supply condition
    w = c + phi*l + x*s_e;

// Taylor rule
//    i = phi_pi*pi_q + phi_y*y + eps_i;

// Intratemporal labor condition: W/P = MPL
    l + w = s_e + e;

// Arbitrage between factors: W/P = MPK = MPE
    l + w = r_k + s_k + k;

// Resource constraint (output = C + I + G + import of oil)
    C_ss*(c + x*s_e) + I_ss*(s_k + I_tilde) + G_ss*g = Q_ss*q - E_ss*(s_e + e);

// Capital accumulation equation
    delta*I_tilde = k(+1) - (1 - delta)*k;

// Cobb-Douglas production function
    q = a + alpha_l*l + alpha_e*e + alpha_k*k;

// New Keynesian Phillips Curve (with Calvo price setting and markup shock)
    pi_q - beta*pi_q(+1) = ((1 - beta*theta)*(1 - theta)*alpha / (theta*(alpha + (1 - alpha)*epsilon)))*mc + eps_p;

// Marginal cost identity from production side
    mc = ((1 - alpha)/alpha)*q + F;

// Auxiliary expression
    F = -1/alpha*(a - alpha_e*s_e - alpha_l*w - alpha_k*(r_k + s_k));

// Alternative GDP identity: Y = Q - imported oil
    Y_ss*(y + x*s_e) = Q_ss*q - E_ss*(s_e + e);

// Definition of CPI inflation
    pi_c = pi_q + x*(s_e - s_e(-1));

// Definition of capital goods inflation
    pi_k = pi_q + (s_k - s_k(-1));

// AR(1) processes for shocks
    g = rho_g*g(-1) + rho_ag*e_a + sigma_g*e_g;
    s_e = rho_se*s_e(-1) + sigma_se*e_se;
    s_k = rho_sk*s_k(-1) + sigma_sk*e_sk;
    a = rho_a*a(-1) + sigma_a*e_a;
    eps_i = rho_i*eps_i(-1) + sigma_i*e_i;

// ARMA(1,1) for price markup shock
    eps_p = rho_p*eps_p(-1) + e_p - nu_p*e_p(-1);

// Auxiliary: cumulative four-quarter inflation (for output or Taylor rule targeting)
    pi_ca = pi_c + pi_c(-1) + pi_c(-2) + pi_c(-3);
    pi_qa = pi_q + pi_q(-1) + pi_q(-2) + pi_q(-3);


// Flex Price Economy
    i_flex=(1-beta*(1-delta))*rk_flex(+1)+pik_flex(+1);
    c_flex=c_flex(+1)-(i_flex-pic_flex(+1));
    w_flex=c_flex+phi*l_flex+x*s_e;
    l_flex+w_flex=s_e+e_flex;
    l_flex+w_flex=rk_flex+s_k+k_flex;
    C_ss*(c_flex+x*s_e)+I_ss*(s_k+I_tildef)+G_ss*g=Q_ss*q_flex-E_ss*(s_e+e_flex);
    delta*I_tildef=k_flex(+1)-(1-delta)*k_flex;
    q_flex=a+alpha_l*l_flex+alpha_e*e_flex+alpha_k*k_flex;
    0=((1-alpha)/alpha)*q_flex+F_flex;
    F_flex=-1/alpha*(a-alpha_e*s_e-alpha_l*w_flex-alpha_k*(rk_flex+s_k));
    Y_ss*(y_flex+x*s_e)=Q_ss*q_flex-E_ss*(s_e+e_flex);
    pic_flex=x*(s_e-s_e(-1));
    pik_flex=(s_k-s_k(-1));

    ygap=y-y_flex;
end;



shocks;
    var e_a;  stderr 1;   // TFP shock
    var e_se; stderr 1;  // Oil price shock
    var e_sk; stderr 1;  // Capital price shock
    var e_i;  stderr 1;   // Monetary policy shock (structural)
    var e_p;  stderr 1;   // Price markup shock
    //var interest_; stderr 1;    // MMB-injected monetary shock
    var fiscal_; stderr 1;      //Government spending shock
end;