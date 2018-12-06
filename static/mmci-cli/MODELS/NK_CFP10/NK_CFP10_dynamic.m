function [residual, g1, g2, g3] = NK_CFP10_dynamic(y, x, params, steady_state, it_)
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

residual = zeros(57, 1);
T186 = (1+params(37))/(1+params(41));
T195 = (1-params(39)*params(40))/(1+params(41));
T204 = (1+params(37))*(params(36)-1)/((1+params(41))*(params(36)+params(37)));
T224 = 1/params(35);
lhs =y(54);
rhs =y(28)*4;
residual(1)= lhs-rhs;
lhs =y(55);
rhs =y(29)+y(1)+y(11)+y(12);
residual(2)= lhs-rhs;
lhs =y(56);
rhs =4*y(29);
residual(3)= lhs-rhs;
lhs =y(57);
rhs =y(25)-y(39);
residual(4)= lhs-rhs;
lhs =y(58);
rhs =y(25);
residual(5)= lhs-rhs;
lhs =y(54);
rhs =params(32)/100*x(it_, 4)+params(31)*y(102)+params(30)*y(101)+params(29)*y(100)+params(28)*y(93)+params(27)*y(15)+params(26)*y(14)+params(25)*y(13)+params(24)*y(10)+y(58)*params(23)+params(22)*y(99)+params(21)*y(98)+params(20)*y(97)+params(19)*y(92)+params(18)*y(18)+params(17)*y(17)+params(16)*y(16)+params(15)*y(9)+y(57)*params(14)+params(13)*y(96)+params(12)*y(95)+params(11)*y(94)+params(10)*y(91)+params(6)*y(8)+y(56)*params(5)+params(1)*y(7)+params(2)*y(19)+params(3)*y(20)+params(4)*y(21)+params(7)*y(22)+params(8)*y(23)+params(9)*y(24);
residual(6)= lhs-rhs;
lhs =y(25)*params(36)+params(37)*y(35);
rhs =y(38);
residual(7)= lhs-rhs;
lhs =y(25)*params(36)+params(37)*y(36);
rhs =y(37);
residual(8)= lhs-rhs;
lhs =params(36)*(y(82)-y(25));
rhs =y(28)-y(84);
residual(9)= lhs-rhs;
lhs =y(31);
rhs =T186*(y(83)-y(27))-T195*(y(85)-y(31))-T204*(y(89)-y(51))-1/(1+params(41))*y(90);
residual(10)= lhs-rhs;
lhs =y(32)+y(33);
rhs =y(25)+y(30)+y(31)*params(41);
residual(11)= lhs-rhs;
lhs =y(32);
rhs =T224*(y(2)-y(27)*(params(36)+params(37))*params(38)*(1-params(35))+y(31)*(1+params(41)*params(35)-params(40)*(1-params(35))*params(39)*params(38))+y(53));
residual(12)= lhs-rhs;
lhs =y(30);
rhs =y(27)*(params(36)+params(37))+y(31)*params(39)*params(40);
residual(13)= lhs-rhs;
lhs =y(25);
rhs =y(51)+y(36)*(1-params(39))+y(35)*params(39);
residual(14)= lhs-rhs;
lhs =y(29);
rhs =y(30)*params(43)+y(84)*params(35)+params(43)*y(52);
residual(15)= lhs-rhs;
lhs =y(34);
rhs =y(25)-y(30)*(params(38)-1);
residual(16)= lhs-rhs;
lhs =y(31)*params(40);
rhs =y(25)+y(30)-y(38)-y(35);
residual(17)= lhs-rhs;
lhs =y(26);
rhs =y(51)*(1+params(37))/(params(36)+params(37));
residual(18)= lhs-rhs;
lhs =y(27);
rhs =y(25)-y(26);
residual(19)= lhs-rhs;
lhs =y(39)*params(36)+params(37)*y(47);
rhs =y(50);
residual(20)= lhs-rhs;
lhs =y(39)*params(36)+params(37)*y(48);
rhs =y(49);
residual(21)= lhs-rhs;
lhs =params(36)*(y(86)-y(39));
rhs =y(41);
residual(22)= lhs-rhs;
lhs =y(43);
rhs =T186*(y(87)-y(40))-T195*(y(88)-y(43))-T204*(y(89)-y(51))-1/(1+params(41))*y(90);
residual(23)= lhs-rhs;
lhs =y(44)+y(45);
rhs =y(39)+y(42)+params(41)*y(43);
residual(24)= lhs-rhs;
lhs =y(44);
rhs =T224*(y(53)+y(3)-(params(36)+params(37))*params(38)*(1-params(35))*y(40)+(1+params(41)*params(35)-params(40)*(1-params(35))*params(39)*params(38))*y(43));
residual(25)= lhs-rhs;
lhs =y(42);
rhs =(params(36)+params(37))*y(40)+params(39)*params(40)*y(43);
residual(26)= lhs-rhs;
lhs =y(39);
rhs =y(51)+(1-params(39))*y(48)+params(39)*y(47);
residual(27)= lhs-rhs;
residual(28) = y(42);
lhs =y(46);
rhs =y(39)-(params(38)-1)*y(42);
residual(29)= lhs-rhs;
lhs =params(40)*y(43);
rhs =y(39)+y(42)-y(50)-y(47);
residual(30)= lhs-rhs;
lhs =y(40);
rhs =y(39)-y(26);
residual(31)= lhs-rhs;
lhs =y(51);
rhs =params(44)*y(4)+x(it_, 1);
residual(32)= lhs-rhs;
lhs =y(52);
rhs =params(46)*y(5)+x(it_, 2);
residual(33)= lhs-rhs;
lhs =y(53);
rhs =params(47)*y(6)+x(it_, 3);
residual(34)= lhs-rhs;
lhs =y(59);
rhs =y(91);
residual(35)= lhs-rhs;
lhs =y(60);
rhs =y(94);
residual(36)= lhs-rhs;
lhs =y(61);
rhs =y(95);
residual(37)= lhs-rhs;
lhs =y(62);
rhs =y(92);
residual(38)= lhs-rhs;
lhs =y(63);
rhs =y(97);
residual(39)= lhs-rhs;
lhs =y(64);
rhs =y(98);
residual(40)= lhs-rhs;
lhs =y(65);
rhs =y(93);
residual(41)= lhs-rhs;
lhs =y(66);
rhs =y(100);
residual(42)= lhs-rhs;
lhs =y(67);
rhs =y(101);
residual(43)= lhs-rhs;
lhs =y(68);
rhs =y(1);
residual(44)= lhs-rhs;
lhs =y(69);
rhs =y(11);
residual(45)= lhs-rhs;
lhs =y(70);
rhs =y(10);
residual(46)= lhs-rhs;
lhs =y(71);
rhs =y(13);
residual(47)= lhs-rhs;
lhs =y(72);
rhs =y(14);
residual(48)= lhs-rhs;
lhs =y(73);
rhs =y(9);
residual(49)= lhs-rhs;
lhs =y(74);
rhs =y(16);
residual(50)= lhs-rhs;
lhs =y(75);
rhs =y(17);
residual(51)= lhs-rhs;
lhs =y(76);
rhs =y(7);
residual(52)= lhs-rhs;
lhs =y(77);
rhs =y(19);
residual(53)= lhs-rhs;
lhs =y(78);
rhs =y(20);
residual(54)= lhs-rhs;
lhs =y(79);
rhs =y(8);
residual(55)= lhs-rhs;
lhs =y(80);
rhs =y(22);
residual(56)= lhs-rhs;
lhs =y(81);
rhs =y(23);
residual(57)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(57, 106);

  %
  % Jacobian matrix
  %

T3 = (-1);
  g1(1,28)=(-4);
  g1(1,54)=1;
  g1(2,1)=T3;
  g1(2,29)=T3;
  g1(2,55)=1;
  g1(2,11)=T3;
  g1(2,12)=T3;
  g1(3,29)=(-4);
  g1(3,56)=1;
  g1(4,25)=T3;
  g1(4,39)=1;
  g1(4,57)=1;
  g1(5,25)=T3;
  g1(5,58)=1;
  g1(6,7)=(-params(1));
  g1(6,54)=1;
  g1(6,8)=(-params(6));
  g1(6,56)=(-params(5));
  g1(6,91)=(-params(10));
  g1(6,9)=(-params(15));
  g1(6,57)=(-params(14));
  g1(6,92)=(-params(19));
  g1(6,10)=(-params(24));
  g1(6,58)=(-params(23));
  g1(6,93)=(-params(28));
  g1(6,106)=(-(params(32)/100));
  g1(6,94)=(-params(11));
  g1(6,95)=(-params(12));
  g1(6,96)=(-params(13));
  g1(6,97)=(-params(20));
  g1(6,98)=(-params(21));
  g1(6,99)=(-params(22));
  g1(6,100)=(-params(29));
  g1(6,101)=(-params(30));
  g1(6,102)=(-params(31));
  g1(6,13)=(-params(25));
  g1(6,14)=(-params(26));
  g1(6,15)=(-params(27));
  g1(6,16)=(-params(16));
  g1(6,17)=(-params(17));
  g1(6,18)=(-params(18));
  g1(6,19)=(-params(2));
  g1(6,20)=(-params(3));
  g1(6,21)=(-params(4));
  g1(6,22)=(-params(7));
  g1(6,23)=(-params(8));
  g1(6,24)=(-params(9));
  g1(7,25)=params(36);
  g1(7,35)=params(37);
  g1(7,38)=T3;
  g1(8,25)=params(36);
  g1(8,36)=params(37);
  g1(8,37)=T3;
  g1(9,25)=(-params(36));
  g1(9,82)=params(36);
  g1(9,28)=T3;
  g1(9,84)=1;
  g1(10,27)=T186;
  g1(10,83)=(-T186);
  g1(10,31)=1-T195;
  g1(10,85)=T195;
  g1(10,51)=(-T204);
  g1(10,89)=T204;
  g1(10,90)=1/(1+params(41));
  g1(11,25)=T3;
  g1(11,30)=T3;
  g1(11,31)=(-params(41));
  g1(11,32)=1;
  g1(11,33)=1;
  g1(12,27)=(-(T224*(-((params(36)+params(37))*params(38)*(1-params(35))))));
  g1(12,31)=(-(T224*(1+params(41)*params(35)-params(40)*(1-params(35))*params(39)*params(38))));
  g1(12,2)=(-T224);
  g1(12,32)=1;
  g1(12,53)=(-T224);
  g1(13,27)=(-(params(36)+params(37)));
  g1(13,30)=1;
  g1(13,31)=(-(params(39)*params(40)));
  g1(14,25)=1;
  g1(14,35)=(-params(39));
  g1(14,36)=(-(1-params(39)));
  g1(14,51)=T3;
  g1(15,29)=1;
  g1(15,84)=(-params(35));
  g1(15,30)=(-params(43));
  g1(15,52)=(-params(43));
  g1(16,25)=T3;
  g1(16,30)=params(38)-1;
  g1(16,34)=1;
  g1(17,25)=T3;
  g1(17,30)=T3;
  g1(17,31)=params(40);
  g1(17,35)=1;
  g1(17,38)=1;
  g1(18,26)=1;
  g1(18,51)=(-((1+params(37))/(params(36)+params(37))));
  g1(19,25)=T3;
  g1(19,26)=1;
  g1(19,27)=1;
  g1(20,39)=params(36);
  g1(20,47)=params(37);
  g1(20,50)=T3;
  g1(21,39)=params(36);
  g1(21,48)=params(37);
  g1(21,49)=T3;
  g1(22,39)=(-params(36));
  g1(22,86)=params(36);
  g1(22,41)=T3;
  g1(23,40)=T186;
  g1(23,87)=(-T186);
  g1(23,43)=1-T195;
  g1(23,88)=T195;
  g1(23,51)=(-T204);
  g1(23,89)=T204;
  g1(23,90)=1/(1+params(41));
  g1(24,39)=T3;
  g1(24,42)=T3;
  g1(24,43)=(-params(41));
  g1(24,44)=1;
  g1(24,45)=1;
  g1(25,40)=(-(T224*(-((params(36)+params(37))*params(38)*(1-params(35))))));
  g1(25,43)=(-(T224*(1+params(41)*params(35)-params(40)*(1-params(35))*params(39)*params(38))));
  g1(25,3)=(-T224);
  g1(25,44)=1;
  g1(25,53)=(-T224);
  g1(26,40)=(-(params(36)+params(37)));
  g1(26,42)=1;
  g1(26,43)=(-(params(39)*params(40)));
  g1(27,39)=1;
  g1(27,47)=(-params(39));
  g1(27,48)=(-(1-params(39)));
  g1(27,51)=T3;
  g1(28,42)=1;
  g1(29,39)=T3;
  g1(29,42)=params(38)-1;
  g1(29,46)=1;
  g1(30,39)=T3;
  g1(30,42)=T3;
  g1(30,43)=params(40);
  g1(30,47)=1;
  g1(30,50)=1;
  g1(31,26)=1;
  g1(31,39)=T3;
  g1(31,40)=1;
  g1(32,4)=(-params(44));
  g1(32,51)=1;
  g1(32,103)=T3;
  g1(33,5)=(-params(46));
  g1(33,52)=1;
  g1(33,104)=T3;
  g1(34,6)=(-params(47));
  g1(34,53)=1;
  g1(34,105)=T3;
  g1(35,91)=T3;
  g1(35,59)=1;
  g1(36,94)=T3;
  g1(36,60)=1;
  g1(37,95)=T3;
  g1(37,61)=1;
  g1(38,92)=T3;
  g1(38,62)=1;
  g1(39,97)=T3;
  g1(39,63)=1;
  g1(40,98)=T3;
  g1(40,64)=1;
  g1(41,93)=T3;
  g1(41,65)=1;
  g1(42,100)=T3;
  g1(42,66)=1;
  g1(43,101)=T3;
  g1(43,67)=1;
  g1(44,1)=T3;
  g1(44,68)=1;
  g1(45,11)=T3;
  g1(45,69)=1;
  g1(46,10)=T3;
  g1(46,70)=1;
  g1(47,13)=T3;
  g1(47,71)=1;
  g1(48,14)=T3;
  g1(48,72)=1;
  g1(49,9)=T3;
  g1(49,73)=1;
  g1(50,16)=T3;
  g1(50,74)=1;
  g1(51,17)=T3;
  g1(51,75)=1;
  g1(52,7)=T3;
  g1(52,76)=1;
  g1(53,19)=T3;
  g1(53,77)=1;
  g1(54,20)=T3;
  g1(54,78)=1;
  g1(55,8)=T3;
  g1(55,79)=1;
  g1(56,22)=T3;
  g1(56,80)=1;
  g1(57,23)=T3;
  g1(57,81)=1;

if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],57,11236);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],57,1191016);
end
end
end
end
