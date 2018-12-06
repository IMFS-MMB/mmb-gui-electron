function [residual, g1, g2, g3] = US_PM08fl_dynamic(y, x, params, steady_state, it_)
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

residual = zeros(51, 1);
lhs =y(46);
rhs =y(40);
residual(1)= lhs-rhs;
lhs =y(47);
rhs =y(38);
residual(2)= lhs-rhs;
lhs =y(48);
rhs =y(37);
residual(3)= lhs-rhs;
lhs =y(49);
rhs =y(39);
residual(4)= lhs-rhs;
lhs =y(50);
rhs =y(39);
residual(5)= lhs-rhs;
lhs =y(46);
rhs =params(32)*x(it_, 6)+params(31)*y(99)+params(30)*y(98)+params(29)*y(97)+params(28)*y(90)+params(27)*y(14)+params(26)*y(13)+params(25)*y(12)+params(24)*y(11)+y(50)*params(23)+params(22)*y(96)+params(21)*y(95)+params(20)*y(94)+params(19)*y(89)+params(18)*y(17)+params(17)*y(16)+params(16)*y(15)+params(15)*y(10)+y(49)*params(14)+params(13)*y(93)+params(12)*y(92)+params(11)*y(91)+params(10)*y(88)+params(6)*y(9)+y(48)*params(5)+params(1)*y(8)+params(2)*y(18)+params(3)*y(19)+params(4)*y(20)+params(7)*y(21)+params(8)*y(22)+params(9)*y(23);
residual(6)= lhs-rhs;
lhs =y(36);
rhs =params(36)*y(3)+y(39)*params(37)+x(it_, 2);
residual(7)= lhs-rhs;
lhs =y(39);
rhs =x(it_, 3)+params(40)*y(6)+params(41)*y(87)-params(42)*(y(1)-y(2))-params(51)*(0.04*(y(7)+y(31))+0.08*(y(24)+y(30))+0.12*(y(25)+y(29))+0.16*(y(26)+y(28))+0.2*y(27));
residual(8)= lhs-rhs;
lhs =y(44);
rhs =x(it_, 5);
residual(9)= lhs-rhs;
lhs =y(37);
rhs =y(6)*params(44)+(1-params(43))*y(5)+params(43)*y(102)-x(it_, 4);
residual(10)= lhs-rhs;
lhs =y(34);
rhs =y(40)-y(85);
residual(11)= lhs-rhs;
lhs =y(35);
rhs =y(2)*(1-params(34))+x(it_, 1);
residual(12)= lhs-rhs;
lhs =y(38);
rhs =(y(37)+y(4)+y(32)+y(33))/4;
residual(13)= lhs-rhs;
lhs =y(41);
rhs =y(102);
residual(14)= lhs-rhs;
lhs =y(43);
rhs =y(85);
residual(15)= lhs-rhs;
lhs =y(42);
rhs =y(87);
residual(16)= lhs-rhs;
lhs =y(45);
rhs =params(51)*(0.04*(y(7)+y(31))+0.08*(y(24)+y(30))+0.12*(y(25)+y(29))+0.16*(y(26)+y(28))+0.2*y(27));
residual(17)= lhs-rhs;
lhs =y(51);
rhs =y(88);
residual(18)= lhs-rhs;
lhs =y(52);
rhs =y(91);
residual(19)= lhs-rhs;
lhs =y(53);
rhs =y(92);
residual(20)= lhs-rhs;
lhs =y(54);
rhs =y(89);
residual(21)= lhs-rhs;
lhs =y(55);
rhs =y(94);
residual(22)= lhs-rhs;
lhs =y(56);
rhs =y(95);
residual(23)= lhs-rhs;
lhs =y(57);
rhs =y(90);
residual(24)= lhs-rhs;
lhs =y(58);
rhs =y(97);
residual(25)= lhs-rhs;
lhs =y(59);
rhs =y(98);
residual(26)= lhs-rhs;
lhs =y(60);
rhs =y(86);
residual(27)= lhs-rhs;
lhs =y(61);
rhs =y(100);
residual(28)= lhs-rhs;
lhs =y(62);
rhs =y(101);
residual(29)= lhs-rhs;
lhs =y(63);
rhs =y(11);
residual(30)= lhs-rhs;
lhs =y(64);
rhs =y(12);
residual(31)= lhs-rhs;
lhs =y(65);
rhs =y(13);
residual(32)= lhs-rhs;
lhs =y(66);
rhs =y(10);
residual(33)= lhs-rhs;
lhs =y(67);
rhs =y(15);
residual(34)= lhs-rhs;
lhs =y(68);
rhs =y(16);
residual(35)= lhs-rhs;
lhs =y(69);
rhs =y(8);
residual(36)= lhs-rhs;
lhs =y(70);
rhs =y(18);
residual(37)= lhs-rhs;
lhs =y(71);
rhs =y(19);
residual(38)= lhs-rhs;
lhs =y(72);
rhs =y(9);
residual(39)= lhs-rhs;
lhs =y(73);
rhs =y(21);
residual(40)= lhs-rhs;
lhs =y(74);
rhs =y(22);
residual(41)= lhs-rhs;
lhs =y(75);
rhs =y(7);
residual(42)= lhs-rhs;
lhs =y(76);
rhs =y(24);
residual(43)= lhs-rhs;
lhs =y(77);
rhs =y(25);
residual(44)= lhs-rhs;
lhs =y(78);
rhs =y(26);
residual(45)= lhs-rhs;
lhs =y(79);
rhs =y(27);
residual(46)= lhs-rhs;
lhs =y(80);
rhs =y(28);
residual(47)= lhs-rhs;
lhs =y(81);
rhs =y(29);
residual(48)= lhs-rhs;
lhs =y(82);
rhs =y(30);
residual(49)= lhs-rhs;
lhs =y(83);
rhs =y(4);
residual(50)= lhs-rhs;
lhs =y(84);
rhs =y(32);
residual(51)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(51, 108);

  %
  % Jacobian matrix
  %

  g1(1,40)=(-1);
  g1(1,46)=1;
  g1(2,38)=(-1);
  g1(2,47)=1;
  g1(3,37)=(-1);
  g1(3,48)=1;
  g1(4,39)=(-1);
  g1(4,49)=1;
  g1(5,39)=(-1);
  g1(5,50)=1;
  g1(6,8)=(-params(1));
  g1(6,46)=1;
  g1(6,9)=(-params(6));
  g1(6,48)=(-params(5));
  g1(6,88)=(-params(10));
  g1(6,10)=(-params(15));
  g1(6,49)=(-params(14));
  g1(6,89)=(-params(19));
  g1(6,11)=(-params(24));
  g1(6,50)=(-params(23));
  g1(6,90)=(-params(28));
  g1(6,108)=(-params(32));
  g1(6,91)=(-params(11));
  g1(6,92)=(-params(12));
  g1(6,93)=(-params(13));
  g1(6,94)=(-params(20));
  g1(6,95)=(-params(21));
  g1(6,96)=(-params(22));
  g1(6,97)=(-params(29));
  g1(6,98)=(-params(30));
  g1(6,99)=(-params(31));
  g1(6,12)=(-params(25));
  g1(6,13)=(-params(26));
  g1(6,14)=(-params(27));
  g1(6,15)=(-params(16));
  g1(6,16)=(-params(17));
  g1(6,17)=(-params(18));
  g1(6,18)=(-params(2));
  g1(6,19)=(-params(3));
  g1(6,20)=(-params(4));
  g1(6,21)=(-params(7));
  g1(6,22)=(-params(8));
  g1(6,23)=(-params(9));
  g1(7,3)=(-params(36));
  g1(7,36)=1;
  g1(7,39)=(-params(37));
  g1(7,104)=(-1);
  g1(8,1)=params(42);
  g1(8,2)=(-params(42));
  g1(8,6)=(-params(40));
  g1(8,39)=1;
  g1(8,87)=(-params(41));
  g1(8,7)=params(51)*0.04;
  g1(8,105)=(-1);
  g1(8,24)=params(51)*0.08;
  g1(8,25)=params(51)*0.12;
  g1(8,26)=params(51)*0.16;
  g1(8,27)=params(51)*0.2;
  g1(8,28)=params(51)*0.16;
  g1(8,29)=params(51)*0.12;
  g1(8,30)=params(51)*0.08;
  g1(8,31)=params(51)*0.04;
  g1(9,44)=1;
  g1(9,107)=(-1);
  g1(10,37)=1;
  g1(10,5)=(-(1-params(43)));
  g1(10,6)=(-params(44));
  g1(10,106)=1;
  g1(10,102)=(-params(43));
  g1(11,34)=1;
  g1(11,85)=1;
  g1(11,40)=(-1);
  g1(12,2)=(-(1-params(34)));
  g1(12,35)=1;
  g1(12,103)=(-1);
  g1(13,4)=(-0.25);
  g1(13,37)=(-0.25);
  g1(13,38)=1;
  g1(13,32)=(-0.25);
  g1(13,33)=(-0.25);
  g1(14,41)=1;
  g1(14,102)=(-1);
  g1(15,85)=(-1);
  g1(15,43)=1;
  g1(16,87)=(-1);
  g1(16,42)=1;
  g1(17,7)=(-(params(51)*0.04));
  g1(17,45)=1;
  g1(17,24)=(-(params(51)*0.08));
  g1(17,25)=(-(params(51)*0.12));
  g1(17,26)=(-(params(51)*0.16));
  g1(17,27)=(-(params(51)*0.2));
  g1(17,28)=(-(params(51)*0.16));
  g1(17,29)=(-(params(51)*0.12));
  g1(17,30)=(-(params(51)*0.08));
  g1(17,31)=(-(params(51)*0.04));
  g1(18,88)=(-1);
  g1(18,51)=1;
  g1(19,91)=(-1);
  g1(19,52)=1;
  g1(20,92)=(-1);
  g1(20,53)=1;
  g1(21,89)=(-1);
  g1(21,54)=1;
  g1(22,94)=(-1);
  g1(22,55)=1;
  g1(23,95)=(-1);
  g1(23,56)=1;
  g1(24,90)=(-1);
  g1(24,57)=1;
  g1(25,97)=(-1);
  g1(25,58)=1;
  g1(26,98)=(-1);
  g1(26,59)=1;
  g1(27,86)=(-1);
  g1(27,60)=1;
  g1(28,100)=(-1);
  g1(28,61)=1;
  g1(29,101)=(-1);
  g1(29,62)=1;
  g1(30,11)=(-1);
  g1(30,63)=1;
  g1(31,12)=(-1);
  g1(31,64)=1;
  g1(32,13)=(-1);
  g1(32,65)=1;
  g1(33,10)=(-1);
  g1(33,66)=1;
  g1(34,15)=(-1);
  g1(34,67)=1;
  g1(35,16)=(-1);
  g1(35,68)=1;
  g1(36,8)=(-1);
  g1(36,69)=1;
  g1(37,18)=(-1);
  g1(37,70)=1;
  g1(38,19)=(-1);
  g1(38,71)=1;
  g1(39,9)=(-1);
  g1(39,72)=1;
  g1(40,21)=(-1);
  g1(40,73)=1;
  g1(41,22)=(-1);
  g1(41,74)=1;
  g1(42,7)=(-1);
  g1(42,75)=1;
  g1(43,24)=(-1);
  g1(43,76)=1;
  g1(44,25)=(-1);
  g1(44,77)=1;
  g1(45,26)=(-1);
  g1(45,78)=1;
  g1(46,27)=(-1);
  g1(46,79)=1;
  g1(47,28)=(-1);
  g1(47,80)=1;
  g1(48,29)=(-1);
  g1(48,81)=1;
  g1(49,30)=(-1);
  g1(49,82)=1;
  g1(50,4)=(-1);
  g1(50,83)=1;
  g1(51,32)=(-1);
  g1(51,84)=1;
end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],51,11664);
end
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],51,1259712);
end
end
