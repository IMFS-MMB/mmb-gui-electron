function [residual, g1, g2] = NK_LWW03AL_static(y, x, params)
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

residual = zeros( 15, 1);

%
% Model equations
%

lhs =y(8);
rhs =y(3);
residual(1)= lhs-rhs;
lhs =y(9);
rhs =y(7);
residual(2)= lhs-rhs;
lhs =y(10);
rhs =y(2);
residual(3)= lhs-rhs;
lhs =y(13);
rhs =y(10);
residual(4)= lhs-rhs;
lhs =y(14);
rhs =y(13);
residual(5)= lhs-rhs;
lhs =y(15);
rhs =y(13)+y(14);
residual(6)= lhs-rhs;
lhs =y(11);
rhs =y(1);
residual(7)= lhs-rhs;
lhs =y(12);
rhs =y(1);
residual(8)= lhs-rhs;
lhs =y(7);
rhs =0.25*(y(14)+y(14)+y(10)+y(13));
residual(9)= lhs-rhs;
lhs =y(8);
rhs =y(8)*params(1)+y(10)*params(5)+y(10)*params(6)+y(13)*params(7)+y(14)*params(8)+y(10)*params(10)+y(11)*params(14)+y(11)*params(15)+y(12)*params(23)+y(12)*params(24)+params(32)*x(3);
residual(10)= lhs-rhs;
lhs =y(1);
rhs =y(1)-0.25*params(36)*(y(3)-y(2)-y(4));
residual(11)= lhs-rhs;
lhs =y(2);
rhs =y(2)*params(35)+y(1)*4*params(37)+y(6);
residual(12)= lhs-rhs;
residual(13) = y(5);
lhs =y(4);
rhs =y(4)*params(39)+x(1);
residual(14)= lhs-rhs;
lhs =y(6);
rhs =y(6)*params(40)+x(2);
residual(15)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(15, 15);

  %
  % Jacobian matrix
  %

  g1(1,3)=(-1);
  g1(1,8)=1;
  g1(2,7)=(-1);
  g1(2,9)=1;
  g1(3,2)=(-1);
  g1(3,10)=1;
  g1(4,10)=(-1);
  g1(4,13)=1;
  g1(5,13)=(-1);
  g1(5,14)=1;
  g1(6,13)=(-1);
  g1(6,14)=(-1);
  g1(6,15)=1;
  g1(7,1)=(-1);
  g1(7,11)=1;
  g1(8,1)=(-1);
  g1(8,12)=1;
  g1(9,7)=1;
  g1(9,10)=(-0.25);
  g1(9,13)=(-0.25);
  g1(9,14)=(-0.5);
  g1(10,8)=1-params(1);
  g1(10,10)=(-(params(10)+params(5)+params(6)));
  g1(10,11)=(-(params(14)+params(15)));
  g1(10,12)=(-(params(23)+params(24)));
  g1(10,13)=(-params(7));
  g1(10,14)=(-params(8));
  g1(11,2)=(-(0.25*params(36)));
  g1(11,3)=0.25*params(36);
  g1(11,4)=(-(0.25*params(36)));
  g1(12,1)=(-(4*params(37)));
  g1(12,2)=1-params(35);
  g1(12,6)=(-1);
  g1(13,5)=1;
  g1(14,4)=1-params(39);
  g1(15,6)=1-params(40);
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],15,225);
end
end
