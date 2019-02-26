//**************************************************************************
// A New Comparative Approach to Macroeconomic Modeling and Policy Analysis
//
// Volker Wieland, Tobias Cwik, Gernot J. Mueller, Sebastian Schmidt and 
// Maik Wolters
//
//**************************************************************************

% L. Gambacorta and F.M. Signoretti (2014): "Should MP Lean against the Wind? An Analysis based on a DSGE Model with Banking"
% replicated by Nora Lamersdorf, last edited 11.02.2019


var 
//**************************************************************************
// Modelbase Variables                                                   //*
       interest inflation inflationq outputgap output // fispol         //*
//**************************************************************************

c_p     //  1 Patient HHs
d_p     //  2 Patient HHs
lam_p   //  3 Patient HHs
l_p     //  4 Patient HHs
c_e     //  5 Entrepreneurs
k_e     //  6 Entrepreneurs
b_ee    //  7 Entrepreneurs
lam_e   //  8 Entrepreneurs
s_e     //  9 Entrepreneurs
l_pd    // 10 Entrepreneurs
y_e     // 11 Entrepreneurs
r_k     // 12 Entrepreneurs
pie     // 13 Production, CGPs, Retailers
mc_E    // 14 Production, CGPs, Retailers
J_R     // 15 Production, CGPs, Retailers
q_k     // 16 Production, CGPs, Retailers
x       // 17 Production, CGPs, Retailers
I       // 18 Production, CGPs, Retailers
C       // 19 Aggregation & Equilibrium
Y       // 20 Aggregation & Equilibrium
w_p     // 21 Aggregation & Equilibrium
B       // 22 Aggregation & Equilibrium
D       // 23 Aggregation & Equilibrium
K       // 24 Aggregation & Equilibrium
r_ib    // 25 Monetary Policy
J_B     // 26 Banks 
r_b     // 27 Banks 
spread  // 28 Banks 
K_b     // 29 Banks 
R_b     // 30 Banks
lev     // 31 Leverage 
rr      // 32 Real Rate (on loans if possible) 
Y1      // 33 Auxiliary variable 1
mk_y    // 34 Exogenous Process
A_e     // 35 Exogenous Process

%%%flex price counterparts
c_pf d_pf lam_pf l_pf c_ef k_ef b_eef lam_ef s_ef l_pdf y_ef r_kf mc_Ef J_Rf q_kf xf If Cf Yf w_pf
Bf Df Kf r_ibf J_Bf r_bf spreadf K_bf R_bf levf rrf Y1f;
% pief;

varexo  e_A_e e_mk_y 
//**************************************************************************
// Modelbase Shocks                                                      //*       
      interest_ ;  // fiscal_;                                          //*
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
  beta_p beta_e phi m_e_ss gamma_p gamma_e// HOUSEHOLDS & ENTREPRENEURS
            theta  vi   mcspread delta_b // BANKS 
            eps_y mk_y_ss ksi kappa_p kappa_i deltak piss // PRODUCTION & RETAILERS
            r_ib_ss rho_ib phi_pie phi_y phi_AP phi_B      // MON POLICY
            rho_A_e rho_mk_y;     // SHOCKS

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
std_r_=1;
                                                                         //*
// Definition of Discretionary Fiscal Policy Parameter                   //*
coffispol = 1;                                                        //*   
//**************************************************************************
            
beta_p   = 0.996;
beta_e   = 0.975;
phi      = 1; // Robustness: High: 1.5, Low: 0.5
m_e_ss   = 0.35; // Hi-LTV case: m_e_ss = 0.70
gamma_p  = 1;
gamma_e  = 1 ;
eps_y    = 6; 
mk_y_ss  = eps_y   / (eps_y  - 1);
ksi    = 0.20;
kappa_p  =  28.65; // Robustness: High: 100, Low: 15
kappa_i  = 5; // For Tech. Shock. For cost-push shock, subst with kappa_i = 0.05
              // Robustness: Tech.Sh.: kappa_i = 0.05, 0.5, 10 
              //             C-p Sh. : kappa_i = 5, 0.5 0.005
deltak    = 0.050;
piss     = 1.00;
r_ib_ss  = (piss/beta_p - 1) ;
theta        = 11; // Robustness: High: 100, Low: 1
vi           = 0.09; // Robustness: High: 0.15, Low: 0.045
mcspread = 0.0050; // = 2% annual
delta_b      =  r_ib_ss + mcspread/vi;
rho_ib   = 0.77; // Robustness: rho_ib = 0
phi_pie  = 1.5; // MP RULE parameter, to be changed for simulations
phi_y    = 0.5; // MP RULE parameter, to be changed for simulations
phi_AP   = 0;    // MP RULE parameter, to be changed for simulations
phi_B    = 0;    // MP RULE parameter, to be changed for simulations
rho_A_e      = 0.95; // Robustness: rho_A_e  = 0, rho_A_e  = 0.50
rho_mk_y     = 0.50; // Robustness: rho_mk_y = 0, rho_mk_y = 0.75


model;
//**************************************************************************
// Definition of Modelbase Variables in Terms of Original Model Variables //*

interest   = 4*(r_ib-r_ib_ss);                                          //*
inflation  = (pie+pie(-1)+pie(-2)+pie(-3));                             //*
inflationq = 4*pie;                                                      //*
outputgap  = Y - Yf;                                         //*
output     = Y-steady_state(Y);                                                //* 
//fispol     = e_g;                                                        //*                                                       
//**************************************************************************

  % (1+r_ib) = (1+r_ib_ss)^(1-rho_ib)*(1+r_ib(-1))^rho_ib*((exp(pie)/piss)^phi_pie*(exp(Y1)/exp(steady_state(Y1)))^phi_y  
   %     *(exp(q_k)/exp(steady_state(q_k)))^phi_AP*(exp(B)/exp(steady_state(B)))^phi_B)^(1-rho_ib);

//**************************************************************************                                                                    
// Policy Rule                                                           //*
                                                                         //*
// Monetary Policy  
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
                                                                         //*
// Discretionary Government Spending                                     //*
                                                                         //*
//fispol = coffispol*fiscal_;                                              //*  
//**************************************************************************

// Original model:

//// PATIENT HHs

//1. Marginal utility of consumption
exp(c_p)^(-1) = exp(lam_p);

// 2. Euler equation
exp(lam_p) = beta_p*exp(lam_p(+1))*(1+r_ib);

// 3. Labor supply decision
exp(l_p)^phi = exp(lam_p)*exp(w_p);

// 4. Budget constraint
exp(c_p) + exp(d_p) = exp(w_p)*exp(l_p)+(1+r_ib(-1))*exp(d_p(-1))+exp(J_R)/gamma_p;


//// ENTREPRENEURS

//5. Marginal utility of consumption
exp(c_e) ^(-1) = exp(lam_e); 

// 6. Labor demand
exp(w_p) = (1-ksi)*exp(y_e)/(exp(l_pd)*exp(x)); 

// 7. Investment Euler equation
exp(s_e)*m_e_ss*exp(q_k(+1))*(1-deltak)/(1+r_b)+beta_e*exp(lam_e(+1))*(exp(q_k(+1))*(1-deltak)+exp(r_k(+1)))=exp(lam_e)*exp(q_k);  

// 8. Consumption Euler equation
exp(lam_e)-exp(s_e) = beta_e*exp(lam_e(+1))*(1+r_b);

// 9. Budget constraint
exp(c_e)+(1+r_b(-1))*exp(b_ee(-1)) + exp(w_p)*exp(l_pd) + exp(q_k) * exp(k_e) 
   = exp(y_e)/exp(x) + exp(b_ee) + exp(q_k)*(1-deltak)*exp(k_e(-1));  

// 10. Production function
exp(y_e) = exp(A_e)*(exp(k_e(-1)))^ksi*(exp(l_pd))^(1-ksi);

// 11. Borrowing constraint
(1+r_b)*exp(b_ee) = m_e_ss *exp(q_k(+1))*exp(k_e)*(1-deltak);

// 12. Return to capital
exp(r_k) = ksi*exp(A_e)*exp(k_e(-1))^(ksi-1)*(exp(l_pd))^(1-ksi)/exp(x); 


//// CAPITAL PRODUCERS

// 13. Capital accumulation
exp(K) =(1-deltak)*exp(K(-1))+(1 - kappa_i/2 *(exp(I)/exp(I(-1))- 1)^2 )*exp(I); 

// 14. FOC
1 = exp(q_k)*(1-kappa_i/2 *(exp(I)/exp(I(-1))- 1)^2 - kappa_i*(exp(I)/exp(I(-1))- 1)*exp(I)/exp(I(-1))) 
  + beta_e*exp(lam_e(+1))/exp(lam_e)*exp(q_k(+1))*kappa_i*(exp(I(+1))/exp(I) -1)*(exp(I(+1))/exp(I))^2;

    
//// RETAILERS

// 15. NK Phillips curve
1 - exp(mk_y)/(exp(mk_y)-1)+ exp(mk_y)/(exp(mk_y)-1)*exp(mc_E) - kappa_p*(exp(pie) - 1)*exp(pie) 
   + beta_p*exp(lam_p(+1))/exp(lam_p)*kappa_p*(exp(pie(+1))-1)*exp(pie(+1))*(exp(Y(+1))/exp(Y)) = 0;

// 16. with
exp(mc_E) = 1 / exp(x);

//// AGGREGATION & EQUILIBRIUM 

exp(C)              = gamma_p*exp(c_p) + gamma_e*exp(c_e); // 17.
gamma_e * exp(l_pd) = gamma_p*exp(l_p); // 18.
exp(B)              = gamma_e*exp(b_ee); // 19.
exp(D)              = gamma_p*exp(d_p) ; // 20.
exp(K)              = gamma_e*exp(k_e); //  21.
exp(B)              = exp(D) + exp(K_b);  // // 22.
exp(Y)              = gamma_e*exp(y_e); // 23.
exp(Y)              = exp(C) + exp(q_k)*(exp(K) - (1-deltak)*exp(K(-1))) + delta_b*exp(K_b(-1)); // 24.

           
//// MONETARY POLICY 
// 25. Interest rate rule
  % (1+r_ib) = (1+r_ib_ss)^(1-rho_ib)*(1+r_ib(-1))^rho_ib*((exp(pie)/piss)^phi_pie*(exp(Y1)/exp(steady_state(Y1)))^phi_y  
   %     *(exp(q_k)/exp(steady_state(q_k)))^phi_AP*(exp(B)/exp(steady_state(B)))^phi_B)^(1-rho_ib);
                 
////EXOGENOUS PROCESSES

// 26. Technology shock
exp(A_e)  = 1 - rho_A_e + rho_A_e*exp(A_e(-1)) + e_A_e;

// 27. Goods' mark-up shock
exp(mk_y) = (1-rho_mk_y)*mk_y_ss + rho_mk_y*exp(mk_y(-1)) + e_mk_y;


//// BANKS 

// 28. Aggregate bank profits
exp(J_B)  = (r_b*exp(B) - r_ib*exp(D) - theta/2*(exp(K_b)/exp(B) - vi)^2 *exp(K_b));

// 29. Retail loan rate
r_b = R_b + mcspread ;

// 30. Spread
spread = r_b - r_ib;

// 31. FOC
R_b   = - theta*(exp(K_b)/exp(B) - vi)*(exp(K_b)/exp(B))^2 + r_ib ;

//32. Aggregate bank capital
exp(K_b)  = ((1-delta_b)*exp(K_b(-1)) + exp(J_B(-1)));

// 33 Real rate
rr = r_b - exp(pie);

// 34. Auxiliary variable 1
exp(Y1)   = exp(C)+exp(I);

// 35. Leverage
exp(lev)  =  exp(B)/exp(K_b);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% FLEXPRICE ECONOMY

//// PATIENT HHs
//1. Marginal utility of consumption
exp(c_pf)^(-1) = exp(lam_pf);

// 2. Euler equation
exp(lam_pf) = beta_p*exp(lam_pf(+1))*(1+r_ibf);

// 3. Labor supply decision
exp(l_pf)^phi = exp(lam_pf)*exp(w_pf);

// 4. Budget constraint
exp(c_pf) + exp(d_pf) = exp(w_pf)*exp(l_pf)+(1+r_ibf(-1))*exp(d_pf(-1))+exp(J_Rf)/gamma_p;


//// ENTREPRENEURS
//5. Marginal utility of consumption
exp(c_ef) ^(-1) = exp(lam_ef); 

// 6. Labor demand
exp(w_pf) = (1-ksi)*exp(y_ef)/(exp(l_pdf)*exp(xf)); 

// 7. Investment Euler equation
exp(s_ef)*m_e_ss*exp(q_kf(+1))*(1-deltak)/(1+r_bf)+beta_e*exp(lam_ef(+1))*(exp(q_kf(+1))*(1-deltak)+exp(r_kf(+1)))=exp(lam_ef)*exp(q_kf);  

// 8. Consumption Euler equation
exp(lam_ef)-exp(s_ef) = beta_e*exp(lam_ef(+1))*(1+r_bf);

// 9. Budget constraint
exp(c_ef)+(1+r_bf(-1))*exp(b_eef(-1)) + exp(w_pf)*exp(l_pdf) + exp(q_kf) * exp(k_ef) 
   = exp(y_ef)/exp(xf) + exp(b_eef) + exp(q_kf)*(1-deltak)*exp(k_ef(-1));  

// 10. Production function
exp(y_ef) = exp(A_e)*(exp(k_ef(-1)))^ksi*(exp(l_pdf))^(1-ksi);

// 11. Borrowing constraint
(1+r_bf)*exp(b_eef) = m_e_ss *exp(q_kf(+1))*exp(k_ef)*(1-deltak);

// 12. Return to capital
exp(r_kf) = ksi*exp(A_e)*exp(k_ef(-1))^(ksi-1)*(exp(l_pdf))^(1-ksi)/exp(xf); 


//// CAPITAL PRODUCERS
// 13. Capital accumulation
exp(Kf) =(1-deltak)*exp(Kf(-1))+(1 - kappa_i/2 *(exp(If)/exp(If(-1))- 1)^2 )*exp(If); 

// 14. FOC
1 = exp(q_kf)*(1-kappa_i/2 *(exp(If)/exp(If(-1))- 1)^2 - kappa_i*(exp(If)/exp(If(-1))- 1)*exp(If)/exp(If(-1))) 
  + beta_e*exp(lam_ef(+1))/exp(lam_ef)*exp(q_kf(+1))*kappa_i*(exp(If(+1))/exp(If) -1)*(exp(If(+1))/exp(If))^2;

    
//// RETAILERS
// 15. FOC price-setting of retailers, case without adjustment costs
1 - exp(mk_y)/(exp(mk_y)-1)+ exp(mk_y)/(exp(mk_y)-1)*exp(mc_Ef) = 0;

// 16. with
exp(mc_Ef) = 1 / exp(xf);

//// AGGREGATION & EQUILIBRIUM 
exp(Cf)              = gamma_p*exp(c_pf) + gamma_e*exp(c_ef); // 17.
gamma_e * exp(l_pdf) = gamma_p*exp(l_pf); // 18.
exp(Bf)              = gamma_e*exp(b_eef); // 19.
exp(Df)              = gamma_p*exp(d_pf) ; // 20.
exp(Kf)              = gamma_e*exp(k_ef); //  21.
exp(Bf)              = exp(Df) + exp(K_bf);  // // 22.
exp(Yf)              = gamma_e*exp(y_ef); // 23.
exp(Yf)              = exp(Cf) + exp(q_kf)*(exp(Kf) - (1-deltak)*exp(Kf(-1))) + delta_b*exp(K_bf(-1)); // 24.
           
//// MONETARY POLICY 
// 25. Interest rate rule
%(1+r_ibf) = (1+r_ib_ss)^(1-rho_ib)*(1+r_ibf(-1))^rho_ib*((exp(pief)/piss)^phi_pie*(exp(Y1f)/exp(steady_state(Y1)))^phi_y  
   %        *(exp(q_kf)/exp(steady_state(q_kf)))^phi_AP*(exp(Bf)/exp(steady_state(Bf)))^phi_B)^(1-rho_ib);
                 
////EXOGENOUS PROCESSES
// 26. Technology shock
%exp(A_e)  = 1 - rho_A_e + rho_A_e*exp(A_e(-1)) + e_A_e;

// 27. Goods' mark-up shock
%exp(mk_y) = (1-rho_mk_y)*mk_y_ss + rho_mk_y*exp(mk_y(-1)) + e_mk_y;

//// BANKS 
// 28. Aggregate bank profits
exp(J_Bf)  = (r_b*exp(Bf) - r_ibf*exp(Df) - theta/2*(exp(K_bf)/exp(Bf) - vi)^2 *exp(K_bf));

// 29. Retail loan rate
r_bf = R_bf + mcspread ;

// 30. Spread
spreadf = r_bf - r_ibf;

// 31. FOC
R_bf   = - theta*(exp(K_bf)/exp(Bf) - vi)*(exp(K_bf)/exp(Bf))^2 + r_ibf ;

//32. Aggregate bank capital
exp(K_bf)  = ((1-delta_b)*exp(K_bf(-1)) + exp(J_Bf(-1)));

// 33 Real rate
rrf = r_bf-1;

// 34. Auxiliary variable 1
exp(Y1f)   = exp(Cf)+exp(If);

// 35. Leverage
exp(levf)  =  exp(Bf)/exp(K_bf);

end;


initval;
c_p   	=	-0.137462976;
d_p   	=	-0.559765003;
lam_p 	=	0.137462976	;
l_p   	=	-0.114893574;
c_e   	=	-2.690622647;
k_e   	=	0.65064922;
b_ee  	=	-0.465454324;
lam_e 	=	2.690622647;
s_e   	=	-0.643270157;
l_pd  	=	-0.114893574;
y_e   	=	0.038214985;
r_k   	=	-2.404193704;
pie   	=	0;
mc_E  	=	-0.182321557;
J_R   	=	-1.753544484;
q_k   	=	0;
x     	=	0.182321557;
I     	=	-2.345083053;
C     	=	-0.062508258;
Y     	=	0.038214985;
w_p   	=	-0.252356549;
B     	=	-0.465454324;
D     	=	-0.559765003;
K     	=	0.65064922;
r_ib  	=	0.01010101;
J_B   	=	-5.596717606;
r_b   	=	0.01510101;
spread	=	0.005;
K_b   	=	-2.873399932;
R_b   	=	0.01510101;
lev   	=	2.407945609;
rr    	=	-0.98489899;
Y1    	=	0.034637676;
mk_y  	=	0.182321557;
A_e   	=	-3E-15;

c_pf  	=	-0.137462976;
d_pf   	=	-0.559765003;
lam_pf 	=	0.137462976	;
l_pf   	=	-0.114893574;
c_ef   	=	-2.690622647;
k_ef   	=	0.65064922;
b_eef  	=	-0.465454324;
lam_ef 	=	2.690622647;
s_ef   	=	-0.643270157;
l_pdf  	=	-0.114893574;
y_ef   	=	0.038214985;
r_kf   	=	-2.404193704;
%pief   	=	0;
mc_Ef  	=	-0.182321557;
J_Rf   	=	-1.753544484;
q_kf   	=	0;
xf     	=	0.182321557;
If     	=	-2.345083053;
Cf     	=	-0.062508258;
Yf     	=	0.038214985;
w_pf   	=	-0.252356549;
Bf     	=	-0.465454324;
Df     	=	-0.559765003;
Kf     	=	0.65064922;
r_ibf  	=	0.01010101;
J_Bf   	=	-5.596717606;
r_bf   	=	0.01510101;
spreadf	=	0.005;
K_bf   	=	-2.873399932;
R_bf   	=	0.01510101;
levf   	=	2.407945609;
rrf    	=	-0.98489899;
Y1f    	=	0.034637676;
interest=   0;
outputgap=  0;

end;

steady(solve_algo=0);

shocks;
var e_A_e            =  1;
var e_mk_y           =  1; 
var interest_        =  1;        
end;

// Stochastic simulations 
%stoch_simul(order=1,irf=20, periods=10000);

