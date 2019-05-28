//**************************************************************************
// A New Comparative Approach to Macroeconomic Modeling and Policy Analysis
//
// Volker Wieland, Tobias Cwik, Gernot J. Mueller, Sebastian Schmidt and
// Maik Wolters
//
// Working Paper, 2009
//**************************************************************************

// Model: US_MI07 - Rational Expectations version of Milani (2007)

// Further references:
// Milani, F. "Expectations, learning and macroeconomic persistence."
// Journal of Monetary Economics 54 (2007), pp. 2065-2082.

// Last edited: 11/08/01 by P. Kuang & D. Stijepic


var i pi pi_tilde x x_tilde r_n u

//**************************************************************************
// Modelbase Variables                                                   //*
   interest inflation inflationq outputgap;                          	 //*
//**************************************************************************

varexo v_r v_u

//**************************************************************************
// Modelbase Shocks                                                      //*
       interest_;                                                        //*
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
        std_r_ std_r_quart coffispol                                    //*
                                                                         //*
//**************************************************************************

beta sigma gamma xi_p omega eta phi_r phi_u;

beta = 0.9897;
sigma= 2.666; //sigma=1/(phi*(1-beta*eta)), where phi=3.813
gamma= 0.885;
xi_p=0.001;
omega=0.837;
eta=0.911;
phi_r=0.87;
phi_u=0.02;

//**************************************************************************
// Specification of Modelbase Parameters                                 //*
                                                                         //*
// Load Modelbase Monetary Policy Parameters                             //*
thispath = pwd;
cd('..');
load policy_param.mat;
for i=1:24
    deep_parameter_name = M_.param_names(i,:);
    eval(['M_.params(i)  = ' deep_parameter_name ' ;'])
end
cd(thispath);

model(linear);

//**************************************************************************
// Definition of Modelbase Variables in Terms of Original Model Variables//*
									                                     //*
interest   = i*4;
inflationq  = pi*4;                                                      //*
outputgap  = x;                                                          //*
inflation =0.25 * (inflationq + inflationq(-1) + inflationq(-2) + inflationq(-3));//*
		                                                                 //*
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
           + std_r_ *interest_;                                          //*
                                                                         //*
//**************************************************************************

// Original Model Code:
x_tilde=x_tilde(+1)-(1-beta*eta)*sigma*(i-pi(+1)-r_n);
pi_tilde=xi_p*(omega*x+((1-beta*eta)*sigma)^(-1)*x_tilde)+beta*pi_tilde(+1)+u;

pi_tilde=pi-gamma*pi(-1);
x_tilde=(x-eta*x(-1))-beta*eta*(x(+1)-eta*x);

r_n=phi_r*r_n(-1)+v_r;
u=phi_u*u(-1)+v_u;

end;


shocks;

var v_r= 1.67^2;
var v_u=1.15^2;
var interest_=1;
end;

//stoch_simul (irf = 0, ar=100, noprint);
