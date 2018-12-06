function diff = f_mom(XX,params,starting,moments, switches)

%Calculates difference from a vector of predetermined moments 
%Output:    diff: difference from the predetermined vector of moments
%Input:     XX: vector of starting values
%           params: structure of parameters

%Created by Peter Karadi
%June 2010

%Obtaining the starting values
omegaL  =   XX(1);
omegaI  =   XX(2);
lambda  =   XX(3);
chi     =   XX(4);

lambdaL =   lambda;
lambdaI =   lambda;

%Creating new structure for submitted parameters for f_KL
params_f    =   params;

%Adding the values to the parameters
params_f.omegaL   =   omegaL;
params_f.omegaI   =   omegaI;
params_f.lambdaL  =   lambdaL;
params_f.lambdaI  =   lambdaI;
params_f.chi      =   chi;

%Obtaining starting values
K0  =   starting.K0;
L0  =   starting.L0;

%Calculating the equilibrium K and N values given the parameters
switch switches.switch_print
    case 'test'
        options     =   optimset('Display','iter');
    otherwise
        options     =   optimset('Display','off');
end;
[XX_ss,fval,exitf]  =   fsolve(@f_KL,[K0 L0],options,params_f);

K    =   XX_ss(1);
L    =   XX_ss(2);

switch switches.switch_print
    case 'test'
        fprintf('\n K_ss: %2.2f\n',K);
        fprintf('L_ss: %2.2f\n',L);
        fprintf('diff: %1.8f, %1.8f\n',[fval(1) fval(2)]);
        fprintf('exitf: %1.0f\n',exitf);        
end;

%Creating variables from the original params structure
params_names     =   fieldnames(params);
nn=length(params_names);
for ii=1:nn
    eval([params_names{ii} '=params.' params_names{ii} ';']);
end;

%Calculating the moments given the values of K and L
%Calculating the premium
RkmR    =   alfa*K^(alfa-1)*L^(1-alfa)+1-delta-1/betta;

%Calculating the symmetric leverage
theta   =   thetaL;
aa      =   lambda*betta*theta*RkmR;   %symmetric leverage
bb      =   -(1-theta)*(lambda-betta*RkmR);
cc      =   (1-theta);
phi     =   (-bb-sqrt(bb^2-4*aa*cc))/(2*aa);

%Calculating the relative net worth of international and local banks
R       =   1/betta;
NL      =   omegaL*K/(1-theta*(RkmR*phi+R));
NI      =   omegaI*K/(1-theta*(RkmR*phi+R));
KIoK    =   NI/NL;

%Obtaining moments
moments_names   =   fieldnames(moments);
kk  =   length(moments_names);
for ii=1:kk
    eval([moments_names{ii} '=moments.' moments_names{ii} ';']);
end;

%Setting the differences
diff(1)     =   RkmR-RkmR_mom;
diff(2)     =   phi-phi_mom;
diff(3)     =   KIoK-KIoK_mom;
diff(4)     =   L-L_mom;
