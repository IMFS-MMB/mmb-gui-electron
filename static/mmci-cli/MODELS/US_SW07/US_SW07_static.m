function [residual, g1, g2, g3] = US_SW07_static(y, x, params)
%
% Status : Computes static model for Dynare
%
% Inputs : 
%   y         [M_.endo_nbr by 1] double    vector of endogenous variables in declaration order
%   x         [M_.exo_nbr by 1] double     vector of exogenous variables in declaration order
%   params    [M_.param_nbr by 1] double   vector of parameter values in declaration order
%
% Outputs:
%   residual  [M_.endo_nbr by 1] double    vector of residuals of the static model equations 
%                                          in order of declaration of the equations.
%                                          Dynare may prepend or append auxiliary equations, see M_.aux_vars
%   g1        [M_.endo_nbr by M_.endo_nbr] double    Jacobian matrix of the static model equations;
%                                                       columns: variables in declaration order
%                                                       rows: equations in order of declaration
%   g2        [M_.endo_nbr by (M_.endo_nbr)^2] double   Hessian matrix of the static model equations;
%                                                       columns: variables in declaration order
%                                                       rows: equations in order of declaration
%   g3        [M_.endo_nbr by (M_.endo_nbr)^3] double   Third derivatives matrix of the static model equations;
%                                                       columns: variables in declaration order
%                                                       rows: equations in order of declaration
%
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

residual = zeros( 71, 1);

%
% Model equations
%

T165 = 1/(params(44)/(1-params(44)));
T181 = 1/(1+params(75)*params(73));
T184 = params(73)^2;
T186 = T184*params(46);
T199 = params(49)/params(73);
T204 = (1-T199)/(params(48)*(1+T199));
T215 = (1-params(47))/(params(78)+1-params(47));
T330 = 1/(1+params(75)*params(73)*params(55));
T344 = (1-params(56))*(1-params(75)*params(73)*params(56))/params(56)/(1+(params(52)-1)*params(37));
T352 = params(75)*params(73)/(1+params(75)*params(73));
T379 = (1-params(54))*(1-params(75)*params(73)*params(54))/((1+params(75)*params(73))*params(54))*1/(1+(params(58)-1)*params(35));
lhs =y(43);
rhs =y(31)*4;
residual(1)= lhs-rhs;
lhs =y(44);
rhs =y(41);
residual(2)= lhs-rhs;
lhs =y(45);
rhs =4*y(29);
residual(3)= lhs-rhs;
lhs =y(46);
rhs =y(27)-y(16);
residual(4)= lhs-rhs;
lhs =y(47);
rhs =y(27);
residual(5)= lhs-rhs;
lhs =y(48);
rhs =y(42);
residual(6)= lhs-rhs;
lhs =y(43);
rhs =params(32)*x(7)+y(47)*params(31)+y(47)*params(30)+y(47)*params(29)+y(47)*params(28)+y(47)*params(27)+y(47)*params(26)+y(47)*params(25)+y(47)*params(24)+y(47)*params(23)+y(46)*params(22)+y(46)*params(21)+y(46)*params(20)+y(46)*params(19)+y(46)*params(18)+y(46)*params(17)+y(46)*params(16)+y(46)*params(15)+y(46)*params(14)+y(45)*params(13)+y(45)*params(12)+y(45)*params(11)+y(45)*params(10)+y(45)*params(6)+y(45)*params(5)+y(43)*params(1)+y(43)*params(2)+y(43)*params(3)+y(43)*params(4)+y(45)*params(7)+y(45)*params(8)+y(45)*params(9);
residual(7)= lhs-rhs;
lhs =y(48);
rhs =params(34)*x(8);
residual(8)= lhs-rhs;
lhs =y(32);
rhs =params(43)*y(11)+(1-params(43))*y(18);
residual(9)= lhs-rhs;
lhs =y(10);
rhs =y(11)*T165;
residual(10)= lhs-rhs;
lhs =y(11);
rhs =y(18)+y(17)-y(12);
residual(11)= lhs-rhs;
lhs =y(12);
rhs =y(10)+y(39);
residual(12)= lhs-rhs;
lhs =y(15);
rhs =T181*(y(15)+y(15)*params(75)*params(73)+1/T186*y(13))+y(35);
residual(13)= lhs-rhs;
lhs =y(13);
rhs =(-y(19))+y(33)*1/T204+y(11)*params(78)/(params(78)+1-params(47))+y(13)*T215;
residual(14)= lhs-rhs;
lhs =y(14);
rhs =y(33)+y(14)*T199/(1+T199)+y(14)*1/(1+T199)-y(19)*T204;
residual(15)= lhs-rhs;
lhs =y(16);
rhs =y(14)*params(85)+y(15)*params(84)+y(34)+y(10)*params(86);
residual(16)= lhs-rhs;
lhs =y(16);
rhs =params(52)*(y(32)+params(43)*y(12)+(1-params(43))*y(17));
residual(17)= lhs-rhs;
lhs =y(18);
rhs =y(17)*params(57)+y(14)*1/(1-T199)-y(14)*T199/(1-T199);
residual(18)= lhs-rhs;
lhs =y(39);
rhs =y(39)*(1-params(80))+y(15)*params(80)+y(35)*T186*params(80);
residual(19)= lhs-rhs;
lhs =y(20);
rhs =params(43)*y(22)+(1-params(43))*y(30)-y(32);
residual(20)= lhs-rhs;
lhs =y(21);
rhs =T165*y(22);
residual(21)= lhs-rhs;
lhs =y(22);
rhs =y(30)+y(28)-y(23);
residual(22)= lhs-rhs;
lhs =y(23);
rhs =y(21)+y(40);
residual(23)= lhs-rhs;
lhs =y(26);
rhs =y(35)+T181*(y(26)+params(75)*params(73)*y(26)+1/T186*y(24));
residual(24)= lhs-rhs;
lhs =y(24);
rhs =T215*y(24)+params(78)/(params(78)+1-params(47))*y(22)+y(33)*1/T204+y(29)-y(31);
residual(25)= lhs-rhs;
lhs =y(25);
rhs =y(33)+T199/(1+T199)*y(25)+1/(1+T199)*y(25)-T204*(y(31)-y(29));
residual(26)= lhs-rhs;
lhs =y(27);
rhs =y(34)+params(85)*y(25)+params(84)*y(26)+params(86)*y(21);
residual(27)= lhs-rhs;
lhs =y(27);
rhs =params(52)*(y(32)+params(43)*y(23)+(1-params(43))*y(28));
residual(28)= lhs-rhs;
lhs =y(29);
rhs =T330*(y(29)*params(75)*params(73)+y(29)*params(55)+y(20)*T344)+y(37);
residual(29)= lhs-rhs;
lhs =y(30);
rhs =T181*y(30)+y(30)*T352+y(29)*params(53)/(1+params(75)*params(73))-y(29)*(1+params(75)*params(73)*params(53))/(1+params(75)*params(73))+y(29)*T352+T379*(params(57)*y(28)+1/(1-T199)*y(25)-T199/(1-T199)*y(25)-y(30))+y(38);
residual(30)= lhs-rhs;
lhs =y(32);
rhs =y(32)*params(64)+x(1);
residual(31)= lhs-rhs;
lhs =y(33);
rhs =y(33)*params(65)+x(2);
residual(32)= lhs-rhs;
lhs =y(34);
rhs =y(42)+y(34)*params(66)+x(1)*params(36);
residual(33)= lhs-rhs;
lhs =y(35);
rhs =y(35)*params(67)+x(3);
residual(34)= lhs-rhs;
lhs =y(36);
rhs =y(36)*params(68)+x(4);
residual(35)= lhs-rhs;
lhs =y(37);
rhs =y(37)*params(69)+y(9)-y(9)*params(42);
residual(36)= lhs-rhs;
lhs =y(9);
rhs =x(5);
residual(37)= lhs-rhs;
lhs =y(38);
rhs =y(38)*params(70)+y(8)-y(8)*params(41);
residual(38)= lhs-rhs;
lhs =y(8);
rhs =x(6);
residual(39)= lhs-rhs;
lhs =y(40);
rhs =(1-params(80))*y(40)+params(80)*y(26)+y(35)*params(46)*T184*params(80);
residual(40)= lhs-rhs;
lhs =y(4);
rhs =params(71);
residual(41)= lhs-rhs;
lhs =y(5);
rhs =params(71);
residual(42)= lhs-rhs;
lhs =y(6);
rhs =params(71);
residual(43)= lhs-rhs;
lhs =y(7);
rhs =params(71);
residual(44)= lhs-rhs;
lhs =y(3);
rhs =y(29)+params(39);
residual(45)= lhs-rhs;
lhs =y(41);
rhs =y(29)+y(29)+y(29)+y(29);
residual(46)= lhs-rhs;
lhs =y(2);
rhs =y(31)+params(89);
residual(47)= lhs-rhs;
lhs =y(1);
rhs =y(28)+params(38);
residual(48)= lhs-rhs;
lhs =y(49);
rhs =y(45);
residual(49)= lhs-rhs;
lhs =y(50);
rhs =y(45);
residual(50)= lhs-rhs;
lhs =y(51);
rhs =y(45);
residual(51)= lhs-rhs;
lhs =y(52);
rhs =y(46);
residual(52)= lhs-rhs;
lhs =y(53);
rhs =y(46);
residual(53)= lhs-rhs;
lhs =y(54);
rhs =y(46);
residual(54)= lhs-rhs;
lhs =y(55);
rhs =y(47);
residual(55)= lhs-rhs;
lhs =y(56);
rhs =y(47);
residual(56)= lhs-rhs;
lhs =y(57);
rhs =y(47);
residual(57)= lhs-rhs;
lhs =y(58);
rhs =y(47);
residual(58)= lhs-rhs;
lhs =y(59);
rhs =y(47);
residual(59)= lhs-rhs;
lhs =y(60);
rhs =y(47);
residual(60)= lhs-rhs;
lhs =y(61);
rhs =y(46);
residual(61)= lhs-rhs;
lhs =y(62);
rhs =y(46);
residual(62)= lhs-rhs;
lhs =y(63);
rhs =y(46);
residual(63)= lhs-rhs;
lhs =y(64);
rhs =y(43);
residual(64)= lhs-rhs;
lhs =y(65);
rhs =y(43);
residual(65)= lhs-rhs;
lhs =y(66);
rhs =y(43);
residual(66)= lhs-rhs;
lhs =y(67);
rhs =y(45);
residual(67)= lhs-rhs;
lhs =y(68);
rhs =y(45);
residual(68)= lhs-rhs;
lhs =y(69);
rhs =y(45);
residual(69)= lhs-rhs;
lhs =y(70);
rhs =y(29);
residual(70)= lhs-rhs;
lhs =y(71);
rhs =y(29);
residual(71)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(71, 71);

  %
  % Jacobian matrix
  %

T658 = 1-(T199/(1+T199)+1/(1+T199));
T660 = 1/(1-T199)-T199/(1-T199);
  g1(1,31)=(-4);
  g1(1,43)=1;
  g1(2,41)=(-1);
  g1(2,44)=1;
  g1(3,29)=(-4);
  g1(3,45)=1;
  g1(4,16)=1;
  g1(4,27)=(-1);
  g1(4,46)=1;
  g1(5,27)=(-1);
  g1(5,47)=1;
  g1(6,42)=(-1);
  g1(6,48)=1;
  g1(7,43)=1-(params(4)+params(3)+params(1)+params(2));
  g1(7,45)=(-(params(13)+params(12)+params(11)+params(10)+params(9)+params(8)+params(7)+params(6)+params(5)));
  g1(7,46)=(-(params(22)+params(21)+params(20)+params(19)+params(18)+params(17)+params(16)+params(15)+params(14)));
  g1(7,47)=(-(params(31)+params(30)+params(29)+params(28)+params(27)+params(26)+params(25)+params(24)+params(23)));
  g1(8,48)=1;
  g1(9,11)=(-params(43));
  g1(9,18)=(-(1-params(43)));
  g1(9,32)=1;
  g1(10,10)=1;
  g1(10,11)=(-T165);
  g1(11,11)=1;
  g1(11,12)=1;
  g1(11,17)=(-1);
  g1(11,18)=(-1);
  g1(12,10)=(-1);
  g1(12,12)=1;
  g1(12,39)=(-1);
  g1(13,13)=(-(T181*1/T186));
  g1(13,15)=1-(1+params(75)*params(73))*T181;
  g1(13,35)=(-1);
  g1(14,11)=(-(params(78)/(params(78)+1-params(47))));
  g1(14,13)=1-T215;
  g1(14,19)=1;
  g1(14,33)=(-(1/T204));
  g1(15,14)=T658;
  g1(15,19)=T204;
  g1(15,33)=(-1);
  g1(16,10)=(-params(86));
  g1(16,14)=(-params(85));
  g1(16,15)=(-params(84));
  g1(16,16)=1;
  g1(16,34)=(-1);
  g1(17,12)=(-(params(43)*params(52)));
  g1(17,16)=1;
  g1(17,17)=(-((1-params(43))*params(52)));
  g1(17,32)=(-params(52));
  g1(18,14)=(-T660);
  g1(18,17)=(-params(57));
  g1(18,18)=1;
  g1(19,15)=(-params(80));
  g1(19,35)=(-(T186*params(80)));
  g1(19,39)=1-(1-params(80));
  g1(20,20)=1;
  g1(20,22)=(-params(43));
  g1(20,30)=(-(1-params(43)));
  g1(20,32)=1;
  g1(21,21)=1;
  g1(21,22)=(-T165);
  g1(22,22)=1;
  g1(22,23)=1;
  g1(22,28)=(-1);
  g1(22,30)=(-1);
  g1(23,21)=(-1);
  g1(23,23)=1;
  g1(23,40)=(-1);
  g1(24,24)=(-(T181*1/T186));
  g1(24,26)=1-(1+params(75)*params(73))*T181;
  g1(24,35)=(-1);
  g1(25,22)=(-(params(78)/(params(78)+1-params(47))));
  g1(25,24)=1-T215;
  g1(25,29)=(-1);
  g1(25,31)=1;
  g1(25,33)=(-(1/T204));
  g1(26,25)=T658;
  g1(26,29)=(-T204);
  g1(26,31)=T204;
  g1(26,33)=(-1);
  g1(27,21)=(-params(86));
  g1(27,25)=(-params(85));
  g1(27,26)=(-params(84));
  g1(27,27)=1;
  g1(27,34)=(-1);
  g1(28,23)=(-(params(43)*params(52)));
  g1(28,27)=1;
  g1(28,28)=(-((1-params(43))*params(52)));
  g1(28,32)=(-params(52));
  g1(29,20)=(-(T330*T344));
  g1(29,29)=1-T330*(params(75)*params(73)+params(55));
  g1(29,37)=(-1);
  g1(30,25)=(-(T379*T660));
  g1(30,28)=(-(params(57)*T379));
  g1(30,29)=(-(T352+params(53)/(1+params(75)*params(73))-(1+params(75)*params(73)*params(53))/(1+params(75)*params(73))));
  g1(30,30)=1-(T181+T352-T379);
  g1(30,38)=(-1);
  g1(31,32)=1-params(64);
  g1(32,33)=1-params(65);
  g1(33,34)=1-params(66);
  g1(33,42)=(-1);
  g1(34,35)=1-params(67);
  g1(35,36)=1-params(68);
  g1(36,9)=(-(1-params(42)));
  g1(36,37)=1-params(69);
  g1(37,9)=1;
  g1(38,8)=(-(1-params(41)));
  g1(38,38)=1-params(70);
  g1(39,8)=1;
  g1(40,26)=(-params(80));
  g1(40,35)=(-(params(46)*T184*params(80)));
  g1(40,40)=1-(1-params(80));
  g1(41,4)=1;
  g1(42,5)=1;
  g1(43,6)=1;
  g1(44,7)=1;
  g1(45,3)=1;
  g1(45,29)=(-1);
  g1(46,29)=(-4);
  g1(46,41)=1;
  g1(47,2)=1;
  g1(47,31)=(-1);
  g1(48,1)=1;
  g1(48,28)=(-1);
  g1(49,45)=(-1);
  g1(49,49)=1;
  g1(50,45)=(-1);
  g1(50,50)=1;
  g1(51,45)=(-1);
  g1(51,51)=1;
  g1(52,46)=(-1);
  g1(52,52)=1;
  g1(53,46)=(-1);
  g1(53,53)=1;
  g1(54,46)=(-1);
  g1(54,54)=1;
  g1(55,47)=(-1);
  g1(55,55)=1;
  g1(56,47)=(-1);
  g1(56,56)=1;
  g1(57,47)=(-1);
  g1(57,57)=1;
  g1(58,47)=(-1);
  g1(58,58)=1;
  g1(59,47)=(-1);
  g1(59,59)=1;
  g1(60,47)=(-1);
  g1(60,60)=1;
  g1(61,46)=(-1);
  g1(61,61)=1;
  g1(62,46)=(-1);
  g1(62,62)=1;
  g1(63,46)=(-1);
  g1(63,63)=1;
  g1(64,43)=(-1);
  g1(64,64)=1;
  g1(65,43)=(-1);
  g1(65,65)=1;
  g1(66,43)=(-1);
  g1(66,66)=1;
  g1(67,45)=(-1);
  g1(67,67)=1;
  g1(68,45)=(-1);
  g1(68,68)=1;
  g1(69,45)=(-1);
  g1(69,69)=1;
  g1(70,29)=(-1);
  g1(70,70)=1;
  g1(71,29)=(-1);
  g1(71,71)=1;
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],71,5041);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],71,357911);
end
end
end
end
