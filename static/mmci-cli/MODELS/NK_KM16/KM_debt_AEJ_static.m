function [residual, g1, g2, g3] = KM_debt_AEJ_static(y, x, params)
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

residual = zeros( 72, 1);

%
% Model equations
%

T27 = (-1)/(params(9)*(1+params(27))-1);
T30 = 1/(1-params(9));
T36 = params(7)*y(58)^(1+params(27));
T38 = params(9)*(1+params(27))/(params(9)-1);
T39 = y(53)^T38;
T47 = params(9)/(params(9)-1);
T48 = y(53)^T47;
T64 = params(42)*y(66)^params(26);
T68 = T64*(1+y(71))/y(71);
T70 = 1/params(11);
T81 = params(15)*y(30)/y(64);
T150 = params(19)*exp(y(42)/100);
T165 = y(15)^params(17);
T170 = y(15)^(params(17)*(-params(13)));
T175 = T150^((-params(17))*(1-params(13)));
T176 = params(15)*params(16)*T165*T170*T175;
T183 = y(15)^(params(17)-1);
T187 = y(15)^(params(13)*(1-params(17)));
T190 = T150^((1-params(13))*(1-params(17)));
T216 = y(15)^(-params(8));
T219 = T150^(params(8)-1);
T222 = y(24)^T30;
T233 = y(19)^((-1)/(1-params(9)));
T239 = params(7)*y(4)^(1+params(27));
T240 = y(24)^T38;
T244 = params(15)*params(10)*y(19)^T38;
T252 = y(24)^T47;
T256 = params(15)*params(10)*y(19)^(1/(params(9)-1));
T275 = y(15)^(params(13)*(-params(17)));
T276 = T175*params(16)*T165*T275;
T280 = y(15)^(-1);
T281 = params(15)*y(30)*T280;
T287 = params(42)*y(3)^params(26);
T289 = (1+y(18))*T287/y(18);
T521 = 1/params(60);
T525 = 1/params(59);
residual(1) = y(52)-1/params(38);
residual(2) = y(52)-y(53)/y(26);
lhs =(params(9)*y(54)/y(55))^T27;
rhs =y(53)^T30;
residual(3)= lhs-rhs;
lhs =y(54);
rhs =T36*T39;
residual(4)= lhs-rhs;
lhs =y(55);
rhs =y(58)*(1-y(57))*y(56)*T48;
residual(5)= lhs-rhs;
residual(6) = y(65)-y(66)-y(25);
residual(7) = y(65)-y(26)*y(58);
lhs =y(59);
rhs =T68^T70;
residual(8)= lhs-rhs;
lhs =1;
rhs =params(15)*y(30)*y(63);
residual(9)= lhs-rhs;
lhs =1;
rhs =T81*(1+y(69));
residual(10)= lhs-rhs;
lhs =y(70);
rhs =T81*(1+y(70)*(1-params(4)));
residual(11)= lhs-rhs;
residual(12) = y(56)-y(66)^(-params(26));
lhs =y(62);
rhs =(1-params(4))*y(9)/y(64)+y(60)+y(27);
residual(13)= lhs-rhs;
lhs =y(9)*(1-params(4))*y(8)/y(64)+y(69)*y(60);
rhs =y(62)*y(61)-y(27)*y(61);
residual(14)= lhs-rhs;
lhs =y(60)+y(59)+y(58)*y(53)*y(57)-y(6)/y(64);
rhs =y(25)+y(9)*(params(4)+y(8))/y(64);
residual(15)= lhs-rhs;
lhs =y(67)/4;
rhs =y(67)*params(32)/4+params(33)*y(72)/4+params(34)*y(68)/4;
residual(16)= lhs-rhs;
lhs =y(64);
rhs =T150;
residual(17)= lhs-rhs;
lhs =y(63);
rhs =(1+y(71))/y(64);
residual(18)= lhs-rhs;
residual(19) = y(14)-y(1)*y(16)*y(17)-y(14)*T176;
residual(20) = y(22)-y(1)*y(16)-y(22)*params(15)*params(16)*T183*T187*T190;
residual(21) = y(23)-params(38)*y(14)/y(22);
residual(22) = 1-T183*T187*params(16)*T190-(1-params(16))*y(23)^(1-params(17));
residual(23) = y(17)-y(24)/y(26);
lhs =y(19);
rhs =y(15)*T216*T219;
residual(24)= lhs-rhs;
lhs =T222;
rhs =(1-params(10))*(params(9)*y(20)/y(21))^T27+T222*params(10)*T233;
residual(25)= lhs-rhs;
lhs =y(20);
rhs =T239*T240+y(20)*T244;
residual(26)= lhs-rhs;
lhs =y(21);
rhs =y(4)*y(16)*(1-y(11))*T252+y(21)*T256;
residual(27)= lhs-rhs;
residual(28) = y(1)-y(3)-y(25);
residual(29) = y(1)-y(26)*y(4)/y(2);
residual(30) = y(2)-(1-params(16))*y(23)^(-params(17))-y(2)*T276;
lhs =1;
rhs =T281*(1+y(18));
residual(31)= lhs-rhs;
lhs =y(6);
rhs =T289^T70;
residual(32)= lhs-rhs;
lhs =1;
rhs =T281*(1+y(7));
residual(33)= lhs-rhs;
lhs =y(5);
rhs =T281*(1+(1-params(4))*y(5));
residual(34)= lhs-rhs;
residual(35) = y(16)-y(3)^(-params(26));
lhs =y(9);
rhs =y(27)+(1-params(4))*y(9)/y(15)+y(10);
residual(36)= lhs-rhs;
lhs =y(9)*(1-params(4))*y(8)/y(15)+y(7)*y(10);
rhs =y(9)*y(8)-y(27)*y(8);
residual(37)= lhs-rhs;
lhs =y(10)+y(6)+y(4)*y(24)*y(11)-y(6)/y(15);
rhs =y(25)+y(9)*(params(4)+y(8))/y(15);
residual(38)= lhs-rhs;
lhs =y(38);
rhs =params(32)*y(38)+params(33)*y(39);
residual(39)= lhs-rhs;
lhs =y(32)/4;
rhs =(1-params(56))*(y(42)+params(57)*(y(34)/4-y(42))+params(58)*(y(31)-y(68)))+y(32)*params(56)/4+y(43);
residual(40)= lhs-rhs;
lhs =y(42);
rhs =y(42)*params(60)+x(5);
residual(41)= lhs-rhs;
lhs =y(43);
rhs =y(43)*params(59)+x(4);
residual(42)= lhs-rhs;
residual(43) = y(26)/params(44)-(y(26)/params(44))^params(54)*exp(x(1));
residual(44) = y(25)/params(45)-(y(25)/params(45))^params(55)*exp(x(2)/100);
lhs =y(27);
rhs =y(27)*params(48)+x(3);
residual(45)= lhs-rhs;
lhs =log(y(30));
rhs =log(y(30))*params(67)+x(6);
residual(46)= lhs-rhs;
lhs =y(34);
rhs =4*100*log(y(15)/params(19));
residual(47)= lhs-rhs;
lhs =y(32);
rhs =4*100*(y(18)-params(28));
residual(48)= lhs-rhs;
lhs =y(33);
rhs =4*100*(y(7)-params(28));
residual(49)= lhs-rhs;
lhs =y(41);
rhs =4*100*(y(8)-params(22));
residual(50)= lhs-rhs;
lhs =y(31);
rhs =100*log(y(1)/params(35));
residual(51)= lhs-rhs;
lhs =y(68);
rhs =100*log(y(65)/params(35));
residual(52)= lhs-rhs;
lhs =y(37);
rhs =100*log(y(3)/params(2));
residual(53)= lhs-rhs;
lhs =y(36);
rhs =100*log(y(24)/params(43));
residual(54)= lhs-rhs;
lhs =y(35);
rhs =100*log(y(4)/params(36));
residual(55)= lhs-rhs;
lhs =y(38);
rhs =100*(y(11)-params(46));
residual(56)= lhs-rhs;
lhs =y(67);
rhs =100*(y(57)-params(46));
residual(57)= lhs-rhs;
lhs =y(39);
rhs =100*log(y(9)/params(47));
residual(58)= lhs-rhs;
lhs =y(72);
rhs =100*log(y(62)/params(47));
residual(59)= lhs-rhs;
lhs =y(40);
rhs =100*log(y(10)/params(21));
residual(60)= lhs-rhs;
lhs =y(50);
rhs =100*log(y(6)/params(65));
residual(61)= lhs-rhs;
lhs =y(51);
rhs =4*y(42);
residual(62)= lhs-rhs;
lhs =y(28);
rhs =y(39)+y(41);
residual(63)= lhs-rhs;
lhs =y(12);
rhs =y(35)+y(38)+y(36);
residual(64)= lhs-rhs;
lhs =y(29);
rhs =y(32)-y(34);
residual(65)= lhs-rhs;
lhs =y(13);
rhs =100*log(y(5)/params(68));
residual(66)= lhs-rhs;
lhs =y(44);
rhs =y(44)*(params(60)-(1-params(56))*params(63)*(1-params(57)))-params(63)*y(47)+y(42)*(1-params(56))*params(63)*(1-params(57))+y(43)*params(63);
residual(67)= lhs-rhs;
lhs =y(47);
rhs =y(44)*(1-params(57))*(1-params(56))*(-params(64))+y(47)*(params(59)-params(64))+y(42)*(1-params(57))*(1-params(56))*params(64)+y(43)*params(64);
residual(68)= lhs-rhs;
lhs =y(45);
rhs =(y(44)*(params(60)-(1-params(56))*params(63)*(1-params(57)))-params(63)*y(47)+y(42)*(1-params(56))*params(63)*(1-params(57))+y(43)*params(63))*T521;
residual(69)= lhs-rhs;
lhs =y(46);
rhs =(y(44)*(1-params(57))*(1-params(56))*(-params(64))+y(47)*(params(59)-params(64))+y(42)*(1-params(57))*(1-params(56))*params(64)+y(43)*params(64))*T525;
residual(70)= lhs-rhs;
lhs =y(48);
rhs =y(45)-y(44);
residual(71)= lhs-rhs;
lhs =y(49);
rhs =y(46)-y(47);
residual(72)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(72, 72);

  %
  % Jacobian matrix
  %

T550 = getPowerDeriv(T289,T70,1);
T620 = getPowerDeriv(y(15),params(17),1);
T629 = getPowerDeriv(y(15),params(17)-1,1);
T631 = getPowerDeriv(y(15),params(13)*(1-params(17)),1);
T657 = params(15)*y(30)*getPowerDeriv(y(15),(-1),1);
T708 = getPowerDeriv(params(9)*y(20)/y(21),T27,1);
T733 = getPowerDeriv(y(24),T30,1);
T800 = params(19)*exp(y(42)/100)*0.01;
T803 = T800*getPowerDeriv(T150,(-params(17))*(1-params(13)),1);
T808 = T800*getPowerDeriv(T150,(1-params(13))*(1-params(17)),1);
T862 = getPowerDeriv(params(9)*y(54)/y(55),T27,1);
T914 = getPowerDeriv(T68,T70,1);
  g1(1,52)=1;
  g1(2,26)=(-((-y(53))/(y(26)*y(26))));
  g1(2,52)=1;
  g1(2,53)=(-(1/y(26)));
  g1(3,53)=(-(getPowerDeriv(y(53),T30,1)));
  g1(3,54)=params(9)/y(55)*T862;
  g1(3,55)=T862*(-(params(9)*y(54)))/(y(55)*y(55));
  g1(4,53)=(-(T36*getPowerDeriv(y(53),T38,1)));
  g1(4,54)=1;
  g1(4,58)=(-(T39*params(7)*getPowerDeriv(y(58),1+params(27),1)));
  g1(5,53)=(-(y(58)*(1-y(57))*y(56)*getPowerDeriv(y(53),T47,1)));
  g1(5,55)=1;
  g1(5,56)=(-(T48*y(58)*(1-y(57))));
  g1(5,57)=(-(T48*y(58)*(-y(56))));
  g1(5,58)=(-((1-y(57))*y(56)*T48));
  g1(6,25)=(-1);
  g1(6,65)=1;
  g1(6,66)=(-1);
  g1(7,26)=(-y(58));
  g1(7,58)=(-y(26));
  g1(7,65)=1;
  g1(8,59)=1;
  g1(8,66)=(-((1+y(71))*params(42)*getPowerDeriv(y(66),params(26),1)/y(71)*T914));
  g1(8,71)=(-(T914*(T64*y(71)-T64*(1+y(71)))/(y(71)*y(71))));
  g1(9,30)=(-(params(15)*y(63)));
  g1(9,63)=(-(params(15)*y(30)));
  g1(10,30)=(-((1+y(69))*params(15)/y(64)));
  g1(10,64)=(-((1+y(69))*(-(params(15)*y(30)))/(y(64)*y(64))));
  g1(10,69)=(-T81);
  g1(11,30)=(-((1+y(70)*(1-params(4)))*params(15)/y(64)));
  g1(11,64)=(-((1+y(70)*(1-params(4)))*(-(params(15)*y(30)))/(y(64)*y(64))));
  g1(11,70)=1-T81*(1-params(4));
  g1(12,56)=1;
  g1(12,66)=(-(getPowerDeriv(y(66),(-params(26)),1)));
  g1(13,9)=(-((1-params(4))/y(64)));
  g1(13,27)=(-1);
  g1(13,60)=(-1);
  g1(13,62)=1;
  g1(13,64)=(-((-((1-params(4))*y(9)))/(y(64)*y(64))));
  g1(14,8)=y(9)*(1-params(4))/y(64);
  g1(14,9)=(1-params(4))*y(8)/y(64);
  g1(14,27)=y(61);
  g1(14,60)=y(69);
  g1(14,61)=(-(y(62)-y(27)));
  g1(14,62)=(-y(61));
  g1(14,64)=y(9)*(-((1-params(4))*y(8)))/(y(64)*y(64));
  g1(14,69)=y(60);
  g1(15,6)=(-(1/y(64)));
  g1(15,8)=(-(y(9)/y(64)));
  g1(15,9)=(-((params(4)+y(8))/y(64)));
  g1(15,25)=(-1);
  g1(15,53)=y(58)*y(57);
  g1(15,57)=y(53)*y(58);
  g1(15,58)=y(53)*y(57);
  g1(15,59)=1;
  g1(15,60)=1;
  g1(15,64)=(-((-y(6))/(y(64)*y(64))))-(-(y(9)*(params(4)+y(8))))/(y(64)*y(64));
  g1(16,67)=0.25-params(32)/4;
  g1(16,68)=(-(params(34)/4));
  g1(16,72)=(-(params(33)/4));
  g1(17,42)=(-T800);
  g1(17,64)=1;
  g1(18,63)=1;
  g1(18,64)=(-((-(1+y(71)))/(y(64)*y(64))));
  g1(18,71)=(-(1/y(64)));
  g1(19,1)=(-(y(16)*y(17)));
  g1(19,14)=1-T176;
  g1(19,15)=(-(y(14)*T175*(T170*params(15)*params(16)*T620+params(15)*params(16)*T165*getPowerDeriv(y(15),params(17)*(-params(13)),1))));
  g1(19,16)=(-(y(1)*y(17)));
  g1(19,17)=(-(y(1)*y(16)));
  g1(19,42)=(-(y(14)*params(15)*params(16)*T165*T170*T803));
  g1(20,1)=(-y(16));
  g1(20,15)=(-(y(22)*T190*(T187*params(15)*params(16)*T629+params(15)*params(16)*T183*T631)));
  g1(20,16)=(-y(1));
  g1(20,22)=1-params(15)*params(16)*T183*T187*T190;
  g1(20,42)=(-(y(22)*params(15)*params(16)*T183*T187*T808));
  g1(21,14)=(-(params(38)/y(22)));
  g1(21,22)=(-((-(params(38)*y(14)))/(y(22)*y(22))));
  g1(21,23)=1;
  g1(22,15)=(-(T187*params(16)*T190*T629+T183*params(16)*T190*T631));
  g1(22,23)=(-((1-params(16))*getPowerDeriv(y(23),1-params(17),1)));
  g1(22,42)=(-(T183*T187*params(16)*T808));
  g1(23,17)=1;
  g1(23,24)=(-(1/y(26)));
  g1(23,26)=(-((-y(24))/(y(26)*y(26))));
  g1(24,15)=(-(T219*(T216+y(15)*getPowerDeriv(y(15),(-params(8)),1))));
  g1(24,19)=1;
  g1(24,42)=(-(y(15)*T216*T800*getPowerDeriv(T150,params(8)-1,1)));
  g1(25,19)=(-(T222*params(10)*getPowerDeriv(y(19),(-1)/(1-params(9)),1)));
  g1(25,20)=(-((1-params(10))*params(9)/y(21)*T708));
  g1(25,21)=(-((1-params(10))*T708*(-(params(9)*y(20)))/(y(21)*y(21))));
  g1(25,24)=T733-T233*params(10)*T733;
  g1(26,4)=(-(T240*params(7)*getPowerDeriv(y(4),1+params(27),1)));
  g1(26,19)=(-(y(20)*params(15)*params(10)*getPowerDeriv(y(19),T38,1)));
  g1(26,20)=1-T244;
  g1(26,24)=(-(T239*getPowerDeriv(y(24),T38,1)));
  g1(27,4)=(-(y(16)*(1-y(11))*T252));
  g1(27,11)=(-(T252*y(4)*(-y(16))));
  g1(27,16)=(-(T252*y(4)*(1-y(11))));
  g1(27,19)=(-(y(21)*params(15)*params(10)*getPowerDeriv(y(19),1/(params(9)-1),1)));
  g1(27,21)=1-T256;
  g1(27,24)=(-(y(4)*y(16)*(1-y(11))*getPowerDeriv(y(24),T47,1)));
  g1(28,1)=1;
  g1(28,3)=(-1);
  g1(28,25)=(-1);
  g1(29,1)=1;
  g1(29,2)=(-((-(y(26)*y(4)))/(y(2)*y(2))));
  g1(29,4)=(-(y(26)/y(2)));
  g1(29,26)=(-(y(4)/y(2)));
  g1(30,2)=1-T276;
  g1(30,15)=(-(y(2)*(T275*T175*params(16)*T620+T175*params(16)*T165*getPowerDeriv(y(15),params(13)*(-params(17)),1))));
  g1(30,23)=(-((1-params(16))*getPowerDeriv(y(23),(-params(17)),1)));
  g1(30,42)=(-(y(2)*T275*params(16)*T165*T803));
  g1(31,15)=(-((1+y(18))*T657));
  g1(31,18)=(-T281);
  g1(31,30)=(-((1+y(18))*params(15)*T280));
  g1(32,3)=(-((1+y(18))*params(42)*getPowerDeriv(y(3),params(26),1)/y(18)*T550));
  g1(32,6)=1;
  g1(32,18)=(-(T550*(y(18)*T287-(1+y(18))*T287)/(y(18)*y(18))));
  g1(33,7)=(-T281);
  g1(33,15)=(-((1+y(7))*T657));
  g1(33,30)=(-((1+y(7))*params(15)*T280));
  g1(34,5)=1-(1-params(4))*T281;
  g1(34,15)=(-((1+(1-params(4))*y(5))*T657));
  g1(34,30)=(-((1+(1-params(4))*y(5))*params(15)*T280));
  g1(35,3)=(-(getPowerDeriv(y(3),(-params(26)),1)));
  g1(35,16)=1;
  g1(36,9)=1-(1-params(4))/y(15);
  g1(36,10)=(-1);
  g1(36,15)=(-((-((1-params(4))*y(9)))/(y(15)*y(15))));
  g1(36,27)=(-1);
  g1(37,7)=y(10);
  g1(37,8)=y(9)*(1-params(4))/y(15)-(y(9)-y(27));
  g1(37,9)=(1-params(4))*y(8)/y(15)-y(8);
  g1(37,10)=y(7);
  g1(37,15)=y(9)*(-((1-params(4))*y(8)))/(y(15)*y(15));
  g1(37,27)=y(8);
  g1(38,4)=y(24)*y(11);
  g1(38,6)=1-1/y(15);
  g1(38,8)=(-(y(9)*1/y(15)));
  g1(38,9)=(-((params(4)+y(8))/y(15)));
  g1(38,10)=1;
  g1(38,11)=y(24)*y(4);
  g1(38,15)=(-((-y(6))/(y(15)*y(15))))-y(9)*(-(params(4)+y(8)))/(y(15)*y(15));
  g1(38,24)=y(4)*y(11);
  g1(38,25)=(-1);
  g1(39,38)=1-params(32);
  g1(39,39)=(-params(33));
  g1(40,31)=(-((1-params(56))*params(58)));
  g1(40,32)=0.25-params(56)/4;
  g1(40,34)=(-((1-params(56))*params(57)*0.25));
  g1(40,42)=(-((1-params(56))*(1-params(57))));
  g1(40,43)=(-1);
  g1(40,68)=(-((1-params(56))*(-params(58))));
  g1(41,42)=1-params(60);
  g1(42,43)=1-params(59);
  g1(43,26)=1/params(44)-exp(x(1))*1/params(44)*getPowerDeriv(y(26)/params(44),params(54),1);
  g1(44,25)=1/params(45)-exp(x(2)/100)*1/params(45)*getPowerDeriv(y(25)/params(45),params(55),1);
  g1(45,27)=1-params(48);
  g1(46,30)=1/y(30)-params(67)*1/y(30);
  g1(47,15)=(-(4*100*1/params(19)/(y(15)/params(19))));
  g1(47,34)=1;
  g1(48,18)=(-400);
  g1(48,32)=1;
  g1(49,7)=(-400);
  g1(49,33)=1;
  g1(50,8)=(-400);
  g1(50,41)=1;
  g1(51,1)=(-(100*1/params(35)/(y(1)/params(35))));
  g1(51,31)=1;
  g1(52,65)=(-(100*1/params(35)/(y(65)/params(35))));
  g1(52,68)=1;
  g1(53,3)=(-(100*1/params(2)/(y(3)/params(2))));
  g1(53,37)=1;
  g1(54,24)=(-(100*1/params(43)/(y(24)/params(43))));
  g1(54,36)=1;
  g1(55,4)=(-(100*1/params(36)/(y(4)/params(36))));
  g1(55,35)=1;
  g1(56,11)=(-100);
  g1(56,38)=1;
  g1(57,57)=(-100);
  g1(57,67)=1;
  g1(58,9)=(-(100*1/params(47)/(y(9)/params(47))));
  g1(58,39)=1;
  g1(59,62)=(-(100*1/params(47)/(y(62)/params(47))));
  g1(59,72)=1;
  g1(60,10)=(-(100*1/params(21)/(y(10)/params(21))));
  g1(60,40)=1;
  g1(61,6)=(-(100*1/params(65)/(y(6)/params(65))));
  g1(61,50)=1;
  g1(62,42)=(-4);
  g1(62,51)=1;
  g1(63,28)=1;
  g1(63,39)=(-1);
  g1(63,41)=(-1);
  g1(64,12)=1;
  g1(64,35)=(-1);
  g1(64,36)=(-1);
  g1(64,38)=(-1);
  g1(65,29)=1;
  g1(65,32)=(-1);
  g1(65,34)=1;
  g1(66,5)=(-(100*1/params(68)/(y(5)/params(68))));
  g1(66,13)=1;
  g1(67,42)=(-((1-params(56))*params(63)*(1-params(57))));
  g1(67,43)=(-params(63));
  g1(67,44)=1-(params(60)-(1-params(56))*params(63)*(1-params(57)));
  g1(67,47)=params(63);
  g1(68,42)=(-((1-params(57))*(1-params(56))*params(64)));
  g1(68,43)=(-params(64));
  g1(68,44)=(-((1-params(57))*(1-params(56))*(-params(64))));
  g1(68,47)=1-(params(59)-params(64));
  g1(69,42)=(-((1-params(56))*params(63)*(1-params(57))*T521));
  g1(69,43)=(-(params(63)*T521));
  g1(69,44)=(-((params(60)-(1-params(56))*params(63)*(1-params(57)))*T521));
  g1(69,45)=1;
  g1(69,47)=(-(T521*(-params(63))));
  g1(70,42)=(-((1-params(57))*(1-params(56))*params(64)*T525));
  g1(70,43)=(-(params(64)*T525));
  g1(70,44)=(-((1-params(57))*(1-params(56))*(-params(64))*T525));
  g1(70,46)=1;
  g1(70,47)=(-((params(59)-params(64))*T525));
  g1(71,44)=1;
  g1(71,45)=(-1);
  g1(71,48)=1;
  g1(72,46)=(-1);
  g1(72,47)=1;
  g1(72,49)=1;
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],72,5184);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],72,373248);
end
end
end
end
