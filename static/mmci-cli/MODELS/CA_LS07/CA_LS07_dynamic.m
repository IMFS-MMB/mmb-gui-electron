function [residual, g1, g2, g3] = CA_LS07_dynamic(y, x, params, steady_state, it_)
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
T201 = params(38)/(params(34)+params(35)*(2-params(35))*(1-params(34)));
lhs =y(34);
rhs =y(25)*4;
residual(1)= lhs-rhs;
lhs =y(35);
rhs =y(26)+y(1)+y(10)+y(11);
residual(2)= lhs-rhs;
lhs =y(36);
rhs =4*y(26);
residual(3)= lhs-rhs;
lhs =y(38);
rhs =y(24)-y(30);
residual(4)= lhs-rhs;
lhs =y(37);
rhs =y(24);
residual(5)= lhs-rhs;
lhs =y(34);
rhs =params(32)*x(it_, 5)+params(31)*y(77)+params(30)*y(76)+params(29)*y(75)+params(28)*y(67)+params(27)*y(14)+params(26)*y(13)+params(25)*y(12)+params(24)*y(8)+y(37)*params(23)+params(22)*y(74)+params(21)*y(73)+params(20)*y(72)+params(19)*y(68)+params(18)*y(17)+params(17)*y(16)+params(16)*y(15)+params(15)*y(9)+y(38)*params(14)+params(13)*y(71)+params(12)*y(70)+params(11)*y(69)+params(10)*y(66)+params(6)*y(7)+y(36)*params(5)+params(1)*y(6)+params(2)*y(18)+params(3)*y(19)+params(4)*y(20)+params(7)*y(21)+params(8)*y(22)+params(9)*y(23);
residual(6)= lhs-rhs;
lhs =y(24);
rhs =y(62)-(params(34)+params(35)*(2-params(35))*(1-params(34)))*(y(25)-y(63))-params(36)*y(27)-params(35)*(params(34)+params(35)*(2-params(35))*(1-params(34)))*y(64)+params(35)*(2-params(35))*(1-params(34))/params(34)*y(65);
residual(7)= lhs-rhs;
lhs =y(29);
rhs =y(31)-y(4);
residual(8)= lhs-rhs;
lhs =y(26);
rhs =y(63)*params(37)+y(64)*params(35)*params(37)-params(35)*y(28)+(y(24)-y(30))*T201;
residual(9)= lhs-rhs;
lhs =y(30);
rhs =y(31)*(1-params(34))*(2-params(35))*(-params(35))/params(34);
residual(10)= lhs-rhs;
lhs =y(26);
rhs =y(32)+y(28)*(1-params(35))+y(33);
residual(11)= lhs-rhs;
lhs =y(28);
rhs =params(43)*y(3)+x(it_, 1);
residual(12)= lhs-rhs;
lhs =y(27);
rhs =params(36)*y(2)+x(it_, 3);
residual(13)= lhs-rhs;
lhs =y(31);
rhs =y(4)*params(44)+x(it_, 4);
residual(14)= lhs-rhs;
lhs =y(33);
rhs =params(45)*y(5)+x(it_, 2);
residual(15)= lhs-rhs;
lhs =y(39);
rhs =y(66);
residual(16)= lhs-rhs;
lhs =y(40);
rhs =y(69);
residual(17)= lhs-rhs;
lhs =y(41);
rhs =y(70);
residual(18)= lhs-rhs;
lhs =y(42);
rhs =y(68);
residual(19)= lhs-rhs;
lhs =y(43);
rhs =y(72);
residual(20)= lhs-rhs;
lhs =y(44);
rhs =y(73);
residual(21)= lhs-rhs;
lhs =y(45);
rhs =y(67);
residual(22)= lhs-rhs;
lhs =y(46);
rhs =y(75);
residual(23)= lhs-rhs;
lhs =y(47);
rhs =y(76);
residual(24)= lhs-rhs;
lhs =y(48);
rhs =y(1);
residual(25)= lhs-rhs;
lhs =y(49);
rhs =y(10);
residual(26)= lhs-rhs;
lhs =y(50);
rhs =y(8);
residual(27)= lhs-rhs;
lhs =y(51);
rhs =y(12);
residual(28)= lhs-rhs;
lhs =y(52);
rhs =y(13);
residual(29)= lhs-rhs;
lhs =y(53);
rhs =y(9);
residual(30)= lhs-rhs;
lhs =y(54);
rhs =y(15);
residual(31)= lhs-rhs;
lhs =y(55);
rhs =y(16);
residual(32)= lhs-rhs;
lhs =y(56);
rhs =y(6);
residual(33)= lhs-rhs;
lhs =y(57);
rhs =y(18);
residual(34)= lhs-rhs;
lhs =y(58);
rhs =y(19);
residual(35)= lhs-rhs;
lhs =y(59);
rhs =y(7);
residual(36)= lhs-rhs;
lhs =y(60);
rhs =y(21);
residual(37)= lhs-rhs;
lhs =y(61);
rhs =y(22);
residual(38)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(38, 82);

  %
  % Jacobian matrix
  %

  g1(1,25)=(-4);
  g1(1,34)=1;
  g1(2,1)=(-1);
  g1(2,26)=(-1);
  g1(2,35)=1;
  g1(2,10)=(-1);
  g1(2,11)=(-1);
  g1(3,26)=(-4);
  g1(3,36)=1;
  g1(4,24)=(-1);
  g1(4,30)=1;
  g1(4,38)=1;
  g1(5,24)=(-1);
  g1(5,37)=1;
  g1(6,6)=(-params(1));
  g1(6,34)=1;
  g1(6,7)=(-params(6));
  g1(6,36)=(-params(5));
  g1(6,66)=(-params(10));
  g1(6,8)=(-params(24));
  g1(6,37)=(-params(23));
  g1(6,67)=(-params(28));
  g1(6,9)=(-params(15));
  g1(6,38)=(-params(14));
  g1(6,68)=(-params(19));
  g1(6,82)=(-params(32));
  g1(6,69)=(-params(11));
  g1(6,70)=(-params(12));
  g1(6,71)=(-params(13));
  g1(6,72)=(-params(20));
  g1(6,73)=(-params(21));
  g1(6,74)=(-params(22));
  g1(6,75)=(-params(29));
  g1(6,76)=(-params(30));
  g1(6,77)=(-params(31));
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
  g1(7,24)=1;
  g1(7,62)=(-1);
  g1(7,25)=params(34)+params(35)*(2-params(35))*(1-params(34));
  g1(7,63)=(-(params(34)+params(35)*(2-params(35))*(1-params(34))));
  g1(7,27)=params(36);
  g1(7,64)=params(35)*(params(34)+params(35)*(2-params(35))*(1-params(34)));
  g1(7,65)=(-(params(35)*(2-params(35))*(1-params(34))/params(34)));
  g1(8,29)=1;
  g1(8,4)=1;
  g1(8,31)=(-1);
  g1(9,24)=(-T201);
  g1(9,26)=1;
  g1(9,63)=(-params(37));
  g1(9,28)=params(35);
  g1(9,64)=(-(params(35)*params(37)));
  g1(9,30)=T201;
  g1(10,30)=1;
  g1(10,31)=(-((1-params(34))*(2-params(35))*(-params(35))/params(34)));
  g1(11,26)=1;
  g1(11,28)=(-(1-params(35)));
  g1(11,32)=(-1);
  g1(11,33)=(-1);
  g1(12,3)=(-params(43));
  g1(12,28)=1;
  g1(12,78)=(-1);
  g1(13,2)=(-params(36));
  g1(13,27)=1;
  g1(13,80)=(-1);
  g1(14,4)=(-params(44));
  g1(14,31)=1;
  g1(14,81)=(-1);
  g1(15,5)=(-params(45));
  g1(15,33)=1;
  g1(15,79)=(-1);
  g1(16,66)=(-1);
  g1(16,39)=1;
  g1(17,69)=(-1);
  g1(17,40)=1;
  g1(18,70)=(-1);
  g1(18,41)=1;
  g1(19,68)=(-1);
  g1(19,42)=1;
  g1(20,72)=(-1);
  g1(20,43)=1;
  g1(21,73)=(-1);
  g1(21,44)=1;
  g1(22,67)=(-1);
  g1(22,45)=1;
  g1(23,75)=(-1);
  g1(23,46)=1;
  g1(24,76)=(-1);
  g1(24,47)=1;
  g1(25,1)=(-1);
  g1(25,48)=1;
  g1(26,10)=(-1);
  g1(26,49)=1;
  g1(27,8)=(-1);
  g1(27,50)=1;
  g1(28,12)=(-1);
  g1(28,51)=1;
  g1(29,13)=(-1);
  g1(29,52)=1;
  g1(30,9)=(-1);
  g1(30,53)=1;
  g1(31,15)=(-1);
  g1(31,54)=1;
  g1(32,16)=(-1);
  g1(32,55)=1;
  g1(33,6)=(-1);
  g1(33,56)=1;
  g1(34,18)=(-1);
  g1(34,57)=1;
  g1(35,19)=(-1);
  g1(35,58)=1;
  g1(36,7)=(-1);
  g1(36,59)=1;
  g1(37,21)=(-1);
  g1(37,60)=1;
  g1(38,22)=(-1);
  g1(38,61)=1;
end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],38,6724);
end
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],38,551368);
end
end
