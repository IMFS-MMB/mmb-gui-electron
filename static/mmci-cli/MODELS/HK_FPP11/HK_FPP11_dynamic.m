function [residual, g1, g2, g3] = HK_FPP11_dynamic(y, x, params, steady_state, it_)
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

residual = zeros(41, 1);
lhs =y(39);
rhs =y(28)*4;
residual(1)= lhs-rhs;
lhs =y(40);
rhs =0.25*(4*y(33)+4*y(4)+4*y(12)+4*y(13));
residual(2)= lhs-rhs;
lhs =y(41);
rhs =4*y(33);
residual(3)= lhs-rhs;
lhs =y(42);
rhs =y(36)-y(37);
residual(4)= lhs-rhs;
lhs =y(43);
rhs =y(36);
residual(5)= lhs-rhs;
lhs =y(39);
rhs =params(32)*x(it_, 5)+params(31)*y(81)+params(30)*y(80)+params(29)*y(79)+params(28)*y(72)+params(27)*y(16)+params(26)*y(15)+params(25)*y(14)+params(24)*y(11)+y(43)*params(23)+params(22)*y(78)+params(21)*y(77)+params(20)*y(76)+params(19)*y(71)+params(18)*y(19)+params(17)*y(18)+params(16)*y(17)+params(15)*y(10)+y(42)*params(14)+params(13)*y(75)+params(12)*y(74)+params(11)*y(73)+params(10)*y(70)+params(6)*y(9)+y(41)*params(5)+params(1)*y(8)+params(2)*y(20)+params(3)*y(21)+params(4)*y(22)+params(7)*y(23)+params(8)*y(24)+params(9)*y(25);
residual(6)= lhs-rhs;
lhs =y(26);
rhs =params(39)/params(43)*y(67)+params(40)/params(43)*y(27)-1/params(43)*(y(28)-y(69)-y(29));
residual(7)= lhs-rhs;
lhs =y(29);
rhs =(params(40)+params(39)*params(52)-params(43))*params(41)*y(31)+((params(40)+params(39)*params(53)-params(43))*params(42)+params(39)*params(38)*(params(53)-1))*params(37)*y(32);
residual(8)= lhs-rhs;
lhs =y(27);
rhs =params(46)/(1+params(44))*y(68)-y(67)*params(47)/(1+params(44))-(y(28)-y(69)-y(29))+y(38);
residual(9)= lhs-rhs;
lhs =y(30);
rhs =params(65)*(y(69)*params(46)*params(59)+params(62)*y(1))+y(26)*params(48)+x(it_, 3);
residual(10)= lhs-rhs;
lhs =y(34);
rhs =params(39)*(y(36)-y(32));
residual(11)= lhs-rhs;
lhs =y(37);
rhs =params(41)*y(31)-y(32)*params(42)*params(37);
residual(12)= lhs-rhs;
lhs =y(26);
rhs =y(36)-y(37);
residual(13)= lhs-rhs;
lhs =y(33);
rhs =y(30)+params(37)*(y(34)-y(5));
residual(14)= lhs-rhs;
lhs =y(35)-y(6);
rhs =y(30)+y(34)-y(5);
residual(15)= lhs-rhs;
lhs =y(31);
rhs =params(52)*y(2)+x(it_, 1);
residual(16)= lhs-rhs;
lhs =y(32);
rhs =params(53)*y(3)+x(it_, 2);
residual(17)= lhs-rhs;
lhs =y(38);
rhs =params(51)*y(7)+x(it_, 4);
residual(18)= lhs-rhs;
lhs =y(44);
rhs =y(70);
residual(19)= lhs-rhs;
lhs =y(45);
rhs =y(73);
residual(20)= lhs-rhs;
lhs =y(46);
rhs =y(74);
residual(21)= lhs-rhs;
lhs =y(47);
rhs =y(71);
residual(22)= lhs-rhs;
lhs =y(48);
rhs =y(76);
residual(23)= lhs-rhs;
lhs =y(49);
rhs =y(77);
residual(24)= lhs-rhs;
lhs =y(50);
rhs =y(72);
residual(25)= lhs-rhs;
lhs =y(51);
rhs =y(79);
residual(26)= lhs-rhs;
lhs =y(52);
rhs =y(80);
residual(27)= lhs-rhs;
lhs =y(53);
rhs =y(4);
residual(28)= lhs-rhs;
lhs =y(54);
rhs =y(12);
residual(29)= lhs-rhs;
lhs =y(55);
rhs =y(11);
residual(30)= lhs-rhs;
lhs =y(56);
rhs =y(14);
residual(31)= lhs-rhs;
lhs =y(57);
rhs =y(15);
residual(32)= lhs-rhs;
lhs =y(58);
rhs =y(10);
residual(33)= lhs-rhs;
lhs =y(59);
rhs =y(17);
residual(34)= lhs-rhs;
lhs =y(60);
rhs =y(18);
residual(35)= lhs-rhs;
lhs =y(61);
rhs =y(8);
residual(36)= lhs-rhs;
lhs =y(62);
rhs =y(20);
residual(37)= lhs-rhs;
lhs =y(63);
rhs =y(21);
residual(38)= lhs-rhs;
lhs =y(64);
rhs =y(9);
residual(39)= lhs-rhs;
lhs =y(65);
rhs =y(23);
residual(40)= lhs-rhs;
lhs =y(66);
rhs =y(24);
residual(41)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(41, 86);

  %
  % Jacobian matrix
  %

  g1(1,28)=(-4);
  g1(1,39)=1;
  g1(2,4)=(-1);
  g1(2,33)=(-1);
  g1(2,40)=1;
  g1(2,12)=(-1);
  g1(2,13)=(-1);
  g1(3,33)=(-4);
  g1(3,41)=1;
  g1(4,36)=(-1);
  g1(4,37)=1;
  g1(4,42)=1;
  g1(5,36)=(-1);
  g1(5,43)=1;
  g1(6,8)=(-params(1));
  g1(6,39)=1;
  g1(6,9)=(-params(6));
  g1(6,41)=(-params(5));
  g1(6,70)=(-params(10));
  g1(6,10)=(-params(15));
  g1(6,42)=(-params(14));
  g1(6,71)=(-params(19));
  g1(6,11)=(-params(24));
  g1(6,43)=(-params(23));
  g1(6,72)=(-params(28));
  g1(6,86)=(-params(32));
  g1(6,73)=(-params(11));
  g1(6,74)=(-params(12));
  g1(6,75)=(-params(13));
  g1(6,76)=(-params(20));
  g1(6,77)=(-params(21));
  g1(6,78)=(-params(22));
  g1(6,79)=(-params(29));
  g1(6,80)=(-params(30));
  g1(6,81)=(-params(31));
  g1(6,14)=(-params(25));
  g1(6,15)=(-params(26));
  g1(6,16)=(-params(27));
  g1(6,17)=(-params(16));
  g1(6,18)=(-params(17));
  g1(6,19)=(-params(18));
  g1(6,20)=(-params(2));
  g1(6,21)=(-params(3));
  g1(6,22)=(-params(4));
  g1(6,23)=(-params(7));
  g1(6,24)=(-params(8));
  g1(6,25)=(-params(9));
  g1(7,26)=1;
  g1(7,67)=(-(params(39)/params(43)));
  g1(7,27)=(-(params(40)/params(43)));
  g1(7,28)=1/params(43);
  g1(7,29)=(-(1/params(43)));
  g1(7,69)=(-(1/params(43)));
  g1(8,29)=1;
  g1(8,31)=(-((params(40)+params(39)*params(52)-params(43))*params(41)));
  g1(8,32)=(-(((params(40)+params(39)*params(53)-params(43))*params(42)+params(39)*params(38)*(params(53)-1))*params(37)));
  g1(9,67)=params(47)/(1+params(44));
  g1(9,27)=1;
  g1(9,68)=(-(params(46)/(1+params(44))));
  g1(9,28)=1;
  g1(9,29)=(-1);
  g1(9,69)=(-1);
  g1(9,38)=(-1);
  g1(10,26)=(-params(48));
  g1(10,1)=(-(params(65)*params(62)));
  g1(10,30)=1;
  g1(10,69)=(-(params(65)*params(46)*params(59)));
  g1(10,84)=(-1);
  g1(11,32)=params(39);
  g1(11,34)=1;
  g1(11,36)=(-params(39));
  g1(12,31)=(-params(41));
  g1(12,32)=params(42)*params(37);
  g1(12,37)=1;
  g1(13,26)=1;
  g1(13,36)=(-1);
  g1(13,37)=1;
  g1(14,30)=(-1);
  g1(14,33)=1;
  g1(14,5)=params(37);
  g1(14,34)=(-params(37));
  g1(15,30)=(-1);
  g1(15,5)=1;
  g1(15,34)=(-1);
  g1(15,6)=(-1);
  g1(15,35)=1;
  g1(16,2)=(-params(52));
  g1(16,31)=1;
  g1(16,82)=(-1);
  g1(17,3)=(-params(53));
  g1(17,32)=1;
  g1(17,83)=(-1);
  g1(18,7)=(-params(51));
  g1(18,38)=1;
  g1(18,85)=(-1);
  g1(19,70)=(-1);
  g1(19,44)=1;
  g1(20,73)=(-1);
  g1(20,45)=1;
  g1(21,74)=(-1);
  g1(21,46)=1;
  g1(22,71)=(-1);
  g1(22,47)=1;
  g1(23,76)=(-1);
  g1(23,48)=1;
  g1(24,77)=(-1);
  g1(24,49)=1;
  g1(25,72)=(-1);
  g1(25,50)=1;
  g1(26,79)=(-1);
  g1(26,51)=1;
  g1(27,80)=(-1);
  g1(27,52)=1;
  g1(28,4)=(-1);
  g1(28,53)=1;
  g1(29,12)=(-1);
  g1(29,54)=1;
  g1(30,11)=(-1);
  g1(30,55)=1;
  g1(31,14)=(-1);
  g1(31,56)=1;
  g1(32,15)=(-1);
  g1(32,57)=1;
  g1(33,10)=(-1);
  g1(33,58)=1;
  g1(34,17)=(-1);
  g1(34,59)=1;
  g1(35,18)=(-1);
  g1(35,60)=1;
  g1(36,8)=(-1);
  g1(36,61)=1;
  g1(37,20)=(-1);
  g1(37,62)=1;
  g1(38,21)=(-1);
  g1(38,63)=1;
  g1(39,9)=(-1);
  g1(39,64)=1;
  g1(40,23)=(-1);
  g1(40,65)=1;
  g1(41,24)=(-1);
  g1(41,66)=1;
end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],41,7396);
end
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],41,636056);
end
end
