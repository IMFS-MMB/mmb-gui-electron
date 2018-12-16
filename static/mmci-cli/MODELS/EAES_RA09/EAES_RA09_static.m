function [residual, g1, g2, g3] = EAES_RA09_static(y, x, params)
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

residual = zeros( 80, 1);

%
% Model equations
%

T296 = (1-params(47))*(1-params(47)*params(48)*(1+params(49))/(1+params(37)))/params(47);
T313 = (1-params(51))*(1-params(48)*params(51))/params(51);
T333 = (1-params(53))*(1-params(48)*params(53)*(1+params(54))/(1+params(39)))/params(53);
T350 = (1-params(56))*(1-params(48)*params(56))/params(56);
lhs =y(53);
rhs =y(4)*4;
residual(1)= lhs-rhs;
lhs =y(54);
rhs =y(45)+y(45)+y(45)+y(45);
residual(2)= lhs-rhs;
lhs =y(55);
rhs =4*y(45);
residual(3)= lhs-rhs;
lhs =y(57);
rhs =y(52);
residual(4)= lhs-rhs;
lhs =y(56);
rhs =y(52);
residual(5)= lhs-rhs;
lhs =y(53);
rhs =params(32)*x(10)+y(56)*params(31)+y(56)*params(30)+y(56)*params(29)+y(56)*params(28)+y(56)*params(27)+y(56)*params(26)+y(56)*params(25)+y(56)*params(24)+y(56)*params(23)+y(57)*params(22)+y(57)*params(21)+y(57)*params(20)+y(57)*params(19)+y(57)*params(18)+y(57)*params(17)+y(57)*params(16)+y(57)*params(15)+y(57)*params(14)+y(55)*params(13)+y(55)*params(12)+y(55)*params(11)+y(55)*params(10)+y(55)*params(6)+y(55)*params(5)+y(53)*params(1)+y(53)*params(2)+y(53)*params(3)+y(53)*params(4)+y(55)*params(7)+y(55)*params(8)+y(55)*params(9);
residual(6)= lhs-rhs;
residual(7) = y(1);
residual(8) = y(2);
lhs =y(52);
rhs =y(50)*params(59)+y(51)*(1-params(59));
residual(9)= lhs-rhs;
lhs =y(3);
rhs =y(3)+y(4)-y(5);
residual(10)= lhs-rhs;
lhs =(-y(7))*(1-params(38)/((1+params(36))*(1+params(39))));
rhs =y(8)-y(8)*params(35)/((1+params(36))*(1+params(39)));
residual(11)= lhs-rhs;
lhs =(-y(3))*(1-params(35)/((1+params(36))*(1+params(37))));
rhs =y(6)-params(35)/((1+params(36))*(1+params(37)))*y(6);
residual(12)= lhs-rhs;
lhs =y(9);
rhs =y(7)-y(3);
residual(13)= lhs-rhs;
lhs =y(18);
rhs =y(6)+(-params(40))*y(11)-(params(41)-params(40))*y(13);
residual(14)= lhs-rhs;
lhs =y(19);
rhs =y(6)+(-params(40))*y(12)-(params(41)-params(40))*y(13);
residual(15)= lhs-rhs;
lhs =y(20);
rhs =y(6)+(-params(41))*y(10);
residual(16)= lhs-rhs;
lhs =y(21);
rhs =y(8)+(-params(40))*y(15)-(params(41)-params(40))*y(17);
residual(17)= lhs-rhs;
lhs =y(22);
rhs =y(8)+(-params(40))*y(16)-(params(41)-params(40))*y(17);
residual(18)= lhs-rhs;
lhs =y(23);
rhs =y(8)+(-params(41))*y(14);
residual(19)= lhs-rhs;
lhs =params(42)*y(24);
rhs =y(3)+y(25);
residual(20)= lhs-rhs;
lhs =params(43)*y(26);
rhs =y(7)+y(27);
residual(21)= lhs-rhs;
lhs =y(24);
rhs =(1-params(44))*y(28)+params(44)*y(29);
residual(22)= lhs-rhs;
lhs =y(26);
rhs =(1-params(45))*y(30)+params(45)*y(31);
residual(23)= lhs-rhs;
lhs =y(32);
rhs =y(28)+y(33);
residual(24)= lhs-rhs;
lhs =y(34);
rhs =y(29)+y(35);
residual(25)= lhs-rhs;
lhs =y(36);
rhs =y(30)+y(37);
residual(26)= lhs-rhs;
lhs =y(38);
rhs =y(31)+y(39);
residual(27)= lhs-rhs;
lhs =y(41)-y(41)*params(46);
rhs =T296*(y(25)-y(10)-y(33))+(y(41)-y(41)*params(46))*params(48)*(1+params(49))/(1+params(37));
residual(28)= lhs-rhs;
lhs =y(40)-y(40)*params(50);
rhs =T313*(y(25)-y(11)-y(35))+params(48)*(y(40)-y(40)*params(50));
residual(29)= lhs-rhs;
lhs =y(42)-y(42)*params(52);
rhs =T333*(y(27)-y(14)-y(37))+(y(42)-y(42)*params(52))*params(48)*(1+params(54))/(1+params(39));
residual(30)= lhs-rhs;
lhs =y(43)-y(43)*params(55);
rhs =T350*(y(27)-y(16)-y(39))+params(48)*(y(43)-y(43)*params(55));
residual(31)= lhs-rhs;
lhs =y(5);
rhs =y(40)*params(44)*params(57)+y(43)*params(44)*(1-params(57))+(1-params(44))*y(41);
residual(32)= lhs-rhs;
lhs =y(44);
rhs =y(40)*params(45)*(1-params(58))+y(43)*params(45)*params(58)+(1-params(45))*y(42);
residual(33)= lhs-rhs;
lhs =y(45);
rhs =params(59)*y(5)+(1-params(59))*y(44);
residual(34)= lhs-rhs;
lhs =y(11);
rhs =y(11)+y(40)-y(5);
residual(35)= lhs-rhs;
lhs =y(12);
rhs =y(12)+y(43)-y(5);
residual(36)= lhs-rhs;
lhs =y(10);
rhs =y(13)*(-params(44))/(1-params(44));
residual(37)= lhs-rhs;
lhs =y(13);
rhs =y(11)*params(57)+y(12)*(1-params(57));
residual(38)= lhs-rhs;
lhs =y(14);
rhs =y(14)+y(42)-y(44);
residual(39)= lhs-rhs;
lhs =y(17);
rhs =y(15)*(1-params(58))+y(16)*params(58);
residual(40)= lhs-rhs;
lhs =y(15);
rhs =y(15)+y(40)-y(44);
residual(41)= lhs-rhs;
lhs =y(16);
rhs =y(16)+y(43)-y(44);
residual(42)= lhs-rhs;
lhs =y(9);
rhs =(-(1-params(44)))*(y(10)-y(13))+(1-params(45))*(y(14)-y(17))+(1-params(57)-params(58))*(y(11)-y(12));
residual(43)= lhs-rhs;
lhs =y(32);
rhs =y(20)*(1-params(60))+params(60)*y(46);
residual(44)= lhs-rhs;
lhs =y(34);
rhs =(1-params(60))*(y(18)*params(57)+y(21)*(1-params(57)))+params(60)*y(47);
residual(45)= lhs-rhs;
lhs =y(36);
rhs =y(23)*(1-params(61))+params(61)*y(48);
residual(46)= lhs-rhs;
lhs =y(38);
rhs =(1-params(61))*(y(19)*(1-params(58))+y(22)*params(58))+params(61)*y(49);
residual(47)= lhs-rhs;
lhs =y(50);
rhs =params(44)*(y(11)+y(34))+(1-params(44))*(y(10)+y(32));
residual(48)= lhs-rhs;
lhs =y(51);
rhs =params(45)*(y(16)+y(38))+(1-params(45))*(y(14)+y(36));
residual(49)= lhs-rhs;
lhs =y(35);
rhs =y(35)*params(64)+x(1)+x(4);
residual(50)= lhs-rhs;
lhs =y(33);
rhs =y(33)*params(65)+x(2);
residual(51)= lhs-rhs;
lhs =y(39);
rhs =x(4)+y(39)*params(66)+x(3);
residual(52)= lhs-rhs;
lhs =y(37);
rhs =y(37)*params(67)+x(5);
residual(53)= lhs-rhs;
lhs =y(47);
rhs =y(47)*params(68)+x(6);
residual(54)= lhs-rhs;
lhs =y(46);
rhs =y(46)*params(69)+x(7);
residual(55)= lhs-rhs;
lhs =y(49);
rhs =y(49)*params(70)+x(8);
residual(56)= lhs-rhs;
lhs =y(48);
rhs =y(48)*params(71)+x(9);
residual(57)= lhs-rhs;
lhs =y(58);
rhs =y(55);
residual(58)= lhs-rhs;
lhs =y(59);
rhs =y(55);
residual(59)= lhs-rhs;
lhs =y(60);
rhs =y(55);
residual(60)= lhs-rhs;
lhs =y(61);
rhs =y(57);
residual(61)= lhs-rhs;
lhs =y(62);
rhs =y(57);
residual(62)= lhs-rhs;
lhs =y(63);
rhs =y(57);
residual(63)= lhs-rhs;
lhs =y(64);
rhs =y(56);
residual(64)= lhs-rhs;
lhs =y(65);
rhs =y(56);
residual(65)= lhs-rhs;
lhs =y(66);
rhs =y(56);
residual(66)= lhs-rhs;
lhs =y(67);
rhs =y(45);
residual(67)= lhs-rhs;
lhs =y(68);
rhs =y(45);
residual(68)= lhs-rhs;
lhs =y(69);
rhs =y(56);
residual(69)= lhs-rhs;
lhs =y(70);
rhs =y(56);
residual(70)= lhs-rhs;
lhs =y(71);
rhs =y(56);
residual(71)= lhs-rhs;
lhs =y(72);
rhs =y(57);
residual(72)= lhs-rhs;
lhs =y(73);
rhs =y(57);
residual(73)= lhs-rhs;
lhs =y(74);
rhs =y(57);
residual(74)= lhs-rhs;
lhs =y(75);
rhs =y(53);
residual(75)= lhs-rhs;
lhs =y(76);
rhs =y(53);
residual(76)= lhs-rhs;
lhs =y(77);
rhs =y(53);
residual(77)= lhs-rhs;
lhs =y(78);
rhs =y(55);
residual(78)= lhs-rhs;
lhs =y(79);
rhs =y(55);
residual(79)= lhs-rhs;
lhs =y(80);
rhs =y(55);
residual(80)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(80, 80);

  %
  % Jacobian matrix
  %

  g1(1,4)=(-4);
  g1(1,53)=1;
  g1(2,45)=(-4);
  g1(2,54)=1;
  g1(3,45)=(-4);
  g1(3,55)=1;
  g1(4,52)=(-1);
  g1(4,57)=1;
  g1(5,52)=(-1);
  g1(5,56)=1;
  g1(6,53)=1-(params(4)+params(3)+params(1)+params(2));
  g1(6,55)=(-(params(13)+params(12)+params(11)+params(10)+params(9)+params(8)+params(7)+params(6)+params(5)));
  g1(6,56)=(-(params(31)+params(30)+params(29)+params(28)+params(27)+params(26)+params(25)+params(24)+params(23)));
  g1(6,57)=(-(params(22)+params(21)+params(20)+params(19)+params(18)+params(17)+params(16)+params(15)+params(14)));
  g1(7,1)=1;
  g1(8,2)=1;
  g1(9,50)=(-params(59));
  g1(9,51)=(-(1-params(59)));
  g1(9,52)=1;
  g1(10,4)=(-1);
  g1(10,5)=1;
  g1(11,7)=(-(1-params(38)/((1+params(36))*(1+params(39)))));
  g1(11,8)=(-(1-params(35)/((1+params(36))*(1+params(39)))));
  g1(12,3)=(-(1-params(35)/((1+params(36))*(1+params(37)))));
  g1(12,6)=(-(1-params(35)/((1+params(36))*(1+params(37)))));
  g1(13,3)=1;
  g1(13,7)=(-1);
  g1(13,9)=1;
  g1(14,6)=(-1);
  g1(14,11)=params(40);
  g1(14,13)=params(41)-params(40);
  g1(14,18)=1;
  g1(15,6)=(-1);
  g1(15,12)=params(40);
  g1(15,13)=params(41)-params(40);
  g1(15,19)=1;
  g1(16,6)=(-1);
  g1(16,10)=params(41);
  g1(16,20)=1;
  g1(17,8)=(-1);
  g1(17,15)=params(40);
  g1(17,17)=params(41)-params(40);
  g1(17,21)=1;
  g1(18,8)=(-1);
  g1(18,16)=params(40);
  g1(18,17)=params(41)-params(40);
  g1(18,22)=1;
  g1(19,8)=(-1);
  g1(19,14)=params(41);
  g1(19,23)=1;
  g1(20,3)=(-1);
  g1(20,24)=params(42);
  g1(20,25)=(-1);
  g1(21,7)=(-1);
  g1(21,26)=params(43);
  g1(21,27)=(-1);
  g1(22,24)=1;
  g1(22,28)=(-(1-params(44)));
  g1(22,29)=(-params(44));
  g1(23,26)=1;
  g1(23,30)=(-(1-params(45)));
  g1(23,31)=(-params(45));
  g1(24,28)=(-1);
  g1(24,32)=1;
  g1(24,33)=(-1);
  g1(25,29)=(-1);
  g1(25,34)=1;
  g1(25,35)=(-1);
  g1(26,30)=(-1);
  g1(26,36)=1;
  g1(26,37)=(-1);
  g1(27,31)=(-1);
  g1(27,38)=1;
  g1(27,39)=(-1);
  g1(28,10)=T296;
  g1(28,25)=(-T296);
  g1(28,33)=T296;
  g1(28,41)=1-params(46)-params(48)*(1+params(49))/(1+params(37))*(1-params(46));
  g1(29,11)=T313;
  g1(29,25)=(-T313);
  g1(29,35)=T313;
  g1(29,40)=1-params(50)-params(48)*(1-params(50));
  g1(30,14)=T333;
  g1(30,27)=(-T333);
  g1(30,37)=T333;
  g1(30,42)=1-params(52)-params(48)*(1+params(54))/(1+params(39))*(1-params(52));
  g1(31,16)=T350;
  g1(31,27)=(-T350);
  g1(31,39)=T350;
  g1(31,43)=1-params(55)-params(48)*(1-params(55));
  g1(32,5)=1;
  g1(32,40)=(-(params(44)*params(57)));
  g1(32,41)=(-(1-params(44)));
  g1(32,43)=(-(params(44)*(1-params(57))));
  g1(33,40)=(-(params(45)*(1-params(58))));
  g1(33,42)=(-(1-params(45)));
  g1(33,43)=(-(params(45)*params(58)));
  g1(33,44)=1;
  g1(34,5)=(-params(59));
  g1(34,44)=(-(1-params(59)));
  g1(34,45)=1;
  g1(35,5)=1;
  g1(35,40)=(-1);
  g1(36,5)=1;
  g1(36,43)=(-1);
  g1(37,10)=1;
  g1(37,13)=(-((-params(44))/(1-params(44))));
  g1(38,11)=(-params(57));
  g1(38,12)=(-(1-params(57)));
  g1(38,13)=1;
  g1(39,42)=(-1);
  g1(39,44)=1;
  g1(40,15)=(-(1-params(58)));
  g1(40,16)=(-params(58));
  g1(40,17)=1;
  g1(41,40)=(-1);
  g1(41,44)=1;
  g1(42,43)=(-1);
  g1(42,44)=1;
  g1(43,9)=1;
  g1(43,10)=1-params(44);
  g1(43,11)=(-(1-params(57)-params(58)));
  g1(43,12)=1-params(57)-params(58);
  g1(43,13)=(-(1-params(44)));
  g1(43,14)=(-(1-params(45)));
  g1(43,17)=1-params(45);
  g1(44,20)=(-(1-params(60)));
  g1(44,32)=1;
  g1(44,46)=(-params(60));
  g1(45,18)=(-(params(57)*(1-params(60))));
  g1(45,21)=(-((1-params(57))*(1-params(60))));
  g1(45,34)=1;
  g1(45,47)=(-params(60));
  g1(46,23)=(-(1-params(61)));
  g1(46,36)=1;
  g1(46,48)=(-params(61));
  g1(47,19)=(-((1-params(58))*(1-params(61))));
  g1(47,22)=(-(params(58)*(1-params(61))));
  g1(47,38)=1;
  g1(47,49)=(-params(61));
  g1(48,10)=(-(1-params(44)));
  g1(48,11)=(-params(44));
  g1(48,32)=(-(1-params(44)));
  g1(48,34)=(-params(44));
  g1(48,50)=1;
  g1(49,14)=(-(1-params(45)));
  g1(49,16)=(-params(45));
  g1(49,36)=(-(1-params(45)));
  g1(49,38)=(-params(45));
  g1(49,51)=1;
  g1(50,35)=1-params(64);
  g1(51,33)=1-params(65);
  g1(52,39)=1-params(66);
  g1(53,37)=1-params(67);
  g1(54,47)=1-params(68);
  g1(55,46)=1-params(69);
  g1(56,49)=1-params(70);
  g1(57,48)=1-params(71);
  g1(58,55)=(-1);
  g1(58,58)=1;
  g1(59,55)=(-1);
  g1(59,59)=1;
  g1(60,55)=(-1);
  g1(60,60)=1;
  g1(61,57)=(-1);
  g1(61,61)=1;
  g1(62,57)=(-1);
  g1(62,62)=1;
  g1(63,57)=(-1);
  g1(63,63)=1;
  g1(64,56)=(-1);
  g1(64,64)=1;
  g1(65,56)=(-1);
  g1(65,65)=1;
  g1(66,56)=(-1);
  g1(66,66)=1;
  g1(67,45)=(-1);
  g1(67,67)=1;
  g1(68,45)=(-1);
  g1(68,68)=1;
  g1(69,56)=(-1);
  g1(69,69)=1;
  g1(70,56)=(-1);
  g1(70,70)=1;
  g1(71,56)=(-1);
  g1(71,71)=1;
  g1(72,57)=(-1);
  g1(72,72)=1;
  g1(73,57)=(-1);
  g1(73,73)=1;
  g1(74,57)=(-1);
  g1(74,74)=1;
  g1(75,53)=(-1);
  g1(75,75)=1;
  g1(76,53)=(-1);
  g1(76,76)=1;
  g1(77,53)=(-1);
  g1(77,77)=1;
  g1(78,55)=(-1);
  g1(78,78)=1;
  g1(79,55)=(-1);
  g1(79,79)=1;
  g1(80,55)=(-1);
  g1(80,80)=1;
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],80,6400);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],80,512000);
end
end
end
end
