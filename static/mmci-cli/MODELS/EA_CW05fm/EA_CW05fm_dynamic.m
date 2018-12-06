function [residual, g1, g2, g3] = EA_CW05fm_dynamic(y, x, params, steady_state, it_)
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

residual = zeros(57, 1);
lhs =y(58);
rhs =y(41)*100;
residual(1)= lhs-rhs;
lhs =y(59);
rhs =100*y(40);
residual(2)= lhs-rhs;
lhs =y(60);
rhs =100*y(37)*4;
residual(3)= lhs-rhs;
lhs =y(61);
rhs =100*y(27);
residual(4)= lhs-rhs;
lhs =y(62);
rhs =100*y(27);
residual(5)= lhs-rhs;
lhs =y(58);
rhs =params(32)*x(it_, 3)+params(31)*y(116)+params(30)*y(115)+params(29)*y(114)+params(28)*y(107)+params(27)*y(17)+params(26)*y(16)+params(25)*y(15)+params(24)*y(14)+y(62)*params(23)+params(22)*y(113)+params(21)*y(112)+params(20)*y(111)+params(19)*y(106)+params(18)*y(20)+params(17)*y(19)+params(16)*y(18)+params(15)*y(13)+y(61)*params(14)+params(13)*y(110)+params(12)*y(109)+params(11)*y(108)+params(10)*y(105)+params(6)*y(12)+y(60)*params(5)+params(1)*y(11)+params(2)*y(21)+params(3)*y(22)+params(4)*y(23)+params(7)*y(24)+params(8)*y(25)+params(9)*y(26);
residual(6)= lhs-rhs;
lhs =y(27);
rhs =params(43)*y(1)+params(44)*y(2)+params(45)*y(10)+params(46)*x(it_, 2);
residual(7)= lhs-rhs;
lhs =y(28);
rhs =y(1);
residual(8)= lhs-rhs;
lhs =y(29);
rhs =params(36)*y(34)+params(37)*y(30)+params(38)*y(31)+params(39)*y(86)+params(40)*(y(27)*params(36)+params(37)*y(32)+params(38)*y(33)+params(39)*y(88))+params(41)*x(it_, 1);
residual(9)= lhs-rhs;
lhs =y(30);
rhs =y(89);
residual(10)= lhs-rhs;
lhs =y(31);
rhs =y(85);
residual(11)= lhs-rhs;
lhs =y(32);
rhs =y(84);
residual(12)= lhs-rhs;
lhs =y(33);
rhs =y(87);
residual(13)= lhs-rhs;
lhs =y(34);
rhs =y(29)*params(36)+params(37)*y(35)+params(38)*y(36)+params(39)*y(5);
residual(14)= lhs-rhs;
lhs =y(35);
rhs =y(3);
residual(15)= lhs-rhs;
lhs =y(36);
rhs =y(4);
residual(16)= lhs-rhs;
lhs =y(37);
rhs =(y(29)*params(36)+params(37)*y(35)+params(38)*y(36)+params(39)*y(5)-(params(38)+params(39))*y(38)-params(39)*y(39))/(params(39)+params(37)+params(38));
residual(17)= lhs-rhs;
lhs =y(38);
rhs =y(6);
residual(18)= lhs-rhs;
lhs =y(39);
rhs =y(7);
residual(19)= lhs-rhs;
lhs =y(40);
rhs =y(39)+y(37)+y(38)+y(8);
residual(20)= lhs-rhs;
lhs =y(42);
rhs =y(41)-y(9);
residual(21)= lhs-rhs;
lhs =y(43);
rhs =(y(41)+y(44)+y(45)+y(46)+y(47)+y(48)+y(49)+y(97))/8;
residual(22)= lhs-rhs;
lhs =y(44);
rhs =y(91);
residual(23)= lhs-rhs;
lhs =y(45);
rhs =y(92);
residual(24)= lhs-rhs;
lhs =y(46);
rhs =y(93);
residual(25)= lhs-rhs;
lhs =y(47);
rhs =y(94);
residual(26)= lhs-rhs;
lhs =y(48);
rhs =y(95);
residual(27)= lhs-rhs;
lhs =y(49);
rhs =y(96);
residual(28)= lhs-rhs;
lhs =y(50);
rhs =y(43)-(y(51)+y(52)+y(53)+y(54)+y(55)+y(56)+y(57)+y(104))/2;
residual(29)= lhs-rhs;
lhs =y(51);
rhs =y(90);
residual(30)= lhs-rhs;
lhs =y(52);
rhs =y(98);
residual(31)= lhs-rhs;
lhs =y(53);
rhs =y(99);
residual(32)= lhs-rhs;
lhs =y(54);
rhs =y(100);
residual(33)= lhs-rhs;
lhs =y(55);
rhs =y(101);
residual(34)= lhs-rhs;
lhs =y(56);
rhs =y(102);
residual(35)= lhs-rhs;
lhs =y(57);
rhs =y(103);
residual(36)= lhs-rhs;
lhs =y(63);
rhs =y(105);
residual(37)= lhs-rhs;
lhs =y(64);
rhs =y(108);
residual(38)= lhs-rhs;
lhs =y(65);
rhs =y(109);
residual(39)= lhs-rhs;
lhs =y(66);
rhs =y(106);
residual(40)= lhs-rhs;
lhs =y(67);
rhs =y(111);
residual(41)= lhs-rhs;
lhs =y(68);
rhs =y(112);
residual(42)= lhs-rhs;
lhs =y(69);
rhs =y(107);
residual(43)= lhs-rhs;
lhs =y(70);
rhs =y(114);
residual(44)= lhs-rhs;
lhs =y(71);
rhs =y(115);
residual(45)= lhs-rhs;
lhs =y(72);
rhs =y(14);
residual(46)= lhs-rhs;
lhs =y(73);
rhs =y(15);
residual(47)= lhs-rhs;
lhs =y(74);
rhs =y(16);
residual(48)= lhs-rhs;
lhs =y(75);
rhs =y(13);
residual(49)= lhs-rhs;
lhs =y(76);
rhs =y(18);
residual(50)= lhs-rhs;
lhs =y(77);
rhs =y(19);
residual(51)= lhs-rhs;
lhs =y(78);
rhs =y(11);
residual(52)= lhs-rhs;
lhs =y(79);
rhs =y(21);
residual(53)= lhs-rhs;
lhs =y(80);
rhs =y(22);
residual(54)= lhs-rhs;
lhs =y(81);
rhs =y(12);
residual(55)= lhs-rhs;
lhs =y(82);
rhs =y(24);
residual(56)= lhs-rhs;
lhs =y(83);
rhs =y(25);
residual(57)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(57, 119);

  %
  % Jacobian matrix
  %

  g1(1,41)=(-100);
  g1(1,58)=1;
  g1(2,40)=(-100);
  g1(2,59)=1;
  g1(3,37)=(-400);
  g1(3,60)=1;
  g1(4,27)=(-100);
  g1(4,61)=1;
  g1(5,27)=(-100);
  g1(5,62)=1;
  g1(6,11)=(-params(1));
  g1(6,58)=1;
  g1(6,12)=(-params(6));
  g1(6,60)=(-params(5));
  g1(6,105)=(-params(10));
  g1(6,13)=(-params(15));
  g1(6,61)=(-params(14));
  g1(6,106)=(-params(19));
  g1(6,14)=(-params(24));
  g1(6,62)=(-params(23));
  g1(6,107)=(-params(28));
  g1(6,119)=(-params(32));
  g1(6,108)=(-params(11));
  g1(6,109)=(-params(12));
  g1(6,110)=(-params(13));
  g1(6,111)=(-params(20));
  g1(6,112)=(-params(21));
  g1(6,113)=(-params(22));
  g1(6,114)=(-params(29));
  g1(6,115)=(-params(30));
  g1(6,116)=(-params(31));
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
  g1(7,1)=(-params(43));
  g1(7,27)=1;
  g1(7,2)=(-params(44));
  g1(7,10)=(-params(45));
  g1(7,118)=(-params(46));
  g1(8,1)=(-1);
  g1(8,28)=1;
  g1(9,27)=(-(params(36)*params(40)));
  g1(9,29)=1;
  g1(9,30)=(-params(37));
  g1(9,31)=(-params(38));
  g1(9,86)=(-params(39));
  g1(9,32)=(-(params(37)*params(40)));
  g1(9,33)=(-(params(38)*params(40)));
  g1(9,88)=(-(params(39)*params(40)));
  g1(9,34)=(-params(36));
  g1(9,117)=(-params(41));
  g1(10,30)=1;
  g1(10,89)=(-1);
  g1(11,85)=(-1);
  g1(11,31)=1;
  g1(12,84)=(-1);
  g1(12,32)=1;
  g1(13,87)=(-1);
  g1(13,33)=1;
  g1(14,29)=(-params(36));
  g1(14,34)=1;
  g1(14,35)=(-params(37));
  g1(14,5)=(-params(39));
  g1(14,36)=(-params(38));
  g1(15,3)=(-1);
  g1(15,35)=1;
  g1(16,4)=(-1);
  g1(16,36)=1;
  g1(17,29)=(-(params(36)/(params(39)+params(37)+params(38))));
  g1(17,35)=(-(params(37)/(params(39)+params(37)+params(38))));
  g1(17,5)=(-(params(39)/(params(39)+params(37)+params(38))));
  g1(17,36)=(-(params(38)/(params(39)+params(37)+params(38))));
  g1(17,37)=1;
  g1(17,38)=(-((-(params(38)+params(39)))/(params(39)+params(37)+params(38))));
  g1(17,39)=(-((-params(39))/(params(39)+params(37)+params(38))));
  g1(18,6)=(-1);
  g1(18,38)=1;
  g1(19,7)=(-1);
  g1(19,39)=1;
  g1(20,37)=(-1);
  g1(20,38)=(-1);
  g1(20,8)=(-1);
  g1(20,39)=(-1);
  g1(20,40)=1;
  g1(21,9)=1;
  g1(21,41)=(-1);
  g1(21,42)=1;
  g1(22,41)=(-0.125);
  g1(22,43)=1;
  g1(22,44)=(-0.125);
  g1(22,45)=(-0.125);
  g1(22,46)=(-0.125);
  g1(22,47)=(-0.125);
  g1(22,48)=(-0.125);
  g1(22,49)=(-0.125);
  g1(22,97)=(-0.125);
  g1(23,91)=(-1);
  g1(23,44)=1;
  g1(24,92)=(-1);
  g1(24,45)=1;
  g1(25,93)=(-1);
  g1(25,46)=1;
  g1(26,94)=(-1);
  g1(26,47)=1;
  g1(27,95)=(-1);
  g1(27,48)=1;
  g1(28,96)=(-1);
  g1(28,49)=1;
  g1(29,43)=(-1);
  g1(29,50)=1;
  g1(29,51)=0.5;
  g1(29,52)=0.5;
  g1(29,53)=0.5;
  g1(29,54)=0.5;
  g1(29,55)=0.5;
  g1(29,56)=0.5;
  g1(29,57)=0.5;
  g1(29,104)=0.5;
  g1(30,90)=(-1);
  g1(30,51)=1;
  g1(31,98)=(-1);
  g1(31,52)=1;
  g1(32,99)=(-1);
  g1(32,53)=1;
  g1(33,100)=(-1);
  g1(33,54)=1;
  g1(34,101)=(-1);
  g1(34,55)=1;
  g1(35,102)=(-1);
  g1(35,56)=1;
  g1(36,103)=(-1);
  g1(36,57)=1;
  g1(37,105)=(-1);
  g1(37,63)=1;
  g1(38,108)=(-1);
  g1(38,64)=1;
  g1(39,109)=(-1);
  g1(39,65)=1;
  g1(40,106)=(-1);
  g1(40,66)=1;
  g1(41,111)=(-1);
  g1(41,67)=1;
  g1(42,112)=(-1);
  g1(42,68)=1;
  g1(43,107)=(-1);
  g1(43,69)=1;
  g1(44,114)=(-1);
  g1(44,70)=1;
  g1(45,115)=(-1);
  g1(45,71)=1;
  g1(46,14)=(-1);
  g1(46,72)=1;
  g1(47,15)=(-1);
  g1(47,73)=1;
  g1(48,16)=(-1);
  g1(48,74)=1;
  g1(49,13)=(-1);
  g1(49,75)=1;
  g1(50,18)=(-1);
  g1(50,76)=1;
  g1(51,19)=(-1);
  g1(51,77)=1;
  g1(52,11)=(-1);
  g1(52,78)=1;
  g1(53,21)=(-1);
  g1(53,79)=1;
  g1(54,22)=(-1);
  g1(54,80)=1;
  g1(55,12)=(-1);
  g1(55,81)=1;
  g1(56,24)=(-1);
  g1(56,82)=1;
  g1(57,25)=(-1);
  g1(57,83)=1;
end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],57,14161);
end
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],57,1685159);
end
end
