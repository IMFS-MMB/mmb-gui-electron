function [residual, g1, g2, g3] = US_RA07_dynamic(y, x, params, steady_state, it_)
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

residual = zeros(56, 1);
T219 = params(48)/(1-params(49));
T243 = (1-params(49))/params(48);
T266 = 1/(1+params(39));
lhs =y(56);
rhs =y(33)*4;
residual(1)= lhs-rhs;
lhs =y(57);
rhs =y(29)+y(1)+y(15)+y(16);
residual(2)= lhs-rhs;
lhs =y(58);
rhs =4*y(29);
residual(3)= lhs-rhs;
lhs =y(60);
rhs =y(42)-y(54);
residual(4)= lhs-rhs;
lhs =y(59);
rhs =y(42);
residual(5)= lhs-rhs;
lhs =y(61);
rhs =y(55);
residual(6)= lhs-rhs;
lhs =y(56);
rhs =params(32)*x(it_, 3)+params(31)*y(106)+params(30)*y(105)+params(29)*y(104)+params(28)*y(96)+params(27)*y(19)+params(26)*y(18)+params(25)*y(17)+params(24)*y(13)+y(59)*params(23)+params(22)*y(103)+params(21)*y(102)+params(20)*y(101)+params(19)*y(97)+params(18)*y(22)+params(17)*y(21)+params(16)*y(20)+params(15)*y(14)+y(60)*params(14)+params(13)*y(100)+params(12)*y(99)+params(11)*y(98)+params(10)*y(95)+params(6)*y(12)+y(58)*params(5)+params(1)*y(11)+params(2)*y(23)+params(3)*y(24)+params(4)*y(25)+params(7)*y(26)+params(8)*y(27)+params(9)*y(28);
residual(7)= lhs-rhs;
lhs =y(61);
rhs =params(34)*x(it_, 4);
residual(8)= lhs-rhs;
lhs =y(29);
rhs =y(1)*params(35)+params(36)*y(85)+params(37)*y(30)+params(37)*x(it_, 1);
residual(9)= lhs-rhs;
lhs =y(30);
rhs =params(41)*y(31)+(1-params(41))*(y(32)+y(33)*params(42))-y(34);
residual(10)= lhs-rhs;
lhs =y(35);
rhs =y(31)*params(45);
residual(11)= lhs-rhs;
lhs =y(32)*(1+params(39));
rhs =y(2)+params(39)*y(87)+y(1)*params(46)-y(29)*(1+params(39)*params(46))+y(85)*params(39)-params(47)*(y(32)-T219*(y(36)-params(49)*y(4))-params(50)*y(37));
residual(12)= lhs-rhs;
lhs =y(38)-y(35)-y(5);
rhs =y(31)-(y(32)+y(33)*params(42));
residual(13)= lhs-rhs;
lhs =y(36)*(1+params(49));
rhs =params(49)*y(4)+y(88)-T243*(y(33)-y(85));
residual(14)= lhs-rhs;
lhs =y(40);
rhs =params(39)*(1-params(51))*y(89)+(1-params(39)*(1-params(51)))*y(86)-(y(33)-y(85));
residual(15)= lhs-rhs;
lhs =y(39);
rhs =y(5)*(1-params(51))+params(51)*y(41);
residual(16)= lhs-rhs;
lhs =y(41);
rhs =T266*(params(39)*y(90)+y(6)+y(40)*params(44));
residual(17)= lhs-rhs;
lhs =y(42);
rhs =y(34)+params(41)*(y(35)+y(5))+(1-params(41))*y(37);
residual(18)= lhs-rhs;
lhs =y(42);
rhs =y(36)*(1-params(55)-params(56))+y(41)*params(55)+params(56)*y(43)+y(35)*params(41)*params(57)/(params(57)-1);
residual(19)= lhs-rhs;
lhs =y(34);
rhs =params(58)*y(3)+x(it_, 2);
residual(20)= lhs-rhs;
lhs =y(43);
rhs =y(55)+params(59)*y(7);
residual(21)= lhs-rhs;
lhs =y(38);
rhs =y(37);
residual(22)= lhs-rhs;
lhs =0;
rhs =params(41)*y(44)+(1-params(41))*y(45)-y(34);
residual(23)= lhs-rhs;
lhs =y(47);
rhs =params(45)*y(44);
residual(24)= lhs-rhs;
lhs =y(45);
rhs =T219*(y(48)-params(49)*y(8))+params(50)*y(49);
residual(25)= lhs-rhs;
lhs =y(50)-y(47)-y(9);
rhs =y(44)-y(45);
residual(26)= lhs-rhs;
lhs =(1+params(49))*y(48);
rhs =params(49)*y(8)+y(92)-T243*y(46);
residual(27)= lhs-rhs;
lhs =y(52);
rhs =params(39)*(1-params(51))*y(93)+(1-params(39)*(1-params(51)))*y(91)-y(46);
residual(28)= lhs-rhs;
lhs =y(51);
rhs =(1-params(51))*y(9)+params(51)*y(53);
residual(29)= lhs-rhs;
lhs =y(53);
rhs =T266*(params(39)*y(94)+y(10)+params(44)*y(52));
residual(30)= lhs-rhs;
lhs =y(54);
rhs =y(34)+params(41)*(y(47)+y(9))+(1-params(41))*y(49);
residual(31)= lhs-rhs;
lhs =y(54);
rhs =params(56)*y(43)+(1-params(55)-params(56))*y(48)+params(55)*y(53)+params(41)*params(57)/(params(57)-1)*y(47);
residual(32)= lhs-rhs;
lhs =y(50);
rhs =y(49);
residual(33)= lhs-rhs;
lhs =y(62);
rhs =y(95);
residual(34)= lhs-rhs;
lhs =y(63);
rhs =y(98);
residual(35)= lhs-rhs;
lhs =y(64);
rhs =y(99);
residual(36)= lhs-rhs;
lhs =y(65);
rhs =y(97);
residual(37)= lhs-rhs;
lhs =y(66);
rhs =y(101);
residual(38)= lhs-rhs;
lhs =y(67);
rhs =y(102);
residual(39)= lhs-rhs;
lhs =y(68);
rhs =y(96);
residual(40)= lhs-rhs;
lhs =y(69);
rhs =y(104);
residual(41)= lhs-rhs;
lhs =y(70);
rhs =y(105);
residual(42)= lhs-rhs;
lhs =y(71);
rhs =y(1);
residual(43)= lhs-rhs;
lhs =y(72);
rhs =y(15);
residual(44)= lhs-rhs;
lhs =y(73);
rhs =y(13);
residual(45)= lhs-rhs;
lhs =y(74);
rhs =y(17);
residual(46)= lhs-rhs;
lhs =y(75);
rhs =y(18);
residual(47)= lhs-rhs;
lhs =y(76);
rhs =y(14);
residual(48)= lhs-rhs;
lhs =y(77);
rhs =y(20);
residual(49)= lhs-rhs;
lhs =y(78);
rhs =y(21);
residual(50)= lhs-rhs;
lhs =y(79);
rhs =y(11);
residual(51)= lhs-rhs;
lhs =y(80);
rhs =y(23);
residual(52)= lhs-rhs;
lhs =y(81);
rhs =y(24);
residual(53)= lhs-rhs;
lhs =y(82);
rhs =y(12);
residual(54)= lhs-rhs;
lhs =y(83);
rhs =y(26);
residual(55)= lhs-rhs;
lhs =y(84);
rhs =y(27);
residual(56)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(56, 110);

  %
  % Jacobian matrix
  %

  g1(1,33)=(-4);
  g1(1,56)=1;
  g1(2,1)=(-1);
  g1(2,29)=(-1);
  g1(2,57)=1;
  g1(2,15)=(-1);
  g1(2,16)=(-1);
  g1(3,29)=(-4);
  g1(3,58)=1;
  g1(4,42)=(-1);
  g1(4,54)=1;
  g1(4,60)=1;
  g1(5,42)=(-1);
  g1(5,59)=1;
  g1(6,55)=(-1);
  g1(6,61)=1;
  g1(7,11)=(-params(1));
  g1(7,56)=1;
  g1(7,12)=(-params(6));
  g1(7,58)=(-params(5));
  g1(7,95)=(-params(10));
  g1(7,13)=(-params(24));
  g1(7,59)=(-params(23));
  g1(7,96)=(-params(28));
  g1(7,14)=(-params(15));
  g1(7,60)=(-params(14));
  g1(7,97)=(-params(19));
  g1(7,109)=(-params(32));
  g1(7,98)=(-params(11));
  g1(7,99)=(-params(12));
  g1(7,100)=(-params(13));
  g1(7,101)=(-params(20));
  g1(7,102)=(-params(21));
  g1(7,103)=(-params(22));
  g1(7,104)=(-params(29));
  g1(7,105)=(-params(30));
  g1(7,106)=(-params(31));
  g1(7,17)=(-params(25));
  g1(7,18)=(-params(26));
  g1(7,19)=(-params(27));
  g1(7,20)=(-params(16));
  g1(7,21)=(-params(17));
  g1(7,22)=(-params(18));
  g1(7,23)=(-params(2));
  g1(7,24)=(-params(3));
  g1(7,25)=(-params(4));
  g1(7,26)=(-params(7));
  g1(7,27)=(-params(8));
  g1(7,28)=(-params(9));
  g1(8,61)=1;
  g1(8,110)=(-params(34));
  g1(9,1)=(-params(35));
  g1(9,29)=1;
  g1(9,85)=(-params(36));
  g1(9,30)=(-params(37));
  g1(9,107)=(-params(37));
  g1(10,30)=1;
  g1(10,31)=(-params(41));
  g1(10,32)=(-(1-params(41)));
  g1(10,33)=(-((1-params(41))*params(42)));
  g1(10,34)=1;
  g1(11,31)=(-params(45));
  g1(11,35)=1;
  g1(12,1)=(-params(46));
  g1(12,29)=1+params(39)*params(46);
  g1(12,85)=(-params(39));
  g1(12,2)=(-1);
  g1(12,32)=1+params(39)-(-params(47));
  g1(12,87)=(-params(39));
  g1(12,4)=params(47)*(-(T219*(-params(49))));
  g1(12,36)=params(47)*(-T219);
  g1(12,37)=params(47)*(-params(50));
  g1(13,31)=(-1);
  g1(13,32)=1;
  g1(13,33)=params(42);
  g1(13,35)=(-1);
  g1(13,38)=1;
  g1(13,5)=(-1);
  g1(14,85)=(-T243);
  g1(14,33)=T243;
  g1(14,4)=(-params(49));
  g1(14,36)=1+params(49);
  g1(14,88)=(-1);
  g1(15,85)=(-1);
  g1(15,86)=(-(1-params(39)*(1-params(51))));
  g1(15,33)=1;
  g1(15,40)=1;
  g1(15,89)=(-(params(39)*(1-params(51))));
  g1(16,5)=(-(1-params(51)));
  g1(16,39)=1;
  g1(16,41)=(-params(51));
  g1(17,40)=(-(T266*params(44)));
  g1(17,6)=(-T266);
  g1(17,41)=1;
  g1(17,90)=(-(params(39)*T266));
  g1(18,34)=(-1);
  g1(18,35)=(-params(41));
  g1(18,37)=(-(1-params(41)));
  g1(18,5)=(-params(41));
  g1(18,42)=1;
  g1(19,35)=(-(params(41)*params(57)/(params(57)-1)));
  g1(19,36)=(-(1-params(55)-params(56)));
  g1(19,41)=(-params(55));
  g1(19,42)=1;
  g1(19,43)=(-params(56));
  g1(20,3)=(-params(58));
  g1(20,34)=1;
  g1(20,108)=(-1);
  g1(21,7)=(-params(59));
  g1(21,43)=1;
  g1(21,55)=(-1);
  g1(22,37)=(-1);
  g1(22,38)=1;
  g1(23,34)=1;
  g1(23,44)=(-params(41));
  g1(23,45)=(-(1-params(41)));
  g1(24,44)=(-params(45));
  g1(24,47)=1;
  g1(25,45)=1;
  g1(25,8)=(-(T219*(-params(49))));
  g1(25,48)=(-T219);
  g1(25,49)=(-params(50));
  g1(26,44)=(-1);
  g1(26,45)=1;
  g1(26,47)=(-1);
  g1(26,50)=1;
  g1(26,9)=(-1);
  g1(27,46)=T243;
  g1(27,8)=(-params(49));
  g1(27,48)=1+params(49);
  g1(27,92)=(-1);
  g1(28,91)=(-(1-params(39)*(1-params(51))));
  g1(28,46)=1;
  g1(28,52)=1;
  g1(28,93)=(-(params(39)*(1-params(51))));
  g1(29,9)=(-(1-params(51)));
  g1(29,51)=1;
  g1(29,53)=(-params(51));
  g1(30,52)=(-(T266*params(44)));
  g1(30,10)=(-T266);
  g1(30,53)=1;
  g1(30,94)=(-(params(39)*T266));
  g1(31,34)=(-1);
  g1(31,47)=(-params(41));
  g1(31,49)=(-(1-params(41)));
  g1(31,9)=(-params(41));
  g1(31,54)=1;
  g1(32,43)=(-params(56));
  g1(32,47)=(-(params(41)*params(57)/(params(57)-1)));
  g1(32,48)=(-(1-params(55)-params(56)));
  g1(32,53)=(-params(55));
  g1(32,54)=1;
  g1(33,49)=(-1);
  g1(33,50)=1;
  g1(34,95)=(-1);
  g1(34,62)=1;
  g1(35,98)=(-1);
  g1(35,63)=1;
  g1(36,99)=(-1);
  g1(36,64)=1;
  g1(37,97)=(-1);
  g1(37,65)=1;
  g1(38,101)=(-1);
  g1(38,66)=1;
  g1(39,102)=(-1);
  g1(39,67)=1;
  g1(40,96)=(-1);
  g1(40,68)=1;
  g1(41,104)=(-1);
  g1(41,69)=1;
  g1(42,105)=(-1);
  g1(42,70)=1;
  g1(43,1)=(-1);
  g1(43,71)=1;
  g1(44,15)=(-1);
  g1(44,72)=1;
  g1(45,13)=(-1);
  g1(45,73)=1;
  g1(46,17)=(-1);
  g1(46,74)=1;
  g1(47,18)=(-1);
  g1(47,75)=1;
  g1(48,14)=(-1);
  g1(48,76)=1;
  g1(49,20)=(-1);
  g1(49,77)=1;
  g1(50,21)=(-1);
  g1(50,78)=1;
  g1(51,11)=(-1);
  g1(51,79)=1;
  g1(52,23)=(-1);
  g1(52,80)=1;
  g1(53,24)=(-1);
  g1(53,81)=1;
  g1(54,12)=(-1);
  g1(54,82)=1;
  g1(55,26)=(-1);
  g1(55,83)=1;
  g1(56,27)=(-1);
  g1(56,84)=1;
end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],56,12100);
end
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],56,1331000);
end
end
