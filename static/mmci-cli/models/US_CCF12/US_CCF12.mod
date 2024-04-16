
//**************************************************************************
// A New Comparative Approach to Macroeconomic Modeling and Policy Analysis
//
// Volker Wieland, Tobias Cwik, Gernot J. Mueller, Sebastian Schmidt and
// Maik Wolters
//
//**************************************************************************

//Model: US_CCF12

//Model replication code by: Alina T�nzer (alina.taenzer@hof.uni-frankfurt.de)

//Last edited: December 2017

//Reference:
//Chen H., Curdia V., Ferrero A.
//"The Macroeconomic Effects of Large-Scale Asset Purchase Programmes"
//In: The Economic Journal (2012)
//**************************************************************************

//THIS VERSION NO FISCAL POLICY; BUT NOT RUNNING

//-----------------------------------
//1. Defining variables
//-----------------------------------

var         marc rk r rL wz Kz Kz_eff L Yz Xpnu Xpnr Xpdu Xpdr Xwnu
            Xwnr Xwdu Xwdr pi u Iz mu z psi lambda_ms bu br
            Xiu Xir q Czu Czr zeta_h Bz BzL Gz Tz
            shock_zeta BLMVz BTotMVz slope rLEH RP rr rLr rLEHr
            Yz_growth pi_ann r_ann rL_ann dy y infl FFR bondrate riskprem y_level
            eps_Gz
    //flex price variables
            marcf pif rkf wzf Kz_eff_f Lf Yzf zf uf Kzf Izf muf qf Xiuf Xirf buf
            brf Czuf Czrf rf zeta_h_f rLf Bzf BzLf Gzf Tzf psif BLMVzf BTotMVzf ygap
            Xwnuf Xwnrf Xwduf Xwdrf
            //**************************************************************************
            // Modelbase Variables                                                   //*
                    interest inflation inflationq outputgap output fispol;        //*
            //**************************************************************************


varexo      eps_z eps_phi eps_lambda eps_mu eps_zeta eps_bu eps_br eps_T  eps_B
            //**************************************************************************
            // Modelbase Shocks                                                      //*
                interest_ fiscal_;                                              //*
            //**************************************************************************
            //eps_m, eps_G  cancelled, fiscal_ cancelled
parameters  //**************************************************************************
            // Modelbase Parameters                                                  //*
                                                                         //*
                cofintintb1 cofintintb2 cofintintb3 cofintintb4                  //*
                cofintinf0 cofintinfb1 cofintinfb2 cofintinfb3 cofintinfb4       //*
                cofintinff1 cofintinff2 cofintinff3 cofintinff4                  //*
                cofintout cofintoutb1 cofintoutb2 cofintoutb3 cofintoutb4        //*
                cofintoutf1 cofintoutf2 cofintoutf3 cofintoutf4                  //*
                cofintoutp cofintoutpb1 cofintoutpb2 cofintoutpb3 cofintoutpb4   //*
                cofintoutpf1 cofintoutpf2 cofintoutpf3 cofintoutpf4              //*
                std_r_ std_r_quart coffispol                                    //* coffispol
            //**************************************************************************
            alpha betau betar beta_av delta gamma kappa lambdaw lambdaf zeta zetap zetaw chi_pu chi_wu
            omegau omegar S_dp a_dp zeta_prime RL phi_T phi_pi phi_y qu h sigmau sigmar nu rho_bu rho_br
            rho_B rho_zeta rho_Gz rho_r rho_z rho_phi rho_mu rk_SS r_SS Bz_SS C_ratio Czu_SS Czr_SS BzL_SS
            Gz_SS Iz_SS Yz_SS Tz_SS Pi_SS Kz_eff_SS Kz_SS X_ratio sigma_z sigma_lambda sigma_mu sigma_b
            sigma_phi sigma_B sigma_T sigma_m sigma_zeta sigma_g BLMVB BLB BLMVz_SS kappaEH BondDuration;

//--------------------------------------------------------------------------
// 2. Calibration
//-----------------------------------------------------------------------

//CALIBRATED PARAMETERS
alpha       = 0.33;             //share of capital in production
lambdaw     = 0.15;                //steady state wage markup
lambdaf     = 0.15;                //steady state price markup
delta       = 0.025;            //capital depreciation rate
Gz_SS       = 0.2;


//ESTIMATED PARAMETERS FROM POSTERIOR DISTRIBUTION - TRANSFORMED
gamma       = 0.005;            //check: vorher 0.5
betau       = 0.9988;           //discount factor for unconstrained HH
pi_SS       = 0.0053;             //quarterly SS inflation *100 in percent, annualized about 2%
zeta        = 0.001242;          //transaction costs (SS spread between 10-year treasury yield and federal funds rate)
zeta_prime  = 0.003274;         //elasticity of risk premium to changes in in market value of long-term debt
BondDuration = 30;

//ESTIMATED PARAMETERS FROM POSTERIOR DISTRIBUTION
BLMVB       = 0.8533;
zetap       = 0.9288;            //price rigidity parameter
zetaw       = 0.7342;            //wage rigidity parameter
chi_wu      = 0.5611;
omegau      = 0.9468;            //fraction of unrestricted agents
omegar      = 1 - omegau;        //fraction of restricted agents
S_dp        = 4.7815;           //investment adjustment cost convexity parameter
a_dp        = 0.2159;           //utilization cost elasticity parameter
phi_T       = 1.2543;           //fiscal rule parameter
phi_pi      = 1.5979;           //monetary policy rule weight on inflation
phi_y       = 0.3251;           //monetary policy rule weight on output growth
h           = 0.8020;           //habit formation coefficient
sigmau      = 3.3548;           //intertemporal elasticity of substitution of consumption
sigmar      = 2.0825;           //intertemporal elasticity of substitution of consumption
nu          = 1.9295;           //labor supply elasticity

rho_bu      = 0.9614;
rho_br      = 0.9614;
rho_B       = 0.9659;
rho_zeta    = 0.9426;
rho_Gz      = 0.7491;
rho_r       = 0.8565;           //interest rate smoothing in MP rule
rho_z       = 0.1430;
rho_phi     = 0.5074;
rho_mu      = 0.8489;
//std deviation of shock innovations:
sigma_z         = 0.7588;
sigma_lambda    = 1.7939;
sigma_mu        = 2.9725;
sigma_b         = 3.5860;
sigma_phi       = 0.7628;
sigma_B         = 0.3578;
sigma_T         = 0.3457;
sigma_m         = 0.1161; //0.25/4;   //for 25 bp shock (times 4 because goal is 25 bp change in annual rate)  original value:0.1161
sigma_zeta      = 0.2592;
sigma_g         = 0.3429;

//Parameters derived from SS:

C_ratio     = 0.9760;             //Ratio of consumption of unconstrained and constrained HH
Yz_SS       = 1;
X_ratio     = 1.0730;             //ratio of unconstrained and constrained marginal utility

betar       = betau/(1+zeta);                                       //discount factor for constrained HH
Pi_SS       = 1+pi_SS;                                              //aus Text
r_SS        = 1/betau*exp(gamma)*Pi_SS;                             //from C.1
RL          = r_SS*(1+zeta);                                        //from C.2
kappa       = RL*(1-1/BondDuration);                                //coupon of long-term bonds, duration 30 quarters, text page 302
kappaEH     = r_SS*(1-1/BondDuration);
BLB         =(RL-kappa)*BLMVB;
Bz_SS       = 0.25*4/(1+BLB);
BzL_SS      = BLB*Bz_SS;
BLMVz_SS    = BLMVB*Bz_SS;
beta_av     = (omegau*betau*(X_ratio)+omegar*betar)/(omegau*(X_ratio)+omegar);
rk_SS       = beta_av^(-1)*exp(gamma)-(1-delta);                    //from C.8
qu          = (beta_av/betar -1)*zeta^(-1);
chi_pu      = omegau/(omegau + omegar*((1-betau*zetap)/(1-betar*zetap))/(X_ratio));
Kz_eff_SS   = alpha/(1+lambdaf)*1/rk_SS;                            //from C.11
Kz_SS       = exp(gamma)*alpha/(1+lambdaf)*1/rk_SS;                 //from C.13
Iz_SS       = (exp(gamma)-(1-delta))*alpha/(1+lambdaf)*1/rk_SS;      //from C.14
Tz_SS       = Gz_SS - (1-1/betau + (1-1/betar)/(RL-kappa)*BLB)*Bz_SS;
Czr_SS      = (1-Iz_SS-Gz_SS)/(omegau*C_ratio+omegar);              //from C.16
Czu_SS      = C_ratio*Czr_SS;                                       //from C.17

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


//--------------------------------------------------------------------------
// 3. Model
//-----------------------------------------------------------------------

model(linear);

//**************************************************************************
// Definition of Modelbase Variables in Terms of Original Model Variables //*

interest   =   FFR*1;                                           //*
inflation =    (pi + pi(-1) + pi(-2) + pi(-3))*1;   //*
inflationq  =  pi*4;                                      //*
outputgap  =   ygap*1/4;                                                    //*
output =       y*1/4;                                                    //*
fispol = eps_Gz;                                                         //*
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

//DiscretionaryGovernmentSpending                                      //*
fispol=coffispol*fiscal_;                                              //*                                                                    //*
//**************************************************************************


//comment out MP-rule and MP-shock
//***********************************
//INTERMEDIATE GOODS PRODUCERS:

//real marginal costs (D.1)
marc = alpha*rk + (1-alpha)*wz;
marcf= alpha*rkf + (1-alpha)*wzf;

//capital demand (D.2)
Kz_eff = wz - rk + L;
Kz_eff_f = wzf - rkf + Lf;

//Technology (D.3)
Yz = alpha*Kz_eff + (1-alpha)*L;
Yzf = alpha*Kz_eff_f + (1-alpha)*Lf;

//Price Setting unconstrained (u) and restricted (r) (D.4, D.5)
Xpnu = (1-betau*zetap)*(Xiu + Yz + lambda_ms + marc) + betau*zetap*((1+lambdaf)/lambdaf*pi(+1) + Xpnu(+1));
Xpnr = (1-betar*zetap)*(Xir + Yz + lambda_ms + marc) + betar*zetap*((1+lambdaf)/lambdaf*pi(+1) + Xpnr(+1));

Xpdu = (1-betau*zetap)*(Xiu + Yz) + betau*zetap*(1/lambdaf*pi(+1) + Xpdu(+1));
Xpdr = (1-betar*zetap)*(Xir + Yz) + betar*zetap*(1/lambdaf*pi(+1) + Xpdr(+1));

//Law of motion of prices (D.6)
pi = (1-zetap)/zetap*(chi_pu*Xpnu + (1-chi_pu)*Xpnr - chi_pu*Xpdu -(1-chi_pu)*Xpdr);

//CAPITAL PRODUCERS:

//Effective Capital (D.7)
Kz_eff = -z + u + Kz(-1);
Kz_eff_f = -zf + uf + Kzf(-1);

//Law of motion of capital (D.8)
Kz = (1-delta)*exp(-gamma)*(Kz(-1)-z)+ (1-(1-delta)*exp(-gamma))*(mu+Iz);
Kzf = (1-delta)*exp(-gamma)*(Kzf(-1)-z)+ (1-(1-delta)*exp(-gamma))*(muf+Izf);

//Capital Utilization (D.9)
rk = a_dp/rk_SS*u;
rkf = a_dp/rk_SS*uf;

//Law of motion of Q (D.10)
q = beta_av*exp(-gamma)*(rk_SS*rk(+1)+(1-delta)*q(+1))-z(+1)+ qu*((1+zeta)
    /(1+qu*zeta)*Xiu(+1)-Xiu)+(1-qu)*(1/(1+qu*zeta)*Xir(+1)-Xir);
qf = beta_av*exp(-gamma)*(rk_SS*rkf(+1)+(1-delta)*qf(+1))-zf(+1)+ qu*((1+zeta)
    /(1+qu*zeta)*Xiuf(+1)-Xiuf)+(1-qu)*(1/(1+qu*zeta)*Xirf(+1)-Xirf);

//Investment decision (D.11)
0 = q + mu - exp(2*gamma)*S_dp*(z + Iz - Iz(-1))+ beta_av*exp(2*gamma)*S_dp*(z(+1) + Iz(+1)-Iz);
0 = qf + muf - exp(2*gamma)*S_dp*(zf + Izf - Izf(-1))+ beta_av*exp(2*gamma)*S_dp*(zf(+1) + Izf(+1)-Izf);

//HOUSEHOLDS:

//Marginal utilities each type (u,r) (D.12)
Xiu = 1/(1-betau*h)*((bu - betau*h*bu(+1))-sigmau/(1-h)*((1+betau*h^2)*Czu-betau*h*Czu(+1)-h*Czu(-1)));
Xir = 1/(1-betar*h)*((br - betar*h*br(+1))-sigmar/(1-h)*((1+betar*h^2)*Czr-betar*h*Czr(+1)-h*Czr(-1)));
Xiuf = 1/(1-betau*h)*((buf - betau*h*buf(+1))-sigmau/(1-h)*((1+betau*h^2)*Czuf-betau*h*Czuf(+1)-h*Czuf(-1)));
Xirf = 1/(1-betar*h)*((brf - betar*h*brf(+1))-sigmar/(1-h)*((1+betar*h^2)*Czrf-betar*h*Czrf(+1)-h*Czrf(-1)));

//EE unconstrained, short (D.13); Fisher equation
Xiu = r + Xiu(+1)-z(+1)-pi(+1);
Xiuf = rf + Xiuf(+1)-zf(+1)-pif(+1);

//EE unconstrained, long (D.14);
zeta_h + Xiu = RL/(RL-kappa)*rL + Xiu(+1) -z(+1) -pi(+1) -kappa/(RL-kappa)*rL(+1);
zeta_h_f + Xiuf = RL/(RL-kappa)*rLf + Xiuf(+1) -zf(+1) -pif(+1) -kappa/(RL-kappa)*rLf(+1);

//EE constrained, long (D.15);
Xir = RL/(RL-kappa)*rL + Xir(+1) -z(+1) -pi(+1) -kappa/(RL-kappa)*rL(+1);
Xirf = RL/(RL-kappa)*rLf + Xirf(+1) -zf(+1) -pif(+1) -kappa/(RL-kappa)*rLf(+1);

//Wage setting (D.16)
Xwnu = (1-zetaw*betau)*(bu + psi + (1+nu)*L + (1+lambdaw)/lambdaw*(1+nu)*wz)
        + zetaw*betau*((1+lambdaw)/lambdaw*(1+nu)*(pi(+1)+z(+1))+Xwnu(+1));
Xwnr = (1-zetaw*betar)*(br + psi + (1+nu)*L + (1+lambdaw)/lambdaw*(1+nu)*wz)
        + zetaw*betar*((1+lambdaw)/lambdaw*(1+nu)*(pi(+1)+z(+1))+Xwnr(+1));
Xwnuf = (buf + psif + (1+nu)*Lf + (1+lambdaw)/lambdaw*(1+nu)*wzf);
Xwnrf = (brf + psif + (1+nu)*Lf + (1+lambdaw)/lambdaw*(1+nu)*wzf);


//Wage setting (D.17)
Xwdu = (1-zetaw*betau)*(Xiu+L+(1+lambdaw)/lambdaw*wz) + zetaw*betau*(1/lambdaw*(pi(+1)+z(+1))+Xwdu(+1));
Xwdr = (1-zetaw*betar)*(Xir+L+(1+lambdaw)/lambdaw*wz) + zetaw*betar*(1/lambdaw*(pi(+1)+z(+1))+Xwdr(+1));
Xwduf = (Xiuf+Lf+(1+lambdaw)/lambdaw*wzf);
Xwdrf = (Xirf+Lf+(1+lambdaw)/lambdaw*wzf);

//Law of motion of real wages (D.18)
wz=(1-zetaw)/(1+(1+lambdaw)/lambdaw*nu)*(chi_wu*(Xwnu-Xwdu)+(1-chi_wu)*(Xwnr-Xwdr))+ zetaw*(wz(-1)-pi-z);
wzf=1/(1+(1+lambdaw)/lambdaw*nu)*(chi_wu*(Xwnuf-Xwduf)+(1-chi_wu)*(Xwnrf-Xwdrf));

//GOVERNMENT DEBT:

//Budget constraint (D.19)
Bz+(BzL_SS/Bz_SS)/(RL-kappa)*BzL = betau^(-1)*(Bz(-1)+r(-1))+(BzL_SS/Bz_SS)/(RL-kappa)*betar^(-1)*BzL(-1)
                         +(1-exp(-gamma)*Pi_SS^(-1)*kappa)*RL/(RL-kappa)*(BzL_SS/Bz_SS)/(RL-kappa)*rL
                         +Gz_SS/Bz_SS*Gz - Yz_SS/Bz_SS*Tz -(betau^(-1)+(BzL_SS/Bz_SS)/(RL-kappa)*betar^(-1))*(z+pi);
Bzf+(BzL_SS/Bz_SS)/(RL-kappa)*BzLf = betau^(-1)*(Bzf(-1)+rf(-1))+(BzL_SS/Bz_SS)/(RL-kappa)*betar^(-1)*BzLf(-1)
                         +(1-exp(-gamma)*Pi_SS^(-1)*kappa)*RL/(RL-kappa)*(BzL_SS/Bz_SS)/(RL-kappa)*rLf
                         +Gz_SS/Bz_SS*Gzf - Yz_SS/Bz_SS*Tzf -(betau^(-1)+(BzL_SS/Bz_SS)/(RL-kappa)*betar^(-1))*(zf+pif);

//EQUATIONS WHICH ARE NEW AS IN OFFICIAL CODE:
//******************************************************************
//Long-term bond policy (D.20)

    //defining the LHS of bond equation D.20
    BLMVz = BzL - RL/(RL-kappa)*rL;
    BLMVzf=BzLf -RL/(RL-kappa)*rLf;

    //defining the evolution of (long-term) bonds
    BLMVz = rho_B*BLMVz(-1)+eps_B;
    BLMVzf= rho_B*BLMVzf(-1) + eps_B;


    //Transfers feedback rule
    (Tz-Gz_SS*Gz)/(Tz_SS-Gz_SS)= phi_T*BLMVz(-1)+eps_T;
    (Tzf-Gz_SS*Gzf)/(Tz_SS-Gz_SS)= phi_T*BLMVzf(-1)+eps_T;
    //definition of RHS bracket
    Bz+(BzL_SS/Bz_SS)/(RL-kappa)*BzL-(BzL_SS/Bz_SS)*RL/((RL-kappa)^2)*rL -(1+ (BzL_SS/Bz_SS)/(RL-kappa))*BTotMVz;
    Bzf+(BzL_SS/Bz_SS)/(RL-kappa)*BzLf-(BzL_SS/Bz_SS)*RL/((RL-kappa)^2)*rLf -(1+ (BzL_SS/Bz_SS)/(RL-kappa))*BTotMVzf;



//Term premium (D.23)/ risk premium

    zeta_h = zeta_prime/2*(BLMVz - Bz) + shock_zeta;
    zeta_h_f = zeta_prime/2*(BLMVzf - Bzf) + shock_zeta;
    shock_zeta = rho_zeta*shock_zeta(-1)+eps_zeta;
//************************************************************************


        //Monetary policy (D.22)
        //r = rho_r*r(-1) + (1-rho_r)*(phi_pi*pi + phi_y*(Yz - Yz(-4) + z + z(-1) + z(-2) + z(-3))) + eps_m;

//Aggregate Resource constraint (D.24)
Yz*Yz_SS = omegau*Czu_SS*Czu + omegar*Czr_SS*Czr + Iz_SS*Iz + Gz_SS*Gz + exp(-gamma)*rk_SS*Kz_SS*u;
Yzf*Yz_SS = omegau*Czu_SS*Czuf + omegar*Czr_SS*Czrf + Iz_SS*Izf + Gz_SS*Gzf + exp(-gamma)*rk_SS*Kz_SS*uf;

//ADDITIONAL EXOGENOUS PROCESSES:

//technology process
z = rho_z*z(-1) + eps_z;
zf = rho_z*zf(-1) + eps_z;

//Preference for Leisure
psi=rho_phi*psi(-1) + eps_phi;

//price markup shock
lambda_ms=eps_lambda;

//Capital adjustment cost process
mu=rho_mu*mu(-1)+eps_mu;

//intertemporal preference shifter
bu=rho_bu*bu(-1)+eps_bu;
br=rho_br*br(-1)+eps_br;
buf=rho_bu*buf(-1)+eps_bu;
brf=rho_br*brf(-1)+eps_br;

//government spending process
Gz = rho_Gz*Gz(-1) + eps_Gz;
Gzf = rho_Gz*Gzf(-1) + eps_Gz;


// ADDITIONAL EQUATIONS FOR FLEX PRICE VERSION
ygap = (Yz - Yzf);
pif=0;
marcf=0;
rkf = rf;
psif=0;

//ADDITIONAL DEFINITIONS REQUIRED FOR PLOTTING:

    slope = rL - r;
    //EE unconstrained, under expectation hypothesis (EH)
    Xiu = r_SS/(r_SS-kappaEH)*rLEH + Xiu(+1)-z(+1)-pi(+1)-kappaEH/(r_SS-kappaEH)*rLEH(+1);
    //risk premium definition
    RP = rL - rLEH;
    //real rates
    rr = r - pi(+1);
    rLr = rL - pi(+1);
    rLEHr = rLEH - pi(+1);

//DEFINE ANNUAL RATES

Yz_growth        = 4*(Yz - Yz(-1));                     //annualized percentage rate
y_level          = Yz;                                //percentage deviation from trend, not annualized
pi_ann           = (pi + pi(-1) + pi(-2) + pi(-3));   //annualized percentage rate
r_ann            = 4*r;                                 //annualized percentage rate
rL_ann           = 4*rL;                                //annualized percentage rate
riskprem         = 4*RP;

//REDEFINE VARIABLED FOR IRF GRAPHS

dy      = Yz_growth;
y       = Yz;
infl    = pi_ann;
FFR     = r_ann;
bondrate    = rL_ann;


end;

//steady;
//check;


//--------------------------------------------------------------------------
// 4. Computation
//--------------------------------------------------------------------------
shocks;

//technology shock
        var eps_z = sigma_z^2;
//intratemporal preference shock
        var eps_phi = sigma_phi^2;
//price markup shock
        var eps_lambda = sigma_lambda^2;
//adjustment cost shock
        var eps_mu = sigma_mu^2;
//intertemporal preference shock
        var eps_bu = sigma_b^2;
        var eps_br = sigma_b^2;
//government spending shock
//        var eps_Gz = sigma_g^2;
//risk premium shock
        var eps_zeta = sigma_zeta^2;
//monetary policy shock
//        var eps_m = sigma_m^2;
//fiscal tax shock
        var eps_T = sigma_T^2;
//long-term bond supply shock
        var eps_B = sigma_B^2;

end;

//stoch_simul(linear,  irf=20)    Yzf ygap dy y infl FFR bondrate riskprem;
