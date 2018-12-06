function [residual, g1, g2] = US_CD08_static(y, x, params)
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
%                                          in order of declaration of the equations
%   g1        [M_.endo_nbr by M_.endo_nbr] double    Jacobian matrix of the static model equations;
%                                                     columns: variables in declaration order
%                                                     rows: equations in order of declaration
%   g2        [M_.endo_nbr by (M_.endo_nbr)^2] double   Hessian matrix of the static model equations;
%                                                       columns: variables in declaration order
%                                                       rows: equations in order of declaration
%
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

residual = zeros( 62, 1);

%
% Model equations
%

T166 = params(65)*(params(60)-1)/params(60);
T223 = params(63)/params(62);
T231 = y(14)*T223+(1-params(40))/params(62)*y(17)-y(17);
T359 = T223*y(31)+(1-params(40))/params(62)*y(32)-y(32);
lhs =y(35);
rhs =y(6)*400;
residual(1)= lhs-rhs;
lhs =y(36);
rhs =100*(y(16)+y(16)+y(49)+y(50));
residual(2)= lhs-rhs;
lhs =y(37);
rhs =400*y(16);
residual(3)= lhs-rhs;
lhs =y(39);
rhs =100*(y(9)-y(28));
residual(4)= lhs-rhs;
lhs =y(38);
rhs =100*y(9);
residual(5)= lhs-rhs;
lhs =y(35);
rhs =params(32)*x(5)+params(31)*y(48)+params(30)*y(47)+params(29)*y(46)+y(38)*params(28)+params(27)*y(53)+params(26)*y(52)+params(25)*y(51)+y(38)*params(24)+y(38)*params(23)+params(22)*y(45)+params(21)*y(44)+params(20)*y(43)+y(39)*params(19)+params(18)*y(56)+params(17)*y(55)+params(16)*y(54)+y(39)*params(15)+y(39)*params(14)+params(13)*y(42)+params(12)*y(41)+params(11)*y(40)+y(37)*params(10)+y(37)*params(6)+y(37)*params(5)+y(35)*params(1)+params(2)*y(57)+params(3)*y(58)+params(4)*y(59)+params(7)*y(60)+params(8)*y(61)+params(9)*y(62);
residual(6)= lhs-rhs;
lhs =((1-params(35))*params(64)-1)*y(2);
rhs =params(35)*y(1)+T166*(y(3)+(params(35)-1)*y(4))-params(35)*y(5);
residual(7)= lhs-rhs;
lhs =y(6)*params(35)/(params(60)-1);
rhs =y(2)+y(3)-y(4);
residual(8)= lhs-rhs;
lhs =params(69)*y(7);
rhs =(1-params(69))*(y(1)+y(8));
residual(9)= lhs-rhs;
lhs =y(1);
rhs =y(16)+y(1)-y(6);
residual(10)= lhs-rhs;
lhs =y(9);
rhs =params(36)*y(10)+y(7)*(1-params(36))+(1-params(36))*y(11);
residual(11)= lhs-rhs;
lhs =y(9);
rhs =y(2)*params(67)+params(70)*y(12);
residual(12)= lhs-rhs;
lhs =y(8);
rhs =y(9)+y(13)-y(7);
residual(13)= lhs-rhs;
lhs =y(14);
rhs =y(9)+y(13)-y(10);
residual(14)= lhs-rhs;
lhs =y(15);
rhs =y(16);
residual(15)= lhs-rhs;
lhs =y(19);
rhs =T231;
residual(16)= lhs-rhs;
lhs =y(17);
rhs =params(41)*(y(12)-y(10))-y(18);
residual(17)= lhs-rhs;
lhs =y(16);
rhs =y(16)*params(42)+y(13)*(1-params(42)*params(43))*(1-params(43))/params(43);
residual(18)= lhs-rhs;
lhs =y(10);
rhs =y(12)*params(40)+params(40)*y(18)+y(10)*(1-params(40));
residual(19)= lhs-rhs;
lhs =y(19);
rhs =y(6)-y(16)+params(44)*(y(10)+y(17)-y(20));
residual(20)= lhs-rhs;
lhs =y(21);
rhs =params(44)*(y(10)+y(17)-y(20));
residual(21)= lhs-rhs;
lhs =y(20)/(params(62)*params(45));
rhs =T231*params(72)-(y(6)-y(16))*(params(72)-1)-(y(10)+y(17))*params(44)*(params(72)-1)+y(20)*(1+params(44)*(params(72)-1));
residual(22)= lhs-rhs;
lhs =y(18);
rhs =y(18)*params(48)+x(1);
residual(23)= lhs-rhs;
lhs =y(11);
rhs =y(11)*params(46)+x(2);
residual(24)= lhs-rhs;
lhs =y(5);
rhs =y(5)*params(47)+x(3);
residual(25)= lhs-rhs;
lhs =y(3);
rhs =y(3)*params(49)+x(4);
residual(26)= lhs-rhs;
lhs =((1-params(35))*params(64)-1)*y(23);
rhs =params(35)*y(22)+T166*(y(3)+(params(35)-1)*y(24))-params(35)*y(5);
residual(27)= lhs-rhs;
lhs =params(35)*y(25)/(params(60)-1);
rhs =y(3)+y(23)-y(24);
residual(28)= lhs-rhs;
lhs =params(69)*y(26);
rhs =(1-params(69))*(y(22)+y(27));
residual(29)= lhs-rhs;
lhs =y(22);
rhs =y(22)-y(25);
residual(30)= lhs-rhs;
lhs =y(28);
rhs =(1-params(36))*y(11)+params(36)*y(29)+(1-params(36))*y(26);
residual(31)= lhs-rhs;
lhs =y(28);
rhs =params(67)*y(23)+params(70)*y(30);
residual(32)= lhs-rhs;
lhs =y(27);
rhs =y(28)-y(26);
residual(33)= lhs-rhs;
lhs =y(31);
rhs =y(28)-y(29);
residual(34)= lhs-rhs;
lhs =y(29);
rhs =params(40)*y(18)+params(40)*y(30)+(1-params(40))*y(29);
residual(35)= lhs-rhs;
lhs =y(33);
rhs =y(25)+params(44)*(y(29)+y(32)-y(34));
residual(36)= lhs-rhs;
lhs =y(34)/(params(62)*params(45));
rhs =params(72)*T359-(params(72)-1)*y(25)-params(44)*(params(72)-1)*(y(29)+y(32))+(1+params(44)*(params(72)-1))*y(34);
residual(37)= lhs-rhs;
lhs =y(33);
rhs =T359;
residual(38)= lhs-rhs;
lhs =y(32);
rhs =params(41)*(y(30)-y(29))-y(18);
residual(39)= lhs-rhs;
lhs =y(40);
rhs =y(37);
residual(40)= lhs-rhs;
lhs =y(41);
rhs =y(40);
residual(41)= lhs-rhs;
lhs =y(42);
rhs =y(41);
residual(42)= lhs-rhs;
lhs =y(43);
rhs =y(39);
residual(43)= lhs-rhs;
lhs =y(44);
rhs =y(43);
residual(44)= lhs-rhs;
lhs =y(45);
rhs =y(44);
residual(45)= lhs-rhs;
lhs =y(46);
rhs =y(38);
residual(46)= lhs-rhs;
lhs =y(47);
rhs =y(46);
residual(47)= lhs-rhs;
lhs =y(48);
rhs =y(47);
residual(48)= lhs-rhs;
lhs =y(49);
rhs =y(16);
residual(49)= lhs-rhs;
lhs =y(50);
rhs =y(49);
residual(50)= lhs-rhs;
lhs =y(51);
rhs =y(38);
residual(51)= lhs-rhs;
lhs =y(52);
rhs =y(51);
residual(52)= lhs-rhs;
lhs =y(53);
rhs =y(52);
residual(53)= lhs-rhs;
lhs =y(54);
rhs =y(39);
residual(54)= lhs-rhs;
lhs =y(55);
rhs =y(54);
residual(55)= lhs-rhs;
lhs =y(56);
rhs =y(55);
residual(56)= lhs-rhs;
lhs =y(57);
rhs =y(35);
residual(57)= lhs-rhs;
lhs =y(58);
rhs =y(57);
residual(58)= lhs-rhs;
lhs =y(59);
rhs =y(58);
residual(59)= lhs-rhs;
lhs =y(60);
rhs =y(37);
residual(60)= lhs-rhs;
lhs =y(61);
rhs =y(60);
residual(61)= lhs-rhs;
lhs =y(62);
rhs =y(61);
residual(62)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(62, 62);

  %
  % Jacobian matrix
  %

  g1(1,6)=(-400);
  g1(1,35)=1;
  g1(2,16)=(-200);
  g1(2,36)=1;
  g1(2,49)=(-100);
  g1(2,50)=(-100);
  g1(3,16)=(-400);
  g1(3,37)=1;
  g1(4,9)=(-100);
  g1(4,28)=100;
  g1(4,39)=1;
  g1(5,9)=(-100);
  g1(5,38)=1;
  g1(6,35)=1-params(1);
  g1(6,37)=(-(params(10)+params(6)+params(5)));
  g1(6,38)=(-(params(28)+params(24)+params(23)));
  g1(6,39)=(-(params(19)+params(15)+params(14)));
  g1(6,40)=(-params(11));
  g1(6,41)=(-params(12));
  g1(6,42)=(-params(13));
  g1(6,43)=(-params(20));
  g1(6,44)=(-params(21));
  g1(6,45)=(-params(22));
  g1(6,46)=(-params(29));
  g1(6,47)=(-params(30));
  g1(6,48)=(-params(31));
  g1(6,51)=(-params(25));
  g1(6,52)=(-params(26));
  g1(6,53)=(-params(27));
  g1(6,54)=(-params(16));
  g1(6,55)=(-params(17));
  g1(6,56)=(-params(18));
  g1(6,57)=(-params(2));
  g1(6,58)=(-params(3));
  g1(6,59)=(-params(4));
  g1(6,60)=(-params(7));
  g1(6,61)=(-params(8));
  g1(6,62)=(-params(9));
  g1(7,1)=(-params(35));
  g1(7,2)=(1-params(35))*params(64)-1;
  g1(7,3)=(-T166);
  g1(7,4)=(-(T166*(params(35)-1)));
  g1(7,5)=params(35);
  g1(8,2)=(-1);
  g1(8,3)=(-1);
  g1(8,4)=1;
  g1(8,6)=params(35)/(params(60)-1);
  g1(9,1)=(-(1-params(69)));
  g1(9,7)=params(69);
  g1(9,8)=(-(1-params(69)));
  g1(10,6)=1;
  g1(10,16)=(-1);
  g1(11,7)=(-(1-params(36)));
  g1(11,9)=1;
  g1(11,10)=(-params(36));
  g1(11,11)=(-(1-params(36)));
  g1(12,2)=(-params(67));
  g1(12,9)=1;
  g1(12,12)=(-params(70));
  g1(13,7)=1;
  g1(13,8)=1;
  g1(13,9)=(-1);
  g1(13,13)=(-1);
  g1(14,9)=(-1);
  g1(14,10)=1;
  g1(14,13)=(-1);
  g1(14,14)=1;
  g1(15,15)=1;
  g1(15,16)=(-1);
  g1(16,14)=(-T223);
  g1(16,17)=(-((1-params(40))/params(62)-1));
  g1(16,19)=1;
  g1(17,10)=params(41);
  g1(17,12)=(-params(41));
  g1(17,17)=1;
  g1(17,18)=1;
  g1(18,13)=(-((1-params(42)*params(43))*(1-params(43))/params(43)));
  g1(18,16)=1-params(42);
  g1(19,10)=1-(1-params(40));
  g1(19,12)=(-params(40));
  g1(19,18)=(-params(40));
  g1(20,6)=(-1);
  g1(20,10)=(-params(44));
  g1(20,16)=1;
  g1(20,17)=(-params(44));
  g1(20,19)=1;
  g1(20,20)=params(44);
  g1(21,10)=(-params(44));
  g1(21,17)=(-params(44));
  g1(21,20)=params(44);
  g1(21,21)=1;
  g1(22,6)=params(72)-1;
  g1(22,10)=params(44)*(params(72)-1);
  g1(22,14)=(-(T223*params(72)));
  g1(22,16)=(-(params(72)-1));
  g1(22,17)=(-(params(72)*((1-params(40))/params(62)-1)-params(44)*(params(72)-1)));
  g1(22,20)=1/(params(62)*params(45))-(1+params(44)*(params(72)-1));
  g1(23,18)=1-params(48);
  g1(24,11)=1-params(46);
  g1(25,5)=1-params(47);
  g1(26,3)=1-params(49);
  g1(27,3)=(-T166);
  g1(27,5)=params(35);
  g1(27,22)=(-params(35));
  g1(27,23)=(1-params(35))*params(64)-1;
  g1(27,24)=(-(T166*(params(35)-1)));
  g1(28,3)=(-1);
  g1(28,23)=(-1);
  g1(28,24)=1;
  g1(28,25)=params(35)/(params(60)-1);
  g1(29,22)=(-(1-params(69)));
  g1(29,26)=params(69);
  g1(29,27)=(-(1-params(69)));
  g1(30,25)=1;
  g1(31,11)=(-(1-params(36)));
  g1(31,26)=(-(1-params(36)));
  g1(31,28)=1;
  g1(31,29)=(-params(36));
  g1(32,23)=(-params(67));
  g1(32,28)=1;
  g1(32,30)=(-params(70));
  g1(33,26)=1;
  g1(33,27)=1;
  g1(33,28)=(-1);
  g1(34,28)=(-1);
  g1(34,29)=1;
  g1(34,31)=1;
  g1(35,18)=(-params(40));
  g1(35,29)=1-(1-params(40));
  g1(35,30)=(-params(40));
  g1(36,25)=(-1);
  g1(36,29)=(-params(44));
  g1(36,32)=(-params(44));
  g1(36,33)=1;
  g1(36,34)=params(44);
  g1(37,25)=params(72)-1;
  g1(37,29)=params(44)*(params(72)-1);
  g1(37,31)=(-(T223*params(72)));
  g1(37,32)=(-(params(72)*((1-params(40))/params(62)-1)-params(44)*(params(72)-1)));
  g1(37,34)=1/(params(62)*params(45))-(1+params(44)*(params(72)-1));
  g1(38,31)=(-T223);
  g1(38,32)=(-((1-params(40))/params(62)-1));
  g1(38,33)=1;
  g1(39,18)=1;
  g1(39,29)=params(41);
  g1(39,30)=(-params(41));
  g1(39,32)=1;
  g1(40,37)=(-1);
  g1(40,40)=1;
  g1(41,40)=(-1);
  g1(41,41)=1;
  g1(42,41)=(-1);
  g1(42,42)=1;
  g1(43,39)=(-1);
  g1(43,43)=1;
  g1(44,43)=(-1);
  g1(44,44)=1;
  g1(45,44)=(-1);
  g1(45,45)=1;
  g1(46,38)=(-1);
  g1(46,46)=1;
  g1(47,46)=(-1);
  g1(47,47)=1;
  g1(48,47)=(-1);
  g1(48,48)=1;
  g1(49,16)=(-1);
  g1(49,49)=1;
  g1(50,49)=(-1);
  g1(50,50)=1;
  g1(51,38)=(-1);
  g1(51,51)=1;
  g1(52,51)=(-1);
  g1(52,52)=1;
  g1(53,52)=(-1);
  g1(53,53)=1;
  g1(54,39)=(-1);
  g1(54,54)=1;
  g1(55,54)=(-1);
  g1(55,55)=1;
  g1(56,55)=(-1);
  g1(56,56)=1;
  g1(57,35)=(-1);
  g1(57,57)=1;
  g1(58,57)=(-1);
  g1(58,58)=1;
  g1(59,58)=(-1);
  g1(59,59)=1;
  g1(60,37)=(-1);
  g1(60,60)=1;
  g1(61,60)=(-1);
  g1(61,61)=1;
  g1(62,61)=(-1);
  g1(62,62)=1;
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],62,3844);
end
end
