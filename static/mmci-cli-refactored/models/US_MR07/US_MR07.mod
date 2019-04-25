// Mankiw and Reis, Sticky Information in General Equilibrium 
// Journal of the European Economic Association (2007)


// Written by Christian Rühl (common variables adjusted by Maik Wolters, 08/09/2010)

// Allows only for 10 lagged information sets to restrict computational time

var x yn pi i y l p w R g a e v gam 
    p1 w1 l1 R1 y1  
    p2 w2 l2 R2 y2  
    p3 w3 l3 R3 y3  
    p4 w4 l4 R4 y4  
    p5 w5 l5 R5 y5  
    p6 w6 l6 R6 y6  
    p7 w7 l7 R7 y7  
    p8 w8 l8 R8 y8  
    p9 w9 l9 R9 y9  
    p10 w10 l10 R10 y10  
    y100 da

//**************************************************************************
// Modelbase Variables                                                   //*
    interest inflation inflationq outputgap output;                      //*
//**************************************************************************  
    
varexo g_e a_e e_e v_e gam_e 

//**************************************************************************
// Modelbase Shocks                                                      //*       
       interest_;                                                        //*
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
delta lambda omega beta phi_p phi_y mu theta psi gamma rho_g rho_a rho_e rho_v rho_gam;


// Values based on Maximum likelihood estimates of Mankiw and Reis (2007)

delta  = 0.184; //0.176
lambda = 0.702; //0.657
omega  = 0.195; //0.210
beta   = 2/3;
phi_p  = 1.24;
phi_y  = 0.33;
mu     = 34.068; //20.547
theta  = 1;
psi    = 4; 
gamma  = 4.196; //6.884
rho_g  = 0.938;
rho_a  = 0.35;
rho_e  = 0.918;
rho_v  = 0.630; //0.676
rho_gam = 0.667; //0.638

//delta  = 0.176;
//lambda = 0.657;
//omega  = 0.210;
//beta   = 2/3;
//phi_p  = 1.24;
//phi_y  = 0.33;
//mu     = 20.547;
//theta  = 1;
//psi    = 4; 
//gamma  = 6.884;
//rho_g  = 0.938;
//rho_a  = 0.35;
//rho_e  = 0.918;
//rho_v  = 0.676;
//rho_gam = 0.638;

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
                                                          
// Definition of Discretionary Fiscal Policy Parameter                   //*
coffispol = 0;                                                           //*
//**************************************************************************  


model(linear);
//**************************************************************************
// Definition of Modelbase Variables in Terms of Original Model Variables //*

interest   = 4*i;                                                        //*
inflation  = pi+pi(-1)+pi(-2)+pi(-3);                                    //*
inflationq = 4*pi;                                                       //*
outputgap  = x;                                                          //*
output     = y;                                                          //*
//**************************************************************************

//**************************************************************************                                                                    
// Policy Rule                                                           //*

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
//**************************************************************************


// Definitions for modelling sticky information
y100 = y(+150);
p1 = p(+1); w1 = w(+1); l1 = l(+1); R1 = R(+1); y1 = y(+1); 
p2 = p(+2); w2 = w(+2); l2 = l(+2); R2 = R(+2); y2 = y(+2); 
p3 = p(+3); w3 = w(+3); l3 = l(+3); R3 = R(+3); y3 = y(+3); 
p4 = p(+4); w4 = w(+4); l4 = l(+4); R4 = R(+4); y4 = y(+4); 
p5 = p(+5); w5 = w(+5); l5 = l(+5); R5 = R(+5); y5 = y(+5); 
p6 = p(+6); w6 = w(+6); l6 = l(+6); R6 = R(+6); y6 = y(+6); 
p7 = p(+7); w7 = w(+7); l7 = l(+7); R7 = R(+7); y7 = y(+7); 
p8 = p(+8); w8 = w(+8); l8 = l(+8); R8 = R(+8); y8 = y(+8); 
p9 = p(+9); w9 = w(+9); l9 = l(+9); R9 = R(+9); y9 = y(+9); 
p10  = p(+10); w10  = w(+10); l10  = l(+10); R10  = R(+10); y10  = y(+10);
da = a - a(-1);

// Shock Processes
g = rho_g*g(-1) + g_e; 
a = (1 + rho_a)*a(-1) - rho_a* a(-2) + a_e; 
e = rho_e*e(-1) + e_e;
v = rho_v*v(-1) + v_e;
gam = rho_gam*gam(-1) + gam_e;

//Natural Output Level (No sticky information)
yn = ((1+1/psi)/(1 + 1/psi + beta/theta - beta))*a + ((beta/theta)/(1 + 1/psi + beta/theta - beta))*g + (beta/(gamma -1))/((1 + 1/psi + beta/theta - beta))*gam + (beta/(mu -1))/((1 + 1/psi + beta/theta - beta))*v;

//Production Function
y = a + beta*l;

//Wage Setting 
w =   omega*(p + gamma*(w-p)/(gamma + psi) + l/(gamma + psi) + psi*(y100 - theta*R)/(theta*(gamma + psi)) - psi*gam/((gamma + psi)*(gamma - 1))) 
    + omega*(1-omega)^(1)*(p1(-1) + gamma*(w1(-1)-p1(-1))/(gamma + psi) + l1(-1)/(gamma + psi) + psi*(y100(-1) - theta*R1(-1))/(theta*(gamma + psi)) - psi*rho_gam^(1)*gam(-1)/((gamma + psi)*(gamma - 1)))  
    + omega*(1-omega)^(2)*(p2(-2) + gamma*(w2(-2)-p2(-2))/(gamma + psi) + l2(-2)/(gamma + psi) + psi*(y100(-2) - theta*R2(-2))/(theta*(gamma + psi)) - psi*rho_gam^(2)*gam(-2)/((gamma + psi)*(gamma - 1))) 
    + omega*(1-omega)^(3)*(p3(-3) + gamma*(w3(-3)-p3(-3))/(gamma + psi) + l3(-3)/(gamma + psi) + psi*(y100(-3) - theta*R3(-3))/(theta*(gamma + psi)) - psi*rho_gam^(3)*gam(-3)/((gamma + psi)*(gamma - 1)))
    + omega*(1-omega)^(4)*(p4(-4) + gamma*(w4(-4)-p4(-4))/(gamma + psi) + l4(-4)/(gamma + psi) + psi*(y100(-4) - theta*R4(-4))/(theta*(gamma + psi)) - psi*rho_gam^(4)*gam(-4)/((gamma + psi)*(gamma - 1))) 
    + omega*(1-omega)^(5)*(p5(-5) + gamma*(w5(-5)-p5(-5))/(gamma + psi) + l5(-5)/(gamma + psi) + psi*(y100(-5) - theta*R5(-5))/(theta*(gamma + psi)) - psi*rho_gam^(5)*gam(-5)/((gamma + psi)*(gamma - 1)))
    + omega*(1-omega)^(6)*(p6(-6) + gamma*(w6(-6)-p6(-6))/(gamma + psi) + l6(-6)/(gamma + psi) + psi*(y100(-6) - theta*R6(-6))/(theta*(gamma + psi)) - psi*rho_gam^(6)*gam(-6)/((gamma + psi)*(gamma - 1))) 
    + omega*(1-omega)^(7)*(p7(-7) + gamma*(w7(-7)-p7(-7))/(gamma + psi) + l7(-7)/(gamma + psi) + psi*(y100(-7) - theta*R7(-7))/(theta*(gamma + psi)) - psi*rho_gam^(7)*gam(-7)/((gamma + psi)*(gamma - 1)))   
    + omega*(1-omega)^(8)*(p8(-8) + gamma*(w8(-8)-p8(-8))/(gamma + psi) + l8(-8)/(gamma + psi) + psi*(y100(-8) - theta*R8(-8))/(theta*(gamma + psi)) - psi*rho_gam^(8)*gam(-8)/((gamma + psi)*(gamma - 1)))
    + omega*(1-omega)^(9)*(p9(-9) + gamma*(w9(-8)-p9(-9))/(gamma + psi) + l9(-9)/(gamma + psi) + psi*(y100(-9) - theta*R9(-9))/(theta*(gamma + psi)) - psi*rho_gam^(9)*gam(-9)/((gamma + psi)*(gamma - 1)))
    + omega*(1-omega)^(10)*(p10(-10) + gamma*(w10(-10)-p10(-10))/(gamma + psi) + l10(-10)/(gamma + psi) + psi*(y100(-10) - theta*R10(-10))/(theta*(gamma + psi)) - psi*rho_gam^(10)*gam(-10)/((gamma + psi)*(gamma - 1)));

//Aggregate Demand
y =  delta*(y100 - theta*R) 
   + delta*(1-delta)^(1)*(y100(-1) - theta*R1(-1))
   + delta*(1-delta)^(2)*(y100(-2) - theta*R2(-2)) 
   + delta*(1-delta)^(3)*(y100(-3) - theta*R3(-3)) 
   + delta*(1-delta)^(4)*(y100(-4) - theta*R4(-4)) 
   + delta*(1-delta)^(5)*(y100(-5) - theta*R5(-5)) 
   + delta*(1-delta)^(6)*(y100(-6) - theta*R6(-6))  
   + delta*(1-delta)^(7)*(y100(-7) - theta*R7(-7)) 
   + delta*(1-delta)^(8)*(y100(-8) - theta*R8(-8)) 
   + delta*(1-delta)^(9)*(y100(-9) - theta*R9(-9)) 
   + delta*(1-delta)^(10)*(y100(-10) - theta*R10(-10)) 
   +g;   


//Price Setting
p =   lambda*(p + (beta*(w-p) + (1-beta)*y - a)/(beta + mu*(1-beta)) - beta*v/((mu -1)*(beta + mu*(1-beta)))) 
    + lambda*(1-lambda)^(1)*(p1(-1) + (beta*(w1(-1)-p1(-1)) + (1-beta)*y1(-1) - rho_a*da(-1))/(beta + mu*(1-beta)) - beta*rho_v*v(-1)/((mu -1)*(beta + mu*(1-beta)))) 
    + lambda*(1-lambda)^(2)*(p2(-2) + (beta*(w2(-2)-p2(-2)) + (1-beta)*y2(-2) - rho_a^(2)*da(-2))/(beta + mu*(1-beta)) - beta*rho_v^(2)*v(-2)/((mu -1)*(beta + mu*(1-beta)))) 
    + lambda*(1-lambda)^(3)*(p3(-3) + (beta*(w3(-3)-p3(-3)) + (1-beta)*y3(-3) - rho_a^(3)*da(-3))/(beta + mu*(1-beta)) - beta*rho_v^(3)*v(-3)/((mu -1)*(beta + mu*(1-beta)))) 
    + lambda*(1-lambda)^(4)*(p4(-4) + (beta*(w4(-4)-p4(-4)) + (1-beta)*y4(-4) - rho_a^(4)*da(-4))/(beta + mu*(1-beta)) - beta*rho_v^(4)*v(-4)/((mu -1)*(beta + mu*(1-beta)))) 
    + lambda*(1-lambda)^(5)*(p5(-5) + (beta*(w5(-5)-p5(-5)) + (1-beta)*y5(-5) - rho_a^(5)*da(-5))/(beta + mu*(1-beta)) - beta*rho_v^(5)*v(-5)/((mu -1)*(beta + mu*(1-beta))))
    + lambda*(1-lambda)^(6)*(p6(-6) + (beta*(w6(-6)-p6(-6)) + (1-beta)*y6(-6) - rho_a^(6)*da(-6))/(beta + mu*(1-beta)) - beta*rho_v^(6)*v(-6)/((mu -1)*(beta + mu*(1-beta))))  
    + lambda*(1-lambda)^(7)*(p7(-7) + (beta*(w7(-7)-p7(-7)) + (1-beta)*y7(-7) - rho_a^(7)*da(-7))/(beta + mu*(1-beta)) - beta*rho_v^(7)*v(-7)/((mu -1)*(beta + mu*(1-beta)))) 
    + lambda*(1-lambda)^(8)*(p8(-8) + (beta*(w8(-8)-p8(-8)) + (1-beta)*y8(-8) - rho_a^(8)*da(-8))/(beta + mu*(1-beta)) - beta*rho_v^(8)*v(-8)/((mu -1)*(beta + mu*(1-beta)))) 
    + lambda*(1-lambda)^(9)*(p9(-9) + (beta*(w9(-9)-p9(-9)) + (1-beta)*y9(-9) - rho_a^(9)*da(-9))/(beta + mu*(1-beta)) - beta*rho_v^(9)*v(-9)/((mu -1)*(beta + mu*(1-beta)))) 
    + lambda*(1-lambda)^(10)*(p10(-10) + (beta*(w10(-10)-p10(-10)) + (1-beta)*y10(-10) - rho_a^(10)*da(-10))/(beta + mu*(1-beta)) - beta*rho_v^(10)*v(-10)/((mu -1)*(beta + mu*(1-beta))));

//Definition of long interest rate
R = (i - p(+1) + p) + 0.99*R(+1) ;

//Definition of outputgap
x = y - yn;

//Inflation defintition
pi = p - p(-1);

end;

//check;

shocks;
var e_e = 0.012^2;
var interest_ = 0;
var g_e = 0.014^2;
var a_e = 0.010^2;
var v_e = 1.819^2; 
var gam_e = 0.187^2;
end;
options_.Schur_vec_tol = 1e-6;

//stoch_simul(periods=2100) pi x l;