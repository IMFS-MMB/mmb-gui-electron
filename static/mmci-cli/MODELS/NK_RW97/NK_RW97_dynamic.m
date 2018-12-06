function [residual, g1, g2, g3] = NK_RW97_dynamic(y, x, params, steady_state, it_)
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

residual = zeros(38, 1);
T195 = params(36)^(-1);
lhs =y(31);
rhs =y(26)*4;
residual(1)= lhs-rhs;
lhs =y(32);
rhs =0.25*(4*y(22)+4*y(1)+4*y(8)+4*y(9));
residual(2)= lhs-rhs;
lhs =y(33);
rhs =4*y(22);
residual(3)= lhs-rhs;
lhs =y(34);
rhs =y(27);
residual(4)= lhs-rhs;
lhs =y(35);
rhs =y(23);
residual(5)= lhs-rhs;
lhs =y(36);
rhs =y(30);
residual(6)= lhs-rhs;
lhs =y(31);
rhs =params(32)*x(it_, 2)+params(31)*y(75)+params(30)*y(74)+params(29)*y(73)+params(28)*y(66)+params(27)*y(12)+params(26)*y(11)+params(25)*y(10)+params(24)*y(7)+y(35)*params(23)+params(22)*y(72)+params(21)*y(71)+params(20)*y(70)+params(19)*y(65)+params(18)*y(15)+params(17)*y(14)+params(16)*y(13)+params(15)*y(6)+y(34)*params(14)+params(13)*y(69)+params(12)*y(68)+params(11)*y(67)+params(10)*y(64)+params(6)*y(5)+y(33)*params(5)+params(1)*y(4)+params(2)*y(16)+params(3)*y(17)+params(4)*y(18)+params(7)*y(19)+params(8)*y(20)+params(9)*y(21);
residual(7)= lhs-rhs;
lhs =y(36);
rhs =params(34)*x(it_, 3);
residual(8)= lhs-rhs;
lhs =y(22);
rhs =params(35)*y(60)+y(27)*params(40)+y(28);
residual(9)= lhs-rhs;
lhs =y(28);
rhs =params(41)*y(2)+x(it_, 1);
residual(10)= lhs-rhs;
lhs =y(27);
rhs =y(62)-params(36)*(y(26)-y(60)-y(25));
residual(11)= lhs-rhs;
lhs =y(25);
rhs =T195*(y(29)-y(24)-(y(63)-y(61)));
residual(12)= lhs-rhs;
lhs =y(24);
rhs =T195*y(29)/(T195+params(39));
residual(13)= lhs-rhs;
lhs =y(27);
rhs =y(23)-y(24);
residual(14)= lhs-rhs;
lhs =y(29);
rhs =y(30)+params(42)*y(3);
residual(15)= lhs-rhs;
lhs =y(37);
rhs =y(64);
residual(16)= lhs-rhs;
lhs =y(38);
rhs =y(67);
residual(17)= lhs-rhs;
lhs =y(39);
rhs =y(68);
residual(18)= lhs-rhs;
lhs =y(40);
rhs =y(65);
residual(19)= lhs-rhs;
lhs =y(41);
rhs =y(70);
residual(20)= lhs-rhs;
lhs =y(42);
rhs =y(71);
residual(21)= lhs-rhs;
lhs =y(43);
rhs =y(66);
residual(22)= lhs-rhs;
lhs =y(44);
rhs =y(73);
residual(23)= lhs-rhs;
lhs =y(45);
rhs =y(74);
residual(24)= lhs-rhs;
lhs =y(46);
rhs =y(1);
residual(25)= lhs-rhs;
lhs =y(47);
rhs =y(8);
residual(26)= lhs-rhs;
lhs =y(48);
rhs =y(7);
residual(27)= lhs-rhs;
lhs =y(49);
rhs =y(10);
residual(28)= lhs-rhs;
lhs =y(50);
rhs =y(11);
residual(29)= lhs-rhs;
lhs =y(51);
rhs =y(6);
residual(30)= lhs-rhs;
lhs =y(52);
rhs =y(13);
residual(31)= lhs-rhs;
lhs =y(53);
rhs =y(14);
residual(32)= lhs-rhs;
lhs =y(54);
rhs =y(4);
residual(33)= lhs-rhs;
lhs =y(55);
rhs =y(16);
residual(34)= lhs-rhs;
lhs =y(56);
rhs =y(17);
residual(35)= lhs-rhs;
lhs =y(57);
rhs =y(5);
residual(36)= lhs-rhs;
lhs =y(58);
rhs =y(19);
residual(37)= lhs-rhs;
lhs =y(59);
rhs =y(20);
residual(38)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(38, 78);

  %
  % Jacobian matrix
  %

  g1(1,26)=(-4);
  g1(1,31)=1;
  g1(2,1)=(-1);
  g1(2,22)=(-1);
  g1(2,32)=1;
  g1(2,8)=(-1);
  g1(2,9)=(-1);
  g1(3,22)=(-4);
  g1(3,33)=1;
  g1(4,27)=(-1);
  g1(4,34)=1;
  g1(5,23)=(-1);
  g1(5,35)=1;
  g1(6,30)=(-1);
  g1(6,36)=1;
  g1(7,4)=(-params(1));
  g1(7,31)=1;
  g1(7,5)=(-params(6));
  g1(7,33)=(-params(5));
  g1(7,64)=(-params(10));
  g1(7,6)=(-params(15));
  g1(7,34)=(-params(14));
  g1(7,65)=(-params(19));
  g1(7,7)=(-params(24));
  g1(7,35)=(-params(23));
  g1(7,66)=(-params(28));
  g1(7,77)=(-params(32));
  g1(7,67)=(-params(11));
  g1(7,68)=(-params(12));
  g1(7,69)=(-params(13));
  g1(7,70)=(-params(20));
  g1(7,71)=(-params(21));
  g1(7,72)=(-params(22));
  g1(7,73)=(-params(29));
  g1(7,74)=(-params(30));
  g1(7,75)=(-params(31));
  g1(7,10)=(-params(25));
  g1(7,11)=(-params(26));
  g1(7,12)=(-params(27));
  g1(7,13)=(-params(16));
  g1(7,14)=(-params(17));
  g1(7,15)=(-params(18));
  g1(7,16)=(-params(2));
  g1(7,17)=(-params(3));
  g1(7,18)=(-params(4));
  g1(7,19)=(-params(7));
  g1(7,20)=(-params(8));
  g1(7,21)=(-params(9));
  g1(8,36)=1;
  g1(8,78)=(-params(34));
  g1(9,22)=1;
  g1(9,60)=(-params(35));
  g1(9,27)=(-params(40));
  g1(9,28)=(-1);
  g1(10,2)=(-params(41));
  g1(10,28)=1;
  g1(10,76)=(-1);
  g1(11,60)=(-params(36));
  g1(11,25)=(-params(36));
  g1(11,26)=params(36);
  g1(11,27)=1;
  g1(11,62)=(-1);
  g1(12,24)=T195;
  g1(12,61)=(-T195);
  g1(12,25)=1;
  g1(12,29)=(-T195);
  g1(12,63)=T195;
  g1(13,24)=1;
  g1(13,29)=(-(T195/(T195+params(39))));
  g1(14,23)=(-1);
  g1(14,24)=1;
  g1(14,27)=1;
  g1(15,3)=(-params(42));
  g1(15,29)=1;
  g1(15,30)=(-1);
  g1(16,64)=(-1);
  g1(16,37)=1;
  g1(17,67)=(-1);
  g1(17,38)=1;
  g1(18,68)=(-1);
  g1(18,39)=1;
  g1(19,65)=(-1);
  g1(19,40)=1;
  g1(20,70)=(-1);
  g1(20,41)=1;
  g1(21,71)=(-1);
  g1(21,42)=1;
  g1(22,66)=(-1);
  g1(22,43)=1;
  g1(23,73)=(-1);
  g1(23,44)=1;
  g1(24,74)=(-1);
  g1(24,45)=1;
  g1(25,1)=(-1);
  g1(25,46)=1;
  g1(26,8)=(-1);
  g1(26,47)=1;
  g1(27,7)=(-1);
  g1(27,48)=1;
  g1(28,10)=(-1);
  g1(28,49)=1;
  g1(29,11)=(-1);
  g1(29,50)=1;
  g1(30,6)=(-1);
  g1(30,51)=1;
  g1(31,13)=(-1);
  g1(31,52)=1;
  g1(32,14)=(-1);
  g1(32,53)=1;
  g1(33,4)=(-1);
  g1(33,54)=1;
  g1(34,16)=(-1);
  g1(34,55)=1;
  g1(35,17)=(-1);
  g1(35,56)=1;
  g1(36,5)=(-1);
  g1(36,57)=1;
  g1(37,19)=(-1);
  g1(37,58)=1;
  g1(38,20)=(-1);
  g1(38,59)=1;

if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],38,6084);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],38,474552);
end
end
end
end
