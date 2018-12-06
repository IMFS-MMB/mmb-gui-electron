function [residual, g1, g2, g3] = NK_MM10_static(y, x, params)
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

residual = zeros( 102, 1);

%
% Model equations
%

T197 = y(54)*(1-params(36))+y(55)*y(69)-(params(40)*(y(69)-1)+params(41)*0.5*(y(69)-1)^2);
T208 = y(60)^(1-params(43));
T210 = y(57)^(1-params(43));
T225 = params(43)*params(38)/(params(43)-1)/y(62);
T227 = y(48)^params(39);
T228 = T225*T227;
T229 = y(57)^(params(43)*params(39));
T231 = y(60)^(1+params(43)*params(39));
T245 = y(70)^(params(54)-1);
T246 = y(65)*exp(y(40))*params(54)*T245;
T248 = y(48)^params(55);
T252 = params(48)^params(56);
T256 = params(49)^params(57);
T257 = T246*T248*T252*T256;
T260 = y(70)^params(54);
T263 = y(48)^(params(55)-1);
T266 = T256*T252*y(65)*exp(y(40))*params(55)*T260*T263;
T273 = params(48)^(params(56)-1);
T283 = params(49)^(params(57)-1);
T310 = params(61)-params(63)/params(62)-params(59)/(y(54)*params(62));
T311 = y(54)*params(58)*T310;
T439 = (1-params(36))*y(10)+y(11)*y(29)-(params(40)*(y(29)-1)+params(41)*0.5*(y(29)-1)^2);
T452 = 1/(1+params(43)*params(39));
T453 = (params(43)*params(38)/(params(43)-1))^T452;
T465 = y(4)^(1+params(39));
T469 = (y(12)*y(13))^(params(43)*(1+params(39)));
T471 = params(35)*params(44)*y(38)^(1+params(43)*params(39))+T465*T469;
T477 = y(13)^params(43);
T479 = y(12)^(params(43)-1);
T481 = params(35)*params(44)*y(39)^(1+params(43)*params(39))+y(18)*y(4)*T477*T479;
T484 = y(12)^(1-params(43));
T485 = y(13)^(1-params(43));
T509 = y(12)^params(50);
T515 = y(12)^(params(50)-1);
T520 = y(12)^(1-params(50));
T530 = y(30)^(params(54)-1);
T531 = params(54)*y(23)*exp(y(40))*T530;
T532 = y(4)^params(55);
T538 = y(30)^params(54);
T540 = y(4)^(params(55)-1);
T573 = params(61)-params(63)/params(62)-params(59)/(params(62)*y(10));
T574 = params(58)*y(10)*T573;
lhs =y(77);
rhs =log(y(16)/(y(16)))*400;
residual(1)= lhs-rhs;
lhs =y(79);
rhs =400*log(y(12)/(y(12)));
residual(2)= lhs-rhs;
lhs =y(78);
rhs =0.25*(y(79)+y(79)+y(79)+y(79));
residual(3)= lhs-rhs;
lhs =y(80);
rhs =(log(y(5))-log((y(5))))*100;
residual(4)= lhs-rhs;
lhs =y(81);
rhs =100*(log(y(5))-log(y(49)));
residual(5)= lhs-rhs;
lhs =y(77);
rhs =params(32)*x(2)+y(80)*params(31)+y(80)*params(30)+y(80)*params(29)+y(80)*params(28)+y(80)*params(27)+y(80)*params(26)+y(80)*params(25)+y(80)*params(24)+y(80)*params(23)+y(81)*params(22)+y(81)*params(21)+y(81)*params(20)+y(81)*params(19)+y(81)*params(18)+y(81)*params(17)+y(81)*params(16)+y(81)*params(15)+y(81)*params(14)+y(79)*params(13)+y(79)*params(12)+y(79)*params(11)+y(79)*params(10)+y(79)*params(6)+y(79)*params(5)+y(77)*params(1)+y(77)*params(2)+y(77)*params(3)+y(77)*params(4)+y(79)*params(7)+y(79)*params(8)+y(79)*params(9);
residual(6)= lhs-rhs;
lhs =y(64);
rhs =(y(16));
residual(7)= lhs-rhs;
lhs =1/(y(45)-y(45)*params(34))-params(34)*params(35)/(y(45)-y(45)*params(34));
rhs =y(62);
residual(8)= lhs-rhs;
lhs =y(55);
rhs =params(40)+params(41)*(y(69)-1);
residual(9)= lhs-rhs;
lhs =y(62)*y(54);
rhs =params(35)*y(62)*T197;
residual(10)= lhs-rhs;
lhs =y(62);
rhs =y(64)*params(35)*y(62)/y(60);
residual(11)= lhs-rhs;
lhs =T208*T210;
rhs =params(47)*y(76)^(1-params(43));
residual(12)= lhs-rhs;
lhs =y(76)^(1+params(43)*params(39));
rhs =T228*T229*T231;
residual(13)= lhs-rhs;
lhs =y(65);
rhs =(y(23));
residual(14)= lhs-rhs;
lhs =y(55);
rhs =T257;
residual(15)= lhs-rhs;
lhs =y(57);
rhs =T266;
residual(16)= lhs-rhs;
lhs =y(58);
rhs =T256*T248*T260*y(65)*exp(y(40))*params(56)*T273;
residual(17)= lhs-rhs;
lhs =y(59);
rhs =T252*T248*T260*y(65)*exp(y(40))*params(57)*T283;
residual(18)= lhs-rhs;
lhs =y(50);
rhs =(y(52)+y(51))/y(53);
residual(19)= lhs-rhs;
lhs =y(52)*y(61);
rhs =y(50)*params(58)*params(59)/params(62);
residual(20)= lhs-rhs;
lhs =y(53);
rhs =1+params(59)-T311/y(64);
residual(21)= lhs-rhs;
lhs =y(64)*params(49)*y(56);
rhs =y(50)*T311;
residual(22)= lhs-rhs;
lhs =y(72);
rhs =y(50)*params(59)*params(58)*params(64)/(y(54)*params(62));
residual(23)= lhs-rhs;
lhs =y(73);
rhs =y(50)*params(63)*params(58)*params(65)/params(62);
residual(24)= lhs-rhs;
lhs =y(52);
rhs =y(72)*(y(55)+y(54)*(1-params(36)*exp(y(42))))+params(49)*y(59);
residual(25)= lhs-rhs;
lhs =y(51);
rhs =y(73)*(y(55)+y(54)*(1-params(36)))+params(48)*y(58);
residual(26)= lhs-rhs;
lhs =y(47);
rhs =y(50)*params(59)*params(58)*(1-params(64))/params(62);
residual(27)= lhs-rhs;
lhs =y(46);
rhs =y(50)*params(63)*y(54)*params(58)*(1-params(65))/params(62);
residual(28)= lhs-rhs;
lhs =y(50)+y(47)+y(46)+y(45)*params(47)+y(50)*params(59);
rhs =y(49);
residual(29)= lhs-rhs;
lhs =y(71);
rhs =(1-params(36))*y(71)+y(50)*params(58)*params(61);
residual(30)= lhs-rhs;
lhs =y(49);
rhs =T256*T252*T248*exp(y(40))*T260-params(69);
residual(31)= lhs-rhs;
lhs =y(63);
rhs =y(52)/(y(50)*(1+params(59))-y(51));
residual(32)= lhs-rhs;
lhs =y(70);
rhs =y(72)+y(73)+y(69)*(y(71)-y(73)-y(72));
residual(33)= lhs-rhs;
lhs =y(67);
rhs =1;
residual(34)= lhs-rhs;
lhs =y(66);
rhs =y(6)-y(51);
residual(35)= lhs-rhs;
lhs =y(68);
rhs =y(47)+y(46)+y(45)*params(47);
residual(36)= lhs-rhs;
lhs =y(74);
rhs =log(y(49));
residual(37)= lhs-rhs;
lhs =y(75);
rhs =log(y(50));
residual(38)= lhs-rhs;
lhs =1/(y(1)-params(34)*y(1))-params(34)*params(35)/(y(1)-params(34)*y(1));
rhs =y(18);
residual(39)= lhs-rhs;
lhs =params(37)/(y(22)/y(20));
rhs =y(18)*(y(16)-1);
residual(40)= lhs-rhs;
lhs =y(11);
rhs =params(40)+params(41)*(y(29)-1);
residual(41)= lhs-rhs;
lhs =y(18)*y(10);
rhs =params(35)*y(18)*T439;
residual(42)= lhs-rhs;
lhs =y(18);
rhs =y(16)*params(35)*y(18)/y(12);
residual(43)= lhs-rhs;
lhs =y(12);
rhs =y(20)*y(24)/y(20);
residual(44)= lhs-rhs;
lhs =y(37);
rhs =T453*y(38)/y(39);
residual(45)= lhs-rhs;
lhs =y(38);
rhs =T471^T452;
residual(46)= lhs-rhs;
lhs =y(39);
rhs =T481^T452;
residual(47)= lhs-rhs;
lhs =T484*T485;
rhs =params(47)*(1-params(44))*y(37)^(1-params(43))+T485*params(44)*T484;
residual(48)= lhs-rhs;
lhs =y(34);
rhs =params(50)*y(35)/((params(50)-1)*y(36));
residual(49)= lhs-rhs;
lhs =y(35);
rhs =y(35)*params(35)*params(51)+y(5)*y(23)*y(18)*T509;
residual(50)= lhs-rhs;
lhs =y(36);
rhs =y(36)*params(35)*params(51)+y(5)*y(18)*T515;
residual(51)= lhs-rhs;
lhs =T520;
rhs =(1-params(51))*y(34)^(1-params(50))+params(51)*T520;
residual(52)= lhs-rhs;
lhs =y(11);
rhs =T256*T252*T531*T532;
residual(53)= lhs-rhs;
lhs =y(13);
rhs =T256*T252*params(55)*y(23)*exp(y(40))*T538*T540;
residual(54)= lhs-rhs;
lhs =y(14);
rhs =T256*T273*T532*T538*params(56)*y(23)*exp(y(40));
residual(55)= lhs-rhs;
lhs =y(15);
rhs =T283*T252*T532*T538*params(57)*y(23)*exp(y(40));
residual(56)= lhs-rhs;
lhs =y(6);
rhs =(y(8)+y(7))/y(9);
residual(57)= lhs-rhs;
lhs =y(8)*y(17);
rhs =params(58)*params(59)*y(6)/params(62);
residual(58)= lhs-rhs;
lhs =y(9);
rhs =1+params(59)-T574/y(16);
residual(59)= lhs-rhs;
lhs =y(16)*(1-params(47)*y(22))/y(20);
rhs =y(6)*T574;
residual(60)= lhs-rhs;
lhs =y(32);
rhs =params(59)*params(58)*params(64)*y(6)/(params(62)*y(10));
residual(61)= lhs-rhs;
lhs =y(33);
rhs =params(63)*params(58)*params(65)*y(6)/params(62);
residual(62)= lhs-rhs;
lhs =y(8);
rhs =y(32)*(y(11)+(1-params(36)*exp(y(42)))*y(10))+params(49)*y(15);
residual(63)= lhs-rhs;
lhs =y(7);
rhs =y(33)*(y(11)+(1-params(36))*y(10))+params(48)*y(14);
residual(64)= lhs-rhs;
lhs =y(3);
rhs =params(59)*params(58)*(1-params(64))*y(6)/params(62);
residual(65)= lhs-rhs;
lhs =y(2);
rhs =y(6)*params(63)*params(58)*(1-params(65))*y(10)/params(62);
residual(66)= lhs-rhs;
lhs =y(6)+y(3)+y(2)+params(47)*y(1)+params(59)*y(6);
rhs =y(5);
residual(67)= lhs-rhs;
lhs =y(31);
rhs =(1-params(36))*y(31)+params(58)*params(61)*y(6);
residual(68)= lhs-rhs;
lhs =y(5);
rhs =T256*T252*T532*exp(y(40))*T538-params(69);
residual(69)= lhs-rhs;
lhs =y(19);
rhs =y(8)/((1+params(59))*y(6)-y(7));
residual(70)= lhs-rhs;
lhs =params(49)*y(26);
rhs =(1-params(47)*y(22))/y(20);
residual(71)= lhs-rhs;
lhs =y(30);
rhs =y(32)+y(33)+y(29)*(y(31)-y(33)-y(32));
residual(72)= lhs-rhs;
lhs =y(25);
rhs =y(12);
residual(73)= lhs-rhs;
lhs =y(27);
rhs =1;
residual(74)= lhs-rhs;
lhs =y(21);
rhs =y(6)-y(7);
residual(75)= lhs-rhs;
lhs =y(28);
rhs =y(3)+y(2)+params(47)*y(1);
residual(76)= lhs-rhs;
lhs =y(40);
rhs =y(40)*params(72)+x(1);
residual(77)= lhs-rhs;
lhs =y(41);
rhs =y(41)*params(73);
residual(78)= lhs-rhs;
lhs =y(42);
rhs =y(42)*params(74);
residual(79)= lhs-rhs;
lhs =y(43);
rhs =log(y(5));
residual(80)= lhs-rhs;
lhs =y(44);
rhs =log(y(6));
residual(81)= lhs-rhs;
lhs =y(82);
rhs =y(79);
residual(82)= lhs-rhs;
lhs =y(83);
rhs =y(79);
residual(83)= lhs-rhs;
lhs =y(84);
rhs =y(79);
residual(84)= lhs-rhs;
lhs =y(85);
rhs =y(81);
residual(85)= lhs-rhs;
lhs =y(86);
rhs =y(81);
residual(86)= lhs-rhs;
lhs =y(87);
rhs =y(81);
residual(87)= lhs-rhs;
lhs =y(88);
rhs =y(80);
residual(88)= lhs-rhs;
lhs =y(89);
rhs =y(80);
residual(89)= lhs-rhs;
lhs =y(90);
rhs =y(80);
residual(90)= lhs-rhs;
lhs =y(91);
rhs =y(79);
residual(91)= lhs-rhs;
lhs =y(92);
rhs =y(79);
residual(92)= lhs-rhs;
lhs =y(93);
rhs =y(80);
residual(93)= lhs-rhs;
lhs =y(94);
rhs =y(80);
residual(94)= lhs-rhs;
lhs =y(95);
rhs =y(80);
residual(95)= lhs-rhs;
lhs =y(96);
rhs =y(81);
residual(96)= lhs-rhs;
lhs =y(97);
rhs =y(81);
residual(97)= lhs-rhs;
lhs =y(98);
rhs =y(81);
residual(98)= lhs-rhs;
lhs =y(99);
rhs =y(77);
residual(99)= lhs-rhs;
lhs =y(100);
rhs =y(77);
residual(100)= lhs-rhs;
lhs =y(101);
rhs =y(77);
residual(101)= lhs-rhs;
lhs =y(102);
rhs =y(79);
residual(102)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(102, 102);

  %
  % Jacobian matrix
  %

T846 = getPowerDeriv(T471,T452,1);
T851 = getPowerDeriv(T481,T452,1);
T854 = getPowerDeriv(y(4),params(55),1);
T928 = params(58)*T573+params(58)*y(10)*(-((-(params(59)*params(62)))/(params(62)*y(10)*params(62)*y(10))));
T960 = getPowerDeriv(y(12)*y(13),params(43)*(1+params(39)),1);
T969 = getPowerDeriv(y(12),1-params(43),1);
T980 = getPowerDeriv(y(12),1-params(50),1);
T992 = getPowerDeriv(y(13),1-params(43),1);
T1030 = y(22)/y(20)*y(22)/y(20);
T1086 = getPowerDeriv(y(30),params(54),1);
T1170 = getPowerDeriv(y(48),params(55),1);
T1227 = params(58)*T310+y(54)*params(58)*(-((-(params(59)*params(62)))/(y(54)*params(62)*y(54)*params(62))));
T1315 = getPowerDeriv(y(70),params(54),1);
  g1(1,16)=(-(400*((y(16))-y(16))/((y(16))*(y(16)))/(y(16)/(y(16)))));
  g1(1,77)=1;
  g1(2,12)=(-(400*((y(12))-y(12))/((y(12))*(y(12)))/(y(12)/(y(12)))));
  g1(2,79)=1;
  g1(3,78)=1;
  g1(3,79)=(-1);
  g1(4,5)=(-(100*(1/y(5)-1/(y(5)))));
  g1(4,80)=1;
  g1(5,5)=(-(100*1/y(5)));
  g1(5,49)=(-(100*(-(1/y(49)))));
  g1(5,81)=1;
  g1(6,77)=1-(params(4)+params(3)+params(1)+params(2));
  g1(6,79)=(-(params(13)+params(12)+params(11)+params(10)+params(9)+params(8)+params(7)+params(6)+params(5)));
  g1(6,80)=(-(params(31)+params(30)+params(29)+params(28)+params(27)+params(26)+params(25)+params(24)+params(23)));
  g1(6,81)=(-(params(22)+params(21)+params(20)+params(19)+params(18)+params(17)+params(16)+params(15)+params(14)));
  g1(7,16)=(-1);
  g1(7,64)=1;
  g1(8,45)=(-(1-params(34)))/((y(45)-y(45)*params(34))*(y(45)-y(45)*params(34)))-(-(params(34)*params(35)*(1-params(34))))/((y(45)-y(45)*params(34))*(y(45)-y(45)*params(34)));
  g1(8,62)=(-1);
  g1(9,55)=1;
  g1(9,69)=(-params(41));
  g1(10,54)=y(62)-params(35)*y(62)*(1-params(36));
  g1(10,55)=(-(params(35)*y(62)*y(69)));
  g1(10,62)=y(54)-params(35)*T197;
  g1(10,69)=(-(params(35)*y(62)*(y(55)-(params(40)+params(41)*0.5*2*(y(69)-1)))));
  g1(11,60)=(-((-(y(64)*params(35)*y(62)))/(y(60)*y(60))));
  g1(11,62)=1-y(64)*params(35)/y(60);
  g1(11,64)=(-(params(35)*y(62)/y(60)));
  g1(12,57)=T208*getPowerDeriv(y(57),1-params(43),1);
  g1(12,60)=T210*getPowerDeriv(y(60),1-params(43),1);
  g1(12,76)=(-(params(47)*getPowerDeriv(y(76),1-params(43),1)));
  g1(13,48)=(-(T231*T229*T225*getPowerDeriv(y(48),params(39),1)));
  g1(13,57)=(-(T231*T228*getPowerDeriv(y(57),params(43)*params(39),1)));
  g1(13,60)=(-(T228*T229*getPowerDeriv(y(60),1+params(43)*params(39),1)));
  g1(13,62)=(-(T231*T229*T227*(-(params(43)*params(38)/(params(43)-1)))/(y(62)*y(62))));
  g1(13,76)=getPowerDeriv(y(76),1+params(43)*params(39),1);
  g1(14,23)=(-1);
  g1(14,65)=1;
  g1(15,40)=(-T257);
  g1(15,48)=(-(T256*T252*T246*T1170));
  g1(15,55)=1;
  g1(15,65)=(-(T256*T252*T248*T245*exp(y(40))*params(54)));
  g1(15,70)=(-(T256*T252*T248*y(65)*exp(y(40))*params(54)*getPowerDeriv(y(70),params(54)-1,1)));
  g1(16,40)=(-T266);
  g1(16,48)=(-(T256*T252*y(65)*exp(y(40))*params(55)*T260*getPowerDeriv(y(48),params(55)-1,1)));
  g1(16,57)=1;
  g1(16,65)=(-(T256*T252*T263*T260*exp(y(40))*params(55)));
  g1(16,70)=(-(T256*T252*T263*y(65)*exp(y(40))*params(55)*T1315));
  g1(17,40)=(-(T256*T248*T260*y(65)*exp(y(40))*params(56)*T273));
  g1(17,48)=(-(T256*T273*T260*y(65)*exp(y(40))*params(56)*T1170));
  g1(17,58)=1;
  g1(17,65)=(-(T256*T273*T248*T260*exp(y(40))*params(56)));
  g1(17,70)=(-(T256*T273*T248*y(65)*exp(y(40))*params(56)*T1315));
  g1(18,40)=(-(T252*T248*T260*y(65)*exp(y(40))*params(57)*T283));
  g1(18,48)=(-(T283*T252*T260*y(65)*exp(y(40))*params(57)*T1170));
  g1(18,59)=1;
  g1(18,65)=(-(T283*T252*T248*T260*exp(y(40))*params(57)));
  g1(18,70)=(-(T283*T252*T248*y(65)*exp(y(40))*params(57)*T1315));
  g1(19,50)=1;
  g1(19,51)=(-(1/y(53)));
  g1(19,52)=(-(1/y(53)));
  g1(19,53)=(-((-(y(52)+y(51)))/(y(53)*y(53))));
  g1(20,50)=(-(params(58)*params(59)/params(62)));
  g1(20,52)=y(61);
  g1(20,61)=y(52);
  g1(21,53)=1;
  g1(21,54)=T1227/y(64);
  g1(21,64)=(-T311)/(y(64)*y(64));
  g1(22,50)=(-T311);
  g1(22,54)=(-(y(50)*T1227));
  g1(22,56)=y(64)*params(49);
  g1(22,64)=params(49)*y(56);
  g1(23,50)=(-(params(59)*params(58)*params(64)/(y(54)*params(62))));
  g1(23,54)=(-((-(params(62)*y(50)*params(59)*params(58)*params(64)))/(y(54)*params(62)*y(54)*params(62))));
  g1(23,72)=1;
  g1(24,50)=(-(params(63)*params(58)*params(65)/params(62)));
  g1(24,73)=1;
  g1(25,42)=(-(y(72)*y(54)*(-(params(36)*exp(y(42))))));
  g1(25,52)=1;
  g1(25,54)=(-(y(72)*(1-params(36)*exp(y(42)))));
  g1(25,55)=(-y(72));
  g1(25,59)=(-params(49));
  g1(25,72)=(-(y(55)+y(54)*(1-params(36)*exp(y(42)))));
  g1(26,51)=1;
  g1(26,54)=(-((1-params(36))*y(73)));
  g1(26,55)=(-y(73));
  g1(26,58)=(-params(48));
  g1(26,73)=(-(y(55)+y(54)*(1-params(36))));
  g1(27,47)=1;
  g1(27,50)=(-(params(59)*params(58)*(1-params(64))/params(62)));
  g1(28,46)=1;
  g1(28,50)=(-(params(63)*y(54)*params(58)*(1-params(65))/params(62)));
  g1(28,54)=(-(y(50)*params(63)*params(58)*(1-params(65))/params(62)));
  g1(29,45)=params(47);
  g1(29,46)=1;
  g1(29,47)=1;
  g1(29,49)=(-1);
  g1(29,50)=1+params(59);
  g1(30,50)=(-(params(58)*params(61)));
  g1(30,71)=1-(1-params(36));
  g1(31,40)=(-(T256*T252*T248*exp(y(40))*T260));
  g1(31,48)=(-(T256*T252*exp(y(40))*T260*T1170));
  g1(31,49)=1;
  g1(31,70)=(-(T256*T252*T248*exp(y(40))*T1315));
  g1(32,50)=(-((-(y(52)*(1+params(59))))/((y(50)*(1+params(59))-y(51))*(y(50)*(1+params(59))-y(51)))));
  g1(32,51)=(-(y(52)/((y(50)*(1+params(59))-y(51))*(y(50)*(1+params(59))-y(51)))));
  g1(32,52)=(-(1/(y(50)*(1+params(59))-y(51))));
  g1(32,63)=1;
  g1(33,69)=(-(y(71)-y(73)-y(72)));
  g1(33,70)=1;
  g1(33,71)=(-y(69));
  g1(33,72)=(-(1-y(69)));
  g1(33,73)=(-(1-y(69)));
  g1(34,67)=1;
  g1(35,6)=(-1);
  g1(35,51)=1;
  g1(35,66)=1;
  g1(36,45)=(-params(47));
  g1(36,46)=(-1);
  g1(36,47)=(-1);
  g1(36,68)=1;
  g1(37,49)=(-(1/y(49)));
  g1(37,74)=1;
  g1(38,50)=(-(1/y(50)));
  g1(38,75)=1;
  g1(39,1)=(-(1-params(34)))/((y(1)-params(34)*y(1))*(y(1)-params(34)*y(1)))-(-(params(34)*params(35)*(1-params(34))))/((y(1)-params(34)*y(1))*(y(1)-params(34)*y(1)));
  g1(39,18)=(-1);
  g1(40,16)=(-y(18));
  g1(40,18)=(-(y(16)-1));
  g1(40,20)=(-(params(37)*(-y(22))/(y(20)*y(20))))/T1030;
  g1(40,22)=(-(params(37)*1/y(20)))/T1030;
  g1(41,11)=1;
  g1(41,29)=(-params(41));
  g1(42,10)=y(18)-params(35)*(1-params(36))*y(18);
  g1(42,11)=(-(params(35)*y(18)*y(29)));
  g1(42,18)=y(10)-params(35)*T439;
  g1(42,29)=(-(params(35)*y(18)*(y(11)-(params(40)+params(41)*0.5*2*(y(29)-1)))));
  g1(43,12)=(-((-(y(16)*params(35)*y(18)))/(y(12)*y(12))));
  g1(43,16)=(-(params(35)*y(18)/y(12)));
  g1(43,18)=1-y(16)*params(35)/y(12);
  g1(44,12)=1;
  g1(44,24)=(-1);
  g1(45,37)=1;
  g1(45,38)=(-(T453/y(39)));
  g1(45,39)=(-((-(T453*y(38)))/(y(39)*y(39))));
  g1(46,4)=(-(T469*getPowerDeriv(y(4),1+params(39),1)*T846));
  g1(46,12)=(-(T846*T465*y(13)*T960));
  g1(46,13)=(-(T846*T465*y(12)*T960));
  g1(46,38)=1-T846*params(35)*params(44)*getPowerDeriv(y(38),1+params(43)*params(39),1);
  g1(47,4)=(-(T479*y(18)*T477*T851));
  g1(47,12)=(-(T851*y(18)*y(4)*T477*getPowerDeriv(y(12),params(43)-1,1)));
  g1(47,13)=(-(T851*T479*y(18)*y(4)*getPowerDeriv(y(13),params(43),1)));
  g1(47,18)=(-(T851*T479*y(4)*T477));
  g1(47,39)=1-T851*params(35)*params(44)*getPowerDeriv(y(39),1+params(43)*params(39),1);
  g1(48,12)=T485*T969-T485*params(44)*T969;
  g1(48,13)=T484*T992-params(44)*T484*T992;
  g1(48,37)=(-(params(47)*(1-params(44))*getPowerDeriv(y(37),1-params(43),1)));
  g1(49,34)=1;
  g1(49,35)=(-(params(50)/((params(50)-1)*y(36))));
  g1(49,36)=(-((-(params(50)*y(35)*(params(50)-1)))/((params(50)-1)*y(36)*(params(50)-1)*y(36))));
  g1(50,5)=(-(y(23)*y(18)*T509));
  g1(50,12)=(-(y(5)*y(23)*y(18)*getPowerDeriv(y(12),params(50),1)));
  g1(50,18)=(-(T509*y(5)*y(23)));
  g1(50,23)=(-(T509*y(5)*y(18)));
  g1(50,35)=1-params(35)*params(51);
  g1(51,5)=(-(y(18)*T515));
  g1(51,12)=(-(y(5)*y(18)*getPowerDeriv(y(12),params(50)-1,1)));
  g1(51,18)=(-(y(5)*T515));
  g1(51,36)=1-params(35)*params(51);
  g1(52,12)=T980-params(51)*T980;
  g1(52,34)=(-((1-params(51))*getPowerDeriv(y(34),1-params(50),1)));
  g1(53,4)=(-(T256*T252*T531*T854));
  g1(53,11)=1;
  g1(53,23)=(-(T256*T252*T532*T530*exp(y(40))*params(54)));
  g1(53,30)=(-(T256*T252*T532*params(54)*y(23)*exp(y(40))*getPowerDeriv(y(30),params(54)-1,1)));
  g1(53,40)=(-(T256*T252*T531*T532));
  g1(54,4)=(-(T256*T252*params(55)*y(23)*exp(y(40))*T538*getPowerDeriv(y(4),params(55)-1,1)));
  g1(54,13)=1;
  g1(54,23)=(-(T256*T252*T540*T538*exp(y(40))*params(55)));
  g1(54,30)=(-(T256*T252*T540*params(55)*y(23)*exp(y(40))*T1086));
  g1(54,40)=(-(T256*T252*params(55)*y(23)*exp(y(40))*T538*T540));
  g1(55,4)=(-(T256*T273*T538*params(56)*y(23)*exp(y(40))*T854));
  g1(55,14)=1;
  g1(55,23)=(-(T256*T273*T532*T538*exp(y(40))*params(56)));
  g1(55,30)=(-(T256*T273*T532*params(56)*y(23)*exp(y(40))*T1086));
  g1(55,40)=(-(T256*T273*T532*T538*params(56)*y(23)*exp(y(40))));
  g1(56,4)=(-(T283*T252*T538*params(57)*y(23)*exp(y(40))*T854));
  g1(56,15)=1;
  g1(56,23)=(-(T283*T252*T532*T538*exp(y(40))*params(57)));
  g1(56,30)=(-(T283*T252*T532*params(57)*y(23)*exp(y(40))*T1086));
  g1(56,40)=(-(T283*T252*T532*T538*params(57)*y(23)*exp(y(40))));
  g1(57,6)=1;
  g1(57,7)=(-(1/y(9)));
  g1(57,8)=(-(1/y(9)));
  g1(57,9)=(-((-(y(8)+y(7)))/(y(9)*y(9))));
  g1(58,6)=(-(params(58)*params(59)/params(62)));
  g1(58,8)=y(17);
  g1(58,17)=y(8);
  g1(59,9)=1;
  g1(59,10)=T928/y(16);
  g1(59,16)=(-T574)/(y(16)*y(16));
  g1(60,6)=(-T574);
  g1(60,10)=(-(y(6)*T928));
  g1(60,16)=(1-params(47)*y(22))/y(20);
  g1(60,20)=(-(y(16)*(1-params(47)*y(22))))/(y(20)*y(20));
  g1(60,22)=y(16)*(-params(47))/y(20);
  g1(61,6)=(-(params(59)*params(58)*params(64)/(params(62)*y(10))));
  g1(61,10)=(-((-(params(62)*params(59)*params(58)*params(64)*y(6)))/(params(62)*y(10)*params(62)*y(10))));
  g1(61,32)=1;
  g1(62,6)=(-(params(63)*params(58)*params(65)/params(62)));
  g1(62,33)=1;
  g1(63,8)=1;
  g1(63,10)=(-((1-params(36)*exp(y(42)))*y(32)));
  g1(63,11)=(-y(32));
  g1(63,15)=(-params(49));
  g1(63,32)=(-(y(11)+(1-params(36)*exp(y(42)))*y(10)));
  g1(63,42)=(-(y(32)*y(10)*(-(params(36)*exp(y(42))))));
  g1(64,7)=1;
  g1(64,10)=(-((1-params(36))*y(33)));
  g1(64,11)=(-y(33));
  g1(64,14)=(-params(48));
  g1(64,33)=(-(y(11)+(1-params(36))*y(10)));
  g1(65,3)=1;
  g1(65,6)=(-(params(59)*params(58)*(1-params(64))/params(62)));
  g1(66,2)=1;
  g1(66,6)=(-(params(63)*params(58)*(1-params(65))*y(10)/params(62)));
  g1(66,10)=(-(y(6)*params(63)*params(58)*(1-params(65))/params(62)));
  g1(67,1)=params(47);
  g1(67,2)=1;
  g1(67,3)=1;
  g1(67,5)=(-1);
  g1(67,6)=1+params(59);
  g1(68,6)=(-(params(58)*params(61)));
  g1(68,31)=1-(1-params(36));
  g1(69,4)=(-(T256*T252*exp(y(40))*T538*T854));
  g1(69,5)=1;
  g1(69,30)=(-(T256*T252*T532*exp(y(40))*T1086));
  g1(69,40)=(-(T256*T252*T532*exp(y(40))*T538));
  g1(70,6)=(-((-((1+params(59))*y(8)))/(((1+params(59))*y(6)-y(7))*((1+params(59))*y(6)-y(7)))));
  g1(70,7)=(-(y(8)/(((1+params(59))*y(6)-y(7))*((1+params(59))*y(6)-y(7)))));
  g1(70,8)=(-(1/((1+params(59))*y(6)-y(7))));
  g1(70,19)=1;
  g1(71,20)=(-((-(1-params(47)*y(22)))/(y(20)*y(20))));
  g1(71,22)=(-((-params(47))/y(20)));
  g1(71,26)=params(49);
  g1(72,29)=(-(y(31)-y(33)-y(32)));
  g1(72,30)=1;
  g1(72,31)=(-y(29));
  g1(72,32)=(-(1-y(29)));
  g1(72,33)=(-(1-y(29)));
  g1(73,12)=(-1);
  g1(73,25)=1;
  g1(74,27)=1;
  g1(75,6)=(-1);
  g1(75,7)=1;
  g1(75,21)=1;
  g1(76,1)=(-params(47));
  g1(76,2)=(-1);
  g1(76,3)=(-1);
  g1(76,28)=1;
  g1(77,40)=1-params(72);
  g1(78,41)=1-params(73);
  g1(79,42)=1-params(74);
  g1(80,5)=(-(1/y(5)));
  g1(80,43)=1;
  g1(81,6)=(-(1/y(6)));
  g1(81,44)=1;
  g1(82,79)=(-1);
  g1(82,82)=1;
  g1(83,79)=(-1);
  g1(83,83)=1;
  g1(84,79)=(-1);
  g1(84,84)=1;
  g1(85,81)=(-1);
  g1(85,85)=1;
  g1(86,81)=(-1);
  g1(86,86)=1;
  g1(87,81)=(-1);
  g1(87,87)=1;
  g1(88,80)=(-1);
  g1(88,88)=1;
  g1(89,80)=(-1);
  g1(89,89)=1;
  g1(90,80)=(-1);
  g1(90,90)=1;
  g1(91,79)=(-1);
  g1(91,91)=1;
  g1(92,79)=(-1);
  g1(92,92)=1;
  g1(93,80)=(-1);
  g1(93,93)=1;
  g1(94,80)=(-1);
  g1(94,94)=1;
  g1(95,80)=(-1);
  g1(95,95)=1;
  g1(96,81)=(-1);
  g1(96,96)=1;
  g1(97,81)=(-1);
  g1(97,97)=1;
  g1(98,81)=(-1);
  g1(98,98)=1;
  g1(99,77)=(-1);
  g1(99,99)=1;
  g1(100,77)=(-1);
  g1(100,100)=1;
  g1(101,77)=(-1);
  g1(101,101)=1;
  g1(102,79)=(-1);
  g1(102,102)=1;
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],102,10404);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],102,1061208);
end
end
end
end
