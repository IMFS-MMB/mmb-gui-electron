function [residual, g1, g2, g3] = US_MI07AL_static(y, x, params)
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
%                                          in order of declaration of the equations.
%                                          Dynare may prepend or append auxiliary equations, see M_.aux_vars
%   g1        [M_.endo_nbr by M_.endo_nbr] double    Jacobian matrix of the static model equations;
%                                                       columns: variables in declaration order
%                                                       rows: equations in order of declaration
%   g2        [M_.endo_nbr by (M_.endo_nbr)^2] double   Hessian matrix of the static model equations;
%                                                       columns: variables in declaration order
%                                                       rows: equations in order of declaration
%   g3        [M_.endo_nbr by (M_.endo_nbr)^3] double   Third derivatives matrix of the static model equations;
%                                                       columns: variables in declaration order
%                                                       rows: equations in order of declaration
%
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

residual = zeros( 15, 1);

%
% Model equations
%

T87 = ((1-params(35)*params(40))*params(36))^(-1);
lhs =y(8);
rhs =y(1)*4;
residual(1)= lhs-rhs;
lhs =y(13);
rhs =y(10);
residual(2)= lhs-rhs;
lhs =y(14);
rhs =y(13);
residual(3)= lhs-rhs;
lhs =y(15);
rhs =y(13)+y(14);
residual(4)= lhs-rhs;
lhs =y(10);
rhs =4*y(2);
residual(5)= lhs-rhs;
lhs =y(11);
rhs =y(4);
residual(6)= lhs-rhs;
lhs =y(12);
rhs =y(4);
residual(7)= lhs-rhs;
lhs =y(9);
rhs =0.25*(y(14)+y(14)+y(13)+y(10));
residual(8)= lhs-rhs;
lhs =y(8);
rhs =y(8)*params(1)+y(10)*params(5)+y(10)*params(6)+y(13)*params(7)+y(14)*params(8)+y(10)*params(10)+y(11)*params(14)+y(11)*params(15)+y(12)*params(23)+y(12)*params(24)+params(32)*x(3);
residual(9)= lhs-rhs;
lhs =y(5);
rhs =y(5)-(1-params(35)*params(40))*params(36)*(y(1)-y(2)-y(6));
residual(10)= lhs-rhs;
lhs =y(3);
rhs =params(38)*(y(4)*params(39)+y(5)*T87)+params(35)*y(3)+y(7);
residual(11)= lhs-rhs;
lhs =y(3);
rhs =y(2)-y(2)*params(37);
residual(12)= lhs-rhs;
lhs =y(5);
rhs =y(4)-y(4)*params(40)-params(35)*params(40)*(y(4)-y(4)*params(40));
residual(13)= lhs-rhs;
lhs =y(6);
rhs =y(6)*params(41)+x(1);
residual(14)= lhs-rhs;
lhs =y(7);
rhs =y(7)*params(42)+x(2);
residual(15)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(15, 15);

  %
  % Jacobian matrix
  %

  g1(1,1)=(-4);
  g1(1,8)=1;
  g1(2,10)=(-1);
  g1(2,13)=1;
  g1(3,13)=(-1);
  g1(3,14)=1;
  g1(4,13)=(-1);
  g1(4,14)=(-1);
  g1(4,15)=1;
  g1(5,2)=(-4);
  g1(5,10)=1;
  g1(6,4)=(-1);
  g1(6,11)=1;
  g1(7,4)=(-1);
  g1(7,12)=1;
  g1(8,9)=1;
  g1(8,10)=(-0.25);
  g1(8,13)=(-0.25);
  g1(8,14)=(-0.5);
  g1(9,8)=1-params(1);
  g1(9,10)=(-(params(10)+params(5)+params(6)));
  g1(9,11)=(-(params(14)+params(15)));
  g1(9,12)=(-(params(23)+params(24)));
  g1(9,13)=(-params(7));
  g1(9,14)=(-params(8));
  g1(10,1)=(1-params(35)*params(40))*params(36);
  g1(10,2)=(-((1-params(35)*params(40))*params(36)));
  g1(10,6)=(-((1-params(35)*params(40))*params(36)));
  g1(11,3)=1-params(35);
  g1(11,4)=(-(params(38)*params(39)));
  g1(11,5)=(-(params(38)*T87));
  g1(11,7)=(-1);
  g1(12,2)=(-(1-params(37)));
  g1(12,3)=1;
  g1(13,4)=(-(1-params(40)-params(35)*params(40)*(1-params(40))));
  g1(13,5)=1;
  g1(14,6)=1-params(41);
  g1(15,7)=1-params(42);
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],15,225);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],15,3375);
end
end
end
end
