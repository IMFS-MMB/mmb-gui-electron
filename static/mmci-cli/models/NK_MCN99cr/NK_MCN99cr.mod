//**************************************************************************
// A New Comparative Approach to Macroeconomic Modeling and Policy Analysis
//
// Volker Wieland, Tobias Cwik, Gernot J. Mueller, Sebastian Schmidt and
// Maik Wolters
//
// Working Paper, 2009
//**************************************************************************

// Model: NK_MCN99cr

// Further references:
// McCallum, B., and E. Nelson. 1999. "Performance of Operational Policy Rules in an Estimated Semiclassical Structural Model."
// in: John B. Taylor (ed.), Monetary Policy Rules. Chicago: University of Chicago Press for NBER, pp. 15-45.

// Last edited: 10/09/07


var pi p y R v m i eta ytilde ybar

//**************************************************************************
// Modelbase Variables                                                   //*
   interest inflation inflationq outputgap;                              //*
//**************************************************************************

varexo u_ e_ ey_ ev_

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
        cofintoutp cofintoutpb1 cofintoutpb2 cofintoutpb3 cofintoutpb4   //*
        cofintoutpf1 cofintoutpf2 cofintoutpf3 cofintoutpf4              //*
        std_r_ std_r_quart coffispol                                     //*
//**************************************************************************
sigm CssYss YssCss gam IssYss Rss rhov rhoeta gk stigma rhoybar bet thetac1 mu1 mu2 mu3;


sigm = .203;
CssYss = .81;
YssCss = 1/CssYss;
gam = 6.579;
IssYss = .19;
Rss = .014;
rhov = .3233;
rhoeta = .9346;
gk = 0;//.0073;
stigma = 0;// .0073;
rhoybar = 1;
bet = .99;
thetac1 = .3;

// Coeffs interest rule
mu1 = 1.5;
mu2 = 0;
mu3 = 0;

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
std_r_ = 1;                                                            //*
//**************************************************************************

model(linear);

//**************************************************************************
// Definition of Modelbase Variables in Terms of Original Model Variables//*
interest   = 4*R;                                                    //*
inflation = (1/4)*(4*pi + 4*pi(-1) + 4*pi(-2) + 4*pi(-3));           //*
inflationq  = 4*pi;                                                  //*
outputgap  = ytilde;                                                 //*
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
//**************************************************************************

// original interest rule
//R = mu1*pi + mu2*ytilde + mu3*R(-1); // table 1.1
//R = mu1*pi(-1) + mu2*ytilde(-1) + mu3*R(-1); // table 1.2



// Original Model Code:

// AD
pi     = p - p(-1);

y =     y(+1) - sigm*CssYss*(R - (pi(+1))) + CssYss*v;
m - p = (1/(sigm*gam))*YssCss*(y - IssYss*i) - (1/gam) * (1/Rss) * R + eta;

v =     rhov*v(-1) + ev_;
eta =   rhoeta*eta(-1) + u_;

i = gk + i(-1) + e_;
ybar = stigma + rhoybar*ybar(-1)+ ey_;


// AS
ytilde = y - ybar;
pi =    bet*pi(+1) + thetac1*ytilde; // Calvo-Rotemberg price setting

end;

shocks;
var ev_ = 0.0114^2;
var u_ =  0.0225^2;
var e_ = 0.025^2;
var ey_ = 0.007^2;

end;

//stoch_simul (periods = 200, irf = 60);
