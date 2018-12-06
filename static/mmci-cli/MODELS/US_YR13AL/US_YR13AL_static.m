function [residual, g1, g2, g3] = US_YR13AL_static(y, x, params)
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

residual = zeros( 39, 1);

%
% Model equations
%

T104 = 1/(params(42)/(1-params(42)));
T120 = 1/(1+params(87)*params(85));
T123 = params(85)^2;
T136 = params(47)/params(85);
T150 = (1-T136)/((1+T136)*params(46));
T181 = params(65)*params(96)/params(93)*(1-params(88)/params(65))*(1-1/params(64));
T197 = 1/(1+params(87)*params(85)*params(53));
T211 = (1-params(54))*(1-params(87)*params(85)*params(54))/params(54)/(1+(params(50)-1)*params(37));
T219 = params(87)*params(85)/(1+params(87)*params(85));
T246 = (1-params(52))*(1-params(87)*params(85)*params(52))/((1+params(87)*params(85))*params(52))*1/(1+(params(56)-1)*params(35));
T318 = y(5)*(params(65)-1+params(66))/params(65)+y(7)*(1-params(66))/params(65);
lhs =y(29);
rhs =y(14)*4;
residual(1)= lhs-rhs;
lhs =y(30);
rhs =y(27);
residual(2)= lhs-rhs;
lhs =y(31);
rhs =4*y(12);
residual(3)= lhs-rhs;
lhs =y(35);
rhs =y(10)-params(50)*y(15);
residual(4)= lhs-rhs;
lhs =y(36);
rhs =y(10);
residual(5)= lhs-rhs;
lhs =y(37);
rhs =y(28);
residual(6)= lhs-rhs;
lhs =y(32);
rhs =y(31);
residual(7)= lhs-rhs;
lhs =y(33);
rhs =y(32);
residual(8)= lhs-rhs;
lhs =y(34);
rhs =y(32)+y(33);
residual(9)= lhs-rhs;
lhs =y(38);
rhs =y(1)+y(2);
residual(10)= lhs-rhs;
lhs =y(39);
rhs =y(1)+y(2);
residual(11)= lhs-rhs;
lhs =y(29);
rhs =y(29)*params(1)+y(31)*params(5)+y(31)*params(6)+y(32)*params(7)+y(33)*params(8)+y(31)*params(10)+y(35)*params(14)+y(35)*params(15)+y(36)*params(23)+y(36)*params(24)+params(32)*x(6);
residual(12)= lhs-rhs;
lhs =y(37);
rhs =params(34)*x(7);
residual(13)= lhs-rhs;
lhs =y(27);
rhs =0.25*(y(33)+y(33)+y(31)+y(32));
residual(14)= lhs-rhs;
lhs =y(3);
rhs =params(41)*y(5)+(1-params(41))*y(13)-y(15);
residual(15)= lhs-rhs;
lhs =y(4);
rhs =y(5)*T104;
residual(16)= lhs-rhs;
lhs =y(5);
rhs =y(13)+y(11)-y(6);
residual(17)= lhs-rhs;
lhs =y(6);
rhs =y(4)+y(21);
residual(18)= lhs-rhs;
lhs =y(9);
rhs =T120*(y(9)+y(9)*params(87)*params(85)+1/(T123*params(44))*y(7))+y(18);
residual(19)= lhs-rhs;
lhs =y(8);
rhs =y(8)*T136/(1+T136)+y(8)*1/(1+T136)-T150*(y(14)-y(12)+y(16));
residual(20)= lhs-rhs;
lhs =y(10);
rhs =y(8)*params(97)+y(9)*params(96)+y(17)+y(4)*(params(65)-1+params(45))*params(96)/params(93)+T181*(y(6)+y(7)+y(22));
residual(21)= lhs-rhs;
lhs =y(10);
rhs =params(50)*(y(15)+params(41)*y(6)+(1-params(41))*y(11));
residual(22)= lhs-rhs;
lhs =y(12);
rhs =T197*(y(12)*params(87)*params(85)+y(12)*params(53)+y(3)*T211)+y(19);
residual(23)= lhs-rhs;
lhs =y(13);
rhs =y(13)*T120+y(13)*T219+y(12)*params(51)/(1+params(87)*params(85))-y(12)*(1+params(87)*params(85)*params(51))/(1+params(87)*params(85))+y(12)*T219+T246*(y(11)*params(55)+y(8)*1/(1-T136)-y(8)*T136/(1-T136)-y(13))+y(20);
residual(24)= lhs-rhs;
lhs =y(21);
rhs =y(21)*(1-params(92))+y(9)*params(92)+y(18)*params(44)*T123*params(92);
residual(25)= lhs-rhs;
lhs =y(15);
rhs =y(15)*params(67)+x(1);
residual(26)= lhs-rhs;
lhs =y(16);
rhs =y(16)*params(69)+x(2);
residual(27)= lhs-rhs;
lhs =y(17);
rhs =y(28)+y(17)*params(70)+x(1)*params(36);
residual(28)= lhs-rhs;
lhs =y(18);
rhs =y(18)*params(72)+x(3);
residual(29)= lhs-rhs;
lhs =y(19);
rhs =y(2)+y(19)*params(74)-y(2)*params(77);
residual(30)= lhs-rhs;
lhs =y(2);
rhs =x(4);
residual(31)= lhs-rhs;
lhs =y(20);
rhs =y(1)+y(20)*params(75)-y(1)*params(76);
residual(32)= lhs-rhs;
lhs =y(1);
rhs =x(5);
residual(33)= lhs-rhs;
lhs =y(7)+y(22);
rhs =T318;
residual(34)= lhs-rhs;
lhs =y(25)/(params(65)*params(63));
rhs =y(25)+y(24)+params(64)*(y(22)-y(24));
residual(35)= lhs-rhs;
lhs =y(7)+y(23);
rhs =T318;
residual(36)= lhs-rhs;
lhs =y(24)-(y(14)-y(12)+y(16));
rhs =(-params(62))*(y(25)-y(7)-y(6));
residual(37)= lhs-rhs;
lhs =y(24);
rhs =y(23);
residual(38)= lhs-rhs;
lhs =y(26);
rhs =y(24)-(y(14)-y(12)+y(16));
residual(39)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(39, 39);

  %
  % Jacobian matrix
  %

  g1(1,14)=(-4);
  g1(1,29)=1;
  g1(2,27)=(-1);
  g1(2,30)=1;
  g1(3,12)=(-4);
  g1(3,31)=1;
  g1(4,10)=(-1);
  g1(4,15)=params(50);
  g1(4,35)=1;
  g1(5,10)=(-1);
  g1(5,36)=1;
  g1(6,28)=(-1);
  g1(6,37)=1;
  g1(7,31)=(-1);
  g1(7,32)=1;
  g1(8,32)=(-1);
  g1(8,33)=1;
  g1(9,32)=(-1);
  g1(9,33)=(-1);
  g1(9,34)=1;
  g1(10,1)=(-1);
  g1(10,2)=(-1);
  g1(10,38)=1;
  g1(11,1)=(-1);
  g1(11,2)=(-1);
  g1(11,39)=1;
  g1(12,29)=1-params(1);
  g1(12,31)=(-(params(10)+params(5)+params(6)));
  g1(12,32)=(-params(7));
  g1(12,33)=(-params(8));
  g1(12,35)=(-(params(14)+params(15)));
  g1(12,36)=(-(params(23)+params(24)));
  g1(13,37)=1;
  g1(14,27)=1;
  g1(14,31)=(-0.25);
  g1(14,32)=(-0.25);
  g1(14,33)=(-0.5);
  g1(15,3)=1;
  g1(15,5)=(-params(41));
  g1(15,13)=(-(1-params(41)));
  g1(15,15)=1;
  g1(16,4)=1;
  g1(16,5)=(-T104);
  g1(17,5)=1;
  g1(17,6)=1;
  g1(17,11)=(-1);
  g1(17,13)=(-1);
  g1(18,4)=(-1);
  g1(18,6)=1;
  g1(18,21)=(-1);
  g1(19,7)=(-(T120*1/(T123*params(44))));
  g1(19,9)=1-(1+params(87)*params(85))*T120;
  g1(19,18)=(-1);
  g1(20,8)=1-(T136/(1+T136)+1/(1+T136));
  g1(20,12)=(-T150);
  g1(20,14)=T150;
  g1(20,16)=T150;
  g1(21,4)=(-((params(65)-1+params(45))*params(96)/params(93)));
  g1(21,6)=(-T181);
  g1(21,7)=(-T181);
  g1(21,8)=(-params(97));
  g1(21,9)=(-params(96));
  g1(21,10)=1;
  g1(21,17)=(-1);
  g1(21,22)=(-T181);
  g1(22,6)=(-(params(50)*params(41)));
  g1(22,10)=1;
  g1(22,11)=(-(params(50)*(1-params(41))));
  g1(22,15)=(-params(50));
  g1(23,3)=(-(T197*T211));
  g1(23,12)=1-T197*(params(87)*params(85)+params(53));
  g1(23,19)=(-1);
  g1(24,8)=(-(T246*(1/(1-T136)-T136/(1-T136))));
  g1(24,11)=(-(T246*params(55)));
  g1(24,12)=(-(T219+params(51)/(1+params(87)*params(85))-(1+params(87)*params(85)*params(51))/(1+params(87)*params(85))));
  g1(24,13)=1-(T120+T219-T246);
  g1(24,20)=(-1);
  g1(25,9)=(-params(92));
  g1(25,18)=(-(params(44)*T123*params(92)));
  g1(25,21)=1-(1-params(92));
  g1(26,15)=1-params(67);
  g1(27,16)=1-params(69);
  g1(28,17)=1-params(70);
  g1(28,28)=(-1);
  g1(29,18)=1-params(72);
  g1(30,2)=(-(1-params(77)));
  g1(30,19)=1-params(74);
  g1(31,2)=1;
  g1(32,1)=(-(1-params(76)));
  g1(32,20)=1-params(75);
  g1(33,1)=1;
  g1(34,5)=(-((params(65)-1+params(66))/params(65)));
  g1(34,7)=1-(1-params(66))/params(65);
  g1(34,22)=1;
  g1(35,22)=(-params(64));
  g1(35,24)=(-(1-params(64)));
  g1(35,25)=1/(params(65)*params(63))-1;
  g1(36,5)=(-((params(65)-1+params(66))/params(65)));
  g1(36,7)=1-(1-params(66))/params(65);
  g1(36,23)=1;
  g1(37,6)=(-params(62));
  g1(37,7)=(-params(62));
  g1(37,12)=1;
  g1(37,14)=(-1);
  g1(37,16)=(-1);
  g1(37,24)=1;
  g1(37,25)=params(62);
  g1(38,23)=(-1);
  g1(38,24)=1;
  g1(39,12)=(-1);
  g1(39,14)=1;
  g1(39,16)=1;
  g1(39,24)=(-1);
  g1(39,26)=1;
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],39,1521);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],39,59319);
end
end
end
end
