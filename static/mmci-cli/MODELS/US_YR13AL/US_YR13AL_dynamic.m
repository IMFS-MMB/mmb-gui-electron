function [residual, g1, g2, g3] = US_YR13AL_dynamic(y, x, params, steady_state, it_)
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

residual = zeros(39, 1);
T111 = 1/(params(42)/(1-params(42)));
T127 = 1/(1+params(87)*params(85));
T132 = params(85)^2;
T145 = params(47)/params(85);
T159 = (params(46)-1)*params(99)/((1+T145)*params(46));
T165 = (1-T145)/((1+T145)*params(46));
T197 = params(65)*params(96)/params(93)*(1-params(88)/params(65))*(1-1/params(64));
T214 = 1/(1+params(87)*params(85)*params(53));
T229 = (1-params(54))*(1-params(87)*params(85)*params(54))/params(54)/(1+(params(50)-1)*params(37));
T238 = params(87)*params(85)/(1+params(87)*params(85));
T266 = (1-params(52))*(1-params(87)*params(85)*params(52))/((1+params(87)*params(85))*params(52))*1/(1+(params(56)-1)*params(35));
lhs =y(51);
rhs =y(36)*4;
residual(1)= lhs-rhs;
lhs =y(52);
rhs =y(49);
residual(2)= lhs-rhs;
lhs =y(53);
rhs =4*y(34);
residual(3)= lhs-rhs;
lhs =y(57);
rhs =y(32)-params(50)*y(37);
residual(4)= lhs-rhs;
lhs =y(58);
rhs =y(32);
residual(5)= lhs-rhs;
lhs =y(59);
rhs =y(50);
residual(6)= lhs-rhs;
lhs =y(54);
rhs =y(18);
residual(7)= lhs-rhs;
lhs =y(55);
rhs =y(19);
residual(8)= lhs-rhs;
lhs =y(56);
rhs =y(54)+y(55);
residual(9)= lhs-rhs;
lhs =y(60);
rhs =y(23)+y(24);
residual(10)= lhs-rhs;
lhs =y(61);
rhs =y(23)+y(24);
residual(11)= lhs-rhs;
lhs =y(51);
rhs =params(1)*y(17)+y(53)*params(5)+y(18)*params(6)+y(19)*params(7)+params(8)*y(20)+params(10)*y(69)+y(57)*params(14)+params(15)*y(21)+y(58)*params(23)+params(24)*y(22)+params(32)*x(it_, 6);
residual(12)= lhs-rhs;
lhs =y(59);
rhs =params(34)*x(it_, 7);
residual(13)= lhs-rhs;
lhs =y(49);
rhs =0.25*(y(20)+y(55)+y(53)+y(54));
residual(14)= lhs-rhs;
lhs =y(25);
rhs =params(41)*y(27)+(1-params(41))*y(35)-y(37);
residual(15)= lhs-rhs;
lhs =y(26);
rhs =y(27)*T111;
residual(16)= lhs-rhs;
lhs =y(27);
rhs =y(35)+y(33)-y(28);
residual(17)= lhs-rhs;
lhs =y(28);
rhs =y(26)+y(14);
residual(18)= lhs-rhs;
lhs =y(31);
rhs =T127*(y(5)+params(87)*params(85)*y(65)+1/(T132*params(44))*y(29))+y(40);
residual(19)= lhs-rhs;
lhs =y(30);
rhs =T145/(1+T145)*y(4)+1/(1+T145)*y(64)+T159*(y(33)-y(66))-T165*(y(36)-y(67)+y(38));
residual(20)= lhs-rhs;
lhs =y(32);
rhs =y(30)*params(97)+y(31)*params(96)+y(39)+y(26)*(params(65)-1+params(45))*params(96)/params(93)+T197*(y(28)+y(44)+y(3));
residual(21)= lhs-rhs;
lhs =y(32);
rhs =params(50)*(y(37)+params(41)*y(28)+(1-params(41))*y(33));
residual(22)= lhs-rhs;
lhs =y(34);
rhs =T214*(params(87)*params(85)*y(67)+params(53)*y(6)+y(25)*T229)+y(41);
residual(23)= lhs-rhs;
lhs =y(35);
rhs =T127*y(7)+T238*y(68)+y(6)*params(51)/(1+params(87)*params(85))-y(34)*(1+params(87)*params(85)*params(51))/(1+params(87)*params(85))+y(67)*T238+T266*(y(33)*params(55)+y(30)*1/(1-T145)-y(4)*T145/(1-T145)-y(35))+y(42);
residual(24)= lhs-rhs;
lhs =y(43);
rhs =y(14)*(1-params(92))+y(31)*params(92)+y(40)*params(44)*T132*params(92);
residual(25)= lhs-rhs;
lhs =y(37);
rhs =params(67)*y(8)+x(it_, 1);
residual(26)= lhs-rhs;
lhs =y(38);
rhs =params(69)*y(9)+x(it_, 2);
residual(27)= lhs-rhs;
lhs =y(39);
rhs =y(50)+params(70)*y(10)+x(it_, 1)*params(36);
residual(28)= lhs-rhs;
lhs =y(40);
rhs =params(72)*y(11)+x(it_, 3);
residual(29)= lhs-rhs;
lhs =y(41);
rhs =y(24)+params(74)*y(12)-params(77)*y(2);
residual(30)= lhs-rhs;
lhs =y(24);
rhs =x(it_, 4);
residual(31)= lhs-rhs;
lhs =y(42);
rhs =y(23)+params(75)*y(13)-params(76)*y(1);
residual(32)= lhs-rhs;
lhs =y(23);
rhs =x(it_, 5);
residual(33)= lhs-rhs;
lhs =y(44)+y(3);
rhs =y(27)*(params(65)-1+params(66))/params(65)+y(29)*(1-params(66))/params(65);
residual(34)= lhs-rhs;
lhs =y(47)/(params(65)*params(63));
rhs =y(15)+params(64)*(y(44)-y(15))+y(16);
residual(35)= lhs-rhs;
lhs =y(29)+y(45);
rhs =(params(65)-1+params(66))/params(65)*y(62)+(1-params(66))/params(65)*y(63);
residual(36)= lhs-rhs;
lhs =y(46)-(y(36)-y(67)+y(38));
rhs =(-params(62))*(y(47)-y(29)-y(28));
residual(37)= lhs-rhs;
lhs =y(46);
rhs =y(45);
residual(38)= lhs-rhs;
lhs =y(48);
rhs =y(46)-(y(36)-y(67)+y(38));
residual(39)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(39, 76);

  %
  % Jacobian matrix
  %

  g1(1,36)=(-4);
  g1(1,51)=1;
  g1(2,49)=(-1);
  g1(2,52)=1;
  g1(3,34)=(-4);
  g1(3,53)=1;
  g1(4,32)=(-1);
  g1(4,37)=params(50);
  g1(4,57)=1;
  g1(5,32)=(-1);
  g1(5,58)=1;
  g1(6,50)=(-1);
  g1(6,59)=1;
  g1(7,18)=(-1);
  g1(7,54)=1;
  g1(8,19)=(-1);
  g1(8,55)=1;
  g1(9,54)=(-1);
  g1(9,55)=(-1);
  g1(9,56)=1;
  g1(10,23)=(-1);
  g1(10,24)=(-1);
  g1(10,60)=1;
  g1(11,23)=(-1);
  g1(11,24)=(-1);
  g1(11,61)=1;
  g1(12,17)=(-params(1));
  g1(12,51)=1;
  g1(12,18)=(-params(6));
  g1(12,53)=(-params(5));
  g1(12,69)=(-params(10));
  g1(12,19)=(-params(7));
  g1(12,20)=(-params(8));
  g1(12,21)=(-params(15));
  g1(12,57)=(-params(14));
  g1(12,22)=(-params(24));
  g1(12,58)=(-params(23));
  g1(12,75)=(-params(32));
  g1(13,59)=1;
  g1(13,76)=(-params(34));
  g1(14,49)=1;
  g1(14,53)=(-0.25);
  g1(14,54)=(-0.25);
  g1(14,20)=(-0.25);
  g1(14,55)=(-0.25);
  g1(15,25)=1;
  g1(15,27)=(-params(41));
  g1(15,35)=(-(1-params(41)));
  g1(15,37)=1;
  g1(16,26)=1;
  g1(16,27)=(-T111);
  g1(17,27)=1;
  g1(17,28)=1;
  g1(17,33)=(-1);
  g1(17,35)=(-1);
  g1(18,26)=(-1);
  g1(18,28)=1;
  g1(18,14)=(-1);
  g1(19,29)=(-(T127*1/(T132*params(44))));
  g1(19,5)=(-T127);
  g1(19,31)=1;
  g1(19,65)=(-(params(87)*params(85)*T127));
  g1(19,40)=(-1);
  g1(20,4)=(-(T145/(1+T145)));
  g1(20,30)=1;
  g1(20,64)=(-(1/(1+T145)));
  g1(20,33)=(-T159);
  g1(20,66)=T159;
  g1(20,67)=(-T165);
  g1(20,36)=T165;
  g1(20,38)=T165;
  g1(21,26)=(-((params(65)-1+params(45))*params(96)/params(93)));
  g1(21,28)=(-T197);
  g1(21,3)=(-T197);
  g1(21,30)=(-params(97));
  g1(21,31)=(-params(96));
  g1(21,32)=1;
  g1(21,39)=(-1);
  g1(21,44)=(-T197);
  g1(22,28)=(-(params(50)*params(41)));
  g1(22,32)=1;
  g1(22,33)=(-(params(50)*(1-params(41))));
  g1(22,37)=(-params(50));
  g1(23,25)=(-(T214*T229));
  g1(23,6)=(-(params(53)*T214));
  g1(23,34)=1;
  g1(23,67)=(-(params(87)*params(85)*T214));
  g1(23,41)=(-1);
  g1(24,4)=(-(T266*(-(T145/(1-T145)))));
  g1(24,30)=(-(T266*1/(1-T145)));
  g1(24,33)=(-(T266*params(55)));
  g1(24,6)=(-(params(51)/(1+params(87)*params(85))));
  g1(24,34)=(1+params(87)*params(85)*params(51))/(1+params(87)*params(85));
  g1(24,67)=(-T238);
  g1(24,7)=(-T127);
  g1(24,35)=1-(-T266);
  g1(24,68)=(-T238);
  g1(24,42)=(-1);
  g1(25,31)=(-params(92));
  g1(25,40)=(-(params(44)*T132*params(92)));
  g1(25,14)=(-(1-params(92)));
  g1(25,43)=1;
  g1(26,8)=(-params(67));
  g1(26,37)=1;
  g1(26,70)=(-1);
  g1(27,9)=(-params(69));
  g1(27,38)=1;
  g1(27,71)=(-1);
  g1(28,10)=(-params(70));
  g1(28,39)=1;
  g1(28,50)=(-1);
  g1(28,70)=(-params(36));
  g1(29,11)=(-params(72));
  g1(29,40)=1;
  g1(29,72)=(-1);
  g1(30,2)=params(77);
  g1(30,24)=(-1);
  g1(30,12)=(-params(74));
  g1(30,41)=1;
  g1(31,24)=1;
  g1(31,73)=(-1);
  g1(32,1)=params(76);
  g1(32,23)=(-1);
  g1(32,13)=(-params(75));
  g1(32,42)=1;
  g1(33,23)=1;
  g1(33,74)=(-1);
  g1(34,27)=(-((params(65)-1+params(66))/params(65)));
  g1(34,3)=1;
  g1(34,29)=(-((1-params(66))/params(65)));
  g1(34,44)=1;
  g1(35,44)=(-params(64));
  g1(35,15)=(-(1-params(64)));
  g1(35,16)=(-1);
  g1(35,47)=1/(params(65)*params(63));
  g1(36,62)=(-((params(65)-1+params(66))/params(65)));
  g1(36,29)=1;
  g1(36,63)=(-((1-params(66))/params(65)));
  g1(36,45)=1;
  g1(37,28)=(-params(62));
  g1(37,29)=(-params(62));
  g1(37,67)=1;
  g1(37,36)=(-1);
  g1(37,38)=(-1);
  g1(37,46)=1;
  g1(37,47)=params(62);
  g1(38,45)=(-1);
  g1(38,46)=1;
  g1(39,67)=(-1);
  g1(39,36)=1;
  g1(39,38)=1;
  g1(39,46)=(-1);
  g1(39,48)=1;

if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],39,5776);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],39,438976);
end
end
end
end
