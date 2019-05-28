//-------------------------------------------------------------------------------------------------------------------------
//      THIS DYNARE FILE REPLICATES
//
//      Christiano, Motto and Rostagno (2010), "Financial Factors in Economic Fluctuations", ECB WP N�1192 - FINANCIAL ACCELERATOR MODEL
//
//      ADAPTED for the Macro Model Data Base
//
//      THIS FILE WAS WRITTEN FOR DYNARE 4.2.5 AND MATLAB 7.12 BY:
//
//      Fabio Verona, email: f8fabio@yahoo.it
//
//      August 2012
//
//---------------------------------------------------------------------------------------------------------------------------

// Variables
var   piU, sU, rkU, iU, uU, omegabarU, RkXU, nU, qU, lambdazU, cU, wU,
      hU, kbarU, ReXU, pstarU, wstarU, FpXU, FwXU,YU, btotU,
      lambdafU, pitargetU, muupU, gU, muzstarU, gammaU, epsilU,sigmaU, zetacU, zetaiU, tauoU

      piflexU, sflexU, rkflexU, iflexU, uflexU, omegabarflexU, RkXflexU, nflexU, qflexU, lambdazflexU, cflexU, wflexU,
      hflexU, kbarflexU, ReXflexU, FpXflexU, FwXflexU,YflexU, btotflexU,

//**************************************************************************
// Modelbase Variables                                                   //*
        interest inflation inflationq outputgap output;                  //*
//**************************************************************************


varexo e_lambdafU, e_pitargetU,e_muupU, e_gU, e_muzstarU, e_gammaU, e_epsilU, e_sigmaU,  e_zetaiU, e_tauoU, //e_zetacU,

//**************************************************************************
// Modelbase Shocks                                                      //*
        interest_;                                                       //*
//**************************************************************************


parameters btotUU, YUU, piUU, sUU, rkUU, iUU, uUU, omegabarUU, RkXUU, nUU, qUU, lambdazUU, cUU, wUU, hUU, kbarUU, ReXUU, pstarUU, wstarUU, FpXUU, FwXUU,  lambdafUU, pitargetUU, muupUU, gUU, muzstarUU, gammaUU, epsilUU, sigmaUU, zetacUU, zetaiUU, tauoUU

           FpXflexUU,FwXflexUU,

           rho1_lambdafU, rho1_pitargetU, rho1_muupU, rho1_gU, rho1_muzstarU, rho1_gammaU, rho1_epsilU, rho1_sigmaU,  rho1_zetaiU, rho1_tauoU, rho1_zetacU
           std1_lambdafU, std1_pitargetU, std1_muupU, std1_gU, std1_muzstarU, std1_gammaU, std1_epsilU, std1_sigmaU,  std1_zetaiU, std1_tauoU, std1_zetacU

           lambdawUU, sigmaLXUU, betaUU, xiwUU, bUU,
           psiLXUU, iotaw1UU, iotamuUU, muUU, weUU, bigthetaUU, sigmaaUU, SdouprXUU,
           upsilUU, alphaUU, deltaUU, xipUU, iota1UU, etagUU,
           taukUU, taulUU, taucUU, tauUU, aptilUU, aytilUU, rhotilUU, phiUU, pibarUU,

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
        std_r_ std_r_quart;// coffispol;                                    //*
                                                                         //*
//**************************************************************************


//**************************************************************************
// Specification of Modelbase Parameters                                 //*
                                                                         //*
// Load Modelbase Monetary Policy Parameters                             //*
	thispath = pwd;                                                       //*
	cd('..');                                                            //*
	load policy_param.mat;
    //load ss_parameters_US.mat;
    qq=load('policy_param.mat');
    for i=1:M_.param_nbr;
    name = deblank(M_.param_names(i,:));
    if isfield(qq,name);
       M_.params(i) = eval(['qq.' name]);
   //    disp([name ' ' num2str(M_.params(i))]);
    end;
end;                                         //*
	cd(thispath);
std_r_=100;                                                         	 //*
//**************************************************************************


// load the steady state values
pp=load('ss_CMR_FA_US');
for i=1:M_.param_nbr;
    name = deblank(M_.param_names(i,:));
    if isfield(pp,name);
       M_.params(i) = eval(['pp.' name]);
      // disp([name ' ' num2str(M_.params(i))]);
    end;
end;




model;

//**************************************************************************
// Definition of Modelbase Variables in Terms of Original Model Variables//*
interest   = 100*( (1+ReXU)^4 - (1+ReXUU)^4 )/((1+ReXUU)^4);             //*
inflation  = 1/4*(inflationq+inflationq(-1)+inflationq(-2)+inflationq(-3));//*
inflationq = 100*(piU^4-piUU^4)/(piUU^4);                                //*
outputgap  = 100*(YU-YflexU)/YUU;                                        //*
output     = 100*(YU-YUU)/YUU;                                           //*
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

// A.1: A measure of marginal cost
-sU+((1-alphaUU)^(alphaUU-1)*alphaUU^(-alphaUU))*(rkU^alphaUU)*(wU^(1-alphaUU))/epsilU;

// A.2: Another measure of marginal cost
rkU/( alphaUU*epsilU*( (upsilUU*muzstarU*( hU*(wstarU ^ (lambdawUU/(lambdawUU-1)) ) )/(uU*kbarU(-1)))^(1-alphaUU) ) )-sU;

// A.3, A.4, and A.5: Conditions associated with Calvo sticky prices
pstarU - ((1-xipUU)*( ( ( (1 - xipUU*(( (pitargetU^iota1UU) * (piU(-1)^(1-iota1UU)) * pibarUU^(1-iota1UU-(1-iota1UU)) )/piU)^(1/(1-lambdafU)) ) / (1-xipUU) ) ) ^ lambdafU ) + xipUU*(((( (pitargetU^iota1UU) * (piU(-1)^(1-iota1UU)) * pibarUU^(1-iota1UU-(1-iota1UU)) )/piU)*pstarU(-1))^( lambdafU / (1-lambdafU) )) )^(1/( lambdafU / (1-lambdafU) ));
lambdazU*( (pstarU^(lambdafU/(lambdafU-1))) * ( epsilU * ( (uU*kbarU(-1)/(muzstarU*upsilUU))^alphaUU ) * ( ( hU*(wstarU ^ (lambdawUU/(lambdawUU-1)) ) )^(1-alphaUU) ) - phiUU ) ) + ( (( (pitargetU(+1)^iota1UU) * (piU^(1-iota1UU)) * pibarUU^(1-iota1UU-(1-iota1UU)) )/piU(+1)) ^ (1/(1-lambdafU(+1))) ) * betaUU * xipUU * FpXU(+1) - FpXU;
lambdafU*lambdazU*( (pstarU^(lambdafU/(lambdafU-1))) * ( epsilU * ( (uU*kbarU(-1)/(muzstarU*upsilUU))^alphaUU ) * ( ( hU*(wstarU ^ (lambdawUU/(lambdawUU-1)) ) )^(1-alphaUU) ) - phiUU ) )*sU + betaUU * xipUU *  ( (( (pitargetU(+1)^iota1UU) * (piU^(1-iota1UU)) * pibarUU^(1-iota1UU-(1-iota1UU)) )/piU(+1)) ^ (lambdafU(+1)/(1-lambdafU(+1))) ) * ( FpXU(+1)* (( ( (1 - xipUU*(( (pitargetU(+1)^iota1UU) * (piU^(1-iota1UU)) * pibarUU^(1-iota1UU-(1-iota1UU)) )/piU(+1))^(1/(1-lambdafU(+1))) ) / (1-xipUU) ) )^(1-lambdafU(+1))) ) - ( FpXU* (( ( (1 - xipUU*(( (pitargetU^iota1UU) * (piU(-1)^(1-iota1UU)) * pibarUU^(1-iota1UU-(1-iota1UU)) )/piU)^(1/(1-lambdafU)) ) / (1-xipUU) ) )^(1-lambdafU)) );

// A.6: production function
YU - (pstarU^(lambdafU/(lambdafU-1))) * ( epsilU * ( (uU*kbarU(-1)/(muzstarU*upsilUU))^alphaUU ) * ( ( hU*(wstarU ^ (lambdawUU/(lambdawUU-1)) ) )^(1-alphaUU) ) - phiUU );

// A.7: supply of capital
lambdazU*qU*( -( ( sqrt(SdouprXUU/2) )*exp(( sqrt(SdouprXUU/2) )*(( zetaiU*iU*muzstarU*upsilUU/iU(-1) )-muzstarUU*upsilUU))-( sqrt(SdouprXUU/2) )*exp(-( sqrt(SdouprXUU/2) )*(( zetaiU*iU*muzstarU*upsilUU/iU(-1) )-muzstarUU*upsilUU)) )*( zetaiU*iU*muzstarU*upsilUU/iU(-1) )+1-( exp(( sqrt(SdouprXUU/2) )*(( zetaiU*iU*muzstarU*upsilUU/iU(-1) )-muzstarUU*upsilUU))+exp(-( sqrt(SdouprXUU/2) )*(( zetaiU*iU*muzstarU*upsilUU/iU(-1) )-muzstarUU*upsilUU))-2 ) )-(lambdazU/muupU)+betaUU*lambdazU(+1)*qU(+1)*( ( ( sqrt(SdouprXUU/2) )*exp(( sqrt(SdouprXUU/2) )*(( zetaiU(+1)*iU(+1)*muzstarU(+1)*upsilUU/iU )-muzstarUU*upsilUU))-( sqrt(SdouprXUU/2) )*exp(-( sqrt(SdouprXUU/2) )*(( zetaiU(+1)*iU(+1)*muzstarU(+1)*upsilUU/iU )-muzstarUU*upsilUU)) )*(( zetaiU(+1)*iU(+1)*muzstarU(+1)*upsilUU/iU )^2) )/(muzstarU(+1)*upsilUU);

// A.8: capital accumulation
kbarU-(1-deltaUU)*(kbarU(-1)/(muzstarU*upsilUU))-(1-( exp(( sqrt(SdouprXUU/2) )*(( zetaiU*iU*muzstarU*upsilUU/iU(-1) )-muzstarUU*upsilUU))+exp(-( sqrt(SdouprXUU/2) )*(( zetaiU*iU*muzstarU*upsilUU/iU(-1) )-muzstarUU*upsilUU))-2 ))*iU;

// A.9: capital utilization
rkU - tauoU*rkUU*exp(sigmaaUU*(uU-1));

// A.10: rate of return on capital
RkXU - ( ( (1-taukUU)*(uU*rkU-tauoU*( rkUU*(exp(sigmaaUU*(uU-1))-1)/sigmaaUU ))+(1-deltaUU)*qU)*piU/(upsilUU*qU(-1)) + taukUU*deltaUU - 1);

// A.11: standard debt contract
(1-( normcdf(( (log(omegabarU(+1))+sigmaU^2/2)/sigmaU )-sigmaU)+omegabarU(+1)*(1-normcdf(( (log(omegabarU(+1))+sigmaU^2/2)/sigmaU ))) ))*( (1+RkXU(+1))/(1+ReXU) )+( (1-( normcdf((log(omegabarU(+1))+sigmaU^2/2)/sigmaU) ))/(1-( normcdf((log(omegabarU(+1))+sigmaU^2/2)/sigmaU) )-muUU*omegabarU(+1)*( normpdf((log(omegabarU(+1))+sigmaU^2/2)/sigmaU)/omegabarU(+1)/sigmaU )) )*(( (1+RkXU(+1))/(1+ReXU) )*( (1-muUU)*normcdf(( (log(omegabarU(+1))+sigmaU^2/2)/sigmaU )-sigmaU)+omegabarU(+1)*(1-normcdf(( (log(omegabarU(+1))+sigmaU^2/2)/sigmaU ))) )-1);

// A.12: zero profit condition
(qU(-1)*kbarU(-1)*(1+RkXU)*( (1-muUU)*normcdf(( (log(omegabarU)+sigmaU(-1)^2/2)/sigmaU(-1) )-sigmaU(-1))+omegabarU*(1-normcdf(( (log(omegabarU)+sigmaU(-1)^2/2)/sigmaU(-1) ))) )/(nU(-1)*(1+ReXU(-1))))-(qU(-1)*kbarU(-1)/nU(-1))+1;

//A.13: law of motion for net worth
-nU+(gammaU/(piU*muzstarU))*(RkXU-ReXU(-1)-( ( normcdf(( (log(omegabarU)+sigmaU(-1)^2/2)/sigmaU(-1) )-sigmaU(-1))+omegabarU*(1-normcdf(( (log(omegabarU)+sigmaU(-1)^2/2)/sigmaU(-1) ))) )-( (1-muUU)*normcdf(( (log(omegabarU)+sigmaU(-1)^2/2)/sigmaU(-1) )-sigmaU(-1))+omegabarU*(1-normcdf(( (log(omegabarU)+sigmaU(-1)^2/2)/sigmaU(-1) ))) ) )*(1+RkXU))*kbarU(-1)*qU(-1)+weUU+gammaU*(1+ReXU(-1))*nU(-1)/(piU*muzstarU);

// A.19: marginal utility of consumption
(1+taucUU)*lambdazU-(muzstarU*zetacU/(cU*muzstarU-bUU*cU(-1)))+bUU*betaUU*zetacU(+1)/(cU(+1)*muzstarU(+1)-bUU*cU);

// A.21, A.22, and A.23: Conditions associated with Calvo sticky wages
wstarU - ( ((1-xiwUU)*( ( (1 - xiwUU * ( ( (( (pitargetU^iotaw1UU) * (piU(-1)^(1-iotaw1UU)) * (pibarUU^(1-iotaw1UU-(1-iotaw1UU))) )/( piU*muzstarU*wU/wU(-1) )) * (muzstarUU^(1-iotamuUU)) * (muzstarU^iotamuUU) ) ^ (1/(1-lambdawUU)) ) ) / (1-xiwUU) ) ^ lambdawUU ) + xiwUU*( (( (( (pitargetU^iotaw1UU) * (piU(-1)^(1-iotaw1UU)) * (pibarUU^(1-iotaw1UU-(1-iotaw1UU))) )/( piU*muzstarU*wU/wU(-1) )) * (muzstarUU^(1-iotamuUU)) * (muzstarU^iotamuUU) )*wstarU(-1))^( lambdawUU/(1-lambdawUU) ) ) )^(1/( lambdawUU/(1-lambdawUU) )) );
((wstarU^(lambdawUU/(lambdawUU-1)))*hU*(1-taulUU)*lambdazU/lambdawUU) + betaUU * xiwUU * (muzstarUU^((1-iotamuUU)/(1-lambdawUU))) * ( (( (pitargetU(+1)^iotaw1UU) * (piU^(1-iotaw1UU)) * (pibarUU^(1-iotaw1UU-(1-iotaw1UU))) )^(1/(1-lambdawUU))) / piU(+1) ) * ( (1/( piU(+1)*muzstarU(+1)*wU(+1)/wU )) ^ (lambdawUU/(1-lambdawUU)) ) * (muzstarU(+1)^(iotamuUU/(1-lambdawUU)-1)) * FwXU(+1) - FwXU;
zetacU*((wstarU^(lambdawUU/(lambdawUU-1))*hU)^(1+sigmaLXUU)) + betaUU * xiwUU * (( (( (pitargetU(+1)^iotaw1UU) * (piU^(1-iotaw1UU)) * (pibarUU^(1-iotaw1UU-(1-iotaw1UU))) )/( piU(+1)*muzstarU(+1)*wU(+1)/wU )) * (muzstarUU^(1-iotamuUU)) * (muzstarU(+1)^iotamuUU) )  ^ (lambdawUU*(1+sigmaLXUU)/(1-lambdawUU))) * ( ( ( (1 - xiwUU * ( ( (( (pitargetU(+1)^iotaw1UU) * (piU^(1-iotaw1UU)) * (pibarUU^(1-iotaw1UU-(1-iotaw1UU))) )/( piU(+1)*muzstarU(+1)*wU(+1)/wU )) * (muzstarUU^(1-iotamuUU)) * (muzstarU(+1)^iotamuUU) ) ^ (1/(1-lambdawUU)) ) ) / (1-xiwUU) ) ^ (1-lambdawUU*(1+sigmaLXUU)) ) * wU(+1) * FwXU(+1)/psiLXUU ) - ( ( ( (1 - xiwUU * ( ( (( (pitargetU^iotaw1UU) * (piU(-1)^(1-iotaw1UU)) * (pibarUU^(1-iotaw1UU-(1-iotaw1UU))) )/( piU*muzstarU*wU/wU(-1) )) * (muzstarUU^(1-iotamuUU)) * (muzstarU^iotamuUU) ) ^ (1/(1-lambdawUU)) ) ) / (1-xiwUU) )   ^ (1-lambdawUU*(1+sigmaLXUU)) ) * wU   * FwXU/psiLXUU );

// A.24: choice of Tt
-lambdazU + (betaUU*lambdazU(+1)/(muzstarU(+1)*piU(+1)))*(1+ReXU);

// A.28: policy rule
//log(ReXU)-log(ReXUU) - rhotilUU*(log(ReXU(-1)) -log(ReXUU)) -(1/ReXUU)*(1-rhotilUU)*piUU*( log(pitargetU) -log(piUU) ) - (1/ReXUU)*(1-rhotilUU)*aptilUU*piUU*(log(piU(+1)) - log(pitargetU)) - (1/(4*ReXUU))*(1-rhotilUU)*aytilUU*( cUU/( (cUU+iUU)/(1-etagUU) )*log(cU)+iUU/( (cUU+iUU)/(1-etagUU) )*log(iU)-iUU/( (cUU+iUU)/(1-etagUU) )*log(muupU)+gUU/( (cUU+iUU)/(1-etagUU) )*log(gU)  - (cUU/( (cUU+iUU)/(1-etagUU) )*log(cUU)+iUU/( (cUU+iUU)/(1-etagUU) )*log(iUU)+gUU/( (cUU+iUU)/(1-etagUU) )*log(gUU)) )   - (1/(400*ReXUU))*(e_xpU);

// A.30: resource constraint
((pstarU^(lambdafU/(lambdafU-1))) * ( epsilU * ( (uU*kbarU(-1)/(muzstarU*upsilUU))^alphaUU ) * ( ( hU*(wstarU ^ (lambdawUU/(lambdawUU-1)) ) )^(1-alphaUU) ) - phiUU ) )-gU-cU-iU/muupU-tauoU*( rkUU*(exp(sigmaaUU*(uU-1))-1)/sigmaaUU )*kbarU(-1)/(muzstarU*upsilUU)-( ( ( normcdf(( (log(omegabarU)+sigmaU(-1)^2/2)/sigmaU(-1) )-sigmaU(-1))+omegabarU*(1-normcdf(( (log(omegabarU)+sigmaU(-1)^2/2)/sigmaU(-1) ))) )-( (1-muUU)*normcdf(( (log(omegabarU)+sigmaU(-1)^2/2)/sigmaU(-1) )-sigmaU(-1))+omegabarU*(1-normcdf(( (log(omegabarU)+sigmaU(-1)^2/2)/sigmaU(-1) ))) ) )*(1+RkXU)*qU(-1)*kbarU(-1)/(muzstarU*piU) )-bigthetaUU*(1-gammaU)*(nU-weUU)/gammaU;

// A.32: total bank loans
btotU - (qU(-1)*kbarU(-1)-nU(-1))/(piU*muzstarU);

// FLEXIBLE PRICE EQUILIBRIUM EQUATIONS
-sflexU+((1-alphaUU)^(alphaUU-1)*alphaUU^(-alphaUU))*(rkflexU^alphaUU)*(wflexU^(1-alphaUU))/epsilU;
rkflexU/( alphaUU*epsilU*( (upsilUU*muzstarU*hflexU/(uflexU*kbarflexU(-1)))^(1-alphaUU) ) )-sflexU;
lambdazflexU*(( epsilU * ( (uflexU*kbarflexU(-1)/(muzstarU*upsilUU))^alphaUU ) * (hflexU^(1-alphaUU) ) - phiUU ) ) - FpXflexU;
lambdafU*lambdazflexU*(( epsilU * ( (uflexU*kbarflexU(-1)/(muzstarU*upsilUU))^alphaUU ) * (hflexU^(1-alphaUU) ) - phiUU ) )*sflexU - FpXflexU;
YflexU - ( epsilU * ( (uflexU*kbarflexU(-1)/(muzstarU*upsilUU))^alphaUU ) * (hflexU^(1-alphaUU) ) - phiUU );
lambdazflexU*qflexU*( -( ( sqrt(SdouprXUU/2) )*exp(( sqrt(SdouprXUU/2) )*(( zetaiU*iflexU*muzstarU*upsilUU/iflexU(-1) )-muzstarUU*upsilUU))-( sqrt(SdouprXUU/2) )*exp(-( sqrt(SdouprXUU/2) )*(( zetaiU*iflexU*muzstarU*upsilUU/iflexU(-1) )-muzstarUU*upsilUU)) )*( zetaiU*iflexU*muzstarU*upsilUU/iflexU(-1) )+1-( exp(( sqrt(SdouprXUU/2) )*(( zetaiU*iflexU*muzstarU*upsilUU/iflexU(-1) )-muzstarUU*upsilUU))+exp(-( sqrt(SdouprXUU/2) )*(( zetaiU*iflexU*muzstarU*upsilUU/iflexU(-1) )-muzstarUU*upsilUU))-2 ) )-(lambdazflexU/muupU)+betaUU*lambdazflexU(+1)*qflexU(+1)*( ( ( sqrt(SdouprXUU/2) )*exp(( sqrt(SdouprXUU/2) )*(( zetaiU(+1)*iflexU(+1)*muzstarU(+1)*upsilUU/iflexU )-muzstarUU*upsilUU))-( sqrt(SdouprXUU/2) )*exp(-( sqrt(SdouprXUU/2) )*(( zetaiU(+1)*iflexU(+1)*muzstarU(+1)*upsilUU/iflexU )-muzstarUU*upsilUU)) )*(( zetaiU(+1)*iflexU(+1)*muzstarU(+1)*upsilUU/iflexU )^2) )/(muzstarU(+1)*upsilUU);
kbarflexU-(1-deltaUU)*(kbarflexU(-1)/(muzstarU*upsilUU))-(1-( exp(( sqrt(SdouprXUU/2) )*(( zetaiU*iflexU*muzstarU*upsilUU/iflexU(-1) )-muzstarUU*upsilUU))+exp(-( sqrt(SdouprXUU/2) )*(( zetaiU*iflexU*muzstarU*upsilUU/iflexU(-1) )-muzstarUU*upsilUU))-2 ))*iflexU;
rkflexU - tauoU*rkUU*exp(sigmaaUU*(uflexU-1));
RkXflexU - ( ( (1-taukUU)*(uflexU*rkflexU-tauoU*( rkUU*(exp(sigmaaUU*(uflexU-1))-1)/sigmaaUU ))+(1-deltaUU)*qflexU)*piflexU/(upsilUU*qflexU(-1)) + taukUU*deltaUU - 1);
(1-( normcdf(( (log(omegabarflexU(+1))+sigmaU^2/2)/sigmaU )-sigmaU)+omegabarflexU(+1)*(1-normcdf(( (log(omegabarflexU(+1))+sigmaU^2/2)/sigmaU ))) ))*( (1+RkXflexU(+1))/(1+ReXflexU) )+( (1-( normcdf((log(omegabarflexU(+1))+sigmaU^2/2)/sigmaU) ))/(1-( normcdf((log(omegabarflexU(+1))+sigmaU^2/2)/sigmaU) )-muUU*omegabarflexU(+1)*( normpdf((log(omegabarflexU(+1))+sigmaU^2/2)/sigmaU)/omegabarflexU(+1)/sigmaU )) )*(( (1+RkXflexU(+1))/(1+ReXflexU) )*( (1-muUU)*normcdf(( (log(omegabarflexU(+1))+sigmaU^2/2)/sigmaU )-sigmaU)+omegabarflexU(+1)*(1-normcdf(( (log(omegabarflexU(+1))+sigmaU^2/2)/sigmaU ))) )-1);
(qflexU(-1)*kbarflexU(-1)*(1+RkXflexU)*( (1-muUU)*normcdf(( (log(omegabarflexU)+sigmaU(-1)^2/2)/sigmaU(-1) )-sigmaU(-1))+omegabarflexU*(1-normcdf(( (log(omegabarflexU)+sigmaU(-1)^2/2)/sigmaU(-1) ))) )/(nflexU(-1)*(1+ReXflexU(-1))))-(qflexU(-1)*kbarflexU(-1)/nflexU(-1))+1;
-nflexU+(gammaU/(piflexU*muzstarU))*(RkXflexU-ReXflexU(-1)-( ( normcdf(( (log(omegabarflexU)+sigmaU(-1)^2/2)/sigmaU(-1) )-sigmaU(-1))+omegabarflexU*(1-normcdf(( (log(omegabarflexU)+sigmaU(-1)^2/2)/sigmaU(-1) ))) )-( (1-muUU)*normcdf(( (log(omegabarflexU)+sigmaU(-1)^2/2)/sigmaU(-1) )-sigmaU(-1))+omegabarflexU*(1-normcdf(( (log(omegabarflexU)+sigmaU(-1)^2/2)/sigmaU(-1) ))) ) )*(1+RkXflexU))*kbarflexU(-1)*qflexU(-1)+weUU+gammaU*(1+ReXflexU(-1))*nflexU(-1)/(piflexU*muzstarU);
(1+taucUU)*lambdazflexU-(muzstarU*zetacU/(cflexU*muzstarU-bUU*cflexU(-1)))+bUU*betaUU*zetacU(+1)/(cflexU(+1)*muzstarU(+1)-bUU*cflexU);
hflexU*(1-taulUU)*lambdazflexU/lambdawUU - FwXflexU;
zetacU*(hflexU^(1+sigmaLXUU)) - wflexU* FwXflexU/psiLXUU;
-lambdazflexU + (betaUU*lambdazflexU(+1)/(muzstarU(+1)*piflexU(+1)))*(1+ReXflexU);
log(ReXflexU)-log(ReXUU) - rhotilUU*(log(ReXflexU(-1)) -log(ReXUU)) -(1/ReXUU)*(1-rhotilUU)*piUU*( log(pitargetU) -log(piUU) ) - (1/ReXUU)*(1-rhotilUU)*aptilUU*piUU*(log(piflexU(+1)) - log(pitargetU)) - (1/(4*ReXUU))*(1-rhotilUU)*aytilUU*( cUU/( (cUU+iUU)/(1-etagUU) )*log(cflexU)+iUU/( (cUU+iUU)/(1-etagUU) )*log(iflexU)-iUU/( (cUU+iUU)/(1-etagUU) )*log(muupU)+gUU/( (cUU+iUU)/(1-etagUU) )*log(gU)  - (cUU/( (cUU+iUU)/(1-etagUU) )*log(cUU)+iUU/( (cUU+iUU)/(1-etagUU) )*log(iUU)+gUU/( (cUU+iUU)/(1-etagUU) )*log(gUU)) );
( epsilU * ( (uflexU*kbarflexU(-1)/(muzstarU*upsilUU))^alphaUU ) * (hflexU^(1-alphaUU) ) - phiUU )-gU-cflexU-iflexU/muupU-tauoU*( rkUU*(exp(sigmaaUU*(uflexU-1))-1)/sigmaaUU )*kbarflexU(-1)/(muzstarU*upsilUU)-( ( ( normcdf(( (log(omegabarflexU)+sigmaU(-1)^2/2)/sigmaU(-1) )-sigmaU(-1))+omegabarflexU*(1-normcdf(( (log(omegabarflexU)+sigmaU(-1)^2/2)/sigmaU(-1) ))) )-( (1-muUU)*normcdf(( (log(omegabarflexU)+sigmaU(-1)^2/2)/sigmaU(-1) )-sigmaU(-1))+omegabarflexU*(1-normcdf(( (log(omegabarflexU)+sigmaU(-1)^2/2)/sigmaU(-1) ))) ) )*(1+RkXflexU)*qflexU(-1)*kbarflexU(-1)/(muzstarU*piflexU) )-bigthetaUU*(1-gammaU)*(nflexU-weUU)/gammaU;
btotflexU - (qflexU(-1)*kbarflexU(-1)-nflexU(-1))/(piflexU*muzstarU);



// Shock Equations
// Equations take the form: x = x_ *(1+e_x) + rho_x*(x(-1) - x_),
// where x_ is steady-state value, and e_x is iid shock with stderror std_x

lambdafU = lambdafUU* ( 1 + e_lambdafU) + rho1_lambdafU * ( lambdafU(-1) - lambdafUU );
pitargetU = pitargetUU* ( 1 + e_pitargetU) + rho1_pitargetU * ( pitargetU(-1) - pitargetUU );

muupU = muupUU* ( 1 + e_muupU) + rho1_muupU * ( muupU(-1) - muupUU );

gU = gUU* ( 1 + e_gU) + rho1_gU * ( gU(-1) - gUU );
muzstarU = muzstarUU* ( 1 + e_muzstarU) + rho1_muzstarU * ( muzstarU(-1) - muzstarUU );
gammaU = gammaUU* ( 1 + e_gammaU) + rho1_gammaU * ( gammaU(-1) - gammaUU );
epsilU = epsilUU* ( 1 + e_epsilU) + rho1_epsilU * ( epsilU(-1) - epsilUU );
sigmaU = sigmaUU* ( 1 + e_sigmaU) + rho1_sigmaU * ( sigmaU(-1) - sigmaUU );
zetacU = zetacUU;
zetaiU = zetaiUU* ( 1 + e_zetaiU) + rho1_zetaiU * ( zetaiU(-1) - zetaiUU );
tauoU = tauoUU* ( 1 + e_tauoU) + rho1_tauoU * ( tauoU(-1) - tauoUU );

end;

// Initial values, coinciding with steady-state values
initval;

piU = piUU;
sU = sUU;
rkU = rkUU;
iU = iUU;
uU = uUU;
omegabarU = omegabarUU;
RkXU = RkXUU;
nU = nUU;
qU = qUU;
lambdazU = lambdazUU;
cU = cUU;
wU = wUU;
hU = hUU;
kbarU = kbarUU;
ReXU = ReXUU;
btotU = btotUU;
pstarU = pstarUU;
wstarU = wstarUU;
FpXU = FpXUU;
FwXU = FwXUU;
YU = YUU;

piflexU = piUU;
sflexU = sUU;
rkflexU = rkUU;
iflexU = iUU;
uflexU = uUU;
omegabarflexU = omegabarUU;
RkXflexU = RkXUU;
nflexU = nUU;
qflexU = qUU;
lambdazflexU = lambdazUU;
cflexU = cUU;
wflexU = wUU;
hflexU = hUU;
kbarflexU = kbarUU;
ReXflexU = ReXUU;
btotflexU = btotUU;
FpXflexU = FpXflexUU;
FwXflexU = FwXflexUU;
YflexU = YUU;

lambdafU = lambdafUU;
pitargetU = pitargetUU;
muupU = muupUU;
gU = gUU;
muzstarU = muzstarUU;
gammaU = gammaUU;
epsilU = epsilUU;
sigmaU = sigmaUU;
zetacU = zetacUU;
zetaiU = zetaiUU;
tauoU = tauoUU;


interest   = 0;
inflation  = 0;
inflationq = 0;
outputgap  = 0;
output     = 0;

end;

shocks;
var e_lambdafU; stderr std1_lambdafU;
var e_pitargetU; stderr std1_pitargetU;

var e_muupU; stderr std1_muupU;

var e_gU; stderr std1_gU;
var e_muzstarU; stderr std1_muzstarU;
var e_gammaU; stderr std1_gammaU;
var e_epsilU; stderr std1_epsilU;
var e_sigmaU; stderr std1_sigmaU;
//var e_zetacU; stderr std1_zetacU;
var e_zetaiU; stderr std1_zetaiU;
var e_tauoU; stderr std1_tauoU;

//var interest_ = 0;//var interest_; stderr 1;//;
var interest_; stderr 0;
end;

//check;
//steady(solve_algo=4);

//stoch_simul(order=1,irf=20) YU cU iU hU ReXU piU nU btotU RkXU;

//some_plots
