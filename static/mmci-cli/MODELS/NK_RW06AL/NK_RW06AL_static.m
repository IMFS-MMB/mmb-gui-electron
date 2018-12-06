function [residual, g1, g2] = NK_RW06AL_static(y, x, params)
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

residual = zeros( 12, 1);

%
% Model equations
%

lhs =y(4);
rhs =y(3)*4;
residual(1)= lhs-rhs;
lhs =y(9);
rhs =y(6);
residual(2)= lhs-rhs;
lhs =y(10);
rhs =y(9);
residual(3)= lhs-rhs;
lhs =y(11);
rhs =y(9)+y(10);
residual(4)= lhs-rhs;
lhs =y(5);
rhs =y(12);
residual(5)= lhs-rhs;
lhs =y(6);
rhs =4*y(2);
residual(6)= lhs-rhs;
lhs =y(7);
rhs =y(1);
residual(7)= lhs-rhs;
lhs =y(8);
rhs =y(1);
residual(8)= lhs-rhs;
lhs =y(12);
rhs =0.25*(y(11)+y(6)+y(6));
residual(9)= lhs-rhs;
lhs =y(4);
rhs =y(4)*params(1)+y(6)*params(5)+y(6)*params(6)+y(9)*params(7)+y(10)*params(8)+y(6)*params(10)+y(7)*params(14)+y(7)*params(15)+y(8)*params(23)+y(8)*params(24)+params(32)*x(2);
residual(10)= lhs-rhs;
lhs =y(1);
rhs =y(1)-1/params(35)*(y(3)-y(2))+x(1);
residual(11)= lhs-rhs;
lhs =y(2);
rhs =y(2)*params(37)+y(1)*params(39)*(params(35)+params(36))+y(3)*params(39);
residual(12)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(12, 12);

  %
  % Jacobian matrix
  %

  g1(1,3)=(-4);
  g1(1,4)=1;
  g1(2,6)=(-1);
  g1(2,9)=1;
  g1(3,9)=(-1);
  g1(3,10)=1;
  g1(4,9)=(-1);
  g1(4,10)=(-1);
  g1(4,11)=1;
  g1(5,5)=1;
  g1(5,12)=(-1);
  g1(6,2)=(-4);
  g1(6,6)=1;
  g1(7,1)=(-1);
  g1(7,7)=1;
  g1(8,1)=(-1);
  g1(8,8)=1;
  g1(9,6)=(-0.5);
  g1(9,11)=(-0.25);
  g1(9,12)=1;
  g1(10,4)=1-params(1);
  g1(10,6)=(-(params(10)+params(5)+params(6)));
  g1(10,7)=(-(params(14)+params(15)));
  g1(10,8)=(-(params(23)+params(24)));
  g1(10,9)=(-params(7));
  g1(10,10)=(-params(8));
  g1(11,2)=(-(1/params(35)));
  g1(11,3)=1/params(35);
  g1(12,1)=(-(params(39)*(params(35)+params(36))));
  g1(12,2)=1-params(37);
  g1(12,3)=(-params(39));
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],12,144);
end
end
