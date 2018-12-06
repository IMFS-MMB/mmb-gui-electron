function [residual, g1, g2, g3] = NK_BGG99_dynamic(y, x, params, steady_state, it_)
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

residual = zeros(58, 1);
T230 = params(42)^(-1);
T281 = (1-params(39))*(1-params(36))*params(60)/params(47);
lhs =y(59);
rhs =4*y(35);
residual(1)= lhs-rhs;
lhs =y(60);
rhs =y(44)+y(6)+y(17)+y(18);
residual(2)= lhs-rhs;
lhs =y(61);
rhs =4*y(44);
residual(3)= lhs-rhs;
lhs =y(62);
rhs =y(31)-y(50);
residual(4)= lhs-rhs;
lhs =y(63);
rhs =y(31);
residual(5)= lhs-rhs;
lhs =y(64);
rhs =y(49);
residual(6)= lhs-rhs;
lhs =y(59);
rhs =params(32)*x(it_, 2)+params(31)*y(106)+params(30)*y(105)+params(29)*y(104)+params(28)*y(97)+params(27)*y(21)+params(26)*y(20)+params(25)*y(19)+params(24)*y(16)+y(63)*params(23)+params(22)*y(103)+params(21)*y(102)+params(20)*y(101)+params(19)*y(96)+params(18)*y(24)+params(17)*y(23)+params(16)*y(22)+params(15)*y(15)+y(62)*params(14)+params(13)*y(100)+params(12)*y(99)+params(11)*y(98)+params(10)*y(95)+params(6)*y(14)+y(61)*params(5)+params(1)*y(13)+params(2)*y(25)+params(3)*y(26)+params(4)*y(27)+params(7)*y(28)+params(8)*y(29)+params(9)*y(30);
residual(7)= lhs-rhs;
lhs =y(64);
rhs =params(34)*x(it_, 3);
residual(8)= lhs-rhs;
lhs =y(31);
rhs =params(48)*y(38)+params(50)*y(33)+params(51)*y(39);
residual(9)= lhs-rhs;
lhs =y(38);
rhs =(-y(34))+y(90);
residual(10)= lhs-rhs;
residual(11) = y(40);
lhs =y(89)-y(34);
rhs =(-params(40))*(y(37)-y(41)-y(32));
residual(12)= lhs-rhs;
lhs =y(36);
rhs =(1-params(41))*(y(31)-y(1)-y(42))+y(41)*params(41)-y(5);
residual(13)= lhs-rhs;
lhs =y(41);
rhs =params(43)*(y(33)-y(1));
residual(14)= lhs-rhs;
lhs =y(31);
rhs =y(45)+y(1)*params(39)+(1-params(39))*params(36)*y(43);
residual(15)= lhs-rhs;
lhs =y(31)-y(43)-y(42)-y(38);
rhs =y(43)*T230;
residual(16)= lhs-rhs;
lhs =y(46);
rhs =(-params(44))*y(91)+params(45)*y(107);
residual(17)= lhs-rhs;
lhs =y(44);
rhs =y(8);
residual(18)= lhs-rhs;
lhs =y(48);
rhs =y(92);
residual(19)= lhs-rhs;
lhs =y(32);
rhs =y(33)*params(46)+y(1)*(1-params(46));
residual(20)= lhs-rhs;
lhs =y(37);
rhs =y(36)*params(37)*params(55)*params(53)-params(53)*params(37)*params(54)*y(2)+params(53)*params(37)*(params(55)-params(54))*(y(1)+y(5))+params(37)*params(54)*(y(2)+y(3))+T281*(y(31)-y(42));
residual(21)= lhs-rhs;
lhs =y(39);
rhs =y(49)+params(62)*y(4);
residual(22)= lhs-rhs;
lhs =y(45);
rhs =params(63)*y(7)+x(it_, 1);
residual(23)= lhs-rhs;
lhs =y(34);
rhs =y(35)-y(92);
residual(24)= lhs-rhs;
lhs =y(47);
rhs =y(89)-y(34);
residual(25)= lhs-rhs;
lhs =y(50);
rhs =params(51)*y(39)+params(48)*y(56)+params(50)*y(52);
residual(26)= lhs-rhs;
lhs =y(56);
rhs =(-y(53))+y(94);
residual(27)= lhs-rhs;
lhs =y(93)-y(53);
rhs =(-params(40))*(y(55)-y(57)-y(51));
residual(28)= lhs-rhs;
lhs =y(54);
rhs =(1-params(41))*(y(50)-y(9))+params(41)*y(57)-y(12);
residual(29)= lhs-rhs;
lhs =y(57);
rhs =params(43)*(y(52)-y(9));
residual(30)= lhs-rhs;
lhs =y(50);
rhs =y(45)+params(39)*y(9)+(1-params(39))*params(36)*y(58);
residual(31)= lhs-rhs;
lhs =y(50)-y(58)-y(56);
rhs =T230*y(58);
residual(32)= lhs-rhs;
lhs =y(51);
rhs =params(46)*y(52)+(1-params(46))*y(9);
residual(33)= lhs-rhs;
lhs =y(55);
rhs =params(37)*params(55)*params(53)*y(54)-params(53)*params(37)*params(54)*y(10)+params(53)*params(37)*(params(55)-params(54))*(y(9)+y(12))+params(37)*params(54)*(y(10)+y(11))+y(50)*T281;
residual(34)= lhs-rhs;
lhs =y(65);
rhs =y(95);
residual(35)= lhs-rhs;
lhs =y(66);
rhs =y(98);
residual(36)= lhs-rhs;
lhs =y(67);
rhs =y(99);
residual(37)= lhs-rhs;
lhs =y(68);
rhs =y(96);
residual(38)= lhs-rhs;
lhs =y(69);
rhs =y(101);
residual(39)= lhs-rhs;
lhs =y(70);
rhs =y(102);
residual(40)= lhs-rhs;
lhs =y(71);
rhs =y(97);
residual(41)= lhs-rhs;
lhs =y(72);
rhs =y(104);
residual(42)= lhs-rhs;
lhs =y(73);
rhs =y(105);
residual(43)= lhs-rhs;
lhs =y(74);
rhs =y(92);
residual(44)= lhs-rhs;
lhs =y(75);
rhs =y(6);
residual(45)= lhs-rhs;
lhs =y(76);
rhs =y(17);
residual(46)= lhs-rhs;
lhs =y(77);
rhs =y(16);
residual(47)= lhs-rhs;
lhs =y(78);
rhs =y(19);
residual(48)= lhs-rhs;
lhs =y(79);
rhs =y(20);
residual(49)= lhs-rhs;
lhs =y(80);
rhs =y(15);
residual(50)= lhs-rhs;
lhs =y(81);
rhs =y(22);
residual(51)= lhs-rhs;
lhs =y(82);
rhs =y(23);
residual(52)= lhs-rhs;
lhs =y(83);
rhs =y(13);
residual(53)= lhs-rhs;
lhs =y(84);
rhs =y(25);
residual(54)= lhs-rhs;
lhs =y(85);
rhs =y(26);
residual(55)= lhs-rhs;
lhs =y(86);
rhs =y(14);
residual(56)= lhs-rhs;
lhs =y(87);
rhs =y(28);
residual(57)= lhs-rhs;
lhs =y(88);
rhs =y(29);
residual(58)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(58, 110);

  %
  % Jacobian matrix
  %

  g1(1,35)=(-4);
  g1(1,59)=1;
  g1(2,6)=(-1);
  g1(2,44)=(-1);
  g1(2,60)=1;
  g1(2,17)=(-1);
  g1(2,18)=(-1);
  g1(3,44)=(-4);
  g1(3,61)=1;
  g1(4,31)=(-1);
  g1(4,50)=1;
  g1(4,62)=1;
  g1(5,31)=(-1);
  g1(5,63)=1;
  g1(6,49)=(-1);
  g1(6,64)=1;
  g1(7,13)=(-params(1));
  g1(7,59)=1;
  g1(7,14)=(-params(6));
  g1(7,61)=(-params(5));
  g1(7,95)=(-params(10));
  g1(7,15)=(-params(15));
  g1(7,62)=(-params(14));
  g1(7,96)=(-params(19));
  g1(7,16)=(-params(24));
  g1(7,63)=(-params(23));
  g1(7,97)=(-params(28));
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
  g1(7,19)=(-params(25));
  g1(7,20)=(-params(26));
  g1(7,21)=(-params(27));
  g1(7,22)=(-params(16));
  g1(7,23)=(-params(17));
  g1(7,24)=(-params(18));
  g1(7,25)=(-params(2));
  g1(7,26)=(-params(3));
  g1(7,27)=(-params(4));
  g1(7,28)=(-params(7));
  g1(7,29)=(-params(8));
  g1(7,30)=(-params(9));
  g1(8,64)=1;
  g1(8,110)=(-params(34));
  g1(9,31)=1;
  g1(9,33)=(-params(50));
  g1(9,38)=(-params(48));
  g1(9,39)=(-params(51));
  g1(10,34)=1;
  g1(10,38)=1;
  g1(10,90)=(-1);
  g1(11,40)=1;
  g1(12,32)=(-params(40));
  g1(12,34)=(-1);
  g1(12,89)=1;
  g1(12,37)=params(40);
  g1(12,41)=(-params(40));
  g1(13,31)=(-(1-params(41)));
  g1(13,1)=1-params(41);
  g1(13,36)=1;
  g1(13,5)=1;
  g1(13,41)=(-params(41));
  g1(13,42)=1-params(41);
  g1(14,1)=params(43);
  g1(14,33)=(-params(43));
  g1(14,41)=1;
  g1(15,31)=1;
  g1(15,1)=(-params(39));
  g1(15,43)=(-((1-params(39))*params(36)));
  g1(15,45)=(-1);
  g1(16,31)=1;
  g1(16,38)=(-1);
  g1(16,42)=(-1);
  g1(16,43)=(-1)-T230;
  g1(17,91)=params(44);
  g1(17,46)=1;
  g1(17,107)=(-params(45));
  g1(18,44)=1;
  g1(18,8)=(-1);
  g1(19,92)=(-1);
  g1(19,48)=1;
  g1(20,1)=(-(1-params(46)));
  g1(20,32)=1;
  g1(20,33)=(-params(46));
  g1(21,31)=(-T281);
  g1(21,1)=(-(params(53)*params(37)*(params(55)-params(54))));
  g1(21,2)=(-(params(37)*params(54)+(-(params(53)*params(37)*params(54)))));
  g1(21,36)=(-(params(37)*params(55)*params(53)));
  g1(21,3)=(-(params(37)*params(54)));
  g1(21,37)=1;
  g1(21,5)=(-(params(53)*params(37)*(params(55)-params(54))));
  g1(21,42)=T281;
  g1(22,4)=(-params(62));
  g1(22,39)=1;
  g1(22,49)=(-1);
  g1(23,7)=(-params(63));
  g1(23,45)=1;
  g1(23,108)=(-1);
  g1(24,34)=1;
  g1(24,35)=(-1);
  g1(24,92)=1;
  g1(25,34)=1;
  g1(25,89)=(-1);
  g1(25,47)=1;
  g1(26,39)=(-params(51));
  g1(26,50)=1;
  g1(26,52)=(-params(50));
  g1(26,56)=(-params(48));
  g1(27,53)=1;
  g1(27,56)=1;
  g1(27,94)=(-1);
  g1(28,51)=(-params(40));
  g1(28,53)=(-1);
  g1(28,93)=1;
  g1(28,55)=params(40);
  g1(28,57)=(-params(40));
  g1(29,50)=(-(1-params(41)));
  g1(29,9)=1-params(41);
  g1(29,54)=1;
  g1(29,12)=1;
  g1(29,57)=(-params(41));
  g1(30,9)=params(43);
  g1(30,52)=(-params(43));
  g1(30,57)=1;
  g1(31,45)=(-1);
  g1(31,50)=1;
  g1(31,9)=(-params(39));
  g1(31,58)=(-((1-params(39))*params(36)));
  g1(32,50)=1;
  g1(32,56)=(-1);
  g1(32,58)=(-1)-T230;
  g1(33,9)=(-(1-params(46)));
  g1(33,51)=1;
  g1(33,52)=(-params(46));
  g1(34,50)=(-T281);
  g1(34,9)=(-(params(53)*params(37)*(params(55)-params(54))));
  g1(34,10)=(-(params(37)*params(54)+(-(params(53)*params(37)*params(54)))));
  g1(34,54)=(-(params(37)*params(55)*params(53)));
  g1(34,11)=(-(params(37)*params(54)));
  g1(34,55)=1;
  g1(34,12)=(-(params(53)*params(37)*(params(55)-params(54))));
  g1(35,95)=(-1);
  g1(35,65)=1;
  g1(36,98)=(-1);
  g1(36,66)=1;
  g1(37,99)=(-1);
  g1(37,67)=1;
  g1(38,96)=(-1);
  g1(38,68)=1;
  g1(39,101)=(-1);
  g1(39,69)=1;
  g1(40,102)=(-1);
  g1(40,70)=1;
  g1(41,97)=(-1);
  g1(41,71)=1;
  g1(42,104)=(-1);
  g1(42,72)=1;
  g1(43,105)=(-1);
  g1(43,73)=1;
  g1(44,92)=(-1);
  g1(44,74)=1;
  g1(45,6)=(-1);
  g1(45,75)=1;
  g1(46,17)=(-1);
  g1(46,76)=1;
  g1(47,16)=(-1);
  g1(47,77)=1;
  g1(48,19)=(-1);
  g1(48,78)=1;
  g1(49,20)=(-1);
  g1(49,79)=1;
  g1(50,15)=(-1);
  g1(50,80)=1;
  g1(51,22)=(-1);
  g1(51,81)=1;
  g1(52,23)=(-1);
  g1(52,82)=1;
  g1(53,13)=(-1);
  g1(53,83)=1;
  g1(54,25)=(-1);
  g1(54,84)=1;
  g1(55,26)=(-1);
  g1(55,85)=1;
  g1(56,14)=(-1);
  g1(56,86)=1;
  g1(57,28)=(-1);
  g1(57,87)=1;
  g1(58,29)=(-1);
  g1(58,88)=1;

if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],58,12100);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],58,1331000);
end
end
end
end
