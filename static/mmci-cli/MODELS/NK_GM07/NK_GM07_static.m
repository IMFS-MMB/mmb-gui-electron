function [residual, g1, g2, g3] = NK_GM07_static(y, x, params)
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

residual = zeros( 51, 1);

%
% Model equations
%

T46 = params(51)*(1-params(40))/(params(50)*params(52));
T60 = params(41)*params(48)/params(51)/(params(41)*params(48)/params(51)+params(53));
T66 = params(53)/(params(41)*params(48)/params(51)+params(53));
T94 = params(51)*params(40)*params(53)/(params(51)*params(53)+params(41)*params(48)*(1+params(43)));
T116 = params(41)*params(54)*params(35)/(params(51)*params(55));
T120 = params(41)*params(54)*(params(35)/(params(51)*params(55))-1);
T134 = (params(49)/params(48))^(1-params(36));
T137 = params(38)/(1+params(43))*(1-params(42)+params(36)*params(56)*T134);
T143 = T134*params(56)*params(38)*params(36)/(1+params(43));
T303 = 1/params(38)/(1+params(43));
T310 = params(54)*params(35)/(params(51)*params(55));
lhs =y(1);
rhs =y(1)*params(38)+params(39)*y(2);
residual(1)= lhs-rhs;
lhs =y(2);
rhs =y(5)-y(4);
residual(2)= lhs-rhs;
lhs =y(12);
rhs =y(9)+y(11);
residual(3)= lhs-rhs;
lhs =y(4)+y(6);
rhs =params(49)/(1-params(49)-params(50))*y(7)+params(50)/(1-params(49)-params(50))*y(8);
residual(4)= lhs-rhs;
residual(5) = y(6)+y(8)+y(9)*T46+y(4)*(1+T46);
lhs =y(3);
rhs =T60*(y(9)-y(10)-y(16))-T66*y(13);
residual(6)= lhs-rhs;
lhs =y(9);
rhs =(1+params(48)*params(42)/params(51))*(1-params(36))*(y(7)+y(14))-y(10)*params(48)*params(42)/params(51);
residual(7)= lhs-rhs;
lhs =y(9);
rhs =(1-params(40))*(y(8)+y(15))+T94*(y(9)+y(13))+(1+params(43))*params(48)*params(40)*params(41)/(params(51)*params(53)+params(41)*params(48)*(1+params(43)))*(y(10)+y(16));
residual(8)= lhs-rhs;
lhs =y(2);
rhs =y(6)+y(7)-y(9);
residual(9)= lhs-rhs;
residual(10) = y(1);
lhs =y(9)*T116;
rhs =T120*(y(3)+y(16))+y(10)*(T120-1)+y(10)*params(38)/(1+params(43))*(1-params(42))+y(4)*T137+T143*(y(2)+(1-params(36))*(y(7)+y(14)))-y(4)*(T116+T137);
residual(11)= lhs-rhs;
lhs =y(23);
rhs =y(20)*4;
residual(12)= lhs-rhs;
lhs =y(24);
rhs =y(1)+y(1)+y(1)+y(1);
residual(13)= lhs-rhs;
lhs =y(25);
rhs =y(1)*4;
residual(14)= lhs-rhs;
lhs =y(27);
rhs =y(2)*4;
residual(15)= lhs-rhs;
lhs =y(26);
rhs =y(9);
residual(16)= lhs-rhs;
residual(17) = y(28);
lhs =y(23);
rhs =params(32)*x(4)+y(26)*params(31)+y(26)*params(30)+y(26)*params(29)+y(26)*params(28)+y(26)*params(27)+y(26)*params(26)+y(26)*params(25)+y(26)*params(24)+y(26)*params(23)+y(27)*params(22)+y(27)*params(21)+y(27)*params(20)+y(27)*params(19)+y(27)*params(18)+y(27)*params(17)+y(27)*params(16)+y(27)*params(15)+y(27)*params(14)+y(25)*params(13)+y(25)*params(12)+y(25)*params(11)+y(25)*params(10)+y(25)*params(6)+y(25)*params(5)+y(23)*params(1)+y(23)*params(2)+y(23)*params(3)+y(23)*params(4)+y(25)*params(7)+y(25)*params(8)+y(25)*params(9);
residual(18)= lhs-rhs;
lhs =y(17)/params(58);
rhs =y(6)+y(8)-y(9);
residual(19)= lhs-rhs;
lhs =y(18)/params(57);
rhs =y(6)+y(8)-y(9);
residual(20)= lhs-rhs;
lhs =y(19);
rhs =T303*(y(1)+y(4)-y(4));
residual(21)= lhs-rhs;
lhs =y(19)-y(22);
rhs =T310*(y(3)-y(9)-y(4))-y(3)*params(54);
residual(22)= lhs-rhs;
lhs =y(19)-y(20);
rhs =y(18);
residual(23)= lhs-rhs;
lhs =y(21)-y(20);
rhs =y(17);
residual(24)= lhs-rhs;
residual(25) = y(13);
lhs =y(14);
rhs =y(14)*params(64)+x(1);
residual(26)= lhs-rhs;
lhs =y(15);
rhs =y(15)*params(65)+x(2);
residual(27)= lhs-rhs;
lhs =y(16);
rhs =y(16)*params(66)-x(3);
residual(28)= lhs-rhs;
lhs =y(29);
rhs =y(25);
residual(29)= lhs-rhs;
lhs =y(30);
rhs =y(25);
residual(30)= lhs-rhs;
lhs =y(31);
rhs =y(25);
residual(31)= lhs-rhs;
lhs =y(32);
rhs =y(27);
residual(32)= lhs-rhs;
lhs =y(33);
rhs =y(27);
residual(33)= lhs-rhs;
lhs =y(34);
rhs =y(27);
residual(34)= lhs-rhs;
lhs =y(35);
rhs =y(26);
residual(35)= lhs-rhs;
lhs =y(36);
rhs =y(26);
residual(36)= lhs-rhs;
lhs =y(37);
rhs =y(26);
residual(37)= lhs-rhs;
lhs =y(38);
rhs =y(1);
residual(38)= lhs-rhs;
lhs =y(39);
rhs =y(1);
residual(39)= lhs-rhs;
lhs =y(40);
rhs =y(26);
residual(40)= lhs-rhs;
lhs =y(41);
rhs =y(26);
residual(41)= lhs-rhs;
lhs =y(42);
rhs =y(26);
residual(42)= lhs-rhs;
lhs =y(43);
rhs =y(27);
residual(43)= lhs-rhs;
lhs =y(44);
rhs =y(27);
residual(44)= lhs-rhs;
lhs =y(45);
rhs =y(27);
residual(45)= lhs-rhs;
lhs =y(46);
rhs =y(23);
residual(46)= lhs-rhs;
lhs =y(47);
rhs =y(23);
residual(47)= lhs-rhs;
lhs =y(48);
rhs =y(23);
residual(48)= lhs-rhs;
lhs =y(49);
rhs =y(25);
residual(49)= lhs-rhs;
lhs =y(50);
rhs =y(25);
residual(50)= lhs-rhs;
lhs =y(51);
rhs =y(25);
residual(51)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(51, 51);

  %
  % Jacobian matrix
  %

T524 = (-((1+params(43))*params(48)*params(40)*params(41)/(params(51)*params(53)+params(41)*params(48)*(1+params(43)))));
  g1(1,1)=1-params(38);
  g1(1,2)=(-params(39));
  g1(2,2)=1;
  g1(2,4)=1;
  g1(2,5)=(-1);
  g1(3,9)=(-1);
  g1(3,11)=(-1);
  g1(3,12)=1;
  g1(4,4)=1;
  g1(4,6)=1;
  g1(4,7)=(-(params(49)/(1-params(49)-params(50))));
  g1(4,8)=(-(params(50)/(1-params(49)-params(50))));
  g1(5,4)=1+T46;
  g1(5,6)=1;
  g1(5,8)=1;
  g1(5,9)=T46;
  g1(6,3)=1;
  g1(6,9)=(-T60);
  g1(6,10)=T60;
  g1(6,13)=T66;
  g1(6,16)=T60;
  g1(7,7)=(-((1+params(48)*params(42)/params(51))*(1-params(36))));
  g1(7,9)=1;
  g1(7,10)=params(48)*params(42)/params(51);
  g1(7,14)=(-((1+params(48)*params(42)/params(51))*(1-params(36))));
  g1(8,8)=(-(1-params(40)));
  g1(8,9)=1-T94;
  g1(8,10)=T524;
  g1(8,13)=(-T94);
  g1(8,15)=(-(1-params(40)));
  g1(8,16)=T524;
  g1(9,2)=1;
  g1(9,6)=(-1);
  g1(9,7)=(-1);
  g1(9,9)=1;
  g1(10,1)=1;
  g1(11,2)=(-T143);
  g1(11,3)=(-T120);
  g1(11,4)=(-(T137-(T116+T137)));
  g1(11,7)=(-((1-params(36))*T143));
  g1(11,9)=T116;
  g1(11,10)=(-(T120-1+params(38)/(1+params(43))*(1-params(42))));
  g1(11,14)=(-((1-params(36))*T143));
  g1(11,16)=(-T120);
  g1(12,20)=(-4);
  g1(12,23)=1;
  g1(13,1)=(-4);
  g1(13,24)=1;
  g1(14,1)=(-4);
  g1(14,25)=1;
  g1(15,2)=(-4);
  g1(15,27)=1;
  g1(16,9)=(-1);
  g1(16,26)=1;
  g1(17,28)=1;
  g1(18,23)=1-(params(4)+params(3)+params(1)+params(2));
  g1(18,25)=(-(params(13)+params(12)+params(11)+params(10)+params(9)+params(8)+params(7)+params(6)+params(5)));
  g1(18,26)=(-(params(31)+params(30)+params(29)+params(28)+params(27)+params(26)+params(25)+params(24)+params(23)));
  g1(18,27)=(-(params(22)+params(21)+params(20)+params(19)+params(18)+params(17)+params(16)+params(15)+params(14)));
  g1(19,6)=(-1);
  g1(19,8)=(-1);
  g1(19,9)=1;
  g1(19,17)=1/params(58);
  g1(20,6)=(-1);
  g1(20,8)=(-1);
  g1(20,9)=1;
  g1(20,18)=1/params(57);
  g1(21,1)=(-T303);
  g1(21,19)=1;
  g1(22,3)=(-(T310-params(54)));
  g1(22,4)=T310;
  g1(22,9)=T310;
  g1(22,19)=1;
  g1(22,22)=(-1);
  g1(23,18)=(-1);
  g1(23,19)=1;
  g1(23,20)=(-1);
  g1(24,17)=(-1);
  g1(24,20)=(-1);
  g1(24,21)=1;
  g1(25,13)=1;
  g1(26,14)=1-params(64);
  g1(27,15)=1-params(65);
  g1(28,16)=1-params(66);
  g1(29,25)=(-1);
  g1(29,29)=1;
  g1(30,25)=(-1);
  g1(30,30)=1;
  g1(31,25)=(-1);
  g1(31,31)=1;
  g1(32,27)=(-1);
  g1(32,32)=1;
  g1(33,27)=(-1);
  g1(33,33)=1;
  g1(34,27)=(-1);
  g1(34,34)=1;
  g1(35,26)=(-1);
  g1(35,35)=1;
  g1(36,26)=(-1);
  g1(36,36)=1;
  g1(37,26)=(-1);
  g1(37,37)=1;
  g1(38,1)=(-1);
  g1(38,38)=1;
  g1(39,1)=(-1);
  g1(39,39)=1;
  g1(40,26)=(-1);
  g1(40,40)=1;
  g1(41,26)=(-1);
  g1(41,41)=1;
  g1(42,26)=(-1);
  g1(42,42)=1;
  g1(43,27)=(-1);
  g1(43,43)=1;
  g1(44,27)=(-1);
  g1(44,44)=1;
  g1(45,27)=(-1);
  g1(45,45)=1;
  g1(46,23)=(-1);
  g1(46,46)=1;
  g1(47,23)=(-1);
  g1(47,47)=1;
  g1(48,23)=(-1);
  g1(48,48)=1;
  g1(49,25)=(-1);
  g1(49,49)=1;
  g1(50,25)=(-1);
  g1(50,50)=1;
  g1(51,25)=(-1);
  g1(51,51)=1;
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],51,2601);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],51,132651);
end
end
end
end
