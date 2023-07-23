//**************************************************************************
// A New Comparative Approach to Macroeconomic Modeling and Policy Analysis
//
// Volker Wieland, Tobias Cwik, Gernot J. Mueller, Sebastian Schmidt and 
// Maik Wolters
//
// Working Paper, 2009
//**************************************************************************

// Model: NK_GK11

// Further references:
//Gertler, M. and Karadi, P. ``A Model of Unconvetional Monetary Policy''
//In: Journal of Monetary Economics (2011)

// Original code provided by Peter Karadi 
//Implemented in the MMB by M. Kuete. Last edited: 2016/02/24 

var Y Ym K Keff L I C G Q varrho Lambda Rk R N Ne Nn nu eta phi z x Pm w 
     VMPK U X D F Z i prem delta In Welf infl inflstar 
     Yf Ymf Kf Kefff Lf If Cf Gf Qf varrhof Lambdaf Rkf Rf Nf Nef Nnf
     nuf etaf phif zf xf wf VMPKf Uf premf deltaf In_f Welff a ksi g
     //Leverage Lending

//**************************************************************************
// Modelbase Variables                                                   //*
      e_g  interest inflation inflationq outputgap output fispol;        //*
//**************************************************************************

varexo e_a e_ksi  e_Ne //e_i       
//**************************************************************************
// Modelbase Shocks                                                      //*       
    interest_ fiscal_;                                                   //*
//**************************************************************************


parameters 
 //**************************************************************************
// Modelbase Parameters                                                  
                                                                         
        cofintintb1 cofintintb2 cofintintb3 cofintintb4                  
        cofintinf0 cofintinfb1 cofintinfb2 cofintinfb3 cofintinfb4       
        cofintinff1 cofintinff2 cofintinff3 cofintinff4                  
        cofintout cofintoutb1 cofintoutb2 cofintoutb3 cofintoutb4        
        cofintoutf1 cofintoutf2 cofintoutf3 cofintoutf4   
        cofintoutp cofintoutpb1 cofintoutpb2 cofintoutpb3 cofintoutpb4   //*
        cofintoutpf1 cofintoutpf2 cofintoutpf3 cofintoutpf4              //*              
        std_r_ std_r_quart coffispol           
//************************************************************************** 

 betta sig hh varphi zetta theta alfa G_over_Y eta_i epsilon gam gam_P kappa_pi kappa_y rho_i rho_ksi sigma_ksi rho_a
 sigma_a rho_g sigma_g sigma_Ne sigma_i rho_shock_psi sigma_psi kappa tau omega lambda chi b delta_c G_ss I_ss Pmf
 L_mom RkmR_mom phi_mom  L0 K0 chi0 lambda0 omega0 deltai Y_ss;//kappa tau

%Setting parameters
betta   =   0.99;           %Discount rate
sig     =   1;              %Intertemporal elasticity of substitution
hh      =   0.815;          %Habit formation parameters
chi0    =   3.4;            %Starting value for the labor utility weight
varphi  =   0.276;          %Inverse Frisch elasticity of labor supply       
zetta   =   7.2;            %Elasticity of marginal depreciation wrt the utilization rate

lambda0  =  0.3815;          %Starting value divertable fraction 
omega0   =  0.002;           %Starting value of proportional starting up funds
theta   =   0.97155955;     %The survival probability

alfa    =   0.33;           %Capital share
deltai   =   0.025;          %Depreciation rate
G_over_Y=   0.2;            %Government expenditures over GDP
eta_i   =   1.728;          %elasticity of investment adjusment cost

%Retail firms
epsilon =   4.167;          %Elasticity of substitution between goods %problem with 1: C-D
gam     =   0.779;          %Calvo parameter
gam_P   =   0.241;          %Price indexation parameter
Pmf=log((epsilon-1)/epsilon);
 
%Monetary Policy parameters
rho_i   =   0; %0.8            %Interest rate smoothing parameter
kappa_pi=   1.5;            %Inflation coefficient
kappa_y =   -0.5/4;          %Output gap coefficient

%Shocks
sigma_ksi   =   0.05;       %size of the capital quality shock
rho_ksi     =   0.66;       %persistence of the capital quality shock
sigma_a     =   0.01;       %size of the TFP shock
rho_a       =   0.95;       %persistence of the TFP shock
sigma_g     =   0.01;       %size of the government expenditure shock
rho_g       =   0.95;       %persistence of the government expenditure shock
sigma_Ne    =   0.01;       %wealth shock
sigma_i     =   0.01;       %monetary policy shock
rho_shock_psi=  0.66;       %persistence of the CP shock
sigma_psi   =   0.072;      %size of the CP shock

kappa=10.00000000;
tau=0.00100000; 
deltai=0.025;
 
//G_ss       =   0.16975710;
//I_ss       =   0.14153927;

%Targeted moments
L_mom    =   1/2;       %Steady state labor supply
RkmR_mom =   0.01/4;    %steady state premium
phi_mom  =   4;         %steady state leverage

%Credit policy parameters
kappa      =   10;     %Credit policy coefficient
tau        =   0.001;  %Costs of credit policy

%Starting values for some steady state values
L0      =   L_mom;
K0      =   9.5;      

omega  =  0.002227780412604;
lambda =  0.381494985929782;
chi    =  2.033128776217254;

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
//std_r_ = 100;                                                                     
cd(thispath);  
                                                          
// Definition of Discretionary Fiscal Policy Parameter                   //*
coffispol = 1/G_over_Y;//       
//**************************************************************************

model;

//**************************************************************************
// Definition of Modelbase Variables in Terms of Original Model Variables //*

interest   = 4*(i-log(1/betta));                                        //*
inflation  = (infl+infl(-1)+infl(-2)+infl(-3))*1;                       //*
inflationq = 4*infl;                                                    //*
outputgap  = (Y-Yf)*1;                                                  //*
output     = (Y-Y_ss)*1;                                                //* 
fispol     = e_g;                                                         //*  
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

// Original Model:
//Flexible price economy
//Home household

//1. Marginal utility of consumption 
exp(varrhof)  =   (exp(Cf)-hh*exp(Cf(-1)))^(-sig)-betta*hh*(exp(Cf(+1))-hh*exp(Cf))^(-sig); 

//2. Euler equation 
betta*exp(Rf)*exp(Lambdaf(+1))  =   1; 

//3. Stochastic discount rate 
exp(Lambdaf)  =   exp(varrhof)/exp(varrhof(-1)); 

//4. Labor market equilibrium 
chi*exp(Lf)^varphi    =   exp(varrhof)*exp(Pmf)*(1-alfa)*exp(Yf)/exp(Lf); 

//Financial Intermediaries 
//5. Value of banks' capital 
exp(nuf)     =   (1-theta)*betta*exp(Lambdaf(+1))*(exp(Rkf(+1))-exp(Rf))+betta*exp(Lambdaf(+1))*theta*exp(xf(+1))*exp(nuf(+1)); 

//6. Value of banks' net wealth 
exp(etaf)    =   (1-theta)+betta*exp(Lambdaf(+1))*theta*exp(zf(+1))*exp(etaf(+1)); 

//7. Optimal leverage 
exp(phif)    =   exp(etaf)/(lambda-exp(nuf)); 

//8. Growth rate of banks' capital 
exp(zf)      =   (exp(Rkf)-exp(Rf(-1)))*exp(phif(-1))+exp(Rf(-1)); 

//9. Growth rate of banks' net wealth
exp(xf)      =   (exp(phif)/exp(phif(-1)))*exp(zf); 

//Aggregate capital, net worth
//10. Aggregate capital 
exp(Qf)*exp(Kf)     =   exp(phif)*exp(Nf); 

//11. Banks' net worth 
exp(Nf)      =   exp(Nef)+exp(Nnf); 

//12. Existing banks' net worth accumulation 
exp(Nef)     =   theta*exp(zf)*exp(Nf(-1))*exp(-e_Ne); 

//13. New banks' net worth 
exp(Nnf)    =   omega*exp(Qf)*exp(ksi)*exp(Kf(-1)); 

//Final goods producer
//14. Return to capital 
exp(Rkf)     =   (exp(Pmf)*alfa*exp(Ymf)/exp(Kf(-1))+exp(ksi)*(exp(Qf)-exp(deltaf)))/exp(Qf(-1)); 

//15. Production function 
exp(Ymf)     =   exp(a)*(exp(ksi)*exp(Uf)*exp(Kf(-1)))^alfa*exp(Lf)^(1-alfa); 

//Capital Goods Producer
//16. Optimal investment decision 
exp(Qf)  =   1+eta_i/2*((In_f+I_ss)/(In_f(-1)+I_ss)-1)^2+eta_i*((In_f+I_ss)/(In_f(-1)+I_ss)-1)*(In_f+I_ss)/(In_f(-1)+I_ss)-betta*exp(Lambdaf(+1))*eta_i*((In_f(+1)+I_ss)/(In_f+I_ss)-1)*((In_f(+1)+I_ss)/(In_f+I_ss))^2;

//17. Depreciation rate 
exp(deltaf) = delta_c+b/(1+zetta)*exp(Uf)^(1+zetta); 

//18. Optimal capacity utilization rate 
exp(Pmf)*alfa*exp(Ymf)/exp(Uf) = b*exp(Uf)^zetta*exp(ksi)*exp(Kf(-1)); 

//19. Net investment 
In_f  =   exp(If)-exp(deltaf)*exp(ksi)*exp(Kf(-1)); 

//20. Capital accumulation equation 
exp(Kf)  =   exp(ksi)*exp(Kf(-1))+In_f; 

//21. Government consumption 
exp(Gf)   =   G_ss*exp(g); 

//Equilibrium
//22. Aggregate resource constraint 
exp(Yf)   =   exp(Cf)+exp(Gf)+exp(If)+eta_i/2*((In_f+I_ss)/(In_f(-1)+I_ss)-1)^2*(In_f+I_ss); 

//23. Wholesale, retail output 
exp(Ymf)    =   exp(Yf); 

//Some extra variables for convenience 
//35. Effective capital 
exp(Kefff)   =   exp(ksi)*exp(Kf(-1)); 

//36. Wages 
exp(wf)      =   exp(Pmf)*(1-alfa)*exp(Yf)/exp(Lf); 

//37. Marginal value product of capital 
exp(VMPKf)   =   exp(Pmf)*alfa*exp(Yf)/(exp(ksi)*exp(Kf(-1)));

//38. Welfare 
Welff   =   log(exp(Cf)-hh*exp(Cf(-1)))-chi*exp(Lf)^(1+varphi)/(1+varphi)+betta*Welff(+1);

//39. Premium 
exp(premf)   =   exp(Rkf(+1))/exp(Rf);

//Sticky price economy

//Home household

//1. Marginal utility of consumption
exp(varrho )  =   (exp(C )-hh*exp(C (-1)))^(-sig)-betta*hh*(exp(C (+1))-hh*exp(C ))^(-sig);  

//2. Euler equation 
betta*exp(R )*exp(Lambda (+1))  =   1;

//3. Stochastic discount rate 
exp(Lambda )  =   exp(varrho )/exp(varrho (-1));

//4. Labor market equilibrium 
chi*exp(L )^varphi    =   exp(varrho )*exp(Pm )*(1-alfa)*exp(Y )/exp(L );

//Financial Intermediaries

//5. Value of banks' capital 
exp(nu )     =   (1-theta)*betta*exp(Lambda (+1))*(exp(Rk (+1))-exp(R ))+betta*exp(Lambda (+1))*theta*exp(x (+1))*exp(nu (+1));

//6. Value of banks' net wealth 
exp(eta )    =   (1-theta)+betta*exp(Lambda (+1))*theta*exp(z (+1))*exp(eta (+1));

//7. Optimal leverage 
exp(phi )    =   exp(eta )/(lambda-exp(nu ));

//8. Growth rate of banks' capital 
exp(z )      =   (exp(Rk )-exp(R (-1)))*exp(phi (-1))+exp(R (-1));

//9. Growth rate of banks' net wealth 
exp(x )      =   (exp(phi )/exp(phi (-1)))*exp(z );

//Aggregate capital, net worth
//10. Aggregate capital
exp(Q)*exp(K)     =   exp(phi)*exp(N); 

//11. Banks' net worth 
exp(N )      =   exp(Ne )+exp(Nn );

//12. Existing banks' net worth accumulation 
exp(Ne )     =   theta*exp(z )*exp(N (-1))*exp(-e_Ne);

//13. New banks' net worth 
exp(Nn )    =   omega*exp(Q )*exp(ksi)*exp(K (-1));

//Final goods producer
//14. Return to capital 
exp(Rk )     =   (exp(Pm )*alfa*exp(Ym )/exp(K (-1))+exp(ksi)*(exp(Q )-exp(delta )))/exp(Q (-1)); 

//15. Production function
exp(Ym )     =   exp(a)*(exp(ksi)*exp(U )*exp(K (-1)))^alfa*exp(L )^(1-alfa); 
 
//Capital Goods Producer
//16. Optimal investment decision 
exp(Q )  =   1+eta_i/2*((In  +I_ss)/(In  (-1)+I_ss)-1)^2+eta_i*((In  +I_ss)/(In  (-1)+I_ss)-1)*(In  +I_ss)/(In  (-1)+I_ss)-betta*exp(Lambda (+1))*eta_i*((In  (+1)+I_ss)/(In  +I_ss)-1)*((In  (+1)+I_ss)/(In  +I_ss))^2;

//17. Depreciation rate 
exp(delta ) = delta_c+b/(1+zetta)*exp(U )^(1+zetta);

//18. Optimal capacity utilization rate 
exp(Pm )*alfa*exp(Ym )/exp(U ) = b*exp(U )^zetta*exp(ksi)*exp(K (-1));

//19. Net investment 
In    =   exp(I )-exp(delta )*exp(ksi)*exp(K (-1));


//20. Capital accumulation equation 
exp(K )  =   exp(ksi)*exp(K (-1))+In  ;

//21. Government consumption 
exp(G )   =   G_ss*exp(g);

//Equilibrium
//22. Aggregate resource constraint 
exp(Y )   =   exp(C )+exp(G )+exp(I )+eta_i/2*((In  +I_ss)/(In  (-1)+I_ss)-1)^2*(In  +I_ss);


//23. Wholesale, retail output  
exp(Ym )    =   exp(Y )*exp(D);

//24. Price dispersion
exp(D)    =   gam*exp(D(-1))*exp(infl(-1))^(-gam_P*epsilon)*exp(infl)^epsilon+(1-gam)*((1-gam*exp(infl(-1))^(gam_P*(1-gam))*exp(infl)^(gam-1))/(1-gam))^(-epsilon/(1-gam));

//25. Markup
exp(X)  =   1/exp(Pm);

//26. Optimal price choice
exp(F)       =   exp(Y)*exp(Pm)+betta*gam*exp(Lambda(+1))*exp(infl(+1))^epsilon*(exp(infl))^(-epsilon*gam_P)*exp(F(+1));

//27.
exp(Z)       =   exp(Y)+betta*gam*exp(Lambda(+1))*exp(infl(+1))^(epsilon-1)*exp(infl)^(gam_P*(1-epsilon))*exp(Z(+1));

//28. Optimal price choice
exp(inflstar)   =  epsilon/(epsilon-1)*exp(F)/exp(Z)*exp(infl);

//29. Price index
(exp(infl))^(1-epsilon)     =   gam*exp(infl(-1))^(gam_P*(1-epsilon))+(1-gam)*(exp(inflstar))^(1-epsilon);

//30. Fisher equation
exp(i)  =   exp(R)*exp(infl(+1));

//31. Interest rate rule
//exp(i)      =   exp(i(-1))^rho_i*((1/betta)*exp(infl)^kappa_pi*(exp(X)/(epsilon/(epsilon-1)))^(kappa_y))^(1-rho_i)*exp(e_i);
 


//Some extra variables for convenience

//35. Effective capital 
exp(Keff )   =   exp(ksi)*exp(K (-1));

//36. Wages 
exp(w )      =   exp(Pm )*(1-alfa)*exp(Y )/exp(L ); 

//37. Marginal value product of capital 
exp(VMPK )   =   exp(Pm )*alfa*exp(Y )/(exp(ksi)*exp(K (-1)));
 
//38. Welfare 
Welf    =   log(exp(C )-hh*exp(C (-1)))-chi*exp(L )^(1+varphi)/(1+varphi)+betta*Welf (+1); 

//39. Premium
exp(prem )   =   exp(Rk (+1))/exp(R ); 

 
//Shocks
//32. TFP shock
a  =   rho_a*a(-1)-e_a;

//33. Capital quality shock
ksi=   rho_ksi*ksi(-1)-e_ksi;

//34. Government consumption shock
//g  =   rho_g*g(-1)-e_g;
g = rho_g* g(-1) + e_g;


end;


initval;
Y =                		 0.241516;
Ym =               		 0.241516;
K   =              		 2.13917;
Keff =             		 2.13917;
L    =             		 -0.693147;
I    =             		 -1.54971;
C    =             		 -0.215382;
G    =             		 -1.36792;
Q    =             		 0;
varrho=            		 0.258493;
Lambda =           		 0;
Rk     =           		 0.0125223;
R      =           		 0.0100503;
N      =           		 0.752872;
Ne     =           		 0.743921;
Nn     =           		 -3.96758;
nu     =           		 -5.58873;
eta    =           		 0.412785;
phi    =           		 1.38629;
z      =           		 0.0199017;
x      =           		 0.0199017;
Pm     =           		 -0.274412;
w      =           		 0.259774;
VMPK   =           		 -3.28072;
U      =           		 0;
X      =           		 0.274412;
D      =           		 0;
F      =           		 1.44206;
Z      =           		 1.71647;
i      =           		 0.0100503;
prem   =           		 0.00247194;
delta  =           		 -3.68888;
In     =           		 0;
Welf   =           		 -256.074;
infl   =           		 0;
inflstar=          		 0;
Yf      =          		 0.241516;
Ymf     =          		 0.241516;
Kf      =          		 2.13917;
Kefff   =          		 2.13917;
Lf      =          		 -0.693147;
If      =          		 -1.54971;
Cf      =          		 -0.215382;
Gf      =          		 -1.36792;
Qf      =          		 0;
varrhof =          		 0.258493;
Lambdaf =          		 0;
Rkf     =          		 0.0125223;
Rf      =          		 0.0100503;
Nf      =          		 0.752872;
Nef     =          		 0.743921;
Nnf     =          		 -3.96758;
nuf     =          		 -5.58873;
etaf    =          		 0.412785;
phif    =          		 1.38629;
zf      =          		 0.0199017;
xf      =          		 0.0199017;
wf      =          		 0.259774;
VMPKf   =          		 -3.28072;
Uf      =          		 0;
premf   =          		 0.00247194;
deltaf  =          		 -3.68888;
In_f    =          		 0;
Welff   =          		 -256.074;
a       =          		 0;
ksi     =          		 0;
g       =          		 0;
e_g     =          		 0;
interest=          		 0;
inflation=         		 0;
inflationq=        		 0;
outputgap  =       		 0;
output      =      		 0;
fispol=            		 0;
end;

shocks;
var e_a=sigma_a^2;
var e_ksi=sigma_ksi^2;
//var e_g=sigma_g^2;
var e_Ne=sigma_Ne^2;
//var e_i=sigma_i^2;
var fiscal_;  stderr (sigma_g/coffispol);
end;

//check;

//steady;

//stoch_simul(order=1, irf=40);

// Saving the impulse responses
//save ../data/FA_1.mat Y_e_a Y_e_ksi Y_e_g Y_e_Ne Y_e_i Ym_e_a Ym_e_ksi Ym_e_g Ym_e_Ne Ym_e_i K_e_a K_e_ksi K_e_g K_e_Ne K_e_i Keff_e_a Keff_e_ksi Keff_e_g Keff_e_Ne Keff_e_i L_e_a L_e_ksi L_e_g L_e_Ne L_e_i I_e_a I_e_ksi I_e_g I_e_Ne I_e_i C_e_a C_e_ksi C_e_g C_e_Ne C_e_i G_e_a G_e_ksi G_e_g G_e_Ne G_e_i Q_e_a Q_e_ksi Q_e_g Q_e_Ne Q_e_i varrho_e_a varrho_e_ksi varrho_e_g varrho_e_Ne varrho_e_i Lambda_e_a Lambda_e_ksi Lambda_e_g Lambda_e_Ne Lambda_e_i Rk_e_a Rk_e_ksi Rk_e_g Rk_e_Ne Rk_e_i R_e_a R_e_ksi R_e_g R_e_Ne R_e_i N_e_a N_e_ksi N_e_g N_e_Ne N_e_i Ne_e_a Ne_e_ksi Ne_e_g Ne_e_Ne Ne_e_i Nn_e_a Nn_e_ksi Nn_e_g Nn_e_Ne Nn_e_i nu_e_a nu_e_ksi nu_e_g nu_e_Ne nu_e_i eta_e_a eta_e_ksi eta_e_g eta_e_Ne eta_e_i phi_e_a phi_e_ksi phi_e_g phi_e_Ne phi_e_i z_e_a z_e_ksi z_e_g z_e_Ne z_e_i x_e_a x_e_ksi x_e_g x_e_Ne x_e_i Pm_e_a Pm_e_ksi Pm_e_g Pm_e_Ne Pm_e_i w_e_a w_e_ksi w_e_g w_e_Ne w_e_i VMPK_e_a VMPK_e_ksi VMPK_e_g VMPK_e_Ne VMPK_e_i U_e_a U_e_ksi U_e_g U_e_Ne U_e_i X_e_a X_e_ksi X_e_g X_e_Ne X_e_i D_e_a D_e_ksi D_e_g D_e_Ne D_e_i F_e_a F_e_ksi F_e_g F_e_Ne F_e_i Z_e_a Z_e_ksi Z_e_g Z_e_Ne Z_e_i i_e_a i_e_ksi i_e_g i_e_Ne i_e_i prem_e_a prem_e_ksi prem_e_g prem_e_Ne prem_e_i delta_e_a delta_e_ksi delta_e_g delta_e_Ne delta_e_i In_e_a In_e_ksi In_e_g In_e_Ne In_e_i Welf_e_a Welf_e_ksi Welf_e_g Welf_e_Ne Welf_e_i a_e_a a_e_ksi a_e_g a_e_Ne a_e_i ksi_e_a ksi_e_ksi ksi_e_g ksi_e_Ne ksi_e_i g_e_a g_e_ksi g_e_g g_e_Ne g_e_i infl_e_a infl_e_ksi infl_e_g infl_e_Ne infl_e_i inflstar_e_a inflstar_e_ksi inflstar_e_g inflstar_e_Ne inflstar_e_i ;
