// Model: NK_PSV16


// Further references:
// Pancrazi, R., Seoane, H.D. and Vukotic, M., 2016.
// The price of capital and the financial accelerator. Economics Letters, 149, pp.86-89.

// BGG model augmented with the Equilibrium Price of Capital

// Imlemented in the MMB by Lazar Milivojevic (lazar.milivojevic@hotmail.com)
// I had to add the block of the model under flexible prices to the original code.

// Variables

var y c i g ce n rk r q k x a h pi rn qtilde eG
yf kf if rf rkf nf cf cef qf hf qtildef // flexible-price variables

//**************************************************************************
// Modelbase Variables                                                   //*
        interest inflation inflationq outputgap output                   //*
        fispol                                                           //*
        ;                                                                //*
//**************************************************************************

varexo
//eM
//eG
eA

//**************************************************************************
// Modelbase Shocks                                                      //*
       interest_                                                         //*
       fiscal_                                                           //*
       ;                                                                 //*
//**************************************************************************

// Parameters

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

beta eta alpha delta omega eps G_Y C_Y I_Y Ce_Y Y_N X rhoA rhoG psi K_N R gamma mu nu theta rho S kappa;
    C_Y	    =	0.61        ;
    Ce_Y	  =	0.01        ;
    I_Y 	  =	0.18    	;
    G_Y 	  =	0.20        ;
    K_N 	  =	2.00        ;
    Y_N 	  =	0.28        ;
    X   	  =	1.10        ;
    beta      = 0.99        ;
    R         = 1/beta      ;
    alpha     = 0.35        ;
    eta       = 3           ;
    omega     = 0.99        ;
    delta     = 0.025       ;
    rhoA      = 0.999       ;
    rhoG      = 0.95        ;
    psi       = 0.25        ;
    Rk        = R + 0.02    ;   % 200 b.p.
    gamma     = 1 - 0.0272  ;
    mu        = 0.12        ;
    theta     = 0.75        ;
    rho       = 0.90        ;
    S         = 0.11        ;
    kappa     = ((1-theta)/theta)*(1-theta*beta);
    eps       = (1-delta)/((1-delta) + ((alpha/X)*(Y_N/K_N)));
    nu        = 0.5         ;

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
coffispol = 1/G_Y;                                                        //*
//**************************************************************************

// Characterizing equations

model;
//**************************************************************************
// Definition of Modelbase Variables in Terms of Original Model Variables //*

interest   = 4*rn;                                                      //*
%interest   = rn;                                                      //*
inflation  = 1/4*(pi+pi(-1)+pi(-2)+pi(-3));                                 //*
inflationq = 4*pi;                                                       //*
outputgap  = y-yf;                                                      //*
output     = y;                                                          //*
fispol     = eG;                                                         //*
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

// Model-specific equations:
    y = C_Y*c + I_Y*i + G_Y*g + Ce_Y*ce;            //4.14
//    y = C_Y*c + I_Y*i + G_Y*g ;                   // in case entrepreneurial consumption is ignored
    c = -r + c(+1);                                 //4.15
    rn = r + pi(+1);                                //nominal int. rate
    ce = n;                                         //4.16
//    ce = 0;
    rk(+1) - r = -nu*(n -(q + k));                  //4.17
    rk = (1-eps)*(y - k(-1) - x) + eps*qtilde - q(-1);   //4.18 modified
    q = psi*(i - k(-1));                            //4.19
    y = a + alpha*k(-1) + (1-alpha)*omega*h;        //4.20
    y - h - x - c = (eta^(-1))*h;                   //4.21
    pi = kappa*(-x) + beta*pi(+1);                  //4.22
    k = delta*i + (1-delta)*k(-1);                  //4.23
    n = gamma*R*K_N*(rk - r(-1)) + r(-1) + n(-1);   //4.24
    // rn = rho*rn(-1) + S*pi(-1) + eM;                //4.25
    g = rhoG*g(-1) + eG;                            //4.26
    a = rhoA*a(-1) + eA;                            //4.27
    qtilde  = delta*psi/(1-delta)*i -delta*psi/(1-delta)*k(-1) + q;

// Flexible price model (not explicitly treated in original model)

// Aggregate demand block

yf = C_Y*cf + I_Y*if + G_Y*g + Ce_Y*cef;
//yf = C_Y*cf + I_Y*if + G_Y*g;
cf = -rf + cf(+1);
cef = nf;
// cef = 0;
rkf(+1) - rf = -nu*(nf -(qf + kf));
rkf = (1-eps)*(yf - kf(-1)) + eps*qtildef - qf(-1);
qf = psi*(if - kf(-1));

qtildef  = delta*psi/(1-delta)*if -delta*psi/(1-delta)*kf(-1) + qf;


// Aggregate supply block

yf = a + alpha*kf(-1) + (1-alpha)*omega*hf;
yf - hf - cf = (eta^(-1))*hf;


// Evolution of state variables:

kf = delta*if + (1-delta)*kf(-1);
nf = gamma*R*K_N*(rkf - rf(-1)) + rf(-1) + nf(-1);


end;


shocks;
var eA; stderr 0.1;
var fiscal_; stderr 0.1;  //eG
var interest_; stderr 0.1;
end;


// stoch_simul(IRF=12) output inflationq interest outputgap;
