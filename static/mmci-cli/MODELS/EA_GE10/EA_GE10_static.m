function [residual, g1, g2, g3] = EA_GE10_static(y, x, params)
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

residual = zeros( 63, 1);

%
% Model equations
%

T202 = (1-params(55))/((1+params(55))*params(58));
T232 = 1/(1+params(36));
T234 = params(36)/(1+params(36));
T239 = 1/params(63)/(1+params(36));
T287 = T232*(1-params(36)*params(59))*(1-params(59))/(params(59)*(1+(1+params(61))*params(57)/params(61)));
T317 = (1-params(38))*(1-params(36)*params(38))/params(38)/(1+params(36)*params(62));
T362 = (1-params(52))*(1-params(36)*params(52))/params(52);
lhs =y(34);
rhs =y(19)*4;
residual(1)= lhs-rhs;
lhs =y(35);
rhs =y(10)+y(10)+y(10)+y(10);
residual(2)= lhs-rhs;
lhs =y(36);
rhs =4*y(10);
residual(3)= lhs-rhs;
lhs =y(38);
rhs =y(9)-y(22);
residual(4)= lhs-rhs;
lhs =y(37);
rhs =y(9);
residual(5)= lhs-rhs;
lhs =y(39);
rhs =y(33);
residual(6)= lhs-rhs;
lhs =y(34);
rhs =params(32)*x(7)+y(37)*params(31)+y(37)*params(30)+y(37)*params(29)+y(37)*params(28)+y(37)*params(27)+y(37)*params(26)+y(37)*params(25)+y(37)*params(24)+y(37)*params(23)+y(38)*params(22)+y(38)*params(21)+y(38)*params(20)+y(38)*params(19)+y(38)*params(18)+y(38)*params(17)+y(38)*params(16)+y(38)*params(15)+y(38)*params(14)+y(36)*params(13)+y(36)*params(12)+y(36)*params(11)+y(36)*params(10)+y(36)*params(6)+y(36)*params(5)+y(34)*params(1)+y(34)*params(2)+y(34)*params(3)+y(34)*params(4)+y(36)*params(7)+y(36)*params(8)+y(36)*params(9);
residual(7)= lhs-rhs;
lhs =y(39);
rhs =params(34)*x(8);
residual(8)= lhs-rhs;
lhs =y(9);
rhs =(1-params(37)*params(86)-params(79))*y(2)+params(37)*params(86)*y(4)+params(79)*y(18)+params(86)*params(64)*params(72)*y(11)+params(86)*(params(51)-params(39))*(1-params(49))*(y(8)+y(5)+y(6));
residual(9)= lhs-rhs;
lhs =y(2);
rhs =y(2)*1/(1+params(55))+y(2)*params(55)/(1+params(55))-T202*(y(19)-y(10))+T202*y(15);
residual(10)= lhs-rhs;
lhs =y(8);
rhs =y(1)-params(42)*(y(7)-y(5)-y(6));
residual(11)= lhs-rhs;
lhs =y(8);
rhs =(params(72)*y(11)+y(5)*(1-params(37)))/(params(72)+1-params(37))-y(5);
residual(12)= lhs-rhs;
lhs =y(11);
rhs =y(9)+y(12)-y(6);
residual(13)= lhs-rhs;
lhs =y(4);
rhs =y(4)*T232+y(4)*T234+y(5)*T239+y(14);
residual(14)= lhs-rhs;
lhs =y(9)/(1+params(65));
rhs =params(35)*(y(6)+params(64)*y(11))+(1-params(35))*y(3)+y(13);
residual(15)= lhs-rhs;
lhs =y(20);
rhs =T234*y(20)+T232*y(20)+y(10)*T234-y(10)*(1+params(36)*params(60))/(1+params(36))+y(10)*params(60)/(1+params(36))-T287*(y(20)-y(3)*params(57)-params(58)/(1-params(55))*(y(2)-y(2)*params(55))+y(16))+x(6);
residual(16)= lhs-rhs;
lhs =y(3);
rhs =y(6)+(-y(20))+y(11)*(1+params(64));
residual(17)= lhs-rhs;
lhs =y(10);
rhs =y(12)*T317+y(10)*params(36)/(1+params(36)*params(62))+y(10)*params(62)/(1+params(36)*params(62))+x(5);
residual(18)= lhs-rhs;
lhs =y(6);
rhs =y(6)*(1-params(37))+params(37)*(y(4)+params(63)*y(14));
residual(19)= lhs-rhs;
lhs =y(7);
rhs =params(43)*(params(39)*(y(1)+y(7))+params(39)*params(50)*(y(8)*params(40)-y(1))+params(39)*params(50)*(params(40)-1)*(y(5)+y(6)));
residual(20)= lhs-rhs;
lhs =y(1);
rhs =y(19)-y(10);
residual(21)= lhs-rhs;
lhs =y(17);
rhs =y(8)-y(1);
residual(22)= lhs-rhs;
lhs =0;
rhs =T362*(y(3)-y(21));
residual(23)= lhs-rhs;
lhs =y(22);
rhs =(1-params(37)*params(100)-params(93))*y(23)+params(37)*params(100)*y(24)+y(18)*params(93)-params(64)*params(100)*params(87)*y(31);
residual(24)= lhs-rhs;
lhs =y(23);
rhs =T202*y(15)+1/(1+params(55))*y(23)+params(55)/(1+params(55))*y(23)-T202*y(27);
residual(25)= lhs-rhs;
lhs =y(26);
rhs =y(27);
residual(26)= lhs-rhs;
lhs =y(26);
rhs =(params(87)*y(31)+(1-params(37))*y(25))/(1-params(37)+params(87))-y(25);
residual(27)= lhs-rhs;
lhs =y(31);
rhs =y(22)+y(32)-y(28);
residual(28)= lhs-rhs;
lhs =y(24);
rhs =y(14)+T232*y(24)+T234*y(24)+T239*y(25);
residual(29)= lhs-rhs;
lhs =y(22)/(1+params(65));
rhs =y(13)+params(35)*(y(28)+params(64)*y(31))+(1-params(35))*y(30);
residual(30)= lhs-rhs;
lhs =y(29);
rhs =y(16)+params(57)*y(30)+params(58)/(1-params(55))*y(23)-params(58)/(1-params(55))*y(23);
residual(31)= lhs-rhs;
lhs =y(30);
rhs =y(28)+(-y(29))+(1+params(64))*y(31);
residual(32)= lhs-rhs;
residual(33) = y(32);
lhs =y(28);
rhs =(1-params(37))*y(28)+params(37)*(params(63)*y(14)+y(24));
residual(34)= lhs-rhs;
lhs =y(15);
rhs =y(15)*params(41)+x(2);
residual(35)= lhs-rhs;
lhs =y(13);
rhs =y(13)*params(48)+x(4);
residual(36)= lhs-rhs;
lhs =y(14);
rhs =y(14)*params(46)+x(1);
residual(37)= lhs-rhs;
lhs =y(16);
rhs =y(16)*params(45)+x(3);
residual(38)= lhs-rhs;
lhs =y(18);
rhs =y(33)+y(18)*params(56);
residual(39)= lhs-rhs;
lhs =y(40);
rhs =y(36);
residual(40)= lhs-rhs;
lhs =y(41);
rhs =y(36);
residual(41)= lhs-rhs;
lhs =y(42);
rhs =y(36);
residual(42)= lhs-rhs;
lhs =y(43);
rhs =y(38);
residual(43)= lhs-rhs;
lhs =y(44);
rhs =y(38);
residual(44)= lhs-rhs;
lhs =y(45);
rhs =y(38);
residual(45)= lhs-rhs;
lhs =y(46);
rhs =y(37);
residual(46)= lhs-rhs;
lhs =y(47);
rhs =y(37);
residual(47)= lhs-rhs;
lhs =y(48);
rhs =y(37);
residual(48)= lhs-rhs;
lhs =y(49);
rhs =y(10);
residual(49)= lhs-rhs;
lhs =y(50);
rhs =y(10);
residual(50)= lhs-rhs;
lhs =y(51);
rhs =y(37);
residual(51)= lhs-rhs;
lhs =y(52);
rhs =y(37);
residual(52)= lhs-rhs;
lhs =y(53);
rhs =y(37);
residual(53)= lhs-rhs;
lhs =y(54);
rhs =y(38);
residual(54)= lhs-rhs;
lhs =y(55);
rhs =y(38);
residual(55)= lhs-rhs;
lhs =y(56);
rhs =y(38);
residual(56)= lhs-rhs;
lhs =y(57);
rhs =y(34);
residual(57)= lhs-rhs;
lhs =y(58);
rhs =y(34);
residual(58)= lhs-rhs;
lhs =y(59);
rhs =y(34);
residual(59)= lhs-rhs;
lhs =y(60);
rhs =y(36);
residual(60)= lhs-rhs;
lhs =y(61);
rhs =y(36);
residual(61)= lhs-rhs;
lhs =y(62);
rhs =y(36);
residual(62)= lhs-rhs;
lhs =y(63);
rhs =y(5);
residual(63)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(63, 63);

  %
  % Jacobian matrix
  %

T650 = 1-(1/(1+params(55))+params(55)/(1+params(55)));
  g1(1,19)=(-4);
  g1(1,34)=1;
  g1(2,10)=(-4);
  g1(2,35)=1;
  g1(3,10)=(-4);
  g1(3,36)=1;
  g1(4,9)=(-1);
  g1(4,22)=1;
  g1(4,38)=1;
  g1(5,9)=(-1);
  g1(5,37)=1;
  g1(6,33)=(-1);
  g1(6,39)=1;
  g1(7,34)=1-(params(4)+params(3)+params(1)+params(2));
  g1(7,36)=(-(params(13)+params(12)+params(11)+params(10)+params(9)+params(8)+params(7)+params(6)+params(5)));
  g1(7,37)=(-(params(31)+params(30)+params(29)+params(28)+params(27)+params(26)+params(25)+params(24)+params(23)));
  g1(7,38)=(-(params(22)+params(21)+params(20)+params(19)+params(18)+params(17)+params(16)+params(15)+params(14)));
  g1(8,39)=1;
  g1(9,2)=(-(1-params(37)*params(86)-params(79)));
  g1(9,4)=(-(params(37)*params(86)));
  g1(9,5)=(-(params(86)*(params(51)-params(39))*(1-params(49))));
  g1(9,6)=(-(params(86)*(params(51)-params(39))*(1-params(49))));
  g1(9,8)=(-(params(86)*(params(51)-params(39))*(1-params(49))));
  g1(9,9)=1;
  g1(9,11)=(-(params(86)*params(64)*params(72)));
  g1(9,18)=(-params(79));
  g1(10,2)=T650;
  g1(10,10)=(-T202);
  g1(10,15)=(-T202);
  g1(10,19)=T202;
  g1(11,1)=(-1);
  g1(11,5)=(-params(42));
  g1(11,6)=(-params(42));
  g1(11,7)=params(42);
  g1(11,8)=1;
  g1(12,5)=(-((1-params(37))/(params(72)+1-params(37))-1));
  g1(12,8)=1;
  g1(12,11)=(-(params(72)/(params(72)+1-params(37))));
  g1(13,6)=1;
  g1(13,9)=(-1);
  g1(13,11)=1;
  g1(13,12)=(-1);
  g1(14,4)=1-(T232+T234);
  g1(14,5)=(-T239);
  g1(14,14)=(-1);
  g1(15,3)=(-(1-params(35)));
  g1(15,6)=(-params(35));
  g1(15,9)=1/(1+params(65));
  g1(15,11)=(-(params(64)*params(35)));
  g1(15,13)=(-1);
  g1(16,2)=T287*(-((1-params(55))*params(58)/(1-params(55))));
  g1(16,3)=T287*(-params(57));
  g1(16,10)=(-(params(60)/(1+params(36))+T234-(1+params(36)*params(60))/(1+params(36))));
  g1(16,16)=T287;
  g1(16,20)=1-(T232+T234-T287);
  g1(17,3)=1;
  g1(17,6)=(-1);
  g1(17,11)=(-(1+params(64)));
  g1(17,20)=1;
  g1(18,10)=1-(params(36)/(1+params(36)*params(62))+params(62)/(1+params(36)*params(62)));
  g1(18,12)=(-T317);
  g1(19,4)=(-params(37));
  g1(19,6)=1-(1-params(37));
  g1(19,14)=(-(params(37)*params(63)));
  g1(20,1)=(-(params(43)*(params(39)-params(39)*params(50))));
  g1(20,5)=(-(params(43)*params(39)*params(50)*(params(40)-1)));
  g1(20,6)=(-(params(43)*params(39)*params(50)*(params(40)-1)));
  g1(20,7)=1-params(39)*params(43);
  g1(20,8)=(-(params(43)*params(39)*params(50)*params(40)));
  g1(21,1)=1;
  g1(21,10)=1;
  g1(21,19)=(-1);
  g1(22,1)=1;
  g1(22,8)=(-1);
  g1(22,17)=1;
  g1(23,3)=(-T362);
  g1(23,21)=T362;
  g1(24,18)=(-params(93));
  g1(24,22)=1;
  g1(24,23)=(-(1-params(37)*params(100)-params(93)));
  g1(24,24)=(-(params(37)*params(100)));
  g1(24,31)=params(64)*params(100)*params(87);
  g1(25,15)=(-T202);
  g1(25,23)=T650;
  g1(25,27)=T202;
  g1(26,26)=1;
  g1(26,27)=(-1);
  g1(27,25)=(-((1-params(37))/(1-params(37)+params(87))-1));
  g1(27,26)=1;
  g1(27,31)=(-(params(87)/(1-params(37)+params(87))));
  g1(28,22)=(-1);
  g1(28,28)=1;
  g1(28,31)=1;
  g1(28,32)=(-1);
  g1(29,14)=(-1);
  g1(29,24)=1-(T232+T234);
  g1(29,25)=(-T239);
  g1(30,13)=(-1);
  g1(30,22)=1/(1+params(65));
  g1(30,28)=(-params(35));
  g1(30,30)=(-(1-params(35)));
  g1(30,31)=(-(params(64)*params(35)));
  g1(31,16)=(-1);
  g1(31,29)=1;
  g1(31,30)=(-params(57));
  g1(32,28)=(-1);
  g1(32,29)=1;
  g1(32,30)=1;
  g1(32,31)=(-(1+params(64)));
  g1(33,32)=1;
  g1(34,14)=(-(params(37)*params(63)));
  g1(34,24)=(-params(37));
  g1(34,28)=1-(1-params(37));
  g1(35,15)=1-params(41);
  g1(36,13)=1-params(48);
  g1(37,14)=1-params(46);
  g1(38,16)=1-params(45);
  g1(39,18)=1-params(56);
  g1(39,33)=(-1);
  g1(40,36)=(-1);
  g1(40,40)=1;
  g1(41,36)=(-1);
  g1(41,41)=1;
  g1(42,36)=(-1);
  g1(42,42)=1;
  g1(43,38)=(-1);
  g1(43,43)=1;
  g1(44,38)=(-1);
  g1(44,44)=1;
  g1(45,38)=(-1);
  g1(45,45)=1;
  g1(46,37)=(-1);
  g1(46,46)=1;
  g1(47,37)=(-1);
  g1(47,47)=1;
  g1(48,37)=(-1);
  g1(48,48)=1;
  g1(49,10)=(-1);
  g1(49,49)=1;
  g1(50,10)=(-1);
  g1(50,50)=1;
  g1(51,37)=(-1);
  g1(51,51)=1;
  g1(52,37)=(-1);
  g1(52,52)=1;
  g1(53,37)=(-1);
  g1(53,53)=1;
  g1(54,38)=(-1);
  g1(54,54)=1;
  g1(55,38)=(-1);
  g1(55,55)=1;
  g1(56,38)=(-1);
  g1(56,56)=1;
  g1(57,34)=(-1);
  g1(57,57)=1;
  g1(58,34)=(-1);
  g1(58,58)=1;
  g1(59,34)=(-1);
  g1(59,59)=1;
  g1(60,36)=(-1);
  g1(60,60)=1;
  g1(61,36)=(-1);
  g1(61,61)=1;
  g1(62,36)=(-1);
  g1(62,62)=1;
  g1(63,5)=(-1);
  g1(63,63)=1;
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],63,3969);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],63,250047);
end
end
end
end
