%% Steady State File
% Ellison, M. and Tischbirek, A.: ``Unconventional government debt 
% purchases as a supplement to conventional monetary policy''
% In: Journal of Economic Dynamics and Control (2014), no. 43, pp. 199–217.

%%
function [ys,params,check] = NK_ET14_steadystate(ys,exo,M_,options_)
%global M_
%% DO NOT CHANGE THIS PART.
%%
%% Here we load the values of the deep parameters in a loop.
%%
NumberOfParameters = M_.param_nbr;                            % Number of deep parameters.
for ii = 1:NumberOfParameters                                  % Loop...
    %paramname = deblank(M_.param_names(ii,:));                   %    Get the name of parameter i.
    paramname = M_.param_names{ii};
    eval([ paramname ' = M_.params(' int2str(ii) ');']);         %    Get the value of parameter i.
    eval([ 'params.' paramname '= M_.params(' int2str(ii) ');']);
end                                                           % End of the loop.
check = 0;
%%
%% END OF THE FIRST MODEL INDEPENDENT BLOCK.

%---------------------------------------------------------------------------
% 1. Steady States Sticky Price Economy
%----------------------------------------------------------------

A       = log(1);                                                                                                                           %(B.26)
ChiC    = log(1);                                                                                                                           %(B.26)
ChiL    = log(1);                                                                                                                           %(B.26)
nu      = log(1);                                                                                                                           %(B.26)
ksi     = log(1);                                                                                                                           %(B.26)
Pi      = SSPi;                                                                                                                             % Calibration
theta   = SStheta;                                                                                                                          % Calibration
epsG    = 0;
fispol  = 0;

D       = log((1-alfa)/(1-alfa*exp(Pi)^(exp(theta)*phi))*((1-alfa*exp(Pi)^(exp(theta)-1))/(1-alfa))^(exp(theta)*phi/(exp(theta)-1)));       %(B.27)
Y       = log(((1-alfa*betta*exp(Pi)^(exp(theta)-1))/(1-alfa*betta*exp(Pi)^(exp(theta)*phi))*...                                            %(B.28)
          exp(theta)*phi/(exp(theta)-1)*(exp(D))^(psii)*(1-gbar)^delta*...
         ((1-alfa*(exp(Pi))^(exp(theta)-1))/(1-alfa))^((exp(theta)*(phi-1)+1)/(exp(theta)-1)))^(1/(1-delta-phi*(psii+1))));                 
G       = log(gbar*exp(Y));                                                                                                                 %(B.29)
C       = log(exp(Y)-exp(G));                                                                                                               %(B.30)
F       = log(exp(Y)*exp(C)^(-delta)/(1-alfa*betta*exp(Pi)^(exp(theta)-1)));                                                                %(B.31)
K       = log(1/(1-alfa*betta*exp(Pi)^(exp(theta)*phi))*exp(theta)*phi/(exp(theta)-1)*exp(D)^(psii)*exp(Y)^(phi*(psii+1)));                 %(B.32)
L       = log(exp(D)*exp(Y)^(phi));                                                                                                         %(B.33)
w       = log(exp(L)^(psii)*exp(C)^(delta));                                                                                                %(B.34)
Ps      = log(betta/exp(Pi));                                                                                                               %(B.35)
qCB     = 0;                                                                                                                                %(B.36)
qbar    = log(f*exp(Y));                                                                                                                    %(B.37)
q       = qbar;                                                                                                                             %(B.38)
s       = log(exp(Pi)/(1-betta)*(exp(C) + exp(G) - tpi*exp(w)*exp(L) - (1-tpi)*exp(Y)));                                                  %(B.39)
b       = log(exp(s) - exp(qbar)/tau*(1-1/(exp(Pi)^(tau)))*exp(Pi)/(exp(Pi)-1));                                                            %(B.40)
Pss     = log(exp(Ps)*exp(s));                                                                                                              % added additionally

params.Ps=Ps;
params.s=s;
params.q=q;
params.b=b;
switch_print    =   'no';
switches.switch_print    =  switch_print;  %'test' for too many details, 'details', 'yes', 'no'
switch switch_print
    case 'details'
        options     =   optimset('Display','iter');
    case 'test'
        options     =   optimset('Display','iter');
    otherwise
        options     =   optimset('Display','off');
end;

if isoctave==0
[XX,diff,exitf]     =   fsolve(@f_PB_PQ,[3 3],options,params);                                                                              
ssPB=XX(1);
ssPQ=XX(2);
PB=ssPB;                                                                                                                                    %(B.41)
PQ=ssPQ;                                                                                                                                    %(B.42)
params.ssPQ=ssPQ;
i = log(1/exp(PB));                                                                                                                         %(B.43)   
[XX,diff,exitf]     =   fsolve(@f_i_Q,2,options,params);
iQ=XX;                                                                                                                                      %(B.44)
else
PB=-0.012269;
PQ=-0.113471;
params.ssPQ=PQ;
i = log(1/exp(PB));   
iQ= 0.0109982;
end

%[XX,diff,exitf]     =   fsolve(@f_PB_PQ,[3 3],options,params);                                                                              
%ssPB=XX(1);
%ssPQ=XX(2);
%PB=ssPB;                                                                                                                                    %(B.41)
%PQ=ssPQ;                                                                                                                                    %(B.42)
%params.ssPQ=ssPQ;
%i = log(1/exp(PB));                                                                                                                         %(B.43)   
%[XX,diff,exitf]     =   fsolve(@f_i_Q,2,options,params);
%iQ=XX;                                                                                                                                      %(B.44)

%---------------------------------------------------------------------------
% 2. Steady States in Flex Price Economy
%---------------------------------------------------------------------------

Yf = log(((1-alfaf*betta*exp(Pi)^(exp(theta)-1))/(1-alfaf*betta*exp(Pi)^(exp(theta)*phi))...
     *exp(theta)*phi/(exp(theta)-1)*(1-gbar)^(delta)...
     *((1-alfaf*exp(Pi)^(exp(theta)-1))/(1-alfaf))^((exp(theta)*(phi-1)+1)/(exp(theta)-1)))^(1/(1-delta-phi*(psii+1))));                    %(B.28)
Gf = log(gbar*exp(Yf));                                                                                                                     %(B.29)
%---------------------------------------------------------------------------
% 3. MMB Variables
%---------------------------------------------------------------------------

interest   = 0;
inflation  = 0;
inflationq = 0;
output     = 0;
outputgap  = 0;


%%
%% END OF THE MODEL SPECIFIC BLOCK.


%% DO NOT CHANGE THIS PART.
%%
%% Here we define the steady state values of the endogenous variables of
%% the model.
%%
params=NaN(NumberOfParameters,1);
for iter = 1:length(M_.params) %update parameters set in the file
  eval([ 'params(' num2str(iter) ') = ' M_.param_names{iter} ';' ])
end

NumberOfEndogenousVariables = M_.orig_endo_nbr;                % Number of endogenous variables.
ys = zeros(NumberOfEndogenousVariables,1);                     % Initialization of ys (steady state).
for ii = 1:NumberOfEndogenousVariables                         % Loop...
    %varname = deblank(M_.endo_names(ii,:));                    % Get the name of endogenous variable i.
    varname = M_.endo_names{ii};
    eval(['ys(' int2str(ii) ') = ' varname ';']);              % Get the steady state value of this variable.
end


