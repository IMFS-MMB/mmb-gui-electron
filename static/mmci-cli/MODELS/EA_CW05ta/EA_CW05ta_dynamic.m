function [residual, g1, g2, g3] = EA_CW05ta_dynamic(y, x, params, steady_state, it_)
%
% Status : Computes dynamic model for Dynare
%
% Inputs :
%   y         [#dynamic variables by 1] double    vector of endogenous variables in the order stored
%                                                 in M_.lead_lag_incidence; see the Manual
%   x         [nperiods by M_.exo_nbr] double     matrix of exogenous variables (in declaration order)
%                                                 for all simulation periods
%   steady_state  [M_.endo_nbr by 1] double       vector of steady state values
%   params    [M_.param_nbr by 1] double          vector of parameter values in declaration order
%   it_       scalar double                       time period for exogenous variables for which to evaluate the model
%
% Outputs:
%   residual  [M_.endo_nbr by 1] double    vector of residuals of the dynamic model equations in order of 
%                                          declaration of the equations.
%                                          Dynare may prepend auxiliary equations, see M_.aux_vars
%   g1        [M_.endo_nbr by #dynamic variables] double    Jacobian matrix of the dynamic model equations;
%                                                           rows: equations in order of declaration
%                                                           columns: variables in order stored in M_.lead_lag_incidence followed by the ones in M_.exo_names
%   g2        [M_.endo_nbr by (#dynamic variables)^2] double   Hessian matrix of the dynamic model equations;
%                                                              rows: equations in order of declaration
%                                                              columns: variables in order stored in M_.lead_lag_incidence followed by the ones in M_.exo_names
%   g3        [M_.endo_nbr by (#dynamic variables)^3] double   Third order derivative matrix of the dynamic model equations;
%                                                              rows: equations in order of declaration
%                                                              columns: variables in order stored in M_.lead_lag_incidence followed by the ones in M_.exo_names
%
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

%
% Model equations
%

residual = zeros(55, 1);
lhs =y(41);
rhs =y(36)*100;
residual(1)= lhs-rhs;
lhs =y(42);
rhs =100*y(35);
residual(2)= lhs-rhs;
lhs =y(43);
rhs =100*y(32)*4;
residual(3)= lhs-rhs;
lhs =y(44);
rhs =100*y(27);
residual(4)= lhs-rhs;
lhs =y(45);
rhs =100*y(27);
residual(5)= lhs-rhs;
lhs =y(41);
rhs =params(32)*x(it_, 3)+params(31)*y(96)+params(30)*y(95)+params(29)*y(94)+params(28)*y(87)+params(27)*y(17)+params(26)*y(16)+params(25)*y(15)+params(24)*y(14)+y(45)*params(23)+params(22)*y(93)+params(21)*y(92)+params(20)*y(91)+params(19)*y(86)+params(18)*y(20)+params(17)*y(19)+params(16)*y(18)+params(15)*y(13)+y(44)*params(14)+params(13)*y(90)+params(12)*y(89)+params(11)*y(88)+params(10)*y(85)+params(6)*y(12)+y(43)*params(5)+params(1)*y(11)+params(2)*y(21)+params(3)*y(22)+params(4)*y(23)+params(7)*y(24)+params(8)*y(25)+params(9)*y(26);
residual(6)= lhs-rhs;
lhs =y(27);
rhs =params(42)*y(1)+params(43)*y(2)+params(44)*y(10)+params(45)*x(it_, 2);
residual(7)= lhs-rhs;
lhs =y(28);
rhs =y(1);
residual(8)= lhs-rhs;
lhs =y(29);
rhs =params(46)*x(it_, 1)+(params(37)+params(38)+params(39))*y(83)+(params(38)+params(39))*y(97)+params(39)*y(98)+params(40)*(y(27)*params(36)+params(37)*y(82)+params(38)*y(99)+params(39)*y(100));
residual(9)= lhs-rhs;
lhs =y(30);
rhs =y(3);
residual(10)= lhs-rhs;
lhs =y(31);
rhs =y(4);
residual(11)= lhs-rhs;
lhs =y(32);
rhs =(y(29)*params(36)+params(37)*y(3)+params(38)*y(4)+params(39)*y(5)-(params(38)+params(39))*y(6)-params(39)*y(7))/(params(37)+params(38)+params(39));
residual(12)= lhs-rhs;
lhs =y(33);
rhs =y(6);
residual(13)= lhs-rhs;
lhs =y(34);
rhs =y(7);
residual(14)= lhs-rhs;
lhs =y(35);
rhs =y(7)+y(32)+y(6)+y(8);
residual(15)= lhs-rhs;
lhs =y(37);
rhs =y(9);
residual(16)= lhs-rhs;
lhs =y(38);
rhs =y(36)-y(9);
residual(17)= lhs-rhs;
lhs =y(39);
rhs =(y(36)+y(84)+y(101)+y(102)+y(103)+y(104)+y(105)+y(106))/8;
residual(18)= lhs-rhs;
lhs =y(40);
rhs =y(39)-(y(83)+y(97)+y(98)+y(107)+y(108)+y(109)+y(110)+y(111))/2;
residual(19)= lhs-rhs;
lhs =y(46);
rhs =y(85);
residual(20)= lhs-rhs;
lhs =y(47);
rhs =y(88);
residual(21)= lhs-rhs;
lhs =y(48);
rhs =y(89);
residual(22)= lhs-rhs;
lhs =y(49);
rhs =y(86);
residual(23)= lhs-rhs;
lhs =y(50);
rhs =y(91);
residual(24)= lhs-rhs;
lhs =y(51);
rhs =y(92);
residual(25)= lhs-rhs;
lhs =y(52);
rhs =y(87);
residual(26)= lhs-rhs;
lhs =y(53);
rhs =y(94);
residual(27)= lhs-rhs;
lhs =y(54);
rhs =y(95);
residual(28)= lhs-rhs;
lhs =y(55);
rhs =y(83);
residual(29)= lhs-rhs;
lhs =y(56);
rhs =y(97);
residual(30)= lhs-rhs;
lhs =y(57);
rhs =y(82);
residual(31)= lhs-rhs;
lhs =y(58);
rhs =y(99);
residual(32)= lhs-rhs;
lhs =y(59);
rhs =y(84);
residual(33)= lhs-rhs;
lhs =y(60);
rhs =y(101);
residual(34)= lhs-rhs;
lhs =y(61);
rhs =y(102);
residual(35)= lhs-rhs;
lhs =y(62);
rhs =y(103);
residual(36)= lhs-rhs;
lhs =y(63);
rhs =y(104);
residual(37)= lhs-rhs;
lhs =y(64);
rhs =y(105);
residual(38)= lhs-rhs;
lhs =y(65);
rhs =y(98);
residual(39)= lhs-rhs;
lhs =y(66);
rhs =y(107);
residual(40)= lhs-rhs;
lhs =y(67);
rhs =y(108);
residual(41)= lhs-rhs;
lhs =y(68);
rhs =y(109);
residual(42)= lhs-rhs;
lhs =y(69);
rhs =y(110);
residual(43)= lhs-rhs;
lhs =y(70);
rhs =y(14);
residual(44)= lhs-rhs;
lhs =y(71);
rhs =y(15);
residual(45)= lhs-rhs;
lhs =y(72);
rhs =y(16);
residual(46)= lhs-rhs;
lhs =y(73);
rhs =y(13);
residual(47)= lhs-rhs;
lhs =y(74);
rhs =y(18);
residual(48)= lhs-rhs;
lhs =y(75);
rhs =y(19);
residual(49)= lhs-rhs;
lhs =y(76);
rhs =y(11);
residual(50)= lhs-rhs;
lhs =y(77);
rhs =y(21);
residual(51)= lhs-rhs;
lhs =y(78);
rhs =y(22);
residual(52)= lhs-rhs;
lhs =y(79);
rhs =y(12);
residual(53)= lhs-rhs;
lhs =y(80);
rhs =y(24);
residual(54)= lhs-rhs;
lhs =y(81);
rhs =y(25);
residual(55)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(55, 114);

  %
  % Jacobian matrix
  %

  g1(1,36)=(-100);
  g1(1,41)=1;
  g1(2,35)=(-100);
  g1(2,42)=1;
  g1(3,32)=(-400);
  g1(3,43)=1;
  g1(4,27)=(-100);
  g1(4,44)=1;
  g1(5,27)=(-100);
  g1(5,45)=1;
  g1(6,11)=(-params(1));
  g1(6,41)=1;
  g1(6,12)=(-params(6));
  g1(6,43)=(-params(5));
  g1(6,85)=(-params(10));
  g1(6,13)=(-params(15));
  g1(6,44)=(-params(14));
  g1(6,86)=(-params(19));
  g1(6,14)=(-params(24));
  g1(6,45)=(-params(23));
  g1(6,87)=(-params(28));
  g1(6,114)=(-params(32));
  g1(6,88)=(-params(11));
  g1(6,89)=(-params(12));
  g1(6,90)=(-params(13));
  g1(6,91)=(-params(20));
  g1(6,92)=(-params(21));
  g1(6,93)=(-params(22));
  g1(6,94)=(-params(29));
  g1(6,95)=(-params(30));
  g1(6,96)=(-params(31));
  g1(6,15)=(-params(25));
  g1(6,16)=(-params(26));
  g1(6,17)=(-params(27));
  g1(6,18)=(-params(16));
  g1(6,19)=(-params(17));
  g1(6,20)=(-params(18));
  g1(6,21)=(-params(2));
  g1(6,22)=(-params(3));
  g1(6,23)=(-params(4));
  g1(6,24)=(-params(7));
  g1(6,25)=(-params(8));
  g1(6,26)=(-params(9));
  g1(7,1)=(-params(42));
  g1(7,27)=1;
  g1(7,2)=(-params(43));
  g1(7,10)=(-params(44));
  g1(7,113)=(-params(45));
  g1(8,1)=(-1);
  g1(8,28)=1;
  g1(9,27)=(-(params(40)*params(36)));
  g1(9,82)=(-(params(37)*params(40)));
  g1(9,29)=1;
  g1(9,83)=(-(params(37)+params(38)+params(39)));
  g1(9,112)=(-params(46));
  g1(9,97)=(-(params(38)+params(39)));
  g1(9,98)=(-params(39));
  g1(9,99)=(-(params(38)*params(40)));
  g1(9,100)=(-(params(39)*params(40)));
  g1(10,3)=(-1);
  g1(10,30)=1;
  g1(11,4)=(-1);
  g1(11,31)=1;
  g1(12,3)=(-(params(37)/(params(37)+params(38)+params(39))));
  g1(12,29)=(-(params(36)/(params(37)+params(38)+params(39))));
  g1(12,4)=(-(params(38)/(params(37)+params(38)+params(39))));
  g1(12,5)=(-(params(39)/(params(37)+params(38)+params(39))));
  g1(12,6)=(-((-(params(38)+params(39)))/(params(37)+params(38)+params(39))));
  g1(12,32)=1;
  g1(12,7)=(-((-params(39))/(params(37)+params(38)+params(39))));
  g1(13,6)=(-1);
  g1(13,33)=1;
  g1(14,7)=(-1);
  g1(14,34)=1;
  g1(15,6)=(-1);
  g1(15,32)=(-1);
  g1(15,7)=(-1);
  g1(15,8)=(-1);
  g1(15,35)=1;
  g1(16,9)=(-1);
  g1(16,37)=1;
  g1(17,9)=1;
  g1(17,36)=(-1);
  g1(17,38)=1;
  g1(18,36)=(-0.125);
  g1(18,84)=(-0.125);
  g1(18,39)=1;
  g1(18,101)=(-0.125);
  g1(18,102)=(-0.125);
  g1(18,103)=(-0.125);
  g1(18,104)=(-0.125);
  g1(18,105)=(-0.125);
  g1(18,106)=(-0.125);
  g1(19,83)=0.5;
  g1(19,39)=(-1);
  g1(19,40)=1;
  g1(19,97)=0.5;
  g1(19,98)=0.5;
  g1(19,107)=0.5;
  g1(19,108)=0.5;
  g1(19,109)=0.5;
  g1(19,110)=0.5;
  g1(19,111)=0.5;
  g1(20,85)=(-1);
  g1(20,46)=1;
  g1(21,88)=(-1);
  g1(21,47)=1;
  g1(22,89)=(-1);
  g1(22,48)=1;
  g1(23,86)=(-1);
  g1(23,49)=1;
  g1(24,91)=(-1);
  g1(24,50)=1;
  g1(25,92)=(-1);
  g1(25,51)=1;
  g1(26,87)=(-1);
  g1(26,52)=1;
  g1(27,94)=(-1);
  g1(27,53)=1;
  g1(28,95)=(-1);
  g1(28,54)=1;
  g1(29,83)=(-1);
  g1(29,55)=1;
  g1(30,97)=(-1);
  g1(30,56)=1;
  g1(31,82)=(-1);
  g1(31,57)=1;
  g1(32,99)=(-1);
  g1(32,58)=1;
  g1(33,84)=(-1);
  g1(33,59)=1;
  g1(34,101)=(-1);
  g1(34,60)=1;
  g1(35,102)=(-1);
  g1(35,61)=1;
  g1(36,103)=(-1);
  g1(36,62)=1;
  g1(37,104)=(-1);
  g1(37,63)=1;
  g1(38,105)=(-1);
  g1(38,64)=1;
  g1(39,98)=(-1);
  g1(39,65)=1;
  g1(40,107)=(-1);
  g1(40,66)=1;
  g1(41,108)=(-1);
  g1(41,67)=1;
  g1(42,109)=(-1);
  g1(42,68)=1;
  g1(43,110)=(-1);
  g1(43,69)=1;
  g1(44,14)=(-1);
  g1(44,70)=1;
  g1(45,15)=(-1);
  g1(45,71)=1;
  g1(46,16)=(-1);
  g1(46,72)=1;
  g1(47,13)=(-1);
  g1(47,73)=1;
  g1(48,18)=(-1);
  g1(48,74)=1;
  g1(49,19)=(-1);
  g1(49,75)=1;
  g1(50,11)=(-1);
  g1(50,76)=1;
  g1(51,21)=(-1);
  g1(51,77)=1;
  g1(52,22)=(-1);
  g1(52,78)=1;
  g1(53,12)=(-1);
  g1(53,79)=1;
  g1(54,24)=(-1);
  g1(54,80)=1;
  g1(55,25)=(-1);
  g1(55,81)=1;

if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],55,12996);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],55,1481544);
end
end
end
end
