function [residual, g1, g2, g3] = US_FM95_dynamic(y, x, params, steady_state, it_)
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

residual = zeros(44, 1);
lhs =y(36);
rhs =y(33)+params(41)/params(44);
residual(1)= lhs-rhs;
lhs =y(37);
rhs =0.25*(y(34)+y(4)+y(10)+y(11));
residual(2)= lhs-rhs;
lhs =y(38);
rhs =y(34);
residual(3)= lhs-rhs;
lhs =y(39);
rhs =y(31);
residual(4)= lhs-rhs;
lhs =y(40);
rhs =y(31);
residual(5)= lhs-rhs;
lhs =y(36);
rhs =params(32)*x(it_, 3)+params(31)*y(88)+params(30)*y(87)+params(29)*y(86)+params(28)*y(79)+params(27)*y(14)+params(26)*y(13)+params(25)*y(12)+params(24)*y(9)+y(40)*params(23)+params(22)*y(85)+params(21)*y(84)+params(20)*y(83)+params(19)*y(78)+params(18)*y(17)+params(17)*y(16)+params(16)*y(15)+params(15)*y(8)+y(39)*params(14)+params(13)*y(82)+params(12)*y(81)+params(11)*y(80)+params(10)*y(77)+params(6)*y(7)+y(38)*params(5)+params(1)*y(6)+params(2)*y(18)+params(3)*y(19)+params(4)*y(20)+params(7)*y(21)+params(8)*y(22)+params(9)*y(23);
residual(6)= lhs-rhs;
lhs =y(29);
rhs =params(36)*y(30)+params(37)*y(2)+params(38)*y(24)+params(39)*y(25);
residual(7)= lhs-rhs;
lhs =y(30)-y(29);
rhs =x(it_, 1)+params(36)*(y(32)+y(31)*params(45))+params(37)*(y(74)+params(45)*y(73))+params(38)*(y(89)+params(45)*y(90))+params(39)*(y(91)+params(45)*y(92));
residual(8)= lhs-rhs;
lhs =y(32);
rhs =params(36)*(y(30)-y(29))+params(37)*(y(2)-y(1))+params(38)*(y(24)-y(26))+params(39)*(y(25)-y(27));
residual(9)= lhs-rhs;
lhs =y(31);
rhs =x(it_, 2)+params(44)*y(5)+params(41)+params(42)*y(3)+params(43)*y(28);
residual(10)= lhs-rhs;
lhs =y(35)-params(40)*(y(76)-y(35));
rhs =y(33)-y(75);
residual(11)= lhs-rhs;
lhs =y(34);
rhs =4*(y(29)-y(1));
residual(12)= lhs-rhs;
lhs =y(41);
rhs =y(77);
residual(13)= lhs-rhs;
lhs =y(42);
rhs =y(80);
residual(14)= lhs-rhs;
lhs =y(43);
rhs =y(81);
residual(15)= lhs-rhs;
lhs =y(44);
rhs =y(78);
residual(16)= lhs-rhs;
lhs =y(45);
rhs =y(83);
residual(17)= lhs-rhs;
lhs =y(46);
rhs =y(84);
residual(18)= lhs-rhs;
lhs =y(47);
rhs =y(79);
residual(19)= lhs-rhs;
lhs =y(48);
rhs =y(86);
residual(20)= lhs-rhs;
lhs =y(49);
rhs =y(87);
residual(21)= lhs-rhs;
lhs =y(50);
rhs =y(74);
residual(22)= lhs-rhs;
lhs =y(51);
rhs =y(73);
residual(23)= lhs-rhs;
lhs =y(52);
rhs =y(89);
residual(24)= lhs-rhs;
lhs =y(53);
rhs =y(90);
residual(25)= lhs-rhs;
lhs =y(54);
rhs =y(4);
residual(26)= lhs-rhs;
lhs =y(55);
rhs =y(10);
residual(27)= lhs-rhs;
lhs =y(56);
rhs =y(9);
residual(28)= lhs-rhs;
lhs =y(57);
rhs =y(12);
residual(29)= lhs-rhs;
lhs =y(58);
rhs =y(13);
residual(30)= lhs-rhs;
lhs =y(59);
rhs =y(8);
residual(31)= lhs-rhs;
lhs =y(60);
rhs =y(15);
residual(32)= lhs-rhs;
lhs =y(61);
rhs =y(16);
residual(33)= lhs-rhs;
lhs =y(62);
rhs =y(6);
residual(34)= lhs-rhs;
lhs =y(63);
rhs =y(18);
residual(35)= lhs-rhs;
lhs =y(64);
rhs =y(19);
residual(36)= lhs-rhs;
lhs =y(65);
rhs =y(7);
residual(37)= lhs-rhs;
lhs =y(66);
rhs =y(21);
residual(38)= lhs-rhs;
lhs =y(67);
rhs =y(22);
residual(39)= lhs-rhs;
lhs =y(68);
rhs =y(2);
residual(40)= lhs-rhs;
lhs =y(69);
rhs =y(24);
residual(41)= lhs-rhs;
lhs =y(70);
rhs =y(1);
residual(42)= lhs-rhs;
lhs =y(71);
rhs =y(26);
residual(43)= lhs-rhs;
lhs =y(72);
rhs =y(3);
residual(44)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(44, 95);

  %
  % Jacobian matrix
  %

  g1(1,33)=(-1);
  g1(1,36)=1;
  g1(2,4)=(-0.25);
  g1(2,34)=(-0.25);
  g1(2,37)=1;
  g1(2,10)=(-0.25);
  g1(2,11)=(-0.25);
  g1(3,34)=(-1);
  g1(3,38)=1;
  g1(4,31)=(-1);
  g1(4,39)=1;
  g1(5,31)=(-1);
  g1(5,40)=1;
  g1(6,6)=(-params(1));
  g1(6,36)=1;
  g1(6,7)=(-params(6));
  g1(6,38)=(-params(5));
  g1(6,77)=(-params(10));
  g1(6,8)=(-params(15));
  g1(6,39)=(-params(14));
  g1(6,78)=(-params(19));
  g1(6,9)=(-params(24));
  g1(6,40)=(-params(23));
  g1(6,79)=(-params(28));
  g1(6,95)=(-params(32));
  g1(6,80)=(-params(11));
  g1(6,81)=(-params(12));
  g1(6,82)=(-params(13));
  g1(6,83)=(-params(20));
  g1(6,84)=(-params(21));
  g1(6,85)=(-params(22));
  g1(6,86)=(-params(29));
  g1(6,87)=(-params(30));
  g1(6,88)=(-params(31));
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
  g1(7,29)=1;
  g1(7,2)=(-params(37));
  g1(7,30)=(-params(36));
  g1(7,24)=(-params(38));
  g1(7,25)=(-params(39));
  g1(8,29)=(-1);
  g1(8,30)=1;
  g1(8,31)=(-(params(36)*params(45)));
  g1(8,73)=(-(params(37)*params(45)));
  g1(8,32)=(-params(36));
  g1(8,74)=(-params(37));
  g1(8,93)=(-1);
  g1(8,89)=(-params(38));
  g1(8,90)=(-(params(38)*params(45)));
  g1(8,91)=(-params(39));
  g1(8,92)=(-(params(39)*params(45)));
  g1(9,1)=params(37);
  g1(9,29)=params(36);
  g1(9,2)=(-params(37));
  g1(9,30)=(-params(36));
  g1(9,32)=1;
  g1(9,24)=(-params(38));
  g1(9,25)=(-params(39));
  g1(9,26)=params(38);
  g1(9,27)=params(39);
  g1(10,3)=(-params(42));
  g1(10,31)=1;
  g1(10,5)=(-params(44));
  g1(10,94)=(-1);
  g1(10,28)=(-params(43));
  g1(11,33)=(-1);
  g1(11,75)=1;
  g1(11,35)=1-(-params(40));
  g1(11,76)=(-params(40));
  g1(12,1)=4;
  g1(12,29)=(-4);
  g1(12,34)=1;
  g1(13,77)=(-1);
  g1(13,41)=1;
  g1(14,80)=(-1);
  g1(14,42)=1;
  g1(15,81)=(-1);
  g1(15,43)=1;
  g1(16,78)=(-1);
  g1(16,44)=1;
  g1(17,83)=(-1);
  g1(17,45)=1;
  g1(18,84)=(-1);
  g1(18,46)=1;
  g1(19,79)=(-1);
  g1(19,47)=1;
  g1(20,86)=(-1);
  g1(20,48)=1;
  g1(21,87)=(-1);
  g1(21,49)=1;
  g1(22,74)=(-1);
  g1(22,50)=1;
  g1(23,73)=(-1);
  g1(23,51)=1;
  g1(24,89)=(-1);
  g1(24,52)=1;
  g1(25,90)=(-1);
  g1(25,53)=1;
  g1(26,4)=(-1);
  g1(26,54)=1;
  g1(27,10)=(-1);
  g1(27,55)=1;
  g1(28,9)=(-1);
  g1(28,56)=1;
  g1(29,12)=(-1);
  g1(29,57)=1;
  g1(30,13)=(-1);
  g1(30,58)=1;
  g1(31,8)=(-1);
  g1(31,59)=1;
  g1(32,15)=(-1);
  g1(32,60)=1;
  g1(33,16)=(-1);
  g1(33,61)=1;
  g1(34,6)=(-1);
  g1(34,62)=1;
  g1(35,18)=(-1);
  g1(35,63)=1;
  g1(36,19)=(-1);
  g1(36,64)=1;
  g1(37,7)=(-1);
  g1(37,65)=1;
  g1(38,21)=(-1);
  g1(38,66)=1;
  g1(39,22)=(-1);
  g1(39,67)=1;
  g1(40,2)=(-1);
  g1(40,68)=1;
  g1(41,24)=(-1);
  g1(41,69)=1;
  g1(42,1)=(-1);
  g1(42,70)=1;
  g1(43,26)=(-1);
  g1(43,71)=1;
  g1(44,3)=(-1);
  g1(44,72)=1;
end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],44,9025);
end
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],44,857375);
end
end
