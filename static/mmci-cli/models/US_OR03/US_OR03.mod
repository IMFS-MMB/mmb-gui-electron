//**************************************************************************
// A New Comparative Approach to Macroeconomic Modeling and Policy Analysis
//
// Volker Wieland, Tobias Cwik, Gernot J. Mueller, Sebastian Schmidt and
// Maik Wolters
//
// Working Paper, 2009
//**************************************************************************

// Model: ORP03

// Further references:
// Orphanides, A. 2003. "The quest for prosperity without inflation."
// Journal of Monetary Economics 50 (2003) 633-663

// Last edited: 10/09/07 by S. Schmidt


var y pi f

//**************************************************************************
// Modelbase Variables                                                   //*
   interest inflation inflationq outputgap output;                       //*
//**************************************************************************

varexo e u

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
b0 bpi1 bpi2 bpi3 bpi4 by1 by2 by3 by4 bf1 bf2 bf3 bf4 api1 api2 api3 api4 ay0 ay1 ay2 ay3 ay4;



b0 = 0.175638173; //intercept; has to be dropped possibly
bpi1 = 0.023509403;
bpi2 = -0.018273476;
bpi3 = -0.009214318;
bpi4 = 0.085793876;
by1 = 1.108346534;
by2 = 0.111102286;
by3 = -0.184403424;
by4 = -0.090084761;
bf1 = -0.021894643;
bf2 = -0.325769155;
bf3 = 0.261153539;
bf4 = 0.004694774;

api1 = 0.3280;
api2 = 0.3034;
api3 = 0.2584;
api4 = 0.1102;
ay0 = 0.2835;
ay1 = 0.0273;
ay2 = -0.3418;
ay3 = 0.2986;
ay4 = -0.1245;

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
interest = f;                                                            //*
inflation = (1/4)*(pi + pi(-1) + pi(-2) + pi(-3));			             //*
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

y = b0 + bpi1*pi(-1) + bpi2*pi(-2) + bpi3*pi(-3) + bpi4*pi(-4) + by1*y(-1) + by2*y(-2) + by3*y(-3) + by4*y(-4) + bf1*f(-1) + bf2*f(-2) + bf3*f(-3) + bf4*f(-4) + u;
pi = api1*pi(-1) + api2*pi(-2) + api3*pi(-3) + api4*pi(-4) + ay0*y + ay1*y(-1) + ay2*y(-2) + ay3*y(-3) + ay4*y(-4) + e;


// original interest rate rules
//interest = 2 + inflation + 0.5*(inflation - 2) + 0.5*outputgap + interest_; //Taylor rule
//interest = 2 + inflation + 0.5*(inflation - 2) + 1.0*outputgap + interest_; //Revised Taylor rule

end;


shocks;
var u = 0.771025149^2;
var e = 1.4069906748^2;
var interest_ = 0;
end;


//stoch_simul (irf = 60);
