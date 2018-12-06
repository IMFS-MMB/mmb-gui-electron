function [residual, g1, g2, g3] = NK_PP17_static(y, x, params)
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

residual = zeros( 49, 1);

%
% Model equations
%

T172 = (1+params(38))/(params(36)+params(38));
T183 = 1/(1+params(41)*params(40));
T201 = T172*y(18);
lhs =y(22);
rhs =y(3)*4;
residual(1)= lhs-rhs;
lhs =y(23);
rhs =y(4)+y(4)+y(4)+y(4);
residual(2)= lhs-rhs;
lhs =y(24);
rhs =4*y(4);
residual(3)= lhs-rhs;
lhs =y(25);
rhs =y(1)-y(10);
residual(4)= lhs-rhs;
lhs =y(26);
rhs =y(1);
residual(5)= lhs-rhs;
lhs =y(22);
rhs =params(32)/100*x(5)+y(26)*params(31)+y(26)*params(30)+y(26)*params(29)+y(26)*params(28)+y(26)*params(27)+y(26)*params(26)+y(26)*params(25)+y(26)*params(24)+y(26)*params(23)+y(25)*params(22)+y(25)*params(21)+y(25)*params(20)+y(25)*params(19)+y(25)*params(18)+y(25)*params(17)+y(25)*params(16)+y(25)*params(15)+y(25)*params(14)+y(24)*params(13)+y(24)*params(12)+y(24)*params(11)+y(24)*params(10)+y(24)*params(6)+y(24)*params(5)+y(22)*params(1)+y(22)*params(2)+y(22)*params(3)+y(22)*params(4)+y(24)*params(7)+y(24)*params(8)+y(24)*params(9);
residual(6)= lhs-rhs;
lhs =y(4);
rhs =params(44)*((params(36)+params(38))*y(2)+params(37)*(y(3)+params(43)*y(5))+y(20))+y(4)*params(35);
residual(7)= lhs-rhs;
lhs =y(3);
rhs =y(4);
residual(8)= lhs-rhs;
lhs =y(6);
rhs =y(3)+y(6)-y(4)+T183*(params(41)*params(40)*y(7)+y(5)*params(40)+(params(40)-1)*y(8))+y(19);
residual(9)= lhs-rhs;
lhs =y(6)+y(7);
rhs =y(2)*(params(38)+1+params(36))+T201-(y(3)+params(43)*y(5))*(1-params(37));
residual(10)= lhs-rhs;
lhs =y(7)+y(21);
rhs =y(5)*params(40)+(params(40)-1)*y(8)+params(35)*(y(21)+(1+params(41)*params(40))*y(7));
residual(11)= lhs-rhs;
residual(12) = y(8);
lhs =y(2);
rhs =y(1)-T201;
residual(13)= lhs-rhs;
lhs =y(9);
rhs =params(44)*((params(36)+params(38))*y(2)+params(37)*(y(3)+params(43)*y(5)));
residual(14)= lhs-rhs;
lhs =0;
rhs =(params(36)+params(38))*y(11)+params(37)*params(43)*y(13);
residual(15)= lhs-rhs;
residual(16) = y(12);
lhs =y(14);
rhs =y(19)+y(12)+y(14)+T183*(params(41)*params(40)*y(15)+params(40)*y(13)+(params(40)-1)*y(16));
residual(17)= lhs-rhs;
lhs =y(14)+y(15);
rhs =T201+(params(38)+1+params(36))*y(11)-(1-params(37))*(y(12)+params(43)*y(13));
residual(18)= lhs-rhs;
lhs =y(21)+y(15);
rhs =params(40)*y(13)+(params(40)-1)*y(16)+params(35)*(y(21)+(1+params(41)*params(40))*y(15));
residual(19)= lhs-rhs;
residual(20) = y(16);
lhs =y(11);
rhs =y(10)-T201;
residual(21)= lhs-rhs;
residual(22) = y(17);
lhs =y(18);
rhs =y(18)*params(45)-x(1);
residual(23)= lhs-rhs;
lhs =y(20);
rhs =y(20)*params(46)+x(2);
residual(24)= lhs-rhs;
lhs =y(19);
rhs =y(19)*params(47)-x(3);
residual(25)= lhs-rhs;
lhs =y(21);
rhs =y(21)*params(49)+x(4);
residual(26)= lhs-rhs;
lhs =y(27);
rhs =y(24);
residual(27)= lhs-rhs;
lhs =y(28);
rhs =y(24);
residual(28)= lhs-rhs;
lhs =y(29);
rhs =y(24);
residual(29)= lhs-rhs;
lhs =y(30);
rhs =y(25);
residual(30)= lhs-rhs;
lhs =y(31);
rhs =y(25);
residual(31)= lhs-rhs;
lhs =y(32);
rhs =y(25);
residual(32)= lhs-rhs;
lhs =y(33);
rhs =y(26);
residual(33)= lhs-rhs;
lhs =y(34);
rhs =y(26);
residual(34)= lhs-rhs;
lhs =y(35);
rhs =y(26);
residual(35)= lhs-rhs;
lhs =y(36);
rhs =y(4);
residual(36)= lhs-rhs;
lhs =y(37);
rhs =y(4);
residual(37)= lhs-rhs;
lhs =y(38);
rhs =y(26);
residual(38)= lhs-rhs;
lhs =y(39);
rhs =y(26);
residual(39)= lhs-rhs;
lhs =y(40);
rhs =y(26);
residual(40)= lhs-rhs;
lhs =y(41);
rhs =y(25);
residual(41)= lhs-rhs;
lhs =y(42);
rhs =y(25);
residual(42)= lhs-rhs;
lhs =y(43);
rhs =y(25);
residual(43)= lhs-rhs;
lhs =y(44);
rhs =y(22);
residual(44)= lhs-rhs;
lhs =y(45);
rhs =y(22);
residual(45)= lhs-rhs;
lhs =y(46);
rhs =y(22);
residual(46)= lhs-rhs;
lhs =y(47);
rhs =y(24);
residual(47)= lhs-rhs;
lhs =y(48);
rhs =y(24);
residual(48)= lhs-rhs;
lhs =y(49);
rhs =y(24);
residual(49)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(49, 49);

  %
  % Jacobian matrix
  %

  g1(1,3)=(-4);
  g1(1,22)=1;
  g1(2,4)=(-4);
  g1(2,23)=1;
  g1(3,4)=(-4);
  g1(3,24)=1;
  g1(4,1)=(-1);
  g1(4,10)=1;
  g1(4,25)=1;
  g1(5,1)=(-1);
  g1(5,26)=1;
  g1(6,22)=1-(params(4)+params(3)+params(1)+params(2));
  g1(6,24)=(-(params(13)+params(12)+params(11)+params(10)+params(9)+params(8)+params(7)+params(6)+params(5)));
  g1(6,25)=(-(params(22)+params(21)+params(20)+params(19)+params(18)+params(17)+params(16)+params(15)+params(14)));
  g1(6,26)=(-(params(31)+params(30)+params(29)+params(28)+params(27)+params(26)+params(25)+params(24)+params(23)));
  g1(7,2)=(-(params(44)*(params(36)+params(38))));
  g1(7,3)=(-(params(44)*params(37)));
  g1(7,4)=1-params(35);
  g1(7,5)=(-(params(44)*params(37)*params(43)));
  g1(7,20)=(-params(44));
  g1(8,3)=1;
  g1(8,4)=(-1);
  g1(9,3)=(-1);
  g1(9,4)=1;
  g1(9,5)=(-(params(40)*T183));
  g1(9,7)=(-(params(41)*params(40)*T183));
  g1(9,8)=(-(T183*(params(40)-1)));
  g1(9,19)=(-1);
  g1(10,2)=(-(params(38)+1+params(36)));
  g1(10,3)=1-params(37);
  g1(10,5)=params(43)*(1-params(37));
  g1(10,6)=1;
  g1(10,7)=1;
  g1(10,18)=(-T172);
  g1(11,5)=(-params(40));
  g1(11,7)=1-params(35)*(1+params(41)*params(40));
  g1(11,8)=(-(params(40)-1));
  g1(11,21)=1-params(35);
  g1(12,8)=1;
  g1(13,1)=(-1);
  g1(13,2)=1;
  g1(13,18)=T172;
  g1(14,2)=(-(params(44)*(params(36)+params(38))));
  g1(14,3)=(-(params(44)*params(37)));
  g1(14,5)=(-(params(44)*params(37)*params(43)));
  g1(14,9)=1;
  g1(15,11)=(-(params(36)+params(38)));
  g1(15,13)=(-(params(37)*params(43)));
  g1(16,12)=1;
  g1(17,12)=(-1);
  g1(17,13)=(-(params(40)*T183));
  g1(17,15)=(-(params(41)*params(40)*T183));
  g1(17,16)=(-(T183*(params(40)-1)));
  g1(17,19)=(-1);
  g1(18,11)=(-(params(38)+1+params(36)));
  g1(18,12)=1-params(37);
  g1(18,13)=params(43)*(1-params(37));
  g1(18,14)=1;
  g1(18,15)=1;
  g1(18,18)=(-T172);
  g1(19,13)=(-params(40));
  g1(19,15)=1-params(35)*(1+params(41)*params(40));
  g1(19,16)=(-(params(40)-1));
  g1(19,21)=1-params(35);
  g1(20,16)=1;
  g1(21,10)=(-1);
  g1(21,11)=1;
  g1(21,18)=T172;
  g1(22,17)=1;
  g1(23,18)=1-params(45);
  g1(24,20)=1-params(46);
  g1(25,19)=1-params(47);
  g1(26,21)=1-params(49);
  g1(27,24)=(-1);
  g1(27,27)=1;
  g1(28,24)=(-1);
  g1(28,28)=1;
  g1(29,24)=(-1);
  g1(29,29)=1;
  g1(30,25)=(-1);
  g1(30,30)=1;
  g1(31,25)=(-1);
  g1(31,31)=1;
  g1(32,25)=(-1);
  g1(32,32)=1;
  g1(33,26)=(-1);
  g1(33,33)=1;
  g1(34,26)=(-1);
  g1(34,34)=1;
  g1(35,26)=(-1);
  g1(35,35)=1;
  g1(36,4)=(-1);
  g1(36,36)=1;
  g1(37,4)=(-1);
  g1(37,37)=1;
  g1(38,26)=(-1);
  g1(38,38)=1;
  g1(39,26)=(-1);
  g1(39,39)=1;
  g1(40,26)=(-1);
  g1(40,40)=1;
  g1(41,25)=(-1);
  g1(41,41)=1;
  g1(42,25)=(-1);
  g1(42,42)=1;
  g1(43,25)=(-1);
  g1(43,43)=1;
  g1(44,22)=(-1);
  g1(44,44)=1;
  g1(45,22)=(-1);
  g1(45,45)=1;
  g1(46,22)=(-1);
  g1(46,46)=1;
  g1(47,24)=(-1);
  g1(47,47)=1;
  g1(48,24)=(-1);
  g1(48,48)=1;
  g1(49,24)=(-1);
  g1(49,49)=1;
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],49,2401);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],49,117649);
end
end
end
end
