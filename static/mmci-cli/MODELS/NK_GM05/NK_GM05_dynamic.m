function [residual, g1, g2, g3] = NK_GM05_dynamic(y, x, params, steady_state, it_)
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

residual = zeros(42, 1);
T172 = params(35)^(-1);
lhs =y(40);
rhs =y(31)*400;
residual(1)= lhs-rhs;
lhs =y(41);
rhs =25*(4*y(33)+4*y(2)+4*y(12)+4*y(13));
residual(2)= lhs-rhs;
lhs =y(42);
rhs =400*y(33);
residual(3)= lhs-rhs;
lhs =y(43);
rhs =100*y(27);
residual(4)= lhs-rhs;
lhs =y(44);
rhs =100*y(28);
residual(5)= lhs-rhs;
lhs =y(40);
rhs =params(32)*x(it_, 3)+params(31)*y(81)+params(30)*y(80)+params(29)*y(79)+params(28)*y(72)+params(27)*y(16)+params(26)*y(15)+params(25)*y(14)+params(24)*y(11)+y(44)*params(23)+params(22)*y(78)+params(21)*y(77)+params(20)*y(76)+params(19)*y(71)+params(18)*y(19)+params(17)*y(18)+params(16)*y(17)+params(15)*y(10)+y(43)*params(14)+params(13)*y(75)+params(12)*y(74)+params(11)*y(73)+params(10)*y(70)+params(6)*y(9)+y(42)*params(5)+params(1)*y(8)+params(2)*y(20)+params(3)*y(21)+params(4)*y(22)+params(7)*y(23)+params(8)*y(24)+params(9)*y(25);
residual(6)= lhs-rhs;
lhs =y(27);
rhs =y(69)-T172*(y(31)-y(68)-y(30));
residual(7)= lhs-rhs;
lhs =y(30);
rhs =(-params(35))*params(37)*(1-params(45))*y(39)+params(35)*params(38)*(params(39)+params(40))*(params(46)-1)*y(37);
residual(8)= lhs-rhs;
lhs =y(26);
rhs =y(68)*params(41)+y(27)*params(42);
residual(9)= lhs-rhs;
lhs =y(29);
rhs =params(37)*y(39)+y(37)*params(38)*params(40);
residual(10)= lhs-rhs;
lhs =y(27);
rhs =y(28)-y(29);
residual(11)= lhs-rhs;
lhs =y(28);
rhs =y(37)+T172*y(32);
residual(12)= lhs-rhs;
lhs =y(33);
rhs =y(26)+params(38)*(y(32)-y(1));
residual(13)= lhs-rhs;
lhs =y(33);
rhs =y(34)-y(3);
residual(14)= lhs-rhs;
lhs =y(26);
rhs =y(35)-y(4);
residual(15)= lhs-rhs;
lhs =y(32);
rhs =y(1)+y(36)-y(5)+y(38)-y(26);
residual(16)= lhs-rhs;
residual(17) = y(38);
lhs =y(39);
rhs =params(45)*y(7)+x(it_, 2);
residual(18)= lhs-rhs;
lhs =y(37);
rhs =params(46)*y(6)+x(it_, 1);
residual(19)= lhs-rhs;
lhs =y(45);
rhs =y(70);
residual(20)= lhs-rhs;
lhs =y(46);
rhs =y(73);
residual(21)= lhs-rhs;
lhs =y(47);
rhs =y(74);
residual(22)= lhs-rhs;
lhs =y(48);
rhs =y(71);
residual(23)= lhs-rhs;
lhs =y(49);
rhs =y(76);
residual(24)= lhs-rhs;
lhs =y(50);
rhs =y(77);
residual(25)= lhs-rhs;
lhs =y(51);
rhs =y(72);
residual(26)= lhs-rhs;
lhs =y(52);
rhs =y(79);
residual(27)= lhs-rhs;
lhs =y(53);
rhs =y(80);
residual(28)= lhs-rhs;
lhs =y(54);
rhs =y(2);
residual(29)= lhs-rhs;
lhs =y(55);
rhs =y(12);
residual(30)= lhs-rhs;
lhs =y(56);
rhs =y(11);
residual(31)= lhs-rhs;
lhs =y(57);
rhs =y(14);
residual(32)= lhs-rhs;
lhs =y(58);
rhs =y(15);
residual(33)= lhs-rhs;
lhs =y(59);
rhs =y(10);
residual(34)= lhs-rhs;
lhs =y(60);
rhs =y(17);
residual(35)= lhs-rhs;
lhs =y(61);
rhs =y(18);
residual(36)= lhs-rhs;
lhs =y(62);
rhs =y(8);
residual(37)= lhs-rhs;
lhs =y(63);
rhs =y(20);
residual(38)= lhs-rhs;
lhs =y(64);
rhs =y(21);
residual(39)= lhs-rhs;
lhs =y(65);
rhs =y(9);
residual(40)= lhs-rhs;
lhs =y(66);
rhs =y(23);
residual(41)= lhs-rhs;
lhs =y(67);
rhs =y(24);
residual(42)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(42, 84);

  %
  % Jacobian matrix
  %

  g1(1,31)=(-400);
  g1(1,40)=1;
  g1(2,2)=(-100);
  g1(2,33)=(-100);
  g1(2,41)=1;
  g1(2,12)=(-100);
  g1(2,13)=(-100);
  g1(3,33)=(-400);
  g1(3,42)=1;
  g1(4,27)=(-100);
  g1(4,43)=1;
  g1(5,28)=(-100);
  g1(5,44)=1;
  g1(6,8)=(-params(1));
  g1(6,40)=1;
  g1(6,9)=(-params(6));
  g1(6,42)=(-params(5));
  g1(6,70)=(-params(10));
  g1(6,10)=(-params(15));
  g1(6,43)=(-params(14));
  g1(6,71)=(-params(19));
  g1(6,11)=(-params(24));
  g1(6,44)=(-params(23));
  g1(6,72)=(-params(28));
  g1(6,84)=(-params(32));
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
  g1(7,68)=(-T172);
  g1(7,27)=1;
  g1(7,69)=(-1);
  g1(7,30)=(-T172);
  g1(7,31)=T172;
  g1(8,30)=1;
  g1(8,37)=(-(params(35)*params(38)*(params(39)+params(40))*(params(46)-1)));
  g1(8,39)=(-((-params(35))*params(37)*(1-params(45))));
  g1(9,26)=1;
  g1(9,68)=(-params(41));
  g1(9,27)=(-params(42));
  g1(10,29)=1;
  g1(10,37)=(-(params(38)*params(40)));
  g1(10,39)=(-params(37));
  g1(11,27)=1;
  g1(11,28)=(-1);
  g1(11,29)=1;
  g1(12,28)=1;
  g1(12,32)=(-T172);
  g1(12,37)=(-1);
  g1(13,26)=(-1);
  g1(13,1)=params(38);
  g1(13,32)=(-params(38));
  g1(13,33)=1;
  g1(14,33)=1;
  g1(14,3)=1;
  g1(14,34)=(-1);
  g1(15,26)=1;
  g1(15,4)=1;
  g1(15,35)=(-1);
  g1(16,26)=1;
  g1(16,1)=(-1);
  g1(16,32)=1;
  g1(16,5)=1;
  g1(16,36)=(-1);
  g1(16,38)=(-1);
  g1(17,38)=1;
  g1(18,7)=(-params(45));
  g1(18,39)=1;
  g1(18,83)=(-1);
  g1(19,6)=(-params(46));
  g1(19,37)=1;
  g1(19,82)=(-1);
  g1(20,70)=(-1);
  g1(20,45)=1;
  g1(21,73)=(-1);
  g1(21,46)=1;
  g1(22,74)=(-1);
  g1(22,47)=1;
  g1(23,71)=(-1);
  g1(23,48)=1;
  g1(24,76)=(-1);
  g1(24,49)=1;
  g1(25,77)=(-1);
  g1(25,50)=1;
  g1(26,72)=(-1);
  g1(26,51)=1;
  g1(27,79)=(-1);
  g1(27,52)=1;
  g1(28,80)=(-1);
  g1(28,53)=1;
  g1(29,2)=(-1);
  g1(29,54)=1;
  g1(30,12)=(-1);
  g1(30,55)=1;
  g1(31,11)=(-1);
  g1(31,56)=1;
  g1(32,14)=(-1);
  g1(32,57)=1;
  g1(33,15)=(-1);
  g1(33,58)=1;
  g1(34,10)=(-1);
  g1(34,59)=1;
  g1(35,17)=(-1);
  g1(35,60)=1;
  g1(36,18)=(-1);
  g1(36,61)=1;
  g1(37,8)=(-1);
  g1(37,62)=1;
  g1(38,20)=(-1);
  g1(38,63)=1;
  g1(39,21)=(-1);
  g1(39,64)=1;
  g1(40,9)=(-1);
  g1(40,65)=1;
  g1(41,23)=(-1);
  g1(41,66)=1;
  g1(42,24)=(-1);
  g1(42,67)=1;

if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],42,7056);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],42,592704);
end
end
end
end
