//**************************************************************************
// A New Comparative Approach to Macroeconomic Modeling and Policy Analysis
//
// Volker Wieland, Tobias Cwik, Gernot J. Mueller, Sebastian Schmidt and
// Maik Wolters
//
// Working Paper, 2009
//**************************************************************************


// Model: EA_BE17
// Further references:
// Benchimol, Jonathan & Fourçans, André, 2017. "Money And Monetary Policy
// In The Eurozone: An Empirical Analysis During Crises," Macroeconomic Dynamics,
// Cambridge University Press, vol. 21(03), pages 677-707, April.

// Implemented and last edited: 20/06/18 by Matyas Farkas

//**************************************************************************
//Original mod file begins here:
//**************************************************************************


var y, pi, r, mp, yf, mpf, ep, ei, em, at
//**************************************************************************
// Modelbase Variables                                                   //*
   interest inflation inflationq outputgap output; 		                //*
//**************************************************************************

varexo up, ui, um, ua

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
alpha beta teta vega sigma neta epsilon b a1 a2 li1 li2 li3 li4 rhoa rhop rhoi rhom pb yb mpb rb cstd;

   alpha	=	0.295;
    beta	=	0.995;
    teta	=	0.65;
    vega	=	1.25;
    sigma	=	2.;
    b       =   0.25;
    a1		=	1/(1+((b/(1-b))^(1-vega))*((1/(1-exp(-1/beta)))^((1-vega)/vega)));
    a2		=	1/(exp(1/beta)-1);
    neta	=	2.0;
    epsilon	=	6.0;
    li1		=	0.42;
    li2		=	1.8;
    li3		=	1;
    li4		=	0.0;
    rhoa	=	0.98;
    rhop	=	0.968;
    rhoi	=	0.42;
    rhom	=	0.0;

	pb		= 0.92;
	yb		= 0.00;
	mpb		= 0.00;
	rb		= 0.00;
	cstd	= 0.008;

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

interest   = r*4;                                                       //*
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

yf = ((1+neta)/((vega-(vega-sigma)*a1)*(1-alpha)+neta+alpha))*at+((1-alpha)*(vega-sigma)*(1-a1)/((vega-(vega-sigma)*a1)*(1-alpha)+neta+alpha))*(mpf) - (log((1+(1/((1/(epsilon-1)))))/((1+(1/((1/(epsilon-1)))))-1)))*((1-alpha)/((vega-(vega-sigma)*a1)*(1-alpha)+neta+alpha))+(((1-alpha)*(vega-sigma)*(1-a1))/((1-vega)*((vega-(vega-sigma)*a1)*(1-alpha)+neta+alpha)))*em;
mpf = -((a2*(vega-(vega-sigma)*a1))/vega)*(yf(+1))+(1+((a2*(vega-(vega-sigma)*a1))/vega))*(yf)+(1/vega)*em;
pi = beta*(pi(+1)) + (((1-alpha)*(1-teta)*(1-beta*teta)*(vega-(vega-sigma)*a1+((neta+alpha)/(1-alpha))))/(teta*(1-alpha+alpha*(1+(1/((1/(epsilon-1))+ep))))))*(y-yf) + (((1-alpha)*(1-teta)*(1-beta*teta)*(sigma-vega)*(1-a1))/(teta*(1-alpha+alpha*(1+(1/((1/(epsilon-1))+ep))))))*(mp-mpf);
y = y(+1) - (1/(vega-a1*(vega-sigma)))*(r-rb - (pi(+1))) + (((sigma-vega)*(1-a1))/(vega-a1*(vega-sigma)))*(mp(+1)-mp) - (((1-a1)*(vega-sigma))/((1-vega)*(vega-a1*(vega-sigma))))*(em(+1)-em) ;
mp = y - (a2/vega)*(r-rb) + (1/vega)*em;

//r-rb = (1-li1)*(li2*(pi-pb) + li3*(y-yf)) + li1*(r(-1)-rb)+ ei;// + li4*(mp-mpf)

at  = rhoa * at(-1) + 10*ua;
ep  = rhop * ep(-1) + 10*up;
ei  = rhoi * ei(-1) + 10*ui;
em  = rhom * em(-1) + 10*um;
end;


shocks;
    var ua = cstd;
    var ui = cstd;
    var up = cstd;
    var um = cstd;
end;

