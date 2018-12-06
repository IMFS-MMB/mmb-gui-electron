function [residual, g1, g2, g3] = NK_KRS12_static(y, x, params)
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

residual = zeros( 69, 1);

%
% Model equations
%

T167 = (y(2)-y(2)*params(35))/(1-params(35));
T219 = (y(19)-params(35)*y(19))/(1-params(35));
lhs =y(41);
rhs =y(6)*4;
residual(1)= lhs-rhs;
lhs =y(42);
rhs =y(9)+y(9)+y(9)+y(9);
residual(2)= lhs-rhs;
lhs =y(43);
rhs =4*y(9);
residual(3)= lhs-rhs;
lhs =y(44);
rhs =y(33);
residual(4)= lhs-rhs;
lhs =y(45);
rhs =y(33)-y(34);
residual(5)= lhs-rhs;
lhs =y(41);
rhs =params(32)*x(4)+y(44)*params(31)+y(44)*params(30)+y(44)*params(29)+y(44)*params(28)+y(44)*params(27)+y(44)*params(26)+y(44)*params(25)+y(44)*params(24)+y(44)*params(23)+y(45)*params(22)+y(45)*params(21)+y(45)*params(20)+y(45)*params(19)+y(45)*params(18)+y(45)*params(17)+y(45)*params(16)+y(45)*params(15)+y(45)*params(14)+y(43)*params(13)+y(43)*params(12)+y(43)*params(11)+y(43)*params(10)+y(43)*params(6)+y(43)*params(5)+y(41)*params(1)+y(41)*params(2)+y(41)*params(3)+y(41)*params(4)+y(43)*params(7)+y(43)*params(8)+y(43)*params(9);
residual(6)= lhs-rhs;
lhs =y(1);
rhs =y(13)-y(12);
residual(7)= lhs-rhs;
residual(8) = y(7);
residual(9) = y(8);
residual(10) = y(9);
residual(11) = y(14);
lhs =y(1)-T167;
rhs =y(4);
residual(12)= lhs-rhs;
lhs =(1-params(37)*(1-params(38)))*(y(29)-y(5));
rhs =y(4)-y(4)*params(37)*(1-params(38));
residual(13)= lhs-rhs;
lhs =y(7)*params(35);
rhs =y(7)-(1-params(35))*(y(6)-y(9));
residual(14)= lhs-rhs;
lhs =T167+(params(39)+(params(40)-params(39))*params(41))*y(15)+(params(40)-params(39))*(1-params(41))*y(16);
rhs =y(17);
residual(15)= lhs-rhs;
lhs =T167+y(16)*(params(39)+(params(40)-params(39))*(1-params(41)))+(params(40)-params(39))*params(41)*y(15);
rhs =y(18);
residual(16)= lhs-rhs;
residual(17) = y(20);
lhs =y(1)-T219;
rhs =y(22);
residual(18)= lhs-rhs;
lhs =(1-(1-params(38))*params(43))*(y(29)-y(23));
rhs =y(22)-y(22)*(1-params(38))*params(43);
residual(19)= lhs-rhs;
lhs =params(35)*y(20);
rhs =y(20)-(1-params(35))*(y(26)-y(9));
residual(20)= lhs-rhs;
lhs =T219+(params(39)+(params(40)-params(39))*params(41))*y(24)+(params(40)-params(39))*(1-params(41))*y(25);
rhs =y(17);
residual(21)= lhs-rhs;
lhs =T219+(params(39)+(params(40)-params(39))*(1-params(41)))*y(25)+(params(40)-params(39))*params(41)*y(24);
rhs =y(18);
residual(22)= lhs-rhs;
lhs =y(19)*params(44)+params(45)*(y(1)+y(21))+params(46)*params(47)*(y(26)+y(27)-y(9));
rhs =params(47)*y(27)+params(41)*params(48)*params(49)*(y(17)+y(24))+params(49)*(1-params(41))*params(48)*(y(18)+y(25));
residual(23)= lhs-rhs;
lhs =y(26);
rhs =y(6)+params(50)*(y(27)-y(23)-y(1))-y(30)+y(9)*params(66);
residual(24)= lhs-rhs;
lhs =y(8);
rhs =y(9)*params(42)+y(14)*(1-params(42));
residual(25)= lhs-rhs;
lhs =y(35);
rhs =y(28)+y(31);
residual(26)= lhs-rhs;
lhs =y(36);
rhs =y(32);
residual(27)= lhs-rhs;
lhs =y(9)-y(9)*params(53);
rhs =params(37)*(y(9)-y(9)*params(53))+params(51)*(y(17)-y(28));
residual(28)= lhs-rhs;
lhs =y(14)-y(14)*params(54);
rhs =params(37)*(y(14)-y(14)*params(54))+params(52)*(y(18)-y(1));
residual(29)= lhs-rhs;
lhs =y(35);
rhs =(y(2)*params(55)*params(58)+y(19)*params(44)*(1-params(55)))/(params(55)*params(58)+params(44)*(1-params(55)));
residual(30)= lhs-rhs;
lhs =y(36);
rhs =(y(3)*params(38)*params(55)*params(59)+y(21)*params(38)*(1-params(55))*params(60))/(params(38)*params(55)*params(59)+params(38)*(1-params(55))*params(60));
residual(31)= lhs-rhs;
lhs =y(5);
rhs =(1-params(38))*y(5)+y(3)*params(38);
residual(32)= lhs-rhs;
lhs =y(23);
rhs =(1-params(38))*y(23)+params(38)*y(21);
residual(33)= lhs-rhs;
lhs =y(31);
rhs =(y(15)*params(55)*params(61)+y(24)*params(49)*(1-params(55)))/(params(49)*(1-params(55))+params(42)*params(61));
residual(34)= lhs-rhs;
lhs =y(32);
rhs =(y(16)*params(55)*params(61)+y(25)*params(49)*(1-params(55)))/(params(49)*(1-params(55))+params(42)*params(61));
residual(35)= lhs-rhs;
residual(36) = params(55)*y(10)+y(27)*(1-params(55));
lhs =y(40);
rhs =y(9);
residual(37)= lhs-rhs;
lhs =y(33);
rhs =params(41)*y(35)+(1-params(41))*y(36);
residual(38)= lhs-rhs;
lhs =y(34);
rhs =params(41)*y(37)+(1-params(41))*y(38);
residual(39)= lhs-rhs;
lhs =y(37);
rhs =y(28)*0.326667+y(37)*0.6666666666666666+0.3333333333333333*x(1);
residual(40)= lhs-rhs;
lhs =y(38);
rhs =(-0.344897)*y(39)+y(29)*0.24879+y(38)*0.2653+0.26188*x(2);
residual(41)= lhs-rhs;
lhs =y(39);
rhs =(1-params(38))*y(39)+params(38)*y(38);
residual(42)= lhs-rhs;
lhs =y(28);
rhs =x(1)+y(28)*params(67);
residual(43)= lhs-rhs;
lhs =y(29);
rhs =x(2)+y(29)*params(68);
residual(44)= lhs-rhs;
lhs =y(30);
rhs =y(30)*params(69)+x(3);
residual(45)= lhs-rhs;
lhs =y(46);
rhs =y(43);
residual(46)= lhs-rhs;
lhs =y(47);
rhs =y(43);
residual(47)= lhs-rhs;
lhs =y(48);
rhs =y(43);
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
rhs =y(44);
residual(52)= lhs-rhs;
lhs =y(53);
rhs =y(44);
residual(53)= lhs-rhs;
lhs =y(54);
rhs =y(44);
residual(54)= lhs-rhs;
lhs =y(55);
rhs =y(9);
residual(55)= lhs-rhs;
lhs =y(56);
rhs =y(9);
residual(56)= lhs-rhs;
lhs =y(57);
rhs =y(44);
residual(57)= lhs-rhs;
lhs =y(58);
rhs =y(44);
residual(58)= lhs-rhs;
lhs =y(59);
rhs =y(44);
residual(59)= lhs-rhs;
lhs =y(60);
rhs =y(45);
residual(60)= lhs-rhs;
lhs =y(61);
rhs =y(45);
residual(61)= lhs-rhs;
lhs =y(62);
rhs =y(45);
residual(62)= lhs-rhs;
lhs =y(63);
rhs =y(41);
residual(63)= lhs-rhs;
lhs =y(64);
rhs =y(41);
residual(64)= lhs-rhs;
lhs =y(65);
rhs =y(41);
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
rhs =y(27);
residual(69)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(69, 69);

  %
  % Jacobian matrix
  %

  g1(1,6)=(-4);
  g1(1,41)=1;
  g1(2,9)=(-4);
  g1(2,42)=1;
  g1(3,9)=(-4);
  g1(3,43)=1;
  g1(4,33)=(-1);
  g1(4,44)=1;
  g1(5,33)=(-1);
  g1(5,34)=1;
  g1(5,45)=1;
  g1(6,41)=1-(params(4)+params(3)+params(1)+params(2));
  g1(6,43)=(-(params(13)+params(12)+params(11)+params(10)+params(9)+params(8)+params(7)+params(6)+params(5)));
  g1(6,44)=(-(params(31)+params(30)+params(29)+params(28)+params(27)+params(26)+params(25)+params(24)+params(23)));
  g1(6,45)=(-(params(22)+params(21)+params(20)+params(19)+params(18)+params(17)+params(16)+params(15)+params(14)));
  g1(7,1)=1;
  g1(7,12)=1;
  g1(7,13)=(-1);
  g1(8,7)=1;
  g1(9,8)=1;
  g1(10,9)=1;
  g1(11,14)=1;
  g1(12,1)=1;
  g1(12,2)=(-1);
  g1(12,4)=(-1);
  g1(13,4)=(-(1-params(37)*(1-params(38))));
  g1(13,5)=(-(1-params(37)*(1-params(38))));
  g1(13,29)=1-params(37)*(1-params(38));
  g1(14,6)=1-params(35);
  g1(14,7)=params(35)-1;
  g1(14,9)=(-(1-params(35)));
  g1(15,2)=1;
  g1(15,15)=params(39)+(params(40)-params(39))*params(41);
  g1(15,16)=(params(40)-params(39))*(1-params(41));
  g1(15,17)=(-1);
  g1(16,2)=1;
  g1(16,15)=(params(40)-params(39))*params(41);
  g1(16,16)=params(39)+(params(40)-params(39))*(1-params(41));
  g1(16,18)=(-1);
  g1(17,20)=1;
  g1(18,1)=1;
  g1(18,19)=(-1);
  g1(18,22)=(-1);
  g1(19,22)=(-(1-(1-params(38))*params(43)));
  g1(19,23)=(-(1-(1-params(38))*params(43)));
  g1(19,29)=1-(1-params(38))*params(43);
  g1(20,9)=(-(1-params(35)));
  g1(20,20)=params(35)-1;
  g1(20,26)=1-params(35);
  g1(21,17)=(-1);
  g1(21,19)=1;
  g1(21,24)=params(39)+(params(40)-params(39))*params(41);
  g1(21,25)=(params(40)-params(39))*(1-params(41));
  g1(22,18)=(-1);
  g1(22,19)=1;
  g1(22,24)=(params(40)-params(39))*params(41);
  g1(22,25)=params(39)+(params(40)-params(39))*(1-params(41));
  g1(23,1)=params(45);
  g1(23,9)=(-(params(46)*params(47)));
  g1(23,17)=(-(params(41)*params(48)*params(49)));
  g1(23,18)=(-(params(49)*(1-params(41))*params(48)));
  g1(23,19)=params(44);
  g1(23,21)=params(45);
  g1(23,24)=(-(params(41)*params(48)*params(49)));
  g1(23,25)=(-(params(49)*(1-params(41))*params(48)));
  g1(23,26)=params(46)*params(47);
  g1(23,27)=params(46)*params(47)-params(47);
  g1(24,1)=params(50);
  g1(24,6)=(-1);
  g1(24,9)=(-params(66));
  g1(24,23)=params(50);
  g1(24,26)=1;
  g1(24,27)=(-params(50));
  g1(24,30)=1;
  g1(25,8)=1;
  g1(25,9)=(-params(42));
  g1(25,14)=(-(1-params(42)));
  g1(26,28)=(-1);
  g1(26,31)=(-1);
  g1(26,35)=1;
  g1(27,32)=(-1);
  g1(27,36)=1;
  g1(28,9)=1-params(53)-params(37)*(1-params(53));
  g1(28,17)=(-params(51));
  g1(28,28)=params(51);
  g1(29,1)=params(52);
  g1(29,14)=1-params(54)-params(37)*(1-params(54));
  g1(29,18)=(-params(52));
  g1(30,2)=(-(params(55)*params(58)/(params(55)*params(58)+params(44)*(1-params(55)))));
  g1(30,19)=(-(params(44)*(1-params(55))/(params(55)*params(58)+params(44)*(1-params(55)))));
  g1(30,35)=1;
  g1(31,3)=(-(params(38)*params(55)*params(59)/(params(38)*params(55)*params(59)+params(38)*(1-params(55))*params(60))));
  g1(31,21)=(-(params(38)*(1-params(55))*params(60)/(params(38)*params(55)*params(59)+params(38)*(1-params(55))*params(60))));
  g1(31,36)=1;
  g1(32,3)=(-params(38));
  g1(32,5)=1-(1-params(38));
  g1(33,21)=(-params(38));
  g1(33,23)=1-(1-params(38));
  g1(34,15)=(-(params(55)*params(61)/(params(49)*(1-params(55))+params(42)*params(61))));
  g1(34,24)=(-(params(49)*(1-params(55))/(params(49)*(1-params(55))+params(42)*params(61))));
  g1(34,31)=1;
  g1(35,16)=(-(params(55)*params(61)/(params(49)*(1-params(55))+params(42)*params(61))));
  g1(35,25)=(-(params(49)*(1-params(55))/(params(49)*(1-params(55))+params(42)*params(61))));
  g1(35,32)=1;
  g1(36,10)=params(55);
  g1(36,27)=1-params(55);
  g1(37,9)=(-1);
  g1(37,40)=1;
  g1(38,33)=1;
  g1(38,35)=(-params(41));
  g1(38,36)=(-(1-params(41)));
  g1(39,34)=1;
  g1(39,37)=(-params(41));
  g1(39,38)=(-(1-params(41)));
  g1(40,28)=(-0.326667);
  g1(40,37)=0.3333333333333334;
  g1(41,29)=(-0.24879);
  g1(41,38)=0.7347;
  g1(41,39)=0.344897;
  g1(42,38)=(-params(38));
  g1(42,39)=1-(1-params(38));
  g1(43,28)=1-params(67);
  g1(44,29)=1-params(68);
  g1(45,30)=1-params(69);
  g1(46,43)=(-1);
  g1(46,46)=1;
  g1(47,43)=(-1);
  g1(47,47)=1;
  g1(48,43)=(-1);
  g1(48,48)=1;
  g1(49,45)=(-1);
  g1(49,49)=1;
  g1(50,45)=(-1);
  g1(50,50)=1;
  g1(51,45)=(-1);
  g1(51,51)=1;
  g1(52,44)=(-1);
  g1(52,52)=1;
  g1(53,44)=(-1);
  g1(53,53)=1;
  g1(54,44)=(-1);
  g1(54,54)=1;
  g1(55,9)=(-1);
  g1(55,55)=1;
  g1(56,9)=(-1);
  g1(56,56)=1;
  g1(57,44)=(-1);
  g1(57,57)=1;
  g1(58,44)=(-1);
  g1(58,58)=1;
  g1(59,44)=(-1);
  g1(59,59)=1;
  g1(60,45)=(-1);
  g1(60,60)=1;
  g1(61,45)=(-1);
  g1(61,61)=1;
  g1(62,45)=(-1);
  g1(62,62)=1;
  g1(63,41)=(-1);
  g1(63,63)=1;
  g1(64,41)=(-1);
  g1(64,64)=1;
  g1(65,41)=(-1);
  g1(65,65)=1;
  g1(66,43)=(-1);
  g1(66,66)=1;
  g1(67,43)=(-1);
  g1(67,67)=1;
  g1(68,43)=(-1);
  g1(68,68)=1;
  g1(69,27)=(-1);
  g1(69,69)=1;
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],69,4761);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],69,328509);
end
end
end
end
