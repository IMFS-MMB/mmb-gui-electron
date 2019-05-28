//**************************************************************************
// A New Comparative Approach to Macroeconomic Modeling and Policy Analysis
//
// Volker Wieland, Tobias Cwik, Gernot J. Mueller, Sebastian Schmidt and
// Maik Wolters
//
// Working Paper, 2009
//**************************************************************************


// Model: EA_BE15

// Further references:
// Benchimol, J. 2015. "Money in the Production Function: A New Keynesian DSGE Perspective."
// Southern Economic Journal 2015, 82(1), 152–184

// Implemented and last edited: 05/06/18 by Matyas Farkas

//**************************************************************************
//Original mod file begins here:
//**************************************************************************

//	Unconstrained (return to scale sum could be different from 1)

var y, pi, ir, mp, mn, yf, mpf, mnf, ea, eu, ei, ep, en, vel
//**************************************************************************
// Modelbase Variables                                                   //*
   interest inflation inflationq outputgap output; 		                //*
//**************************************************************************

// varobs y, pi, ir, mp, mn;
varexo ua, uu, ui, up, un

//**************************************************************************
// Modelbase Shocks                                                      //*
       interest_; 		                                                 //*
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
        std_r_ std_r_quart 			                                     //*
//**************************************************************************
	//	Micro parameters
	alphan alpham beta teta nu sigma gamma khi neta epsilon a1 a2 li1 li2 li3
	rhoa1 rhou1 rhoi1 rhop1 rhon1
	vel0 vel1 vel2
	//	Macro parameters
	vym vyc vya vyp
	mnf1 mnf2 mnf3 mnf4
	pi1 pi2;

	//	Estimated micro parameters
	alphan	=	0.4996;
	alpham	=	0.0299;
    nu		=	1.3567;
    sigma	=	1.8465;
    gamma   =   0.4100;
    gamma   =   0.4399;
    khi     =   0.9998;
    li1		=	0.6005;
    li2		=	3.4258;
    li3		=	1.4118;
	vel0	=	0.3082;
	vel1	=	2.0798;
	vel2	=	0.1617;
    rhoa1	=	0.9398;
    rhou1	=	0.9543;
    rhoi1	=	0.1567;
    rhop1	=	0.7656;
    rhon1	=	0.8342;

	//	Calibrated and SS parameters
    beta	=	0.996;
    teta	=	0.66;
    epsilon	=	6.00;
    neta	=	1.00;
    a1		=	ln(1-exp(-1/beta))-((1/beta)/(exp(1/beta)-1));	// Steady State value and Taylor approximation order 1
    a2		=	1/(exp(1/beta)-1);								// Steady State value and Taylor approximation order 1

	//	Macro parameters

	//	yf
	vym		=	((alphan+alpham*(1+neta)-1)/(neta+alphan-(1-sigma)*(1-alphan)));
	vyc		=	(((1-alphan)*(ln(alpham*(1-alphan))-ln(khi)-ln(epsilon/(epsilon-1))))/(neta+alphan-(1-sigma)*(1-alphan)));
	vya		=	((1+neta)/(neta+alphan-(1-sigma)*(1-alphan)));
	vyp		=	((alpham*(1+neta))/(neta+alphan-(1-sigma)*(1-alphan)));

	//	mnf
	mnf1	=	(sigma/nu);
	mnf2	=	-((a2*sigma)/nu);
	mnf3	=	-((-ln(beta))*(a2/nu))-((-ln(gamma)+a1)/nu);
	mnf4	=	(1/nu);

	//	pi
	pi1		=	((((1-teta)*(1-beta*teta))/((1-alphan+epsilon*(2*alphan-1))*teta))*(neta+alphan-((1-sigma)*(1-alphan)))); // a verifier
	pi2		=	((((1-teta)*(1-beta*teta))/((1-alphan+epsilon*(2*alphan-1))*teta))*(1-alphan-alpham*(1+neta)));
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

model;

//**************************************************************************
// Definition of Modelbase Variables in Terms of Original Model Variables //*

interest   = ir*4;                                                       //*
inflation = (1/4)*(4*pi+4*pi(-1)+4*pi(-2)+4*pi(-3));			         //*
inflationq  = pi*4;                                                      //*
outputgap  = y-yf;                                                       //*
output = y;                                                              //*
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


	// Flexible-price economy
	yf		=	vym*mpf + vyc + vya*ea + vyp*ep;
	mnf		=	mnf1*yf + mnf2*(yf(+1)-yf) + mnf3 + mnf4*en;
	mpf		=	yf - mnf - vel;

	// Sticky-price economy
	pi		=	beta*pi(+1) + pi1*(y-yf) + pi2*(mp-mpf);
	y		=	y(+1) - (1/sigma)*(ir-pi(+1)+ln(beta))-(1/sigma)*(eu(+1)-eu);
	mn		=	(sigma/nu)*y - (a2/nu)*ir - ((-ln(gamma)+a1)/nu) + (1/nu)*en;
	mp		=	y - mn - vel;
//	ir		=	(1-li1)*(li2*(pi-cible) + li3*(y-yf)) + li1*(ir(-1)) + ei;
	vel		=	vel0 + vel1*(vel2*en + (1-vel2)*ep);

	// Shocks
	ea  	=	rhoa1*ea(-1) + 10*ua;
	eu  	=	rhou1*eu(-1) + 10*uu;
	ei  	=	rhoi1*ei(-1) + 10*ui;
	ep  	=	rhop1*ep(-1) + 10*up;
	en		=	rhon1*en(-1) + 10*un;

end;

	// Stochastic shocks
shocks;
    var ua; stderr 0.0071;
    var uu; stderr 0.1063;
    var ui; stderr 0.0290;
    var up; stderr 0.0164;
    var un; stderr 0.0169;
end;
%steady;
