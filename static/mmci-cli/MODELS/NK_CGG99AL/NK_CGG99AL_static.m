function [residual, g1, g2] = NK_CGG99AL_static(y, x, params)
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

residual = zeros( 10, 1);

%
% Model equations
%

lhs =y(4);
rhs =y(2)*4;
residual(1)= lhs-rhs;
lhs =y(5);
rhs =0.25*(y(10)+y(6)+y(9)+y(10));
residual(2)= lhs-rhs;
lhs =y(6);
rhs =4*y(3);
residual(3)= lhs-rhs;
lhs =y(9);
rhs =y(6);
residual(4)= lhs-rhs;
lhs =y(10);
rhs =y(9);
residual(5)= lhs-rhs;
lhs =y(7);
rhs =y(1);
residual(6)= lhs-rhs;
lhs =y(8);
rhs =y(1);
residual(7)= lhs-rhs;
lhs =y(4);
rhs =y(4)*params(1)+y(6)*params(5)+y(6)*params(6)+y(9)*params(7)+y(10)*params(8)+y(6)*params(10)+y(7)*params(14)+y(7)*params(15)+y(8)*params(23)+y(8)*params(24)+params(32)*x(3);
residual(8)= lhs-rhs;
lhs =y(1);
rhs =params(36)*(y(2)-y(3))+y(1)*params(35)+y(1)*(1-params(35))+x(2);
residual(9)= lhs-rhs;
lhs =y(3);
rhs =y(1)*params(38)+y(3)*params(37)+y(3)*(1-params(37))*params(39)+x(1);
residual(10)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(10, 10);

  %
  % Jacobian matrix
  %

  g1(1,2)=(-4);
  g1(1,4)=1;
  g1(2,5)=1;
  g1(2,6)=(-0.25);
  g1(2,9)=(-0.25);
  g1(2,10)=(-0.5);
  g1(3,3)=(-4);
  g1(3,6)=1;
  g1(4,6)=(-1);
  g1(4,9)=1;
  g1(5,9)=(-1);
  g1(5,10)=1;
  g1(6,1)=(-1);
  g1(6,7)=1;
  g1(7,1)=(-1);
  g1(7,8)=1;
  g1(8,4)=1-params(1);
  g1(8,6)=(-(params(10)+params(5)+params(6)));
  g1(8,7)=(-(params(14)+params(15)));
  g1(8,8)=(-(params(23)+params(24)));
  g1(8,9)=(-params(7));
  g1(8,10)=(-params(8));
  g1(9,1)=1-(params(35)+1-params(35));
  g1(9,2)=(-params(36));
  g1(9,3)=params(36);
  g1(10,1)=(-params(38));
  g1(10,3)=1-(params(37)+(1-params(37))*params(39));
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],10,100);
end
end
