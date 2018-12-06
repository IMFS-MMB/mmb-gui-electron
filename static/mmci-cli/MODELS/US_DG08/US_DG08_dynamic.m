function [residual, g1, g2, g3] = US_DG08_dynamic(y, x, params, steady_state, it_)
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

residual = zeros(60, 1);
T184 = (params(36)-1)/(params(36)*(1+params(35))*(1+params(37)));
T192 = (1-params(35))/((1+params(35))*params(36));
T206 = params(38)/(1+params(38));
T209 = 1/(1+params(38));
T236 = (1-params(38)*params(40))*(1-params(40))/(params(40)*(1+params(38))*(1+(1+params(37))*params(41)/params(37)));
T289 = 1/(1+params(38)*params(45))*(1-params(38)*params(46))*(1-params(46))/params(46);
T380 = params(54)*(params(49)-1/params(38))*(1-1/params(52));
T490 = params(54)*(params(47)+1/params(38)-1)/params(44);
lhs =y(67);
rhs =y(51)*4;
residual(1)= lhs-rhs;
lhs =y(68);
rhs =y(41)+y(4)+y(22)+y(23);
residual(2)= lhs-rhs;
lhs =y(69);
rhs =4*y(41);
residual(3)= lhs-rhs;
lhs =y(70);
rhs =y(42)-y(61);
residual(4)= lhs-rhs;
lhs =y(71);
rhs =y(42);
residual(5)= lhs-rhs;
lhs =y(72);
rhs =y(66);
residual(6)= lhs-rhs;
lhs =y(67);
rhs =params(32)*x(it_, 7)+params(31)*y(119)+params(30)*y(118)+params(29)*y(117)+params(28)*y(110)+params(27)*y(26)+params(26)*y(25)+params(25)*y(24)+params(24)*y(21)+y(71)*params(23)+params(22)*y(116)+params(21)*y(115)+params(20)*y(114)+params(19)*y(109)+params(18)*y(29)+params(17)*y(28)+params(16)*y(27)+params(15)*y(20)+y(70)*params(14)+params(13)*y(113)+params(12)*y(112)+params(11)*y(111)+params(10)*y(108)+params(6)*y(19)+y(69)*params(5)+params(1)*y(18)+params(2)*y(30)+params(3)*y(31)+params(4)*y(32)+params(7)*y(33)+params(8)*y(34)+params(9)*y(35);
residual(7)= lhs-rhs;
lhs =y(72);
rhs =params(34)*x(it_, 8);
residual(8)= lhs-rhs;
lhs =y(36);
rhs =params(35)/(1+params(35))*y(1)+1/(1+params(35))*y(96)+T184*(y(37)-y(97))-T192*y(2)+T192*y(52);
residual(9)= lhs-rhs;
lhs =y(39);
rhs =y(98);
residual(10)= lhs-rhs;
lhs =y(40);
rhs =T206*y(99)+T209*y(3)+T206*y(100)-y(41)*(1+params(38)*params(39))/(1+params(38))+y(4)*params(39)/(1+params(38))-T236*(y(40)-y(37)*params(41)-params(36)/(1-params(35))*(y(36)-params(35)*y(1))-y(53))+x(it_, 1);
residual(11)= lhs-rhs;
lhs =y(42);
rhs =params(42)*(y(54)+params(43)*y(5)+params(43)/params(44)*y(44)+y(37)*(1-params(43)));
residual(12)= lhs-rhs;
lhs =y(37);
rhs =y(5)+(-y(40))+y(44)*(1+1/params(44));
residual(13)= lhs-rhs;
lhs =y(41);
rhs =y(100)*params(38)/(1+params(38)*params(45))+y(4)*params(45)/(1+params(38)*params(45))+T289*(params(43)*y(44)+y(40)*(1-params(43))-y(54))+x(it_, 2);
residual(14)= lhs-rhs;
lhs =y(43);
rhs =y(5)*(1-params(47))+params(47)*y(6)+(1+params(38))*params(47)*params(48)*y(13);
residual(15)= lhs-rhs;
lhs =y(45);
rhs =T209*y(6)+T206*y(101)+1/((1+params(38))*params(48))*y(46)+y(55);
residual(16)= lhs-rhs;
lhs =y(47);
rhs =y(46)*(1-params(47))/params(49)+y(44)*(params(47)+params(49)-1)/params(49)-y(7);
residual(17)= lhs-rhs;
lhs =y(48);
rhs =y(102);
residual(18)= lhs-rhs;
lhs =y(48);
rhs =(-params(50))*(y(50)-y(46)-y(43))+y(38);
residual(19)= lhs-rhs;
lhs =y(50);
rhs =params(49)*params(51)*(y(8)+params(52)*(y(47)-y(8))+y(9));
residual(20)= lhs-rhs;
lhs =y(42);
rhs =y(36)*params(53)+y(45)*params(47)*params(54)+y(56)+y(44)*params(54)*(params(47)+params(49)-1)/params(44)+T380*(y(43)+y(47)+y(7));
residual(21)= lhs-rhs;
lhs =y(51);
rhs =y(100)+y(38);
residual(22)= lhs-rhs;
lhs =y(49);
rhs =y(48)-y(38);
residual(23)= lhs-rhs;
lhs =y(52);
rhs =params(60)*y(10)+x(it_, 3);
residual(24)= lhs-rhs;
lhs =y(53);
rhs =params(61)*y(11)+x(it_, 4);
residual(25)= lhs-rhs;
lhs =y(54);
rhs =params(62)*y(12)+x(it_, 5);
residual(26)= lhs-rhs;
lhs =y(55);
rhs =y(13)*params(63)+x(it_, 6);
residual(27)= lhs-rhs;
lhs =y(56);
rhs =y(66)+params(64)*y(14);
residual(28)= lhs-rhs;
lhs =y(57);
rhs =T192*y(52)+params(35)/(1+params(35))*y(15)+1/(1+params(35))*y(103)+T184*(y(58)-y(104))-T192*y(59);
residual(29)= lhs-rhs;
lhs =y(60);
rhs =y(53)+params(41)*y(58)+y(57)*params(36)*1/(1-params(35))-y(15)*params(35)*params(36)/(1-params(35));
residual(30)= lhs-rhs;
lhs =y(61);
rhs =params(42)*(y(54)+params(43)*y(16)+params(43)/params(44)*y(63)+(1-params(43))*y(58));
residual(31)= lhs-rhs;
lhs =y(58);
rhs =y(16)+(-y(60))+(1+1/params(44))*y(63);
residual(32)= lhs-rhs;
lhs =params(43)*y(63)+(1-params(43))*y(60);
rhs =y(54);
residual(33)= lhs-rhs;
lhs =y(62);
rhs =(1+params(38))*params(47)*params(48)*y(13)+(1-params(47))*y(16)+params(47)*y(17);
residual(34)= lhs-rhs;
lhs =y(64);
rhs =y(55)+T209*y(17)+T206*y(106)+1/((1+params(38))*params(48))*y(65);
residual(35)= lhs-rhs;
lhs =y(61);
rhs =y(56)+params(53)*y(57)+params(47)*params(54)*y(64)+y(63)*T490;
residual(36)= lhs-rhs;
lhs =y(59);
rhs =(1-params(38)*(1-params(47)))*y(105)+params(38)*(1-params(47))*y(107)-y(65);
residual(37)= lhs-rhs;
lhs =y(73);
rhs =y(108);
residual(38)= lhs-rhs;
lhs =y(74);
rhs =y(111);
residual(39)= lhs-rhs;
lhs =y(75);
rhs =y(112);
residual(40)= lhs-rhs;
lhs =y(76);
rhs =y(109);
residual(41)= lhs-rhs;
lhs =y(77);
rhs =y(114);
residual(42)= lhs-rhs;
lhs =y(78);
rhs =y(115);
residual(43)= lhs-rhs;
lhs =y(79);
rhs =y(110);
residual(44)= lhs-rhs;
lhs =y(80);
rhs =y(117);
residual(45)= lhs-rhs;
lhs =y(81);
rhs =y(118);
residual(46)= lhs-rhs;
lhs =y(82);
rhs =y(4);
residual(47)= lhs-rhs;
lhs =y(83);
rhs =y(22);
residual(48)= lhs-rhs;
lhs =y(84);
rhs =y(21);
residual(49)= lhs-rhs;
lhs =y(85);
rhs =y(24);
residual(50)= lhs-rhs;
lhs =y(86);
rhs =y(25);
residual(51)= lhs-rhs;
lhs =y(87);
rhs =y(20);
residual(52)= lhs-rhs;
lhs =y(88);
rhs =y(27);
residual(53)= lhs-rhs;
lhs =y(89);
rhs =y(28);
residual(54)= lhs-rhs;
lhs =y(90);
rhs =y(18);
residual(55)= lhs-rhs;
lhs =y(91);
rhs =y(30);
residual(56)= lhs-rhs;
lhs =y(92);
rhs =y(31);
residual(57)= lhs-rhs;
lhs =y(93);
rhs =y(19);
residual(58)= lhs-rhs;
lhs =y(94);
rhs =y(33);
residual(59)= lhs-rhs;
lhs =y(95);
rhs =y(34);
residual(60)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(60, 127);

  %
  % Jacobian matrix
  %

  g1(1,51)=(-4);
  g1(1,67)=1;
  g1(2,4)=(-1);
  g1(2,41)=(-1);
  g1(2,68)=1;
  g1(2,22)=(-1);
  g1(2,23)=(-1);
  g1(3,41)=(-4);
  g1(3,69)=1;
  g1(4,42)=(-1);
  g1(4,61)=1;
  g1(4,70)=1;
  g1(5,42)=(-1);
  g1(5,71)=1;
  g1(6,66)=(-1);
  g1(6,72)=1;
  g1(7,18)=(-params(1));
  g1(7,67)=1;
  g1(7,19)=(-params(6));
  g1(7,69)=(-params(5));
  g1(7,108)=(-params(10));
  g1(7,20)=(-params(15));
  g1(7,70)=(-params(14));
  g1(7,109)=(-params(19));
  g1(7,21)=(-params(24));
  g1(7,71)=(-params(23));
  g1(7,110)=(-params(28));
  g1(7,126)=(-params(32));
  g1(7,111)=(-params(11));
  g1(7,112)=(-params(12));
  g1(7,113)=(-params(13));
  g1(7,114)=(-params(20));
  g1(7,115)=(-params(21));
  g1(7,116)=(-params(22));
  g1(7,117)=(-params(29));
  g1(7,118)=(-params(30));
  g1(7,119)=(-params(31));
  g1(7,24)=(-params(25));
  g1(7,25)=(-params(26));
  g1(7,26)=(-params(27));
  g1(7,27)=(-params(16));
  g1(7,28)=(-params(17));
  g1(7,29)=(-params(18));
  g1(7,30)=(-params(2));
  g1(7,31)=(-params(3));
  g1(7,32)=(-params(4));
  g1(7,33)=(-params(7));
  g1(7,34)=(-params(8));
  g1(7,35)=(-params(9));
  g1(8,72)=1;
  g1(8,127)=(-params(34));
  g1(9,1)=(-(params(35)/(1+params(35))));
  g1(9,36)=1;
  g1(9,96)=(-(1/(1+params(35))));
  g1(9,37)=(-T184);
  g1(9,97)=T184;
  g1(9,2)=T192;
  g1(9,52)=(-T192);
  g1(10,98)=(-1);
  g1(10,39)=1;
  g1(11,1)=T236*(-(params(36)/(1-params(35))*(-params(35))));
  g1(11,36)=T236*(-(params(36)/(1-params(35))));
  g1(11,37)=T236*(-params(41));
  g1(11,3)=(-T209);
  g1(11,40)=1-(-T236);
  g1(11,99)=(-T206);
  g1(11,4)=(-(params(39)/(1+params(38))));
  g1(11,41)=(1+params(38)*params(39))/(1+params(38));
  g1(11,100)=(-T206);
  g1(11,53)=(-T236);
  g1(11,120)=(-1);
  g1(12,37)=(-(params(42)*(1-params(43))));
  g1(12,42)=1;
  g1(12,5)=(-(params(42)*params(43)));
  g1(12,44)=(-(params(42)*params(43)/params(44)));
  g1(12,54)=(-params(42));
  g1(13,37)=1;
  g1(13,40)=1;
  g1(13,5)=(-1);
  g1(13,44)=(-(1+1/params(44)));
  g1(14,40)=(-((1-params(43))*T289));
  g1(14,4)=(-(params(45)/(1+params(38)*params(45))));
  g1(14,41)=1;
  g1(14,100)=(-(params(38)/(1+params(38)*params(45))));
  g1(14,44)=(-(params(43)*T289));
  g1(14,54)=T289;
  g1(14,121)=(-1);
  g1(15,5)=(-(1-params(47)));
  g1(15,43)=1;
  g1(15,6)=(-params(47));
  g1(15,13)=(-((1+params(38))*params(47)*params(48)));
  g1(16,6)=(-T209);
  g1(16,45)=1;
  g1(16,101)=(-T206);
  g1(16,46)=(-(1/((1+params(38))*params(48))));
  g1(16,55)=(-1);
  g1(17,44)=(-((params(47)+params(49)-1)/params(49)));
  g1(17,7)=1;
  g1(17,46)=(-((1-params(47))/params(49)));
  g1(17,47)=1;
  g1(18,102)=(-1);
  g1(18,48)=1;
  g1(19,38)=(-1);
  g1(19,43)=(-params(50));
  g1(19,46)=(-params(50));
  g1(19,48)=1;
  g1(19,50)=params(50);
  g1(20,47)=(-(params(49)*params(51)*params(52)));
  g1(20,8)=(-(params(49)*params(51)*(1-params(52))));
  g1(20,9)=(-(params(49)*params(51)));
  g1(20,50)=1;
  g1(21,36)=(-params(53));
  g1(21,42)=1;
  g1(21,43)=(-T380);
  g1(21,44)=(-(params(54)*(params(47)+params(49)-1)/params(44)));
  g1(21,45)=(-(params(47)*params(54)));
  g1(21,7)=(-T380);
  g1(21,47)=(-T380);
  g1(21,56)=(-1);
  g1(22,38)=(-1);
  g1(22,100)=(-1);
  g1(22,51)=1;
  g1(23,38)=1;
  g1(23,48)=(-1);
  g1(23,49)=1;
  g1(24,10)=(-params(60));
  g1(24,52)=1;
  g1(24,122)=(-1);
  g1(25,11)=(-params(61));
  g1(25,53)=1;
  g1(25,123)=(-1);
  g1(26,12)=(-params(62));
  g1(26,54)=1;
  g1(26,124)=(-1);
  g1(27,13)=(-params(63));
  g1(27,55)=1;
  g1(27,125)=(-1);
  g1(28,14)=(-params(64));
  g1(28,56)=1;
  g1(28,66)=(-1);
  g1(29,52)=(-T192);
  g1(29,15)=(-(params(35)/(1+params(35))));
  g1(29,57)=1;
  g1(29,103)=(-(1/(1+params(35))));
  g1(29,58)=(-T184);
  g1(29,104)=T184;
  g1(29,59)=T192;
  g1(30,53)=(-1);
  g1(30,15)=params(35)*params(36)/(1-params(35));
  g1(30,57)=(-(params(36)*1/(1-params(35))));
  g1(30,58)=(-params(41));
  g1(30,60)=1;
  g1(31,54)=(-params(42));
  g1(31,58)=(-(params(42)*(1-params(43))));
  g1(31,61)=1;
  g1(31,16)=(-(params(42)*params(43)));
  g1(31,63)=(-(params(42)*params(43)/params(44)));
  g1(32,58)=1;
  g1(32,60)=1;
  g1(32,16)=(-1);
  g1(32,63)=(-(1+1/params(44)));
  g1(33,54)=(-1);
  g1(33,60)=1-params(43);
  g1(33,63)=params(43);
  g1(34,13)=(-((1+params(38))*params(47)*params(48)));
  g1(34,16)=(-(1-params(47)));
  g1(34,62)=1;
  g1(34,17)=(-params(47));
  g1(35,55)=(-1);
  g1(35,17)=(-T209);
  g1(35,64)=1;
  g1(35,106)=(-T206);
  g1(35,65)=(-(1/((1+params(38))*params(48))));
  g1(36,56)=(-1);
  g1(36,57)=(-params(53));
  g1(36,61)=1;
  g1(36,63)=(-T490);
  g1(36,64)=(-(params(47)*params(54)));
  g1(37,59)=1;
  g1(37,105)=(-(1-params(38)*(1-params(47))));
  g1(37,65)=1;
  g1(37,107)=(-(params(38)*(1-params(47))));
  g1(38,108)=(-1);
  g1(38,73)=1;
  g1(39,111)=(-1);
  g1(39,74)=1;
  g1(40,112)=(-1);
  g1(40,75)=1;
  g1(41,109)=(-1);
  g1(41,76)=1;
  g1(42,114)=(-1);
  g1(42,77)=1;
  g1(43,115)=(-1);
  g1(43,78)=1;
  g1(44,110)=(-1);
  g1(44,79)=1;
  g1(45,117)=(-1);
  g1(45,80)=1;
  g1(46,118)=(-1);
  g1(46,81)=1;
  g1(47,4)=(-1);
  g1(47,82)=1;
  g1(48,22)=(-1);
  g1(48,83)=1;
  g1(49,21)=(-1);
  g1(49,84)=1;
  g1(50,24)=(-1);
  g1(50,85)=1;
  g1(51,25)=(-1);
  g1(51,86)=1;
  g1(52,20)=(-1);
  g1(52,87)=1;
  g1(53,27)=(-1);
  g1(53,88)=1;
  g1(54,28)=(-1);
  g1(54,89)=1;
  g1(55,18)=(-1);
  g1(55,90)=1;
  g1(56,30)=(-1);
  g1(56,91)=1;
  g1(57,31)=(-1);
  g1(57,92)=1;
  g1(58,19)=(-1);
  g1(58,93)=1;
  g1(59,33)=(-1);
  g1(59,94)=1;
  g1(60,34)=(-1);
  g1(60,95)=1;
end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],60,16129);
end
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],60,2048383);
end
end
