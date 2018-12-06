function [residual, g1, g2, g3] = US_OW98_static(y, x, params)
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

residual = zeros( 86, 1);

%
% Model equations
%

lhs =y(36);
rhs =y(3)-params(41)*100;
residual(1)= lhs-rhs;
lhs =y(37);
rhs =0.25*(y(2)+y(2)+y(2)+y(2))-100*params(40);
residual(2)= lhs-rhs;
lhs =y(38);
rhs =y(2)-100*params(40);
residual(3)= lhs-rhs;
lhs =y(39);
rhs =y(1);
residual(4)= lhs-rhs;
lhs =y(40);
rhs =y(1);
residual(5)= lhs-rhs;
lhs =y(41);
rhs =y(35);
residual(6)= lhs-rhs;
lhs =y(36);
rhs =params(32)*x(6)+y(40)*params(31)+y(40)*params(30)+y(40)*params(29)+y(40)*params(28)+y(40)*params(27)+y(40)*params(26)+y(40)*params(25)+y(40)*params(24)+y(40)*params(23)+y(39)*params(22)+y(39)*params(21)+y(39)*params(20)+y(39)*params(19)+y(39)*params(18)+y(39)*params(17)+y(39)*params(16)+y(39)*params(15)+y(39)*params(14)+y(38)*params(13)+y(38)*params(12)+y(38)*params(11)+y(38)*params(10)+y(38)*params(6)+y(38)*params(5)+y(36)*params(1)+y(36)*params(2)+y(36)*params(3)+y(36)*params(4)+y(38)*params(7)+y(38)*params(8)+y(38)*params(9);
residual(7)= lhs-rhs;
lhs =y(41);
rhs =params(34)*x(7);
residual(8)= lhs-rhs;
residual(9) = y(4);
residual(10) = y(22);
lhs =y(18);
rhs =y(3)-y(2);
residual(11)= lhs-rhs;
lhs =y(3)-y(2);
rhs =y(19);
residual(12)= lhs-rhs;
lhs =y(3)-y(2);
rhs =y(20);
residual(13)= lhs-rhs;
lhs =y(3)-y(2);
rhs =y(21);
residual(14)= lhs-rhs;
lhs =y(5);
rhs =y(6)-y(27);
residual(15)= lhs-rhs;
residual(16) = y(2);
lhs =y(1);
rhs =y(9)+y(10)+y(11)+y(12)+y(13)-1;
residual(17)= lhs-rhs;
lhs =y(7);
rhs =(y(3)+y(3)+y(3)+y(3)+y(3)+y(3)+y(3)+y(3))/8;
residual(18)= lhs-rhs;
lhs =y(8);
rhs =y(7);
residual(19)= lhs-rhs;
lhs =y(9);
rhs =0.229884093+y(9)*0.665229981+0.286404154*y(14)-y(8)*0.102064840+x(1);
residual(20)= lhs-rhs;
lhs =y(10);
rhs =0.001837149+y(10)*0.987517671+0.171053677*y(29)-0.168815275*y(30)+y(1)*0.133783338-y(1)*0.050027010-0.128116183*y(33)-y(8)*0.032573147+x(2);
residual(21)= lhs-rhs;
lhs =y(11);
rhs =0.001874640+y(11)*0.324042437+0.032234045*y(31)+0.168077466*y(32)+y(1)*0.115940167+y(1)*0.186708319-y(33)*0.285688047+x(3);
residual(22)= lhs-rhs;
lhs =y(12);
rhs =y(35)+0.0033254101+y(12)*0.9821910468;
residual(23)= lhs-rhs;
lhs =y(13);
rhs =params(38)+x(4);
residual(24)= lhs-rhs;
lhs =y(14);
rhs =0.09999999999999998*(y(1)+y(1)*0.9+y(1)*0.8100000000000001+y(1)*0.7290000000000001+y(1)*0.6561000000000001+y(1)*0.5904900000000002+y(1)*0.5314410000000002+y(1)*0.4782969000000001+y(1)*0.4304672100000002)/0.6125795109999999;
residual(25)= lhs-rhs;
lhs =y(15)-y(6);
rhs =x(5)+0.37045*y(16)+y(16)*0.29015+y(16)*0.20985+y(16)*0.12955+0.0055*(y(1)*0.37045+y(1)*0.29015+y(1)*0.20985+y(1)*0.12955);
residual(26)= lhs-rhs;
lhs =y(6);
rhs =y(15)*0.37045+y(15)*0.29015+0.20985*y(23)+0.12955*y(24);
residual(27)= lhs-rhs;
lhs =y(16);
rhs =(y(15)-y(6))*0.37045+(y(15)-y(6))*0.29015+0.20985*(y(23)-y(25))+0.12955*(y(24)-y(26));
residual(28)= lhs-rhs;
lhs =y(17);
rhs =params(40);
residual(29)= lhs-rhs;
lhs =y(23);
rhs =y(15);
residual(30)= lhs-rhs;
lhs =y(24);
rhs =y(23);
residual(31)= lhs-rhs;
lhs =y(25);
rhs =y(6);
residual(32)= lhs-rhs;
lhs =y(26);
rhs =y(25);
residual(33)= lhs-rhs;
lhs =y(27);
rhs =y(26);
residual(34)= lhs-rhs;
lhs =y(28);
rhs =y(3);
residual(35)= lhs-rhs;
lhs =y(29);
rhs =y(10);
residual(36)= lhs-rhs;
lhs =y(30);
rhs =y(29);
residual(37)= lhs-rhs;
lhs =y(31);
rhs =y(11);
residual(38)= lhs-rhs;
lhs =y(32);
rhs =y(31);
residual(39)= lhs-rhs;
lhs =y(33);
rhs =y(1);
residual(40)= lhs-rhs;
lhs =y(34);
rhs =y(33);
residual(41)= lhs-rhs;
lhs =y(42);
rhs =y(38);
residual(42)= lhs-rhs;
lhs =y(43);
rhs =y(38);
residual(43)= lhs-rhs;
lhs =y(44);
rhs =y(38);
residual(44)= lhs-rhs;
lhs =y(45);
rhs =y(39);
residual(45)= lhs-rhs;
lhs =y(46);
rhs =y(39);
residual(46)= lhs-rhs;
lhs =y(47);
rhs =y(39);
residual(47)= lhs-rhs;
lhs =y(48);
rhs =y(40);
residual(48)= lhs-rhs;
lhs =y(49);
rhs =y(40);
residual(49)= lhs-rhs;
lhs =y(50);
rhs =y(40);
residual(50)= lhs-rhs;
lhs =y(51);
rhs =y(3);
residual(51)= lhs-rhs;
lhs =y(52);
rhs =y(3);
residual(52)= lhs-rhs;
lhs =y(53);
rhs =y(3);
residual(53)= lhs-rhs;
lhs =y(54);
rhs =y(3);
residual(54)= lhs-rhs;
lhs =y(55);
rhs =y(3);
residual(55)= lhs-rhs;
lhs =y(56);
rhs =y(3);
residual(56)= lhs-rhs;
lhs =y(57);
rhs =y(6);
residual(57)= lhs-rhs;
lhs =y(58);
rhs =y(6);
residual(58)= lhs-rhs;
lhs =y(59);
rhs =y(6);
residual(59)= lhs-rhs;
lhs =y(60);
rhs =y(6);
residual(60)= lhs-rhs;
lhs =y(61);
rhs =y(6);
residual(61)= lhs-rhs;
lhs =y(62);
rhs =y(6);
residual(62)= lhs-rhs;
lhs =y(63);
rhs =y(6);
residual(63)= lhs-rhs;
lhs =y(64);
rhs =y(1);
residual(64)= lhs-rhs;
lhs =y(65);
rhs =y(1);
residual(65)= lhs-rhs;
lhs =y(66);
rhs =y(1);
residual(66)= lhs-rhs;
lhs =y(67);
rhs =y(1);
residual(67)= lhs-rhs;
lhs =y(68);
rhs =y(1);
residual(68)= lhs-rhs;
lhs =y(69);
rhs =y(1);
residual(69)= lhs-rhs;
lhs =y(70);
rhs =y(1);
residual(70)= lhs-rhs;
lhs =y(71);
rhs =y(16);
residual(71)= lhs-rhs;
lhs =y(72);
rhs =y(16);
residual(72)= lhs-rhs;
lhs =y(73);
rhs =y(2);
residual(73)= lhs-rhs;
lhs =y(74);
rhs =y(2);
residual(74)= lhs-rhs;
lhs =y(75);
rhs =y(40);
residual(75)= lhs-rhs;
lhs =y(76);
rhs =y(40);
residual(76)= lhs-rhs;
lhs =y(77);
rhs =y(40);
residual(77)= lhs-rhs;
lhs =y(78);
rhs =y(39);
residual(78)= lhs-rhs;
lhs =y(79);
rhs =y(39);
residual(79)= lhs-rhs;
lhs =y(80);
rhs =y(39);
residual(80)= lhs-rhs;
lhs =y(81);
rhs =y(36);
residual(81)= lhs-rhs;
lhs =y(82);
rhs =y(36);
residual(82)= lhs-rhs;
lhs =y(83);
rhs =y(36);
residual(83)= lhs-rhs;
lhs =y(84);
rhs =y(38);
residual(84)= lhs-rhs;
lhs =y(85);
rhs =y(38);
residual(85)= lhs-rhs;
lhs =y(86);
rhs =y(38);
residual(86)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(86, 86);

  %
  % Jacobian matrix
  %

T3 = (-1);
  g1(1,3)=T3;
  g1(1,36)=1;
  g1(2,2)=T3;
  g1(2,37)=1;
  g1(3,2)=T3;
  g1(3,38)=1;
  g1(4,1)=T3;
  g1(4,39)=1;
  g1(5,1)=T3;
  g1(5,40)=1;
  g1(6,35)=T3;
  g1(6,41)=1;
  g1(7,36)=1-(params(4)+params(3)+params(1)+params(2));
  g1(7,38)=(-(params(13)+params(12)+params(11)+params(10)+params(9)+params(8)+params(7)+params(6)+params(5)));
  g1(7,39)=(-(params(22)+params(21)+params(20)+params(19)+params(18)+params(17)+params(16)+params(15)+params(14)));
  g1(7,40)=(-(params(31)+params(30)+params(29)+params(28)+params(27)+params(26)+params(25)+params(24)+params(23)));
  g1(8,41)=1;
  g1(9,4)=1;
  g1(10,22)=1;
  g1(11,2)=1;
  g1(11,3)=T3;
  g1(11,18)=1;
  g1(12,2)=T3;
  g1(12,3)=1;
  g1(12,19)=T3;
  g1(13,2)=T3;
  g1(13,3)=1;
  g1(13,20)=T3;
  g1(14,2)=T3;
  g1(14,3)=1;
  g1(14,21)=T3;
  g1(15,5)=1;
  g1(15,6)=T3;
  g1(15,27)=1;
  g1(16,2)=1;
  g1(17,1)=1;
  g1(17,9)=T3;
  g1(17,10)=T3;
  g1(17,11)=T3;
  g1(17,12)=T3;
  g1(17,13)=T3;
  g1(18,3)=T3;
  g1(18,7)=1;
  g1(19,7)=T3;
  g1(19,8)=1;
  g1(20,8)=0.102064840;
  g1(20,9)=0.334770019;
  g1(20,14)=(-0.286404154);
  g1(21,1)=(-0.083756328);
  g1(21,8)=0.032573147;
  g1(21,10)=0.01248232900000001;
  g1(21,29)=(-0.171053677);
  g1(21,30)=0.168815275;
  g1(21,33)=0.128116183;
  g1(22,1)=(-0.302648486);
  g1(22,11)=0.675957563;
  g1(22,31)=(-0.032234045);
  g1(22,32)=(-0.168077466);
  g1(22,33)=0.285688047;
  g1(23,12)=0.01780895319999998;
  g1(23,35)=T3;
  g1(24,13)=1;
  g1(25,1)=T3;
  g1(25,14)=1;
  g1(26,1)=(-0.0055);
  g1(26,6)=T3;
  g1(26,15)=1;
  g1(26,16)=T3;
  g1(27,6)=1;
  g1(27,15)=(-0.6606000000000001);
  g1(27,23)=(-0.20985);
  g1(27,24)=(-0.12955);
  g1(28,6)=0.6606000000000001;
  g1(28,15)=(-0.6606000000000001);
  g1(28,16)=1;
  g1(28,23)=(-0.20985);
  g1(28,24)=(-0.12955);
  g1(28,25)=0.20985;
  g1(28,26)=0.12955;
  g1(29,17)=1;
  g1(30,15)=T3;
  g1(30,23)=1;
  g1(31,23)=T3;
  g1(31,24)=1;
  g1(32,6)=T3;
  g1(32,25)=1;
  g1(33,25)=T3;
  g1(33,26)=1;
  g1(34,26)=T3;
  g1(34,27)=1;
  g1(35,3)=T3;
  g1(35,28)=1;
  g1(36,10)=T3;
  g1(36,29)=1;
  g1(37,29)=T3;
  g1(37,30)=1;
  g1(38,11)=T3;
  g1(38,31)=1;
  g1(39,31)=T3;
  g1(39,32)=1;
  g1(40,1)=T3;
  g1(40,33)=1;
  g1(41,33)=T3;
  g1(41,34)=1;
  g1(42,38)=T3;
  g1(42,42)=1;
  g1(43,38)=T3;
  g1(43,43)=1;
  g1(44,38)=T3;
  g1(44,44)=1;
  g1(45,39)=T3;
  g1(45,45)=1;
  g1(46,39)=T3;
  g1(46,46)=1;
  g1(47,39)=T3;
  g1(47,47)=1;
  g1(48,40)=T3;
  g1(48,48)=1;
  g1(49,40)=T3;
  g1(49,49)=1;
  g1(50,40)=T3;
  g1(50,50)=1;
  g1(51,3)=T3;
  g1(51,51)=1;
  g1(52,3)=T3;
  g1(52,52)=1;
  g1(53,3)=T3;
  g1(53,53)=1;
  g1(54,3)=T3;
  g1(54,54)=1;
  g1(55,3)=T3;
  g1(55,55)=1;
  g1(56,3)=T3;
  g1(56,56)=1;
  g1(57,6)=T3;
  g1(57,57)=1;
  g1(58,6)=T3;
  g1(58,58)=1;
  g1(59,6)=T3;
  g1(59,59)=1;
  g1(60,6)=T3;
  g1(60,60)=1;
  g1(61,6)=T3;
  g1(61,61)=1;
  g1(62,6)=T3;
  g1(62,62)=1;
  g1(63,6)=T3;
  g1(63,63)=1;
  g1(64,1)=T3;
  g1(64,64)=1;
  g1(65,1)=T3;
  g1(65,65)=1;
  g1(66,1)=T3;
  g1(66,66)=1;
  g1(67,1)=T3;
  g1(67,67)=1;
  g1(68,1)=T3;
  g1(68,68)=1;
  g1(69,1)=T3;
  g1(69,69)=1;
  g1(70,1)=T3;
  g1(70,70)=1;
  g1(71,16)=T3;
  g1(71,71)=1;
  g1(72,16)=T3;
  g1(72,72)=1;
  g1(73,2)=T3;
  g1(73,73)=1;
  g1(74,2)=T3;
  g1(74,74)=1;
  g1(75,40)=T3;
  g1(75,75)=1;
  g1(76,40)=T3;
  g1(76,76)=1;
  g1(77,40)=T3;
  g1(77,77)=1;
  g1(78,39)=T3;
  g1(78,78)=1;
  g1(79,39)=T3;
  g1(79,79)=1;
  g1(80,39)=T3;
  g1(80,80)=1;
  g1(81,36)=T3;
  g1(81,81)=1;
  g1(82,36)=T3;
  g1(82,82)=1;
  g1(83,36)=T3;
  g1(83,83)=1;
  g1(84,38)=T3;
  g1(84,84)=1;
  g1(85,38)=T3;
  g1(85,85)=1;
  g1(86,38)=T3;
  g1(86,86)=1;
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],86,7396);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],86,636056);
end
end
end
end
