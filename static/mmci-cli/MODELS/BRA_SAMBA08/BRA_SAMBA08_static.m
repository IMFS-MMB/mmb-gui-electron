function [residual, g1, g2, g3] = BRA_SAMBA08_static(y, x, params)
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

T193 = params(37)^(-1)*(1-params(40))/(1+params(40));
T218 = params(43)^(-1);
T364 = (1-params(35)*params(42))*(1-params(41))*(1-params(42))/(params(42)+params(41)*(1-params(42)*(1-params(35))));
T392 = params(52)/params(54);
T401 = T392*(1-params(53))/params(54);
lhs =y(43);
rhs =y(21)*400;
residual(1)= lhs-rhs;
lhs =y(44);
rhs =100*0.25*(4*y(18)+4*y(18)+4*y(18)+4*y(18));
residual(2)= lhs-rhs;
lhs =y(45);
rhs =400*y(18);
residual(3)= lhs-rhs;
lhs =y(46);
rhs =100*y(27);
residual(4)= lhs-rhs;
lhs =y(47);
rhs =100*y(26);
residual(5)= lhs-rhs;
lhs =y(48);
rhs =y(42);
residual(6)= lhs-rhs;
lhs =y(43);
rhs =params(32)*x(13)+y(47)*params(31)+y(47)*params(30)+y(47)*params(29)+y(47)*params(28)+y(47)*params(27)+y(47)*params(26)+y(47)*params(25)+y(47)*params(24)+y(47)*params(23)+y(46)*params(22)+y(46)*params(21)+y(46)*params(20)+y(46)*params(19)+y(46)*params(18)+y(46)*params(17)+y(46)*params(16)+y(46)*params(15)+y(46)*params(14)+y(45)*params(13)+y(45)*params(12)+y(45)*params(11)+y(45)*params(10)+y(45)*params(6)+y(45)*params(5)+y(43)*params(1)+y(43)*params(2)+y(43)*params(3)+y(43)*params(4)+y(45)*params(7)+y(45)*params(8)+y(45)*params(9);
residual(7)= lhs-rhs;
lhs =y(48);
rhs =params(34)*x(14);
residual(8)= lhs-rhs;
lhs =y(22);
rhs =y(22)*params(67)+(1-params(67))*(params(68)*y(23)-params(69)*y(24))+y(38);
residual(9)= lhs-rhs;
lhs =y(1);
rhs =y(1)*1/(1+params(40))+y(1)*params(40)/(1+params(40))-T193*(y(21)-y(18))+T193*(1-params(71))*y(31);
residual(10)= lhs-rhs;
lhs =y(2);
rhs =y(8)+y(5);
residual(11)= lhs-rhs;
lhs =y(3);
rhs =y(1)*(1-params(56))+y(2)*params(56);
residual(12)= lhs-rhs;
lhs =y(4);
rhs =T218*(y(8)-params(37)/(1-params(40))*(y(1)-y(1)*params(40))-y(32));
residual(13)= lhs-rhs;
lhs =y(5);
rhs =T218*(y(8)-params(37)/(1-params(40))*(y(2)-params(40)*y(2))-y(32));
residual(14)= lhs-rhs;
lhs =y(6);
rhs =y(4)*(1-params(57))+y(5)*params(57);
residual(15)= lhs-rhs;
lhs =y(7);
rhs =y(7)-(y(21)-y(18)-(y(41)+y(11)-y(40)));
residual(16)= lhs-rhs;
lhs =y(6);
rhs =y(26)-(1-params(44))*y(36)-y(8)*(params(44)+(1-params(44))*params(36))+(1-params(44))*params(36)*y(16)+params(44)*y(17);
residual(17)= lhs-rhs;
lhs =y(9)+y(10);
rhs =params(44)*y(17)+y(26)-(1-params(44))*y(36)-y(16)*(1-(1-params(44))*params(36))+y(8)*(1-params(44))*(1-params(36));
residual(18)= lhs-rhs;
lhs =y(11);
rhs =(-params(38))*y(19)+params(45)*y(34)+y(35);
residual(19)= lhs-rhs;
lhs =y(12);
rhs =y(12)*params(35)*(1-params(46))+y(16)*(1-params(35)*(1-params(46)))-(y(21)-y(18));
residual(20)= lhs-rhs;
lhs =y(13);
rhs =y(12)*1/(params(48)*(1+params(35)))+y(13)*params(35)/(1+params(35))+y(13)*1/(1+params(35))+(1-params(35)*params(72))/(1+params(35))*y(33);
residual(21)= lhs-rhs;
lhs =y(9);
rhs =y(9)*(1-params(46))+y(13)*params(58);
residual(22)= lhs-rhs;
lhs =y(14);
rhs =y(39)+y(7)*params(39);
residual(23)= lhs-rhs;
lhs =y(15);
rhs =y(26)-params(44)*(y(7)-y(17));
residual(24)= lhs-rhs;
lhs =y(16);
rhs =y(10)*params(47);
residual(25)= lhs-rhs;
lhs =y(17);
rhs =params(55)*(params(36)*y(16)+y(8)*(1-params(36))-y(36))+y(7)*(1-params(55));
residual(26)= lhs-rhs;
lhs =y(18);
rhs =y(17)*T364+y(18)*params(41)/(params(42)+params(41)*(1-params(42)*(1-params(35))))+y(18)*params(35)*params(42)/(params(42)+params(41)*(1-params(42)*(1-params(35))));
residual(27)= lhs-rhs;
lhs =y(19);
rhs =params(59)*params(60)*(y(19)+y(20)+params(61)*(-y(40)))+(y(41)+y(11))*params(61);
residual(28)= lhs-rhs;
lhs =y(20);
rhs =y(14)*params(53)/params(54)-y(15)*T392-y(27)*(params(53)-params(52))/params(54)-y(7)*T401;
residual(29)= lhs-rhs;
lhs =y(23)+y(30);
rhs =(-y(22));
residual(30)= lhs-rhs;
lhs =y(24);
rhs =params(62)*(y(22)+y(24)-params(63)*y(28))+y(21)*params(63);
residual(31)= lhs-rhs;
lhs =y(25);
rhs =y(27)+y(22)*params(54)/params(51)-y(7)*T392;
residual(32)= lhs-rhs;
lhs =y(26);
rhs =y(3)*params(49)+y(13)*params(50)+y(25)*params(51)+y(14)*params(53);
residual(33)= lhs-rhs;
lhs =y(27);
rhs =y(26)*1/params(54)-y(15)*T392;
residual(34)= lhs-rhs;
lhs =y(28);
rhs =y(18);
residual(35)= lhs-rhs;
lhs =y(29);
rhs =y(29)*params(78)+x(1);
residual(36)= lhs-rhs;
lhs =y(30);
rhs =y(30)*params(77)+x(2);
residual(37)= lhs-rhs;
lhs =y(31);
rhs =params(71)*y(31)+x(3);
residual(38)= lhs-rhs;
lhs =y(32);
rhs =y(32)*params(73)+x(4);
residual(39)= lhs-rhs;
lhs =y(33);
rhs =params(72)*y(33)+x(5);
residual(40)= lhs-rhs;
lhs =y(34);
rhs =y(34)*params(80)+x(6);
residual(41)= lhs-rhs;
lhs =y(35);
rhs =y(35)*params(79)+x(7);
residual(42)= lhs-rhs;
lhs =y(36);
rhs =y(36)*params(70)+x(8);
residual(43)= lhs-rhs;
lhs =y(37);
rhs =y(37)*params(75)+x(12);
residual(44)= lhs-rhs;
lhs =y(38);
rhs =y(42)+y(38)*params(76);
residual(45)= lhs-rhs;
lhs =y(39);
rhs =y(39)*params(81)+x(9);
residual(46)= lhs-rhs;
lhs =y(40);
rhs =y(40)*params(83)+x(10);
residual(47)= lhs-rhs;
lhs =y(41);
rhs =y(41)*params(82)+x(11);
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
rhs =y(18);
residual(58)= lhs-rhs;
lhs =y(59);
rhs =y(18);
residual(59)= lhs-rhs;
lhs =y(60);
rhs =y(47);
residual(60)= lhs-rhs;
lhs =y(61);
rhs =y(47);
residual(61)= lhs-rhs;
lhs =y(62);
rhs =y(47);
residual(62)= lhs-rhs;
lhs =y(63);
rhs =y(46);
residual(63)= lhs-rhs;
lhs =y(64);
rhs =y(46);
residual(64)= lhs-rhs;
lhs =y(65);
rhs =y(46);
residual(65)= lhs-rhs;
lhs =y(66);
rhs =y(43);
residual(66)= lhs-rhs;
lhs =y(67);
rhs =y(43);
residual(67)= lhs-rhs;
lhs =y(68);
rhs =y(43);
residual(68)= lhs-rhs;
lhs =y(69);
rhs =y(45);
residual(69)= lhs-rhs;
lhs =y(70);
rhs =y(45);
residual(70)= lhs-rhs;
lhs =y(71);
rhs =y(45);
residual(71)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(71, 71);

  %
  % Jacobian matrix
  %

  g1(1,21)=(-400);
  g1(1,43)=1;
  g1(2,18)=(-400);
  g1(2,44)=1;
  g1(3,18)=(-400);
  g1(3,45)=1;
  g1(4,27)=(-100);
  g1(4,46)=1;
  g1(5,26)=(-100);
  g1(5,47)=1;
  g1(6,42)=(-1);
  g1(6,48)=1;
  g1(7,43)=1-(params(4)+params(3)+params(1)+params(2));
  g1(7,45)=(-(params(13)+params(12)+params(11)+params(10)+params(9)+params(8)+params(7)+params(6)+params(5)));
  g1(7,46)=(-(params(22)+params(21)+params(20)+params(19)+params(18)+params(17)+params(16)+params(15)+params(14)));
  g1(7,47)=(-(params(31)+params(30)+params(29)+params(28)+params(27)+params(26)+params(25)+params(24)+params(23)));
  g1(8,48)=1;
  g1(9,22)=1-params(67);
  g1(9,23)=(-((1-params(67))*params(68)));
  g1(9,24)=(-((1-params(67))*(-params(69))));
  g1(9,38)=(-1);
  g1(10,1)=1-(1/(1+params(40))+params(40)/(1+params(40)));
  g1(10,18)=(-T193);
  g1(10,21)=T193;
  g1(10,31)=(-(T193*(1-params(71))));
  g1(11,2)=1;
  g1(11,5)=(-1);
  g1(11,8)=(-1);
  g1(12,1)=(-(1-params(56)));
  g1(12,2)=(-params(56));
  g1(12,3)=1;
  g1(13,1)=(-(T218*(-((1-params(40))*params(37)/(1-params(40))))));
  g1(13,4)=1;
  g1(13,8)=(-T218);
  g1(13,32)=T218;
  g1(14,2)=(-(T218*(-((1-params(40))*params(37)/(1-params(40))))));
  g1(14,5)=1;
  g1(14,8)=(-T218);
  g1(14,32)=T218;
  g1(15,4)=(-(1-params(57)));
  g1(15,5)=(-params(57));
  g1(15,6)=1;
  g1(16,11)=(-1);
  g1(16,18)=(-1);
  g1(16,21)=1;
  g1(16,40)=1;
  g1(16,41)=(-1);
  g1(17,6)=1;
  g1(17,8)=params(44)+(1-params(44))*params(36);
  g1(17,16)=(-((1-params(44))*params(36)));
  g1(17,17)=(-params(44));
  g1(17,26)=(-1);
  g1(17,36)=1-params(44);
  g1(18,8)=(-((1-params(44))*(1-params(36))));
  g1(18,9)=1;
  g1(18,10)=1;
  g1(18,16)=1-(1-params(44))*params(36);
  g1(18,17)=(-params(44));
  g1(18,26)=(-1);
  g1(18,36)=1-params(44);
  g1(19,11)=1;
  g1(19,19)=params(38);
  g1(19,34)=(-params(45));
  g1(19,35)=(-1);
  g1(20,12)=1-params(35)*(1-params(46));
  g1(20,16)=(-(1-params(35)*(1-params(46))));
  g1(20,18)=(-1);
  g1(20,21)=1;
  g1(21,12)=(-(1/(params(48)*(1+params(35)))));
  g1(21,13)=1-(params(35)/(1+params(35))+1/(1+params(35)));
  g1(21,33)=(-((1-params(35)*params(72))/(1+params(35))));
  g1(22,9)=1-(1-params(46));
  g1(22,13)=(-params(58));
  g1(23,7)=(-params(39));
  g1(23,14)=1;
  g1(23,39)=(-1);
  g1(24,7)=params(44);
  g1(24,15)=1;
  g1(24,17)=(-params(44));
  g1(24,26)=(-1);
  g1(25,10)=(-params(47));
  g1(25,16)=1;
  g1(26,7)=(-(1-params(55)));
  g1(26,8)=(-((1-params(36))*params(55)));
  g1(26,16)=(-(params(36)*params(55)));
  g1(26,17)=1;
  g1(26,36)=params(55);
  g1(27,17)=(-T364);
  g1(27,18)=1-(params(41)/(params(42)+params(41)*(1-params(42)*(1-params(35))))+params(35)*params(42)/(params(42)+params(41)*(1-params(42)*(1-params(35)))));
  g1(28,11)=(-params(61));
  g1(28,19)=1-params(59)*params(60);
  g1(28,20)=(-(params(59)*params(60)));
  g1(28,40)=(-(params(59)*params(60)*(-params(61))));
  g1(28,41)=(-params(61));
  g1(29,7)=T401;
  g1(29,14)=(-(params(53)/params(54)));
  g1(29,15)=T392;
  g1(29,20)=1;
  g1(29,27)=(params(53)-params(52))/params(54);
  g1(30,22)=1;
  g1(30,23)=1;
  g1(30,30)=1;
  g1(31,21)=(-params(63));
  g1(31,22)=(-params(62));
  g1(31,24)=1-params(62);
  g1(31,28)=(-(params(62)*(-params(63))));
  g1(32,7)=T392;
  g1(32,22)=(-(params(54)/params(51)));
  g1(32,25)=1;
  g1(32,27)=(-1);
  g1(33,3)=(-params(49));
  g1(33,13)=(-params(50));
  g1(33,14)=(-params(53));
  g1(33,25)=(-params(51));
  g1(33,26)=1;
  g1(34,15)=T392;
  g1(34,26)=(-(1/params(54)));
  g1(34,27)=1;
  g1(35,18)=(-1);
  g1(35,28)=1;
  g1(36,29)=1-params(78);
  g1(37,30)=1-params(77);
  g1(38,31)=1-params(71);
  g1(39,32)=1-params(73);
  g1(40,33)=1-params(72);
  g1(41,34)=1-params(80);
  g1(42,35)=1-params(79);
  g1(43,36)=1-params(70);
  g1(44,37)=1-params(75);
  g1(45,38)=1-params(76);
  g1(45,42)=(-1);
  g1(46,39)=1-params(81);
  g1(47,40)=1-params(83);
  g1(48,41)=1-params(82);
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
  g1(58,18)=(-1);
  g1(58,58)=1;
  g1(59,18)=(-1);
  g1(59,59)=1;
  g1(60,47)=(-1);
  g1(60,60)=1;
  g1(61,47)=(-1);
  g1(61,61)=1;
  g1(62,47)=(-1);
  g1(62,62)=1;
  g1(63,46)=(-1);
  g1(63,63)=1;
  g1(64,46)=(-1);
  g1(64,64)=1;
  g1(65,46)=(-1);
  g1(65,65)=1;
  g1(66,43)=(-1);
  g1(66,66)=1;
  g1(67,43)=(-1);
  g1(67,67)=1;
  g1(68,43)=(-1);
  g1(68,68)=1;
  g1(69,45)=(-1);
  g1(69,69)=1;
  g1(70,45)=(-1);
  g1(70,70)=1;
  g1(71,45)=(-1);
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
