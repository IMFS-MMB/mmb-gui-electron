function [residual, g1, g2, g3] = EA_GE10_dynamic(y, x, params, steady_state, it_)
%
% Status : Computes dynamic model for Dynare
%
% Inputs :
%   y         [#dynamic variables by 1] double    vector of endogenous variables in the order stored
%                                                 in M_.lead_lag_incidence; see the Manual
%   x         [M_.exo_nbr by nperiods] double     matrix of exogenous variables (in declaration order)
%                                                 for all simulation periods
%   params    [M_.param_nbr by 1] double          vector of parameter values in declaration order
%   it_       scalar double                       time period for exogenous variables for which to evaluate the model
%
% Outputs:
%   residual  [M_.endo_nbr by 1] double    vector of residuals of the dynamic model equations in order of 
%                                          declaration of the equations
%   g1        [M_.endo_nbr by #dynamic variables] double    Jacobian matrix of the dynamic model equations;
%                                                           rows: equations in order of declaration
%                                                           columns: variables in order stored in M_.lead_lag_incidence
%   g2        [M_.endo_nbr by (#dynamic variables)^2] double   Hessian matrix of the dynamic model equations;
%                                                              rows: equations in order of declaration
%                                                              columns: variables in order stored in M_.lead_lag_incidence
%   g3        [M_.endo_nbr by (#dynamic variables)^3] double   Third order derivative matrix of the dynamic model equations;
%                                                              rows: equations in order of declaration
%                                                              columns: variables in order stored in M_.lead_lag_incidence
%
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

%
% Model equations
%

residual = zeros(63, 1);
T3 = (-1);
T216 = (1-params(55))/((1+params(55))*params(58));
T250 = 1/(1+params(36));
T253 = params(36)/(1+params(36));
T259 = 1/params(63)/(1+params(36));
T309 = T250*(1-params(36)*params(59))*(1-params(59))/(params(59)*(1+(1+params(61))*params(57)/params(61)));
T312 = params(58)/(1-params(55));
T339 = (1-params(38))*(1-params(36)*params(38))/params(38)/(1+params(36)*params(62));
T392 = (1-params(52))*(1-params(36)*params(52))/params(52);
lhs =y(72);
rhs =y(57)*4;
residual(1)= lhs-rhs;
lhs =y(73);
rhs =y(48)+y(8)+y(24)+y(25);
residual(2)= lhs-rhs;
lhs =y(74);
rhs =4*y(48);
residual(3)= lhs-rhs;
lhs =y(76);
rhs =y(47)-y(60);
residual(4)= lhs-rhs;
lhs =y(75);
rhs =y(47);
residual(5)= lhs-rhs;
lhs =y(77);
rhs =y(71);
residual(6)= lhs-rhs;
lhs =y(72);
rhs =params(32)*x(it_, 7)+params(31)*y(122)+params(30)*y(121)+params(29)*y(120)+params(28)*y(112)+params(27)*y(28)+params(26)*y(27)+params(25)*y(26)+params(24)*y(22)+y(75)*params(23)+params(22)*y(119)+params(21)*y(118)+params(20)*y(117)+params(19)*y(113)+params(18)*y(31)+params(17)*y(30)+params(16)*y(29)+params(15)*y(23)+y(76)*params(14)+params(13)*y(116)+params(12)*y(115)+params(11)*y(114)+params(10)*y(111)+params(6)*y(21)+y(74)*params(5)+params(1)*y(20)+params(2)*y(32)+params(3)*y(33)+params(4)*y(34)+params(7)*y(35)+params(8)*y(36)+params(9)*y(37);
residual(7)= lhs-rhs;
lhs =y(77);
rhs =params(34)*x(it_, 8);
residual(8)= lhs-rhs;
lhs =y(47);
rhs =(1-params(37)*params(86)-params(79))*y(40)+params(37)*params(86)*y(42)+params(79)*y(56)+params(86)*params(64)*params(72)*y(49)+params(86)*(params(51)-params(39))*(1-params(49))*(y(46)+y(4)+y(44));
residual(9)= lhs-rhs;
lhs =y(40);
rhs =1/(1+params(55))*y(102)+params(55)/(1+params(55))*y(2)-T216*(y(57)-y(105))+T216*y(53);
residual(10)= lhs-rhs;
lhs =y(104);
rhs =y(39)-params(42)*(y(45)-y(4)-y(44));
residual(11)= lhs-rhs;
lhs =y(46);
rhs =(params(72)*y(49)+(1-params(37))*y(43))/(params(72)+1-params(37))-y(4);
residual(12)= lhs-rhs;
lhs =y(49);
rhs =y(47)+y(50)-y(5);
residual(13)= lhs-rhs;
lhs =y(42);
rhs =T250*y(3)+T253*y(103)+y(43)*T259+y(52);
residual(14)= lhs-rhs;
lhs =y(47)/(1+params(65));
rhs =params(35)*(y(5)+params(64)*y(49))+(1-params(35))*y(41)+y(51);
residual(15)= lhs-rhs;
lhs =y(58);
rhs =T253*y(106)+T250*y(14)+y(105)*T253-y(48)*(1+params(36)*params(60))/(1+params(36))+y(8)*params(60)/(1+params(36))-T309*(y(58)-y(41)*params(57)-T312*(y(40)-params(55)*y(2))+y(54))+x(it_, 6);
residual(16)= lhs-rhs;
lhs =y(41);
rhs =y(5)+(-y(58))+y(49)*(1+params(64));
residual(17)= lhs-rhs;
lhs =y(48);
rhs =y(50)*T339+y(105)*params(36)/(1+params(36)*params(62))+y(8)*params(62)/(1+params(36)*params(62))+x(it_, 5);
residual(18)= lhs-rhs;
lhs =y(44);
rhs =(1-params(37))*y(5)+params(37)*(y(42)+params(63)*y(52));
residual(19)= lhs-rhs;
lhs =y(45);
rhs =params(43)*(params(39)*(y(1)+y(6))+params(39)*params(50)*(params(40)*y(7)-y(1))+params(39)*params(50)*(params(40)-1)*(y(5)+y(38)));
residual(20)= lhs-rhs;
lhs =y(39);
rhs =y(57)-y(105);
residual(21)= lhs-rhs;
lhs =y(55);
rhs =y(104)-y(39);
residual(22)= lhs-rhs;
lhs =y(59)-y(15);
rhs =params(36)*(y(107)-y(59))+T392*(y(41)-y(59));
residual(23)= lhs-rhs;
lhs =y(60);
rhs =(1-params(37)*params(100)-params(93))*y(61)+params(37)*params(100)*y(62)+y(56)*params(93)-params(64)*params(100)*params(87)*y(69);
residual(24)= lhs-rhs;
lhs =y(61);
rhs =T216*y(53)+1/(1+params(55))*y(108)+params(55)/(1+params(55))*y(16)-T216*y(65);
residual(25)= lhs-rhs;
lhs =y(110);
rhs =y(65);
residual(26)= lhs-rhs;
lhs =y(64);
rhs =(params(87)*y(69)+(1-params(37))*y(63))/(1-params(37)+params(87))-y(18);
residual(27)= lhs-rhs;
lhs =y(69);
rhs =y(60)+y(70)-y(19);
residual(28)= lhs-rhs;
lhs =y(62);
rhs =y(52)+T250*y(17)+T253*y(109)+T259*y(63);
residual(29)= lhs-rhs;
lhs =y(60)/(1+params(65));
rhs =y(51)+params(35)*(y(19)+params(64)*y(69))+(1-params(35))*y(68);
residual(30)= lhs-rhs;
lhs =y(67);
rhs =y(54)+params(57)*y(68)+T312*y(61)-T312*y(16);
residual(31)= lhs-rhs;
lhs =y(68);
rhs =y(19)+(-y(67))+(1+params(64))*y(69);
residual(32)= lhs-rhs;
residual(33) = y(70);
lhs =y(66);
rhs =(1-params(37))*y(19)+params(37)*(params(63)*y(52)+y(62));
residual(34)= lhs-rhs;
lhs =y(53);
rhs =params(41)*y(11)+x(it_, 2);
residual(35)= lhs-rhs;
lhs =y(51);
rhs =params(48)*y(9)+x(it_, 4);
residual(36)= lhs-rhs;
lhs =y(52);
rhs =params(46)*y(10)+x(it_, 1);
residual(37)= lhs-rhs;
lhs =y(54);
rhs =params(45)*y(12)+x(it_, 3);
residual(38)= lhs-rhs;
lhs =y(56);
rhs =y(71)+params(56)*y(13);
residual(39)= lhs-rhs;
lhs =y(78);
rhs =y(111);
residual(40)= lhs-rhs;
lhs =y(79);
rhs =y(114);
residual(41)= lhs-rhs;
lhs =y(80);
rhs =y(115);
residual(42)= lhs-rhs;
lhs =y(81);
rhs =y(113);
residual(43)= lhs-rhs;
lhs =y(82);
rhs =y(117);
residual(44)= lhs-rhs;
lhs =y(83);
rhs =y(118);
residual(45)= lhs-rhs;
lhs =y(84);
rhs =y(112);
residual(46)= lhs-rhs;
lhs =y(85);
rhs =y(120);
residual(47)= lhs-rhs;
lhs =y(86);
rhs =y(121);
residual(48)= lhs-rhs;
lhs =y(87);
rhs =y(8);
residual(49)= lhs-rhs;
lhs =y(88);
rhs =y(24);
residual(50)= lhs-rhs;
lhs =y(89);
rhs =y(22);
residual(51)= lhs-rhs;
lhs =y(90);
rhs =y(26);
residual(52)= lhs-rhs;
lhs =y(91);
rhs =y(27);
residual(53)= lhs-rhs;
lhs =y(92);
rhs =y(23);
residual(54)= lhs-rhs;
lhs =y(93);
rhs =y(29);
residual(55)= lhs-rhs;
lhs =y(94);
rhs =y(30);
residual(56)= lhs-rhs;
lhs =y(95);
rhs =y(20);
residual(57)= lhs-rhs;
lhs =y(96);
rhs =y(32);
residual(58)= lhs-rhs;
lhs =y(97);
rhs =y(33);
residual(59)= lhs-rhs;
lhs =y(98);
rhs =y(21);
residual(60)= lhs-rhs;
lhs =y(99);
rhs =y(35);
residual(61)= lhs-rhs;
lhs =y(100);
rhs =y(36);
residual(62)= lhs-rhs;
lhs =y(101);
rhs =y(4);
residual(63)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(63, 130);

  %
  % Jacobian matrix
  %

  g1(1,57)=(-4);
  g1(1,72)=1;
  g1(2,8)=T3;
  g1(2,48)=T3;
  g1(2,73)=1;
  g1(2,24)=T3;
  g1(2,25)=T3;
  g1(3,48)=(-4);
  g1(3,74)=1;
  g1(4,47)=T3;
  g1(4,60)=1;
  g1(4,76)=1;
  g1(5,47)=T3;
  g1(5,75)=1;
  g1(6,71)=T3;
  g1(6,77)=1;
  g1(7,20)=(-params(1));
  g1(7,72)=1;
  g1(7,21)=(-params(6));
  g1(7,74)=(-params(5));
  g1(7,111)=(-params(10));
  g1(7,22)=(-params(24));
  g1(7,75)=(-params(23));
  g1(7,112)=(-params(28));
  g1(7,23)=(-params(15));
  g1(7,76)=(-params(14));
  g1(7,113)=(-params(19));
  g1(7,129)=(-params(32));
  g1(7,114)=(-params(11));
  g1(7,115)=(-params(12));
  g1(7,116)=(-params(13));
  g1(7,117)=(-params(20));
  g1(7,118)=(-params(21));
  g1(7,119)=(-params(22));
  g1(7,120)=(-params(29));
  g1(7,121)=(-params(30));
  g1(7,122)=(-params(31));
  g1(7,26)=(-params(25));
  g1(7,27)=(-params(26));
  g1(7,28)=(-params(27));
  g1(7,29)=(-params(16));
  g1(7,30)=(-params(17));
  g1(7,31)=(-params(18));
  g1(7,32)=(-params(2));
  g1(7,33)=(-params(3));
  g1(7,34)=(-params(4));
  g1(7,35)=(-params(7));
  g1(7,36)=(-params(8));
  g1(7,37)=(-params(9));
  g1(8,77)=1;
  g1(8,130)=(-params(34));
  g1(9,40)=(-(1-params(37)*params(86)-params(79)));
  g1(9,42)=(-(params(37)*params(86)));
  g1(9,4)=(-(params(86)*(params(51)-params(39))*(1-params(49))));
  g1(9,44)=(-(params(86)*(params(51)-params(39))*(1-params(49))));
  g1(9,46)=(-(params(86)*(params(51)-params(39))*(1-params(49))));
  g1(9,47)=1;
  g1(9,49)=(-(params(86)*params(64)*params(72)));
  g1(9,56)=(-params(79));
  g1(10,2)=(-(params(55)/(1+params(55))));
  g1(10,40)=1;
  g1(10,102)=(-(1/(1+params(55))));
  g1(10,105)=(-T216);
  g1(10,53)=(-T216);
  g1(10,57)=T216;
  g1(11,39)=T3;
  g1(11,4)=(-params(42));
  g1(11,44)=(-params(42));
  g1(11,45)=params(42);
  g1(11,104)=1;
  g1(12,4)=1;
  g1(12,43)=(-((1-params(37))/(params(72)+1-params(37))));
  g1(12,46)=1;
  g1(12,49)=(-(params(72)/(params(72)+1-params(37))));
  g1(13,5)=1;
  g1(13,47)=T3;
  g1(13,49)=1;
  g1(13,50)=T3;
  g1(14,3)=(-T250);
  g1(14,42)=1;
  g1(14,103)=(-T253);
  g1(14,43)=(-T259);
  g1(14,52)=T3;
  g1(15,41)=(-(1-params(35)));
  g1(15,5)=(-params(35));
  g1(15,47)=1/(1+params(65));
  g1(15,49)=(-(params(64)*params(35)));
  g1(15,51)=T3;
  g1(16,2)=T309*(-(T312*(-params(55))));
  g1(16,40)=T309*(-T312);
  g1(16,41)=T309*(-params(57));
  g1(16,8)=(-(params(60)/(1+params(36))));
  g1(16,48)=(1+params(36)*params(60))/(1+params(36));
  g1(16,105)=(-T253);
  g1(16,54)=T309;
  g1(16,14)=(-T250);
  g1(16,58)=1-(-T309);
  g1(16,106)=(-T253);
  g1(16,128)=T3;
  g1(17,41)=1;
  g1(17,5)=T3;
  g1(17,49)=(-(1+params(64)));
  g1(17,58)=1;
  g1(18,8)=(-(params(62)/(1+params(36)*params(62))));
  g1(18,48)=1;
  g1(18,105)=(-(params(36)/(1+params(36)*params(62))));
  g1(18,50)=(-T339);
  g1(18,127)=T3;
  g1(19,42)=(-params(37));
  g1(19,5)=(-(1-params(37)));
  g1(19,44)=1;
  g1(19,52)=(-(params(37)*params(63)));
  g1(20,1)=(-(params(43)*(params(39)-params(39)*params(50))));
  g1(20,5)=(-(params(43)*params(39)*params(50)*(params(40)-1)));
  g1(20,6)=(-(params(39)*params(43)));
  g1(20,45)=1;
  g1(20,7)=(-(params(43)*params(39)*params(50)*params(40)));
  g1(20,38)=(-(params(43)*params(39)*params(50)*(params(40)-1)));
  g1(21,39)=1;
  g1(21,105)=1;
  g1(21,57)=T3;
  g1(22,39)=1;
  g1(22,104)=T3;
  g1(22,55)=1;
  g1(23,41)=(-T392);
  g1(23,15)=T3;
  g1(23,59)=1-((-params(36))-T392);
  g1(23,107)=(-params(36));
  g1(24,56)=(-params(93));
  g1(24,60)=1;
  g1(24,61)=(-(1-params(37)*params(100)-params(93)));
  g1(24,62)=(-(params(37)*params(100)));
  g1(24,69)=params(64)*params(100)*params(87);
  g1(25,53)=(-T216);
  g1(25,16)=(-(params(55)/(1+params(55))));
  g1(25,61)=1;
  g1(25,108)=(-(1/(1+params(55))));
  g1(25,65)=T216;
  g1(26,110)=1;
  g1(26,65)=T3;
  g1(27,18)=1;
  g1(27,63)=(-((1-params(37))/(1-params(37)+params(87))));
  g1(27,64)=1;
  g1(27,69)=(-(params(87)/(1-params(37)+params(87))));
  g1(28,60)=T3;
  g1(28,19)=1;
  g1(28,69)=1;
  g1(28,70)=T3;
  g1(29,52)=T3;
  g1(29,17)=(-T250);
  g1(29,62)=1;
  g1(29,109)=(-T253);
  g1(29,63)=(-T259);
  g1(30,51)=T3;
  g1(30,60)=1/(1+params(65));
  g1(30,19)=(-params(35));
  g1(30,68)=(-(1-params(35)));
  g1(30,69)=(-(params(64)*params(35)));
  g1(31,54)=T3;
  g1(31,16)=T312;
  g1(31,61)=(-T312);
  g1(31,67)=1;
  g1(31,68)=(-params(57));
  g1(32,19)=T3;
  g1(32,67)=1;
  g1(32,68)=1;
  g1(32,69)=(-(1+params(64)));
  g1(33,70)=1;
  g1(34,52)=(-(params(37)*params(63)));
  g1(34,62)=(-params(37));
  g1(34,19)=(-(1-params(37)));
  g1(34,66)=1;
  g1(35,11)=(-params(41));
  g1(35,53)=1;
  g1(35,124)=T3;
  g1(36,9)=(-params(48));
  g1(36,51)=1;
  g1(36,126)=T3;
  g1(37,10)=(-params(46));
  g1(37,52)=1;
  g1(37,123)=T3;
  g1(38,12)=(-params(45));
  g1(38,54)=1;
  g1(38,125)=T3;
  g1(39,13)=(-params(56));
  g1(39,56)=1;
  g1(39,71)=T3;
  g1(40,111)=T3;
  g1(40,78)=1;
  g1(41,114)=T3;
  g1(41,79)=1;
  g1(42,115)=T3;
  g1(42,80)=1;
  g1(43,113)=T3;
  g1(43,81)=1;
  g1(44,117)=T3;
  g1(44,82)=1;
  g1(45,118)=T3;
  g1(45,83)=1;
  g1(46,112)=T3;
  g1(46,84)=1;
  g1(47,120)=T3;
  g1(47,85)=1;
  g1(48,121)=T3;
  g1(48,86)=1;
  g1(49,8)=T3;
  g1(49,87)=1;
  g1(50,24)=T3;
  g1(50,88)=1;
  g1(51,22)=T3;
  g1(51,89)=1;
  g1(52,26)=T3;
  g1(52,90)=1;
  g1(53,27)=T3;
  g1(53,91)=1;
  g1(54,23)=T3;
  g1(54,92)=1;
  g1(55,29)=T3;
  g1(55,93)=1;
  g1(56,30)=T3;
  g1(56,94)=1;
  g1(57,20)=T3;
  g1(57,95)=1;
  g1(58,32)=T3;
  g1(58,96)=1;
  g1(59,33)=T3;
  g1(59,97)=1;
  g1(60,21)=T3;
  g1(60,98)=1;
  g1(61,35)=T3;
  g1(61,99)=1;
  g1(62,36)=T3;
  g1(62,100)=1;
  g1(63,4)=T3;
  g1(63,101)=1;
end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],63,16900);
end
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],63,2197000);
end
end
