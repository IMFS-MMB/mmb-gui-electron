function [residual, g1, g2, g3] = EA_CW05fm_static(y, x, params)
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

residual = zeros( 57, 1);

%
% Model equations
%

lhs =y(32);
rhs =y(15)*100;
residual(1)= lhs-rhs;
lhs =y(33);
rhs =100*y(14);
residual(2)= lhs-rhs;
lhs =y(34);
rhs =100*y(11)*4;
residual(3)= lhs-rhs;
lhs =y(35);
rhs =100*y(1);
residual(4)= lhs-rhs;
lhs =y(36);
rhs =100*y(1);
residual(5)= lhs-rhs;
lhs =y(32);
rhs =params(32)*x(3)+y(36)*params(31)+y(36)*params(30)+y(36)*params(29)+y(36)*params(28)+y(36)*params(27)+y(36)*params(26)+y(36)*params(25)+y(36)*params(24)+y(36)*params(23)+y(35)*params(22)+y(35)*params(21)+y(35)*params(20)+y(35)*params(19)+y(35)*params(18)+y(35)*params(17)+y(35)*params(16)+y(35)*params(15)+y(35)*params(14)+y(34)*params(13)+y(34)*params(12)+y(34)*params(11)+y(34)*params(10)+y(34)*params(6)+y(34)*params(5)+y(32)*params(1)+y(32)*params(2)+y(32)*params(3)+y(32)*params(4)+y(34)*params(7)+y(34)*params(8)+y(34)*params(9);
residual(6)= lhs-rhs;
lhs =y(1);
rhs =y(1)*params(43)+params(44)*y(2)+params(45)*y(24)+params(46)*x(2);
residual(7)= lhs-rhs;
lhs =y(2);
rhs =y(1);
residual(8)= lhs-rhs;
lhs =y(3);
rhs =params(36)*y(8)+params(37)*y(4)+params(38)*y(5)+y(5)*params(39)+params(40)*(y(1)*params(36)+params(37)*y(6)+params(38)*y(7)+params(39)*y(7))+params(41)*x(1);
residual(9)= lhs-rhs;
lhs =y(4);
rhs =y(8);
residual(10)= lhs-rhs;
lhs =y(5);
rhs =y(4);
residual(11)= lhs-rhs;
lhs =y(6);
rhs =y(1);
residual(12)= lhs-rhs;
lhs =y(7);
rhs =y(6);
residual(13)= lhs-rhs;
lhs =y(8);
rhs =y(3)*params(36)+params(37)*y(9)+params(38)*y(10)+params(39)*y(10);
residual(14)= lhs-rhs;
lhs =y(9);
rhs =y(3);
residual(15)= lhs-rhs;
lhs =y(10);
rhs =y(9);
residual(16)= lhs-rhs;
lhs =y(11);
rhs =(y(3)*params(36)+params(37)*y(9)+params(38)*y(10)+params(39)*y(10)-(params(38)+params(39))*y(12)-params(39)*y(13))/(params(39)+params(37)+params(38));
residual(17)= lhs-rhs;
lhs =y(12);
rhs =y(11);
residual(18)= lhs-rhs;
lhs =y(13);
rhs =y(12);
residual(19)= lhs-rhs;
lhs =y(14);
rhs =y(13)+y(13)+y(11)+y(12);
residual(20)= lhs-rhs;
residual(21) = y(16);
lhs =y(17);
rhs =(y(23)+y(15)+y(18)+y(19)+y(20)+y(21)+y(22)+y(23))/8;
residual(22)= lhs-rhs;
lhs =y(18);
rhs =y(15);
residual(23)= lhs-rhs;
lhs =y(19);
rhs =y(18);
residual(24)= lhs-rhs;
lhs =y(20);
rhs =y(19);
residual(25)= lhs-rhs;
lhs =y(21);
rhs =y(20);
residual(26)= lhs-rhs;
lhs =y(22);
rhs =y(21);
residual(27)= lhs-rhs;
lhs =y(23);
rhs =y(22);
residual(28)= lhs-rhs;
lhs =y(24);
rhs =y(17)-(y(31)+y(25)+y(26)+y(27)+y(28)+y(29)+y(30)+y(31))/2;
residual(29)= lhs-rhs;
lhs =y(25);
rhs =y(11);
residual(30)= lhs-rhs;
lhs =y(26);
rhs =y(25);
residual(31)= lhs-rhs;
lhs =y(27);
rhs =y(26);
residual(32)= lhs-rhs;
lhs =y(28);
rhs =y(27);
residual(33)= lhs-rhs;
lhs =y(29);
rhs =y(28);
residual(34)= lhs-rhs;
lhs =y(30);
rhs =y(29);
residual(35)= lhs-rhs;
lhs =y(31);
rhs =y(30);
residual(36)= lhs-rhs;
lhs =y(37);
rhs =y(34);
residual(37)= lhs-rhs;
lhs =y(38);
rhs =y(34);
residual(38)= lhs-rhs;
lhs =y(39);
rhs =y(34);
residual(39)= lhs-rhs;
lhs =y(40);
rhs =y(35);
residual(40)= lhs-rhs;
lhs =y(41);
rhs =y(35);
residual(41)= lhs-rhs;
lhs =y(42);
rhs =y(35);
residual(42)= lhs-rhs;
lhs =y(43);
rhs =y(36);
residual(43)= lhs-rhs;
lhs =y(44);
rhs =y(36);
residual(44)= lhs-rhs;
lhs =y(45);
rhs =y(36);
residual(45)= lhs-rhs;
lhs =y(46);
rhs =y(36);
residual(46)= lhs-rhs;
lhs =y(47);
rhs =y(36);
residual(47)= lhs-rhs;
lhs =y(48);
rhs =y(36);
residual(48)= lhs-rhs;
lhs =y(49);
rhs =y(35);
residual(49)= lhs-rhs;
lhs =y(50);
rhs =y(35);
residual(50)= lhs-rhs;
lhs =y(51);
rhs =y(35);
residual(51)= lhs-rhs;
lhs =y(52);
rhs =y(32);
residual(52)= lhs-rhs;
lhs =y(53);
rhs =y(32);
residual(53)= lhs-rhs;
lhs =y(54);
rhs =y(32);
residual(54)= lhs-rhs;
lhs =y(55);
rhs =y(34);
residual(55)= lhs-rhs;
lhs =y(56);
rhs =y(34);
residual(56)= lhs-rhs;
lhs =y(57);
rhs =y(34);
residual(57)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(57, 57);

  %
  % Jacobian matrix
  %

  g1(1,15)=(-100);
  g1(1,32)=1;
  g1(2,14)=(-100);
  g1(2,33)=1;
  g1(3,11)=(-400);
  g1(3,34)=1;
  g1(4,1)=(-100);
  g1(4,35)=1;
  g1(5,1)=(-100);
  g1(5,36)=1;
  g1(6,32)=1-(params(4)+params(3)+params(1)+params(2));
  g1(6,34)=(-(params(13)+params(12)+params(11)+params(10)+params(9)+params(8)+params(7)+params(6)+params(5)));
  g1(6,35)=(-(params(22)+params(21)+params(20)+params(19)+params(18)+params(17)+params(16)+params(15)+params(14)));
  g1(6,36)=(-(params(31)+params(30)+params(29)+params(28)+params(27)+params(26)+params(25)+params(24)+params(23)));
  g1(7,1)=1-params(43);
  g1(7,2)=(-params(44));
  g1(7,24)=(-params(45));
  g1(8,1)=(-1);
  g1(8,2)=1;
  g1(9,1)=(-(params(36)*params(40)));
  g1(9,3)=1;
  g1(9,4)=(-params(37));
  g1(9,5)=(-(params(38)+params(39)));
  g1(9,6)=(-(params(37)*params(40)));
  g1(9,7)=(-(params(40)*(params(38)+params(39))));
  g1(9,8)=(-params(36));
  g1(10,4)=1;
  g1(10,8)=(-1);
  g1(11,4)=(-1);
  g1(11,5)=1;
  g1(12,1)=(-1);
  g1(12,6)=1;
  g1(13,6)=(-1);
  g1(13,7)=1;
  g1(14,3)=(-params(36));
  g1(14,8)=1;
  g1(14,9)=(-params(37));
  g1(14,10)=(-(params(38)+params(39)));
  g1(15,3)=(-1);
  g1(15,9)=1;
  g1(16,9)=(-1);
  g1(16,10)=1;
  g1(17,3)=(-(params(36)/(params(39)+params(37)+params(38))));
  g1(17,9)=(-(params(37)/(params(39)+params(37)+params(38))));
  g1(17,10)=(-((params(38)+params(39))/(params(39)+params(37)+params(38))));
  g1(17,11)=1;
  g1(17,12)=(-((-(params(38)+params(39)))/(params(39)+params(37)+params(38))));
  g1(17,13)=(-((-params(39))/(params(39)+params(37)+params(38))));
  g1(18,11)=(-1);
  g1(18,12)=1;
  g1(19,12)=(-1);
  g1(19,13)=1;
  g1(20,11)=(-1);
  g1(20,12)=(-1);
  g1(20,13)=(-2);
  g1(20,14)=1;
  g1(21,16)=1;
  g1(22,15)=(-0.125);
  g1(22,17)=1;
  g1(22,18)=(-0.125);
  g1(22,19)=(-0.125);
  g1(22,20)=(-0.125);
  g1(22,21)=(-0.125);
  g1(22,22)=(-0.125);
  g1(22,23)=(-0.25);
  g1(23,15)=(-1);
  g1(23,18)=1;
  g1(24,18)=(-1);
  g1(24,19)=1;
  g1(25,19)=(-1);
  g1(25,20)=1;
  g1(26,20)=(-1);
  g1(26,21)=1;
  g1(27,21)=(-1);
  g1(27,22)=1;
  g1(28,22)=(-1);
  g1(28,23)=1;
  g1(29,17)=(-1);
  g1(29,24)=1;
  g1(29,25)=0.5;
  g1(29,26)=0.5;
  g1(29,27)=0.5;
  g1(29,28)=0.5;
  g1(29,29)=0.5;
  g1(29,30)=0.5;
  g1(29,31)=1;
  g1(30,11)=(-1);
  g1(30,25)=1;
  g1(31,25)=(-1);
  g1(31,26)=1;
  g1(32,26)=(-1);
  g1(32,27)=1;
  g1(33,27)=(-1);
  g1(33,28)=1;
  g1(34,28)=(-1);
  g1(34,29)=1;
  g1(35,29)=(-1);
  g1(35,30)=1;
  g1(36,30)=(-1);
  g1(36,31)=1;
  g1(37,34)=(-1);
  g1(37,37)=1;
  g1(38,34)=(-1);
  g1(38,38)=1;
  g1(39,34)=(-1);
  g1(39,39)=1;
  g1(40,35)=(-1);
  g1(40,40)=1;
  g1(41,35)=(-1);
  g1(41,41)=1;
  g1(42,35)=(-1);
  g1(42,42)=1;
  g1(43,36)=(-1);
  g1(43,43)=1;
  g1(44,36)=(-1);
  g1(44,44)=1;
  g1(45,36)=(-1);
  g1(45,45)=1;
  g1(46,36)=(-1);
  g1(46,46)=1;
  g1(47,36)=(-1);
  g1(47,47)=1;
  g1(48,36)=(-1);
  g1(48,48)=1;
  g1(49,35)=(-1);
  g1(49,49)=1;
  g1(50,35)=(-1);
  g1(50,50)=1;
  g1(51,35)=(-1);
  g1(51,51)=1;
  g1(52,32)=(-1);
  g1(52,52)=1;
  g1(53,32)=(-1);
  g1(53,53)=1;
  g1(54,32)=(-1);
  g1(54,54)=1;
  g1(55,34)=(-1);
  g1(55,55)=1;
  g1(56,34)=(-1);
  g1(56,56)=1;
  g1(57,34)=(-1);
  g1(57,57)=1;
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],57,3249);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],57,185193);
end
end
end
end
