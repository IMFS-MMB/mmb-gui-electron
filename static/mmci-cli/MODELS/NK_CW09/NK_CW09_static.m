function [residual, g1, g2, g3] = NK_CW09_static(y, x, params)
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

residual = zeros( 79, 1);

%
% Model equations
%

T177 = (params(37)+(1-params(37))*params(38))*y(3)/y(5)+(1-params(37))*(1-params(38))*y(4)/y(5);
T185 = (1-params(37))*params(38)*y(3)/y(5)+y(4)/y(5)*(params(37)+(1-params(37))*(1-params(38)));
T200 = y(25)^(-1);
T201 = y(24)*params(40)*(1+params(41))*params(49)*y(18)*T200;
T205 = y(17)^(-params(42));
T206 = T201*T205;
T210 = (y(7)/y(21))^(1+params(41));
T216 = y(5)^((1+params(41))*params(43));
T228 = y(5)^(params(43)-1);
T245 = (1+y(1))/y(5);
T257 = y(3)^(-params(45));
T263 = y(4)^(-params(46));
T270 = params(67)/params(93)^params(50);
T274 = T270*y(35)+params(76);
T275 = y(11)^params(50);
T288 = (1-params(44)*T228)/(1-params(44));
T306 = y(11)^params(51);
T311 = y(11)^(params(50)-1);
T321 = 1/params(42);
T322 = (y(3)/params(47))^T321;
T325 = (y(4)/params(48))^T321;
T331 = (y(25)/params(49))^((-(1+params(42)))/params(42));
T490 = (1+params(51))*params(93)^params(51);
T534 = params(97)^(-1);
T536 = (params(41)+T534)^(-1);
lhs =y(51);
rhs =y(26)*4;
residual(1)= lhs-rhs;
lhs =y(52);
rhs =y(29)+y(29)+y(29)+y(29);
residual(2)= lhs-rhs;
lhs =y(53);
rhs =4*y(29);
residual(3)= lhs-rhs;
lhs =y(54);
rhs =y(30)-y(50);
residual(4)= lhs-rhs;
lhs =y(55);
rhs =y(30);
residual(5)= lhs-rhs;
lhs =y(56);
rhs =y(49);
residual(6)= lhs-rhs;
lhs =y(51);
rhs =params(32)*x(10)+y(55)*params(31)+y(55)*params(30)+y(55)*params(29)+y(55)*params(28)+y(55)*params(27)+y(55)*params(26)+y(55)*params(25)+y(55)*params(24)+y(55)*params(23)+y(54)*params(22)+y(54)*params(21)+y(54)*params(20)+y(54)*params(19)+y(54)*params(18)+y(54)*params(17)+y(54)*params(16)+y(54)*params(15)+y(54)*params(14)+y(53)*params(13)+y(53)*params(12)+y(53)*params(11)+y(53)*params(10)+y(53)*params(6)+y(53)*params(5)+y(51)*params(1)+y(51)*params(2)+y(51)*params(3)+y(51)*params(4)+y(53)*params(7)+y(53)*params(8)+y(53)*params(9);
residual(7)= lhs-rhs;
lhs =y(56);
rhs =params(34)*x(11);
residual(8)= lhs-rhs;
residual(9) = (1+y(1))*(1+y(20))*params(35)*T177-y(3);
residual(10) = (1+y(1))*params(35)*T185-y(4);
residual(11) = T206*T210+params(35)*params(44)*T216*y(8)-y(8);
residual(12) = y(7)*y(24)*(1-y(19))+params(35)*params(44)*T228*y(9)-y(9);
residual(13) = params(38)*(1-params(38))*y(23)-params(38)*y(22)+params(37)*(params(38)*y(22)+(1+y(20))*y(11))*T245-y(11)*(1+y(20)*params(38));
residual(14) = params(38)*y(16)*T257+(1-params(38))*y(15)*T263+T274*T275+y(12)-y(7);
residual(15) = T216*params(44)*y(10)+(1-params(44))*T288^((1+params(41))*params(43)/(params(43)-1))-y(10);
residual(16) = T288-(y(9)/y(8))^((params(43)-1)/(1+params(41)*params(43)));
residual(17) = 1+(1+params(51))*y(13)*T306+params(50)*T274*T311-(1+y(20));
lhs =y(23);
rhs =y(16)*T257-y(15)*T263-y(10)*T210*T205*y(18)*(T322-T325)*T331;
residual(18)= lhs-rhs;
lhs =y(25);
rhs =params(49)*(params(38)*T322+(1-params(38))*T325)^params(42);
residual(19)= lhs-rhs;
lhs =y(24);
rhs =params(38)*y(3)+(1-params(38))*y(4);
residual(20)= lhs-rhs;
lhs =y(16);
rhs =params(77)*(1-params(55))+y(16)*params(55)+x(2);
residual(21)= lhs-rhs;
lhs =y(15);
rhs =params(78)*(1-params(54))+y(15)*params(54)+x(1);
residual(22)= lhs-rhs;
lhs =y(12);
rhs =y(49)+params(95)*(1-params(56))+y(12)*params(56);
residual(23)= lhs-rhs;
lhs =y(17);
rhs =params(88)*(1-params(57))+y(17)*params(57)+x(3);
residual(24)= lhs-rhs;
lhs =y(18);
rhs =params(80)*(1-params(58))+y(18)*params(58)+x(4);
residual(25)= lhs-rhs;
lhs =y(19);
rhs =params(81)*(1-params(59))+y(19)*params(59)+x(5);
residual(26)= lhs-rhs;
lhs =y(35);
rhs =y(35)*params(61)+x(6);
residual(27)= lhs-rhs;
lhs =y(13);
rhs =params(79)*(1-params(62))+y(13)*params(62)+x(7);
residual(28)= lhs-rhs;
lhs =y(21);
rhs =params(89)*(1-params(63))+y(21)*params(63)+x(8);
residual(29)= lhs-rhs;
lhs =y(22);
rhs =params(94)*(1-params(66))+y(22)*params(66)+x(9);
residual(30)= lhs-rhs;
lhs =(1+y(1))/(1+params(73));
rhs =exp(y(26));
residual(31)= lhs-rhs;
lhs =y(3)/params(82);
rhs =exp(y(27));
residual(32)= lhs-rhs;
lhs =y(4)/params(83);
rhs =exp(y(28));
residual(33)= lhs-rhs;
lhs =y(25)/params(86);
rhs =exp(y(48));
residual(34)= lhs-rhs;
lhs =y(24)/params(87);
rhs =exp(y(47));
residual(35)= lhs-rhs;
lhs =y(5);
rhs =exp(y(29));
residual(36)= lhs-rhs;
lhs =y(7)/params(67);
rhs =exp(y(30));
residual(37)= lhs-rhs;
lhs =y(8)/params(84);
rhs =exp(y(31));
residual(38)= lhs-rhs;
lhs =y(9)/params(85);
rhs =exp(y(32));
residual(39)= lhs-rhs;
lhs =y(10)/params(91);
rhs =exp(y(33));
residual(40)= lhs-rhs;
lhs =y(11)/params(93);
rhs =exp(y(34));
residual(41)= lhs-rhs;
lhs =y(12);
rhs =params(67)*y(36)+params(71);
residual(42)= lhs-rhs;
lhs =y(13);
rhs =params(79)+y(37)/T490;
residual(43)= lhs-rhs;
lhs =y(15)/params(78);
rhs =exp(y(38));
residual(44)= lhs-rhs;
lhs =y(16)/params(77);
rhs =exp(y(39));
residual(45)= lhs-rhs;
lhs =y(17)/params(88);
rhs =exp(y(40));
residual(46)= lhs-rhs;
lhs =y(18)/params(80);
rhs =exp(y(41));
residual(47)= lhs-rhs;
lhs =((1-y(19))/(1-params(81)))^(-1);
rhs =exp(y(42));
residual(48)= lhs-rhs;
lhs =(1+y(20))/(1+params(74));
rhs =exp(y(43));
residual(49)= lhs-rhs;
lhs =y(21)/params(89);
rhs =exp(y(44));
residual(50)= lhs-rhs;
lhs =y(22);
rhs =params(93)+params(67)*y(45);
residual(51)= lhs-rhs;
lhs =y(46);
rhs =y(26)+y(43);
residual(52)= lhs-rhs;
lhs =y(50);
rhs =T536*(T534*(y(36)+params(72)*(y(39)*params(38)*params(69)/params(72)+y(38)*(1-params(38))*params(70)/params(72)))+params(42)*y(40)+(1+params(41))*y(44));
residual(53)= lhs-rhs;
lhs =y(2);
rhs =y(26)*4;
residual(54)= lhs-rhs;
lhs =y(6);
rhs =4*y(29);
residual(55)= lhs-rhs;
lhs =y(14);
rhs =4*y(43);
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
rhs =y(54);
residual(60)= lhs-rhs;
lhs =y(61);
rhs =y(54);
residual(61)= lhs-rhs;
lhs =y(62);
rhs =y(54);
residual(62)= lhs-rhs;
lhs =y(63);
rhs =y(55);
residual(63)= lhs-rhs;
lhs =y(64);
rhs =y(55);
residual(64)= lhs-rhs;
lhs =y(65);
rhs =y(55);
residual(65)= lhs-rhs;
lhs =y(66);
rhs =y(29);
residual(66)= lhs-rhs;
lhs =y(67);
rhs =y(29);
residual(67)= lhs-rhs;
lhs =y(68);
rhs =y(55);
residual(68)= lhs-rhs;
lhs =y(69);
rhs =y(55);
residual(69)= lhs-rhs;
lhs =y(70);
rhs =y(55);
residual(70)= lhs-rhs;
lhs =y(71);
rhs =y(54);
residual(71)= lhs-rhs;
lhs =y(72);
rhs =y(54);
residual(72)= lhs-rhs;
lhs =y(73);
rhs =y(54);
residual(73)= lhs-rhs;
lhs =y(74);
rhs =y(51);
residual(74)= lhs-rhs;
lhs =y(75);
rhs =y(51);
residual(75)= lhs-rhs;
lhs =y(76);
rhs =y(51);
residual(76)= lhs-rhs;
lhs =y(77);
rhs =y(53);
residual(77)= lhs-rhs;
lhs =y(78);
rhs =y(53);
residual(78)= lhs-rhs;
lhs =y(79);
rhs =y(53);
residual(79)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(79, 79);

  %
  % Jacobian matrix
  %

T731 = 1/y(5);
T739 = getPowerDeriv(y(3),(-params(45)),1);
T744 = 1/params(47)*getPowerDeriv(y(3)/params(47),T321,1);
T753 = getPowerDeriv(params(38)*T322+(1-params(38))*T325,params(42),1);
T764 = getPowerDeriv(y(4),(-params(46)),1);
T770 = 1/params(48)*getPowerDeriv(y(4)/params(48),T321,1);
T798 = getPowerDeriv(y(5),(1+params(41))*params(43),1);
T801 = getPowerDeriv(y(5),params(43)-1,1);
T816 = getPowerDeriv(y(7)/y(21),1+params(41),1);
T827 = getPowerDeriv(y(9)/y(8),(params(43)-1)/(1+params(41)*params(43)),1);
T858 = getPowerDeriv(y(17),(-params(42)),1);
  g1(1,26)=(-4);
  g1(1,51)=1;
  g1(2,29)=(-4);
  g1(2,52)=1;
  g1(3,29)=(-4);
  g1(3,53)=1;
  g1(4,30)=(-1);
  g1(4,50)=1;
  g1(4,54)=1;
  g1(5,30)=(-1);
  g1(5,55)=1;
  g1(6,49)=(-1);
  g1(6,56)=1;
  g1(7,51)=1-(params(4)+params(3)+params(1)+params(2));
  g1(7,53)=(-(params(13)+params(12)+params(11)+params(10)+params(9)+params(8)+params(7)+params(6)+params(5)));
  g1(7,54)=(-(params(22)+params(21)+params(20)+params(19)+params(18)+params(17)+params(16)+params(15)+params(14)));
  g1(7,55)=(-(params(31)+params(30)+params(29)+params(28)+params(27)+params(26)+params(25)+params(24)+params(23)));
  g1(8,56)=1;
  g1(9,1)=T177*(1+y(20))*params(35);
  g1(9,3)=(1+y(1))*(1+y(20))*params(35)*(params(37)+(1-params(37))*params(38))*T731-1;
  g1(9,4)=(1+y(1))*(1+y(20))*params(35)*(1-params(37))*(1-params(38))*T731;
  g1(9,5)=(1+y(1))*(1+y(20))*params(35)*((params(37)+(1-params(37))*params(38))*(-y(3))/(y(5)*y(5))+(1-params(37))*(1-params(38))*(-y(4))/(y(5)*y(5)));
  g1(9,20)=T177*(1+y(1))*params(35);
  g1(10,1)=params(35)*T185;
  g1(10,3)=(1+y(1))*params(35)*(1-params(37))*params(38)*T731;
  g1(10,4)=(1+y(1))*params(35)*(params(37)+(1-params(37))*(1-params(38)))*T731-1;
  g1(10,5)=(1+y(1))*params(35)*((1-params(37))*params(38)*(-y(3))/(y(5)*y(5))+(params(37)+(1-params(37))*(1-params(38)))*(-y(4))/(y(5)*y(5)));
  g1(11,5)=y(8)*params(35)*params(44)*T798;
  g1(11,7)=T206*1/y(21)*T816;
  g1(11,8)=params(35)*params(44)*T216-1;
  g1(11,17)=T210*T201*T858;
  g1(11,18)=T210*T205*y(24)*params(40)*(1+params(41))*params(49)*T200;
  g1(11,21)=T206*T816*(-y(7))/(y(21)*y(21));
  g1(11,24)=T210*T205*T200*y(18)*params(49)*params(40)*(1+params(41));
  g1(11,25)=T210*T205*y(24)*params(40)*(1+params(41))*params(49)*y(18)*getPowerDeriv(y(25),(-1),1);
  g1(12,5)=y(9)*params(35)*params(44)*T801;
  g1(12,7)=y(24)*(1-y(19));
  g1(12,9)=params(35)*params(44)*T228-1;
  g1(12,19)=y(7)*(-y(24));
  g1(12,24)=y(7)*(1-y(19));
  g1(13,1)=params(37)*(params(38)*y(22)+(1+y(20))*y(11))*T731;
  g1(13,5)=params(37)*(params(38)*y(22)+(1+y(20))*y(11))*(-(1+y(1)))/(y(5)*y(5));
  g1(13,11)=T245*(1+y(20))*params(37)-(1+y(20)*params(38));
  g1(13,20)=T245*params(37)*y(11)-params(38)*y(11);
  g1(13,22)=(-params(38))+T245*params(37)*params(38);
  g1(13,23)=params(38)*(1-params(38));
  g1(14,3)=params(38)*y(16)*T739;
  g1(14,4)=(1-params(38))*y(15)*T764;
  g1(14,7)=(-1);
  g1(14,11)=T274*getPowerDeriv(y(11),params(50),1);
  g1(14,12)=1;
  g1(14,15)=(1-params(38))*T263;
  g1(14,16)=params(38)*T257;
  g1(14,35)=T270*T275;
  g1(15,5)=params(44)*y(10)*T798+(1-params(44))*(-(params(44)*T801))/(1-params(44))*getPowerDeriv(T288,(1+params(41))*params(43)/(params(43)-1),1);
  g1(15,10)=params(44)*T216-1;
  g1(16,5)=(-(params(44)*T801))/(1-params(44));
  g1(16,8)=(-((-y(9))/(y(8)*y(8))*T827));
  g1(16,9)=(-(T827*1/y(8)));
  g1(17,11)=(1+params(51))*y(13)*getPowerDeriv(y(11),params(51),1)+params(50)*T274*getPowerDeriv(y(11),params(50)-1,1);
  g1(17,13)=(1+params(51))*T306;
  g1(17,20)=(-1);
  g1(17,35)=T311*params(50)*T270;
  g1(18,3)=(-(y(16)*T739-y(10)*T210*T205*y(18)*T331*T744));
  g1(18,4)=(-((-(y(15)*T764))-y(10)*T210*T205*y(18)*T331*(-T770)));
  g1(18,7)=y(10)*T205*y(18)*(T322-T325)*T331*1/y(21)*T816;
  g1(18,10)=T210*T205*y(18)*(T322-T325)*T331;
  g1(18,15)=T263;
  g1(18,16)=(-T257);
  g1(18,17)=y(10)*T210*y(18)*(T322-T325)*T331*T858;
  g1(18,18)=y(10)*T210*T205*(T322-T325)*T331;
  g1(18,21)=y(10)*T205*y(18)*(T322-T325)*T331*T816*(-y(7))/(y(21)*y(21));
  g1(18,23)=1;
  g1(18,25)=y(10)*T210*T205*y(18)*(T322-T325)*1/params(49)*getPowerDeriv(y(25)/params(49),(-(1+params(42)))/params(42),1);
  g1(19,3)=(-(params(49)*params(38)*T744*T753));
  g1(19,4)=(-(params(49)*T753*(1-params(38))*T770));
  g1(19,25)=1;
  g1(20,3)=(-params(38));
  g1(20,4)=(-(1-params(38)));
  g1(20,24)=1;
  g1(21,16)=1-params(55);
  g1(22,15)=1-params(54);
  g1(23,12)=1-params(56);
  g1(23,49)=(-1);
  g1(24,17)=1-params(57);
  g1(25,18)=1-params(58);
  g1(26,19)=1-params(59);
  g1(27,35)=1-params(61);
  g1(28,13)=1-params(62);
  g1(29,21)=1-params(63);
  g1(30,22)=1-params(66);
  g1(31,1)=1/(1+params(73));
  g1(31,26)=(-exp(y(26)));
  g1(32,3)=1/params(82);
  g1(32,27)=(-exp(y(27)));
  g1(33,4)=1/params(83);
  g1(33,28)=(-exp(y(28)));
  g1(34,25)=1/params(86);
  g1(34,48)=(-exp(y(48)));
  g1(35,24)=1/params(87);
  g1(35,47)=(-exp(y(47)));
  g1(36,5)=1;
  g1(36,29)=(-exp(y(29)));
  g1(37,7)=1/params(67);
  g1(37,30)=(-exp(y(30)));
  g1(38,8)=1/params(84);
  g1(38,31)=(-exp(y(31)));
  g1(39,9)=1/params(85);
  g1(39,32)=(-exp(y(32)));
  g1(40,10)=1/params(91);
  g1(40,33)=(-exp(y(33)));
  g1(41,11)=1/params(93);
  g1(41,34)=(-exp(y(34)));
  g1(42,12)=1;
  g1(42,36)=(-params(67));
  g1(43,13)=1;
  g1(43,37)=(-(1/T490));
  g1(44,15)=1/params(78);
  g1(44,38)=(-exp(y(38)));
  g1(45,16)=1/params(77);
  g1(45,39)=(-exp(y(39)));
  g1(46,17)=1/params(88);
  g1(46,40)=(-exp(y(40)));
  g1(47,18)=1/params(80);
  g1(47,41)=(-exp(y(41)));
  g1(48,19)=(-1)/(1-params(81))*getPowerDeriv((1-y(19))/(1-params(81)),(-1),1);
  g1(48,42)=(-exp(y(42)));
  g1(49,20)=1/(1+params(74));
  g1(49,43)=(-exp(y(43)));
  g1(50,21)=1/params(89);
  g1(50,44)=(-exp(y(44)));
  g1(51,22)=1;
  g1(51,45)=(-params(67));
  g1(52,26)=(-1);
  g1(52,43)=(-1);
  g1(52,46)=1;
  g1(53,36)=(-(T534*T536));
  g1(53,38)=(-(T536*T534*params(72)*(1-params(38))*params(70)/params(72)));
  g1(53,39)=(-(T536*T534*params(72)*params(38)*params(69)/params(72)));
  g1(53,40)=(-(params(42)*T536));
  g1(53,44)=(-((1+params(41))*T536));
  g1(53,50)=1;
  g1(54,2)=1;
  g1(54,26)=(-4);
  g1(55,6)=1;
  g1(55,29)=(-4);
  g1(56,14)=1;
  g1(56,43)=(-4);
  g1(57,53)=(-1);
  g1(57,57)=1;
  g1(58,53)=(-1);
  g1(58,58)=1;
  g1(59,53)=(-1);
  g1(59,59)=1;
  g1(60,54)=(-1);
  g1(60,60)=1;
  g1(61,54)=(-1);
  g1(61,61)=1;
  g1(62,54)=(-1);
  g1(62,62)=1;
  g1(63,55)=(-1);
  g1(63,63)=1;
  g1(64,55)=(-1);
  g1(64,64)=1;
  g1(65,55)=(-1);
  g1(65,65)=1;
  g1(66,29)=(-1);
  g1(66,66)=1;
  g1(67,29)=(-1);
  g1(67,67)=1;
  g1(68,55)=(-1);
  g1(68,68)=1;
  g1(69,55)=(-1);
  g1(69,69)=1;
  g1(70,55)=(-1);
  g1(70,70)=1;
  g1(71,54)=(-1);
  g1(71,71)=1;
  g1(72,54)=(-1);
  g1(72,72)=1;
  g1(73,54)=(-1);
  g1(73,73)=1;
  g1(74,51)=(-1);
  g1(74,74)=1;
  g1(75,51)=(-1);
  g1(75,75)=1;
  g1(76,51)=(-1);
  g1(76,76)=1;
  g1(77,53)=(-1);
  g1(77,77)=1;
  g1(78,53)=(-1);
  g1(78,78)=1;
  g1(79,53)=(-1);
  g1(79,79)=1;
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],79,6241);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],79,493039);
end
end
end
end
