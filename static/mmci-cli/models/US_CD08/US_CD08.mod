// Model: US_CD08

// Created by Jens Kruk
// Last edited: 2010/09/07 by S. Schmidt

// Christensen, Ian and Ali Dib. 2008. "The financial accelerator in an estimated
// New Keynesian model," Review of Economic Dynamics 11, pp. 155-178.

var lambda c b m e r h w y k a i cost z mu pi q x f n rp
lambda_f c_f m_f r_f h_f w_f y_f k_f i_f z_f q_f f_f n_f



//**************************************
// Modelbase variables

interest inflation inflationq output outputgap;// fispol;

//*************************************

varexo  u_x u_a u_e u_b

//*******************
// Modelbase shocks
interest_;

//***********

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
gamma alpha rho_pi rho_y rho_mu delta chi beta phi psi nu
rho_a rho_e rho_x rho_b c1 m1 r1 h1 cy1 iy1 f1 z1 kn1 pi_ss r_ss xi_ss f_ss z_ss
lambda_c lambda_m k__y c__y w_h_y h_ss i__y b_ss k__n S;



gamma=0.0598;
alpha=0.3384;
rho_pi=1.4059;
rho_y=0.2947;
rho_mu=0.6532;
delta=0.025;
b_ss=0.062;
chi=0.5882;
beta=0.9928;
eta=1.315;
phi=0.7418;
psi=0.042; // 0 in the NoFa
nu=0.9728;
rho_a=0.7625;
rho_e=0.6156;
rho_x=0.6562;
rho_b=0.7206;
pi_ss=1.0079;
xi_ss=5/6;
k__n=2;

///////////////////////////

S=1.0075; // Jens Kruk replicated the standard deviations of CD more accurately when setting S=1. However, S should be 1.0075 (see p.163 in DC).

///////////////////////////

r_ss=pi_ss/beta;
f_ss=(S*r_ss)/pi_ss;
z_ss=f_ss+ delta-1;
lambda_c=(1+b_ss*(pi_ss/(pi_ss-beta))^(gamma-1))^(-1);
lambda_m=lambda_c*b_ss*(pi_ss/(pi_ss-beta))^(gamma);
k__y=alpha*(xi_ss/z_ss);
c__y=1-delta*(k__y);
w_h_y=(1-alpha)*lambda_c*xi_ss/(c__y);
h_ss=w_h_y/(eta+w_h_y);
i__y=1-c__y;

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
//std_r_=100;                                                              //*

// Definition of Discretionary Fiscal Policy Parameter                   //*
coffispol = 1;                                                  //*
//**************************************************************************


model(linear);
//**************************************************************************
// Definition of Modelbase Variables in Terms of Original Model Variables //*

interest   = r*4;                                                      //*
inflation  = (pi+pi(-1)+pi(-2)+pi(-3))*1;                              //*
inflationq = pi*4;                                                     //*
outputgap  = (y-y_f)*1;                                                //*
output     = y*1;                                                      //*
//fispol     = 0;                                                        //*
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
//fispol = coffispol*fiscal_;                                              //*
//**************************************************************************




((1-gamma)*lambda_c-1)*c=gamma*lambda+lambda_m*((r_ss-1)/r_ss)*(b+(gamma-1)*m)-gamma*e;

(gamma*r)/(r_ss-1)=b+c-m;

h_ss*h=(1-h_ss)*(w+lambda);

lambda(+1)=lambda-r+pi(+1);

y=alpha*k(-1)+(1-alpha)*h+(1-alpha)*a;

y=c__y*c+i__y*i;

w=y+cost-h;

z=y+cost-k(-1);

mu=m-m(-1)+pi;

//r=rho_pi*pi+rho_mu*mu+rho_y*y+e_r;

f=(z_ss/f_ss)*z+(1-delta)/f_ss*q-q(-1);

q=chi*(i-k(-1))-x;//q=chi*delta*(i-k(-1))-x;

pi=beta*pi(+1)+((1-beta*phi)*(1-phi)/phi)*cost;

k=delta*i+delta*x+(1-delta)*k(-1);

f(+1)=r-pi(+1)+psi*(q+k-n);

rp=psi*(q+k-n);
n/(nu*f_ss)=k__n*((z_ss/f_ss)*z+(1-delta)/f_ss*q-q(-1))-(k__n-1)*(r(-1)-pi)-psi*(k__n-1)*(k(-1)+q(-1))+(psi*(k__n-1)+1)*n(-1);

x=rho_x*x(-1)+u_x;
a=rho_a*a(-1)+u_a;
e=rho_e*e(-1)+u_e;
b=rho_b*b(-1)+u_b;


// Flexible price case (not treated in original paper)

((1-gamma)*lambda_c-1)*c_f=gamma*lambda_f+lambda_m*((r_ss-1)/r_ss)*(b+(gamma-1)*m_f)-gamma*e;

(gamma*r_f)/(r_ss-1)=b+c_f-m_f;

h_ss*h_f=(1-h_ss)*(w_f+lambda_f);

lambda_f(+1)=lambda_f-r_f;

y_f=alpha*k_f(-1)+(1-alpha)*h_f+(1-alpha)*a;

y_f=c__y*c_f+i__y*i_f;

w_f=y_f-h_f;

z_f=y_f-k_f(-1);

k_f=delta*i_f+delta*x+(1-delta)*k_f(-1);

f_f(+1)=r_f+psi*(q_f+k_f-n_f);

n_f/(nu*f_ss)=k__n*((z_ss/f_ss)*z_f+(1-delta)/f_ss*q_f-q_f(-1))-(k__n-1)*(r_f(-1))-psi*(k__n-1)*(k_f(-1)+q_f(-1))+(psi*(k__n-1)+1)*n_f(-1);

f_f=(z_ss/f_ss)*z_f+(1-delta)/f_ss*q_f-q_f(-1);

q_f=chi*(i_f-k_f(-1))-x;//q=chi*delta*(i-k(-1))-x;

end;


shocks;
//var e_r ; stderr 0.0058 ;
var u_e ; stderr 0.0073 ;
var  u_b ; stderr 0.0103 ;
var  u_a ; stderr 0.0096 ;
var  u_x ; stderr 0.0331 ;
end;


//stoch_simul(ar=100,irf=0,noprint);
