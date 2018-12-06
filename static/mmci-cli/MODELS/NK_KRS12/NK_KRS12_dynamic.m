function [residual, g1, g2, g3] = NK_KRS12_dynamic(y, x, params, steady_state, it_)
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

residual = zeros(69, 1);
T187 = (y(40)-y(1)*params(35))/(1-params(35));
T252 = (y(57)-params(35)*y(9))/(1-params(35));
lhs =y(79);
rhs =y(44)*4;
residual(1)= lhs-rhs;
lhs =y(80);
rhs =y(47)+y(4)+y(24)+y(25);
residual(2)= lhs-rhs;
lhs =y(81);
rhs =4*y(47);
residual(3)= lhs-rhs;
lhs =y(82);
rhs =y(71);
residual(4)= lhs-rhs;
lhs =y(83);
rhs =y(71)-y(72);
residual(5)= lhs-rhs;
lhs =y(79);
rhs =params(32)*x(it_, 4)+params(31)*y(127)+params(30)*y(126)+params(29)*y(125)+params(28)*y(117)+params(27)*y(28)+params(26)*y(27)+params(25)*y(26)+params(24)*y(22)+y(82)*params(23)+params(22)*y(124)+params(21)*y(123)+params(20)*y(122)+params(19)*y(118)+params(18)*y(31)+params(17)*y(30)+params(16)*y(29)+params(15)*y(23)+y(83)*params(14)+params(13)*y(121)+params(12)*y(120)+params(11)*y(119)+params(10)*y(116)+params(6)*y(21)+y(81)*params(5)+params(1)*y(20)+params(2)*y(32)+params(3)*y(33)+params(4)*y(34)+params(7)*y(35)+params(8)*y(36)+params(9)*y(37);
residual(6)= lhs-rhs;
lhs =y(39);
rhs =y(51)-y(50);
residual(7)= lhs-rhs;
lhs =y(45);
rhs =y(40)-y(1);
residual(8)= lhs-rhs;
lhs =y(46);
rhs =y(49)-y(5);
residual(9)= lhs-rhs;
lhs =y(47);
rhs =y(50)-y(6);
residual(10)= lhs-rhs;
lhs =y(52);
rhs =y(51)-y(7);
residual(11)= lhs-rhs;
lhs =y(39)-T187+params(36)*(y(41)-y(2));
rhs =y(42)+params(36)*params(37)*(y(108)-y(41));
residual(12)= lhs-rhs;
lhs =(1-params(37)*(1-params(38)))*(y(67)-y(43));
rhs =y(42)-params(37)*(1-params(38))*y(109);
residual(13)= lhs-rhs;
lhs =y(45)*params(35);
rhs =y(110)-(1-params(35))*(y(44)-y(111));
residual(14)= lhs-rhs;
lhs =T187+(params(39)+(params(40)-params(39))*params(41))*y(53)+(params(40)-params(39))*(1-params(41))*y(54);
rhs =y(55);
residual(15)= lhs-rhs;
lhs =T187+y(54)*(params(39)+(params(40)-params(39))*(1-params(41)))+(params(40)-params(39))*params(41)*y(53);
rhs =y(56);
residual(16)= lhs-rhs;
lhs =y(58);
rhs =y(57)-y(9);
residual(17)= lhs-rhs;
lhs =y(39)-T252+params(36)*(y(59)-y(10));
rhs =y(60)+params(36)*params(43)*(y(114)-y(59));
residual(18)= lhs-rhs;
lhs =(1-(1-params(38))*params(43))*(y(67)-y(61));
rhs =y(60)-(1-params(38))*params(43)*y(115);
residual(19)= lhs-rhs;
lhs =params(35)*y(58);
rhs =y(113)-(1-params(35))*(y(64)-y(111));
residual(20)= lhs-rhs;
lhs =T252+(params(39)+(params(40)-params(39))*params(41))*y(62)+(params(40)-params(39))*(1-params(41))*y(63);
rhs =y(55);
residual(21)= lhs-rhs;
lhs =T252+(params(39)+(params(40)-params(39))*(1-params(41)))*y(63)+(params(40)-params(39))*params(41)*y(62);
rhs =y(56);
residual(22)= lhs-rhs;
lhs =y(57)*params(44)+params(45)*(y(39)+y(59))+params(46)*params(47)*(y(12)+y(13)-y(47));
rhs =params(47)*y(65)+params(41)*params(48)*params(49)*(y(55)+y(62))+params(49)*(1-params(41))*params(48)*(y(56)+y(63));
residual(23)= lhs-rhs;
lhs =y(64);
rhs =y(44)+params(50)*(y(65)-y(61)-y(39))-y(68)+params(66)*(y(4)+y(13)-y(38));
residual(24)= lhs-rhs;
lhs =y(46);
rhs =y(47)*params(42)+y(52)*(1-params(42));
residual(25)= lhs-rhs;
lhs =y(73);
rhs =y(66)+y(69);
residual(26)= lhs-rhs;
lhs =y(74);
rhs =y(70);
residual(27)= lhs-rhs;
lhs =y(47)-y(4)*params(53);
rhs =params(37)*(y(111)-y(47)*params(53))+params(51)*(y(55)-y(66));
residual(28)= lhs-rhs;
lhs =y(52)-params(54)*y(8);
rhs =params(37)*(y(112)-y(52)*params(54))+params(52)*(y(56)-y(39));
residual(29)= lhs-rhs;
lhs =y(73);
rhs =(y(40)*params(55)*params(58)+y(57)*params(44)*(1-params(55)))/(params(55)*params(58)+params(44)*(1-params(55)));
residual(30)= lhs-rhs;
lhs =y(74);
rhs =(y(41)*params(38)*params(55)*params(59)+y(59)*params(38)*(1-params(55))*params(60))/(params(38)*params(55)*params(59)+params(38)*(1-params(55))*params(60));
residual(31)= lhs-rhs;
lhs =y(43);
rhs =(1-params(38))*y(3)+y(41)*params(38);
residual(32)= lhs-rhs;
lhs =y(61);
rhs =(1-params(38))*y(11)+params(38)*y(59);
residual(33)= lhs-rhs;
lhs =y(69);
rhs =(y(53)*params(55)*params(61)+y(62)*params(49)*(1-params(55)))/(params(49)*(1-params(55))+params(42)*params(61));
residual(34)= lhs-rhs;
lhs =y(70);
rhs =(y(54)*params(55)*params(61)+y(63)*params(49)*(1-params(55)))/(params(49)*(1-params(55))+params(42)*params(61));
residual(35)= lhs-rhs;
residual(36) = params(55)*y(48)+y(65)*(1-params(55));
lhs =y(78);
rhs =y(47)+y(65)-y(13);
residual(37)= lhs-rhs;
lhs =y(71);
rhs =params(41)*y(73)+(1-params(41))*y(74);
residual(38)= lhs-rhs;
lhs =y(72);
rhs =params(41)*y(75)+(1-params(41))*y(76);
residual(39)= lhs-rhs;
lhs =y(75);
rhs =0.326667*y(14)+0.6666666666666666*y(17)+0.3333333333333333*x(it_, 1);
residual(40)= lhs-rhs;
lhs =y(76);
rhs =(-0.344897)*y(19)+0.24879*y(15)+0.2653*y(18)+0.26188*x(it_, 2);
residual(41)= lhs-rhs;
lhs =y(77);
rhs =(1-params(38))*y(19)+params(38)*y(76);
residual(42)= lhs-rhs;
lhs =y(66);
rhs =x(it_, 1)+y(14)*params(67);
residual(43)= lhs-rhs;
lhs =y(67);
rhs =x(it_, 2)+y(15)*params(68);
residual(44)= lhs-rhs;
lhs =y(68);
rhs =params(69)*y(16)+x(it_, 3);
residual(45)= lhs-rhs;
lhs =y(84);
rhs =y(116);
residual(46)= lhs-rhs;
lhs =y(85);
rhs =y(119);
residual(47)= lhs-rhs;
lhs =y(86);
rhs =y(120);
residual(48)= lhs-rhs;
lhs =y(87);
rhs =y(118);
residual(49)= lhs-rhs;
lhs =y(88);
rhs =y(122);
residual(50)= lhs-rhs;
lhs =y(89);
rhs =y(123);
residual(51)= lhs-rhs;
lhs =y(90);
rhs =y(117);
residual(52)= lhs-rhs;
lhs =y(91);
rhs =y(125);
residual(53)= lhs-rhs;
lhs =y(92);
rhs =y(126);
residual(54)= lhs-rhs;
lhs =y(93);
rhs =y(4);
residual(55)= lhs-rhs;
lhs =y(94);
rhs =y(24);
residual(56)= lhs-rhs;
lhs =y(95);
rhs =y(22);
residual(57)= lhs-rhs;
lhs =y(96);
rhs =y(26);
residual(58)= lhs-rhs;
lhs =y(97);
rhs =y(27);
residual(59)= lhs-rhs;
lhs =y(98);
rhs =y(23);
residual(60)= lhs-rhs;
lhs =y(99);
rhs =y(29);
residual(61)= lhs-rhs;
lhs =y(100);
rhs =y(30);
residual(62)= lhs-rhs;
lhs =y(101);
rhs =y(20);
residual(63)= lhs-rhs;
lhs =y(102);
rhs =y(32);
residual(64)= lhs-rhs;
lhs =y(103);
rhs =y(33);
residual(65)= lhs-rhs;
lhs =y(104);
rhs =y(21);
residual(66)= lhs-rhs;
lhs =y(105);
rhs =y(35);
residual(67)= lhs-rhs;
lhs =y(106);
rhs =y(36);
residual(68)= lhs-rhs;
lhs =y(107);
rhs =y(13);
residual(69)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(69, 131);

  %
  % Jacobian matrix
  %

T3 = (-1);
T651 = (-params(35))/(1-params(35));
T653 = 1/(1-params(35));
  g1(1,44)=(-4);
  g1(1,79)=1;
  g1(2,4)=T3;
  g1(2,47)=T3;
  g1(2,80)=1;
  g1(2,24)=T3;
  g1(2,25)=T3;
  g1(3,47)=(-4);
  g1(3,81)=1;
  g1(4,71)=T3;
  g1(4,82)=1;
  g1(5,71)=T3;
  g1(5,72)=1;
  g1(5,83)=1;
  g1(6,20)=(-params(1));
  g1(6,79)=1;
  g1(6,21)=(-params(6));
  g1(6,81)=(-params(5));
  g1(6,116)=(-params(10));
  g1(6,22)=(-params(24));
  g1(6,82)=(-params(23));
  g1(6,117)=(-params(28));
  g1(6,23)=(-params(15));
  g1(6,83)=(-params(14));
  g1(6,118)=(-params(19));
  g1(6,131)=(-params(32));
  g1(6,119)=(-params(11));
  g1(6,120)=(-params(12));
  g1(6,121)=(-params(13));
  g1(6,122)=(-params(20));
  g1(6,123)=(-params(21));
  g1(6,124)=(-params(22));
  g1(6,125)=(-params(29));
  g1(6,126)=(-params(30));
  g1(6,127)=(-params(31));
  g1(6,26)=(-params(25));
  g1(6,27)=(-params(26));
  g1(6,28)=(-params(27));
  g1(6,29)=(-params(16));
  g1(6,30)=(-params(17));
  g1(6,31)=(-params(18));
  g1(6,32)=(-params(2));
  g1(6,33)=(-params(3));
  g1(6,34)=(-params(4));
  g1(6,35)=(-params(7));
  g1(6,36)=(-params(8));
  g1(6,37)=(-params(9));
  g1(7,39)=1;
  g1(7,50)=1;
  g1(7,51)=T3;
  g1(8,1)=1;
  g1(8,40)=T3;
  g1(8,45)=1;
  g1(9,46)=1;
  g1(9,5)=1;
  g1(9,49)=T3;
  g1(10,47)=1;
  g1(10,6)=1;
  g1(10,50)=T3;
  g1(11,7)=1;
  g1(11,51)=T3;
  g1(11,52)=1;
  g1(12,39)=1;
  g1(12,1)=(-T651);
  g1(12,40)=(-T653);
  g1(12,2)=(-params(36));
  g1(12,41)=params(36)-(-(params(36)*params(37)));
  g1(12,108)=(-(params(36)*params(37)));
  g1(12,42)=T3;
  g1(13,42)=T3;
  g1(13,109)=params(37)*(1-params(38));
  g1(13,43)=(-(1-params(37)*(1-params(38))));
  g1(13,67)=1-params(37)*(1-params(38));
  g1(14,44)=1-params(35);
  g1(14,45)=params(35);
  g1(14,110)=T3;
  g1(14,111)=(-(1-params(35)));
  g1(15,1)=T651;
  g1(15,40)=T653;
  g1(15,53)=params(39)+(params(40)-params(39))*params(41);
  g1(15,54)=(params(40)-params(39))*(1-params(41));
  g1(15,55)=T3;
  g1(16,1)=T651;
  g1(16,40)=T653;
  g1(16,53)=(params(40)-params(39))*params(41);
  g1(16,54)=params(39)+(params(40)-params(39))*(1-params(41));
  g1(16,56)=T3;
  g1(17,9)=1;
  g1(17,57)=T3;
  g1(17,58)=1;
  g1(18,39)=1;
  g1(18,9)=(-T651);
  g1(18,57)=(-T653);
  g1(18,10)=(-params(36));
  g1(18,59)=params(36)-(-(params(36)*params(43)));
  g1(18,114)=(-(params(36)*params(43)));
  g1(18,60)=T3;
  g1(19,60)=T3;
  g1(19,115)=(1-params(38))*params(43);
  g1(19,61)=(-(1-(1-params(38))*params(43)));
  g1(19,67)=1-(1-params(38))*params(43);
  g1(20,111)=(-(1-params(35)));
  g1(20,58)=params(35);
  g1(20,113)=T3;
  g1(20,64)=1-params(35);
  g1(21,55)=T3;
  g1(21,9)=T651;
  g1(21,57)=T653;
  g1(21,62)=params(39)+(params(40)-params(39))*params(41);
  g1(21,63)=(params(40)-params(39))*(1-params(41));
  g1(22,56)=T3;
  g1(22,9)=T651;
  g1(22,57)=T653;
  g1(22,62)=(params(40)-params(39))*params(41);
  g1(22,63)=params(39)+(params(40)-params(39))*(1-params(41));
  g1(23,39)=params(45);
  g1(23,47)=(-(params(46)*params(47)));
  g1(23,55)=(-(params(41)*params(48)*params(49)));
  g1(23,56)=(-(params(49)*(1-params(41))*params(48)));
  g1(23,57)=params(44);
  g1(23,59)=params(45);
  g1(23,62)=(-(params(41)*params(48)*params(49)));
  g1(23,63)=(-(params(49)*(1-params(41))*params(48)));
  g1(23,12)=params(46)*params(47);
  g1(23,13)=params(46)*params(47);
  g1(23,65)=(-params(47));
  g1(24,39)=params(50);
  g1(24,44)=T3;
  g1(24,4)=(-params(66));
  g1(24,61)=params(50);
  g1(24,64)=1;
  g1(24,13)=(-params(66));
  g1(24,65)=(-params(50));
  g1(24,68)=1;
  g1(24,38)=params(66);
  g1(25,46)=1;
  g1(25,47)=(-params(42));
  g1(25,52)=(-(1-params(42)));
  g1(26,66)=T3;
  g1(26,69)=T3;
  g1(26,73)=1;
  g1(27,70)=T3;
  g1(27,74)=1;
  g1(28,4)=(-params(53));
  g1(28,47)=1-params(37)*(-params(53));
  g1(28,111)=(-params(37));
  g1(28,55)=(-params(51));
  g1(28,66)=params(51);
  g1(29,39)=params(52);
  g1(29,8)=(-params(54));
  g1(29,52)=1-params(37)*(-params(54));
  g1(29,112)=(-params(37));
  g1(29,56)=(-params(52));
  g1(30,40)=(-(params(55)*params(58)/(params(55)*params(58)+params(44)*(1-params(55)))));
  g1(30,57)=(-(params(44)*(1-params(55))/(params(55)*params(58)+params(44)*(1-params(55)))));
  g1(30,73)=1;
  g1(31,41)=(-(params(38)*params(55)*params(59)/(params(38)*params(55)*params(59)+params(38)*(1-params(55))*params(60))));
  g1(31,59)=(-(params(38)*(1-params(55))*params(60)/(params(38)*params(55)*params(59)+params(38)*(1-params(55))*params(60))));
  g1(31,74)=1;
  g1(32,41)=(-params(38));
  g1(32,3)=(-(1-params(38)));
  g1(32,43)=1;
  g1(33,59)=(-params(38));
  g1(33,11)=(-(1-params(38)));
  g1(33,61)=1;
  g1(34,53)=(-(params(55)*params(61)/(params(49)*(1-params(55))+params(42)*params(61))));
  g1(34,62)=(-(params(49)*(1-params(55))/(params(49)*(1-params(55))+params(42)*params(61))));
  g1(34,69)=1;
  g1(35,54)=(-(params(55)*params(61)/(params(49)*(1-params(55))+params(42)*params(61))));
  g1(35,63)=(-(params(49)*(1-params(55))/(params(49)*(1-params(55))+params(42)*params(61))));
  g1(35,70)=1;
  g1(36,48)=params(55);
  g1(36,65)=1-params(55);
  g1(37,47)=T3;
  g1(37,13)=1;
  g1(37,65)=T3;
  g1(37,78)=1;
  g1(38,71)=1;
  g1(38,73)=(-params(41));
  g1(38,74)=(-(1-params(41)));
  g1(39,72)=1;
  g1(39,75)=(-params(41));
  g1(39,76)=(-(1-params(41)));
  g1(40,14)=(-0.326667);
  g1(40,17)=(-0.6666666666666666);
  g1(40,75)=1;
  g1(40,128)=(-0.3333333333333333);
  g1(41,15)=(-0.24879);
  g1(41,18)=(-0.2653);
  g1(41,76)=1;
  g1(41,19)=0.344897;
  g1(41,129)=(-0.26188);
  g1(42,76)=(-params(38));
  g1(42,19)=(-(1-params(38)));
  g1(42,77)=1;
  g1(43,14)=(-params(67));
  g1(43,66)=1;
  g1(43,128)=T3;
  g1(44,15)=(-params(68));
  g1(44,67)=1;
  g1(44,129)=T3;
  g1(45,16)=(-params(69));
  g1(45,68)=1;
  g1(45,130)=T3;
  g1(46,116)=T3;
  g1(46,84)=1;
  g1(47,119)=T3;
  g1(47,85)=1;
  g1(48,120)=T3;
  g1(48,86)=1;
  g1(49,118)=T3;
  g1(49,87)=1;
  g1(50,122)=T3;
  g1(50,88)=1;
  g1(51,123)=T3;
  g1(51,89)=1;
  g1(52,117)=T3;
  g1(52,90)=1;
  g1(53,125)=T3;
  g1(53,91)=1;
  g1(54,126)=T3;
  g1(54,92)=1;
  g1(55,4)=T3;
  g1(55,93)=1;
  g1(56,24)=T3;
  g1(56,94)=1;
  g1(57,22)=T3;
  g1(57,95)=1;
  g1(58,26)=T3;
  g1(58,96)=1;
  g1(59,27)=T3;
  g1(59,97)=1;
  g1(60,23)=T3;
  g1(60,98)=1;
  g1(61,29)=T3;
  g1(61,99)=1;
  g1(62,30)=T3;
  g1(62,100)=1;
  g1(63,20)=T3;
  g1(63,101)=1;
  g1(64,32)=T3;
  g1(64,102)=1;
  g1(65,33)=T3;
  g1(65,103)=1;
  g1(66,21)=T3;
  g1(66,104)=1;
  g1(67,35)=T3;
  g1(67,105)=1;
  g1(68,36)=T3;
  g1(68,106)=1;
  g1(69,13)=T3;
  g1(69,107)=1;

if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],69,17161);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],69,2248091);
end
end
end
end
