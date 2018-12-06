//**************************************************************************
// A New Comparative Approach to Macroeconomic Modeling and Policy Analysis
//
// Volker Wieland, Tobias Cwik, Gernot J. Mueller, Sebastian Schmidt and 
// Maik Wolters
//
// Working Paper, 2009
//**************************************************************************

// Model: CA_LS07

// Further references:
// Lubik, T.A. and Schorfheide, F. (2007): "Do central banks respond to exchange rate movements?
//        A structural investigation", Journal of Monetary Economics 54. 1069-1087.

// small open economy model; a simplified version of the Gali and Monacelli (2005) model

// Last edited: 22/08/11 by M.Jancokova


var y R pi z deltaq deltay_star y_bar y_star deltae pi_star 
     
//**************************************************************************
// Modelbase Variables                                                   //*
   interest inflation inflationq output outputgap; //fispol;             //*
//**************************************************************************

varexo epsq epspi_star epsz epsy_star// epsR

//**************************************************************************
// Modelbase Shocks                                                      //*
       interest_; //fiscal_;                                             //*
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
        std_r_ std_r_quart //coffispol;                                 //*
                                                                         //*
//**************************************************************************

tau alfa rhoz beta kappa rhoR psi1 psi2 psi3 rhoq rhoy_star rhopi_star rss;


tau=0.31;                           //intertemporal substition elasticity
alfa=0.11;                          //import share
rhoz=0.42;                          //persistence in the technology growth rate
rss=2.52;                           //steady state real interest rate
beta=exp(-rss/400); //beta=0.9937   //discount factor
kappa=0.32;                         //slope coef. of the Phillips curve; function of underlying structural parameters
rhoR=0.69;                          //persistence in nom.int.rate; smoothing term
psi1=1.3;                           //policy coefficient w.r.t. inflation
psi2=0.23;                          //policy coefficient w.r.t. output
psi3=0.14;                          //policy coefficient w.r.t. nom. exch.rate diff.
rhoq=0.31;                          //persistence in TOT growth rate
rhoy_star=0.97;                     //persistence in exogenous world output
rhopi_star=0.46;                    //persistence in world inflation shock


//**************************************************************************
// Specification of Modelbase Parameters                                 //*
                                                                         //*
// Load Modelbase Monetary Policy Parameters                             
	thispath = cd;                                                       
	cd('..');                                                            
	load policy_param.mat; 
    for i=1:33
        deep_parameter_name = M_.param_names(i,:);
        eval(['M_.params(i) = ' deep_parameter_name ' ;'])
    end
	cd(thispath);                                                     	 
//    std_r_=100;                                                        
                                                                         
// Definition of Discretionary Fiscal Policy Parameter                   
                                                                         
// coffispol = 1;                                                        
//**************************************************************************


model(linear);

//**************************************************************************
// Definition of Modelbase Variables in Terms of Original Model Variables//*
                                                                         //*
interest   = R*4;                                                        //*
inflation  = pi+pi(-1)+pi(-2)+pi(-3);                                    //*
inflationq = pi*4;                                                       //*
outputgap  = y-y_bar;                                                    //*
output     = y;                                                          //*
//fispol   = ;                                                           //*
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


//open economy IS curve
y=y(+1)-(tau+alfa*(2-alfa)*(1-tau))*(R-pi(+1))-rhoz*z-alfa*(tau+alfa*(2-alfa)*(1-tau))*deltaq(+1)+alfa*(2-alfa)*((1-tau)/tau)*deltay_star(+1);

deltay_star=y_star-y_star(-1);

//open economy Phillips curve
pi=beta*pi(+1)+alfa*beta*deltaq(+1)-alfa*deltaq+kappa/(tau+alfa*(2-alfa)*(1-tau))*(y-y_bar);

//potential output in absence of nominal rigidities 
y_bar=-alfa*(2-alfa)*(1-tau)/tau*y_star;

//CPI
pi=deltae+(1-alfa)*deltaq+pi_star;

//MP rule
//R=rhoR*R(-1)+(1-rhoR)*(psi1*pi+psi2*y+psi3*deltae)+epsR;

//law of motion for the TOT growth rate
deltaq=rhoq*deltaq(-1)+epsq;

//AR(1) process of the growth rate of an underlying technology process 
z=rhoz*z(-1)+epsz;

//AR(1) processes for y_star and pi_star; introducing TOT shocks
y_star=rhoy_star*y_star(-1)+epsy_star;
pi_star=rhopi_star*pi_star(-1)+epspi_star;

end;

//steady;
//check;

shocks;
//var epsR=0.36^2;
var epsq=1.25^2;
var epsz=0.84^2;
var epsy_star=1.29^2;
var epspi_star=2.00^2;

var interest_=0;

end;

//stoch_simul(irf=0, ar=0, noprint) y inflationq interest deltae;
