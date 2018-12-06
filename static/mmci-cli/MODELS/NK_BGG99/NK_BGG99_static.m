function [residual, g1, g2, g3] = NK_BGG99_static(y, x, params)
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

residual = zeros( 58, 1);

%
% Model equations
%

T214 = params(42)^(-1);
T260 = (1-params(39))*(1-params(36))*params(60)/params(47);
lhs =y(29);
rhs =4*y(5);
residual(1)= lhs-rhs;
lhs =y(30);
rhs =y(14)+y(14)+y(14)+y(14);
residual(2)= lhs-rhs;
lhs =y(31);
rhs =4*y(14);
residual(3)= lhs-rhs;
lhs =y(32);
rhs =y(1)-y(20);
residual(4)= lhs-rhs;
lhs =y(33);
rhs =y(1);
residual(5)= lhs-rhs;
lhs =y(34);
rhs =y(19);
residual(6)= lhs-rhs;
lhs =y(29);
rhs =params(32)*x(2)+y(33)*params(31)+y(33)*params(30)+y(33)*params(29)+y(33)*params(28)+y(33)*params(27)+y(33)*params(26)+y(33)*params(25)+y(33)*params(24)+y(33)*params(23)+y(32)*params(22)+y(32)*params(21)+y(32)*params(20)+y(32)*params(19)+y(32)*params(18)+y(32)*params(17)+y(32)*params(16)+y(32)*params(15)+y(32)*params(14)+y(31)*params(13)+y(31)*params(12)+y(31)*params(11)+y(31)*params(10)+y(31)*params(6)+y(31)*params(5)+y(29)*params(1)+y(29)*params(2)+y(29)*params(3)+y(29)*params(4)+y(31)*params(7)+y(31)*params(8)+y(31)*params(9);
residual(7)= lhs-rhs;
lhs =y(34);
rhs =params(34)*x(3);
residual(8)= lhs-rhs;
lhs =y(1);
rhs =params(48)*y(8)+params(50)*y(3)+params(51)*y(9);
residual(9)= lhs-rhs;
lhs =y(8);
rhs =y(8)-y(4);
residual(10)= lhs-rhs;
residual(11) = y(10);
lhs =y(6)-y(4);
rhs =(-params(40))*(y(7)-y(11)-y(2));
residual(12)= lhs-rhs;
lhs =y(6);
rhs =(1-params(41))*(y(1)-y(2)-y(12))+y(11)*params(41)-y(11);
residual(13)= lhs-rhs;
lhs =y(11);
rhs =params(43)*(y(3)-y(2));
residual(14)= lhs-rhs;
lhs =y(1);
rhs =y(15)+y(2)*params(39)+(1-params(39))*params(36)*y(13);
residual(15)= lhs-rhs;
lhs =y(1)-y(13)-y(12)-y(8);
rhs =y(13)*T214;
residual(16)= lhs-rhs;
lhs =y(16);
rhs =y(12)*(-params(44))+y(14)*params(45);
residual(17)= lhs-rhs;
lhs =y(14);
rhs =y(16);
residual(18)= lhs-rhs;
lhs =y(18);
rhs =y(14);
residual(19)= lhs-rhs;
lhs =y(2);
rhs =y(3)*params(46)+y(2)*(1-params(46));
residual(20)= lhs-rhs;
lhs =y(7);
rhs =y(6)*params(37)*params(55)*params(53)-y(4)*params(53)*params(37)*params(54)+params(53)*params(37)*(params(55)-params(54))*(y(11)+y(2))+params(37)*params(54)*(y(4)+y(7))+T260*(y(1)-y(12));
residual(21)= lhs-rhs;
lhs =y(9);
rhs =y(19)+y(9)*params(62);
residual(22)= lhs-rhs;
lhs =y(15);
rhs =y(15)*params(63)+x(1);
residual(23)= lhs-rhs;
lhs =y(4);
rhs =y(5)-y(14);
residual(24)= lhs-rhs;
lhs =y(17);
rhs =y(6)-y(4);
residual(25)= lhs-rhs;
lhs =y(20);
rhs =params(51)*y(9)+params(48)*y(26)+params(50)*y(22);
residual(26)= lhs-rhs;
lhs =y(26);
rhs =y(26)-y(23);
residual(27)= lhs-rhs;
lhs =y(24)-y(23);
rhs =(-params(40))*(y(25)-y(27)-y(21));
residual(28)= lhs-rhs;
lhs =y(24);
rhs =(1-params(41))*(y(20)-y(21))+params(41)*y(27)-y(27);
residual(29)= lhs-rhs;
lhs =y(27);
rhs =params(43)*(y(22)-y(21));
residual(30)= lhs-rhs;
lhs =y(20);
rhs =y(15)+params(39)*y(21)+(1-params(39))*params(36)*y(28);
residual(31)= lhs-rhs;
lhs =y(20)-y(28)-y(26);
rhs =T214*y(28);
residual(32)= lhs-rhs;
lhs =y(21);
rhs =params(46)*y(22)+(1-params(46))*y(21);
residual(33)= lhs-rhs;
lhs =y(25);
rhs =params(37)*params(55)*params(53)*y(24)-params(53)*params(37)*params(54)*y(23)+params(53)*params(37)*(params(55)-params(54))*(y(27)+y(21))+params(37)*params(54)*(y(23)+y(25))+y(20)*T260;
residual(34)= lhs-rhs;
lhs =y(35);
rhs =y(31);
residual(35)= lhs-rhs;
lhs =y(36);
rhs =y(31);
residual(36)= lhs-rhs;
lhs =y(37);
rhs =y(31);
residual(37)= lhs-rhs;
lhs =y(38);
rhs =y(32);
residual(38)= lhs-rhs;
lhs =y(39);
rhs =y(32);
residual(39)= lhs-rhs;
lhs =y(40);
rhs =y(32);
residual(40)= lhs-rhs;
lhs =y(41);
rhs =y(33);
residual(41)= lhs-rhs;
lhs =y(42);
rhs =y(33);
residual(42)= lhs-rhs;
lhs =y(43);
rhs =y(33);
residual(43)= lhs-rhs;
lhs =y(44);
rhs =y(14);
residual(44)= lhs-rhs;
lhs =y(45);
rhs =y(14);
residual(45)= lhs-rhs;
lhs =y(46);
rhs =y(14);
residual(46)= lhs-rhs;
lhs =y(47);
rhs =y(33);
residual(47)= lhs-rhs;
lhs =y(48);
rhs =y(33);
residual(48)= lhs-rhs;
lhs =y(49);
rhs =y(33);
residual(49)= lhs-rhs;
lhs =y(50);
rhs =y(32);
residual(50)= lhs-rhs;
lhs =y(51);
rhs =y(32);
residual(51)= lhs-rhs;
lhs =y(52);
rhs =y(32);
residual(52)= lhs-rhs;
lhs =y(53);
rhs =y(29);
residual(53)= lhs-rhs;
lhs =y(54);
rhs =y(29);
residual(54)= lhs-rhs;
lhs =y(55);
rhs =y(29);
residual(55)= lhs-rhs;
lhs =y(56);
rhs =y(31);
residual(56)= lhs-rhs;
lhs =y(57);
rhs =y(31);
residual(57)= lhs-rhs;
lhs =y(58);
rhs =y(31);
residual(58)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(58, 58);

  %
  % Jacobian matrix
  %

  g1(1,5)=(-4);
  g1(1,29)=1;
  g1(2,14)=(-4);
  g1(2,30)=1;
  g1(3,14)=(-4);
  g1(3,31)=1;
  g1(4,1)=(-1);
  g1(4,20)=1;
  g1(4,32)=1;
  g1(5,1)=(-1);
  g1(5,33)=1;
  g1(6,19)=(-1);
  g1(6,34)=1;
  g1(7,29)=1-(params(4)+params(3)+params(1)+params(2));
  g1(7,31)=(-(params(13)+params(12)+params(11)+params(10)+params(9)+params(8)+params(7)+params(6)+params(5)));
  g1(7,32)=(-(params(22)+params(21)+params(20)+params(19)+params(18)+params(17)+params(16)+params(15)+params(14)));
  g1(7,33)=(-(params(31)+params(30)+params(29)+params(28)+params(27)+params(26)+params(25)+params(24)+params(23)));
  g1(8,34)=1;
  g1(9,1)=1;
  g1(9,3)=(-params(50));
  g1(9,8)=(-params(48));
  g1(9,9)=(-params(51));
  g1(10,4)=1;
  g1(11,10)=1;
  g1(12,2)=(-params(40));
  g1(12,4)=(-1);
  g1(12,6)=1;
  g1(12,7)=params(40);
  g1(12,11)=(-params(40));
  g1(13,1)=(-(1-params(41)));
  g1(13,2)=1-params(41);
  g1(13,6)=1;
  g1(13,11)=(-(params(41)-1));
  g1(13,12)=1-params(41);
  g1(14,2)=params(43);
  g1(14,3)=(-params(43));
  g1(14,11)=1;
  g1(15,1)=1;
  g1(15,2)=(-params(39));
  g1(15,13)=(-((1-params(39))*params(36)));
  g1(15,15)=(-1);
  g1(16,1)=1;
  g1(16,8)=(-1);
  g1(16,12)=(-1);
  g1(16,13)=(-1)-T214;
  g1(17,12)=params(44);
  g1(17,14)=(-params(45));
  g1(17,16)=1;
  g1(18,14)=1;
  g1(18,16)=(-1);
  g1(19,14)=(-1);
  g1(19,18)=1;
  g1(20,2)=1-(1-params(46));
  g1(20,3)=(-params(46));
  g1(21,1)=(-T260);
  g1(21,2)=(-(params(53)*params(37)*(params(55)-params(54))));
  g1(21,4)=(-(params(37)*params(54)+(-(params(53)*params(37)*params(54)))));
  g1(21,6)=(-(params(37)*params(55)*params(53)));
  g1(21,7)=1-params(37)*params(54);
  g1(21,11)=(-(params(53)*params(37)*(params(55)-params(54))));
  g1(21,12)=T260;
  g1(22,9)=1-params(62);
  g1(22,19)=(-1);
  g1(23,15)=1-params(63);
  g1(24,4)=1;
  g1(24,5)=(-1);
  g1(24,14)=1;
  g1(25,4)=1;
  g1(25,6)=(-1);
  g1(25,17)=1;
  g1(26,9)=(-params(51));
  g1(26,20)=1;
  g1(26,22)=(-params(50));
  g1(26,26)=(-params(48));
  g1(27,23)=1;
  g1(28,21)=(-params(40));
  g1(28,23)=(-1);
  g1(28,24)=1;
  g1(28,25)=params(40);
  g1(28,27)=(-params(40));
  g1(29,20)=(-(1-params(41)));
  g1(29,21)=1-params(41);
  g1(29,24)=1;
  g1(29,27)=(-(params(41)-1));
  g1(30,21)=params(43);
  g1(30,22)=(-params(43));
  g1(30,27)=1;
  g1(31,15)=(-1);
  g1(31,20)=1;
  g1(31,21)=(-params(39));
  g1(31,28)=(-((1-params(39))*params(36)));
  g1(32,20)=1;
  g1(32,26)=(-1);
  g1(32,28)=(-1)-T214;
  g1(33,21)=1-(1-params(46));
  g1(33,22)=(-params(46));
  g1(34,20)=(-T260);
  g1(34,21)=(-(params(53)*params(37)*(params(55)-params(54))));
  g1(34,23)=(-(params(37)*params(54)+(-(params(53)*params(37)*params(54)))));
  g1(34,24)=(-(params(37)*params(55)*params(53)));
  g1(34,25)=1-params(37)*params(54);
  g1(34,27)=(-(params(53)*params(37)*(params(55)-params(54))));
  g1(35,31)=(-1);
  g1(35,35)=1;
  g1(36,31)=(-1);
  g1(36,36)=1;
  g1(37,31)=(-1);
  g1(37,37)=1;
  g1(38,32)=(-1);
  g1(38,38)=1;
  g1(39,32)=(-1);
  g1(39,39)=1;
  g1(40,32)=(-1);
  g1(40,40)=1;
  g1(41,33)=(-1);
  g1(41,41)=1;
  g1(42,33)=(-1);
  g1(42,42)=1;
  g1(43,33)=(-1);
  g1(43,43)=1;
  g1(44,14)=(-1);
  g1(44,44)=1;
  g1(45,14)=(-1);
  g1(45,45)=1;
  g1(46,14)=(-1);
  g1(46,46)=1;
  g1(47,33)=(-1);
  g1(47,47)=1;
  g1(48,33)=(-1);
  g1(48,48)=1;
  g1(49,33)=(-1);
  g1(49,49)=1;
  g1(50,32)=(-1);
  g1(50,50)=1;
  g1(51,32)=(-1);
  g1(51,51)=1;
  g1(52,32)=(-1);
  g1(52,52)=1;
  g1(53,29)=(-1);
  g1(53,53)=1;
  g1(54,29)=(-1);
  g1(54,54)=1;
  g1(55,29)=(-1);
  g1(55,55)=1;
  g1(56,31)=(-1);
  g1(56,56)=1;
  g1(57,31)=(-1);
  g1(57,57)=1;
  g1(58,31)=(-1);
  g1(58,58)=1;
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],58,3364);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],58,195112);
end
end
end
end
