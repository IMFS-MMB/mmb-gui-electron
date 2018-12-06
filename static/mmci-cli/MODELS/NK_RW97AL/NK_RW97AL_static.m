function [residual, g1, g2] = NK_RW97AL_static(y, x, params)
%
% Status : Computes static model for Dynare
%
% Inputs : 
%   y         [M_.endo_nbr by 1] double    vector of endogenous variables in declaration order
%   x         [M_.exo_nbr by 1] double     vector of exogenous variables in declaration order
%   params    [M_.param_nbr by 1] double   vector of parameter values in declaration order
%
% Outputs:
%   residual  [M_.endo_nbr by 1] double    vector of residuals of the static model equations 
%                                          in order of declaration of the equations
%   g1        [M_.endo_nbr by M_.endo_nbr] double    Jacobian matrix of the static model equations;
%                                                     columns: variables in declaration order
%                                                     rows: equations in order of declaration
%   g2        [M_.endo_nbr by (M_.endo_nbr)^2] double   Hessian matrix of the static model equations;
%                                                       columns: variables in declaration order
%                                                       rows: equations in order of declaration
%
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

residual = zeros( 18, 1);

%
% Model equations
%

T100 = params(36)^(-1);
lhs =y(10);
rhs =y(5)*4;
residual(1)= lhs-rhs;
lhs =y(11);
rhs =0.25*(y(14)+y(12)+y(13)+y(14));
residual(2)= lhs-rhs;
lhs =y(12);
rhs =4*y(1);
residual(3)= lhs-rhs;
lhs =y(13);
rhs =y(12);
residual(4)= lhs-rhs;
lhs =y(14);
rhs =y(13);
residual(5)= lhs-rhs;
lhs =y(15);
rhs =y(13)+y(14);
residual(6)= lhs-rhs;
lhs =y(16);
rhs =y(6);
residual(7)= lhs-rhs;
lhs =y(17);
rhs =y(2);
residual(8)= lhs-rhs;
lhs =y(18);
rhs =y(9);
residual(9)= lhs-rhs;
lhs =y(10);
rhs =y(17)*params(24)+y(17)*params(23)+y(17)*params(24)+y(17)*params(23)+y(10)*params(1)+y(12)*params(5)+y(12)*params(6)+y(13)*params(7)+y(14)*params(8)+y(12)*params(10)+y(16)*params(14)+y(16)*params(15)+params(32)*x(2);
residual(10)= lhs-rhs;
lhs =y(18);
rhs =params(34)*x(3);
residual(11)= lhs-rhs;
lhs =y(1);
rhs =y(1)*params(35)+y(6)*params(40)+y(7);
residual(12)= lhs-rhs;
lhs =y(7);
rhs =y(7)*params(41)+x(1);
residual(13)= lhs-rhs;
lhs =y(6);
rhs =y(6)-params(36)*(y(5)-y(1)-y(4));
residual(14)= lhs-rhs;
residual(15) = y(4);
lhs =y(3);
rhs =T100*y(8)/(T100+params(39));
residual(16)= lhs-rhs;
lhs =y(6);
rhs =y(2)-y(3);
residual(17)= lhs-rhs;
lhs =y(8);
rhs =y(9)+y(8)*params(42);
residual(18)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(18, 18);

  %
  % Jacobian matrix
  %

  g1(1,5)=(-4);
  g1(1,10)=1;
  g1(2,11)=1;
  g1(2,12)=(-0.25);
  g1(2,13)=(-0.25);
  g1(2,14)=(-0.5);
  g1(3,1)=(-4);
  g1(3,12)=1;
  g1(4,12)=(-1);
  g1(4,13)=1;
  g1(5,13)=(-1);
  g1(5,14)=1;
  g1(6,13)=(-1);
  g1(6,14)=(-1);
  g1(6,15)=1;
  g1(7,6)=(-1);
  g1(7,16)=1;
  g1(8,2)=(-1);
  g1(8,17)=1;
  g1(9,9)=(-1);
  g1(9,18)=1;
  g1(10,10)=1-params(1);
  g1(10,12)=(-(params(10)+params(5)+params(6)));
  g1(10,13)=(-params(7));
  g1(10,14)=(-params(8));
  g1(10,16)=(-(params(14)+params(15)));
  g1(10,17)=(-(params(24)+params(23)+params(24)+params(23)));
  g1(11,18)=1;
  g1(12,1)=1-params(35);
  g1(12,6)=(-params(40));
  g1(12,7)=(-1);
  g1(13,7)=1-params(41);
  g1(14,1)=(-params(36));
  g1(14,4)=(-params(36));
  g1(14,5)=params(36);
  g1(15,4)=1;
  g1(16,3)=1;
  g1(16,8)=(-(T100/(T100+params(39))));
  g1(17,2)=(-1);
  g1(17,3)=1;
  g1(17,6)=1;
  g1(18,8)=1-params(42);
  g1(18,9)=(-1);
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],18,324);
end
end
