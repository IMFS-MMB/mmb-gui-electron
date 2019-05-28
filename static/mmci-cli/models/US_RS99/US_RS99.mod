//**************************************************************************
// A New Comparative Approach to Macroeconomic Modeling and Policy Analysis
//
// Volker Wieland, Tobias Cwik, Gernot J. Mueller, Sebastian Schmidt and
// Maik Wolters
//
// Working Paper, 2009
//**************************************************************************

// Model: US_RS99

// Further references:
// Rudebusch, G., and L. Svensson. 1999. "Policy Rules for Inflation Targeting."
// in: John B. Taylor (ed.), Monetary Policy Rules. Chicago: University of Chicago Press for NBER.

// Last edited: 2010/09/07


var pi y i pibar ibar

//**************************************************************************
// Modelbase Variables                                                   //*
   interest inflation inflationq outputgap output;                       //*
//**************************************************************************

varexo eps eta
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
alphapi1 alphapi2 alphapi3 alphapi4 alphay betay1 betay2 betar;



alphapi1 = .7;
alphapi2 = -.1;
alphapi3 = .28;
alphapi4 = .12;
alphay = .14;
betay1 = 1.16;
betay2 = -.25;
betar = .10;

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
//**************************************************************************

model(linear);

//**************************************************************************
// Definition of Modelbase Variables in Terms of Original Model Variables//*
interest = i;                                                            //*
inflation = (1/4)*(pi + pi(-1) + pi(-2) + pi(-3));                       //*
inflationq  = pi;                                                        //*
outputgap  = y;                                                          //*
output = y;                                                              //*
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

// Original Model Code:

// example for original interest rate rule (Fifth policy rule in Table 5.4)
//i = 2.34*pibar + 1.03*y +0.30*i(-1);

pi = alphapi1*pi(-1) + alphapi2*pi(-2) + alphapi3*pi(-3) + alphapi4*pi(-4) + alphay*y(-1) + eps;
y = betay1*y(-1) + betay2*y(-2) - betar*(ibar(-1)-pibar(-1)) + eta;
pibar=(1/4)*(pi + pi(-1) + pi(-2) + pi(-3));
ibar=(1/4)*(i + i(-1) + i(-2) + i(-3));

end;


shocks;
var eps = 1.009^2;
var eta = 0.819^2;
end;


//stoch_simul (irf = 60);
