//**************************************************************************
// US_GG24.mod - MMB Integrated Version
// Based on: Gagliardone and Gertler (2024)
// Integrated into MMB by Sodik Umurzakov & Hendrik Hegemann
//**************************************************************************

var
c         // Consumption
Lam       // Marginal utility of consumption
R_n       // Nominal interest rate (gross)
cq        // Consumption of domestic goods
co        // Consumption of oil
u         // Unemployment rate
n         // Employment
theta     // Labor market tightness
v         // Vacancies
Phi       // Matching function
q         // Job-finding probability
f         // Job-filling probability
y         // Intermediate (raw) output
yq        // Final output (real GDP)
o         // Oil demand
an        // Marginal product of labor
pc        // Price index of consumption goods
po        // Nominal price of oil
pq        // Retail output price
s         // Real oil price in consumption terms (po/pc)
sq        // Real oil price in output terms (po/pq)
piq       // Core inflation (log change of pq)
pic       // CPI inflation (log change of pc)
pw        // Marginal product of oil
p_star    // Optimal reset price (retail firms)
wq        // Real wage
wqo       // Pre-smoothed wage offer
x1        // Auxiliary variable for pricing numerator
x2        // Auxiliary variable for pricing denominator
p_tilde   // Price dispersion index (retail sector)
S         // Total oil supply (steady-state oil + consumption)
eps_o
eps_r
log_so    // Log real oil price in consumption units
log_soq   // Log real oil price in output units
log_po    // Log nominal oil price
log_pq    // Log retail output price
log_yq    // Log of real GDP
log_wq    // Log of real wage
pce       // Personal Consumption Expenditure price index
log_pce   // Log of PCE
ffr       // Federal Funds Rate (annualized)

// Flex price economy vars (keep only these)
c_flex             
Lam_flex 
R_r_flex
cq_flex
co_flex
u_flex
n_flex
theta_flex
v_flex
Phi_flex
q_flex
f_flex
y_flex
yq_flex
o_flex
an_flex
pcr_flex
s_flex
sq_flex
pw_flex
wq_flex
log_yq_flex

ygap




//**************************************************************************
// Modelbase Variables                                                   //*
        interest inflation inflationq outputgap output;                 //*
//**************************************************************************

varexo
eps_phi   // Shock to matching efficiency in the labor market
e_o       // Oil price shock
e_r       // Monetary policy shock
//**************************************************************************
// Modelbase Shocks                                                      //*
        interest_;                                                      //*
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
        std_r_ std_r_quart                                              //*
//**************************************************************************

// Structural parameters
beta eta rho sigma zeta b o_co_ss o_y_ss u_ss epsilon psi h lambda gamma phipi rhoR rhor rhoo sigmar sigmao
alpha chi costs;

% Quarterly transforned parameters
beta    = (0.998^3);  % Quarterly discount factor: compounded over 3 months
eta     = 4;
rho     = 0.96^3;  % Quarterly job survival rate: persistence over 3 months
sigma   = 0.5;
zeta    = 0.5;
b       = 0.7;
o_co_ss = 1.5;
o_y_ss  = 0.03;
u_ss    = 0.05;
epsilon = 0.374;
psi     = 0.02;
%h       = 0.914^3; % Quarterly habit persistence: cumulative carryover of past consumption
%lambda  = 0.945^3;% Quarterly Calvo stickiness: probability of no price change over 3 months
h = 0.75;
lambda = 0.83;
gamma   = 0.697;
phipi   = 2;
rhoR    = 0;
rhor    = 0.952^3;
rhoo    = 0.967^3;
sigmar  = 0.019 * sqrt(3);  % Quarterly std dev of monetary shock: scaled for variance aggregation
sigmao  = 0.06 * sqrt(3);  % Quarterly std dev of oil shock: scaled for variance aggregation

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

model;
//**************************************************************************
// Definition of Modelbase Variables in Terms of Original Model Variables//*
interest   = log(R_n^4/steady_state(R_n)^4);
inflation  = log((1+piq)*(1+piq(-1))*(1+piq(-2))*(1+piq(-3)));
inflationq = log((1+piq)^4);
output = log(yq/steady_state(yq));
outputgap = ygap;
//**************************************************************************
// Policy Rule                                                           //*
interest = cofintintb1*interest(-1)
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
//**************************************************************************

//**************************************************************************
// Original Model Equations
//Household
1=beta*Lam(+1)/Lam*R_n/(1+pic(+1));
Lam=1/(c-h*c(-1))-beta*h/(c(+1)-h*c);
cq=(1-chi)*(s/sq)^(-psi)*c;
co=chi*(s)^(-psi)*c;
1=(chi*s^(1-psi)+(1-chi)*(s/sq)^(1-psi))^(1/(1-psi));

//Labor market
u=1-n(-1);
theta=v/u;
Phi=exp(eps_phi)*u^sigma*v^(1-sigma);
q=Phi/v;
f=Phi/u;

//Intermediate output
y=(alpha^(1/epsilon)*n^(1-1/epsilon)+(1-alpha)^(1/epsilon)*o^(1-1/epsilon))^(1/(1-1/epsilon));

//Employment
n=rho*n(-1)+q*v;

//FOC hiring and marginal products
costs/q=pw*an-wq+rho*beta*Lam(+1)/Lam*(s(+1)/sq(+1))/(s/sq)*costs/q(+1);
an=(alpha*y/n)^(1/epsilon);
pw*((1-alpha)*y/o)^(1/epsilon)=sq;

//Wages
wqo=(zeta*(pw*an+rho*costs/q(+1)*beta*Lam(+1)/Lam*((s(+1)/sq(+1))/(s/sq)-1)+beta*Lam(+1)/Lam*costs*theta(+1))+(1-zeta)*s/sq*b)/(zeta+(1-zeta)*s/sq);
wq=wqo^(1-gamma)*steady_state(wqo)^(gamma);

//Retail firm pricing (not in the paper-> added equations)
p_star=eta/(eta-1)*x1/x2;
x1=Lam*pw*cq+lambda*beta*(1+piq(+1))^(1+eta)*(1/(1+pic(+1)))*x1(+1);
x2=Lam*cq+lambda*beta*(1+piq(+1))^(eta)*(1/(1+pic(+1)))*x2(+1);
p_tilde=(1-lambda)*(p_star)^(-eta)+lambda*(1+piq)^(eta)*p_tilde(-1);
1=((1-lambda)*(p_star)^(1-eta)+lambda*(1/(1+piq))^(1-eta))^(1/(1-eta));
yq=y/p_tilde;

//Resource constraints
o+co=S*exp(-eps_o);
S=steady_state(o)+steady_state(co);
cq=yq-costs*v;

//Monetary Policy
//R_n=(steady_state(R_n)*(1+piq)^(phipi))^(1-rhoR)*(R_n(-1))^rhoR*exp(eps_r);
//R_n/steady_state(R_n)=(1+piq)^(phipi)*exp(eps_r); %rhoR=0

//Prices
s=po/pc;
sq=po/pq;
pic=log(pc/pc(-1));
piq=log(pq/pq(-1));

//Shocks
eps_o=eps_o(-1)*rhoo+ (0.06 * sqrt(3)*13.1695)* e_o;
eps_r=eps_r(-1)*rhor+ 0.019*e_r;

//Variables in log
log_so=log(s);
log_soq=log(sq);
log_po=log(po);
log_pq=log(pq);
log_yq=log(yq);
log_wq=log(wq);
pce=pc;
log_pce=log(pce);
ffr=(R_n)^4;


//Flex price economy model block
// Household block (flex)
1=beta*Lam_flex(+1)/Lam_flex*R_r_flex/(pcr_flex(+1)/pcr_flex);
Lam_flex=1/(c_flex-h*c_flex(-1))-beta*h/(c_flex(+1)-h*c_flex);
cq_flex=(1-chi)*(s_flex/sq_flex)^(-psi)*c_flex;
co_flex=chi*(s_flex)^(-psi)*c_flex;
1=(chi*s_flex^(1-psi)+(1-chi)*(s_flex/sq_flex)^(1-psi))^(1/(1-psi));

// Labor market (flex)
u_flex=1-n_flex(-1);
theta_flex=v_flex/u_flex;
Phi_flex=exp(eps_phi)*u_flex^sigma*v_flex^(1-sigma);
q_flex=Phi_flex/v_flex;
f_flex=Phi_flex/u_flex;

// Production (flex)
y_flex=(alpha^(1/epsilon)*n_flex^(1-1/epsilon)+(1-alpha)^(1/epsilon)*o_flex^(1-1/epsilon))^(1/(1-1/epsilon));

//Employment
n_flex=rho*n_flex(-1)+q_flex*v_flex;

// Marginal products (flex)
costs/q_flex=pw_flex*an_flex-wq_flex+rho*beta*Lam_flex(+1)/Lam_flex*(s_flex(+1)/sq_flex(+1))/(s_flex/sq_flex)*costs/q_flex(+1);
an_flex=(alpha*y_flex/n_flex)^(1/epsilon);
pw_flex*((1-alpha)*y_flex/o_flex)^(1/epsilon)=sq_flex;

// Wages (flex)
wq_flex=(zeta*(pw_flex*an_flex+rho*costs/q_flex(+1)*beta*Lam_flex(+1)/Lam_flex*((s_flex(+1)/sq_flex(+1))/(s_flex/sq_flex)-1)+beta*Lam_flex(+1)/Lam_flex*costs*theta_flex(+1))+(1-zeta)*s_flex/sq_flex*b)/(zeta+(1-zeta)*s_flex/sq_flex);


//Retail firm pricing (not in the paper-> added equations)
1 = eta/(eta-1)* pw_flex;
yq_flex=y_flex;

// Resource constraints (flex)
o_flex+co_flex=S*exp(-eps_o);
cq_flex=yq_flex-costs*v_flex;

//Prices
s_flex=sq_flex/pcr_flex;

//log deviation
log_yq_flex = log(y_flex);
//Output gap
ygap=log_yq-log_yq_flex;

end;


//Steady state
steady_state_model;
pc=1;
po=1;
pq=1;
s=po/pc;
sq=po/pq;
p_star=1;
p_tilde=1;
pic=0;
piq=0;
R_n=1/beta;
u=u_ss;
pw=(eta-1)/eta;
alpha=1-((eta-1)/eta)^(-epsilon)*o_y_ss;
n=1-u;
Phi=(1-rho)*n;
v=(Phi/u^sigma)^(1/(1-sigma));
q=(1-rho)*n/v;
f=Phi/u;
theta=v/u;
y=n/( (1-(1-alpha)^(1/epsilon) * o_y_ss^(1-1/epsilon)) / alpha^(1/epsilon) )^(epsilon/(epsilon-1));
o=(1-alpha)*y*((eta-1)/eta)^(epsilon);
an=(alpha*y/n)^(1/epsilon);
costs=(1-zeta)*(an*pw-b)/(zeta*beta*theta+(1-rho*beta)/q);
wqo=(zeta*(pw*an+beta*costs*theta)+(1-zeta)*pq/pc*b)/(zeta+(1-zeta)*pq/pc);
wq=wqo;
yq=y;
cq=yq-costs*v;
c=cq+o*o_co_ss^(-1);
chi=1-cq/c;
co=chi*c;
Lam=(1-beta*h)/((1-h)*c);
x1=Lam*pw*cq/(1-lambda*beta);
x2=Lam*cq/(1-lambda*beta);
S=o+co;

eps_r=0;
eps_o=0;

//Calibrated parameters
alpha=1-((eta-1)/eta)^(-epsilon)*o_y_ss;
chi=co/c;
costs=(1-zeta)*(an*pw-b)/(zeta*beta*theta+(1-rho*beta)/q);

//Variables in log
log_so=log(po/pc);
log_soq=log(po/pq);
log_po=log(po);
log_pq=log(pq);
log_yq=log(yq);
log_wq=log(wq);
pce=pc;
log_pce=log(pce);
ffr=(R_n)^4; %multiply by 4 to get in year


c_flex = c;
Lam_flex = Lam;
R_r_flex = R_n;
cq_flex = cq;
co_flex = co;
u_flex = u;
n_flex = n;
theta_flex = theta;
v_flex = v;
Phi_flex = Phi;
q_flex = q;
f_flex = f;
y_flex = y;
yq_flex = yq;
o_flex = o;
an_flex = an;
pcr_flex = pc;
pq_flex = pq;
s_flex = s;
sq_flex = sq;
piq_flex = piq;
pw_flex = pw;
wq_flex = wq;
log_yq_flex=log(y_flex);

ygap=log_yq-log_yq_flex;
end;

//**************************************************************************
// Shocks
shocks;
  //var eps_phi;     stderr 0.01;                                         // Matching efficiency shock (labor market)
  var e_o;         stderr 1;            // Oil price shock (scaled to match IRFs)
  var e_r;         stderr 1;                                        // Structural monetary policy shock
  //var interest_;   stderr 1;                                         // MMB monetary policy shock
end;

//**************************************************************************
//IRFs
//stoch_simul(irf=18,order=1);
