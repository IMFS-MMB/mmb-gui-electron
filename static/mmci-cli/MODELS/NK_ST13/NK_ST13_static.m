function [residual, g1, g2, g3] = NK_ST13_static(y, x, params)
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

residual = zeros( 77, 1);

%
% Model equations
%

T201 = y(11)^params(38);
T202 = y(32)*T201;
T205 = y(9)^(1-params(38));
T285 = sqrt(y(23)*y(14)*y(31)/(y(22)*(y(17)-1)));
T288 = params(42)/2;
T294 = params(41)/2*(y(23)-1)^2;
T359 = y(39)^params(38);
T362 = y(37)^(1-params(38));
T412 = sqrt(y(31)*y(42)/(y(50)*(y(45)-1)));
lhs =y(1);
rhs =log(y(17)/params(63))*400;
residual(1)= lhs-rhs;
lhs =y(3);
rhs =400*log(y(23)/params(69));
residual(2)= lhs-rhs;
lhs =y(2);
rhs =0.25*(y(3)+y(3)+y(3)+y(3));
residual(3)= lhs-rhs;
lhs =y(5);
rhs =log(y(8)/params(55))*100;
residual(4)= lhs-rhs;
lhs =y(4);
rhs =100*log(y(8)/y(36));
residual(5)= lhs-rhs;
lhs =y(1);
rhs =params(32)*x(4)+y(5)*params(31)+y(5)*params(30)+y(5)*params(29)+y(5)*params(28)+y(5)*params(27)+y(5)*params(26)+y(5)*params(25)+y(5)*params(24)+y(5)*params(23)+y(4)*params(22)+y(4)*params(21)+y(4)*params(20)+y(4)*params(19)+y(4)*params(18)+y(4)*params(17)+y(4)*params(16)+y(4)*params(15)+y(4)*params(14)+y(3)*params(13)+y(3)*params(12)+y(3)*params(11)+y(3)*params(10)+y(3)*params(6)+y(3)*params(5)+y(1)*params(1)+y(1)*params(2)+y(1)*params(3)+y(1)*params(4)+y(3)*params(7)+y(3)*params(8)+y(3)*params(9);
residual(6)= lhs-rhs;
lhs =y(30)*y(6);
rhs =y(14);
residual(7)= lhs-rhs;
residual(8) = 1/y(6)-y(20)-y(30)*y(21);
lhs =y(20);
rhs =params(34)/y(10);
residual(9)= lhs-rhs;
lhs =y(20);
rhs =y(20)*y(17)*params(37)/y(23);
residual(10)= lhs-rhs;
lhs =y(20)*params(37)*(y(17)-y(18))/y(23)+params(36)*(y(14)-y(14)/y(23));
rhs =y(21)+(y(14)-y(14)/y(23))*params(37)*params(36)/y(23);
residual(11)= lhs-rhs;
lhs =y(8);
rhs =T202*T205;
residual(12)= lhs-rhs;
lhs =y(32);
rhs =exp(y(33));
residual(13)= lhs-rhs;
lhs =y(11);
rhs =y(7)+y(11)*(1-params(43));
residual(14)= lhs-rhs;
lhs =y(25);
rhs =y(8)*params(38)/y(11);
residual(15)= lhs-rhs;
lhs =y(26);
rhs =y(8)*(1-params(38))/y(9);
residual(16)= lhs-rhs;
lhs =y(10);
rhs =y(23)*y(26)*y(24)/(y(22)*y(19));
residual(17)= lhs-rhs;
lhs =y(19)/y(23)+params(42)*y(12);
rhs =y(25)*y(24)+y(12)*y(22)*params(42)+(1-params(43))*y(22)*y(19)/y(23);
residual(18)= lhs-rhs;
lhs =y(23)*y(20)*(y(23)-1);
rhs =y(20)/params(41)*(1-params(52)+y(24)*params(52))+y(8)*y(23)*y(20)*params(37)*(y(23)-1)/y(8);
residual(19)= lhs-rhs;
lhs =y(16);
rhs =y(7)+y(10)*y(9);
residual(20)= lhs-rhs;
lhs =y(16);
rhs =y(14)+y(15);
residual(21)= lhs-rhs;
lhs =y(22)*(y(19)-y(17))/y(23);
rhs =params(44);
residual(22)= lhs-rhs;
lhs =(y(17)-y(18))*y(22)/y(23);
rhs =y(31)/y(13);
residual(23)= lhs-rhs;
lhs =y(13);
rhs =T285;
residual(24)= lhs-rhs;
lhs =y(8);
rhs =y(6)+y(7)+T288*y(12)^2+y(8)*T294+y(14)*y(31)/y(13)+y(16)*params(44);
residual(25)= lhs-rhs;
lhs =y(22);
rhs =y(20)*params(37)/y(20);
residual(26)= lhs-rhs;
residual(27) = y(12);
lhs =y(28);
rhs =y(19)-y(17);
residual(28)= lhs-rhs;
lhs =y(29);
rhs =y(17)-y(18);
residual(29)= lhs-rhs;
lhs =y(27);
rhs =y(14)*y(31)/y(13)+y(16)*params(44);
residual(30)= lhs-rhs;
lhs =y(30);
rhs =y(30)*params(35)+(1-params(35))*params(76)+x(1);
residual(31)= lhs-rhs;
lhs =y(33);
rhs =y(33)*params(40)+x(2);
residual(32)= lhs-rhs;
lhs =y(31);
rhs =(1-params(51))*params(77)+y(31)*params(51)+x(3);
residual(33)= lhs-rhs;
lhs =y(30)*y(34);
rhs =y(42);
residual(34)= lhs-rhs;
residual(35) = 1/y(34)-y(48)-y(30)*y(49);
lhs =y(48);
rhs =params(34)/y(38);
residual(36)= lhs-rhs;
lhs =y(48);
rhs =y(48)*params(37)*y(45);
residual(37)= lhs-rhs;
lhs =params(37)*y(48)*(y(45)-y(46));
rhs =y(49);
residual(38)= lhs-rhs;
lhs =y(36);
rhs =y(32)*T359*T362;
residual(39)= lhs-rhs;
lhs =y(39);
rhs =y(35)+(1-params(43))*y(39);
residual(40)= lhs-rhs;
lhs =y(52);
rhs =y(36)*params(38)/y(39);
residual(41)= lhs-rhs;
lhs =y(53);
rhs =y(36)*(1-params(38))/y(37);
residual(42)= lhs-rhs;
lhs =y(38);
rhs =y(53)*y(51)/(y(50)*y(47));
residual(43)= lhs-rhs;
lhs =y(47)+params(42)*y(40);
rhs =y(52)*y(51)+y(40)*params(42)*y(50)+(1-params(43))*y(50)*y(47);
residual(44)= lhs-rhs;
lhs =y(44);
rhs =y(35)+y(38)*y(37);
residual(45)= lhs-rhs;
lhs =y(44);
rhs =y(42)+y(43);
residual(46)= lhs-rhs;
lhs =y(50)*(y(47)-y(45));
rhs =params(44);
residual(47)= lhs-rhs;
lhs =(y(45)-y(46))*y(50);
rhs =y(31)/y(41);
residual(48)= lhs-rhs;
lhs =y(41);
rhs =T412;
residual(49)= lhs-rhs;
lhs =y(36);
rhs =y(34)+y(35)+T288*y(40)^2+y(31)*y(42)/y(41)+params(44)*y(44);
residual(50)= lhs-rhs;
lhs =y(50);
rhs =params(37)*y(48)/y(48);
residual(51)= lhs-rhs;
residual(52) = y(40);
lhs =y(55);
rhs =y(47)-y(45);
residual(53)= lhs-rhs;
lhs =y(56);
rhs =y(45)-y(46);
residual(54)= lhs-rhs;
lhs =y(54);
rhs =y(31)*y(42)/y(41)+params(44)*y(44);
residual(55)= lhs-rhs;
lhs =y(51);
rhs =params(70);
residual(56)= lhs-rhs;
lhs =y(57);
rhs =y(3);
residual(57)= lhs-rhs;
lhs =y(58);
rhs =y(3);
residual(58)= lhs-rhs;
lhs =y(59);
rhs =y(3);
residual(59)= lhs-rhs;
lhs =y(60);
rhs =y(4);
residual(60)= lhs-rhs;
lhs =y(61);
rhs =y(4);
residual(61)= lhs-rhs;
lhs =y(62);
rhs =y(4);
residual(62)= lhs-rhs;
lhs =y(63);
rhs =y(5);
residual(63)= lhs-rhs;
lhs =y(64);
rhs =y(5);
residual(64)= lhs-rhs;
lhs =y(65);
rhs =y(5);
residual(65)= lhs-rhs;
lhs =y(66);
rhs =y(3);
residual(66)= lhs-rhs;
lhs =y(67);
rhs =y(3);
residual(67)= lhs-rhs;
lhs =y(68);
rhs =y(5);
residual(68)= lhs-rhs;
lhs =y(69);
rhs =y(5);
residual(69)= lhs-rhs;
lhs =y(70);
rhs =y(5);
residual(70)= lhs-rhs;
lhs =y(71);
rhs =y(4);
residual(71)= lhs-rhs;
lhs =y(72);
rhs =y(4);
residual(72)= lhs-rhs;
lhs =y(73);
rhs =y(4);
residual(73)= lhs-rhs;
lhs =y(74);
rhs =y(1);
residual(74)= lhs-rhs;
lhs =y(75);
rhs =y(1);
residual(75)= lhs-rhs;
lhs =y(76);
rhs =y(1);
residual(76)= lhs-rhs;
lhs =y(77);
rhs =y(3);
residual(77)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(77, 77);

  %
  % Jacobian matrix
  %

  g1(1,1)=1;
  g1(1,17)=(-(400*1/params(63)/(y(17)/params(63))));
  g1(2,3)=1;
  g1(2,23)=(-(400*1/params(69)/(y(23)/params(69))));
  g1(3,2)=1;
  g1(3,3)=(-1);
  g1(4,5)=1;
  g1(4,8)=(-(100*1/params(55)/(y(8)/params(55))));
  g1(5,4)=1;
  g1(5,8)=(-(100*1/y(36)/(y(8)/y(36))));
  g1(5,36)=(-(100*(-y(8))/(y(36)*y(36))/(y(8)/y(36))));
  g1(6,1)=1-(params(4)+params(3)+params(1)+params(2));
  g1(6,3)=(-(params(13)+params(12)+params(11)+params(10)+params(9)+params(8)+params(7)+params(6)+params(5)));
  g1(6,4)=(-(params(22)+params(21)+params(20)+params(19)+params(18)+params(17)+params(16)+params(15)+params(14)));
  g1(6,5)=(-(params(31)+params(30)+params(29)+params(28)+params(27)+params(26)+params(25)+params(24)+params(23)));
  g1(7,6)=y(30);
  g1(7,14)=(-1);
  g1(7,30)=y(6);
  g1(8,6)=(-1)/(y(6)*y(6));
  g1(8,20)=(-1);
  g1(8,21)=(-y(30));
  g1(8,30)=(-y(21));
  g1(9,10)=(-((-params(34))/(y(10)*y(10))));
  g1(9,20)=1;
  g1(10,17)=(-(y(20)*params(37)/y(23)));
  g1(10,20)=1-y(17)*params(37)/y(23);
  g1(10,23)=(-((-(y(20)*y(17)*params(37)))/(y(23)*y(23))));
  g1(11,14)=params(36)*(1-1/y(23))-params(37)*params(36)/y(23)*(1-1/y(23));
  g1(11,17)=y(20)*params(37)/y(23);
  g1(11,18)=(-(y(20)*params(37)))/y(23);
  g1(11,20)=params(37)*(y(17)-y(18))/y(23);
  g1(11,21)=(-1);
  g1(11,23)=(-(y(20)*params(37)*(y(17)-y(18))))/(y(23)*y(23))+params(36)*(-((-y(14))/(y(23)*y(23))))-(params(37)*params(36)/y(23)*(-((-y(14))/(y(23)*y(23))))+(y(14)-y(14)/y(23))*(-(params(37)*params(36)))/(y(23)*y(23)));
  g1(12,8)=1;
  g1(12,9)=(-(T202*getPowerDeriv(y(9),1-params(38),1)));
  g1(12,11)=(-(T205*y(32)*getPowerDeriv(y(11),params(38),1)));
  g1(12,32)=(-(T201*T205));
  g1(13,32)=1;
  g1(13,33)=(-exp(y(33)));
  g1(14,7)=(-1);
  g1(14,11)=1-(1-params(43));
  g1(15,8)=(-(params(38)/y(11)));
  g1(15,11)=(-((-(y(8)*params(38)))/(y(11)*y(11))));
  g1(15,25)=1;
  g1(16,8)=(-((1-params(38))/y(9)));
  g1(16,9)=(-((-(y(8)*(1-params(38))))/(y(9)*y(9))));
  g1(16,26)=1;
  g1(17,10)=1;
  g1(17,19)=(-((-(y(23)*y(26)*y(24)*y(22)))/(y(22)*y(19)*y(22)*y(19))));
  g1(17,22)=(-((-(y(23)*y(26)*y(24)*y(19)))/(y(22)*y(19)*y(22)*y(19))));
  g1(17,23)=(-(y(26)*y(24)/(y(22)*y(19))));
  g1(17,24)=(-(y(23)*y(26)/(y(22)*y(19))));
  g1(17,26)=(-(y(23)*y(24)/(y(22)*y(19))));
  g1(18,12)=params(42)-y(22)*params(42);
  g1(18,19)=1/y(23)-(1-params(43))*y(22)/y(23);
  g1(18,22)=(-(params(42)*y(12)+(1-params(43))*y(19)/y(23)));
  g1(18,23)=(-y(19))/(y(23)*y(23))-(-((1-params(43))*y(22)*y(19)))/(y(23)*y(23));
  g1(18,24)=(-y(25));
  g1(18,25)=(-y(24));
  g1(19,20)=y(23)*(y(23)-1)-((1-params(52)+y(24)*params(52))*1/params(41)+y(8)*y(23)*params(37)*(y(23)-1)/y(8));
  g1(19,23)=y(20)*(y(23)-1)+y(23)*y(20)-y(8)*(y(20)*params(37)*(y(23)-1)+y(23)*y(20)*params(37))/y(8);
  g1(19,24)=(-(y(20)/params(41)*params(52)));
  g1(20,7)=(-1);
  g1(20,9)=(-y(10));
  g1(20,10)=(-y(9));
  g1(20,16)=1;
  g1(21,14)=(-1);
  g1(21,15)=(-1);
  g1(21,16)=1;
  g1(22,17)=(-y(22))/y(23);
  g1(22,19)=y(22)/y(23);
  g1(22,22)=(y(19)-y(17))/y(23);
  g1(22,23)=(-(y(22)*(y(19)-y(17))))/(y(23)*y(23));
  g1(23,13)=(-((-y(31))/(y(13)*y(13))));
  g1(23,17)=y(22)/y(23);
  g1(23,18)=(-y(22))/y(23);
  g1(23,22)=(y(17)-y(18))/y(23);
  g1(23,23)=(-((y(17)-y(18))*y(22)))/(y(23)*y(23));
  g1(23,31)=(-(1/y(13)));
  g1(24,13)=1;
  g1(24,14)=(-(y(23)*y(31)/(y(22)*(y(17)-1))/(T285+T285)));
  g1(24,17)=(-((-(y(22)*y(23)*y(14)*y(31)))/(y(22)*(y(17)-1)*y(22)*(y(17)-1))/(T285+T285)));
  g1(24,22)=(-((-(y(23)*y(14)*y(31)*(y(17)-1)))/(y(22)*(y(17)-1)*y(22)*(y(17)-1))/(T285+T285)));
  g1(24,23)=(-(y(14)*y(31)/(y(22)*(y(17)-1))/(T285+T285)));
  g1(24,31)=(-(y(23)*y(14)/(y(22)*(y(17)-1))/(T285+T285)));
  g1(25,6)=(-1);
  g1(25,7)=(-1);
  g1(25,8)=1-T294;
  g1(25,12)=(-(T288*2*y(12)));
  g1(25,13)=(-((-(y(14)*y(31)))/(y(13)*y(13))));
  g1(25,14)=(-(y(31)/y(13)));
  g1(25,16)=(-params(44));
  g1(25,23)=(-(y(8)*params(41)/2*2*(y(23)-1)));
  g1(25,31)=(-(y(14)/y(13)));
  g1(26,22)=1;
  g1(27,12)=1;
  g1(28,17)=1;
  g1(28,19)=(-1);
  g1(28,28)=1;
  g1(29,17)=(-1);
  g1(29,18)=1;
  g1(29,29)=1;
  g1(30,13)=(-((-(y(14)*y(31)))/(y(13)*y(13))));
  g1(30,14)=(-(y(31)/y(13)));
  g1(30,16)=(-params(44));
  g1(30,27)=1;
  g1(30,31)=(-(y(14)/y(13)));
  g1(31,30)=1-params(35);
  g1(32,33)=1-params(40);
  g1(33,31)=1-params(51);
  g1(34,30)=y(34);
  g1(34,34)=y(30);
  g1(34,42)=(-1);
  g1(35,30)=(-y(49));
  g1(35,34)=(-1)/(y(34)*y(34));
  g1(35,48)=(-1);
  g1(35,49)=(-y(30));
  g1(36,38)=(-((-params(34))/(y(38)*y(38))));
  g1(36,48)=1;
  g1(37,45)=(-(params(37)*y(48)));
  g1(37,48)=1-params(37)*y(45);
  g1(38,45)=params(37)*y(48);
  g1(38,46)=(-(params(37)*y(48)));
  g1(38,48)=params(37)*(y(45)-y(46));
  g1(38,49)=(-1);
  g1(39,32)=(-(T359*T362));
  g1(39,36)=1;
  g1(39,37)=(-(y(32)*T359*getPowerDeriv(y(37),1-params(38),1)));
  g1(39,39)=(-(T362*y(32)*getPowerDeriv(y(39),params(38),1)));
  g1(40,35)=(-1);
  g1(40,39)=1-(1-params(43));
  g1(41,36)=(-(params(38)/y(39)));
  g1(41,39)=(-((-(y(36)*params(38)))/(y(39)*y(39))));
  g1(41,52)=1;
  g1(42,36)=(-((1-params(38))/y(37)));
  g1(42,37)=(-((-(y(36)*(1-params(38))))/(y(37)*y(37))));
  g1(42,53)=1;
  g1(43,38)=1;
  g1(43,47)=(-((-(y(53)*y(51)*y(50)))/(y(50)*y(47)*y(50)*y(47))));
  g1(43,50)=(-((-(y(53)*y(51)*y(47)))/(y(50)*y(47)*y(50)*y(47))));
  g1(43,51)=(-(y(53)/(y(50)*y(47))));
  g1(43,53)=(-(y(51)/(y(50)*y(47))));
  g1(44,40)=params(42)-params(42)*y(50);
  g1(44,47)=1-(1-params(43))*y(50);
  g1(44,50)=(-(params(42)*y(40)+(1-params(43))*y(47)));
  g1(44,51)=(-y(52));
  g1(44,52)=(-y(51));
  g1(45,35)=(-1);
  g1(45,37)=(-y(38));
  g1(45,38)=(-y(37));
  g1(45,44)=1;
  g1(46,42)=(-1);
  g1(46,43)=(-1);
  g1(46,44)=1;
  g1(47,45)=(-y(50));
  g1(47,47)=y(50);
  g1(47,50)=y(47)-y(45);
  g1(48,31)=(-(1/y(41)));
  g1(48,41)=(-((-y(31))/(y(41)*y(41))));
  g1(48,45)=y(50);
  g1(48,46)=(-y(50));
  g1(48,50)=y(45)-y(46);
  g1(49,31)=(-(y(42)/(y(50)*(y(45)-1))/(T412+T412)));
  g1(49,41)=1;
  g1(49,42)=(-(y(31)/(y(50)*(y(45)-1))/(T412+T412)));
  g1(49,45)=(-((-(y(50)*y(31)*y(42)))/(y(50)*(y(45)-1)*y(50)*(y(45)-1))/(T412+T412)));
  g1(49,50)=(-((-(y(31)*y(42)*(y(45)-1)))/(y(50)*(y(45)-1)*y(50)*(y(45)-1))/(T412+T412)));
  g1(50,31)=(-(y(42)/y(41)));
  g1(50,34)=(-1);
  g1(50,35)=(-1);
  g1(50,36)=1;
  g1(50,40)=(-(T288*2*y(40)));
  g1(50,41)=(-((-(y(31)*y(42)))/(y(41)*y(41))));
  g1(50,42)=(-(y(31)/y(41)));
  g1(50,44)=(-params(44));
  g1(51,50)=1;
  g1(52,40)=1;
  g1(53,45)=1;
  g1(53,47)=(-1);
  g1(53,55)=1;
  g1(54,45)=(-1);
  g1(54,46)=1;
  g1(54,56)=1;
  g1(55,31)=(-(y(42)/y(41)));
  g1(55,41)=(-((-(y(31)*y(42)))/(y(41)*y(41))));
  g1(55,42)=(-(y(31)/y(41)));
  g1(55,44)=(-params(44));
  g1(55,54)=1;
  g1(56,51)=1;
  g1(57,3)=(-1);
  g1(57,57)=1;
  g1(58,3)=(-1);
  g1(58,58)=1;
  g1(59,3)=(-1);
  g1(59,59)=1;
  g1(60,4)=(-1);
  g1(60,60)=1;
  g1(61,4)=(-1);
  g1(61,61)=1;
  g1(62,4)=(-1);
  g1(62,62)=1;
  g1(63,5)=(-1);
  g1(63,63)=1;
  g1(64,5)=(-1);
  g1(64,64)=1;
  g1(65,5)=(-1);
  g1(65,65)=1;
  g1(66,3)=(-1);
  g1(66,66)=1;
  g1(67,3)=(-1);
  g1(67,67)=1;
  g1(68,5)=(-1);
  g1(68,68)=1;
  g1(69,5)=(-1);
  g1(69,69)=1;
  g1(70,5)=(-1);
  g1(70,70)=1;
  g1(71,4)=(-1);
  g1(71,71)=1;
  g1(72,4)=(-1);
  g1(72,72)=1;
  g1(73,4)=(-1);
  g1(73,73)=1;
  g1(74,1)=(-1);
  g1(74,74)=1;
  g1(75,1)=(-1);
  g1(75,75)=1;
  g1(76,1)=(-1);
  g1(76,76)=1;
  g1(77,3)=(-1);
  g1(77,77)=1;
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],77,5929);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],77,456533);
end
end
end
end
