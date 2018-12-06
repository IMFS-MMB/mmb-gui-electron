function [residual, g1, g2, g3] = US_OR03_dynamic(y, x, params, steady_state, it_)
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

residual = zeros(38, 1);
lhs =y(32);
rhs =y(31);
residual(1)= lhs-rhs;
lhs =y(33);
rhs =0.25*(y(30)+y(2)+y(8)+y(9));
residual(2)= lhs-rhs;
lhs =y(34);
rhs =y(30);
residual(3)= lhs-rhs;
lhs =y(35);
rhs =y(29);
residual(4)= lhs-rhs;
lhs =y(36);
rhs =y(29);
residual(5)= lhs-rhs;
lhs =y(32);
rhs =params(32)*x(it_, 3)+params(31)*y(78)+params(30)*y(77)+params(29)*y(76)+params(28)*y(69)+params(27)*y(12)+params(26)*y(11)+params(25)*y(10)+params(24)*y(7)+y(36)*params(23)+params(22)*y(75)+params(21)*y(74)+params(20)*y(73)+params(19)*y(68)+params(18)*y(15)+params(17)*y(14)+params(16)*y(13)+params(15)*y(6)+y(35)*params(14)+params(13)*y(72)+params(12)*y(71)+params(11)*y(70)+params(10)*y(67)+params(6)*y(5)+y(34)*params(5)+params(1)*y(4)+params(2)*y(16)+params(3)*y(17)+params(4)*y(18)+params(7)*y(19)+params(8)*y(20)+params(9)*y(21);
residual(6)= lhs-rhs;
lhs =y(29);
rhs =x(it_, 2)+params(44)*y(3)+params(40)*y(1)+params(35)+y(2)*params(36)+params(37)*y(8)+params(38)*y(9)+params(39)*y(22)+params(41)*y(23)+params(42)*y(24)+params(43)*y(25)+params(45)*y(26)+params(46)*y(27)+params(47)*y(28);
residual(7)= lhs-rhs;
lhs =y(30);
rhs =x(it_, 1)+y(1)*params(53)+y(29)*params(52)+y(2)*params(48)+params(49)*y(8)+params(50)*y(9)+params(51)*y(22)+params(54)*y(23)+params(55)*y(24)+params(56)*y(25);
residual(8)= lhs-rhs;
lhs =y(37);
rhs =y(67);
residual(9)= lhs-rhs;
lhs =y(38);
rhs =y(70);
residual(10)= lhs-rhs;
lhs =y(39);
rhs =y(71);
residual(11)= lhs-rhs;
lhs =y(40);
rhs =y(68);
residual(12)= lhs-rhs;
lhs =y(41);
rhs =y(73);
residual(13)= lhs-rhs;
lhs =y(42);
rhs =y(74);
residual(14)= lhs-rhs;
lhs =y(43);
rhs =y(69);
residual(15)= lhs-rhs;
lhs =y(44);
rhs =y(76);
residual(16)= lhs-rhs;
lhs =y(45);
rhs =y(77);
residual(17)= lhs-rhs;
lhs =y(46);
rhs =y(2);
residual(18)= lhs-rhs;
lhs =y(47);
rhs =y(8);
residual(19)= lhs-rhs;
lhs =y(48);
rhs =y(7);
residual(20)= lhs-rhs;
lhs =y(49);
rhs =y(10);
residual(21)= lhs-rhs;
lhs =y(50);
rhs =y(11);
residual(22)= lhs-rhs;
lhs =y(51);
rhs =y(6);
residual(23)= lhs-rhs;
lhs =y(52);
rhs =y(13);
residual(24)= lhs-rhs;
lhs =y(53);
rhs =y(14);
residual(25)= lhs-rhs;
lhs =y(54);
rhs =y(4);
residual(26)= lhs-rhs;
lhs =y(55);
rhs =y(16);
residual(27)= lhs-rhs;
lhs =y(56);
rhs =y(17);
residual(28)= lhs-rhs;
lhs =y(57);
rhs =y(5);
residual(29)= lhs-rhs;
lhs =y(58);
rhs =y(19);
residual(30)= lhs-rhs;
lhs =y(59);
rhs =y(20);
residual(31)= lhs-rhs;
lhs =y(60);
rhs =y(9);
residual(32)= lhs-rhs;
lhs =y(61);
rhs =y(1);
residual(33)= lhs-rhs;
lhs =y(62);
rhs =y(23);
residual(34)= lhs-rhs;
lhs =y(63);
rhs =y(24);
residual(35)= lhs-rhs;
lhs =y(64);
rhs =y(3);
residual(36)= lhs-rhs;
lhs =y(65);
rhs =y(26);
residual(37)= lhs-rhs;
lhs =y(66);
rhs =y(27);
residual(38)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(38, 81);

  %
  % Jacobian matrix
  %

  g1(1,31)=(-1);
  g1(1,32)=1;
  g1(2,2)=(-0.25);
  g1(2,30)=(-0.25);
  g1(2,33)=1;
  g1(2,8)=(-0.25);
  g1(2,9)=(-0.25);
  g1(3,30)=(-1);
  g1(3,34)=1;
  g1(4,29)=(-1);
  g1(4,35)=1;
  g1(5,29)=(-1);
  g1(5,36)=1;
  g1(6,4)=(-params(1));
  g1(6,32)=1;
  g1(6,5)=(-params(6));
  g1(6,34)=(-params(5));
  g1(6,67)=(-params(10));
  g1(6,6)=(-params(15));
  g1(6,35)=(-params(14));
  g1(6,68)=(-params(19));
  g1(6,7)=(-params(24));
  g1(6,36)=(-params(23));
  g1(6,69)=(-params(28));
  g1(6,81)=(-params(32));
  g1(6,70)=(-params(11));
  g1(6,71)=(-params(12));
  g1(6,72)=(-params(13));
  g1(6,73)=(-params(20));
  g1(6,74)=(-params(21));
  g1(6,75)=(-params(22));
  g1(6,76)=(-params(29));
  g1(6,77)=(-params(30));
  g1(6,78)=(-params(31));
  g1(6,10)=(-params(25));
  g1(6,11)=(-params(26));
  g1(6,12)=(-params(27));
  g1(6,13)=(-params(16));
  g1(6,14)=(-params(17));
  g1(6,15)=(-params(18));
  g1(6,16)=(-params(2));
  g1(6,17)=(-params(3));
  g1(6,18)=(-params(4));
  g1(6,19)=(-params(7));
  g1(6,20)=(-params(8));
  g1(6,21)=(-params(9));
  g1(7,1)=(-params(40));
  g1(7,29)=1;
  g1(7,2)=(-params(36));
  g1(7,3)=(-params(44));
  g1(7,80)=(-1);
  g1(7,8)=(-params(37));
  g1(7,9)=(-params(38));
  g1(7,22)=(-params(39));
  g1(7,23)=(-params(41));
  g1(7,24)=(-params(42));
  g1(7,25)=(-params(43));
  g1(7,26)=(-params(45));
  g1(7,27)=(-params(46));
  g1(7,28)=(-params(47));
  g1(8,1)=(-params(53));
  g1(8,29)=(-params(52));
  g1(8,2)=(-params(48));
  g1(8,30)=1;
  g1(8,79)=(-1);
  g1(8,8)=(-params(49));
  g1(8,9)=(-params(50));
  g1(8,22)=(-params(51));
  g1(8,23)=(-params(54));
  g1(8,24)=(-params(55));
  g1(8,25)=(-params(56));
  g1(9,67)=(-1);
  g1(9,37)=1;
  g1(10,70)=(-1);
  g1(10,38)=1;
  g1(11,71)=(-1);
  g1(11,39)=1;
  g1(12,68)=(-1);
  g1(12,40)=1;
  g1(13,73)=(-1);
  g1(13,41)=1;
  g1(14,74)=(-1);
  g1(14,42)=1;
  g1(15,69)=(-1);
  g1(15,43)=1;
  g1(16,76)=(-1);
  g1(16,44)=1;
  g1(17,77)=(-1);
  g1(17,45)=1;
  g1(18,2)=(-1);
  g1(18,46)=1;
  g1(19,8)=(-1);
  g1(19,47)=1;
  g1(20,7)=(-1);
  g1(20,48)=1;
  g1(21,10)=(-1);
  g1(21,49)=1;
  g1(22,11)=(-1);
  g1(22,50)=1;
  g1(23,6)=(-1);
  g1(23,51)=1;
  g1(24,13)=(-1);
  g1(24,52)=1;
  g1(25,14)=(-1);
  g1(25,53)=1;
  g1(26,4)=(-1);
  g1(26,54)=1;
  g1(27,16)=(-1);
  g1(27,55)=1;
  g1(28,17)=(-1);
  g1(28,56)=1;
  g1(29,5)=(-1);
  g1(29,57)=1;
  g1(30,19)=(-1);
  g1(30,58)=1;
  g1(31,20)=(-1);
  g1(31,59)=1;
  g1(32,9)=(-1);
  g1(32,60)=1;
  g1(33,1)=(-1);
  g1(33,61)=1;
  g1(34,23)=(-1);
  g1(34,62)=1;
  g1(35,24)=(-1);
  g1(35,63)=1;
  g1(36,3)=(-1);
  g1(36,64)=1;
  g1(37,26)=(-1);
  g1(37,65)=1;
  g1(38,27)=(-1);
  g1(38,66)=1;
end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],38,6561);
end
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],38,531441);
end
end
