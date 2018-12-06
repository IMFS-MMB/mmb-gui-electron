
%*************************************************************
% Steady State Kalman Filter
%
% Moyen S.
% May, 2008
%*************************************************************

function [KV] = Kalman_gain;

global M_

NumberOfParameters = M_.param_nbr;
for i = 1:NumberOfParameters
    paramname = deblank(M_.param_names(i,:));
    eval([ paramname ' = M_.params(' int2str(i) ');']);
end


F = [ rhopi 0; 0 rhor ];

H = [ (1-rho)*(1-gpi); 1];  

Q = [ spistar^2, 0; 0, sR^2 ];
vecP = inv(eye(4)-kron(F,F)) * Q(:);
EP   = reshape(vecP,2,2);
P0   = EP;
K0   = F*P0*H*inv(H'*P0*H);
j    = 1;
Pdiff = 1;
while Pdiff > 1e-10
    P = (F-K0*H')*P0*(F-K0*H')' + Q;
    K = F*P*H*inv(H'*P*H);
    Pdiff = max(max(abs(P-P0)));
    P0 = P;
    K0 = K;
    j = j + 1;
end;

Finv = inv(F);
KH = K*H';
FKH = F-KH;
FinvKH = Finv*KH;
KV = K;

