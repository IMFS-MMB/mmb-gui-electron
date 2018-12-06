function [residual, g1, g2, g3] = US_SW07AL_dynamic(y, x, params, steady_state, it_)
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

residual = zeros(44, 1);
T95 = 1/(params(44)/(1-params(44)));
T111 = 1/(1+params(75)*params(73));
T116 = params(73)^2;
T118 = T116*params(46);
T131 = params(49)/params(73);
T136 = (1-T131)/(params(48)*(1+T131));
T148 = (1-params(47))/(params(78)+1-params(47));
T164 = (params(48)-1)*params(87)/(params(48)*(1+T131));
T193 = 1/(1-T131);
T196 = T131/(1-T131);
T282 = 1/(1+params(75)*params(73)*params(55));
T297 = (1-params(56))*(1-params(75)*params(73)*params(56))/params(56)/(1+(params(52)-1)*params(37));
T306 = params(75)*params(73)/(1+params(75)*params(73));
T334 = (1-params(54))*(1-params(75)*params(73)*params(54))/((1+params(75)*params(73))*params(54))*1/(1+(params(58)-1)*params(35));
lhs =y(59);
rhs =y(47)*4;
residual(1)= lhs-rhs;
lhs =y(60);
rhs =y(57);
residual(2)= lhs-rhs;
lhs =y(61);
rhs =4*y(45);
residual(3)= lhs-rhs;
lhs =y(62);
rhs =y(43)-y(32);
residual(4)= lhs-rhs;
lhs =y(63);
rhs =y(43);
residual(5)= lhs-rhs;
lhs =y(64);
rhs =y(58);
residual(6)= lhs-rhs;
lhs =y(65);
rhs =y(19);
residual(7)= lhs-rhs;
lhs =y(66);
rhs =y(22);
residual(8)= lhs-rhs;
lhs =y(67);
rhs =y(65)+y(66);
residual(9)= lhs-rhs;
lhs =y(59);
rhs =params(1)*y(18)+y(61)*params(5)+y(19)*params(6)+y(22)*params(7)+params(8)*y(23)+params(10)*y(80)+y(62)*params(14)+params(15)*y(20)+y(63)*params(23)+params(24)*y(21)+params(32)*x(it_, 7);
residual(10)= lhs-rhs;
lhs =y(64);
rhs =params(34)*x(it_, 8);
residual(11)= lhs-rhs;
lhs =y(48);
rhs =params(43)*y(27)+(1-params(43))*y(34);
residual(12)= lhs-rhs;
lhs =y(26);
rhs =y(27)*T95;
residual(13)= lhs-rhs;
lhs =y(27);
rhs =y(34)+y(33)-y(28);
residual(14)= lhs-rhs;
lhs =y(28);
rhs =y(26)+y(16);
residual(15)= lhs-rhs;
lhs =y(31);
rhs =T111*(y(4)+params(75)*params(73)*y(71)+1/T118*y(29))+y(51);
residual(16)= lhs-rhs;
lhs =y(29);
rhs =(-y(35))+y(49)*1/T136+params(78)/(params(78)+1-params(47))*y(68)+T148*y(69);
residual(17)= lhs-rhs;
lhs =y(30);
rhs =y(49)+T131/(1+T131)*y(3)+1/(1+T131)*y(70)+T164*(y(33)-y(72))-y(35)*T136;
residual(18)= lhs-rhs;
lhs =y(32);
rhs =y(30)*params(85)+y(31)*params(84)+y(50)+y(26)*params(86);
residual(19)= lhs-rhs;
lhs =y(32);
rhs =params(52)*(y(48)+params(43)*y(28)+(1-params(43))*y(33));
residual(20)= lhs-rhs;
lhs =y(34);
rhs =y(33)*params(57)+y(30)*T193-y(3)*T196;
residual(21)= lhs-rhs;
lhs =y(55);
rhs =y(16)*(1-params(80))+y(31)*params(80)+y(51)*T118*params(80);
residual(22)= lhs-rhs;
lhs =y(36);
rhs =params(43)*y(38)+(1-params(43))*y(46)-y(48);
residual(23)= lhs-rhs;
lhs =y(37);
rhs =T95*y(38);
residual(24)= lhs-rhs;
lhs =y(38);
rhs =y(46)+y(44)-y(39);
residual(25)= lhs-rhs;
lhs =y(39);
rhs =y(37)+y(17);
residual(26)= lhs-rhs;
lhs =y(42);
rhs =y(51)+T111*(y(6)+params(75)*params(73)*y(76)+1/T118*y(40));
residual(27)= lhs-rhs;
lhs =y(40);
rhs =y(49)*1/T136+(-y(47))+y(78)+params(78)/(params(78)+1-params(47))*y(73)+T148*y(74);
residual(28)= lhs-rhs;
lhs =y(41);
rhs =y(49)+T131/(1+T131)*y(5)+1/(1+T131)*y(75)+T164*(y(44)-y(77))-T136*(y(47)-y(78));
residual(29)= lhs-rhs;
lhs =y(43);
rhs =y(50)+params(85)*y(41)+params(84)*y(42)+params(86)*y(37);
residual(30)= lhs-rhs;
lhs =y(43);
rhs =params(52)*(y(48)+params(43)*y(39)+(1-params(43))*y(44));
residual(31)= lhs-rhs;
lhs =y(45);
rhs =T282*(params(75)*params(73)*y(78)+params(55)*y(7)+y(36)*T297)+y(53);
residual(32)= lhs-rhs;
lhs =y(46);
rhs =T111*y(8)+T306*y(79)+y(7)*params(53)/(1+params(75)*params(73))-y(45)*(1+params(75)*params(73)*params(53))/(1+params(75)*params(73))+y(78)*T306+T334*(params(57)*y(44)+T193*y(41)-T196*y(5)-y(46))+y(54);
residual(33)= lhs-rhs;
lhs =y(48);
rhs =params(64)*y(9)+x(it_, 1);
residual(34)= lhs-rhs;
lhs =y(49);
rhs =params(65)*y(10)+x(it_, 2);
residual(35)= lhs-rhs;
lhs =y(50);
rhs =y(58)+params(66)*y(11)+x(it_, 1)*params(36);
residual(36)= lhs-rhs;
lhs =y(51);
rhs =params(67)*y(12)+x(it_, 3);
residual(37)= lhs-rhs;
lhs =y(52);
rhs =params(68)*y(13)+x(it_, 4);
residual(38)= lhs-rhs;
lhs =y(53);
rhs =params(69)*y(14)+y(25)-params(42)*y(2);
residual(39)= lhs-rhs;
lhs =y(25);
rhs =x(it_, 5);
residual(40)= lhs-rhs;
lhs =y(54);
rhs =params(70)*y(15)+y(24)-params(41)*y(1);
residual(41)= lhs-rhs;
lhs =y(24);
rhs =x(it_, 6);
residual(42)= lhs-rhs;
lhs =y(56);
rhs =(1-params(80))*y(17)+params(80)*y(42)+y(51)*params(46)*T116*params(80);
residual(43)= lhs-rhs;
lhs =y(57);
rhs =0.25*(y(23)+y(66)+y(61)+y(65));
residual(44)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(44, 88);

  %
  % Jacobian matrix
  %

  g1(1,47)=(-4);
  g1(1,59)=1;
  g1(2,57)=(-1);
  g1(2,60)=1;
  g1(3,45)=(-4);
  g1(3,61)=1;
  g1(4,32)=1;
  g1(4,43)=(-1);
  g1(4,62)=1;
  g1(5,43)=(-1);
  g1(5,63)=1;
  g1(6,58)=(-1);
  g1(6,64)=1;
  g1(7,19)=(-1);
  g1(7,65)=1;
  g1(8,22)=(-1);
  g1(8,66)=1;
  g1(9,65)=(-1);
  g1(9,66)=(-1);
  g1(9,67)=1;
  g1(10,18)=(-params(1));
  g1(10,59)=1;
  g1(10,19)=(-params(6));
  g1(10,61)=(-params(5));
  g1(10,80)=(-params(10));
  g1(10,20)=(-params(15));
  g1(10,62)=(-params(14));
  g1(10,21)=(-params(24));
  g1(10,63)=(-params(23));
  g1(10,22)=(-params(7));
  g1(10,23)=(-params(8));
  g1(10,87)=(-params(32));
  g1(11,64)=1;
  g1(11,88)=(-params(34));
  g1(12,27)=(-params(43));
  g1(12,34)=(-(1-params(43)));
  g1(12,48)=1;
  g1(13,26)=1;
  g1(13,27)=(-T95);
  g1(14,27)=1;
  g1(14,28)=1;
  g1(14,33)=(-1);
  g1(14,34)=(-1);
  g1(15,26)=(-1);
  g1(15,28)=1;
  g1(15,16)=(-1);
  g1(16,29)=(-(T111*1/T118));
  g1(16,4)=(-T111);
  g1(16,31)=1;
  g1(16,71)=(-(params(75)*params(73)*T111));
  g1(16,51)=(-1);
  g1(17,68)=(-(params(78)/(params(78)+1-params(47))));
  g1(17,29)=1;
  g1(17,69)=(-T148);
  g1(17,35)=1;
  g1(17,49)=(-(1/T136));
  g1(18,3)=(-(T131/(1+T131)));
  g1(18,30)=1;
  g1(18,70)=(-(1/(1+T131)));
  g1(18,33)=(-T164);
  g1(18,72)=T164;
  g1(18,35)=T136;
  g1(18,49)=(-1);
  g1(19,26)=(-params(86));
  g1(19,30)=(-params(85));
  g1(19,31)=(-params(84));
  g1(19,32)=1;
  g1(19,50)=(-1);
  g1(20,28)=(-(params(43)*params(52)));
  g1(20,32)=1;
  g1(20,33)=(-((1-params(43))*params(52)));
  g1(20,48)=(-params(52));
  g1(21,3)=T196;
  g1(21,30)=(-T193);
  g1(21,33)=(-params(57));
  g1(21,34)=1;
  g1(22,31)=(-params(80));
  g1(22,51)=(-(T118*params(80)));
  g1(22,16)=(-(1-params(80)));
  g1(22,55)=1;
  g1(23,36)=1;
  g1(23,38)=(-params(43));
  g1(23,46)=(-(1-params(43)));
  g1(23,48)=1;
  g1(24,37)=1;
  g1(24,38)=(-T95);
  g1(25,38)=1;
  g1(25,39)=1;
  g1(25,44)=(-1);
  g1(25,46)=(-1);
  g1(26,37)=(-1);
  g1(26,39)=1;
  g1(26,17)=(-1);
  g1(27,40)=(-(T111*1/T118));
  g1(27,6)=(-T111);
  g1(27,42)=1;
  g1(27,76)=(-(params(75)*params(73)*T111));
  g1(27,51)=(-1);
  g1(28,73)=(-(params(78)/(params(78)+1-params(47))));
  g1(28,40)=1;
  g1(28,74)=(-T148);
  g1(28,78)=(-1);
  g1(28,47)=1;
  g1(28,49)=(-(1/T136));
  g1(29,5)=(-(T131/(1+T131)));
  g1(29,41)=1;
  g1(29,75)=(-(1/(1+T131)));
  g1(29,44)=(-T164);
  g1(29,77)=T164;
  g1(29,78)=(-T136);
  g1(29,47)=T136;
  g1(29,49)=(-1);
  g1(30,37)=(-params(86));
  g1(30,41)=(-params(85));
  g1(30,42)=(-params(84));
  g1(30,43)=1;
  g1(30,50)=(-1);
  g1(31,39)=(-(params(43)*params(52)));
  g1(31,43)=1;
  g1(31,44)=(-((1-params(43))*params(52)));
  g1(31,48)=(-params(52));
  g1(32,36)=(-(T282*T297));
  g1(32,7)=(-(params(55)*T282));
  g1(32,45)=1;
  g1(32,78)=(-(params(75)*params(73)*T282));
  g1(32,53)=(-1);
  g1(33,5)=(-(T334*(-T196)));
  g1(33,41)=(-(T193*T334));
  g1(33,44)=(-(params(57)*T334));
  g1(33,7)=(-(params(53)/(1+params(75)*params(73))));
  g1(33,45)=(1+params(75)*params(73)*params(53))/(1+params(75)*params(73));
  g1(33,78)=(-T306);
  g1(33,8)=(-T111);
  g1(33,46)=1-(-T334);
  g1(33,79)=(-T306);
  g1(33,54)=(-1);
  g1(34,9)=(-params(64));
  g1(34,48)=1;
  g1(34,81)=(-1);
  g1(35,10)=(-params(65));
  g1(35,49)=1;
  g1(35,82)=(-1);
  g1(36,11)=(-params(66));
  g1(36,50)=1;
  g1(36,58)=(-1);
  g1(36,81)=(-params(36));
  g1(37,12)=(-params(67));
  g1(37,51)=1;
  g1(37,83)=(-1);
  g1(38,13)=(-params(68));
  g1(38,52)=1;
  g1(38,84)=(-1);
  g1(39,2)=params(42);
  g1(39,25)=(-1);
  g1(39,14)=(-params(69));
  g1(39,53)=1;
  g1(40,25)=1;
  g1(40,85)=(-1);
  g1(41,1)=params(41);
  g1(41,24)=(-1);
  g1(41,15)=(-params(70));
  g1(41,54)=1;
  g1(42,24)=1;
  g1(42,86)=(-1);
  g1(43,42)=(-params(80));
  g1(43,51)=(-(params(46)*T116*params(80)));
  g1(43,17)=(-(1-params(80)));
  g1(43,56)=1;
  g1(44,57)=1;
  g1(44,61)=(-0.25);
  g1(44,65)=(-0.25);
  g1(44,23)=(-0.25);
  g1(44,66)=(-0.25);

if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],44,7744);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],44,681472);
end
end
end
end
