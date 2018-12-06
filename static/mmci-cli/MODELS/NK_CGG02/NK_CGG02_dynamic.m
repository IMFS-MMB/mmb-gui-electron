function [residual, g1, g2, g3] = NK_CGG02_dynamic(y, x, params, steady_state, it_)
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

residual = zeros(59, 1);
T232 = 1/params(35);
T260 = 1/params(43);
lhs =y(52);
rhs =y(40);
residual(1)= lhs-rhs;
lhs =y(53);
rhs =0.25*(y(39)+y(1)+y(13)+y(14));
residual(2)= lhs-rhs;
lhs =y(54);
rhs =y(39);
residual(3)= lhs-rhs;
lhs =y(55);
rhs =y(36);
residual(4)= lhs-rhs;
lhs =y(56);
rhs =y(38);
residual(5)= lhs-rhs;
lhs =y(52);
rhs =params(32)*x(it_, 7)+params(31)*y(114)+params(30)*y(113)+params(29)*y(112)+params(28)*y(105)+params(27)*y(17)+params(26)*y(16)+params(25)*y(15)+params(24)*y(12)+y(56)*params(23)+params(22)*y(111)+params(21)*y(110)+params(20)*y(109)+params(19)*y(104)+params(18)*y(20)+params(17)*y(19)+params(16)*y(18)+params(15)*y(11)+y(55)*params(14)+params(13)*y(108)+params(12)*y(107)+params(11)*y(106)+params(10)*y(103)+params(6)*y(10)+y(54)*params(5)+params(1)*y(9)+params(2)*y(21)+params(3)*y(22)+params(4)*y(23)+params(7)*y(24)+params(8)*y(25)+params(9)*y(26);
residual(6)= lhs-rhs;
lhs =y(48);
rhs =params(32)*x(it_, 5)+params(22)*y(120)+params(21)*y(119)+params(20)*y(118)+params(19)*y(99)+params(18)*y(29)+params(17)*y(28)+params(16)*y(27)+params(15)*y(4)+params(14)*y(44)+params(13)*y(117)+params(12)*y(116)+params(11)*y(115)+params(10)*y(102)+params(6)*y(5)+params(5)*y(47)+params(1)*y(6)+params(2)*y(30)+params(3)*y(31)+params(4)*y(32)+params(7)*y(33)+params(8)*y(34)+params(9)*y(35);
residual(7)= lhs-rhs;
lhs =y(36);
rhs =y(95)-T232*(y(40)-y(98)-y(41));
residual(8)= lhs-rhs;
lhs =y(39);
rhs =y(98)*params(36)+y(36)*params(37)+y(42);
residual(9)= lhs-rhs;
lhs =y(41);
rhs =params(35)*(y(96)-y(37))+params(41)*(y(101)-y(46));
residual(10)= lhs-rhs;
lhs =y(37);
rhs =T260*((1+params(44))*y(43)-params(41)*y(46));
residual(11)= lhs-rhs;
lhs =y(36);
rhs =y(38)-y(37);
residual(12)= lhs-rhs;
lhs =y(43);
rhs =params(38)*y(3)+x(it_, 2);
residual(13)= lhs-rhs;
lhs =y(42);
rhs =params(39)*y(2)+x(it_, 1);
residual(14)= lhs-rhs;
lhs =y(44);
rhs =y(99)-T232*(y(48)-y(102)-y(49))+x(it_, 4);
residual(15)= lhs-rhs;
lhs =y(47);
rhs =y(102)*params(36)+y(44)*params(37)+y(50);
residual(16)= lhs-rhs;
lhs =y(49);
rhs =params(35)*(y(100)-y(45))+params(41)*(y(97)-y(38));
residual(17)= lhs-rhs;
lhs =y(45);
rhs =T260*((1+params(44))*y(51)-y(38)*params(41));
residual(18)= lhs-rhs;
lhs =y(44);
rhs =y(46)-y(45);
residual(19)= lhs-rhs;
lhs =y(51);
rhs =params(38)*y(8)+x(it_, 6);
residual(20)= lhs-rhs;
lhs =y(50);
rhs =params(39)*y(7)+x(it_, 3);
residual(21)= lhs-rhs;
lhs =y(57);
rhs =y(103);
residual(22)= lhs-rhs;
lhs =y(58);
rhs =y(106);
residual(23)= lhs-rhs;
lhs =y(59);
rhs =y(107);
residual(24)= lhs-rhs;
lhs =y(60);
rhs =y(104);
residual(25)= lhs-rhs;
lhs =y(61);
rhs =y(109);
residual(26)= lhs-rhs;
lhs =y(62);
rhs =y(110);
residual(27)= lhs-rhs;
lhs =y(63);
rhs =y(105);
residual(28)= lhs-rhs;
lhs =y(64);
rhs =y(112);
residual(29)= lhs-rhs;
lhs =y(65);
rhs =y(113);
residual(30)= lhs-rhs;
lhs =y(66);
rhs =y(102);
residual(31)= lhs-rhs;
lhs =y(67);
rhs =y(115);
residual(32)= lhs-rhs;
lhs =y(68);
rhs =y(116);
residual(33)= lhs-rhs;
lhs =y(69);
rhs =y(99);
residual(34)= lhs-rhs;
lhs =y(70);
rhs =y(118);
residual(35)= lhs-rhs;
lhs =y(71);
rhs =y(119);
residual(36)= lhs-rhs;
lhs =y(72);
rhs =y(1);
residual(37)= lhs-rhs;
lhs =y(73);
rhs =y(13);
residual(38)= lhs-rhs;
lhs =y(74);
rhs =y(12);
residual(39)= lhs-rhs;
lhs =y(75);
rhs =y(15);
residual(40)= lhs-rhs;
lhs =y(76);
rhs =y(16);
residual(41)= lhs-rhs;
lhs =y(77);
rhs =y(11);
residual(42)= lhs-rhs;
lhs =y(78);
rhs =y(18);
residual(43)= lhs-rhs;
lhs =y(79);
rhs =y(19);
residual(44)= lhs-rhs;
lhs =y(80);
rhs =y(9);
residual(45)= lhs-rhs;
lhs =y(81);
rhs =y(21);
residual(46)= lhs-rhs;
lhs =y(82);
rhs =y(22);
residual(47)= lhs-rhs;
lhs =y(83);
rhs =y(10);
residual(48)= lhs-rhs;
lhs =y(84);
rhs =y(24);
residual(49)= lhs-rhs;
lhs =y(85);
rhs =y(25);
residual(50)= lhs-rhs;
lhs =y(86);
rhs =y(4);
residual(51)= lhs-rhs;
lhs =y(87);
rhs =y(27);
residual(52)= lhs-rhs;
lhs =y(88);
rhs =y(28);
residual(53)= lhs-rhs;
lhs =y(89);
rhs =y(6);
residual(54)= lhs-rhs;
lhs =y(90);
rhs =y(30);
residual(55)= lhs-rhs;
lhs =y(91);
rhs =y(31);
residual(56)= lhs-rhs;
lhs =y(92);
rhs =y(5);
residual(57)= lhs-rhs;
lhs =y(93);
rhs =y(33);
residual(58)= lhs-rhs;
lhs =y(94);
rhs =y(34);
residual(59)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(59, 127);

  %
  % Jacobian matrix
  %

T3 = (-1);
  g1(1,40)=T3;
  g1(1,52)=1;
  g1(2,1)=(-0.25);
  g1(2,39)=(-0.25);
  g1(2,53)=1;
  g1(2,13)=(-0.25);
  g1(2,14)=(-0.25);
  g1(3,39)=T3;
  g1(3,54)=1;
  g1(4,36)=T3;
  g1(4,55)=1;
  g1(5,38)=T3;
  g1(5,56)=1;
  g1(6,9)=(-params(1));
  g1(6,52)=1;
  g1(6,10)=(-params(6));
  g1(6,54)=(-params(5));
  g1(6,103)=(-params(10));
  g1(6,11)=(-params(15));
  g1(6,55)=(-params(14));
  g1(6,104)=(-params(19));
  g1(6,12)=(-params(24));
  g1(6,56)=(-params(23));
  g1(6,105)=(-params(28));
  g1(6,127)=(-params(32));
  g1(6,106)=(-params(11));
  g1(6,107)=(-params(12));
  g1(6,108)=(-params(13));
  g1(6,109)=(-params(20));
  g1(6,110)=(-params(21));
  g1(6,111)=(-params(22));
  g1(6,112)=(-params(29));
  g1(6,113)=(-params(30));
  g1(6,114)=(-params(31));
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
  g1(7,4)=(-params(15));
  g1(7,44)=(-params(14));
  g1(7,99)=(-params(19));
  g1(7,5)=(-params(6));
  g1(7,47)=(-params(5));
  g1(7,102)=(-params(10));
  g1(7,6)=(-params(1));
  g1(7,48)=1;
  g1(7,125)=(-params(32));
  g1(7,115)=(-params(11));
  g1(7,116)=(-params(12));
  g1(7,117)=(-params(13));
  g1(7,118)=(-params(20));
  g1(7,119)=(-params(21));
  g1(7,120)=(-params(22));
  g1(7,27)=(-params(16));
  g1(7,28)=(-params(17));
  g1(7,29)=(-params(18));
  g1(7,30)=(-params(2));
  g1(7,31)=(-params(3));
  g1(7,32)=(-params(4));
  g1(7,33)=(-params(7));
  g1(7,34)=(-params(8));
  g1(7,35)=(-params(9));
  g1(8,36)=1;
  g1(8,95)=T3;
  g1(8,98)=(-T232);
  g1(8,40)=T232;
  g1(8,41)=(-T232);
  g1(9,36)=(-params(37));
  g1(9,39)=1;
  g1(9,98)=(-params(36));
  g1(9,42)=T3;
  g1(10,37)=params(35);
  g1(10,96)=(-params(35));
  g1(10,41)=1;
  g1(10,46)=params(41);
  g1(10,101)=(-params(41));
  g1(11,37)=1;
  g1(11,43)=(-(T260*(1+params(44))));
  g1(11,46)=(-(T260*(-params(41))));
  g1(12,36)=1;
  g1(12,37)=1;
  g1(12,38)=T3;
  g1(13,3)=(-params(38));
  g1(13,43)=1;
  g1(13,122)=T3;
  g1(14,2)=(-params(39));
  g1(14,42)=1;
  g1(14,121)=T3;
  g1(15,44)=1;
  g1(15,99)=T3;
  g1(15,102)=(-T232);
  g1(15,48)=T232;
  g1(15,49)=(-T232);
  g1(15,124)=T3;
  g1(16,44)=(-params(37));
  g1(16,47)=1;
  g1(16,102)=(-params(36));
  g1(16,50)=T3;
  g1(17,38)=params(41);
  g1(17,97)=(-params(41));
  g1(17,45)=params(35);
  g1(17,100)=(-params(35));
  g1(17,49)=1;
  g1(18,38)=(-(T260*(-params(41))));
  g1(18,45)=1;
  g1(18,51)=(-(T260*(1+params(44))));
  g1(19,44)=1;
  g1(19,45)=1;
  g1(19,46)=T3;
  g1(20,8)=(-params(38));
  g1(20,51)=1;
  g1(20,126)=T3;
  g1(21,7)=(-params(39));
  g1(21,50)=1;
  g1(21,123)=T3;
  g1(22,103)=T3;
  g1(22,57)=1;
  g1(23,106)=T3;
  g1(23,58)=1;
  g1(24,107)=T3;
  g1(24,59)=1;
  g1(25,104)=T3;
  g1(25,60)=1;
  g1(26,109)=T3;
  g1(26,61)=1;
  g1(27,110)=T3;
  g1(27,62)=1;
  g1(28,105)=T3;
  g1(28,63)=1;
  g1(29,112)=T3;
  g1(29,64)=1;
  g1(30,113)=T3;
  g1(30,65)=1;
  g1(31,102)=T3;
  g1(31,66)=1;
  g1(32,115)=T3;
  g1(32,67)=1;
  g1(33,116)=T3;
  g1(33,68)=1;
  g1(34,99)=T3;
  g1(34,69)=1;
  g1(35,118)=T3;
  g1(35,70)=1;
  g1(36,119)=T3;
  g1(36,71)=1;
  g1(37,1)=T3;
  g1(37,72)=1;
  g1(38,13)=T3;
  g1(38,73)=1;
  g1(39,12)=T3;
  g1(39,74)=1;
  g1(40,15)=T3;
  g1(40,75)=1;
  g1(41,16)=T3;
  g1(41,76)=1;
  g1(42,11)=T3;
  g1(42,77)=1;
  g1(43,18)=T3;
  g1(43,78)=1;
  g1(44,19)=T3;
  g1(44,79)=1;
  g1(45,9)=T3;
  g1(45,80)=1;
  g1(46,21)=T3;
  g1(46,81)=1;
  g1(47,22)=T3;
  g1(47,82)=1;
  g1(48,10)=T3;
  g1(48,83)=1;
  g1(49,24)=T3;
  g1(49,84)=1;
  g1(50,25)=T3;
  g1(50,85)=1;
  g1(51,4)=T3;
  g1(51,86)=1;
  g1(52,27)=T3;
  g1(52,87)=1;
  g1(53,28)=T3;
  g1(53,88)=1;
  g1(54,6)=T3;
  g1(54,89)=1;
  g1(55,30)=T3;
  g1(55,90)=1;
  g1(56,31)=T3;
  g1(56,91)=1;
  g1(57,5)=T3;
  g1(57,92)=1;
  g1(58,33)=T3;
  g1(58,93)=1;
  g1(59,34)=T3;
  g1(59,94)=1;

if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],59,16129);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],59,2048383);
end
end
end
end
