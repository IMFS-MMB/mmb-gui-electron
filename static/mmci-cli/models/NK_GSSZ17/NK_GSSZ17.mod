//**************************************************************************
// A New Comparative Approach to Macroeconomic Modeling and Policy Analysis
//
// Volker Wieland, Tobias Cwik, Gernot J. Mueller, Sebastian Schmidt and 
// Maik Wolters
//
// Working Paper, 2009
//**************************************************************************

// Model: NK_GSSZ17
// Model replication coded by: Philipp Lieberknecht, 
//                             e_mail: philipp.lieberknecht@gmail.com
// Last edited: 07/02/2019
// Further references:
// Simon Gilchrist, Raphael Schoenle, Jae Sim, and Egon Zakrajsek
// "Inflation Dynamics during the Financial Crisis"
// American Economic Review 2017, 107(3): 785–823
//**************************************************************************

// From here: Beginning of original author's code
// model file, A simple model of pricing under financial friction

parameters 

//**************************************************************************
// Modelbase Parameters                                                  
                                                                         
        cofintintb1 cofintintb2 cofintintb3 cofintintb4                  
        cofintinf0 cofintinfb1 cofintinfb2 cofintinfb3 cofintinfb4       
        cofintinff1 cofintinff2 cofintinff3 cofintinff4                  
        cofintout cofintoutb1 cofintoutb2 cofintoutb3 cofintoutb4        
        cofintoutf1 cofintoutf2 cofintoutf3 cofintoutf4   
        cofintoutp cofintoutpb1 cofintoutpb2 cofintoutpb3 cofintoutpb4   
        cofintoutpf1 cofintoutpf2 cofintoutpf3 cofintoutpf4                           
        std_r_ std_r_quart coffispol           
//************************************************************************** 

alpha beta gam_x theta rho_s gam_h eta rho_A gam_p rho_r rho_y 
           rho_pi varrhobar sig rho_F rho_D Asig Rsig Fsig Dsig zeta eta_w gam_w;

var xi s c x pt y h pii A D w pS m dt z abar mu v lambda R varrho F xi_f 
    s_f c_f x_f pt_f y_f h_f pii_f w_f pS_f m_f dt_f z_f abar_f mu_f v_f lambda_f R_f phi pii_w pii_w_f lw

//**************************************************************************
// Modelbase Variables                                                   //*
        interest inflation inflationq outputgap output; //fispol         //*
//**************************************************************************

varexo eA eF eD // eR

//**************************************************************************
// Modelbase Shocks                                                      //*       
     interest_; //fiscal_                                                //*
//**************************************************************************

alpha       = 0.85; //drs parameter
beta        = 0.985; //time discount
gam_x       = 1.001; //crra
theta       = -0.75;//relative habit -0.9
rho_s       = 0.95; //habit stock persistence 0.97
gam_h       = 1/5;   //inverse of Frisch elasticity
eta         = 2.00; //elasticity of substitution
rho_A       = 0.900; //persistence of tech shock
gam_p       = 10;   //price adj cost
rho_r       = 0.750; //monetary policy inertia
rho_y       = 0.00;// Taylor rule output coeff
rho_pi      = 2.00; //Taylor rule inflation coeff
varrhobar   = 0.5;  //equity issuance cost
sig         = 0.05; //idiosyncratic vol
rho_F       = 0.900; //persistence of fin shock
rho_D       = 0.900; //persistence of demand shock
Asig        = 0.010; //vol of agg tech shock
Rsig        = 0.006250;// vol of monetary policy shock
Fsig        = 0.250; //vol of fin shock
Dsig        = 0.010/3; // vol of demand shock
zeta        = 1.000; // utility weight on labor disutility
eta_w       = 2.000; // market power of labor
gam_w       = 30; // wage adjustment cost

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
                                                                         
// Definition of Discretionary Fiscal Policy Parameter                   //*
coffispol = 1;                                                           //*
//**************************************************************************

model;

//**************************************************************************
// Definition of Modelbase Variables in Terms of Original Model Variables//*
                                                                         //* 
interest     = 400*(log(R) - log(steady_state(R)));                      //* 
inflation    = 100*(log(pii)+log(pii(-1))+log(pii(-2))+log(pii(-3))-4*log(steady_state(pii))); //* 
inflationq   = 400*(log(pii) - log(steady_state(pii)));                  //*     
outputgap    = 100*(log(y) - log(y_f) - (log(steady_state(y)) - log(steady_state(y_f))));  
output       = 100*(log(y) - log(steady_state(y)));                      //*
//fispol       = epsG;                                                   //*
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
//fispol = coffispol*fiscal_;                                            //*
//**************************************************************************

// sticky stuffs

phi         = steady_state(phi);
xi          = 1+varrho/(1-varrho)*(1-normcdf(z));
s           = rho_s*s(-1)+(1-rho_s)*c; 
x           = c/(s(-1)^theta);
pt          = s(-1)^theta;
y           = exp(0.5*alpha*(1+alpha)*sig^2)*(A*h)^alpha-phi;
c           = y-gam_p/2*(pii-1)^2*c;
//w/pt        = zeta*h^gam_h/((x-D)^-gam_x);
0           = - eta_w*zeta*h^gam_h*h*(x-D)^gam_x*pt+(eta_w - 1)*w*h
              + gam_w*(pii_w-1)*pii_w*w*h-m(+1)*gam_w*(pii_w(+1)-1)*pii_w(+1)*w(+1)*h(+1);
pii_w       = w/w(-1)*pii;
1           = m(+1)*R/pii(+1);
pS          = m(+1)/pii(+1)*(dt(+1)+pS(+1));
m           = beta*((x-D)^-gam_x)/((x(-1)-D(-1))^-gam_x)*(pt(-1))/(pt);
dt          = (1-gam_p*(pii-1)^2 - (c+phi)^(1/alpha)*w/(c*A))*c;
z           = (log(abar)+0.5*sig^2)/sig;
abar        = A/w*c/((c+phi)^(1/alpha))*(1-gam_p/2*(pii-1)^2);
mu          = alpha*A/w*(c+phi)^((alpha-1)/alpha);
v           = xi+(1-rho_s)*lambda
            -(1+varrho/(1-varrho)*(1-normcdf(z-sig)))*1/mu;
lambda      = rho_s*m(+1)*lambda(+1)
            + theta*(1-eta)*m(+1)*v(+1)*c(+1)/s;
1           = eta*v/xi+gam_p*pii*(pii-1)
            - gam_p*xi(+1)/xi*pii(+1)*(pii(+1)-1)*c(+1)/c;
//pii=1;
%R           = R(-1)^rho_r*(1/beta*(y/steady_state(y))^rho_y*(pii/pii_f)^rho_pi)^(1-rho_r)*exp(Rsig*eR);
log(A)      = rho_A*log(A(-1))+Asig*eA;
varrho      = varrhobar*F;
log(F)      = rho_F*log(F(-1))+Fsig*eF;
D           = rho_D*D(-1)+Dsig*eD;
lw          = alpha*exp(0.5*alpha*(1+alpha)*sig^2)*(A*h)^(alpha-1)
            - zeta*h^gam_h/((x-D)^-gam_x);

// flexible stuffs

xi_f        = 1+varrho/(1-varrho)*(1-normcdf(z_f));
s_f         = rho_s*s_f(-1)+(1-rho_s)*c_f; 
x_f         = c_f/(s_f(-1)^theta);
pt_f        = s_f(-1)^theta;
y_f         = exp(0.5*alpha*(1+alpha)*sig^2)*(A*h_f)^alpha-phi;
c_f         = y_f-gam_p/2*(pii_f-1)^2*c_f;
0           = - eta_w*zeta*h_f^gam_h*h_f*(x_f-D)^gam_x*pt_f+(eta_w - 1)*w_f*h_f;
pii_w_f     = 1;
//w_f/pt_f    = zeta*h_f^gam_h/((x_f-D)^-gam_x);
1           = m_f(+1)*R_f/pii_f(+1);
pS_f        = m_f(+1)/pii_f(+1)*(dt_f(+1)+pS_f(+1));
m_f         = beta*((x_f-D)^-gam_x)/((x_f(-1)-D(-1))^-gam_x)
            *(pt_f(-1)/pt_f);
dt_f        = (1-gam_p*(pii_f-1)^2 - (c_f+phi)^(1/alpha)*w_f/(c_f*A))*c_f;
z_f         = (log(abar_f)+0.5*sig^2)/sig;
abar_f      = 1/w_f*c_f/((c_f+phi)^(1/alpha))*(1-gam_p/2*(pii_f-1)^2);
mu_f        = alpha*A/w_f*(c_f+phi)^((alpha-1)/alpha);
v_f         = xi_f+(1-rho_s)*lambda_f
            -(1+varrho/(1-varrho)*(1-normcdf(z_f-sig)))*1/mu_f;
lambda_f    = rho_s*m_f(+1)*lambda_f(+1)
            + theta*(1-eta)*m_f(+1)*v_f(+1)*c_f(+1)/s_f;
1           = eta*v_f/xi_f;
pii_f       = 1;

end;

//check;
//steady;

shocks;

var eA = 0.01;
var eF = 0.01;
var eD ; stderr 0.01;
//var eR = 1;
var interest_;  stderr 0.01;

end;

//stoch_simul(order=1,pruning,irf = 20,ar = 4,noprint,periods=50000) y pii;
