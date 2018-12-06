function [residual, g1, g2] = US_IAC05_static(y, x, params)
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

residual = zeros( 58, 1);

%
% Model equations
%

lhs =y(31);
rhs =y(14)*4;
residual(1)= lhs-rhs;
lhs =y(32);
rhs =y(13)+y(13)+y(45)+y(46);
residual(2)= lhs-rhs;
lhs =y(33);
rhs =4*y(13);
residual(3)= lhs-rhs;
lhs =y(34);
rhs =y(1);
residual(4)= lhs-rhs;
lhs =y(35);
rhs =y(1)-y(16);
residual(5)= lhs-rhs;
lhs =y(31);
rhs =params(32)*x(4)+params(31)*y(44)+params(30)*y(43)+params(29)*y(42)+y(34)*params(28)+params(27)*y(49)+params(26)*y(48)+params(25)*y(47)+y(34)*params(24)+y(34)*params(23)+params(22)*y(41)+params(21)*y(40)+params(20)*y(39)+y(35)*params(19)+params(18)*y(52)+params(17)*y(51)+params(16)*y(50)+y(35)*params(15)+y(35)*params(14)+params(13)*y(38)+params(12)*y(37)+params(11)*y(36)+y(33)*params(10)+y(33)*params(6)+y(33)*params(5)+y(31)*params(1)+params(2)*y(53)+params(3)*y(54)+params(4)*y(55)+params(7)*y(56)+params(8)*y(57)+params(9)*y(58);
residual(6)= lhs-rhs;
lhs =y(1);
rhs =params(75)*y(2)+params(68)*y(3)+params(74)*y(4)+params(76)*y(5);
residual(7)= lhs-rhs;
lhs =y(3);
rhs =y(3)-y(15);
residual(8)= lhs-rhs;
lhs =y(5);
rhs =y(6)+params(36)*(y(5)-y(6))+(1-params(36)*(1-params(42)))*(y(1)-y(7)-y(6))/params(41);
residual(9)= lhs-rhs;
lhs =y(8);
rhs =y(8)*params(60)+(1-params(60))*(y(1)-y(7)-y(11))-y(15)*params(48)*params(34);
residual(10)= lhs-rhs;
lhs =y(8);
rhs =y(8)*params(61)+(1-params(61))*(y(28)-y(12))-y(15)*params(34)*params(49)+(1-params(34)*params(49))*(y(4)-y(4)*params(62));
residual(11)= lhs-rhs;
lhs =y(8);
rhs =y(3)+y(8)*params(34)+y(28)*(1-params(34))+y(11)*params(77)+y(12)*params(78)-y(3)*params(34);
residual(12)= lhs-rhs;
lhs =y(9);
rhs =y(8)+y(11)-y(15);
residual(13)= lhs-rhs;
lhs =y(10);
rhs =y(8)+y(12)-y(15);
residual(14)= lhs-rhs;
lhs =y(1);
rhs =params(38)*(y(29)+y(11)*params(40)+y(6)*params(39))/(params(38)-(1-params(40)-params(39)))-(1-params(40)-params(39))*(y(7)+y(3)*params(47)+y(4)*(1-params(47)))/(params(38)-(1-params(40)-params(39)));
residual(15)= lhs-rhs;
lhs =y(13);
rhs =y(13)*params(34)-y(7)*params(63)+y(30);
residual(16)= lhs-rhs;
lhs =y(6);
rhs =y(5)*params(42)+y(6)*(1-params(42));
residual(17)= lhs-rhs;
lhs =y(9)*params(67);
rhs =params(75)*y(2)+params(76)*y(5)+params(67)*params(79)*(y(14)+y(9)-y(13))-(y(1)-y(7))*(1-params(64)-params(65));
residual(18)= lhs-rhs;
lhs =y(10)*params(73);
rhs =params(74)*y(4)+params(79)*params(73)*(y(14)+y(10)-y(13))-(y(1)-y(7))*params(65);
residual(19)= lhs-rhs;
lhs =y(15);
rhs =y(14)-y(13);
residual(20)= lhs-rhs;
lhs =y(28);
rhs =y(28)*params(51)+x(1);
residual(21)= lhs-rhs;
lhs =y(30);
rhs =y(30)*params(50)+x(2);
residual(22)= lhs-rhs;
lhs =y(29);
rhs =y(29)*params(52)+x(3);
residual(23)= lhs-rhs;
lhs =y(16);
rhs =params(75)*y(17)+params(68)*y(18)+params(74)*y(19)+params(76)*y(20);
residual(24)= lhs-rhs;
lhs =y(18);
rhs =y(18)-y(27);
residual(25)= lhs-rhs;
lhs =y(20);
rhs =y(21)+params(36)*(y(20)-y(21))+(1-params(36)*(1-params(42)))*(y(16)-y(21))/params(41);
residual(26)= lhs-rhs;
lhs =y(22);
rhs =params(60)*y(22)+(1-params(60))*(y(16)-y(25))-params(48)*params(34)*y(27);
residual(27)= lhs-rhs;
lhs =y(22);
rhs =params(61)*y(22)+(1-params(61))*(y(28)-y(26))-params(34)*params(49)*y(27)+(1-params(34)*params(49))*(y(19)-params(62)*y(19));
residual(28)= lhs-rhs;
lhs =y(22);
rhs =y(18)+y(28)*(1-params(34))+params(34)*y(22)+params(77)*y(25)+params(78)*y(26)-params(34)*y(18);
residual(29)= lhs-rhs;
lhs =y(23);
rhs =y(22)+y(25)-y(27);
residual(30)= lhs-rhs;
lhs =y(24);
rhs =y(22)+y(26)-y(27);
residual(31)= lhs-rhs;
lhs =y(16);
rhs =params(38)*(y(29)+params(40)*y(25)+params(39)*y(21))/(params(38)-(1-params(40)-params(39)))-(1-params(40)-params(39))*(params(47)*y(18)+(1-params(47))*y(19))/(params(38)-(1-params(40)-params(39)));
residual(32)= lhs-rhs;
lhs =y(21);
rhs =params(42)*y(20)+(1-params(42))*y(21);
residual(33)= lhs-rhs;
lhs =params(67)*y(23);
rhs =params(75)*y(17)+params(76)*y(20)+params(67)*params(79)*(y(27)+y(23))-y(16)*(1-params(64)-params(65));
residual(34)= lhs-rhs;
lhs =params(73)*y(24);
rhs =params(74)*y(19)+params(79)*params(73)*(y(27)+y(24))-y(16)*params(65);
residual(35)= lhs-rhs;
lhs =y(36);
rhs =y(33);
residual(36)= lhs-rhs;
lhs =y(37);
rhs =y(36);
residual(37)= lhs-rhs;
lhs =y(38);
rhs =y(37);
residual(38)= lhs-rhs;
lhs =y(39);
rhs =y(35);
residual(39)= lhs-rhs;
lhs =y(40);
rhs =y(39);
residual(40)= lhs-rhs;
lhs =y(41);
rhs =y(40);
residual(41)= lhs-rhs;
lhs =y(42);
rhs =y(34);
residual(42)= lhs-rhs;
lhs =y(43);
rhs =y(42);
residual(43)= lhs-rhs;
lhs =y(44);
rhs =y(43);
residual(44)= lhs-rhs;
lhs =y(45);
rhs =y(13);
residual(45)= lhs-rhs;
lhs =y(46);
rhs =y(45);
residual(46)= lhs-rhs;
lhs =y(47);
rhs =y(34);
residual(47)= lhs-rhs;
lhs =y(48);
rhs =y(47);
residual(48)= lhs-rhs;
lhs =y(49);
rhs =y(48);
residual(49)= lhs-rhs;
lhs =y(50);
rhs =y(35);
residual(50)= lhs-rhs;
lhs =y(51);
rhs =y(50);
residual(51)= lhs-rhs;
lhs =y(52);
rhs =y(51);
residual(52)= lhs-rhs;
lhs =y(53);
rhs =y(31);
residual(53)= lhs-rhs;
lhs =y(54);
rhs =y(53);
residual(54)= lhs-rhs;
lhs =y(55);
rhs =y(54);
residual(55)= lhs-rhs;
lhs =y(56);
rhs =y(33);
residual(56)= lhs-rhs;
lhs =y(57);
rhs =y(56);
residual(57)= lhs-rhs;
lhs =y(58);
rhs =y(57);
residual(58)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(58, 58);

  %
  % Jacobian matrix
  %

  g1(1,14)=(-4);
  g1(1,31)=1;
  g1(2,13)=(-2);
  g1(2,32)=1;
  g1(2,45)=(-1);
  g1(2,46)=(-1);
  g1(3,13)=(-4);
  g1(3,33)=1;
  g1(4,1)=(-1);
  g1(4,34)=1;
  g1(5,1)=(-1);
  g1(5,16)=1;
  g1(5,35)=1;
  g1(6,31)=1-params(1);
  g1(6,33)=(-(params(10)+params(6)+params(5)));
  g1(6,34)=(-(params(28)+params(24)+params(23)));
  g1(6,35)=(-(params(19)+params(15)+params(14)));
  g1(6,36)=(-params(11));
  g1(6,37)=(-params(12));
  g1(6,38)=(-params(13));
  g1(6,39)=(-params(20));
  g1(6,40)=(-params(21));
  g1(6,41)=(-params(22));
  g1(6,42)=(-params(29));
  g1(6,43)=(-params(30));
  g1(6,44)=(-params(31));
  g1(6,47)=(-params(25));
  g1(6,48)=(-params(26));
  g1(6,49)=(-params(27));
  g1(6,50)=(-params(16));
  g1(6,51)=(-params(17));
  g1(6,52)=(-params(18));
  g1(6,53)=(-params(2));
  g1(6,54)=(-params(3));
  g1(6,55)=(-params(4));
  g1(6,56)=(-params(7));
  g1(6,57)=(-params(8));
  g1(6,58)=(-params(9));
  g1(7,1)=1;
  g1(7,2)=(-params(75));
  g1(7,3)=(-params(68));
  g1(7,4)=(-params(74));
  g1(7,5)=(-params(76));
  g1(8,15)=1;
  g1(9,1)=(-((1-params(36)*(1-params(42)))/params(41)));
  g1(9,5)=1-params(36);
  g1(9,6)=(-(1-params(36)+(-(1-params(36)*(1-params(42))))/params(41)));
  g1(9,7)=(-((-(1-params(36)*(1-params(42))))/params(41)));
  g1(10,1)=(-(1-params(60)));
  g1(10,7)=1-params(60);
  g1(10,8)=1-params(60);
  g1(10,11)=1-params(60);
  g1(10,15)=params(48)*params(34);
  g1(11,4)=(-((1-params(34)*params(49))*(1-params(62))));
  g1(11,8)=1-params(61);
  g1(11,12)=1-params(61);
  g1(11,15)=params(34)*params(49);
  g1(11,28)=(-(1-params(61)));
  g1(12,3)=(-(1-params(34)));
  g1(12,8)=1-params(34);
  g1(12,11)=(-params(77));
  g1(12,12)=(-params(78));
  g1(12,28)=(-(1-params(34)));
  g1(13,8)=(-1);
  g1(13,9)=1;
  g1(13,11)=(-1);
  g1(13,15)=1;
  g1(14,8)=(-1);
  g1(14,10)=1;
  g1(14,12)=(-1);
  g1(14,15)=1;
  g1(15,1)=1;
  g1(15,3)=(1-params(40)-params(39))*params(47)/(params(38)-(1-params(40)-params(39)));
  g1(15,4)=(1-params(40)-params(39))*(1-params(47))/(params(38)-(1-params(40)-params(39)));
  g1(15,6)=(-(params(38)*params(39)/(params(38)-(1-params(40)-params(39)))));
  g1(15,7)=(1-params(40)-params(39))/(params(38)-(1-params(40)-params(39)));
  g1(15,11)=(-(params(38)*params(40)/(params(38)-(1-params(40)-params(39)))));
  g1(15,29)=(-(params(38)/(params(38)-(1-params(40)-params(39)))));
  g1(16,7)=params(63);
  g1(16,13)=1-params(34);
  g1(16,30)=(-1);
  g1(17,5)=(-params(42));
  g1(17,6)=1-(1-params(42));
  g1(18,1)=1-params(64)-params(65);
  g1(18,2)=(-params(75));
  g1(18,5)=(-params(76));
  g1(18,7)=(-(1-params(64)-params(65)));
  g1(18,9)=params(67)-params(67)*params(79);
  g1(18,13)=params(67)*params(79);
  g1(18,14)=(-(params(67)*params(79)));
  g1(19,1)=params(65);
  g1(19,4)=(-params(74));
  g1(19,7)=(-params(65));
  g1(19,10)=params(73)-params(79)*params(73);
  g1(19,13)=params(79)*params(73);
  g1(19,14)=(-(params(79)*params(73)));
  g1(20,13)=1;
  g1(20,14)=(-1);
  g1(20,15)=1;
  g1(21,28)=1-params(51);
  g1(22,30)=1-params(50);
  g1(23,29)=1-params(52);
  g1(24,16)=1;
  g1(24,17)=(-params(75));
  g1(24,18)=(-params(68));
  g1(24,19)=(-params(74));
  g1(24,20)=(-params(76));
  g1(25,27)=1;
  g1(26,16)=(-((1-params(36)*(1-params(42)))/params(41)));
  g1(26,20)=1-params(36);
  g1(26,21)=(-(1-params(36)+(-(1-params(36)*(1-params(42))))/params(41)));
  g1(27,16)=(-(1-params(60)));
  g1(27,22)=1-params(60);
  g1(27,25)=1-params(60);
  g1(27,27)=params(48)*params(34);
  g1(28,19)=(-((1-params(34)*params(49))*(1-params(62))));
  g1(28,22)=1-params(61);
  g1(28,26)=1-params(61);
  g1(28,27)=params(34)*params(49);
  g1(28,28)=(-(1-params(61)));
  g1(29,18)=(-(1-params(34)));
  g1(29,22)=1-params(34);
  g1(29,25)=(-params(77));
  g1(29,26)=(-params(78));
  g1(29,28)=(-(1-params(34)));
  g1(30,22)=(-1);
  g1(30,23)=1;
  g1(30,25)=(-1);
  g1(30,27)=1;
  g1(31,22)=(-1);
  g1(31,24)=1;
  g1(31,26)=(-1);
  g1(31,27)=1;
  g1(32,16)=1;
  g1(32,18)=(1-params(40)-params(39))*params(47)/(params(38)-(1-params(40)-params(39)));
  g1(32,19)=(1-params(40)-params(39))*(1-params(47))/(params(38)-(1-params(40)-params(39)));
  g1(32,21)=(-(params(38)*params(39)/(params(38)-(1-params(40)-params(39)))));
  g1(32,25)=(-(params(38)*params(40)/(params(38)-(1-params(40)-params(39)))));
  g1(32,29)=(-(params(38)/(params(38)-(1-params(40)-params(39)))));
  g1(33,20)=(-params(42));
  g1(33,21)=1-(1-params(42));
  g1(34,16)=1-params(64)-params(65);
  g1(34,17)=(-params(75));
  g1(34,20)=(-params(76));
  g1(34,23)=params(67)-params(67)*params(79);
  g1(34,27)=(-(params(67)*params(79)));
  g1(35,16)=params(65);
  g1(35,19)=(-params(74));
  g1(35,24)=params(73)-params(79)*params(73);
  g1(35,27)=(-(params(79)*params(73)));
  g1(36,33)=(-1);
  g1(36,36)=1;
  g1(37,36)=(-1);
  g1(37,37)=1;
  g1(38,37)=(-1);
  g1(38,38)=1;
  g1(39,35)=(-1);
  g1(39,39)=1;
  g1(40,39)=(-1);
  g1(40,40)=1;
  g1(41,40)=(-1);
  g1(41,41)=1;
  g1(42,34)=(-1);
  g1(42,42)=1;
  g1(43,42)=(-1);
  g1(43,43)=1;
  g1(44,43)=(-1);
  g1(44,44)=1;
  g1(45,13)=(-1);
  g1(45,45)=1;
  g1(46,45)=(-1);
  g1(46,46)=1;
  g1(47,34)=(-1);
  g1(47,47)=1;
  g1(48,47)=(-1);
  g1(48,48)=1;
  g1(49,48)=(-1);
  g1(49,49)=1;
  g1(50,35)=(-1);
  g1(50,50)=1;
  g1(51,50)=(-1);
  g1(51,51)=1;
  g1(52,51)=(-1);
  g1(52,52)=1;
  g1(53,31)=(-1);
  g1(53,53)=1;
  g1(54,53)=(-1);
  g1(54,54)=1;
  g1(55,54)=(-1);
  g1(55,55)=1;
  g1(56,33)=(-1);
  g1(56,56)=1;
  g1(57,56)=(-1);
  g1(57,57)=1;
  g1(58,57)=(-1);
  g1(58,58)=1;
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],58,3364);
end
end
