// US_NS14FSCM

// Reference: Emi Nakamura and J�n Steinsson (2014).
// "Fiscal Stimulus in a Monetary Union: Evidence from US Regions"
// American Economic Review 2014, 104(3): 753-792

// Model replication carried out by:
// Bopjun Gwak and Paul Reimers, Goethe University, Frankfurt.
// Last edited in April 2017.

// NOTES:
//    1. The model implemented in the MMB is the firm-specific capital with
//       GHH preferences specification.
//    2. The flexible-price economy assumes no nominal rigidities in both home
//       and foreign countries; all inflations as well as terms of trade are constant.
//    3. All common variables have been defined in terms of aggregate variables for
//       consistency with respect to MMB.
//    4. The aggregate fiscal shock, fiscal_, was added for consistency with MMB common
//       shocks.
//    5. The state-specific shock reported in the original paper is the "Home Government
//       Spending" shock, eg.
//    6. The model-specific rule implemented in MMB reflects the "Volcker-Greenspan" policy
//       rule reported in p. 776 of the paper; note that the coefficient on fiscal spending
//       is zero.

var c cf r pi pif piH piF l lf pH p pf sH sF y yf g gf w wf i if k kf ny nyf q
    c_n cf_n r_n l_n lf_n sH_n sF_n y_n yf_n
    g_n gf_n w_n wf_n i_n if_n k_n kf_n ny_n nyf_n eg_agg
//**************************************************************************
// Modelbase Variables                                                   //*
   interest inflation inflationq output fispol outputgap ;               //*
//**************************************************************************

varexo eg egf /*er*/
//**************************************************************************
// Modelbase Shocks                                                      //*
       interest_ fiscal_;                                                //*
//**************************************************************************

parameters
//**************************************************************************
// Modelbase Parameters                                                  //*
        cofintintb1 cofintintb2 cofintintb3 cofintintb4                  //*
        cofintinf0 cofintinfb1 cofintinfb2 cofintinfb3 cofintinfb4       //*
        cofintinff1 cofintinff2 cofintinff3 cofintinff4                  //*
        cofintout cofintoutb1 cofintoutb2 cofintoutb3 cofintoutb4        //*
        cofintoutf1 cofintoutf2 cofintoutf3 cofintoutf4                  //*
        cofintoutp cofintoutpb1 cofintoutpb2 cofintoutpb3 cofintoutpb4   //*
        cofintoutpf1 cofintoutpf2 cofintoutpf3 cofintoutpf4              //*
        std_r_ std_r_quart coffispol                                     //*
//**************************************************************************
sigma_c sigma_l beta kappa zeta phiH phiF phiHstar phiFstar Cbar Ibar nn eta rhoii
phiPi phiY phiG rhoG aa nu omegaBar delta eps_phi rho_y rho_k kappa_n zeta_n ;

sigma   = 1;                % Intertemporal elastisity of substitution
alpha   = 0.75;             % Calvo parameter
beta    = 0.99;             % Subjective discount factor
nu      = 1;                % Frish elasticity of labor suppy
aa      = 0.67;             % Curvature of production function
eta     = 2;                % Elasticity of substitution between home and foreign goods
theta   = 7;                % Elasticity of substitution between varieties
delta   = 0.012;            % Rate of depreciation of capital
eps_phi = 3;                % Capital adjustment cost parameter
nn      = 0.1;              % Size of home region
phiH    = 0.69;             % Weig ht of home goods in home consumption basket
phiF    = 1-phiH;           % Weight of foreign goods in home consumption basket
phiHstar = phiF*nn/(1-nn);  % Weight of home goods in foreign consumption basket
phiFstar = 1 - phiHstar;    % Weight of foreign goods in foreign consumption basket

phiPi    = 1.5;             % Inflation response in Taylor Rule
phiY     = 0.5;             % Output response in Taylor Rule
rhoii    = 0.8;             % Lagged dependence in Taylor Rule
phiG     = 0.0;             % Direct response of monetary policy to fiscal shock
phi_c    = 1;               % Consumption elasticity of money demand
phi_i    = 0;               % Interest elasticity of money demand
rhoG     = 0.933;           % Persistence of government spending shock
corrG    = 0.999;           % Correlation of home and foreign gov spending shocks

KoverL   = ((1-aa)*(beta/(1-beta*(1-delta)))*(theta-1)/theta)^(1/aa);
Ibar     = delta*KoverL^aa; % Steady state investment-output ratio
Gbar     = 0.2;      % Steady state government spending-output ratio
Cbar     = 1 - Gbar - Ibar; % Steady state consumption-output ratio
sigma_c  = sigma^(-1)*(1-aa*((theta-1)/theta)*Cbar^(-1)*(1+1/nu)^(-1))^(-1);
sigma_l  = (Cbar^(-1)*((theta-1)/theta)*aa*sigma_c^(-1))^(-1);
kappa    = (1-alpha)*(1-alpha*beta)/alpha;
omegaBar = (nu^(-1)+1-aa)/aa;
rho_y    = omegaBar + 1;
rho_k    = rho_y - nu^(-1);
Xi       = (1-beta*(1-delta))*rho_y*theta*eps_phi^(-1);

AA = 1+beta+(1-beta*(1-delta))*rho_k*eps_phi^(-1);
BB = 2*(1+omegaBar*theta)*alpha*beta+alpha^2*beta*(omegaBar-nu^(-1))*Xi;
RR0 = beta*(1+omegaBar*theta);
RR1 = -beta*BB-(1+omegaBar*theta)*AA;
RR2 = beta*(1+omegaBar*theta)+beta*AA*BB+alpha*beta^2*(1+omegaBar*theta);
RR3 = -beta*BB-alpha*beta^2*AA*(1+omegaBar*theta);
RR4 = alpha*beta^2*(1+omegaBar*theta);

QQ = [RR4 RR3 RR2 RR1 RR0];

lambda = roots(QQ);
realLambda = (lambda == real(lambda));
lessOneLambda = (abs(lambda) < 1);
whichLambda = realLambda.*lessOneLambda;
lambda = whichLambda'*lambda;
tauBar = alpha*Xi*lambda/(1-alpha*beta*lambda);
zeta     = (1+omegaBar*theta-(omegaBar-nu^(-1))*tauBar*alpha*beta/(1-alpha*beta*lambda))^(-1);

//**************************************************************************
// Specification of Modelbase Parameters                                 //*
                                                                         //*
// Load Modelbase Monetary Policy Parameters                             //*
thispath = pwd;                                                           //*
cd('..');                                                                //*
load policy_param.mat;                                                   //*
for i=1:33                                                               //*
    deep_parameter_name = M_.param_names(i,:);                           //*
    eval(['M_.params(i)  = ' deep_parameter_name ' ;'])                  //*
end                                                                      //*
cd(thispath);                                                            //*
std_r_= 1;                                                               //*
// Definition of Discretionary Fiscal Policy Parameter                   //*
coffispol = 1;                                                           //*
//**************************************************************************

%----------------------------------------------------------------
% Model
%----------------------------------------------------------------

model(linear);

//***************************************************************************
// Definition of Modelbase Variables in Terms of Original Model Variables //*

interest       = r*4;
inflation      = nn*(1/4)*(4*pi+4*pi(-1)+4*pi(-2)+4*pi(-3))+(1-nn)*(1/4)*(4*pif+4*pif(-1)+4*pif(-2)+4*pif(-3));
inflationq     = nn*pi*4+(1-nn)*pif*4;
outputgap      = (nn*y+(1-nn)*yf)-(nn*y_n+(1-nn)*yf_n);
output         = (nn*y + (1-nn)*yf);

fispol = eg_agg;
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
           + std_r_*interest_;                                           //*
                                                                         //*
// Discretionary Government Spending                                     //*
                                                                         //*
fispol = coffispol*fiscal_;                                              //*
//**************************************************************************

//Home Consumption Euler
c=c(+1)-sigma_c*(r-pi(+1))+sigma_c/sigma_l*l-sigma_c/sigma_l*l(+1);

//Backus Smith Condition
c-cf=sigma_c*q+sigma_c/sigma_l*(l-lf);

//Home Phillips Curve
piH=beta*piH(+1)+kappa*zeta*sH;

//Foreign Phillips Curve
piF=beta*piF(+1)+kappa*zeta*sF;

//Home Inflation
pi=phiH*piH+phiF*piF;

//Foreign Inflation
pif=phiHstar*piH+phiFstar*piF;

//Home Ressource Constraint
y=phiH*Cbar*c+(1-nn)/nn*phiHstar*Cbar*cf+Ibar*phiH*i+(1-nn)/nn*phiHstar*Ibar*if-eta*(Cbar+Ibar)*(phiH+(1-nn)/nn*phiHstar)*pH+eta*(Cbar+Ibar)*(1-nn)/nn*phiHstar*q+g;

//Foreign Ressource Constraint: Corrected at various points, esp. nn/(1-nn)
yf=phiFstar*Cbar*cf+nn/(1-nn)*phiF*Cbar*c+Ibar*phiFstar*if+
nn/(1-nn)*Ibar*phiF*i + eta*(Cbar+Ibar)*(phiFstar+nn/(1-nn)*phiF)*phiH/phiF*pH+eta*(Cbar+Ibar)*phiFstar*q+gf;

//Home Relative Price
pH-pH(-1)=piH-pi;

//Real Exchange Rate
phiHstar*pH-phiH/phiF*phiFstar*pH=q;

//Monetary Policy Rule
//r=rhoii*r(-1)+(1-rhoii)*(phiPi*(nn*pi+(1-nn)*pif)+phiY*(nn*y+(1-nn)*yf)+phiG*(nn*g+(1-nn)*gf))+er;

//Home Government Spending
g=rhoG*g(-1)+eg+eg_agg;

//Foreign Government Spending
gf=rhoG*gf(-1)+egf+eg_agg;

//Home Nominal Output
ny=y+p;

//Foreign Nominal Output
nyf=yf+pf;

//Home Production Function
y=aa*l+(1-aa)*k(-1);

//Foreign Production Function
yf=aa*lf+(1-aa)*kf(-1);

//Home and Foreign Real Wage
w=1/nu*l;
wf=1/nu*lf;

//Home Marginal Costs
sH+pH=omegaBar*y-(omegaBar-1/nu)*k(-1);                % sH, sF real marginal cost

//Foreign Marginal Costs
sF-phiH/phiF*pH=omegaBar*yf-(omegaBar-1/nu)*kf(-1)+q;

//Home & Foreign Capital Accumulation
k=(1-delta)*k(-1)+delta*i;
kf=(1-delta)*kf(-1)+delta*if;

//Home Optimal Investment
sigma_c^(-1)*c-sigma_c^(-1)*c(+1)-sigma_l^(-1)*l+sigma_l^(-1)*l(+1)-(1+beta)*eps_phi*k
-(1-beta*(1-delta))*rho_k*k+beta*eps_phi*k(+1)+(1-beta*(1-delta))*rho_y*y(+1)=-eps_phi*k(-1);

//Foreign Optimal Investment
sigma_c^(-1)*cf-sigma_c^(-1)*cf(+1)-sigma_l^(-1)*lf+sigma_l^(-1)*lf(+1)-(1+beta)*eps_phi*kf
-(1-beta*(1-delta))*rho_k*kf+beta*eps_phi*kf(+1)+(1-beta*(1-delta))*rho_y*yf(+1)=-eps_phi*kf(-1);

//Home PPI:
p=piH+p(-1);

//Foreign PPI
pf=piF+pf(-1);


////////////////////////////
/// Flexible price model////
////////////////////////////

//Home Consumption Euler
c_n=c_n(+1)-sigma_c*r_n+sigma_c/sigma_l*l_n-sigma_c/sigma_l*l_n(+1);

//Backus Smith Condition
c_n-cf_n=sigma_c*0+sigma_c/sigma_l*(l_n-lf_n);

//Home Ressource Constraint
y_n=phiH*Cbar*c_n+(1-nn)/nn*phiHstar*Cbar*cf_n+Ibar*phiH*i_n+(1-nn)/nn*phiHstar*Ibar*if_n-eta*(Cbar+Ibar)*(phiH+(1-nn)/nn*phiHstar)*0+eta*(Cbar+Ibar)*(1-nn)/nn*phiHstar*0+g_n;

//Foreign Ressource Constraint: Corrected at various points, esp. nn/(1-nn)
yf_n=phiFstar*Cbar*cf_n+nn/(1-nn)*phiF*Cbar*c_n+Ibar*phiFstar*if_n+
nn/(1-nn)*Ibar*phiF*i_n + eta*(Cbar+Ibar)*(phiFstar+nn/(1-nn)*phiF)*phiH/phiF*0+eta*(Cbar+Ibar)*phiFstar*0+gf_n;

//Constant Marginal Cost
(nn*sH_n+(1-nn)*sF_n) = 0;

//Home Government Spending
g_n=rhoG*g_n(-1)+eg+eg_agg;

//Foreign Government Spending
gf_n=rhoG*gf_n(-1)+egf+eg_agg;

//Home Nominal Output
ny_n=y_n;

//Foreign Nominal Output
nyf_n=yf_n;

//Home Production Function
y_n=aa*l_n+(1-aa)*k_n(-1);

//Foreign Production Function
yf_n=aa*lf_n+(1-aa)*kf_n(-1);

//Home and Foreign Real Wage
w_n=1/nu*l_n;
wf_n=1/nu*lf_n;

//Home Marginal Costs
sH_n=omegaBar*y_n-(omegaBar-1/nu)*k_n(-1);

//Foreign Marginal Costs
sF_n=omegaBar*yf_n-(omegaBar-1/nu)*kf_n(-1)+0;

//Home & Foreign Capital Accumulation
k_n=(1-delta)*k_n(-1)+delta*i_n;
kf_n=(1-delta)*kf_n(-1)+delta*if_n;

//Home Optimal Investment
sigma_c^(-1)*c_n-sigma_c^(-1)*c_n(+1)-sigma_l^(-1)*l_n+sigma_l^(-1)*l_n(+1)-(1+beta)*eps_phi*k_n
-(1-beta*(1-delta))*rho_k*k_n+beta*eps_phi*k_n(+1)+(1-beta*(1-delta))*rho_y*y_n(+1)=-eps_phi*k_n(-1);

//Foreign Optimal Investment
sigma_c^(-1)*cf_n-sigma_c^(-1)*cf_n(+1)-sigma_l^(-1)*lf_n+sigma_l^(-1)*lf_n(+1)-(1+beta)*eps_phi*kf_n
-(1-beta*(1-delta))*rho_k*kf_n+beta*eps_phi*kf_n(+1)+(1-beta*(1-delta))*rho_y*yf_n(+1)=-eps_phi*kf_n(-1);

//-----------------------------------

end;

shocks;
var fiscal_ = 1;
var eg      = 1;
var egf     = 1;
end;

//steady;

//stoch_simul(hp_filter = 1600, order = 1);
