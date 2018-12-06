function [residual, g1, g2, g3] = NK_CDDL17_static(y, x, params)
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

residual = zeros( 73, 1);

%
% Model equations
%

T244 = params(43)^(-params(40));
T256 = params(43)^(1-params(40));
T319 = (1+params(46))*(1+params(53)*params(44)/(1-params(44))+params(47)*params(53)/((1-params(47))*(1-params(44)))+params(45)/((1-params(47))*(1+params(46))));
lhs =y(45);
rhs =4*(y(15)-(y(15)));
residual(1)= lhs-rhs;
lhs =y(46);
rhs =0.25*(4*y(10)+4*y(10)+4*y(10)+4*y(10));
residual(2)= lhs-rhs;
lhs =y(47);
rhs =4*y(10);
residual(3)= lhs-rhs;
lhs =y(48);
rhs =y(2)-y(23);
residual(4)= lhs-rhs;
lhs =y(49);
rhs =y(2);
residual(5)= lhs-rhs;
lhs =y(45);
rhs =params(32)*x(4)+y(49)*params(31)+y(49)*params(30)+y(49)*params(29)+y(49)*params(28)+y(49)*params(27)+y(49)*params(26)+y(49)*params(25)+y(49)*params(24)+y(49)*params(23)+y(48)*params(22)+y(48)*params(21)+y(48)*params(20)+y(48)*params(19)+y(48)*params(18)+y(48)*params(17)+y(48)*params(16)+y(48)*params(15)+y(48)*params(14)+y(47)*params(13)+y(47)*params(12)+y(47)*params(11)+y(47)*params(10)+y(47)*params(6)+y(47)*params(5)+y(45)*params(1)+y(45)*params(2)+y(45)*params(3)+y(45)*params(4)+y(47)*params(7)+y(47)*params(8)+y(47)*params(9);
residual(6)= lhs-rhs;
residual(7) = y(1)+y(17);
lhs =log(params(37))+(1+params(36))*y(5);
rhs =y(2)+y(17)+log(1-params(38))+y(7);
residual(8)= lhs-rhs;
lhs =y(2)+y(11);
rhs =y(40)+params(38)*y(4)+y(5)*(1-params(38));
residual(9)= lhs-rhs;
lhs =exp(y(6));
rhs =exp(y(3))+(1-params(39))*exp(y(4));
residual(10)= lhs-rhs;
lhs =exp(y(4));
rhs =(1-params(47))*exp(y(41))*exp(y(19))+exp(y(18));
residual(11)= lhs-rhs;
lhs =exp(y(2));
rhs =exp(y(3))+exp(y(1))+exp(y(18)+y(42));
residual(12)= lhs-rhs;
lhs =y(17);
rhs =y(15)+y(17)+log(params(35))-y(10);
residual(13)= lhs-rhs;
lhs =exp(y(17)-y(10)+y(14));
rhs =params(38)*exp(y(2)+y(17)+y(7)-y(4))+(1-params(39))*exp(y(17));
residual(14)= lhs-rhs;
lhs =exp(y(8));
rhs =params(41)*exp(y(7)+y(2)+y(17))+params(35)*params(42)*T244*exp(y(8)+y(10)*params(40));
residual(15)= lhs-rhs;
lhs =exp(y(9));
rhs =exp(y(2)+y(17))+params(35)*params(42)*T256*exp(y(9)+y(10)*(params(40)-1));
residual(16)= lhs-rhs;
lhs =1;
rhs =params(42)*T256*exp(y(10)*(params(40)-1))+(1-params(42))*exp((1-params(40))*(y(8)-y(9)));
residual(17)= lhs-rhs;
lhs =exp(y(11));
rhs =params(42)*T244*exp(y(11)+y(10)*params(40))+(1-params(42))*exp((-params(40))*(y(8)-y(9)));
residual(18)= lhs-rhs;
lhs =y(12);
rhs =y(6)+log(params(53));
residual(19)= lhs-rhs;
lhs =exp(y(6));
rhs =exp(y(13))+exp(y(12));
residual(20)= lhs-rhs;
lhs =exp(y(6));
rhs =exp(y(19))+exp(y(18));
residual(21)= lhs-rhs;
lhs =exp(y(19));
rhs =exp(y(18))*params(46);
residual(22)= lhs-rhs;
lhs =exp(y(14)-y(15))*(1+exp(y(41))*params(46));
rhs =T319;
residual(23)= lhs-rhs;
lhs =y(16);
rhs =y(41)+y(14);
residual(24)= lhs-rhs;
residual(25) = y(22)+y(37);
lhs =log(params(37))+(1+params(36))*y(26);
rhs =y(23)+log(1-params(38))+y(37)+y(28);
residual(26)= lhs-rhs;
lhs =y(23)+y(31);
rhs =y(40)+params(38)*y(25)+(1-params(38))*y(26);
residual(27)= lhs-rhs;
lhs =exp(y(27));
rhs =exp(y(24))+(1-params(39))*exp(y(25));
residual(28)= lhs-rhs;
lhs =exp(y(25));
rhs =(1-params(47))*exp(y(41))*exp(y(39))+exp(y(38));
residual(29)= lhs-rhs;
lhs =exp(y(23));
rhs =exp(y(24))+exp(y(22))+exp(y(42)+y(27));
residual(30)= lhs-rhs;
lhs =y(37);
rhs =log(params(35))+y(37)+y(35)-y(10);
residual(31)= lhs-rhs;
lhs =exp(y(37)-y(10)+y(34));
rhs =params(38)*exp(y(23)+y(37)+y(28)-y(25))+(1-params(39))*exp(y(37));
residual(32)= lhs-rhs;
lhs =exp(y(29));
rhs =params(41)*exp(y(28)+y(23)+y(37))+T244*params(35)*params(52)*exp(y(10)*params(40)+y(29));
residual(33)= lhs-rhs;
lhs =exp(y(30));
rhs =exp(y(23)+y(37))+exp(y(9)+y(10)*(params(40)-1))*T256*params(35)*params(52);
residual(34)= lhs-rhs;
lhs =1;
rhs =exp(y(10)*(params(40)-1))*T256*params(52)+(1-params(42))*exp((1-params(40))*(y(29)-y(30)));
residual(35)= lhs-rhs;
lhs =exp(y(31));
rhs =T244*params(52)*exp(y(10)*params(40)+y(31))+(1-params(42))*exp((-params(40))*(y(29)-y(30)));
residual(36)= lhs-rhs;
lhs =y(32);
rhs =log(params(53))+y(27);
residual(37)= lhs-rhs;
lhs =exp(y(27));
rhs =exp(y(33))+exp(y(32));
residual(38)= lhs-rhs;
lhs =exp(y(27));
rhs =exp(y(39))+exp(y(38));
residual(39)= lhs-rhs;
lhs =exp(y(39));
rhs =params(46)*exp(y(38));
residual(40)= lhs-rhs;
lhs =(1+exp(y(41))*params(46))*exp(y(34)-y(35));
rhs =T319;
residual(41)= lhs-rhs;
lhs =y(36);
rhs =y(41)+y(34);
residual(42)= lhs-rhs;
lhs =y(20);
rhs =y(1)-params(37)*exp((1+params(36))*y(5))/(1+params(36));
residual(43)= lhs-rhs;
lhs =y(21);
rhs =y(20)+params(35)*y(21);
residual(44)= lhs-rhs;
lhs =y(50);
rhs =y(35)-y(10);
residual(45)= lhs-rhs;
lhs =y(40);
rhs =y(40)*params(48)+x(1);
residual(46)= lhs-rhs;
lhs =y(41);
rhs =y(41)*params(49)+(1-params(49))*params(51)+x(2);
residual(47)= lhs-rhs;
lhs =y(42);
rhs =y(42)*params(50)+(1-params(50))*log(params(45))+x(3);
residual(48)= lhs-rhs;
lhs =y(43);
rhs =params(53);
residual(49)= lhs-rhs;
lhs =exp(y(44));
rhs =1+params(38)*exp(y(2)+y(7)-y(4))-params(39);
residual(50)= lhs-rhs;
lhs =y(51);
rhs =y(47);
residual(51)= lhs-rhs;
lhs =y(52);
rhs =y(47);
residual(52)= lhs-rhs;
lhs =y(53);
rhs =y(47);
residual(53)= lhs-rhs;
lhs =y(54);
rhs =y(48);
residual(54)= lhs-rhs;
lhs =y(55);
rhs =y(48);
residual(55)= lhs-rhs;
lhs =y(56);
rhs =y(48);
residual(56)= lhs-rhs;
lhs =y(57);
rhs =y(49);
residual(57)= lhs-rhs;
lhs =y(58);
rhs =y(49);
residual(58)= lhs-rhs;
lhs =y(59);
rhs =y(49);
residual(59)= lhs-rhs;
lhs =y(60);
rhs =y(10);
residual(60)= lhs-rhs;
lhs =y(61);
rhs =y(10);
residual(61)= lhs-rhs;
lhs =y(62);
rhs =y(49);
residual(62)= lhs-rhs;
lhs =y(63);
rhs =y(49);
residual(63)= lhs-rhs;
lhs =y(64);
rhs =y(49);
residual(64)= lhs-rhs;
lhs =y(65);
rhs =y(48);
residual(65)= lhs-rhs;
lhs =y(66);
rhs =y(48);
residual(66)= lhs-rhs;
lhs =y(67);
rhs =y(48);
residual(67)= lhs-rhs;
lhs =y(68);
rhs =y(45);
residual(68)= lhs-rhs;
lhs =y(69);
rhs =y(45);
residual(69)= lhs-rhs;
lhs =y(70);
rhs =y(45);
residual(70)= lhs-rhs;
lhs =y(71);
rhs =y(47);
residual(71)= lhs-rhs;
lhs =y(72);
rhs =y(47);
residual(72)= lhs-rhs;
lhs =y(73);
rhs =y(47);
residual(73)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(73, 73);

  %
  % Jacobian matrix
  %

  g1(1,45)=1;
  g1(2,10)=(-4);
  g1(2,46)=1;
  g1(3,10)=(-4);
  g1(3,47)=1;
  g1(4,2)=(-1);
  g1(4,23)=1;
  g1(4,48)=1;
  g1(5,2)=(-1);
  g1(5,49)=1;
  g1(6,45)=1-(params(4)+params(3)+params(1)+params(2));
  g1(6,47)=(-(params(13)+params(12)+params(11)+params(10)+params(9)+params(8)+params(7)+params(6)+params(5)));
  g1(6,48)=(-(params(22)+params(21)+params(20)+params(19)+params(18)+params(17)+params(16)+params(15)+params(14)));
  g1(6,49)=(-(params(31)+params(30)+params(29)+params(28)+params(27)+params(26)+params(25)+params(24)+params(23)));
  g1(7,1)=1;
  g1(7,17)=1;
  g1(8,2)=(-1);
  g1(8,5)=1+params(36);
  g1(8,7)=(-1);
  g1(8,17)=(-1);
  g1(9,2)=1;
  g1(9,4)=(-params(38));
  g1(9,5)=(-(1-params(38)));
  g1(9,11)=1;
  g1(9,40)=(-1);
  g1(10,3)=(-exp(y(3)));
  g1(10,4)=(-((1-params(39))*exp(y(4))));
  g1(10,6)=exp(y(6));
  g1(11,4)=exp(y(4));
  g1(11,18)=(-exp(y(18)));
  g1(11,19)=(-((1-params(47))*exp(y(41))*exp(y(19))));
  g1(11,41)=(-((1-params(47))*exp(y(41))*exp(y(19))));
  g1(12,1)=(-exp(y(1)));
  g1(12,2)=exp(y(2));
  g1(12,3)=(-exp(y(3)));
  g1(12,18)=(-exp(y(18)+y(42)));
  g1(12,42)=(-exp(y(18)+y(42)));
  g1(13,10)=1;
  g1(13,15)=(-1);
  g1(14,2)=(-(params(38)*exp(y(2)+y(17)+y(7)-y(4))));
  g1(14,4)=(-(params(38)*(-exp(y(2)+y(17)+y(7)-y(4)))));
  g1(14,7)=(-(params(38)*exp(y(2)+y(17)+y(7)-y(4))));
  g1(14,10)=(-exp(y(17)-y(10)+y(14)));
  g1(14,14)=exp(y(17)-y(10)+y(14));
  g1(14,17)=exp(y(17)-y(10)+y(14))-(params(38)*exp(y(2)+y(17)+y(7)-y(4))+(1-params(39))*exp(y(17)));
  g1(15,2)=(-(params(41)*exp(y(7)+y(2)+y(17))));
  g1(15,7)=(-(params(41)*exp(y(7)+y(2)+y(17))));
  g1(15,8)=exp(y(8))-params(35)*params(42)*T244*exp(y(8)+y(10)*params(40));
  g1(15,10)=(-(params(35)*params(42)*T244*params(40)*exp(y(8)+y(10)*params(40))));
  g1(15,17)=(-(params(41)*exp(y(7)+y(2)+y(17))));
  g1(16,2)=(-exp(y(2)+y(17)));
  g1(16,9)=exp(y(9))-params(35)*params(42)*T256*exp(y(9)+y(10)*(params(40)-1));
  g1(16,10)=(-(params(35)*params(42)*T256*(params(40)-1)*exp(y(9)+y(10)*(params(40)-1))));
  g1(16,17)=(-exp(y(2)+y(17)));
  g1(17,8)=(-((1-params(42))*(1-params(40))*exp((1-params(40))*(y(8)-y(9)))));
  g1(17,9)=(-((1-params(42))*exp((1-params(40))*(y(8)-y(9)))*(-(1-params(40)))));
  g1(17,10)=(-(params(42)*T256*(params(40)-1)*exp(y(10)*(params(40)-1))));
  g1(18,8)=(-((1-params(42))*(-params(40))*exp((-params(40))*(y(8)-y(9)))));
  g1(18,9)=(-((1-params(42))*params(40)*exp((-params(40))*(y(8)-y(9)))));
  g1(18,10)=(-(params(42)*T244*params(40)*exp(y(11)+y(10)*params(40))));
  g1(18,11)=exp(y(11))-params(42)*T244*exp(y(11)+y(10)*params(40));
  g1(19,6)=(-1);
  g1(19,12)=1;
  g1(20,6)=exp(y(6));
  g1(20,12)=(-exp(y(12)));
  g1(20,13)=(-exp(y(13)));
  g1(21,6)=exp(y(6));
  g1(21,18)=(-exp(y(18)));
  g1(21,19)=(-exp(y(19)));
  g1(22,18)=(-(exp(y(18))*params(46)));
  g1(22,19)=exp(y(19));
  g1(23,14)=exp(y(14)-y(15))*(1+exp(y(41))*params(46));
  g1(23,15)=(1+exp(y(41))*params(46))*(-exp(y(14)-y(15)));
  g1(23,41)=exp(y(14)-y(15))*exp(y(41))*params(46);
  g1(24,14)=(-1);
  g1(24,16)=1;
  g1(24,41)=(-1);
  g1(25,22)=1;
  g1(25,37)=1;
  g1(26,23)=(-1);
  g1(26,26)=1+params(36);
  g1(26,28)=(-1);
  g1(26,37)=(-1);
  g1(27,23)=1;
  g1(27,25)=(-params(38));
  g1(27,26)=(-(1-params(38)));
  g1(27,31)=1;
  g1(27,40)=(-1);
  g1(28,24)=(-exp(y(24)));
  g1(28,25)=(-((1-params(39))*exp(y(25))));
  g1(28,27)=exp(y(27));
  g1(29,25)=exp(y(25));
  g1(29,38)=(-exp(y(38)));
  g1(29,39)=(-((1-params(47))*exp(y(41))*exp(y(39))));
  g1(29,41)=(-((1-params(47))*exp(y(41))*exp(y(39))));
  g1(30,22)=(-exp(y(22)));
  g1(30,23)=exp(y(23));
  g1(30,24)=(-exp(y(24)));
  g1(30,27)=(-exp(y(42)+y(27)));
  g1(30,42)=(-exp(y(42)+y(27)));
  g1(31,10)=1;
  g1(31,35)=(-1);
  g1(32,10)=(-exp(y(37)-y(10)+y(34)));
  g1(32,23)=(-(params(38)*exp(y(23)+y(37)+y(28)-y(25))));
  g1(32,25)=(-(params(38)*(-exp(y(23)+y(37)+y(28)-y(25)))));
  g1(32,28)=(-(params(38)*exp(y(23)+y(37)+y(28)-y(25))));
  g1(32,34)=exp(y(37)-y(10)+y(34));
  g1(32,37)=exp(y(37)-y(10)+y(34))-(params(38)*exp(y(23)+y(37)+y(28)-y(25))+(1-params(39))*exp(y(37)));
  g1(33,10)=(-(T244*params(35)*params(52)*params(40)*exp(y(10)*params(40)+y(29))));
  g1(33,23)=(-(params(41)*exp(y(28)+y(23)+y(37))));
  g1(33,28)=(-(params(41)*exp(y(28)+y(23)+y(37))));
  g1(33,29)=exp(y(29))-T244*params(35)*params(52)*exp(y(10)*params(40)+y(29));
  g1(33,37)=(-(params(41)*exp(y(28)+y(23)+y(37))));
  g1(34,9)=(-(exp(y(9)+y(10)*(params(40)-1))*T256*params(35)*params(52)));
  g1(34,10)=(-(T256*params(35)*params(52)*(params(40)-1)*exp(y(9)+y(10)*(params(40)-1))));
  g1(34,23)=(-exp(y(23)+y(37)));
  g1(34,30)=exp(y(30));
  g1(34,37)=(-exp(y(23)+y(37)));
  g1(35,10)=(-(T256*params(52)*(params(40)-1)*exp(y(10)*(params(40)-1))));
  g1(35,29)=(-((1-params(42))*(1-params(40))*exp((1-params(40))*(y(29)-y(30)))));
  g1(35,30)=(-((1-params(42))*exp((1-params(40))*(y(29)-y(30)))*(-(1-params(40)))));
  g1(36,10)=(-(T244*params(52)*params(40)*exp(y(10)*params(40)+y(31))));
  g1(36,29)=(-((1-params(42))*(-params(40))*exp((-params(40))*(y(29)-y(30)))));
  g1(36,30)=(-((1-params(42))*params(40)*exp((-params(40))*(y(29)-y(30)))));
  g1(36,31)=exp(y(31))-T244*params(52)*exp(y(10)*params(40)+y(31));
  g1(37,27)=(-1);
  g1(37,32)=1;
  g1(38,27)=exp(y(27));
  g1(38,32)=(-exp(y(32)));
  g1(38,33)=(-exp(y(33)));
  g1(39,27)=exp(y(27));
  g1(39,38)=(-exp(y(38)));
  g1(39,39)=(-exp(y(39)));
  g1(40,38)=(-(params(46)*exp(y(38))));
  g1(40,39)=exp(y(39));
  g1(41,34)=(1+exp(y(41))*params(46))*exp(y(34)-y(35));
  g1(41,35)=(1+exp(y(41))*params(46))*(-exp(y(34)-y(35)));
  g1(41,41)=exp(y(41))*params(46)*exp(y(34)-y(35));
  g1(42,34)=(-1);
  g1(42,36)=1;
  g1(42,41)=(-1);
  g1(43,1)=(-1);
  g1(43,5)=params(37)*(1+params(36))*exp((1+params(36))*y(5))/(1+params(36));
  g1(43,20)=1;
  g1(44,20)=(-1);
  g1(44,21)=1-params(35);
  g1(45,10)=1;
  g1(45,35)=(-1);
  g1(45,50)=1;
  g1(46,40)=1-params(48);
  g1(47,41)=1-params(49);
  g1(48,42)=1-params(50);
  g1(49,43)=1;
  g1(50,2)=(-(params(38)*exp(y(2)+y(7)-y(4))));
  g1(50,4)=(-(params(38)*(-exp(y(2)+y(7)-y(4)))));
  g1(50,7)=(-(params(38)*exp(y(2)+y(7)-y(4))));
  g1(50,44)=exp(y(44));
  g1(51,47)=(-1);
  g1(51,51)=1;
  g1(52,47)=(-1);
  g1(52,52)=1;
  g1(53,47)=(-1);
  g1(53,53)=1;
  g1(54,48)=(-1);
  g1(54,54)=1;
  g1(55,48)=(-1);
  g1(55,55)=1;
  g1(56,48)=(-1);
  g1(56,56)=1;
  g1(57,49)=(-1);
  g1(57,57)=1;
  g1(58,49)=(-1);
  g1(58,58)=1;
  g1(59,49)=(-1);
  g1(59,59)=1;
  g1(60,10)=(-1);
  g1(60,60)=1;
  g1(61,10)=(-1);
  g1(61,61)=1;
  g1(62,49)=(-1);
  g1(62,62)=1;
  g1(63,49)=(-1);
  g1(63,63)=1;
  g1(64,49)=(-1);
  g1(64,64)=1;
  g1(65,48)=(-1);
  g1(65,65)=1;
  g1(66,48)=(-1);
  g1(66,66)=1;
  g1(67,48)=(-1);
  g1(67,67)=1;
  g1(68,45)=(-1);
  g1(68,68)=1;
  g1(69,45)=(-1);
  g1(69,69)=1;
  g1(70,45)=(-1);
  g1(70,70)=1;
  g1(71,47)=(-1);
  g1(71,71)=1;
  g1(72,47)=(-1);
  g1(72,72)=1;
  g1(73,47)=(-1);
  g1(73,73)=1;
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],73,5329);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],73,389017);
end
end
end
end
