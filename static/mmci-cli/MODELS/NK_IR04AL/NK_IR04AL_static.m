function [residual, g1, g2] = NK_IR04AL_static(y, x, params)
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

residual = zeros( 16, 1);

%
% Model equations
%

lhs =y(9);
rhs =4*y(4);
residual(1)= lhs-rhs;
lhs =y(10);
rhs =y(8);
residual(2)= lhs-rhs;
lhs =y(11);
rhs =4*y(3);
residual(3)= lhs-rhs;
lhs =y(14);
rhs =y(11);
residual(4)= lhs-rhs;
lhs =y(15);
rhs =y(14);
residual(5)= lhs-rhs;
lhs =y(16);
rhs =y(14)+y(15);
residual(6)= lhs-rhs;
lhs =y(12);
rhs =y(1)-(params(35)*y(7)+params(36)*(params(40)-1)*y(6))/(1-params(36)*params(38));
residual(7)= lhs-rhs;
lhs =y(13);
rhs =y(1);
residual(8)= lhs-rhs;
lhs =y(8);
rhs =0.25*(y(15)+y(15)+y(11)+y(14));
residual(9)= lhs-rhs;
lhs =y(9);
rhs =y(9)*params(1)+y(11)*params(5)+y(11)*params(6)+y(14)*params(7)+y(15)*params(8)+y(11)*params(10)+y(12)*params(14)+y(12)*params(15)+y(13)*params(23)+y(13)*params(24)+params(32)*x(4);
residual(10)= lhs-rhs;
lhs =y(5);
rhs =y(5)*params(44)+x(1);
residual(11)= lhs-rhs;
lhs =y(6);
rhs =y(6)*params(45)+x(2);
residual(12)= lhs-rhs;
lhs =y(7);
rhs =y(7)*params(46)+x(3);
residual(13)= lhs-rhs;
lhs =y(1);
rhs =y(1)-params(35)*(y(4)-y(3));
residual(14)= lhs-rhs;
lhs =y(2);
rhs =y(1)*params(38)-y(4)*params(39)+params(40)*y(6);
residual(15)= lhs-rhs;
lhs =y(3);
rhs =y(3)*params(57)/params(58)+params(37)*(y(1)*1/params(35)-(y(2)-y(6))*params(36)/params(35)-y(7));
residual(16)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(16, 16);

  %
  % Jacobian matrix
  %

  g1(1,4)=(-4);
  g1(1,9)=1;
  g1(2,8)=(-1);
  g1(2,10)=1;
  g1(3,3)=(-4);
  g1(3,11)=1;
  g1(4,11)=(-1);
  g1(4,14)=1;
  g1(5,14)=(-1);
  g1(5,15)=1;
  g1(6,14)=(-1);
  g1(6,15)=(-1);
  g1(6,16)=1;
  g1(7,1)=(-1);
  g1(7,6)=params(36)*(params(40)-1)/(1-params(36)*params(38));
  g1(7,7)=params(35)/(1-params(36)*params(38));
  g1(7,12)=1;
  g1(8,1)=(-1);
  g1(8,13)=1;
  g1(9,8)=1;
  g1(9,11)=(-0.25);
  g1(9,14)=(-0.25);
  g1(9,15)=(-0.5);
  g1(10,9)=1-params(1);
  g1(10,11)=(-(params(10)+params(5)+params(6)));
  g1(10,12)=(-(params(14)+params(15)));
  g1(10,13)=(-(params(23)+params(24)));
  g1(10,14)=(-params(7));
  g1(10,15)=(-params(8));
  g1(11,5)=1-params(44);
  g1(12,6)=1-params(45);
  g1(13,7)=1-params(46);
  g1(14,3)=(-params(35));
  g1(14,4)=params(35);
  g1(15,1)=(-params(38));
  g1(15,2)=1;
  g1(15,4)=params(39);
  g1(15,6)=(-params(40));
  g1(16,1)=(-(params(37)*1/params(35)));
  g1(16,2)=(-(params(37)*(-(params(36)/params(35)))));
  g1(16,3)=1-params(57)/params(58);
  g1(16,6)=(-(params(37)*params(36)/params(35)));
  g1(16,7)=params(37);
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],16,256);
end
end
