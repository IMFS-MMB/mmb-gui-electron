function [residual, g1, g2, g3] = NK_NS14_static(y, x, params)
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

residual = zeros( 78, 1);

%
% Model equations
%

T194 = params(35)/params(36);
T242 = params(44)*params(42)*(1-params(46))/params(46);
T250 = params(42)*(1-params(46))/params(46)*params(45);
T274 = params(44)*params(41)*params(46)/(1-params(46));
T281 = params(41)*params(45)*params(46)/(1-params(46));
T287 = params(40)*params(47)*(params(44)+params(45))*(params(43)+params(41)*params(46)/(1-params(46)))/params(41);
T337 = 1/params(54);
lhs =y(48);
rhs =y(3)*4;
residual(1)= lhs-rhs;
lhs =y(49);
rhs =params(46)*0.25*(4*y(4)+4*y(4)+4*y(4)+4*y(4))+0.25*(1-params(46))*(4*y(5)+4*y(5)+4*y(5)+4*y(5));
residual(2)= lhs-rhs;
lhs =y(50);
rhs =4*params(46)*y(4)+4*(1-params(46))*y(5);
residual(3)= lhs-rhs;
lhs =y(53);
rhs =params(46)*y(15)+(1-params(46))*y(16)-(params(46)*y(35)+(1-params(46))*y(36));
residual(4)= lhs-rhs;
lhs =y(51);
rhs =params(46)*y(15)+(1-params(46))*y(16);
residual(5)= lhs-rhs;
lhs =y(52);
rhs =y(47);
residual(6)= lhs-rhs;
lhs =y(48);
rhs =params(32)*x(3)+y(51)*params(31)+y(51)*params(30)+y(51)*params(29)+y(51)*params(28)+y(51)*params(27)+y(51)*params(26)+y(51)*params(25)+y(51)*params(24)+y(51)*params(23)+y(53)*params(22)+y(53)*params(21)+y(53)*params(20)+y(53)*params(19)+y(53)*params(18)+y(53)*params(17)+y(53)*params(16)+y(53)*params(15)+y(53)*params(14)+y(50)*params(13)+y(50)*params(12)+y(50)*params(11)+y(50)*params(10)+y(50)*params(6)+y(50)*params(5)+y(48)*params(1)+y(48)*params(2)+y(48)*params(3)+y(48)*params(4)+y(50)*params(7)+y(50)*params(8)+y(50)*params(9);
residual(7)= lhs-rhs;
lhs =y(52);
rhs =params(34)*x(4);
residual(8)= lhs-rhs;
lhs =y(1);
rhs =y(1)-params(35)*(y(3)-y(4))+T194*y(8)-T194*y(8);
residual(9)= lhs-rhs;
lhs =y(1)-y(2);
rhs =params(35)*y(27)+T194*(y(8)-y(9));
residual(10)= lhs-rhs;
lhs =y(6);
rhs =y(6)*params(37)+params(38)*params(39)*y(13);
residual(11)= lhs-rhs;
lhs =y(7);
rhs =params(37)*y(7)+params(38)*params(39)*y(14);
residual(12)= lhs-rhs;
lhs =y(4);
rhs =y(6)*params(40)+y(7)*params(41);
residual(13)= lhs-rhs;
lhs =y(5);
rhs =y(6)*params(42)+y(7)*params(43);
residual(14)= lhs-rhs;
lhs =y(15);
rhs =y(1)*params(40)*params(44)+y(2)*T242+params(40)*params(45)*y(21)+T250*y(22)-params(47)*(params(44)+params(45))*(params(40)+params(42)*(1-params(46))/params(46))*y(10)+y(27)*params(42)*(1-params(46))*params(47)*(params(44)+params(45))/params(46)+y(17);
residual(15)= lhs-rhs;
lhs =y(16);
rhs =y(2)*params(43)*params(44)+y(1)*T274+y(22)*params(43)*params(45)+y(21)*T281+y(10)*T287+y(27)*params(43)*params(47)*(params(44)+params(45))+y(18);
residual(16)= lhs-rhs;
lhs =0;
rhs =y(6)-y(4);
residual(17)= lhs-rhs;
lhs =params(42)*y(10)-y(10)*params(43)*params(40)/params(41);
rhs =y(27);
residual(18)= lhs-rhs;
lhs =y(17);
rhs =y(47)+y(17)*params(52)+x(1);
residual(19)= lhs-rhs;
lhs =y(18);
rhs =y(47)+y(18)*params(52)+x(2);
residual(20)= lhs-rhs;
lhs =y(25);
rhs =y(15)+y(11);
residual(21)= lhs-rhs;
lhs =y(26);
rhs =y(16)+y(12);
residual(22)= lhs-rhs;
lhs =y(15);
rhs =y(8)*params(53)+(1-params(53))*y(23);
residual(23)= lhs-rhs;
lhs =y(16);
rhs =y(9)*params(53)+(1-params(53))*y(24);
residual(24)= lhs-rhs;
lhs =y(19);
rhs =y(8)*T337;
residual(25)= lhs-rhs;
lhs =y(20);
rhs =y(9)*T337;
residual(26)= lhs-rhs;
lhs =y(13)+y(10);
rhs =y(15)*params(55)-y(23)*(params(55)-T337);
residual(27)= lhs-rhs;
lhs =y(14)-y(10)*params(40)/params(41);
rhs =y(27)+y(16)*params(55)-y(24)*(params(55)-T337);
residual(28)= lhs-rhs;
lhs =y(23);
rhs =y(23)*(1-params(56))+y(21)*params(56);
residual(29)= lhs-rhs;
lhs =y(24);
rhs =y(24)*(1-params(56))+y(22)*params(56);
residual(30)= lhs-rhs;
lhs =y(15)*(1-params(37)*(1-params(56)))*params(58)+y(23)*params(37)*params(57)+(-(y(23)*(1+params(37))*params(57)))-y(23)*(1-params(37)*(1-params(56)))*params(59);
rhs =y(23)*(-params(57));
residual(31)= lhs-rhs;
lhs =y(16)*(1-params(37)*(1-params(56)))*params(58)+y(24)*params(37)*params(57)+(-(y(24)*(1+params(37))*params(57)))-y(24)*(1-params(37)*(1-params(56)))*params(59);
rhs =y(24)*(-params(57));
residual(32)= lhs-rhs;
lhs =y(11);
rhs =y(6)+y(11);
residual(33)= lhs-rhs;
lhs =y(12);
rhs =y(7)+y(12);
residual(34)= lhs-rhs;
lhs =y(28);
rhs =y(28)-params(35)*y(30)+T194*y(31)-T194*y(31);
residual(35)= lhs-rhs;
lhs =y(28)-y(29);
rhs =T194*(y(31)-y(32));
residual(36)= lhs-rhs;
lhs =y(35);
rhs =params(40)*params(44)*y(28)+T242*y(29)+params(40)*params(45)*y(41)+T250*y(42)+y(37);
residual(37)= lhs-rhs;
lhs =y(36);
rhs =params(43)*params(44)*y(29)+T274*y(28)+params(43)*params(45)*y(42)+T281*y(41)+y(38);
residual(38)= lhs-rhs;
residual(39) = params(46)*y(33)+(1-params(46))*y(34);
lhs =y(37);
rhs =y(47)+x(1)+params(52)*y(37);
residual(40)= lhs-rhs;
lhs =y(38);
rhs =y(47)+x(2)+params(52)*y(38);
residual(41)= lhs-rhs;
lhs =y(45);
rhs =y(35);
residual(42)= lhs-rhs;
lhs =y(46);
rhs =y(36);
residual(43)= lhs-rhs;
lhs =y(35);
rhs =params(53)*y(31)+(1-params(53))*y(43);
residual(44)= lhs-rhs;
lhs =y(36);
rhs =params(53)*y(32)+(1-params(53))*y(44);
residual(45)= lhs-rhs;
lhs =y(39);
rhs =T337*y(31);
residual(46)= lhs-rhs;
lhs =y(40);
rhs =T337*y(32);
residual(47)= lhs-rhs;
lhs =y(33);
rhs =y(35)*params(55)-(params(55)-T337)*y(43);
residual(48)= lhs-rhs;
lhs =y(34);
rhs =y(36)*params(55)-(params(55)-T337)*y(44);
residual(49)= lhs-rhs;
lhs =y(43);
rhs =(1-params(56))*y(43)+params(56)*y(41);
residual(50)= lhs-rhs;
lhs =y(44);
rhs =(1-params(56))*y(44)+params(56)*y(42);
residual(51)= lhs-rhs;
lhs =y(35)*(1-params(37)*(1-params(56)))*params(58)+params(37)*params(57)*y(43)+(-((1+params(37))*params(57)*y(43)))-(1-params(37)*(1-params(56)))*params(59)*y(43);
rhs =(-params(57))*y(43);
residual(52)= lhs-rhs;
lhs =y(36)*(1-params(37)*(1-params(56)))*params(58)+params(37)*params(57)*y(44)+(-((1+params(37))*params(57)*y(44)))-(1-params(37)*(1-params(56)))*params(59)*y(44);
rhs =(-params(57))*y(44);
residual(53)= lhs-rhs;
lhs =y(54);
rhs =y(50);
residual(54)= lhs-rhs;
lhs =y(55);
rhs =y(50);
residual(55)= lhs-rhs;
lhs =y(56);
rhs =y(50);
residual(56)= lhs-rhs;
lhs =y(57);
rhs =y(53);
residual(57)= lhs-rhs;
lhs =y(58);
rhs =y(53);
residual(58)= lhs-rhs;
lhs =y(59);
rhs =y(53);
residual(59)= lhs-rhs;
lhs =y(60);
rhs =y(51);
residual(60)= lhs-rhs;
lhs =y(61);
rhs =y(51);
residual(61)= lhs-rhs;
lhs =y(62);
rhs =y(51);
residual(62)= lhs-rhs;
lhs =y(63);
rhs =y(4);
residual(63)= lhs-rhs;
lhs =y(64);
rhs =y(4);
residual(64)= lhs-rhs;
lhs =y(65);
rhs =y(5);
residual(65)= lhs-rhs;
lhs =y(66);
rhs =y(5);
residual(66)= lhs-rhs;
lhs =y(67);
rhs =y(51);
residual(67)= lhs-rhs;
lhs =y(68);
rhs =y(51);
residual(68)= lhs-rhs;
lhs =y(69);
rhs =y(51);
residual(69)= lhs-rhs;
lhs =y(70);
rhs =y(53);
residual(70)= lhs-rhs;
lhs =y(71);
rhs =y(53);
residual(71)= lhs-rhs;
lhs =y(72);
rhs =y(53);
residual(72)= lhs-rhs;
lhs =y(73);
rhs =y(48);
residual(73)= lhs-rhs;
lhs =y(74);
rhs =y(48);
residual(74)= lhs-rhs;
lhs =y(75);
rhs =y(48);
residual(75)= lhs-rhs;
lhs =y(76);
rhs =y(50);
residual(76)= lhs-rhs;
lhs =y(77);
rhs =y(50);
residual(77)= lhs-rhs;
lhs =y(78);
rhs =y(50);
residual(78)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(78, 78);

  %
  % Jacobian matrix
  %

T773 = params(37)*params(57)+(-((1+params(37))*params(57)))-(1-params(37)*(1-params(56)))*params(59)-(-params(57));
  g1(1,3)=(-4);
  g1(1,48)=1;
  g1(2,4)=(-(params(46)*0.25*16));
  g1(2,5)=(-(0.25*(1-params(46))*16));
  g1(2,49)=1;
  g1(3,4)=(-(4*params(46)));
  g1(3,5)=(-(4*(1-params(46))));
  g1(3,50)=1;
  g1(4,15)=(-params(46));
  g1(4,16)=(-(1-params(46)));
  g1(4,35)=params(46);
  g1(4,36)=1-params(46);
  g1(4,53)=1;
  g1(5,15)=(-params(46));
  g1(5,16)=(-(1-params(46)));
  g1(5,51)=1;
  g1(6,47)=(-1);
  g1(6,52)=1;
  g1(7,48)=1-(params(4)+params(3)+params(1)+params(2));
  g1(7,50)=(-(params(13)+params(12)+params(11)+params(10)+params(9)+params(8)+params(7)+params(6)+params(5)));
  g1(7,51)=(-(params(31)+params(30)+params(29)+params(28)+params(27)+params(26)+params(25)+params(24)+params(23)));
  g1(7,53)=(-(params(22)+params(21)+params(20)+params(19)+params(18)+params(17)+params(16)+params(15)+params(14)));
  g1(8,52)=1;
  g1(9,3)=params(35);
  g1(9,4)=(-params(35));
  g1(10,1)=1;
  g1(10,2)=(-1);
  g1(10,8)=(-T194);
  g1(10,9)=T194;
  g1(10,27)=(-params(35));
  g1(11,6)=1-params(37);
  g1(11,13)=(-(params(38)*params(39)));
  g1(12,7)=1-params(37);
  g1(12,14)=(-(params(38)*params(39)));
  g1(13,4)=1;
  g1(13,6)=(-params(40));
  g1(13,7)=(-params(41));
  g1(14,5)=1;
  g1(14,6)=(-params(42));
  g1(14,7)=(-params(43));
  g1(15,1)=(-(params(40)*params(44)));
  g1(15,2)=(-T242);
  g1(15,10)=params(47)*(params(44)+params(45))*(params(40)+params(42)*(1-params(46))/params(46));
  g1(15,15)=1;
  g1(15,17)=(-1);
  g1(15,21)=(-(params(40)*params(45)));
  g1(15,22)=(-T250);
  g1(15,27)=(-(params(42)*(1-params(46))*params(47)*(params(44)+params(45))/params(46)));
  g1(16,1)=(-T274);
  g1(16,2)=(-(params(43)*params(44)));
  g1(16,10)=(-T287);
  g1(16,16)=1;
  g1(16,18)=(-1);
  g1(16,21)=(-T281);
  g1(16,22)=(-(params(43)*params(45)));
  g1(16,27)=(-(params(43)*params(47)*(params(44)+params(45))));
  g1(17,4)=1;
  g1(17,6)=(-1);
  g1(18,10)=params(42)-params(43)*params(40)/params(41);
  g1(18,27)=(-1);
  g1(19,17)=1-params(52);
  g1(19,47)=(-1);
  g1(20,18)=1-params(52);
  g1(20,47)=(-1);
  g1(21,11)=(-1);
  g1(21,15)=(-1);
  g1(21,25)=1;
  g1(22,12)=(-1);
  g1(22,16)=(-1);
  g1(22,26)=1;
  g1(23,8)=(-params(53));
  g1(23,15)=1;
  g1(23,23)=(-(1-params(53)));
  g1(24,9)=(-params(53));
  g1(24,16)=1;
  g1(24,24)=(-(1-params(53)));
  g1(25,8)=(-T337);
  g1(25,19)=1;
  g1(26,9)=(-T337);
  g1(26,20)=1;
  g1(27,10)=1;
  g1(27,13)=1;
  g1(27,15)=(-params(55));
  g1(27,23)=params(55)-T337;
  g1(28,10)=(-(params(40)/params(41)));
  g1(28,14)=1;
  g1(28,16)=(-params(55));
  g1(28,24)=params(55)-T337;
  g1(28,27)=(-1);
  g1(29,21)=(-params(56));
  g1(29,23)=1-(1-params(56));
  g1(30,22)=(-params(56));
  g1(30,24)=1-(1-params(56));
  g1(31,15)=(1-params(37)*(1-params(56)))*params(58);
  g1(31,23)=T773;
  g1(32,16)=(1-params(37)*(1-params(56)))*params(58);
  g1(32,24)=T773;
  g1(33,6)=(-1);
  g1(34,7)=(-1);
  g1(35,30)=params(35);
  g1(36,28)=1;
  g1(36,29)=(-1);
  g1(36,31)=(-T194);
  g1(36,32)=T194;
  g1(37,28)=(-(params(40)*params(44)));
  g1(37,29)=(-T242);
  g1(37,35)=1;
  g1(37,37)=(-1);
  g1(37,41)=(-(params(40)*params(45)));
  g1(37,42)=(-T250);
  g1(38,28)=(-T274);
  g1(38,29)=(-(params(43)*params(44)));
  g1(38,36)=1;
  g1(38,38)=(-1);
  g1(38,41)=(-T281);
  g1(38,42)=(-(params(43)*params(45)));
  g1(39,33)=params(46);
  g1(39,34)=1-params(46);
  g1(40,37)=1-params(52);
  g1(40,47)=(-1);
  g1(41,38)=1-params(52);
  g1(41,47)=(-1);
  g1(42,35)=(-1);
  g1(42,45)=1;
  g1(43,36)=(-1);
  g1(43,46)=1;
  g1(44,31)=(-params(53));
  g1(44,35)=1;
  g1(44,43)=(-(1-params(53)));
  g1(45,32)=(-params(53));
  g1(45,36)=1;
  g1(45,44)=(-(1-params(53)));
  g1(46,31)=(-T337);
  g1(46,39)=1;
  g1(47,32)=(-T337);
  g1(47,40)=1;
  g1(48,33)=1;
  g1(48,35)=(-params(55));
  g1(48,43)=params(55)-T337;
  g1(49,34)=1;
  g1(49,36)=(-params(55));
  g1(49,44)=params(55)-T337;
  g1(50,41)=(-params(56));
  g1(50,43)=1-(1-params(56));
  g1(51,42)=(-params(56));
  g1(51,44)=1-(1-params(56));
  g1(52,35)=(1-params(37)*(1-params(56)))*params(58);
  g1(52,43)=T773;
  g1(53,36)=(1-params(37)*(1-params(56)))*params(58);
  g1(53,44)=T773;
  g1(54,50)=(-1);
  g1(54,54)=1;
  g1(55,50)=(-1);
  g1(55,55)=1;
  g1(56,50)=(-1);
  g1(56,56)=1;
  g1(57,53)=(-1);
  g1(57,57)=1;
  g1(58,53)=(-1);
  g1(58,58)=1;
  g1(59,53)=(-1);
  g1(59,59)=1;
  g1(60,51)=(-1);
  g1(60,60)=1;
  g1(61,51)=(-1);
  g1(61,61)=1;
  g1(62,51)=(-1);
  g1(62,62)=1;
  g1(63,4)=(-1);
  g1(63,63)=1;
  g1(64,4)=(-1);
  g1(64,64)=1;
  g1(65,5)=(-1);
  g1(65,65)=1;
  g1(66,5)=(-1);
  g1(66,66)=1;
  g1(67,51)=(-1);
  g1(67,67)=1;
  g1(68,51)=(-1);
  g1(68,68)=1;
  g1(69,51)=(-1);
  g1(69,69)=1;
  g1(70,53)=(-1);
  g1(70,70)=1;
  g1(71,53)=(-1);
  g1(71,71)=1;
  g1(72,53)=(-1);
  g1(72,72)=1;
  g1(73,48)=(-1);
  g1(73,73)=1;
  g1(74,48)=(-1);
  g1(74,74)=1;
  g1(75,48)=(-1);
  g1(75,75)=1;
  g1(76,50)=(-1);
  g1(76,76)=1;
  g1(77,50)=(-1);
  g1(77,77)=1;
  g1(78,50)=(-1);
  g1(78,78)=1;
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],78,6084);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],78,474552);
end
end
end
end
