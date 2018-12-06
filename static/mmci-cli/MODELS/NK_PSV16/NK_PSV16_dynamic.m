function [residual, g1, g2, g3] = NK_PSV16_dynamic(y, x, params, steady_state, it_)
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
T239 = params(36)^(-1);
T279 = params(49)*params(38)/(1-params(38));
lhs =y(58);
rhs =4*y(44);
residual(1)= lhs-rhs;
lhs =y(59);
rhs =0.25*(y(43)+y(7)+y(16)+y(17));
residual(2)= lhs-rhs;
lhs =y(60);
rhs =4*y(43);
residual(3)= lhs-rhs;
lhs =y(61);
rhs =y(30)-y(47);
residual(4)= lhs-rhs;
lhs =y(62);
rhs =y(30);
residual(5)= lhs-rhs;
lhs =y(63);
rhs =y(46);
residual(6)= lhs-rhs;
lhs =y(58);
rhs =params(32)*x(it_, 2)+params(31)*y(103)+params(30)*y(102)+params(29)*y(101)+params(28)*y(94)+params(27)*y(20)+params(26)*y(19)+params(25)*y(18)+params(24)*y(15)+y(62)*params(23)+params(22)*y(100)+params(21)*y(99)+params(20)*y(98)+params(19)*y(93)+params(18)*y(23)+params(17)*y(22)+params(16)*y(21)+params(15)*y(14)+y(61)*params(14)+params(13)*y(97)+params(12)*y(96)+params(11)*y(95)+params(10)*y(92)+params(6)*y(13)+y(60)*params(5)+params(1)*y(12)+params(2)*y(24)+params(3)*y(25)+params(4)*y(26)+params(7)*y(27)+params(8)*y(28)+params(9)*y(29);
residual(7)= lhs-rhs;
lhs =y(63);
rhs =params(34)*x(it_, 3);
residual(8)= lhs-rhs;
lhs =y(30);
rhs =params(42)*y(31)+params(43)*y(32)+params(41)*y(33)+params(44)*y(34);
residual(9)= lhs-rhs;
lhs =y(31);
rhs =(-y(37))+y(87);
residual(10)= lhs-rhs;
lhs =y(44);
rhs =y(37)+y(89);
residual(11)= lhs-rhs;
lhs =y(34);
rhs =y(35);
residual(12)= lhs-rhs;
lhs =y(88)-y(37);
rhs =(-params(54))*(y(35)-(y(38)+y(39)));
residual(13)= lhs-rhs;
lhs =y(36);
rhs =(1-params(40))*(y(30)-y(5)-y(40))+params(40)*y(45)-y(4);
residual(14)= lhs-rhs;
lhs =y(38);
rhs =params(49)*(y(32)-y(5));
residual(15)= lhs-rhs;
lhs =y(30);
rhs =y(41)+y(5)*params(37)+(1-params(37))*params(39)*y(42);
residual(16)= lhs-rhs;
lhs =y(30)-y(42)-y(40)-y(31);
rhs =y(42)*T239;
residual(17)= lhs-rhs;
lhs =y(43);
rhs =params(58)*(-y(40))+y(89)*params(35);
residual(18)= lhs-rhs;
lhs =y(39);
rhs =y(32)*params(38)+y(5)*(1-params(38));
residual(19)= lhs-rhs;
lhs =y(35);
rhs =y(3)+params(52)*params(51)*params(50)*(y(36)-y(3))+y(2);
residual(20)= lhs-rhs;
lhs =y(33);
rhs =y(46)+params(48)*y(1);
residual(21)= lhs-rhs;
lhs =y(41);
rhs =params(47)*y(6)+x(it_, 1);
residual(22)= lhs-rhs;
lhs =y(45);
rhs =y(38)+y(32)*T279-y(5)*T279;
residual(23)= lhs-rhs;
lhs =y(47);
rhs =params(41)*y(33)+params(42)*y(53)+params(43)*y(49)+params(44)*y(54);
residual(24)= lhs-rhs;
lhs =y(53);
rhs =(-y(50))+y(91);
residual(25)= lhs-rhs;
lhs =y(54);
rhs =y(52);
residual(26)= lhs-rhs;
lhs =y(90)-y(50);
rhs =(-params(54))*(y(52)-(y(55)+y(48)));
residual(27)= lhs-rhs;
lhs =y(51);
rhs =(1-params(40))*(y(47)-y(8))+params(40)*y(57)-y(11);
residual(28)= lhs-rhs;
lhs =y(55);
rhs =params(49)*(y(49)-y(8));
residual(29)= lhs-rhs;
lhs =y(57);
rhs =y(55)+T279*y(49)-T279*y(8);
residual(30)= lhs-rhs;
lhs =y(47);
rhs =y(41)+params(37)*y(8)+(1-params(37))*params(39)*y(56);
residual(31)= lhs-rhs;
lhs =y(47)-y(56)-y(53);
rhs =T239*y(56);
residual(32)= lhs-rhs;
lhs =y(48);
rhs =params(38)*y(49)+(1-params(38))*y(8);
residual(33)= lhs-rhs;
lhs =y(52);
rhs =y(9)+params(52)*params(51)*params(50)*(y(51)-y(9))+y(10);
residual(34)= lhs-rhs;
lhs =y(64);
rhs =y(92);
residual(35)= lhs-rhs;
lhs =y(65);
rhs =y(95);
residual(36)= lhs-rhs;
lhs =y(66);
rhs =y(96);
residual(37)= lhs-rhs;
lhs =y(67);
rhs =y(93);
residual(38)= lhs-rhs;
lhs =y(68);
rhs =y(98);
residual(39)= lhs-rhs;
lhs =y(69);
rhs =y(99);
residual(40)= lhs-rhs;
lhs =y(70);
rhs =y(94);
residual(41)= lhs-rhs;
lhs =y(71);
rhs =y(101);
residual(42)= lhs-rhs;
lhs =y(72);
rhs =y(102);
residual(43)= lhs-rhs;
lhs =y(73);
rhs =y(7);
residual(44)= lhs-rhs;
lhs =y(74);
rhs =y(16);
residual(45)= lhs-rhs;
lhs =y(75);
rhs =y(15);
residual(46)= lhs-rhs;
lhs =y(76);
rhs =y(18);
residual(47)= lhs-rhs;
lhs =y(77);
rhs =y(19);
residual(48)= lhs-rhs;
lhs =y(78);
rhs =y(14);
residual(49)= lhs-rhs;
lhs =y(79);
rhs =y(21);
residual(50)= lhs-rhs;
lhs =y(80);
rhs =y(22);
residual(51)= lhs-rhs;
lhs =y(81);
rhs =y(12);
residual(52)= lhs-rhs;
lhs =y(82);
rhs =y(24);
residual(53)= lhs-rhs;
lhs =y(83);
rhs =y(25);
residual(54)= lhs-rhs;
lhs =y(84);
rhs =y(13);
residual(55)= lhs-rhs;
lhs =y(85);
rhs =y(27);
residual(56)= lhs-rhs;
lhs =y(86);
rhs =y(28);
residual(57)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(57, 106);

  %
  % Jacobian matrix
  %

  g1(1,44)=(-4);
  g1(1,58)=1;
  g1(2,7)=(-0.25);
  g1(2,43)=(-0.25);
  g1(2,59)=1;
  g1(2,16)=(-0.25);
  g1(2,17)=(-0.25);
  g1(3,43)=(-4);
  g1(3,60)=1;
  g1(4,30)=(-1);
  g1(4,47)=1;
  g1(4,61)=1;
  g1(5,30)=(-1);
  g1(5,62)=1;
  g1(6,46)=(-1);
  g1(6,63)=1;
  g1(7,12)=(-params(1));
  g1(7,58)=1;
  g1(7,13)=(-params(6));
  g1(7,60)=(-params(5));
  g1(7,92)=(-params(10));
  g1(7,14)=(-params(15));
  g1(7,61)=(-params(14));
  g1(7,93)=(-params(19));
  g1(7,15)=(-params(24));
  g1(7,62)=(-params(23));
  g1(7,94)=(-params(28));
  g1(7,105)=(-params(32));
  g1(7,95)=(-params(11));
  g1(7,96)=(-params(12));
  g1(7,97)=(-params(13));
  g1(7,98)=(-params(20));
  g1(7,99)=(-params(21));
  g1(7,100)=(-params(22));
  g1(7,101)=(-params(29));
  g1(7,102)=(-params(30));
  g1(7,103)=(-params(31));
  g1(7,18)=(-params(25));
  g1(7,19)=(-params(26));
  g1(7,20)=(-params(27));
  g1(7,21)=(-params(16));
  g1(7,22)=(-params(17));
  g1(7,23)=(-params(18));
  g1(7,24)=(-params(2));
  g1(7,25)=(-params(3));
  g1(7,26)=(-params(4));
  g1(7,27)=(-params(7));
  g1(7,28)=(-params(8));
  g1(7,29)=(-params(9));
  g1(8,63)=1;
  g1(8,106)=(-params(34));
  g1(9,30)=1;
  g1(9,31)=(-params(42));
  g1(9,32)=(-params(43));
  g1(9,33)=(-params(41));
  g1(9,34)=(-params(44));
  g1(10,31)=1;
  g1(10,87)=(-1);
  g1(10,37)=1;
  g1(11,37)=(-1);
  g1(11,89)=(-1);
  g1(11,44)=1;
  g1(12,34)=1;
  g1(12,35)=(-1);
  g1(13,35)=params(54);
  g1(13,88)=1;
  g1(13,37)=(-1);
  g1(13,38)=(-params(54));
  g1(13,39)=(-params(54));
  g1(14,30)=(-(1-params(40)));
  g1(14,36)=1;
  g1(14,4)=1;
  g1(14,5)=1-params(40);
  g1(14,40)=1-params(40);
  g1(14,45)=(-params(40));
  g1(15,32)=(-params(49));
  g1(15,38)=1;
  g1(15,5)=params(49);
  g1(16,30)=1;
  g1(16,5)=(-params(37));
  g1(16,41)=(-1);
  g1(16,42)=(-((1-params(37))*params(39)));
  g1(17,30)=1;
  g1(17,31)=(-1);
  g1(17,40)=(-1);
  g1(17,42)=(-1)-T239;
  g1(18,40)=params(58);
  g1(18,43)=1;
  g1(18,89)=(-params(35));
  g1(19,32)=(-params(38));
  g1(19,5)=(-(1-params(38)));
  g1(19,39)=1;
  g1(20,2)=(-1);
  g1(20,35)=1;
  g1(20,36)=(-(params(52)*params(51)*params(50)));
  g1(20,3)=(-(1-params(52)*params(51)*params(50)));
  g1(21,1)=(-params(48));
  g1(21,33)=1;
  g1(21,46)=(-1);
  g1(22,6)=(-params(47));
  g1(22,41)=1;
  g1(22,104)=(-1);
  g1(23,32)=(-T279);
  g1(23,38)=(-1);
  g1(23,5)=T279;
  g1(23,45)=1;
  g1(24,33)=(-params(41));
  g1(24,47)=1;
  g1(24,49)=(-params(43));
  g1(24,53)=(-params(42));
  g1(24,54)=(-params(44));
  g1(25,50)=1;
  g1(25,53)=1;
  g1(25,91)=(-1);
  g1(26,52)=(-1);
  g1(26,54)=1;
  g1(27,48)=(-params(54));
  g1(27,50)=(-1);
  g1(27,90)=1;
  g1(27,52)=params(54);
  g1(27,55)=(-params(54));
  g1(28,47)=(-(1-params(40)));
  g1(28,8)=1-params(40);
  g1(28,51)=1;
  g1(28,11)=1;
  g1(28,57)=(-params(40));
  g1(29,8)=params(49);
  g1(29,49)=(-params(49));
  g1(29,55)=1;
  g1(30,8)=T279;
  g1(30,49)=(-T279);
  g1(30,55)=(-1);
  g1(30,57)=1;
  g1(31,41)=(-1);
  g1(31,47)=1;
  g1(31,8)=(-params(37));
  g1(31,56)=(-((1-params(37))*params(39)));
  g1(32,47)=1;
  g1(32,53)=(-1);
  g1(32,56)=(-1)-T239;
  g1(33,8)=(-(1-params(38)));
  g1(33,48)=1;
  g1(33,49)=(-params(38));
  g1(34,9)=(-(1-params(52)*params(51)*params(50)));
  g1(34,51)=(-(params(52)*params(51)*params(50)));
  g1(34,10)=(-1);
  g1(34,52)=1;
  g1(35,92)=(-1);
  g1(35,64)=1;
  g1(36,95)=(-1);
  g1(36,65)=1;
  g1(37,96)=(-1);
  g1(37,66)=1;
  g1(38,93)=(-1);
  g1(38,67)=1;
  g1(39,98)=(-1);
  g1(39,68)=1;
  g1(40,99)=(-1);
  g1(40,69)=1;
  g1(41,94)=(-1);
  g1(41,70)=1;
  g1(42,101)=(-1);
  g1(42,71)=1;
  g1(43,102)=(-1);
  g1(43,72)=1;
  g1(44,7)=(-1);
  g1(44,73)=1;
  g1(45,16)=(-1);
  g1(45,74)=1;
  g1(46,15)=(-1);
  g1(46,75)=1;
  g1(47,18)=(-1);
  g1(47,76)=1;
  g1(48,19)=(-1);
  g1(48,77)=1;
  g1(49,14)=(-1);
  g1(49,78)=1;
  g1(50,21)=(-1);
  g1(50,79)=1;
  g1(51,22)=(-1);
  g1(51,80)=1;
  g1(52,12)=(-1);
  g1(52,81)=1;
  g1(53,24)=(-1);
  g1(53,82)=1;
  g1(54,25)=(-1);
  g1(54,83)=1;
  g1(55,13)=(-1);
  g1(55,84)=1;
  g1(56,27)=(-1);
  g1(56,85)=1;
  g1(57,28)=(-1);
  g1(57,86)=1;

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
