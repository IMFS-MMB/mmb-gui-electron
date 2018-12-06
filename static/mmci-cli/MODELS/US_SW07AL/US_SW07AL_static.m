function [residual, g1, g2, g3] = US_SW07AL_static(y, x, params)
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

residual = zeros( 44, 1);

%
% Model equations
%

T88 = 1/(params(44)/(1-params(44)));
T104 = 1/(1+params(75)*params(73));
T107 = params(73)^2;
T109 = T107*params(46);
T122 = params(49)/params(73);
T127 = (1-T122)/(params(48)*(1+T122));
T138 = (1-params(47))/(params(78)+1-params(47));
T253 = 1/(1+params(75)*params(73)*params(55));
T267 = (1-params(56))*(1-params(75)*params(73)*params(56))/params(56)/(1+(params(52)-1)*params(37));
T275 = params(75)*params(73)/(1+params(75)*params(73));
T302 = (1-params(54))*(1-params(75)*params(73)*params(54))/((1+params(75)*params(73))*params(54))*1/(1+(params(58)-1)*params(35));
lhs =y(36);
rhs =y(24)*4;
residual(1)= lhs-rhs;
lhs =y(37);
rhs =y(34);
residual(2)= lhs-rhs;
lhs =y(38);
rhs =4*y(22);
residual(3)= lhs-rhs;
lhs =y(39);
rhs =y(20)-y(9);
residual(4)= lhs-rhs;
lhs =y(40);
rhs =y(20);
residual(5)= lhs-rhs;
lhs =y(41);
rhs =y(35);
residual(6)= lhs-rhs;
lhs =y(42);
rhs =y(38);
residual(7)= lhs-rhs;
lhs =y(43);
rhs =y(42);
residual(8)= lhs-rhs;
lhs =y(44);
rhs =y(42)+y(43);
residual(9)= lhs-rhs;
lhs =y(36);
rhs =y(36)*params(1)+y(38)*params(5)+y(38)*params(6)+y(42)*params(7)+y(43)*params(8)+y(38)*params(10)+y(39)*params(14)+y(39)*params(15)+y(40)*params(23)+y(40)*params(24)+params(32)*x(7);
residual(10)= lhs-rhs;
lhs =y(41);
rhs =params(34)*x(8);
residual(11)= lhs-rhs;
lhs =y(25);
rhs =params(43)*y(4)+(1-params(43))*y(11);
residual(12)= lhs-rhs;
lhs =y(3);
rhs =y(4)*T88;
residual(13)= lhs-rhs;
lhs =y(4);
rhs =y(11)+y(10)-y(5);
residual(14)= lhs-rhs;
lhs =y(5);
rhs =y(3)+y(32);
residual(15)= lhs-rhs;
lhs =y(8);
rhs =T104*(y(8)+y(8)*params(75)*params(73)+1/T109*y(6))+y(28);
residual(16)= lhs-rhs;
lhs =y(6);
rhs =(-y(12))+y(26)*1/T127+y(4)*params(78)/(params(78)+1-params(47))+y(6)*T138;
residual(17)= lhs-rhs;
lhs =y(7);
rhs =y(26)+y(7)*T122/(1+T122)+y(7)*1/(1+T122)-y(12)*T127;
residual(18)= lhs-rhs;
lhs =y(9);
rhs =y(7)*params(85)+y(8)*params(84)+y(27)+y(3)*params(86);
residual(19)= lhs-rhs;
lhs =y(9);
rhs =params(52)*(y(25)+params(43)*y(5)+(1-params(43))*y(10));
residual(20)= lhs-rhs;
lhs =y(11);
rhs =y(10)*params(57)+y(7)*1/(1-T122)-y(7)*T122/(1-T122);
residual(21)= lhs-rhs;
lhs =y(32);
rhs =y(32)*(1-params(80))+y(8)*params(80)+y(28)*T109*params(80);
residual(22)= lhs-rhs;
lhs =y(13);
rhs =params(43)*y(15)+(1-params(43))*y(23)-y(25);
residual(23)= lhs-rhs;
lhs =y(14);
rhs =T88*y(15);
residual(24)= lhs-rhs;
lhs =y(15);
rhs =y(23)+y(21)-y(16);
residual(25)= lhs-rhs;
lhs =y(16);
rhs =y(14)+y(33);
residual(26)= lhs-rhs;
lhs =y(19);
rhs =y(28)+T104*(y(19)+params(75)*params(73)*y(19)+1/T109*y(17));
residual(27)= lhs-rhs;
lhs =y(17);
rhs =T138*y(17)+params(78)/(params(78)+1-params(47))*y(15)+y(26)*1/T127+y(22)-y(24);
residual(28)= lhs-rhs;
lhs =y(18);
rhs =y(26)+T122/(1+T122)*y(18)+1/(1+T122)*y(18)-T127*(y(24)-y(22));
residual(29)= lhs-rhs;
lhs =y(20);
rhs =y(27)+params(85)*y(18)+params(84)*y(19)+params(86)*y(14);
residual(30)= lhs-rhs;
lhs =y(20);
rhs =params(52)*(y(25)+params(43)*y(16)+(1-params(43))*y(21));
residual(31)= lhs-rhs;
lhs =y(22);
rhs =T253*(y(22)*params(75)*params(73)+y(22)*params(55)+y(13)*T267)+y(30);
residual(32)= lhs-rhs;
lhs =y(23);
rhs =T104*y(23)+y(23)*T275+y(22)*params(53)/(1+params(75)*params(73))-y(22)*(1+params(75)*params(73)*params(53))/(1+params(75)*params(73))+y(22)*T275+T302*(params(57)*y(21)+1/(1-T122)*y(18)-T122/(1-T122)*y(18)-y(23))+y(31);
residual(33)= lhs-rhs;
lhs =y(25);
rhs =y(25)*params(64)+x(1);
residual(34)= lhs-rhs;
lhs =y(26);
rhs =y(26)*params(65)+x(2);
residual(35)= lhs-rhs;
lhs =y(27);
rhs =y(35)+y(27)*params(66)+x(1)*params(36);
residual(36)= lhs-rhs;
lhs =y(28);
rhs =y(28)*params(67)+x(3);
residual(37)= lhs-rhs;
lhs =y(29);
rhs =y(29)*params(68)+x(4);
residual(38)= lhs-rhs;
lhs =y(30);
rhs =y(30)*params(69)+y(2)-y(2)*params(42);
residual(39)= lhs-rhs;
lhs =y(2);
rhs =x(5);
residual(40)= lhs-rhs;
lhs =y(31);
rhs =y(31)*params(70)+y(1)-y(1)*params(41);
residual(41)= lhs-rhs;
lhs =y(1);
rhs =x(6);
residual(42)= lhs-rhs;
lhs =y(33);
rhs =(1-params(80))*y(33)+params(80)*y(19)+y(28)*params(46)*T107*params(80);
residual(43)= lhs-rhs;
lhs =y(34);
rhs =0.25*(y(43)+y(43)+y(38)+y(42));
residual(44)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(44, 44);

  %
  % Jacobian matrix
  %

T395 = 1-(T122/(1+T122)+1/(1+T122));
T397 = 1/(1-T122)-T122/(1-T122);
  g1(1,24)=(-4);
  g1(1,36)=1;
  g1(2,34)=(-1);
  g1(2,37)=1;
  g1(3,22)=(-4);
  g1(3,38)=1;
  g1(4,9)=1;
  g1(4,20)=(-1);
  g1(4,39)=1;
  g1(5,20)=(-1);
  g1(5,40)=1;
  g1(6,35)=(-1);
  g1(6,41)=1;
  g1(7,38)=(-1);
  g1(7,42)=1;
  g1(8,42)=(-1);
  g1(8,43)=1;
  g1(9,42)=(-1);
  g1(9,43)=(-1);
  g1(9,44)=1;
  g1(10,36)=1-params(1);
  g1(10,38)=(-(params(10)+params(5)+params(6)));
  g1(10,39)=(-(params(14)+params(15)));
  g1(10,40)=(-(params(23)+params(24)));
  g1(10,42)=(-params(7));
  g1(10,43)=(-params(8));
  g1(11,41)=1;
  g1(12,4)=(-params(43));
  g1(12,11)=(-(1-params(43)));
  g1(12,25)=1;
  g1(13,3)=1;
  g1(13,4)=(-T88);
  g1(14,4)=1;
  g1(14,5)=1;
  g1(14,10)=(-1);
  g1(14,11)=(-1);
  g1(15,3)=(-1);
  g1(15,5)=1;
  g1(15,32)=(-1);
  g1(16,6)=(-(T104*1/T109));
  g1(16,8)=1-(1+params(75)*params(73))*T104;
  g1(16,28)=(-1);
  g1(17,4)=(-(params(78)/(params(78)+1-params(47))));
  g1(17,6)=1-T138;
  g1(17,12)=1;
  g1(17,26)=(-(1/T127));
  g1(18,7)=T395;
  g1(18,12)=T127;
  g1(18,26)=(-1);
  g1(19,3)=(-params(86));
  g1(19,7)=(-params(85));
  g1(19,8)=(-params(84));
  g1(19,9)=1;
  g1(19,27)=(-1);
  g1(20,5)=(-(params(43)*params(52)));
  g1(20,9)=1;
  g1(20,10)=(-((1-params(43))*params(52)));
  g1(20,25)=(-params(52));
  g1(21,7)=(-T397);
  g1(21,10)=(-params(57));
  g1(21,11)=1;
  g1(22,8)=(-params(80));
  g1(22,28)=(-(T109*params(80)));
  g1(22,32)=1-(1-params(80));
  g1(23,13)=1;
  g1(23,15)=(-params(43));
  g1(23,23)=(-(1-params(43)));
  g1(23,25)=1;
  g1(24,14)=1;
  g1(24,15)=(-T88);
  g1(25,15)=1;
  g1(25,16)=1;
  g1(25,21)=(-1);
  g1(25,23)=(-1);
  g1(26,14)=(-1);
  g1(26,16)=1;
  g1(26,33)=(-1);
  g1(27,17)=(-(T104*1/T109));
  g1(27,19)=1-(1+params(75)*params(73))*T104;
  g1(27,28)=(-1);
  g1(28,15)=(-(params(78)/(params(78)+1-params(47))));
  g1(28,17)=1-T138;
  g1(28,22)=(-1);
  g1(28,24)=1;
  g1(28,26)=(-(1/T127));
  g1(29,18)=T395;
  g1(29,22)=(-T127);
  g1(29,24)=T127;
  g1(29,26)=(-1);
  g1(30,14)=(-params(86));
  g1(30,18)=(-params(85));
  g1(30,19)=(-params(84));
  g1(30,20)=1;
  g1(30,27)=(-1);
  g1(31,16)=(-(params(43)*params(52)));
  g1(31,20)=1;
  g1(31,21)=(-((1-params(43))*params(52)));
  g1(31,25)=(-params(52));
  g1(32,13)=(-(T253*T267));
  g1(32,22)=1-T253*(params(75)*params(73)+params(55));
  g1(32,30)=(-1);
  g1(33,18)=(-(T302*T397));
  g1(33,21)=(-(params(57)*T302));
  g1(33,22)=(-(T275+params(53)/(1+params(75)*params(73))-(1+params(75)*params(73)*params(53))/(1+params(75)*params(73))));
  g1(33,23)=1-(T104+T275-T302);
  g1(33,31)=(-1);
  g1(34,25)=1-params(64);
  g1(35,26)=1-params(65);
  g1(36,27)=1-params(66);
  g1(36,35)=(-1);
  g1(37,28)=1-params(67);
  g1(38,29)=1-params(68);
  g1(39,2)=(-(1-params(42)));
  g1(39,30)=1-params(69);
  g1(40,2)=1;
  g1(41,1)=(-(1-params(41)));
  g1(41,31)=1-params(70);
  g1(42,1)=1;
  g1(43,19)=(-params(80));
  g1(43,28)=(-(params(46)*T107*params(80)));
  g1(43,33)=1-(1-params(80));
  g1(44,34)=1;
  g1(44,38)=(-0.25);
  g1(44,42)=(-0.25);
  g1(44,43)=(-0.5);
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],44,1936);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],44,85184);
end
end
end
end
