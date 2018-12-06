function [residual, g1, g2, g3] = US_CD08_dynamic(y, x, params, steady_state, it_)
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

residual = zeros(62, 1);
T179 = params(65)*(params(60)-1)/params(60);
T241 = params(63)/params(62);
T245 = (1-params(40))/params(62);
T250 = y(46)*T241+T245*y(49)-y(8);
T391 = T241*y(63)+T245*y(64)-y(13);
lhs =y(67);
rhs =y(38)*400;
residual(1)= lhs-rhs;
lhs =y(68);
rhs =100*(y(48)+y(7)+y(19)+y(20));
residual(2)= lhs-rhs;
lhs =y(69);
rhs =400*y(48);
residual(3)= lhs-rhs;
lhs =y(71);
rhs =100*(y(41)-y(60));
residual(4)= lhs-rhs;
lhs =y(70);
rhs =100*y(41);
residual(5)= lhs-rhs;
lhs =y(67);
rhs =params(32)*x(it_, 5)+params(31)*y(111)+params(30)*y(110)+params(29)*y(109)+params(28)*y(101)+params(27)*y(23)+params(26)*y(22)+params(25)*y(21)+params(24)*y(17)+y(70)*params(23)+params(22)*y(108)+params(21)*y(107)+params(20)*y(106)+params(19)*y(102)+params(18)*y(26)+params(17)*y(25)+params(16)*y(24)+params(15)*y(18)+y(71)*params(14)+params(13)*y(105)+params(12)*y(104)+params(11)*y(103)+params(10)*y(100)+params(6)*y(16)+y(69)*params(5)+params(1)*y(15)+params(2)*y(27)+params(3)*y(28)+params(4)*y(29)+params(7)*y(30)+params(8)*y(31)+params(9)*y(32);
residual(6)= lhs-rhs;
lhs =((1-params(35))*params(64)-1)*y(34);
rhs =params(35)*y(33)+T179*(y(35)+(params(35)-1)*y(36))-params(35)*y(37);
residual(7)= lhs-rhs;
lhs =y(38)*params(35)/(params(60)-1);
rhs =y(34)+y(35)-y(36);
residual(8)= lhs-rhs;
lhs =params(69)*y(39);
rhs =(1-params(69))*(y(33)+y(40));
residual(9)= lhs-rhs;
lhs =y(95);
rhs =y(33)-y(38)+y(96);
residual(10)= lhs-rhs;
lhs =y(41);
rhs =params(36)*y(5)+y(39)*(1-params(36))+(1-params(36))*y(43);
residual(11)= lhs-rhs;
lhs =y(41);
rhs =y(34)*params(67)+params(70)*y(44);
residual(12)= lhs-rhs;
lhs =y(40);
rhs =y(41)+y(45)-y(39);
residual(13)= lhs-rhs;
lhs =y(46);
rhs =y(41)+y(45)-y(5);
residual(14)= lhs-rhs;
lhs =y(47);
rhs =y(48)+y(36)-y(2);
residual(15)= lhs-rhs;
lhs =y(51);
rhs =T250;
residual(16)= lhs-rhs;
lhs =y(49);
rhs =params(41)*(y(44)-y(5))-y(50);
residual(17)= lhs-rhs;
lhs =y(48);
rhs =y(96)*params(42)+y(45)*(1-params(42)*params(43))*(1-params(43))/params(43);
residual(18)= lhs-rhs;
lhs =y(42);
rhs =y(44)*params(40)+params(40)*y(50)+y(5)*(1-params(40));
residual(19)= lhs-rhs;
lhs =y(97);
rhs =y(38)-y(96)+params(44)*(y(49)+y(42)-y(52));
residual(20)= lhs-rhs;
lhs =y(53);
rhs =params(44)*(y(49)+y(42)-y(52));
residual(21)= lhs-rhs;
lhs =y(52)/(params(62)*params(45));
rhs =T250*params(72)-(params(72)-1)*(y(4)-y(48))-params(44)*(params(72)-1)*(y(5)+y(8))+(1+params(44)*(params(72)-1))*y(10);
residual(22)= lhs-rhs;
lhs =y(50);
rhs =params(48)*y(9)+x(it_, 1);
residual(23)= lhs-rhs;
lhs =y(43);
rhs =params(46)*y(6)+x(it_, 2);
residual(24)= lhs-rhs;
lhs =y(37);
rhs =params(47)*y(3)+x(it_, 3);
residual(25)= lhs-rhs;
lhs =y(35);
rhs =params(49)*y(1)+x(it_, 4);
residual(26)= lhs-rhs;
lhs =((1-params(35))*params(64)-1)*y(55);
rhs =params(35)*y(54)+T179*(y(35)+(params(35)-1)*y(56))-params(35)*y(37);
residual(27)= lhs-rhs;
lhs =params(35)*y(57)/(params(60)-1);
rhs =y(35)+y(55)-y(56);
residual(28)= lhs-rhs;
lhs =params(69)*y(58);
rhs =(1-params(69))*(y(54)+y(59));
residual(29)= lhs-rhs;
lhs =y(98);
rhs =y(54)-y(57);
residual(30)= lhs-rhs;
lhs =y(60);
rhs =(1-params(36))*y(43)+params(36)*y(12)+(1-params(36))*y(58);
residual(31)= lhs-rhs;
lhs =y(60);
rhs =params(67)*y(55)+params(70)*y(62);
residual(32)= lhs-rhs;
lhs =y(59);
rhs =y(60)-y(58);
residual(33)= lhs-rhs;
lhs =y(63);
rhs =y(60)-y(12);
residual(34)= lhs-rhs;
lhs =y(61);
rhs =params(40)*y(50)+params(40)*y(62)+(1-params(40))*y(12);
residual(35)= lhs-rhs;
lhs =y(99);
rhs =y(57)+params(44)*(y(61)+y(64)-y(66));
residual(36)= lhs-rhs;
lhs =y(66)/(params(62)*params(45));
rhs =params(72)*T391-(params(72)-1)*y(11)-params(44)*(params(72)-1)*(y(12)+y(13))+(1+params(44)*(params(72)-1))*y(14);
residual(37)= lhs-rhs;
lhs =y(65);
rhs =T391;
residual(38)= lhs-rhs;
lhs =y(64);
rhs =params(41)*(y(62)-y(12))-y(50);
residual(39)= lhs-rhs;
lhs =y(72);
rhs =y(100);
residual(40)= lhs-rhs;
lhs =y(73);
rhs =y(103);
residual(41)= lhs-rhs;
lhs =y(74);
rhs =y(104);
residual(42)= lhs-rhs;
lhs =y(75);
rhs =y(102);
residual(43)= lhs-rhs;
lhs =y(76);
rhs =y(106);
residual(44)= lhs-rhs;
lhs =y(77);
rhs =y(107);
residual(45)= lhs-rhs;
lhs =y(78);
rhs =y(101);
residual(46)= lhs-rhs;
lhs =y(79);
rhs =y(109);
residual(47)= lhs-rhs;
lhs =y(80);
rhs =y(110);
residual(48)= lhs-rhs;
lhs =y(81);
rhs =y(7);
residual(49)= lhs-rhs;
lhs =y(82);
rhs =y(19);
residual(50)= lhs-rhs;
lhs =y(83);
rhs =y(17);
residual(51)= lhs-rhs;
lhs =y(84);
rhs =y(21);
residual(52)= lhs-rhs;
lhs =y(85);
rhs =y(22);
residual(53)= lhs-rhs;
lhs =y(86);
rhs =y(18);
residual(54)= lhs-rhs;
lhs =y(87);
rhs =y(24);
residual(55)= lhs-rhs;
lhs =y(88);
rhs =y(25);
residual(56)= lhs-rhs;
lhs =y(89);
rhs =y(15);
residual(57)= lhs-rhs;
lhs =y(90);
rhs =y(27);
residual(58)= lhs-rhs;
lhs =y(91);
rhs =y(28);
residual(59)= lhs-rhs;
lhs =y(92);
rhs =y(16);
residual(60)= lhs-rhs;
lhs =y(93);
rhs =y(30);
residual(61)= lhs-rhs;
lhs =y(94);
rhs =y(31);
residual(62)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(62, 116);

  %
  % Jacobian matrix
  %

  g1(1,38)=(-400);
  g1(1,67)=1;
  g1(2,7)=(-100);
  g1(2,48)=(-100);
  g1(2,68)=1;
  g1(2,19)=(-100);
  g1(2,20)=(-100);
  g1(3,48)=(-400);
  g1(3,69)=1;
  g1(4,41)=(-100);
  g1(4,60)=100;
  g1(4,71)=1;
  g1(5,41)=(-100);
  g1(5,70)=1;
  g1(6,15)=(-params(1));
  g1(6,67)=1;
  g1(6,16)=(-params(6));
  g1(6,69)=(-params(5));
  g1(6,100)=(-params(10));
  g1(6,17)=(-params(24));
  g1(6,70)=(-params(23));
  g1(6,101)=(-params(28));
  g1(6,18)=(-params(15));
  g1(6,71)=(-params(14));
  g1(6,102)=(-params(19));
  g1(6,116)=(-params(32));
  g1(6,103)=(-params(11));
  g1(6,104)=(-params(12));
  g1(6,105)=(-params(13));
  g1(6,106)=(-params(20));
  g1(6,107)=(-params(21));
  g1(6,108)=(-params(22));
  g1(6,109)=(-params(29));
  g1(6,110)=(-params(30));
  g1(6,111)=(-params(31));
  g1(6,21)=(-params(25));
  g1(6,22)=(-params(26));
  g1(6,23)=(-params(27));
  g1(6,24)=(-params(16));
  g1(6,25)=(-params(17));
  g1(6,26)=(-params(18));
  g1(6,27)=(-params(2));
  g1(6,28)=(-params(3));
  g1(6,29)=(-params(4));
  g1(6,30)=(-params(7));
  g1(6,31)=(-params(8));
  g1(6,32)=(-params(9));
  g1(7,33)=(-params(35));
  g1(7,34)=(1-params(35))*params(64)-1;
  g1(7,35)=(-T179);
  g1(7,36)=(-(T179*(params(35)-1)));
  g1(7,37)=params(35);
  g1(8,34)=(-1);
  g1(8,35)=(-1);
  g1(8,36)=1;
  g1(8,38)=params(35)/(params(60)-1);
  g1(9,33)=(-(1-params(69)));
  g1(9,39)=params(69);
  g1(9,40)=(-(1-params(69)));
  g1(10,33)=(-1);
  g1(10,95)=1;
  g1(10,38)=1;
  g1(10,96)=(-1);
  g1(11,39)=(-(1-params(36)));
  g1(11,41)=1;
  g1(11,5)=(-params(36));
  g1(11,43)=(-(1-params(36)));
  g1(12,34)=(-params(67));
  g1(12,41)=1;
  g1(12,44)=(-params(70));
  g1(13,39)=1;
  g1(13,40)=1;
  g1(13,41)=(-1);
  g1(13,45)=(-1);
  g1(14,41)=(-1);
  g1(14,5)=1;
  g1(14,45)=(-1);
  g1(14,46)=1;
  g1(15,2)=1;
  g1(15,36)=(-1);
  g1(15,47)=1;
  g1(15,48)=(-1);
  g1(16,46)=(-T241);
  g1(16,8)=1;
  g1(16,49)=(-T245);
  g1(16,51)=1;
  g1(17,5)=params(41);
  g1(17,44)=(-params(41));
  g1(17,49)=1;
  g1(17,50)=1;
  g1(18,45)=(-((1-params(42)*params(43))*(1-params(43))/params(43)));
  g1(18,48)=1;
  g1(18,96)=(-params(42));
  g1(19,5)=(-(1-params(40)));
  g1(19,42)=1;
  g1(19,44)=(-params(40));
  g1(19,50)=(-params(40));
  g1(20,38)=(-1);
  g1(20,42)=(-params(44));
  g1(20,96)=1;
  g1(20,49)=(-params(44));
  g1(20,97)=1;
  g1(20,52)=params(44);
  g1(21,42)=(-params(44));
  g1(21,49)=(-params(44));
  g1(21,52)=params(44);
  g1(21,53)=1;
  g1(22,4)=params(72)-1;
  g1(22,5)=params(44)*(params(72)-1);
  g1(22,46)=(-(T241*params(72)));
  g1(22,48)=(-(params(72)-1));
  g1(22,8)=(-((-params(72))-params(44)*(params(72)-1)));
  g1(22,49)=(-(T245*params(72)));
  g1(22,10)=(-(1+params(44)*(params(72)-1)));
  g1(22,52)=1/(params(62)*params(45));
  g1(23,9)=(-params(48));
  g1(23,50)=1;
  g1(23,112)=(-1);
  g1(24,6)=(-params(46));
  g1(24,43)=1;
  g1(24,113)=(-1);
  g1(25,3)=(-params(47));
  g1(25,37)=1;
  g1(25,114)=(-1);
  g1(26,1)=(-params(49));
  g1(26,35)=1;
  g1(26,115)=(-1);
  g1(27,35)=(-T179);
  g1(27,37)=params(35);
  g1(27,54)=(-params(35));
  g1(27,55)=(1-params(35))*params(64)-1;
  g1(27,56)=(-(T179*(params(35)-1)));
  g1(28,35)=(-1);
  g1(28,55)=(-1);
  g1(28,56)=1;
  g1(28,57)=params(35)/(params(60)-1);
  g1(29,54)=(-(1-params(69)));
  g1(29,58)=params(69);
  g1(29,59)=(-(1-params(69)));
  g1(30,54)=(-1);
  g1(30,98)=1;
  g1(30,57)=1;
  g1(31,43)=(-(1-params(36)));
  g1(31,58)=(-(1-params(36)));
  g1(31,60)=1;
  g1(31,12)=(-params(36));
  g1(32,55)=(-params(67));
  g1(32,60)=1;
  g1(32,62)=(-params(70));
  g1(33,58)=1;
  g1(33,59)=1;
  g1(33,60)=(-1);
  g1(34,60)=(-1);
  g1(34,12)=1;
  g1(34,63)=1;
  g1(35,50)=(-params(40));
  g1(35,12)=(-(1-params(40)));
  g1(35,61)=1;
  g1(35,62)=(-params(40));
  g1(36,57)=(-1);
  g1(36,61)=(-params(44));
  g1(36,64)=(-params(44));
  g1(36,99)=1;
  g1(36,66)=params(44);
  g1(37,11)=params(72)-1;
  g1(37,12)=params(44)*(params(72)-1);
  g1(37,63)=(-(T241*params(72)));
  g1(37,13)=(-((-params(72))-params(44)*(params(72)-1)));
  g1(37,64)=(-(T245*params(72)));
  g1(37,14)=(-(1+params(44)*(params(72)-1)));
  g1(37,66)=1/(params(62)*params(45));
  g1(38,63)=(-T241);
  g1(38,13)=1;
  g1(38,64)=(-T245);
  g1(38,65)=1;
  g1(39,50)=1;
  g1(39,12)=params(41);
  g1(39,62)=(-params(41));
  g1(39,64)=1;
  g1(40,100)=(-1);
  g1(40,72)=1;
  g1(41,103)=(-1);
  g1(41,73)=1;
  g1(42,104)=(-1);
  g1(42,74)=1;
  g1(43,102)=(-1);
  g1(43,75)=1;
  g1(44,106)=(-1);
  g1(44,76)=1;
  g1(45,107)=(-1);
  g1(45,77)=1;
  g1(46,101)=(-1);
  g1(46,78)=1;
  g1(47,109)=(-1);
  g1(47,79)=1;
  g1(48,110)=(-1);
  g1(48,80)=1;
  g1(49,7)=(-1);
  g1(49,81)=1;
  g1(50,19)=(-1);
  g1(50,82)=1;
  g1(51,17)=(-1);
  g1(51,83)=1;
  g1(52,21)=(-1);
  g1(52,84)=1;
  g1(53,22)=(-1);
  g1(53,85)=1;
  g1(54,18)=(-1);
  g1(54,86)=1;
  g1(55,24)=(-1);
  g1(55,87)=1;
  g1(56,25)=(-1);
  g1(56,88)=1;
  g1(57,15)=(-1);
  g1(57,89)=1;
  g1(58,27)=(-1);
  g1(58,90)=1;
  g1(59,28)=(-1);
  g1(59,91)=1;
  g1(60,16)=(-1);
  g1(60,92)=1;
  g1(61,30)=(-1);
  g1(61,93)=1;
  g1(62,31)=(-1);
  g1(62,94)=1;
end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],62,13456);
end
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],62,1560896);
end
end
