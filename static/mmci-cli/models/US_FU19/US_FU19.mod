//**************************************************************************
// A New Comparative Approach to Macroeconomic Modeling and Policy Analysis
//
// Volker Wieland, Tobias Cwik, Gernot J. Mueller, Sebastian Schmidt and 
// Maik Wolters
//
// Working Paper, 2009
//**************************************************************************

% Model US_FU19

% Chiara Fratto and Harald Uhlig (2019). Accounting for Post Crisis Inflation: A Retro Analysis
% Review of Economic Dynamics 

% Last edited: 16/05/23 by F. Strobel


var mc w r_k pi c R L k u k_bar i Q y 
    w_flex r_k_flex c_flex R_flex L_flex k_flex u_flex 
    k_bar_flex i_flex y_flex Q_flex
    Z lambda_p lambda_w b2 mu g
    eg
//**************************************************************************
// Modelbase Variables                                                   //*
        interest inflation inflationq outputgap output fispol;           //*
//**************************************************************************

varexo eZ ep ew eb2 emu 
//**************************************************************************
// Modelbase Shocks                                                      //*       
       interest_ fiscal_;                                                //*
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
//**************************************************************************
    h gamma sigma_c wLc beta beta_bar inv_adj_cost r_kSS delta 
    invest_ratioSS 
    Phi alpha zeta_p iota_p lambda_pSS 
    zeta_w nu_L iota_w lambda_wSS 
    rhoR psi1 psi2 psi3 
    consumpt_ratioSS capital_ratioSS gSS capital_to_laborSS wSS
    ctrend const_pi const_R const_L constebeta
    rhoZ rhob2 rhog rhogZ rhomu rhop thetap rhow thetaw rhoms czcap
    curvp curvw invest_to_capitalbarSS;

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
                                                                         
// Definition of Discretionary Fiscal Policy Parameter                   //*
coffispol = 1;                                                           //*
//**************************************************************************

%--------------------- fixed parameters -------------------------%
delta =         .025;
lambda_wSS =    0.5;
gSS =           0.18;
curvp =         10;
curvw =         10;

%-------------- estimated parameters initialization -----------%
alpha =         .22;
gamma =         1.0039;
constebeta =    0.25;
sigma_c =       1.25;
cpie =          1.0063;
Phi =           1.47;
rhogZ =         0.49;

inv_adj_cost =  5.67;
h =             0.51;    
zeta_w =        0.81;
nu_L =          1.55;
zeta_p =        0.86;
iota_w =        0.44;
iota_p =        0.25;
czcap =         0.9;
psi1 =          1.68;
rhoR =          0.88;
psi2 =          0.11;
psi3 =          0.15;

rhoZ =          0.98;
rhob2 =         0.9;
rhog =          0.95;
rhomu =         0.75;
rhoms =         0.48;
rhop =          0.77;
rhow =          0.59;
thetap =        0.66;
thetaw  =       0.57;

const_L =           0.39;
%------------------- derived parameters -------------------------%
beta =              1/(1+constebeta/100);
beta_bar =          beta*gamma^(-sigma_c);
ctrend =            (gamma-1)*100;
lambda_pSS =        Phi-1;
cr =                cpie/(beta*gamma^(-sigma_c));
r_kSS =             (beta^(-1))*(gamma^sigma_c) - (1-delta);
wSS =               (alpha^alpha*(1-alpha)^(1-alpha)/(Phi*r_kSS^alpha))^(1/(1-alpha));
invest_to_capitalbarSS = (1-(1-delta)/gamma);
capital_to_laborSS =(alpha/(1-alpha))*(wSS/r_kSS);
capital_ratioSS =   Phi*(capital_to_laborSS)^(1 - alpha);
invest_ratioSS =    ((1-(1-delta)/gamma)*gamma)*capital_ratioSS;
consumpt_ratioSS =  1-gSS-((1-(1-delta)/gamma)*gamma)*capital_ratioSS;
wLc =               (1/(1 + lambda_wSS))*(1-alpha)/alpha*r_kSS*capital_ratioSS/consumpt_ratioSS;

const_R =           (cr-1)*100;
const_pi =          (cpie-1)*100;


model(linear);

//**************************************************************************
// Definition of Modelbase Variables in Terms of Original Model Variables //*

interest   = R*4;                                                        //*
inflation  = 1/4*(inflationq+inflationq(-1)+inflationq(-2)+inflationq(-3));                                                 	 //*
inflationq = 4*pi;                                                 	 //*
outputgap  = y - y_flex;                                                       //*
output     = y;                                                          //*
fispol     = eg;                                                         //*
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
fispol = coffispol*fiscal_;                                              //*
//**************************************************************************                                                                    

c =         (h/gamma)/(1+h/gamma)*c(-1) + (1/(1+h/gamma))*c(+1) +((sigma_c-1)*wLc/(sigma_c*(1+h/gamma)))*(L-L(+1)) - (1-h/gamma)/(sigma_c*(1+h/gamma))*(R-pi(+1) ) +b2 ;
i =         (1/(1+beta_bar*gamma))* (i(-1) + beta_bar*gamma*i(1)+(1/(gamma^2*inv_adj_cost))*Q ) +mu ;
Q =         1/((1 - h/gamma)/(sigma_c*(1 + h/gamma)))*b2 -( R - pi(+1))+r_kSS/(r_kSS + 1 - delta)*r_k(+1) + (1 - delta)/(r_kSS + 1 - delta)*Q(+1);
u =         (1/(czcap/(1-czcap)))* r_k ;
k =         u + k_bar(-1); 
k_bar=      (1 - invest_to_capitalbarSS)*k_bar(-1) + 
            invest_to_capitalbarSS*(gamma^2*inv_adj_cost*mu + i); 
y =         Phi*Z+ alpha*Phi*k + (1 - alpha)*Phi*L;
k =         w - r_k + L;
mc =        alpha*r_k + (1 - alpha)*w - Z;
pi =        (1 - zeta_p*beta_bar*gamma)*(1 - zeta_p)/(1 + beta_bar*gamma*iota_p)/zeta_p/(lambda_pSS*curvp+1)*(mc )+ lambda_p + 
            iota_p/(1 + beta_bar*gamma*iota_p)*pi(-1) + beta_bar*gamma/(1 + beta_bar*gamma*iota_p)*pi(+1);
w =         (1/(1 + beta_bar*gamma))*(w(-1) + beta_bar*gamma*w(+1) + 
            (1 - zeta_w*beta_bar*gamma)*(1-zeta_w)/zeta_w/(lambda_wSS*curvw+1)*(1/(1 - h/gamma)*c - h/gamma/(1 - h/gamma)*c(-1)+ nu_L*L - w) - 
            (1 + beta_bar*gamma*iota_w)*pi + iota_w*pi(-1)+beta_bar*gamma*pi(+1)) + lambda_w;
%R =         rhoR*R(-1) + (1-rhoR)*(psi1*pi + psi2*(y - y_flex)) + psi3*(y - y(-1) - (y_flex -y_flex(-1)))+ms;
y =         consumpt_ratioSS*c + invest_ratioSS*i + g + r_kSS*capital_ratioSS*u ;


%-------------------------- flex economy ------------------------%
c_flex =    (h/gamma)/(1+h/gamma)*c_flex(-1) + (1/(1+h/gamma))*c_flex(+1) +((sigma_c-1)*wLc/(sigma_c*(1+h/gamma)))*(L_flex-L_flex(+1)) - (1-h/gamma)/(sigma_c*(1+h/gamma))*(R_flex ) +b2 ;
i_flex =    1/(1 + beta_bar*gamma)*(i_flex(-1) + beta_bar*gamma*i_flex(+1)+1/(gamma^2*inv_adj_cost)*(Q_flex ))+ mu;
Q_flex =    1/((1 - h/gamma)/(sigma_c*(1 + h/gamma)))*b2 -( R_flex )+r_kSS/(r_kSS + 1 - delta)*r_k_flex(+1) + (1 - delta)/(r_kSS + 1 - delta)*Q_flex(+1);
u_flex =    (1/(czcap/(1-czcap)))* r_k_flex ;
k_flex =    u_flex + k_bar_flex(-1); 
k_bar_flex= (1 - invest_ratioSS*(capital_ratioSS*gamma)^(-1))*k_bar_flex(-1) + 
            invest_ratioSS*(capital_ratioSS*gamma)^(-1)*(gamma^2*inv_adj_cost*mu + i_flex); 
y_flex =    ( Phi)*Z+ alpha*( Phi)*k_flex + (1 - alpha)*(Phi)*L_flex;
k_flex =    w_flex - r_k_flex + L_flex;
0 =         alpha*r_k_flex + (1 - alpha)*w_flex - Z;
w_flex =    1/(1 - h/gamma)*c_flex - h/gamma/(1 - h/gamma)*c_flex(-1)+ nu_L*L_flex;
y_flex =    consumpt_ratioSS*c_flex + invest_ratioSS*i_flex + g + r_kSS*capital_ratioSS*u_flex ;


%------------------ exogenous processes -------------------------%
Z =         rhoZ*Z(-1) + eZ;
b2 =        rhob2*b2(-1)+eb2;
g =         rhog*g(-1) + eg + rhogZ*eZ;
mu =        rhomu*mu(-1) + emu;
lambda_p =  rhop*lambda_p(-1)+ ep - thetap*ep(-1);
lambda_w =  rhow*lambda_w(-1)+ ew - thetaw*ew(-1);
%ms =        rhoms*ms(-1) + ems;
end; 

shocks;
var eZ;
stderr 0.41;
var eb2;
stderr 0.06;
var fiscal_;
stderr 0.41;
var emu;
stderr 0.31;
var interest_;
stderr 0.1;
var ep;
stderr 0.11;
var ew;
stderr 0.44;
end;



%stoch_simul(irf=20,nomoments, nograph) inflation interest output outputgap;

