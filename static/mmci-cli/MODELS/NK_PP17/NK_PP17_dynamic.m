function [residual, g1, g2, g3] = NK_PP17_dynamic(y, x, params, steady_state, it_)
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

residual = zeros(49, 1);
T188 = (1+params(38))/(params(36)+params(38));
T189 = params(36)*T188;
T206 = 1/(1+params(41)*params(40));
T226 = T188*y(51);
lhs =y(55);
rhs =y(36)*4;
residual(1)= lhs-rhs;
lhs =y(56);
rhs =y(37)+y(2)+y(20)+y(21);
residual(2)= lhs-rhs;
lhs =y(57);
rhs =4*y(37);
residual(3)= lhs-rhs;
lhs =y(58);
rhs =y(34)-y(43);
residual(4)= lhs-rhs;
lhs =y(59);
rhs =y(34);
residual(5)= lhs-rhs;
lhs =y(55);
rhs =params(32)/100*x(it_, 5)+params(31)*y(101)+params(30)*y(100)+params(29)*y(99)+params(28)*y(92)+params(27)*y(24)+params(26)*y(23)+params(25)*y(22)+params(24)*y(19)+y(59)*params(23)+params(22)*y(98)+params(21)*y(97)+params(20)*y(96)+params(19)*y(91)+params(18)*y(27)+params(17)*y(26)+params(16)*y(25)+params(15)*y(18)+y(58)*params(14)+params(13)*y(95)+params(12)*y(94)+params(11)*y(93)+params(10)*y(90)+params(6)*y(17)+y(57)*params(5)+params(1)*y(16)+params(2)*y(28)+params(3)*y(29)+params(4)*y(30)+params(7)*y(31)+params(8)*y(32)+params(9)*y(33);
residual(6)= lhs-rhs;
lhs =y(37);
rhs =params(44)*((params(36)+params(38))*y(35)+params(37)*(y(36)+params(43)*y(38))+y(53))+params(35)*y(84);
residual(7)= lhs-rhs;
lhs =y(36);
rhs =y(84)+params(36)*(y(83)-y(35))+T189*(y(88)-y(51));
residual(8)= lhs-rhs;
lhs =y(39);
rhs =y(4)+y(1)-y(37)+T206*(params(41)*params(40)*y(5)+params(40)*y(3)+(params(40)-1)*y(6))+y(52);
residual(9)= lhs-rhs;
lhs =y(39)+y(40);
rhs =y(35)*(params(38)+1+params(36))+T226-(y(36)+params(43)*y(38))*(1-params(37));
residual(10)= lhs-rhs;
lhs =y(40)+y(54);
rhs =y(38)*params(40)+(params(40)-1)*y(41)+params(35)*((1+params(41)*params(40))*y(85)+y(89));
residual(11)= lhs-rhs;
residual(12) = y(41);
lhs =y(35);
rhs =y(34)-T226;
residual(13)= lhs-rhs;
lhs =y(42);
rhs =params(44)*((params(36)+params(38))*y(35)+params(37)*(y(36)+params(43)*y(38)));
residual(14)= lhs-rhs;
lhs =0;
rhs =(params(36)+params(38))*y(44)+params(37)*params(43)*y(46);
residual(15)= lhs-rhs;
lhs =y(45);
rhs =T189*(y(88)-y(51))+params(36)*(y(86)-y(44));
residual(16)= lhs-rhs;
lhs =y(47);
rhs =y(52)+y(9)+y(7)+T206*(params(41)*params(40)*y(10)+params(40)*y(8)+(params(40)-1)*y(11));
residual(17)= lhs-rhs;
lhs =y(47)+y(48);
rhs =T226+(params(38)+1+params(36))*y(44)-(1-params(37))*(y(45)+params(43)*y(46));
residual(18)= lhs-rhs;
lhs =y(54)+y(48);
rhs =params(40)*y(46)+(params(40)-1)*y(49)+params(35)*(y(89)+(1+params(41)*params(40))*y(87));
residual(19)= lhs-rhs;
residual(20) = y(49);
lhs =y(44);
rhs =y(43)-T226;
residual(21)= lhs-rhs;
residual(22) = y(50);
lhs =y(51);
rhs =params(45)*y(12)-x(it_, 1);
residual(23)= lhs-rhs;
lhs =y(53);
rhs =params(46)*y(14)+x(it_, 2);
residual(24)= lhs-rhs;
lhs =y(52);
rhs =params(47)*y(13)-x(it_, 3);
residual(25)= lhs-rhs;
lhs =y(54);
rhs =params(49)*y(15)+x(it_, 4);
residual(26)= lhs-rhs;
lhs =y(60);
rhs =y(90);
residual(27)= lhs-rhs;
lhs =y(61);
rhs =y(93);
residual(28)= lhs-rhs;
lhs =y(62);
rhs =y(94);
residual(29)= lhs-rhs;
lhs =y(63);
rhs =y(91);
residual(30)= lhs-rhs;
lhs =y(64);
rhs =y(96);
residual(31)= lhs-rhs;
lhs =y(65);
rhs =y(97);
residual(32)= lhs-rhs;
lhs =y(66);
rhs =y(92);
residual(33)= lhs-rhs;
lhs =y(67);
rhs =y(99);
residual(34)= lhs-rhs;
lhs =y(68);
rhs =y(100);
residual(35)= lhs-rhs;
lhs =y(69);
rhs =y(2);
residual(36)= lhs-rhs;
lhs =y(70);
rhs =y(20);
residual(37)= lhs-rhs;
lhs =y(71);
rhs =y(19);
residual(38)= lhs-rhs;
lhs =y(72);
rhs =y(22);
residual(39)= lhs-rhs;
lhs =y(73);
rhs =y(23);
residual(40)= lhs-rhs;
lhs =y(74);
rhs =y(18);
residual(41)= lhs-rhs;
lhs =y(75);
rhs =y(25);
residual(42)= lhs-rhs;
lhs =y(76);
rhs =y(26);
residual(43)= lhs-rhs;
lhs =y(77);
rhs =y(16);
residual(44)= lhs-rhs;
lhs =y(78);
rhs =y(28);
residual(45)= lhs-rhs;
lhs =y(79);
rhs =y(29);
residual(46)= lhs-rhs;
lhs =y(80);
rhs =y(17);
residual(47)= lhs-rhs;
lhs =y(81);
rhs =y(31);
residual(48)= lhs-rhs;
lhs =y(82);
rhs =y(32);
residual(49)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(49, 106);

  %
  % Jacobian matrix
  %

  g1(1,36)=(-4);
  g1(1,55)=1;
  g1(2,2)=(-1);
  g1(2,37)=(-1);
  g1(2,56)=1;
  g1(2,20)=(-1);
  g1(2,21)=(-1);
  g1(3,37)=(-4);
  g1(3,57)=1;
  g1(4,34)=(-1);
  g1(4,43)=1;
  g1(4,58)=1;
  g1(5,34)=(-1);
  g1(5,59)=1;
  g1(6,16)=(-params(1));
  g1(6,55)=1;
  g1(6,17)=(-params(6));
  g1(6,57)=(-params(5));
  g1(6,90)=(-params(10));
  g1(6,18)=(-params(15));
  g1(6,58)=(-params(14));
  g1(6,91)=(-params(19));
  g1(6,19)=(-params(24));
  g1(6,59)=(-params(23));
  g1(6,92)=(-params(28));
  g1(6,106)=(-(params(32)/100));
  g1(6,93)=(-params(11));
  g1(6,94)=(-params(12));
  g1(6,95)=(-params(13));
  g1(6,96)=(-params(20));
  g1(6,97)=(-params(21));
  g1(6,98)=(-params(22));
  g1(6,99)=(-params(29));
  g1(6,100)=(-params(30));
  g1(6,101)=(-params(31));
  g1(6,22)=(-params(25));
  g1(6,23)=(-params(26));
  g1(6,24)=(-params(27));
  g1(6,25)=(-params(16));
  g1(6,26)=(-params(17));
  g1(6,27)=(-params(18));
  g1(6,28)=(-params(2));
  g1(6,29)=(-params(3));
  g1(6,30)=(-params(4));
  g1(6,31)=(-params(7));
  g1(6,32)=(-params(8));
  g1(6,33)=(-params(9));
  g1(7,35)=(-(params(44)*(params(36)+params(38))));
  g1(7,36)=(-(params(44)*params(37)));
  g1(7,37)=1;
  g1(7,84)=(-params(35));
  g1(7,38)=(-(params(44)*params(37)*params(43)));
  g1(7,53)=(-params(44));
  g1(8,35)=params(36);
  g1(8,83)=(-params(36));
  g1(8,36)=1;
  g1(8,84)=(-1);
  g1(8,51)=T189;
  g1(8,88)=(-T189);
  g1(9,1)=(-1);
  g1(9,37)=1;
  g1(9,3)=(-(params(40)*T206));
  g1(9,4)=(-1);
  g1(9,39)=1;
  g1(9,5)=(-(params(41)*params(40)*T206));
  g1(9,6)=(-(T206*(params(40)-1)));
  g1(9,52)=(-1);
  g1(10,35)=(-(params(38)+1+params(36)));
  g1(10,36)=1-params(37);
  g1(10,38)=params(43)*(1-params(37));
  g1(10,39)=1;
  g1(10,40)=1;
  g1(10,51)=(-T188);
  g1(11,38)=(-params(40));
  g1(11,40)=1;
  g1(11,85)=(-(params(35)*(1+params(41)*params(40))));
  g1(11,41)=(-(params(40)-1));
  g1(11,54)=1;
  g1(11,89)=(-params(35));
  g1(12,41)=1;
  g1(13,34)=(-1);
  g1(13,35)=1;
  g1(13,51)=T188;
  g1(14,35)=(-(params(44)*(params(36)+params(38))));
  g1(14,36)=(-(params(44)*params(37)));
  g1(14,38)=(-(params(44)*params(37)*params(43)));
  g1(14,42)=1;
  g1(15,44)=(-(params(36)+params(38)));
  g1(15,46)=(-(params(37)*params(43)));
  g1(16,44)=params(36);
  g1(16,86)=(-params(36));
  g1(16,45)=1;
  g1(16,51)=T189;
  g1(16,88)=(-T189);
  g1(17,7)=(-1);
  g1(17,8)=(-(params(40)*T206));
  g1(17,9)=(-1);
  g1(17,47)=1;
  g1(17,10)=(-(params(41)*params(40)*T206));
  g1(17,11)=(-(T206*(params(40)-1)));
  g1(17,52)=(-1);
  g1(18,44)=(-(params(38)+1+params(36)));
  g1(18,45)=1-params(37);
  g1(18,46)=params(43)*(1-params(37));
  g1(18,47)=1;
  g1(18,48)=1;
  g1(18,51)=(-T188);
  g1(19,46)=(-params(40));
  g1(19,48)=1;
  g1(19,87)=(-(params(35)*(1+params(41)*params(40))));
  g1(19,49)=(-(params(40)-1));
  g1(19,54)=1;
  g1(19,89)=(-params(35));
  g1(20,49)=1;
  g1(21,43)=(-1);
  g1(21,44)=1;
  g1(21,51)=T188;
  g1(22,50)=1;
  g1(23,12)=(-params(45));
  g1(23,51)=1;
  g1(23,102)=1;
  g1(24,14)=(-params(46));
  g1(24,53)=1;
  g1(24,103)=(-1);
  g1(25,13)=(-params(47));
  g1(25,52)=1;
  g1(25,104)=1;
  g1(26,15)=(-params(49));
  g1(26,54)=1;
  g1(26,105)=(-1);
  g1(27,90)=(-1);
  g1(27,60)=1;
  g1(28,93)=(-1);
  g1(28,61)=1;
  g1(29,94)=(-1);
  g1(29,62)=1;
  g1(30,91)=(-1);
  g1(30,63)=1;
  g1(31,96)=(-1);
  g1(31,64)=1;
  g1(32,97)=(-1);
  g1(32,65)=1;
  g1(33,92)=(-1);
  g1(33,66)=1;
  g1(34,99)=(-1);
  g1(34,67)=1;
  g1(35,100)=(-1);
  g1(35,68)=1;
  g1(36,2)=(-1);
  g1(36,69)=1;
  g1(37,20)=(-1);
  g1(37,70)=1;
  g1(38,19)=(-1);
  g1(38,71)=1;
  g1(39,22)=(-1);
  g1(39,72)=1;
  g1(40,23)=(-1);
  g1(40,73)=1;
  g1(41,18)=(-1);
  g1(41,74)=1;
  g1(42,25)=(-1);
  g1(42,75)=1;
  g1(43,26)=(-1);
  g1(43,76)=1;
  g1(44,16)=(-1);
  g1(44,77)=1;
  g1(45,28)=(-1);
  g1(45,78)=1;
  g1(46,29)=(-1);
  g1(46,79)=1;
  g1(47,17)=(-1);
  g1(47,80)=1;
  g1(48,31)=(-1);
  g1(48,81)=1;
  g1(49,32)=(-1);
  g1(49,82)=1;

if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],49,11236);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],49,1191016);
end
end
end
end
