if isoctave==0

function [ys,check] = baseline_steadystate(stst,exe)

global M_
% initialize indicator
check = 0;
options = optimset('MaxIter',10^6,'MaxFunEvals', 10^6,'Algorithm','sqp','TolFun',10^-6,'TolX',10^-20,'TolCon',10^-6,'Display','off'); % use if using fmincon

% get parameter names
%NumberOfParameters = M_.param_nbr;
%for ii = 1:NumberOfParameters
%  C.paramname = deblank(M_.param_names(ii,:))
%  eval(['C.' paramname ' = M_.params(' int2str(ii) ');'])
%end
% initial conditions
x0=[ 0.1989    0.8694   -0.0316   -1.4161   -1.8511 ];
[x,~,flag_i] = fmincon(@(x) fdummy(x,M_.params),x0,[],[],[],[],[],[],@(x) ss_equations(x,M_.params),options);

if flag_i == 0
    check = 1 ;
    return ;
else 
    [~,~,ys] = ss_equations(x,M_.params) ;
end

ys = ys';

end
 %%   
function f = fdummy(x, params) 
    f = 1;
end
%%
function [cineq, ceq, stst] = ss_equations(x,params)

% Steady State file for baseline model in "Financial Intermediation, Investment Dynamics, and
% Business Cycle Fluctuations" by Andrea Ajello
% Code written by Andrea Ajello, 2015
gam_s        = get_param_by_name('gam_s');
bet_s        = get_param_by_name('bet_s');
delta        = get_param_by_name('delta');
l_ss         = get_param_by_name('l_ss');
nu           = get_param_by_name('nu');
eta          = get_param_by_name('eta');
gs_ss        = get_param_by_name('gs_ss');
pis          = get_param_by_name('pis');
lambda_w     = get_param_by_name('lambda_w');
etau_q       = get_param_by_name('etau_q_ss');
lambda_p     = get_param_by_name('lambda_p');
h            = get_param_by_name('h');
sg_ss        = get_param_by_name('sg_ss');
mu           = get_param_by_name('mu_ss');
theta        = get_param_by_name('theta');
fgs_param    = get_param_by_name('fgs_param');
Bs_ss        = get_param_by_name('Bs_ss');
coffispol    = get_param_by_name('coffispol');

for ii = 1:4 
        eval( ['cofintintb' int2str(ii) '=get_param_by_name(''cofintintb' int2str(ii) ''');'] );
        eval( ['cofintinfb' int2str(ii) '=get_param_by_name(''cofintinfb' int2str(ii) ''');'] );
        eval( ['cofintinff' int2str(ii) '=get_param_by_name(''cofintinff' int2str(ii) ''');'] );
        eval( ['cofintoutb' int2str(ii) '=get_param_by_name(''cofintoutb' int2str(ii) ''');'] );
        eval( ['cofintoutf' int2str(ii) '=get_param_by_name(''cofintoutf' int2str(ii) ''');'] );
        eval( ['cofintoutpb' int2str(ii) '=get_param_by_name(''cofintoutpb' int2str(ii) ''');'] );
        eval( ['cofintoutpf' int2str(ii) '=get_param_by_name(''cofintoutpf' int2str(ii) ''');'] );
end
cofintout    = get_param_by_name('cofintout');
cofintinf0  = get_param_by_name('cofintinf0');
cofintoutp  = get_param_by_name('cofintoutp');

pi_ss    = pis/100;
gam      = gam_s/100;
beta     = 1/(bet_s/100 + 1);
tau_q_ss = etau_q/100;

c_ss     = x(1);
chi0     = x(2);
Q_t_A    = x(3);
D_t      = x(4);
phi_ss   = x(5);

sdfr     = log(beta/(exp(gam)));
sdf      = log(beta/(exp(gam)*exp(pi_ss)));
QK       = 0;


sg    = sg_ss;
mc_ss = log(1/(1+lambda_p));

Q_t_B = log(((exp(tau_q_ss)))*exp(Q_t_A));

lambda_t = log( 1/(exp(c_ss) - h*exp(c_ss)/exp(gam)) - h*beta/(exp(c_ss)*exp(gam) - h*exp(c_ss)));

Uh        = - chi0*(1/exp(lambda_t))*((exp(l_ss)))^(nu);
what_t    = log( -Uh * exp(lambda_w) );

z_t       = gam;
phi_t     = phi_ss;

rK     = log((exp(mc_ss)*((1-eta)^(1-eta) * eta^eta)/exp(what_t)^(eta))^ (1/(1-eta)));

Kbar   =  log(( exp(gam) * exp(l_ss) )*( exp(what_t)/exp(rK) * (1-eta)/eta ));

yhat      = log(((exp(Kbar)/exp(gam))^(1-eta)*exp(l_ss)^eta));

B_t       = log(Bs_ss*exp(yhat));

N_t       = Kbar;

chi_s     = log(1 - (1/2 + 1/2*erf((log(exp(QK)/exp(Q_t_A)) - mu)/(sqrt(2)*sg))));
chi_k     = log(1/2 + 1/2*erf((log(exp(QK)/exp(Q_t_A)) - mu)/(sqrt(2)*sg)) - (1/2 + 1/2*erf((log(exp(QK)/exp(Q_t_B)) - mu)/(sqrt(2)*sg))));
chi_w     = log(1/2 + 1/2*erf((log(exp(QK)/exp(Q_t_B)) - mu)/(sqrt(2)*sg)) - 0);


invQ_til_As  = log(  ( -( exp(QK)*theta*(-1)) + exp(mu + sg^2/2)*exp(Q_t_A)*(-1))/(2*exp(QK)*exp(Q_t_A)*(-1 + theta)) -... 
                       ( -( exp(QK)*theta* erf((mu - log(exp(QK)/exp(Q_t_A)))/(sqrt(2)*sg))) + exp(mu + sg^2/2)*exp(Q_t_A)*erf((mu + sg^2 - log(exp(QK)/exp(Q_t_A)) )/ (sqrt(2)*sg)))/(2*exp(QK)*exp(Q_t_A)*(-1 + theta)) ) ;

QtilS_iota_t =  log(exp(chi_s)/(exp(QK)*(1-theta)));

Ak_over_P    = log((exp(mu + 1/2 * sg^2)*(normcdf((mu + sg^2 - log(exp(QK)/exp(Q_t_B)))/sg) - normcdf((mu + sg^2 - log(exp(QK)/exp(Q_t_A)))/sg) ))/exp(QK));
QtilK_iota_t = chi_k;

i_t          = log(1/(exp(sdf) * (exp(invQ_til_As)*exp(Q_t_B) + exp(Ak_over_P)*exp(Q_t_B) + exp(chi_w))));

r_t          = i_t - pi_ss;
                                    
T_t          = log(-(exp(B_t) - (1 - 1/exp(gs_ss))*exp(yhat) - exp(r_t)*exp(B_t)/exp(z_t)));

AIK          = log( exp(Ak_over_P)  *...
                         (exp(rK)*exp(N_t)/exp(z_t) + exp(r_t)*exp(B_t)/exp(z_t) + exp(D_t) - exp(T_t)) );   
                     
AIS          = log( ( (exp(mu + sg^2/2)*(-1))/ (2*exp(QK)*(-1 + theta)) - (exp(mu + sg^2/2)*erf((mu + sg^2 - log(exp(QK)/exp(Q_t_A)))/(sqrt(2)*sg)))/ (2*exp(QK)*(-1 + theta)) ) *...
                    (exp(rK)*exp(N_t)/exp(z_t) + exp(r_t)*exp(B_t)/exp(z_t) + exp(D_t) - exp(T_t) + exp(phi_t)*exp(Q_t_A)*(1-delta)*exp(N_t)/exp(z_t)) );

AI           = log(exp(AIS) + exp(AIK));

iota_s       = log( exp(QtilS_iota_t) *...                     
                       (exp(rK)*exp(N_t)/exp(z_t) + exp(r_t)*exp(B_t)/exp(z_t) + exp(D_t) - exp(T_t) + exp(phi_t)*exp(Q_t_A)*(1-delta)*exp(N_t)/exp(z_t)));

iota_k       = log( exp(QtilK_iota_t)/exp(QK)  *...
                         (exp(rK)*exp(N_t)/exp(z_t) + exp(r_t)*exp(B_t)/exp(z_t) + exp(D_t) - exp(T_t)) );                     

iota_t       = log(exp(iota_s) + exp(iota_k));                     
                      
Ihat         = iota_t;

Delta_N      = log( theta*exp(QK)/exp(Q_t_A)*exp(iota_s) + exp(phi_t)*(1-delta)*exp(chi_s)*exp(N_t)/exp(z_t) );

FGS          = log(  (exp(Q_t_A)*exp(Delta_N) + (exp(chi_s)+exp(chi_k))*exp(r_t)*exp(B_t)/exp(z_t))   /   (exp(Ihat)) );

LIQShare = log( (exp(Q_t_A)*((exp(phi_t))*(1-delta) * exp(N_t)/exp(z_t)) + exp(r_t)*exp(B_t)/exp(z_t)) / (exp(Q_t_A)*((1-delta) * exp(N_t)/exp(z_t)) + exp(r_t)*exp(B_t)/exp(z_t)) );

CASHShare = log(( exp(r_t)*exp(B_t)/exp(z_t)) / (exp(Q_t_A)*((1-delta) * exp(N_t)/exp(z_t)) + exp(r_t)*exp(B_t)/exp(z_t)) );

LIQS_t     = (exp(Q_t_A)*((exp(phi_t))*(1-delta) * exp(chi_s) * exp(N_t)/exp(z_t)) + (exp(chi_s)+exp(chi_k))*exp(r_t)*exp(B_t)/exp(z_t))/((exp(FGS))*exp(Ihat));
CASH_t     = ((exp(chi_s)+exp(chi_k))*exp(r_t)*exp(B_t)/exp(z_t))/((exp(FGS))*exp(Ihat));

%% Inequality Constraints

cineq = [- exp(chi_s);exp(chi_s) - 1;- exp(chi_k);exp(chi_k) - 1;- exp(chi_w);exp(chi_w) - 1];

%% Equality Constraints

ceq   = [c_ss - log(exp(yhat)  - exp(Ihat) - (1 - 1/exp(gs_ss))*exp(yhat));
    
        exp(Q_t_B) - exp(sdfr) * (exp(Q_t_B) * (exp(invQ_til_As)) *...
                                                      (exp(rK) + exp(phi_t)*exp(Q_t_A)*(1-delta)) + exp(chi_s)*(1-exp(phi_t))*exp(Q_t_B)*(1-delta) +...
                          exp(Q_t_B) * (exp(Ak_over_P)) *...
                                                      (exp(rK))                                   + exp(chi_k)*exp(Q_t_B)*(1-delta) + ...
                          exp(chi_w) * (exp(rK) + exp(Q_t_B)*(1-delta) ) );

        N_t  -  log(exp(AI)/(1 - (1-delta)/exp(z_t)));

        D_t - log(exp(yhat) - exp(rK)*exp(N_t)/exp(z_t) - exp(what_t)*exp(l_ss) + (exp(Q_t_B) - exp(Q_t_A))*exp(Delta_N) );
        
        exp(FGS) - fgs_param];
 
mchat      = mc_ss;
pi_t       = pis/100;
chat       = x(1); 
Q_t_A      = x(3); 
chi_spk    = log(exp(chi_s) + exp(chi_k));
iota_t     = Ihat;
l          = l_ss;
r          = i_t - pis/100;
g_t        = gs_ss; 
S          = 0; 
Sprime     = 0;
GDP_t      = log(exp(chat) + exp(Ihat) + (1 - 1/exp(g_t))*exp(yhat)); 
pi_ob_t    = pis; 
i_ob_t     = i_t*100;
l_ob_t     = l; 
pi_tm1     = pis/100;
pi_tm2     = pis/100;
pi_tm3     = pis/100;
eta_beta   = 0;
tau_q_t    = etau_q/100; 
lambda_p_t = lambda_p; 
lambda_w_t = lambda_w;
beta_t     = 1/(bet_s/100 + 1);
pistar     = pis/100;
AIS        = log(exp(AI) - exp(AIK));
FGS_obs    = FGS; 
FGS_num    = log( ( (exp(Q_t_A)*exp(Delta_N) + exp(chi_spk)*exp(r)*exp(B_t)/exp(z_t))  ) );
FGS        = (FGS_num - Ihat);
SMG        = 0;
SMGm1      = SMG;
SMGm2      = SMG;
SMGm3      = SMG;
SMG_bar    = SMG;
e_p        = 0;
e_w        = 0; 
d_chat     = 0;
d_Ihat     = 0;
d_GDP      = 0;
dlnwhat    = 0;
d_GDPm1    = 0;
d_GDPm2    = 0;
d_GDPm3    = 0;
Spread_t   = log(((exp(rK) + exp(Q_t_A)*(1-delta))* exp(pi_ss)/exp(Q_t_A)  )/ exp(i_t));
Spread_ob_t= 400*Spread_t;
etau_q_t   = tau_q_t;
ygap_t           = yhat - yhat;                              
ToY_t            = log(exp(T_t)/exp(yhat));
BoY_t            = log((exp(B_t)/exp(yhat))/exp(gam));
A_eff            = log(exp(AI)/exp(iota_t));
d_FGS_num        = 0;
CASH_t           = log(CASH_t);
LIQS_t           = log(LIQS_t);
ctau_q_t         = 0;
FGSgap_t         = 0;
Spreadgap_t      = 0;
eps_g = 0     ;
interest   = 0;
inflation  = 0;                                                 	
inflationq = 0 ;                                                 	
outputgap  = 0;                                                       
output     = 0;                                                       
fispol     = eps_g;
GS_t = log((1 - 1/exp(g_t)));


stst =  [AI             
AIK            
AIS            
A_eff          
Ak_over_P      
B_t            
BoY_t          
CASH_t         
D_t            
Delta_N        
FGS            
FGS_num     		
FGS_obs        
FGSgap_t       
GDP_t          
Ihat          	
Kbar           
LIQS_t         
N_t            
QK						
Q_t_A          
Q_t_B         	
QtilK_iota_t   
QtilS_iota_t   
S              
SMG     				
SMG_bar        
SMGm1          
SMGm2          
SMGm3          
Spread_ob_t    
Spread_t 				
Spreadgap_t    
Sprime         
T_t            
ToY_t          
beta_t         
chat           
chi_k          
chi_s          
chi_spk        
chi_w          
ctau_q_t       
d_FGS_num      
d_GDP          
d_GDPm1        
d_GDPm2        
d_GDPm3        
d_Ihat         
d_chat         
dlnwhat        
eta_beta       
etau_q_t   
e_p
e_w
g_t            
i_ob_t					
i_t            
invQ_til_As    
iota_k         
iota_s  				
iota_t         
l              
l_ob_t         
lambda_p_t     
lambda_t       
lambda_w_t     
mchat          
phi_t          
pi_ob_t        
pi_t           
pi_tm1         
pi_tm2         
pi_tm3         
pistar         
r              
rK             
sdf            
sdfr
sg_ss
tau_q_t        
what_t					
ygap_t         
yhat           
z_t
GS_t
eps_g
interest
inflation 
inflationq
outputgap
output
fispol]';

end
else
AI             =   		 -1.09753;
AIK            =   		 -1.46609;
AIS            =   		 -2.2743;
A_eff          =   		 0.0174212;
Ak_over_P      =   		 -0.536153;
B_t            =   		 -3.30505;
BoY_t          =   		 -3.91702;
CASH_t         =   		 -1.66037;
D_t            =   		 -1.41609;
Delta_N        =   		 -2.34393;
FGS            =   		 -1.04982;
FGS_num        =   		 -2.16477;
FGS_obs        =   		 -1.04982;
FGSgap_t       =   		 0;
GDP_t          =   		 0.60697;
Ihat           =   		 -1.11495;
Kbar           =   		 2.41361;
LIQS_t         =   		 -0.878956;
N_t            =   		 2.41361;
QK             =   		 0;
Q_t_A          =   		 -0.0316468;
Q_t_B          =   		 0.00355317;
QtilK_iota_t   =   		 -0.545015;
QtilS_iota_t   =   		 -3.0262;
S              =   		 0;
SMG            =   		 0;
SMG_bar        =   		 0;
SMGm1          =   		 0;
SMGm2          =   		 0;
SMGm3          =   		 0;
Spread_ob_t    =   		 3.59478;
Spread_t       =   		 0.00898694;
Spreadgap_t    =   		 0;
Sprime         =   		 0;
T_t            =   		 -1.249;
ToY_t          =   		 -1.85598;
beta_t         =   		 0.99372;
chat           =   		 0.198915;
chi_k          =   		 -0.545015;
chi_s          =   		 -4.1563;
chi_spk        =   		 -0.518356;
chi_w          =   		 -0.9051;
ctau_q_t       =   		 0;
d_FGS_num      =   		 0;
d_GDP          =   		 0;
d_GDPm1        =   		 0;
d_GDPm2        =   		 0;
d_GDPm3        =   		 0;
d_Ihat         =   		 0;
d_chat         =   		 0;
dlnwhat        =   		 0;
eta_beta       =   		 0;
etau_q_t       =   		 0.0352;
e_p            =   		 0;
e_w            =   		 0;
g_t            =   		 0.17;
i_ob_t         =   		 0.638304;
i_t            =   		 0.00638304;
invQ_til_As    =   		 -4.10849;
iota_k         =   		 -1.47495;
iota_s         =   		 -2.3112;
iota_t         =   		 -1.11495;
l              =   		 0;
l_ob_t         =   		 0;
lambda_p_t     =   		 0.15;
lambda_t       =   		 -0.166759;
lambda_w_t     =   		 0.15;
mchat          =   		 -0.139762;
phi_t          =   		 -1.85111;
pi_ob_t        =   		 0.312;
pi_t           =   		 0.00312;
pi_tm1         =   		 0.00312;
pi_tm2         =   		 0.00312;
pi_tm3         =   		 0.00312;
pistar         =   		 0.00312;
r              =   		 0.00326304;
rK             =   		 -3.31973;
sdf            =   		 -0.0144201;
sdfr           =   		 -0.0113001;
sg             =   		 0.0147;
tau_q_t        =   		 0.0352;
what_t         =   		 0.176856;
ygap_t         =   		 0;
yhat           =   		 0.60697;
z_t            =   		 0.005;
GS_t           =   		 -1.85575;
eps_g          =   		 0;
interest       =   		 0;
inflation      =   		 0;
inflationq     =   		 0;
outputgap      =   		 0;
output         =   		 0;
fispol         =   		 0;
end