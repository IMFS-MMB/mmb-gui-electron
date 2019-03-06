//**************************************************************************
// A New Comparative Approach to Macroeconomic Modeling and Policy Analysis
//
// Volker Wieland, Tobias Cwik, Gernot J. Mueller, Sebastian Schmidt and 
// Maik Wolters
//
// Working Paper, 2009
//**************************************************************************

// Model: US_OW98

// Further references:
// Orphanides, A., and V. Wieland. 1998. "Price stability and monetary policy effectiveness when nominal interest rates are bounded at zero."
// Finance and Economics Discussion Series 98-35, Board of Governors of the Federal Reserve System.
// Levin, A., V. Wieland, and J. Williams. 2003. "The Performance of Forecast-Based Monetary Policy Rules under Model Uncertainty."
// American Economic Review 93(3), pp. 622-645.

// Last edited: 11/08/31 by Sebastian Schmidt


var  ygap pdot rff drff	pinf plevel rl rrl ec efi eii eg ex yp cwage vindex
     pitarg rho1 rho16 rho28 rho40 dygap cwage1 cwage2 plevel1 plevel2 plevel3 
     rff1 efi1 efi2 eii1 eii2 ygap1 ygap2 egsh

//**************************************************************************
// Modelbase Variables                                                   //*    
   interest inflation inflationq outputgap output fispol;                //*
//**************************************************************************


varexo ecsh efish eiish exsh cwsh 

//**************************************************************************
// Modelbase Shocks                                                      //*       
       interest_ fiscal_;                                                //*
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
ecbar efibar eiibar exbar egbar pinfbar rffbar rrlbar;



ecbar	=     6.8355548687555923e-01;
efibar	=   1.4661885394578772e-01;
eiibar	=   3.9412501642005875e-03;
exbar	=   -2.0844600536418095e-02;
egbar	=    1.8672901279611806e-01;


pinfbar= 1.7383970534932569e-02; // 0;
rffbar= 2.7673575521404148e-02; //  0;
rrlbar	= 1.0289616884640973e-02;

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
                                                                         //*
// Definition of Discretionary Fiscal Policy Parameter                   //*
coffispol = 1/5;                                                           //*
//**************************************************************************

model(linear);

//**************************************************************************
// Definition of Modelbase Variables in Terms of Original Model Variables //*

interest   = rff-rffbar*100;                                             //*
inflation = (1/4)*(pdot+ pdot(-1)+ pdot(-2)+ pdot(-3));      //*
inflationq  = pdot;                                          //*
outputgap  = ygap-steady_state(ygap);                                                       //*
output  =0;
fispol = egsh;                                                           //*
//**************************************************************************


// Original Model Code:

// Original monetary policy rule, equation (1)
%rff = -0.0042 + 0.760*rff(-1) + 0.625*pinf + 1.171*ygap - 0.967*ygap(-1)+interest_ + (steady_state(rff)+0.0042 - 0.76*steady_state(rff)-0.625*steady_state(pinf)- 1.171*steady_state(ygap) + 0.967*steady_state(ygap));
%rff = -0.00061525 -0.0042 + 0.760*rff(-1) + 0.625*pinf + 1.171*ygap - 0.967*ygap(-1)+interest_;

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
fispol = coffispol*fiscal_;                                              //*
//**************************************************************************

drff     =  rff - rff(-1);

//Output gap first difference
dygap    =  ygap - ygap(-1);

// ex ante real short rate
rho1     =  rff - pdot(+1);


rff - pdot(+1) = rho16 - 16.0*(rho16(+1) - rho16);
rff - pdot(+1) = rho28 - 28.0*(rho28(+1) - rho28);
rff - pdot(+1) = rho40 - 40.0*(rho40(+1) - rho40);

// annual inflation
pinf     =  plevel - plevel3(-1);
// quarterly inflation
pdot     =  4*(plevel - plevel(-1));


// Aggregate demand
ygap     =  ec + efi + eii + eg + ex - 1;

//long-term nominal rate
rl       = (rff + rff(+1) + rff(+2) + rff(+3) + rff(+4) + rff(+5) + rff(+6) + rff(+7))/8;
//long-term real rate
rrl      =  rl - (plevel(+8) - plevel)/2;
// consumption
ec       =  0.229884093 + 0.665229981*ec(-1) + 0.286404154*yp - 0.102064840*rrl + ecsh;
//fixed investment
efi      =  0.001837149 + 0.987517671*efi(-1) + 0.171053677*efi1(-1) - 0.168815275*efi2(-1) + 0.133783338*ygap - 0.050027010*ygap(-1) - 0.128116183*ygap1(-1) - 0.032573147*rrl + efish;
//inventory investment
eii      =  0.001874640 + 0.324042437*eii(-1) + 0.032234045*eii1(-1) + 0.168077466*eii2(-1) + 0.115940167*ygap + 0.186708319*ygap(-1) - 0.285688047*ygap1(-1) + eiish;
//government spending
eg       =  0.0033254101 + 0.9821910468*eg(-1) + egsh;
//net exports
ex       =  exbar + exsh;
//permanent income (discounted at 10%)
yp       =  (1-0.9)*(ygap + 0.9*ygap(+1) + (0.9^2)*ygap(+2) + (0.9^3)*ygap(+3) + (0.9^4)*ygap(+4) + (0.9^5)*ygap(+5) + (0.9^6)*ygap(+6) + (0.9^7)*ygap(+7) + (0.9^8)*ygap(+8))/(1.0-(0.9^9));

//nominal contract wage
cwage - plevel =0.034292-0.00042072+ 0.00022993  + (0.25+1.5*0.0803)*vindex + (0.25+0.5*0.0803)*vindex(+1) + (0.25-0.5*0.0803)*vindex(+2) + (0.25-1.5*0.0803)*vindex (+3) + 0.0055*((0.25+1.5*0.0803)*ygap + (0.25+0.5*0.0803)*ygap(+1) + (0.25-0.5*0.0803)*ygap(+2) + (0.25-1.5*0.0803)*ygap(+3)) +cwsh;
%-0.00042072 +

//price level
plevel   = -0.00097656+ (0.25+1.5*0.0803)*cwage + (0.25+0.5*0.0803)*cwage(-1) + (0.25-0.5*0.0803)*cwage1(-1) + (0.25-1.5*0.0803)*cwage2(-1); 
%-0.00097656+
//real contract wage index
vindex   =  -0.02231 +0.0002669 -0.00015472+ (0.25+1.5*0.0803)*(cwage - plevel) + (0.25+0.5*0.0803)*(cwage(-1) - plevel(-1)) + (0.25-0.5*0.0803)*(cwage1(-1) - plevel1(-1)) + (0.25-1.5*0.0803)*(cwage2(-1) - plevel2(-1));
%0.0002669

//inflation target (29-41)
pitarg   =  pinfbar;
cwage1   =  cwage(-1);
cwage2   =  cwage1(-1);
plevel1  =  plevel(-1);
plevel2  =  plevel1(-1);
plevel3  =  plevel2(-1);
rff1     =  rff(-1);
efi1     =  efi(-1);
efi2     =  efi1(-1);
eii1     =  eii(-1);
eii2     =  eii1(-1);
ygap1    =  ygap(-1);
ygap2    =  ygap1(-1);
end;

%steady(solve_algo=0);
%check;

//shocks;    
//var interest_ = 1;// policy rule innovation
//var ecsh      = 1;
//var efish     = 1;
//var eiish     = 1;
//var fiscal_   = 1; // fiscal policy shock
//var exsh      = 1;
//var cwsh      = 1; 
//end;

initval;
ygap = 0;
pdot = 1.7383970534932569e-02;
rff = 2.7673575521404148e-02;
drff = 0;
pinf = 1.7383970534932569e-02;
rl = 2.7673575521404148e-02;
rrl = 1.0289616884640973e-02;
ec = 6.8355548687555923e-01;
efi	=   1.4661885394578772e-01;
eii	=   3.9412501642005875e-03;
ex	=   -2.0844600536418095e-02;
eg	=    1.8672901279611806e-01;
rff1     =  rff;
efi1     =  efi;
efi2     =  efi;
eii1     =  eii;
eii2     =  eii;
ygap1    =  0;
ygap2    =  0;
end;

shocks;
var interest_          =  1; // for IRF replication 
var interest_, ecsh    =  0;
var interest_, efish   =  0;
var interest_, eiish   =  0;
var interest_, fiscal_ =  0;
var interest_, exsh    =  0;
var interest_, cwsh    =  0;
var ecsh               =  10000*(2.45105432212782e-06);
var ecsh, efish        =  10000*(7.62469240533302e-07);
var ecsh, eiish        = 10000*(-5.90629883332327e-07);
var ecsh, fiscal_      =  10000*(8.68855343396095e-08);
var ecsh, exsh         = 10000*(-1.41362462520144e-07);
var ecsh, cwsh         = 10000*(-3.49609855147809e-07);
var efish              =  10000*(1.21088247371104e-06);
var efish, eiish       = 10000*(-2.38405721647661e-07);
var efish, fiscal_     = 10000*(-1.38239167190924e-07);
var efish, exsh        = 10000*(-7.76614599252908e-08);
var efish, cwsh        = 10000*(-8.03846938996685e-08);
var eiish              =  10000*(2.52368905045492e-06);
var eiish, fiscal_     = 10000*(-2.67524897907621e-07);
var eiish, exsh        =  10000*(1.24592513572702e-08);
var eiish, cwsh        =  10000*(2.05962361259062e-07);
var fiscal_            =  10000*(8.07080286146075e-07);
var fiscal_, exsh      = 10000*(-1.28555415697415e-07);
var fiscal_, cwsh      = 10000*(-7.85205142464003e-08);
var exsh               =  10000*(9.05986420155772e-07);
var exsh, cwsh         =  10000*(6.39353499797624e-08);
var cwsh               =  10000*(3.04717660977982e-07);
end; 
%steady;


options_.Schur_vec_tol = 1e-6;  
//stoch_simul (irf = 0, ar=100, noprint);