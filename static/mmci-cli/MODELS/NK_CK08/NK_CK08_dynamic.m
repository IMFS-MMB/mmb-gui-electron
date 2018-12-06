function [residual, g1, g2, g3] = NK_CK08_dynamic(y, x, params, steady_state, it_)
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

residual = zeros(55, 1);
T197 = 1/(1+params(41)*params(35))*(1-params(40))*(1-params(35)*params(40))/params(40);
T270 = (-params(47))/(1-params(47));
T272 = 1/(1-params(47));
T274 = y(45)*T270+(y(47)+y(52))*T272;
T298 = params(67)*T272*params(71);
T305 = (1+params(39))/(1-params(47));
T310 = params(44)*params(35)*(1-params(46))/(1-params(44)*params(35)*(1-params(46)));
T320 = T310*(params(67)*params(77)*(params(47)/(1-params(47)))^2-params(67)*params(71)*(1+params(39))/(1-params(47))^2);
T356 = params(67)*params(71)/(1+params(39));
T366 = params(47)*params(77)*params(67)/(1-params(47))-T298;
T374 = T366*params(35)*params(44)*params(74)/(1-params(44)*params(35)*(1-params(46)));
T398 = params(67)*params(77)*params(35)*params(44)/(1-params(44)*params(35)*(1-params(46)));
lhs =y(54);
rhs =4*y(41);
residual(1)= lhs-rhs;
lhs =y(55);
rhs =y(39);
residual(2)= lhs-rhs;
lhs =y(56);
rhs =4*y(38);
residual(3)= lhs-rhs;
lhs =y(57);
rhs =y(48);
residual(4)= lhs-rhs;
lhs =y(58);
rhs =y(48);
residual(5)= lhs-rhs;
lhs =y(59);
rhs =y(53);
residual(6)= lhs-rhs;
lhs =y(54);
rhs =params(32)*x(it_, 3)+params(31)*y(101)+params(30)*y(100)+params(29)*y(99)+params(28)*y(92)+params(27)*y(16)+params(26)*y(15)+params(25)*y(14)+params(24)*y(13)+y(58)*params(23)+params(22)*y(98)+params(21)*y(97)+params(20)*y(96)+params(19)*y(91)+params(18)*y(19)+params(17)*y(18)+params(16)*y(17)+params(15)*y(12)+y(57)*params(14)+params(13)*y(95)+params(12)*y(94)+params(11)*y(93)+params(10)*y(90)+params(6)*y(11)+y(56)*params(5)+params(1)*y(10)+params(2)*y(20)+params(3)*y(21)+params(4)*y(22)+params(7)*y(23)+params(8)*y(24)+params(9)*y(25);
residual(7)= lhs-rhs;
lhs =y(59);
rhs =params(34)*x(it_, 4);
residual(8)= lhs-rhs;
lhs =y(34);
rhs =y(41)+y(87)+y(49)-y(88);
residual(9)= lhs-rhs;
lhs =y(34);
rhs =(-params(38))/(1-params(37))*(y(28)-params(37)*y(1));
residual(10)= lhs-rhs;
lhs =y(38);
rhs =params(41)/(1+params(41)*params(35))*y(4)+y(88)*params(35)/(1+params(41)*params(35))+T197*y(35);
residual(11)= lhs-rhs;
lhs =y(35);
rhs =y(47);
residual(12)= lhs-rhs;
lhs =y(36);
rhs =params(42)*y(43)+(1-params(42))*y(44);
residual(13)= lhs-rhs;
lhs =y(37);
rhs =(1-params(46))*y(3)+params(69)/params(72)*y(2);
residual(14)= lhs-rhs;
lhs =y(37);
rhs =y(43)*(-params(75))/(1-params(75));
residual(15)= lhs-rhs;
lhs =y(40);
rhs =y(36)-y(44);
residual(16)= lhs-rhs;
lhs =y(42);
rhs =y(36)-y(43);
residual(17)= lhs-rhs;
lhs =y(33)+y(30);
rhs =y(31)+y(29);
residual(18)= lhs-rhs;
lhs =y(46);
rhs =y(47)+y(52)+(params(47)-1)*y(32);
residual(19)= lhs-rhs;
lhs =y(46);
rhs =params(44)*(y(5)-y(38)+y(4)*params(45))+(1-params(44))*y(45);
residual(20)= lhs-rhs;
lhs =y(29);
rhs =(1-params(44)*params(35)*(1-params(46)))*T274+params(44)*params(35)*(1-params(46))*(y(87)+T270*(y(45)+y(38)*params(45)-y(89)-y(88))+y(83)-y(34));
residual(21)= lhs-rhs;
lhs =y(30)*params(65);
rhs =T274*T270*params(77)*params(67)+T298*(y(45)*(-(1+params(39)))/(1-params(47))-y(34)+(y(47)+y(52))*T305)+(y(45)+y(38)*params(45)-y(89)-y(88))*T320+params(44)*params(35)*(1-params(46))*params(65)*(y(87)-y(34)+y(84));
residual(22)= lhs-rhs;
lhs =y(33)*params(68);
rhs =params(77)*params(67)/params(47)*(y(52)+y(47)+y(45)*(-params(47)))+params(67)*params(77)*T310*(y(88)+y(89)-y(45)-y(38)*params(45))+params(35)*(1-params(46))*params(68)*(y(87)-y(34)+y(86));
residual(23)= lhs-rhs;
lhs =y(31)*params(64);
rhs =params(64)*params(35)*(1-params(46)-params(74))*(y(87)-y(34)+y(85))+(y(88)+y(89)-y(45)-y(38)*params(45))*T310*T366+(y(52)+y(47)+y(45)*(-params(47)))*params(77)*params(67)/(1-params(47))-T356*(T305*(y(52)+y(47)-y(45))-y(34))-T374*(y(88)+y(89)-y(46)-y(38)*params(45))-y(42)*params(74)*params(35)*params(64);
residual(24)= lhs-rhs;
lhs =params(59)/params(73)*(-y(40));
rhs =T398*(y(88)+y(89)-y(46)-y(38)*params(45))+(y(87)-y(34)+y(86))*params(35)*params(68);
residual(25)= lhs-rhs;
lhs =y(48)*params(78);
rhs =y(28)*params(63)+params(66)*y(51)+y(44)*params(59)*params(76)+y(37)*params(72)*params(60);
residual(26)= lhs-rhs;
lhs =y(48);
rhs =y(37)+y(52)+params(47)*y(32);
residual(27)= lhs-rhs;
lhs =y(39);
rhs =y(38)+y(4)+y(26)+y(27);
residual(28)= lhs-rhs;
lhs =y(49);
rhs =params(48)*y(6)+params(55)*x(it_, 1);
residual(29)= lhs-rhs;
lhs =y(51);
rhs =y(53)+params(50)*y(8);
residual(30)= lhs-rhs;
lhs =y(50);
rhs =params(49)*y(7)+x(it_, 3)*params(56);
residual(31)= lhs-rhs;
lhs =y(52);
rhs =params(51)*y(9)+params(58)*x(it_, 2);
residual(32)= lhs-rhs;
lhs =y(60);
rhs =y(90);
residual(33)= lhs-rhs;
lhs =y(61);
rhs =y(93);
residual(34)= lhs-rhs;
lhs =y(62);
rhs =y(94);
residual(35)= lhs-rhs;
lhs =y(63);
rhs =y(91);
residual(36)= lhs-rhs;
lhs =y(64);
rhs =y(96);
residual(37)= lhs-rhs;
lhs =y(65);
rhs =y(97);
residual(38)= lhs-rhs;
lhs =y(66);
rhs =y(92);
residual(39)= lhs-rhs;
lhs =y(67);
rhs =y(99);
residual(40)= lhs-rhs;
lhs =y(68);
rhs =y(100);
residual(41)= lhs-rhs;
lhs =y(69);
rhs =y(13);
residual(42)= lhs-rhs;
lhs =y(70);
rhs =y(14);
residual(43)= lhs-rhs;
lhs =y(71);
rhs =y(15);
residual(44)= lhs-rhs;
lhs =y(72);
rhs =y(12);
residual(45)= lhs-rhs;
lhs =y(73);
rhs =y(17);
residual(46)= lhs-rhs;
lhs =y(74);
rhs =y(18);
residual(47)= lhs-rhs;
lhs =y(75);
rhs =y(10);
residual(48)= lhs-rhs;
lhs =y(76);
rhs =y(20);
residual(49)= lhs-rhs;
lhs =y(77);
rhs =y(21);
residual(50)= lhs-rhs;
lhs =y(78);
rhs =y(11);
residual(51)= lhs-rhs;
lhs =y(79);
rhs =y(23);
residual(52)= lhs-rhs;
lhs =y(80);
rhs =y(24);
residual(53)= lhs-rhs;
lhs =y(81);
rhs =y(4);
residual(54)= lhs-rhs;
lhs =y(82);
rhs =y(26);
residual(55)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(55, 105);

  %
  % Jacobian matrix
  %

  g1(1,41)=(-4);
  g1(1,54)=1;
  g1(2,39)=(-1);
  g1(2,55)=1;
  g1(3,38)=(-4);
  g1(3,56)=1;
  g1(4,48)=(-1);
  g1(4,57)=1;
  g1(5,48)=(-1);
  g1(5,58)=1;
  g1(6,53)=(-1);
  g1(6,59)=1;
  g1(7,10)=(-params(1));
  g1(7,54)=1;
  g1(7,11)=(-params(6));
  g1(7,56)=(-params(5));
  g1(7,90)=(-params(10));
  g1(7,12)=(-params(15));
  g1(7,57)=(-params(14));
  g1(7,91)=(-params(19));
  g1(7,13)=(-params(24));
  g1(7,58)=(-params(23));
  g1(7,92)=(-params(28));
  g1(7,104)=(-params(32));
  g1(7,93)=(-params(11));
  g1(7,94)=(-params(12));
  g1(7,95)=(-params(13));
  g1(7,96)=(-params(20));
  g1(7,97)=(-params(21));
  g1(7,98)=(-params(22));
  g1(7,99)=(-params(29));
  g1(7,100)=(-params(30));
  g1(7,101)=(-params(31));
  g1(7,14)=(-params(25));
  g1(7,15)=(-params(26));
  g1(7,16)=(-params(27));
  g1(7,17)=(-params(16));
  g1(7,18)=(-params(17));
  g1(7,19)=(-params(18));
  g1(7,20)=(-params(2));
  g1(7,21)=(-params(3));
  g1(7,22)=(-params(4));
  g1(7,23)=(-params(7));
  g1(7,24)=(-params(8));
  g1(7,25)=(-params(9));
  g1(8,59)=1;
  g1(8,105)=(-params(34));
  g1(9,34)=1;
  g1(9,87)=(-1);
  g1(9,88)=1;
  g1(9,41)=(-1);
  g1(9,49)=(-1);
  g1(10,1)=(-((-params(38))/(1-params(37))*(-params(37))));
  g1(10,28)=(-((-params(38))/(1-params(37))));
  g1(10,34)=1;
  g1(11,35)=(-T197);
  g1(11,4)=(-(params(41)/(1+params(41)*params(35))));
  g1(11,38)=1;
  g1(11,88)=(-(params(35)/(1+params(41)*params(35))));
  g1(12,35)=1;
  g1(12,47)=(-1);
  g1(13,36)=1;
  g1(13,43)=(-params(42));
  g1(13,44)=(-(1-params(42)));
  g1(14,2)=(-(params(69)/params(72)));
  g1(14,3)=(-(1-params(46)));
  g1(14,37)=1;
  g1(15,37)=1;
  g1(15,43)=(-((-params(75))/(1-params(75))));
  g1(16,36)=(-1);
  g1(16,40)=1;
  g1(16,44)=1;
  g1(17,36)=(-1);
  g1(17,42)=1;
  g1(17,43)=1;
  g1(18,29)=(-1);
  g1(18,30)=1;
  g1(18,31)=(-1);
  g1(18,33)=1;
  g1(19,32)=(-(params(47)-1));
  g1(19,46)=1;
  g1(19,47)=(-1);
  g1(19,52)=(-1);
  g1(20,4)=(-(params(44)*params(45)));
  g1(20,38)=params(44);
  g1(20,45)=(-(1-params(44)));
  g1(20,5)=(-params(44));
  g1(20,46)=1;
  g1(21,29)=1;
  g1(21,83)=(-(params(44)*params(35)*(1-params(46))));
  g1(21,34)=params(44)*params(35)*(1-params(46));
  g1(21,87)=(-(params(44)*params(35)*(1-params(46))));
  g1(21,38)=(-(params(44)*params(35)*(1-params(46))*params(45)*T270));
  g1(21,88)=(-(params(44)*params(35)*(1-params(46))*(-T270)));
  g1(21,45)=(-((1-params(44)*params(35)*(1-params(46)))*T270+params(44)*params(35)*(1-params(46))*T270));
  g1(21,89)=(-(params(44)*params(35)*(1-params(46))*(-T270)));
  g1(21,47)=(-((1-params(44)*params(35)*(1-params(46)))*T272));
  g1(21,52)=(-((1-params(44)*params(35)*(1-params(46)))*T272));
  g1(22,30)=params(65);
  g1(22,84)=(-(params(44)*params(35)*(1-params(46))*params(65)));
  g1(22,34)=(-((-T298)-params(44)*params(35)*(1-params(46))*params(65)));
  g1(22,87)=(-(params(44)*params(35)*(1-params(46))*params(65)));
  g1(22,38)=(-(params(45)*T320));
  g1(22,88)=T320;
  g1(22,45)=(-(T320+T270*T270*params(77)*params(67)+T298*(-(1+params(39)))/(1-params(47))));
  g1(22,89)=T320;
  g1(22,47)=(-(T272*T270*params(77)*params(67)+T298*T305));
  g1(22,52)=(-(T272*T270*params(77)*params(67)+T298*T305));
  g1(23,33)=params(68);
  g1(23,86)=(-(params(35)*(1-params(46))*params(68)));
  g1(23,34)=params(35)*(1-params(46))*params(68);
  g1(23,87)=(-(params(35)*(1-params(46))*params(68)));
  g1(23,38)=(-(params(67)*params(77)*T310*(-params(45))));
  g1(23,88)=(-(params(67)*params(77)*T310));
  g1(23,45)=(-((-params(47))*params(77)*params(67)/params(47)-params(67)*params(77)*T310));
  g1(23,89)=(-(params(67)*params(77)*T310));
  g1(23,47)=(-(params(77)*params(67)/params(47)));
  g1(23,52)=(-(params(77)*params(67)/params(47)));
  g1(24,31)=params(64);
  g1(24,85)=(-(params(64)*params(35)*(1-params(46)-params(74))));
  g1(24,34)=(-(T356+(-(params(64)*params(35)*(1-params(46)-params(74))))));
  g1(24,87)=(-(params(64)*params(35)*(1-params(46)-params(74))));
  g1(24,38)=(-(T310*T366*(-params(45))-T374*(-params(45))));
  g1(24,88)=(-(T310*T366-T374));
  g1(24,42)=params(74)*params(35)*params(64);
  g1(24,45)=(-((-(T310*T366))+(-params(47))*params(77)*params(67)/(1-params(47))-T356*(-T305)));
  g1(24,89)=(-(T310*T366-T374));
  g1(24,46)=(-T374);
  g1(24,47)=(-(params(77)*params(67)/(1-params(47))-T305*T356));
  g1(24,52)=(-(params(77)*params(67)/(1-params(47))-T305*T356));
  g1(25,86)=(-(params(35)*params(68)));
  g1(25,34)=params(35)*params(68);
  g1(25,87)=(-(params(35)*params(68)));
  g1(25,38)=(-(T398*(-params(45))));
  g1(25,88)=(-T398);
  g1(25,40)=(-(params(59)/params(73)));
  g1(25,89)=(-T398);
  g1(25,46)=T398;
  g1(26,28)=(-params(63));
  g1(26,37)=(-(params(72)*params(60)));
  g1(26,44)=(-(params(59)*params(76)));
  g1(26,48)=params(78);
  g1(26,51)=(-params(66));
  g1(27,32)=(-params(47));
  g1(27,37)=(-1);
  g1(27,48)=1;
  g1(27,52)=(-1);
  g1(28,4)=(-1);
  g1(28,38)=(-1);
  g1(28,39)=1;
  g1(28,26)=(-1);
  g1(28,27)=(-1);
  g1(29,6)=(-params(48));
  g1(29,49)=1;
  g1(29,102)=(-params(55));
  g1(30,8)=(-params(50));
  g1(30,51)=1;
  g1(30,53)=(-1);
  g1(31,7)=(-params(49));
  g1(31,50)=1;
  g1(31,104)=(-params(56));
  g1(32,9)=(-params(51));
  g1(32,52)=1;
  g1(32,103)=(-params(58));
  g1(33,90)=(-1);
  g1(33,60)=1;
  g1(34,93)=(-1);
  g1(34,61)=1;
  g1(35,94)=(-1);
  g1(35,62)=1;
  g1(36,91)=(-1);
  g1(36,63)=1;
  g1(37,96)=(-1);
  g1(37,64)=1;
  g1(38,97)=(-1);
  g1(38,65)=1;
  g1(39,92)=(-1);
  g1(39,66)=1;
  g1(40,99)=(-1);
  g1(40,67)=1;
  g1(41,100)=(-1);
  g1(41,68)=1;
  g1(42,13)=(-1);
  g1(42,69)=1;
  g1(43,14)=(-1);
  g1(43,70)=1;
  g1(44,15)=(-1);
  g1(44,71)=1;
  g1(45,12)=(-1);
  g1(45,72)=1;
  g1(46,17)=(-1);
  g1(46,73)=1;
  g1(47,18)=(-1);
  g1(47,74)=1;
  g1(48,10)=(-1);
  g1(48,75)=1;
  g1(49,20)=(-1);
  g1(49,76)=1;
  g1(50,21)=(-1);
  g1(50,77)=1;
  g1(51,11)=(-1);
  g1(51,78)=1;
  g1(52,23)=(-1);
  g1(52,79)=1;
  g1(53,24)=(-1);
  g1(53,80)=1;
  g1(54,4)=(-1);
  g1(54,81)=1;
  g1(55,26)=(-1);
  g1(55,82)=1;

if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],55,11025);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],55,1157625);
end
end
end
end
