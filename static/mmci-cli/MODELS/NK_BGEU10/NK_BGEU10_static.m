function [residual, g1, g2, g3] = NK_BGEU10_static(y, x, params)
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

residual = zeros( 44, 1);

%
% Model equations
%

T213 = (1-params(48))/(1-params(48)*params(47));
T217 = params(48)*(1-params(47))/(1-params(48)*params(47));
T221 = params(47)*params(36)*params(48)/(1-params(48)*params(47));
lhs =y(16);
rhs =y(8)*4;
residual(1)= lhs-rhs;
lhs =y(17);
rhs =0.25*(4*y(1)+4*y(1)+4*y(1)+4*y(1));
residual(2)= lhs-rhs;
lhs =y(18);
rhs =4*y(1);
residual(3)= lhs-rhs;
lhs =y(19);
rhs =y(14)-y(15);
residual(4)= lhs-rhs;
lhs =y(20);
rhs =y(14);
residual(5)= lhs-rhs;
lhs =y(16);
rhs =params(32)*x(2)+y(20)*params(31)+y(20)*params(30)+y(20)*params(29)+y(20)*params(28)+y(20)*params(27)+y(20)*params(26)+y(20)*params(25)+y(20)*params(24)+y(20)*params(23)+y(19)*params(22)+y(19)*params(21)+y(19)*params(20)+y(19)*params(19)+y(19)*params(18)+y(19)*params(17)+y(19)*params(16)+y(19)*params(15)+y(19)*params(14)+y(18)*params(13)+y(18)*params(12)+y(18)*params(11)+y(18)*params(10)+y(18)*params(6)+y(18)*params(5)+y(16)*params(1)+y(16)*params(2)+y(16)*params(3)+y(16)*params(4)+y(18)*params(7)+y(18)*params(8)+y(18)*params(9);
residual(6)= lhs-rhs;
lhs =y(21);
rhs =params(34)*x(3);
residual(7)= lhs-rhs;
lhs =y(1);
rhs =y(1)*params(38)+params(41)*y(2);
residual(8)= lhs-rhs;
lhs =y(2);
rhs =params(36)*params(48)*params(42)*y(3)-params(42)*params(48)*params(38)*(1-params(47))*params(36)*y(3)-y(5)*params(51)*params(35);
residual(9)= lhs-rhs;
lhs =params(36)*params(48)*params(42)*y(9);
rhs =y(5)*params(51)*params(35)+params(42)*params(48)*params(38)*(1-params(47))*params(36)*y(9);
residual(10)= lhs-rhs;
lhs =y(3)*params(47);
rhs =y(6)-y(6)*(1-params(47))*(1-params(45));
residual(11)= lhs-rhs;
lhs =params(47)*y(9);
rhs =y(11)-(1-params(47))*(1-params(45))*y(11);
residual(12)= lhs-rhs;
lhs =y(4);
rhs =y(5)+y(6)*T213+y(6)*T217-y(3)*T221;
residual(13)= lhs-rhs;
lhs =y(10);
rhs =y(5)+y(11)*T213+y(11)*T217-y(9)*T221;
residual(14)= lhs-rhs;
lhs =y(4);
rhs =y(4)-(y(8)-y(1)-params(59));
residual(15)= lhs-rhs;
lhs =y(10);
rhs =y(10)-(y(13)-params(59));
residual(16)= lhs-rhs;
lhs =y(7);
rhs =y(6)*(-(1-params(46)));
residual(17)= lhs-rhs;
lhs =y(12);
rhs =y(11)*(-(1-params(46)));
residual(18)= lhs-rhs;
lhs =y(14);
rhs =y(5)+y(6);
residual(19)= lhs-rhs;
lhs =y(15);
rhs =y(5)+y(11);
residual(20)= lhs-rhs;
lhs =y(5);
rhs =y(5)*params(44)-x(1);
residual(21)= lhs-rhs;
lhs =y(22);
rhs =y(18);
residual(22)= lhs-rhs;
lhs =y(23);
rhs =y(18);
residual(23)= lhs-rhs;
lhs =y(24);
rhs =y(18);
residual(24)= lhs-rhs;
lhs =y(25);
rhs =y(19);
residual(25)= lhs-rhs;
lhs =y(26);
rhs =y(19);
residual(26)= lhs-rhs;
lhs =y(27);
rhs =y(19);
residual(27)= lhs-rhs;
lhs =y(28);
rhs =y(20);
residual(28)= lhs-rhs;
lhs =y(29);
rhs =y(20);
residual(29)= lhs-rhs;
lhs =y(30);
rhs =y(20);
residual(30)= lhs-rhs;
lhs =y(31);
rhs =y(1);
residual(31)= lhs-rhs;
lhs =y(32);
rhs =y(1);
residual(32)= lhs-rhs;
lhs =y(33);
rhs =y(20);
residual(33)= lhs-rhs;
lhs =y(34);
rhs =y(20);
residual(34)= lhs-rhs;
lhs =y(35);
rhs =y(20);
residual(35)= lhs-rhs;
lhs =y(36);
rhs =y(19);
residual(36)= lhs-rhs;
lhs =y(37);
rhs =y(19);
residual(37)= lhs-rhs;
lhs =y(38);
rhs =y(19);
residual(38)= lhs-rhs;
lhs =y(39);
rhs =y(16);
residual(39)= lhs-rhs;
lhs =y(40);
rhs =y(16);
residual(40)= lhs-rhs;
lhs =y(41);
rhs =y(16);
residual(41)= lhs-rhs;
lhs =y(42);
rhs =y(18);
residual(42)= lhs-rhs;
lhs =y(43);
rhs =y(18);
residual(43)= lhs-rhs;
lhs =y(44);
rhs =y(18);
residual(44)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(44, 44);

  %
  % Jacobian matrix
  %

  g1(1,8)=(-4);
  g1(1,16)=1;
  g1(2,1)=(-4);
  g1(2,17)=1;
  g1(3,1)=(-4);
  g1(3,18)=1;
  g1(4,14)=(-1);
  g1(4,15)=1;
  g1(4,19)=1;
  g1(5,14)=(-1);
  g1(5,20)=1;
  g1(6,16)=1-(params(4)+params(3)+params(1)+params(2));
  g1(6,18)=(-(params(13)+params(12)+params(11)+params(10)+params(9)+params(8)+params(7)+params(6)+params(5)));
  g1(6,19)=(-(params(22)+params(21)+params(20)+params(19)+params(18)+params(17)+params(16)+params(15)+params(14)));
  g1(6,20)=(-(params(31)+params(30)+params(29)+params(28)+params(27)+params(26)+params(25)+params(24)+params(23)));
  g1(7,21)=1;
  g1(8,1)=1-params(38);
  g1(8,2)=(-params(41));
  g1(9,2)=1;
  g1(9,3)=(-(params(36)*params(48)*params(42)-params(36)*params(42)*params(48)*params(38)*(1-params(47))));
  g1(9,5)=params(51)*params(35);
  g1(10,5)=(-(params(51)*params(35)));
  g1(10,9)=params(36)*params(48)*params(42)-params(36)*params(42)*params(48)*params(38)*(1-params(47));
  g1(11,3)=params(47);
  g1(11,6)=(-(1-(1-params(47))*(1-params(45))));
  g1(12,9)=params(47);
  g1(12,11)=(-(1-(1-params(47))*(1-params(45))));
  g1(13,3)=T221;
  g1(13,4)=1;
  g1(13,5)=(-1);
  g1(13,6)=(-(T213+T217));
  g1(14,5)=(-1);
  g1(14,9)=T221;
  g1(14,10)=1;
  g1(14,11)=(-(T213+T217));
  g1(15,1)=(-1);
  g1(15,8)=1;
  g1(16,13)=1;
  g1(17,6)=1-params(46);
  g1(17,7)=1;
  g1(18,11)=1-params(46);
  g1(18,12)=1;
  g1(19,5)=(-1);
  g1(19,6)=(-1);
  g1(19,14)=1;
  g1(20,5)=(-1);
  g1(20,11)=(-1);
  g1(20,15)=1;
  g1(21,5)=1-params(44);
  g1(22,18)=(-1);
  g1(22,22)=1;
  g1(23,18)=(-1);
  g1(23,23)=1;
  g1(24,18)=(-1);
  g1(24,24)=1;
  g1(25,19)=(-1);
  g1(25,25)=1;
  g1(26,19)=(-1);
  g1(26,26)=1;
  g1(27,19)=(-1);
  g1(27,27)=1;
  g1(28,20)=(-1);
  g1(28,28)=1;
  g1(29,20)=(-1);
  g1(29,29)=1;
  g1(30,20)=(-1);
  g1(30,30)=1;
  g1(31,1)=(-1);
  g1(31,31)=1;
  g1(32,1)=(-1);
  g1(32,32)=1;
  g1(33,20)=(-1);
  g1(33,33)=1;
  g1(34,20)=(-1);
  g1(34,34)=1;
  g1(35,20)=(-1);
  g1(35,35)=1;
  g1(36,19)=(-1);
  g1(36,36)=1;
  g1(37,19)=(-1);
  g1(37,37)=1;
  g1(38,19)=(-1);
  g1(38,38)=1;
  g1(39,16)=(-1);
  g1(39,39)=1;
  g1(40,16)=(-1);
  g1(40,40)=1;
  g1(41,16)=(-1);
  g1(41,41)=1;
  g1(42,18)=(-1);
  g1(42,42)=1;
  g1(43,18)=(-1);
  g1(43,43)=1;
  g1(44,18)=(-1);
  g1(44,44)=1;
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],44,1936);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],44,85184);
end
end
end
end
