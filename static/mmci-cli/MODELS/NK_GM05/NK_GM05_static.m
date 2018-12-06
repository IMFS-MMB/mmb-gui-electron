function [residual, g1, g2, g3] = NK_GM05_static(y, x, params)
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

residual = zeros( 42, 1);

%
% Model equations
%

T158 = params(35)^(-1);
lhs =y(15);
rhs =y(6)*400;
residual(1)= lhs-rhs;
lhs =y(16);
rhs =25*(4*y(8)+4*y(8)+4*y(8)+4*y(8));
residual(2)= lhs-rhs;
lhs =y(17);
rhs =400*y(8);
residual(3)= lhs-rhs;
lhs =y(18);
rhs =100*y(2);
residual(4)= lhs-rhs;
lhs =y(19);
rhs =100*y(3);
residual(5)= lhs-rhs;
lhs =y(15);
rhs =params(32)*x(3)+y(19)*params(31)+y(19)*params(30)+y(19)*params(29)+y(19)*params(28)+y(19)*params(27)+y(19)*params(26)+y(19)*params(25)+y(19)*params(24)+y(19)*params(23)+y(18)*params(22)+y(18)*params(21)+y(18)*params(20)+y(18)*params(19)+y(18)*params(18)+y(18)*params(17)+y(18)*params(16)+y(18)*params(15)+y(18)*params(14)+y(17)*params(13)+y(17)*params(12)+y(17)*params(11)+y(17)*params(10)+y(17)*params(6)+y(17)*params(5)+y(15)*params(1)+y(15)*params(2)+y(15)*params(3)+y(15)*params(4)+y(17)*params(7)+y(17)*params(8)+y(17)*params(9);
residual(6)= lhs-rhs;
lhs =y(2);
rhs =y(2)-T158*(y(6)-y(1)-y(5));
residual(7)= lhs-rhs;
lhs =y(5);
rhs =(-params(35))*params(37)*(1-params(45))*y(14)+params(35)*params(38)*(params(39)+params(40))*(params(46)-1)*y(12);
residual(8)= lhs-rhs;
lhs =y(1);
rhs =y(1)*params(41)+y(2)*params(42);
residual(9)= lhs-rhs;
lhs =y(4);
rhs =params(37)*y(14)+y(12)*params(38)*params(40);
residual(10)= lhs-rhs;
lhs =y(2);
rhs =y(3)-y(4);
residual(11)= lhs-rhs;
lhs =y(3);
rhs =y(12)+T158*y(7);
residual(12)= lhs-rhs;
lhs =y(8);
rhs =y(1);
residual(13)= lhs-rhs;
residual(14) = y(8);
residual(15) = y(1);
lhs =y(7);
rhs =y(7)+y(11)-y(11)+y(13)-y(1);
residual(16)= lhs-rhs;
residual(17) = y(13);
lhs =y(14);
rhs =params(45)*y(14)+x(2);
residual(18)= lhs-rhs;
lhs =y(12);
rhs =params(46)*y(12)+x(1);
residual(19)= lhs-rhs;
lhs =y(20);
rhs =y(17);
residual(20)= lhs-rhs;
lhs =y(21);
rhs =y(17);
residual(21)= lhs-rhs;
lhs =y(22);
rhs =y(17);
residual(22)= lhs-rhs;
lhs =y(23);
rhs =y(18);
residual(23)= lhs-rhs;
lhs =y(24);
rhs =y(18);
residual(24)= lhs-rhs;
lhs =y(25);
rhs =y(18);
residual(25)= lhs-rhs;
lhs =y(26);
rhs =y(19);
residual(26)= lhs-rhs;
lhs =y(27);
rhs =y(19);
residual(27)= lhs-rhs;
lhs =y(28);
rhs =y(19);
residual(28)= lhs-rhs;
lhs =y(29);
rhs =y(8);
residual(29)= lhs-rhs;
lhs =y(30);
rhs =y(8);
residual(30)= lhs-rhs;
lhs =y(31);
rhs =y(19);
residual(31)= lhs-rhs;
lhs =y(32);
rhs =y(19);
residual(32)= lhs-rhs;
lhs =y(33);
rhs =y(19);
residual(33)= lhs-rhs;
lhs =y(34);
rhs =y(18);
residual(34)= lhs-rhs;
lhs =y(35);
rhs =y(18);
residual(35)= lhs-rhs;
lhs =y(36);
rhs =y(18);
residual(36)= lhs-rhs;
lhs =y(37);
rhs =y(15);
residual(37)= lhs-rhs;
lhs =y(38);
rhs =y(15);
residual(38)= lhs-rhs;
lhs =y(39);
rhs =y(15);
residual(39)= lhs-rhs;
lhs =y(40);
rhs =y(17);
residual(40)= lhs-rhs;
lhs =y(41);
rhs =y(17);
residual(41)= lhs-rhs;
lhs =y(42);
rhs =y(17);
residual(42)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(42, 42);

  %
  % Jacobian matrix
  %

  g1(1,6)=(-400);
  g1(1,15)=1;
  g1(2,8)=(-400);
  g1(2,16)=1;
  g1(3,8)=(-400);
  g1(3,17)=1;
  g1(4,2)=(-100);
  g1(4,18)=1;
  g1(5,3)=(-100);
  g1(5,19)=1;
  g1(6,15)=1-(params(4)+params(3)+params(1)+params(2));
  g1(6,17)=(-(params(13)+params(12)+params(11)+params(10)+params(9)+params(8)+params(7)+params(6)+params(5)));
  g1(6,18)=(-(params(22)+params(21)+params(20)+params(19)+params(18)+params(17)+params(16)+params(15)+params(14)));
  g1(6,19)=(-(params(31)+params(30)+params(29)+params(28)+params(27)+params(26)+params(25)+params(24)+params(23)));
  g1(7,1)=(-T158);
  g1(7,5)=(-T158);
  g1(7,6)=T158;
  g1(8,5)=1;
  g1(8,12)=(-(params(35)*params(38)*(params(39)+params(40))*(params(46)-1)));
  g1(8,14)=(-((-params(35))*params(37)*(1-params(45))));
  g1(9,1)=1-params(41);
  g1(9,2)=(-params(42));
  g1(10,4)=1;
  g1(10,12)=(-(params(38)*params(40)));
  g1(10,14)=(-params(37));
  g1(11,2)=1;
  g1(11,3)=(-1);
  g1(11,4)=1;
  g1(12,3)=1;
  g1(12,7)=(-T158);
  g1(12,12)=(-1);
  g1(13,1)=(-1);
  g1(13,8)=1;
  g1(14,8)=1;
  g1(15,1)=1;
  g1(16,1)=1;
  g1(16,13)=(-1);
  g1(17,13)=1;
  g1(18,14)=1-params(45);
  g1(19,12)=1-params(46);
  g1(20,17)=(-1);
  g1(20,20)=1;
  g1(21,17)=(-1);
  g1(21,21)=1;
  g1(22,17)=(-1);
  g1(22,22)=1;
  g1(23,18)=(-1);
  g1(23,23)=1;
  g1(24,18)=(-1);
  g1(24,24)=1;
  g1(25,18)=(-1);
  g1(25,25)=1;
  g1(26,19)=(-1);
  g1(26,26)=1;
  g1(27,19)=(-1);
  g1(27,27)=1;
  g1(28,19)=(-1);
  g1(28,28)=1;
  g1(29,8)=(-1);
  g1(29,29)=1;
  g1(30,8)=(-1);
  g1(30,30)=1;
  g1(31,19)=(-1);
  g1(31,31)=1;
  g1(32,19)=(-1);
  g1(32,32)=1;
  g1(33,19)=(-1);
  g1(33,33)=1;
  g1(34,18)=(-1);
  g1(34,34)=1;
  g1(35,18)=(-1);
  g1(35,35)=1;
  g1(36,18)=(-1);
  g1(36,36)=1;
  g1(37,15)=(-1);
  g1(37,37)=1;
  g1(38,15)=(-1);
  g1(38,38)=1;
  g1(39,15)=(-1);
  g1(39,39)=1;
  g1(40,17)=(-1);
  g1(40,40)=1;
  g1(41,17)=(-1);
  g1(41,41)=1;
  g1(42,17)=(-1);
  g1(42,42)=1;
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],42,1764);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],42,74088);
end
end
end
end
