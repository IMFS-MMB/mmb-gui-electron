function [residual, g1, g2, g3] = NK_IR04_dynamic(y, x, params, steady_state, it_)
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

residual = zeros(35, 1);
lhs =y(30);
rhs =4*y(26);
residual(1)= lhs-rhs;
lhs =y(31);
rhs =y(25)+y(1)+y(9)+y(10);
residual(2)= lhs-rhs;
lhs =y(32);
rhs =4*y(25);
residual(3)= lhs-rhs;
lhs =y(33);
rhs =y(23)-(params(35)*y(29)+params(36)*(params(40)-1)*y(28))/(1-params(36)*params(38));
residual(4)= lhs-rhs;
lhs =y(34);
rhs =y(23);
residual(5)= lhs-rhs;
lhs =y(30);
rhs =params(32)*x(it_, 4)+params(31)*y(74)+params(30)*y(73)+params(29)*y(72)+params(28)*y(65)+params(27)*y(13)+params(26)*y(12)+params(25)*y(11)+params(24)*y(8)+y(34)*params(23)+params(22)*y(71)+params(21)*y(70)+params(20)*y(69)+params(19)*y(64)+params(18)*y(16)+params(17)*y(15)+params(16)*y(14)+params(15)*y(7)+y(33)*params(14)+params(13)*y(68)+params(12)*y(67)+params(11)*y(66)+params(10)*y(63)+params(6)*y(6)+y(32)*params(5)+params(1)*y(5)+params(2)*y(17)+params(3)*y(18)+params(4)*y(19)+params(7)*y(20)+params(8)*y(21)+params(9)*y(22);
residual(6)= lhs-rhs;
lhs =y(27);
rhs =params(44)*y(2)+x(it_, 1);
residual(7)= lhs-rhs;
lhs =y(28);
rhs =params(45)*y(3)+x(it_, 2);
residual(8)= lhs-rhs;
lhs =y(29);
rhs =params(46)*y(4)+x(it_, 3);
residual(9)= lhs-rhs;
lhs =y(23);
rhs =y(58)-params(35)*(y(26)-y(60))+params(36)*(y(24)-y(28)-(y(59)-y(62)))+params(35)*(y(27)-y(61));
residual(10)= lhs-rhs;
lhs =y(24);
rhs =y(23)*params(38)-y(26)*params(39)+params(40)*y(28);
residual(11)= lhs-rhs;
lhs =y(25);
rhs =y(60)*params(57)/params(58)+params(37)*(y(23)*1/params(35)-(y(24)-y(28))*params(36)/params(35)-y(29));
residual(12)= lhs-rhs;
lhs =y(35);
rhs =y(63);
residual(13)= lhs-rhs;
lhs =y(36);
rhs =y(66);
residual(14)= lhs-rhs;
lhs =y(37);
rhs =y(67);
residual(15)= lhs-rhs;
lhs =y(38);
rhs =y(64);
residual(16)= lhs-rhs;
lhs =y(39);
rhs =y(69);
residual(17)= lhs-rhs;
lhs =y(40);
rhs =y(70);
residual(18)= lhs-rhs;
lhs =y(41);
rhs =y(65);
residual(19)= lhs-rhs;
lhs =y(42);
rhs =y(72);
residual(20)= lhs-rhs;
lhs =y(43);
rhs =y(73);
residual(21)= lhs-rhs;
lhs =y(44);
rhs =y(1);
residual(22)= lhs-rhs;
lhs =y(45);
rhs =y(9);
residual(23)= lhs-rhs;
lhs =y(46);
rhs =y(8);
residual(24)= lhs-rhs;
lhs =y(47);
rhs =y(11);
residual(25)= lhs-rhs;
lhs =y(48);
rhs =y(12);
residual(26)= lhs-rhs;
lhs =y(49);
rhs =y(7);
residual(27)= lhs-rhs;
lhs =y(50);
rhs =y(14);
residual(28)= lhs-rhs;
lhs =y(51);
rhs =y(15);
residual(29)= lhs-rhs;
lhs =y(52);
rhs =y(5);
residual(30)= lhs-rhs;
lhs =y(53);
rhs =y(17);
residual(31)= lhs-rhs;
lhs =y(54);
rhs =y(18);
residual(32)= lhs-rhs;
lhs =y(55);
rhs =y(6);
residual(33)= lhs-rhs;
lhs =y(56);
rhs =y(20);
residual(34)= lhs-rhs;
lhs =y(57);
rhs =y(21);
residual(35)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(35, 78);

  %
  % Jacobian matrix
  %

  g1(1,26)=(-4);
  g1(1,30)=1;
  g1(2,1)=(-1);
  g1(2,25)=(-1);
  g1(2,31)=1;
  g1(2,9)=(-1);
  g1(2,10)=(-1);
  g1(3,25)=(-4);
  g1(3,32)=1;
  g1(4,23)=(-1);
  g1(4,28)=params(36)*(params(40)-1)/(1-params(36)*params(38));
  g1(4,29)=params(35)/(1-params(36)*params(38));
  g1(4,33)=1;
  g1(5,23)=(-1);
  g1(5,34)=1;
  g1(6,5)=(-params(1));
  g1(6,30)=1;
  g1(6,6)=(-params(6));
  g1(6,32)=(-params(5));
  g1(6,63)=(-params(10));
  g1(6,7)=(-params(15));
  g1(6,33)=(-params(14));
  g1(6,64)=(-params(19));
  g1(6,8)=(-params(24));
  g1(6,34)=(-params(23));
  g1(6,65)=(-params(28));
  g1(6,78)=(-params(32));
  g1(6,66)=(-params(11));
  g1(6,67)=(-params(12));
  g1(6,68)=(-params(13));
  g1(6,69)=(-params(20));
  g1(6,70)=(-params(21));
  g1(6,71)=(-params(22));
  g1(6,72)=(-params(29));
  g1(6,73)=(-params(30));
  g1(6,74)=(-params(31));
  g1(6,11)=(-params(25));
  g1(6,12)=(-params(26));
  g1(6,13)=(-params(27));
  g1(6,14)=(-params(16));
  g1(6,15)=(-params(17));
  g1(6,16)=(-params(18));
  g1(6,17)=(-params(2));
  g1(6,18)=(-params(3));
  g1(6,19)=(-params(4));
  g1(6,20)=(-params(7));
  g1(6,21)=(-params(8));
  g1(6,22)=(-params(9));
  g1(7,2)=(-params(44));
  g1(7,27)=1;
  g1(7,75)=(-1);
  g1(8,3)=(-params(45));
  g1(8,28)=1;
  g1(8,76)=(-1);
  g1(9,4)=(-params(46));
  g1(9,29)=1;
  g1(9,77)=(-1);
  g1(10,23)=1;
  g1(10,58)=(-1);
  g1(10,24)=(-params(36));
  g1(10,59)=params(36);
  g1(10,60)=(-params(35));
  g1(10,26)=params(35);
  g1(10,27)=(-params(35));
  g1(10,61)=params(35);
  g1(10,28)=params(36);
  g1(10,62)=(-params(36));
  g1(11,23)=(-params(38));
  g1(11,24)=1;
  g1(11,26)=params(39);
  g1(11,28)=(-params(40));
  g1(12,23)=(-(params(37)*1/params(35)));
  g1(12,24)=(-(params(37)*(-(params(36)/params(35)))));
  g1(12,25)=1;
  g1(12,60)=(-(params(57)/params(58)));
  g1(12,28)=(-(params(37)*params(36)/params(35)));
  g1(12,29)=params(37);
  g1(13,63)=(-1);
  g1(13,35)=1;
  g1(14,66)=(-1);
  g1(14,36)=1;
  g1(15,67)=(-1);
  g1(15,37)=1;
  g1(16,64)=(-1);
  g1(16,38)=1;
  g1(17,69)=(-1);
  g1(17,39)=1;
  g1(18,70)=(-1);
  g1(18,40)=1;
  g1(19,65)=(-1);
  g1(19,41)=1;
  g1(20,72)=(-1);
  g1(20,42)=1;
  g1(21,73)=(-1);
  g1(21,43)=1;
  g1(22,1)=(-1);
  g1(22,44)=1;
  g1(23,9)=(-1);
  g1(23,45)=1;
  g1(24,8)=(-1);
  g1(24,46)=1;
  g1(25,11)=(-1);
  g1(25,47)=1;
  g1(26,12)=(-1);
  g1(26,48)=1;
  g1(27,7)=(-1);
  g1(27,49)=1;
  g1(28,14)=(-1);
  g1(28,50)=1;
  g1(29,15)=(-1);
  g1(29,51)=1;
  g1(30,5)=(-1);
  g1(30,52)=1;
  g1(31,17)=(-1);
  g1(31,53)=1;
  g1(32,18)=(-1);
  g1(32,54)=1;
  g1(33,6)=(-1);
  g1(33,55)=1;
  g1(34,20)=(-1);
  g1(34,56)=1;
  g1(35,21)=(-1);
  g1(35,57)=1;

if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],35,6084);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],35,474552);
end
end
end
end
