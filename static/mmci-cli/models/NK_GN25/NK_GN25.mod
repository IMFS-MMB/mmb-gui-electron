//**************************************************************************
// NK_GN25.mod - MMB Integrated Version
//**************************************************************************
// Flexible Price DSGE Model with Energy Shocks and Labor Market Flows
//
// Author:  Nicolò Gnocato
// Based on:  Gnocato (2025), "Flexible Price DSGE Model with Energy Shocks 
//           and Labor Market Flows", JME
//
// Description:
// This model represents a small open economy DSGE framework with:
//   - Endogenous labor market search and matching frictions
//   - Heterogeneous households (workers and firm owners)
//   - Real wage rigidity
//   - Oil shocks affecting inflation and production
//   - A Taylor rule reacting to core inflation and labor market tightness
//
//
// Integrated into MMB by Sodik Umurzakov and Hendrik Hegemann
//**************************************************************************
var
    i       // Nominal interest rate
    Me      // Marginal utility of employed workers
    cn      // Consumption of employed workers
    cu      // Consumption of unemployed workers
    w       // Real wage
    delta   // Home production of unemployed (utility flow)

    cf      // Consumption of firm owners

    f       // Job-finding rate
    lambda  // Separation rate (transition from employment to unemployment)
    n       // Employment rate
    u       // Unemployment rate
    v       // Vacancies
    pig
    mc      // Real marginal cost of production
    varphi  // Value of a filled job (match surplus) ->price of labor services in terms of the final good
    popt    // Optimal reset price (wholesale firm)
    pg      // Price of non-energy goods
    YY      // Numerator in New Keynesian Phillips curve
    ZZ      // Denominator in New Keynesian Phillips curve
    DD      // Price dispersion index

    Y       // Aggregate output

    pi      // CPI inflation
    pig     // Core (non-energy) inflation
    pie     // Energy inflation

    wstar   // Efficient wage (social planner solution)
    fstar   // Efficient job-finding rate
    nstar   // Efficient employment rate
    ustar   // Efficient unemployment rate
    fgap    // Welfare-relevant gap (f - fstar)

    pe      // Real price of energy
    e       // Energy use (Wholesale Firms, Employed and Unemployed) 


    Me_flex    
    i_flex     
    w_flex     
    delta_flex 
    cn_flex    
    cu_flex    
    cf_flex    
    f_flex     
    lambda_flex
    n_flex     
    u_flex     
    v_flex     
    mc_flex    
    varphi_flex
    Y_flex      
    pi_flex    
    pig_flex   
    pie_flex   
    pe_flex    
    pg_flex    

    YGap

//**************************************************************************
// MMB Modelbase Variables                                                //
        interest inflation inflationq outputgap output;           //
//**************************************************************************

varexo
    epspe //Energy price shock

//**************************************************************************
// MMB Modelbase Shocks                                                  //
        interest_;                                                       //
//**************************************************************************

%----------------------------------------------------------------
% 1. Parametrization 
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

zeta        // Weight on home production in utility (for unemployed)
xi          // Energy share in consumption
beta        // Discount factor
wSS         // Steady-state real wage
omega_e     // Energy share in the CPI index

b           // Lump-sum transfers to firm owners -> Firm-owner home production!!!!!!!!!!!
cfSS        // Steady-state consumption of firm owners

alpha       // Elasticity in matching function (with respect to unemployment)
kappa       // Vacancy posting cost
rho         // Probability of match survival (1 - separation rate)
tau_z       // Bargaining power of workers
S           // Sensitivity of value of match to productivity

theta       // Calvo parameter for price stickiness (irrelevant here: set to 0 in flex-price case)
varepsilon  // Price elasticity of demand (markup)
gamma_e     // Energy intensity in production

nu          // Weight on worker utility in welfare function -> relative welfare weight of firm owners !!!!!!!!
rho_e       // Persistence of energy price shock
peshock     // Standard deviation of energy price shock
chi         // Elasticity of real wage w.r.t. energy price (wage indexation)

phi_pi      // Taylor rule response to core inflation
phi_f       // Taylor rule response to job-finding gap (labor market tightness)

fSS         // Steady-state job-finding rate
lambdaSS    // Steady-state separation rate
vSS         // Steady-state vacancies
nSS         // Steady-state employment rate
peSS        // Steady-state energy price
pgSS        // Steady-state non-energy goods price
MeSS;        // Steady-state marginal utility of workers

%----------------------------------------------------------------
% 2. Calibration
%----------------------------------------------------------------
                  
load param;
set_param_value('zeta',zeta);
set_param_value('beta',beta);
set_param_value('xi',xi);
set_param_value('wSS',wSS);
set_param_value('omega_e',omega_e);
set_param_value('alpha',alpha);
set_param_value('rho', rho);
set_param_value('kappa',kappa);
set_param_value('tau_z',tau_z);
set_param_value('S',S);
set_param_value('fSS',fSS);
set_param_value('lambdaSS',lambdaSS);
set_param_value('nu',nu);
set_param_value('theta', theta);
set_param_value('varepsilon', varepsilon);
set_param_value('gamma_e', gamma_e);
set_param_value('rho_e', rho_e);
set_param_value('peshock', peshock);
set_param_value('cfSS', cfSS);
set_param_value('b', b);
set_param_value('vSS', vSS);
set_param_value('nSS', nSS);
set_param_value('peSS', peSS);
set_param_value('pgSS', pgSS);
set_param_value('MeSS', MeSS);
//set_param_value('phi_pi', phi_pi);
//set_param_value('phi_f', phi_f);
set_param_value('chi', chi);

// Strict inflation targeting is choosen as the model specified rule 
phi_pi = 30;
phi_f = 0;

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


%----------------------------------------------------------------
% 3. Model
%----------------------------------------------------------------
model;

// MMB Variable Definitions
interest = (ln(1+i)-ln(1/MeSS))*4;
inflation = pig+pig(-1)+pig(-2)+pig(-3);
inflationq = pig*4;
output = Y-steady_state(Y);
outputgap = YGap-steady_state(YGap);

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

// Core Equations

//WORKERS                                                        
Me(+1)*(1+i)/(1+pi(+1)) = 1;                    						//Euler condition
Me 		= beta*((1-lambda)/cn + lambda/cu)*cn(-1);					//MRIS of employed workers
cn 		= w - xi*pe;										//Consumption of employed workers 
cu 		= delta - xi*pe;										//Consumption of unemployed workers
pg  	= (1-omega_e)*(omega_e/pe)^(omega_e/(1-omega_e));					//Real price of non-energy good
pi 		= (pg(-1)/pg)*(1+pig) - 1;				      			//CPI inflation
pie 	= (pe/pe(-1))*(1+pi) - 1; 						        		//Energy inflation
w		= wSS - chi*wSS*(pe-peSS)/peSS;			          			//Real wage rate
delta	= (1-zeta)*w;								                  //Home production of the unemployed

//FIRM OWNERS
cf 		= n*(pg/((1-gamma_e)*DD) - (gamma_e/(1-gamma_e))*pe - w) - kappa*v + b;	//Consumption of firm owners

//LABOR MARKET FLOWS
f^(alpha/(1-alpha))	= (1-tau_z)*(varphi-w+S)/kappa        
						+ beta*(1-rho)*f(+1)^(alpha/(1-alpha));		//Job-finding rate
lambda 	= rho*(1-f);                                                         	//Transition rate to unemployment
n 		= (1-lambda)*n(-1)+(1-n(-1))*f;                                         //Employment rate
u 		= 1 - n;                                                              	//Unemployment rate
v 		= ((n-(1-rho)*n(-1))/((1-(1-rho)*n(-1))^alpha))^(1/(1-alpha));         	//Vacancies

//WHOLESALE FIRMS
popt	= YY/ZZ;                                							//Optimal reset price
YY     	= mc*Y + theta*beta*((1+pig(+1))^varepsilon)*YY(+1);        		
ZZ     	= pg*Y + theta*beta*((1+pig(+1))^(varepsilon-1))*ZZ(+1);                   
mc		= (1-gamma_e)*varphi + gamma_e*pe;							//Real marginal cost of production
1     	= (1-theta)*(popt)^(1-varepsilon) + theta*(1+pig)^(-(1-varepsilon));	//Core inflation dynamics
DD 		= (1-theta)*(popt)^(-varepsilon) + theta*DD(-1)*(1+pig)^varepsilon;	//Price dispersion dynamics

//MARKET CLEARING
DD*Y*(1-gamma_e) = n;                                                      

//CONSTRAINED-EFFICIENT ALLOCATION
wstar	= (1/nu) + xi*pe;
fstar^(alpha/(1-alpha)) = ((1-alpha)/kappa)*(((pg - gamma_e*pe)/(1-gamma_e)) - wstar + (1/nu)*log((wstar-xi*pe)/(delta-xi*pe)))
							+ beta*(1-rho)*(1-alpha*fstar(+1))*fstar(+1)^(alpha/(1-alpha));
nstar 	= (1-rho)*nstar(-1) + fstar*(1-(1-rho)*nstar(-1));
ustar 	= 1-nstar;
fgap 	= f - fstar;

//POLICY
//ln(1+i) = ln(1/MeSS) + phi_pi*pig + phi_f*(f-fSS);
                                                             
//SHOCK
pe	= (1-rho_e)*peSS + rho_e*pe(-1) + peshock*epspe;

//
e = DD*Y*gamma_e + n*(omega_e/pe*cn+xi) + u*(omega_e/pe*cu+xi);




// Flex Price Economy
//WORKERS                                                        
Me_flex(+1)*(1+i_flex)/(1+pi_flex(+1)) = 1;                    						//Euler condition
Me_flex 		= beta*((1-lambda_flex)/cn_flex + lambda_flex/cu_flex)*cn_flex(-1);					//MRIS of employed workers
cn_flex 		= w_flex - xi*pe_flex;										//Consumption of employed workers 
cu_flex 		= delta_flex - xi*pe_flex;										//Consumption of unemployed workers
pg_flex  	= (1-omega_e)*(omega_e/pe_flex)^(omega_e/(1-omega_e));					//Real price of non-energy good
pi_flex 		= (pg_flex(-1)/pg_flex)*(1+pig_flex) - 1;				      			//CPI inflation
pie_flex 	= (pe_flex/pe_flex(-1))*(1+pi_flex) - 1; 						        		//Energy inflation
w_flex		= wSS - chi*wSS*(pe_flex-peSS)/peSS;			          			//Real wage rate
delta_flex	= (1-zeta)*w_flex;								                  //Home production of the unemployed

//FIRM OWNERS
cf_flex 		= n_flex*(pg_flex/((1-gamma_e)) - (gamma_e/(1-gamma_e))*pe_flex - w_flex) - kappa*v_flex + b;	//Consumption of firm owners

//LABOR MARKET FLOWS
f_flex^(alpha/(1-alpha))	= (1-tau_z)*(varphi_flex-w_flex+S)/kappa        
						+ beta*(1-rho)*f_flex(+1)^(alpha/(1-alpha));		//Job-finding rate
lambda_flex 	= rho*(1-f_flex);                                                         	//Transition rate to unemployment
n_flex 		= (1-lambda_flex)*n_flex(-1)+(1-n_flex(-1))*f_flex;                                         //Employment rate
u_flex 		= 1 - n_flex;                                                              	//Unemployment rate
v_flex 		= ((n_flex-(1-rho)*n_flex(-1))/((1-(1-rho)*n_flex(-1))^alpha))^(1/(1-alpha));         	//Vacancies

//WHOLESALE FIRMS
1=mc_flex/pg_flex;
mc_flex		= (1-gamma_e)*varphi_flex + gamma_e*pe_flex;

//MARKET CLEARING
Y_flex*(1-gamma_e) = n_flex;                                                      
                                                           
//SHOCK
pe_flex	= (1-rho_e)*peSS + rho_e*pe_flex(-1) + peshock*epspe;

pi_flex=steady_state(pi_flex);

YGap=Y-Y_flex;

end;

%----------------------------------------------------------------
% 4. Steady State
%----------------------------------------------------------------

% initval;
steady_state_model;
pi  	= 0;
pig 	= 0;
pie 	= 0;          
pe  	= peSS;
pg		= pgSS;
wstar 	= wSS;
fstar 	= fSS;
nstar 	= nSS;
ustar 	= 1 - nSS;
Me  	= MeSS;
i   	= 1/MeSS - 1;    
w		= wSS;
delta 	= (1-zeta)*w;  
cn 		= w - xi*pe;
cu 		= delta - xi*pe;           
cf  	= cfSS;
f   	= fSS;
lambda	= lambdaSS;
n   	= nSS;
u   	= 1 - nSS;
v   	= vSS;
mc 		= pgSS;
varphi	= pgSS/(1-gamma_e) - gamma_e*peSS/(1-gamma_e);
popt	= 1;
Y   	= nSS/(1-gamma_e);
YY   	= pgSS*Y/(1-theta*beta);
ZZ   	= pgSS*Y/(1-theta*beta);
DD		= 1;
fgap 	= 0;
e       = DD*Y*gamma_e + n*(omega_e/pe*cn+xi) + u*(omega_e/pe*cu+xi);

Me_flex    = Me;
i_flex     = i;
w_flex     = w;
delta_flex = delta;
cn_flex    = cn;
cu_flex    = cu;
cf_flex    = cf;
f_flex     = f;
lambda_flex= lambda;
n_flex     = n;
u_flex     = u;
v_flex     = v;
mc_flex    = mc;
varphi_flex= varphi;
Y_flex     = Y;
pi_flex    = pi;
pig_flex   = pig;
pie_flex   = pie;
pe_flex    = pe;
pg_flex    = pg;

interest = 0; inflation = 0; inflationq = 0; output = 0; outputgap = 0;

end;

resid;
steady;
% resid;
check;

shocks;
  var epspe; stderr 1; //Energy price shock
  var interest_; stderr 1; //Modelbase monetary policy shock
end;


//%SIMULATION
//stoch_simul(order=1, irf = 30); //pe pi pig f u fgap fstar interest inflation output outputgap;
