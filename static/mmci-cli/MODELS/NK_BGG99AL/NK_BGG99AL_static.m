function [residual, g1, g2] = NK_BGG99AL_static(y, x, params)
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
%                                          in order of declaration of the equations
%   g1        [M_.endo_nbr by M_.endo_nbr] double    Jacobian matrix of the static model equations;
%                                                     columns: variables in declaration order
%                                                     rows: equations in order of declaration
%   g2        [M_.endo_nbr by (M_.endo_nbr)^2] double   Hessian matrix of the static model equations;
%                                                       columns: variables in declaration order
%                                                       rows: equations in order of declaration
%
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

residual = zeros( 37, 1);

%
% Model equations
%

T137 = params(42)^(-1);
T182 = (1-params(39))*(1-params(36))*params(60)/params(47);
lhs =y(29);
rhs =4*y(5);
residual(1)= lhs-rhs;
lhs =y(30);
rhs =0.25*(y(33)+y(31)+y(32)+y(33));
residual(2)= lhs-rhs;
lhs =y(31);
rhs =4*y(14);
residual(3)= lhs-rhs;
lhs =y(32);
rhs =y(31);
residual(4)= lhs-rhs;
lhs =y(33);
rhs =y(32);
residual(5)= lhs-rhs;
lhs =y(34);
rhs =y(32)+y(33);
residual(6)= lhs-rhs;
lhs =y(35);
rhs =y(1)-y(20);
residual(7)= lhs-rhs;
lhs =y(36);
rhs =y(1);
residual(8)= lhs-rhs;
lhs =y(37);
rhs =y(19);
residual(9)= lhs-rhs;
lhs =y(29);
rhs =y(29)*params(1)+y(31)*params(5)+y(31)*params(6)+y(32)*params(7)+y(33)*params(8)+y(31)*params(10)+y(35)*params(14)+y(35)*params(15)+y(36)*params(23)+y(36)*params(24)+params(32)*x(2);
residual(10)= lhs-rhs;
lhs =y(37);
rhs =params(34)*x(3);
residual(11)= lhs-rhs;
lhs =y(1);
rhs =params(48)*y(8)+params(50)*y(3)+params(51)*y(9);
residual(12)= lhs-rhs;
lhs =y(8);
rhs =y(8)+(-y(4));
residual(13)= lhs-rhs;
residual(14) = y(10);
lhs =y(6)-y(4);
rhs =(-params(40))*(y(7)-y(11)-y(2));
residual(15)= lhs-rhs;
lhs =y(6);
rhs =(1-params(41))*(y(1)-y(2)-y(12))+y(11)*params(41)-y(11);
residual(16)= lhs-rhs;
lhs =y(11);
rhs =params(43)*(y(3)-y(2));
residual(17)= lhs-rhs;
lhs =y(1);
rhs =y(15)+y(2)*params(39)+(1-params(39))*params(36)*y(13);
residual(18)= lhs-rhs;
lhs =y(1)-y(13)-y(12)-y(8);
rhs =y(13)*T137;
residual(19)= lhs-rhs;
lhs =y(16);
rhs =y(12)*(-params(44))+params(45)*y(18);
residual(20)= lhs-rhs;
lhs =y(14);
rhs =y(16);
residual(21)= lhs-rhs;
lhs =y(18);
rhs =y(14);
residual(22)= lhs-rhs;
lhs =y(2);
rhs =y(3)*params(46)+y(2)*(1-params(46));
residual(23)= lhs-rhs;
lhs =y(7);
rhs =y(6)*params(37)*params(55)*params(53)-y(4)*params(53)*params(37)*params(54)+params(53)*params(37)*(params(55)-params(54))*(y(11)+y(2))+params(37)*params(54)*(y(4)+y(7))+T182*(y(1)-y(12));
residual(24)= lhs-rhs;
lhs =y(9);
rhs =y(19)+y(9)*params(62);
residual(25)= lhs-rhs;
lhs =y(15);
rhs =y(15)*params(63)+x(1);
residual(26)= lhs-rhs;
lhs =y(4);
rhs =y(5)-y(14);
residual(27)= lhs-rhs;
lhs =y(17);
rhs =y(6)-y(4);
residual(28)= lhs-rhs;
lhs =y(20);
rhs =params(51)*y(9)+params(48)*y(26)+params(50)*y(22);
residual(29)= lhs-rhs;
lhs =y(26);
rhs =y(26)+(-y(23));
residual(30)= lhs-rhs;
lhs =y(24)-y(23);
rhs =(-params(40))*(y(25)-y(27)-y(21));
residual(31)= lhs-rhs;
lhs =y(24);
rhs =(1-params(41))*(y(20)-y(21))+params(41)*y(27)-y(27);
residual(32)= lhs-rhs;
lhs =y(27);
rhs =params(43)*(y(22)-y(21));
residual(33)= lhs-rhs;
lhs =y(20);
rhs =y(15)+params(39)*y(21)+(1-params(39))*params(36)*y(28);
residual(34)= lhs-rhs;
lhs =y(20)-y(28)-y(26);
rhs =T137*y(28);
residual(35)= lhs-rhs;
lhs =y(21);
rhs =params(46)*y(22)+(1-params(46))*y(21);
residual(36)= lhs-rhs;
lhs =y(25);
rhs =params(37)*params(55)*params(53)*y(24)-params(53)*params(37)*params(54)*y(23)+params(53)*params(37)*(params(55)-params(54))*(y(27)+y(21))+params(37)*params(54)*(y(23)+y(25))+y(20)*T182;
residual(37)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(37, 37);

  %
  % Jacobian matrix
  %

  g1(1,5)=(-4);
  g1(1,29)=1;
  g1(2,30)=1;
  g1(2,31)=(-0.25);
  g1(2,32)=(-0.25);
  g1(2,33)=(-0.5);
  g1(3,14)=(-4);
  g1(3,31)=1;
  g1(4,31)=(-1);
  g1(4,32)=1;
  g1(5,32)=(-1);
  g1(5,33)=1;
  g1(6,32)=(-1);
  g1(6,33)=(-1);
  g1(6,34)=1;
  g1(7,1)=(-1);
  g1(7,20)=1;
  g1(7,35)=1;
  g1(8,1)=(-1);
  g1(8,36)=1;
  g1(9,19)=(-1);
  g1(9,37)=1;
  g1(10,29)=1-params(1);
  g1(10,31)=(-(params(10)+params(5)+params(6)));
  g1(10,32)=(-params(7));
  g1(10,33)=(-params(8));
  g1(10,35)=(-(params(14)+params(15)));
  g1(10,36)=(-(params(23)+params(24)));
  g1(11,37)=1;
  g1(12,1)=1;
  g1(12,3)=(-params(50));
  g1(12,8)=(-params(48));
  g1(12,9)=(-params(51));
  g1(13,4)=1;
  g1(14,10)=1;
  g1(15,2)=(-params(40));
  g1(15,4)=(-1);
  g1(15,6)=1;
  g1(15,7)=params(40);
  g1(15,11)=(-params(40));
  g1(16,1)=(-(1-params(41)));
  g1(16,2)=1-params(41);
  g1(16,6)=1;
  g1(16,11)=(-(params(41)-1));
  g1(16,12)=1-params(41);
  g1(17,2)=params(43);
  g1(17,3)=(-params(43));
  g1(17,11)=1;
  g1(18,1)=1;
  g1(18,2)=(-params(39));
  g1(18,13)=(-((1-params(39))*params(36)));
  g1(18,15)=(-1);
  g1(19,1)=1;
  g1(19,8)=(-1);
  g1(19,12)=(-1);
  g1(19,13)=(-1)-T137;
  g1(20,12)=params(44);
  g1(20,16)=1;
  g1(20,18)=(-params(45));
  g1(21,14)=1;
  g1(21,16)=(-1);
  g1(22,14)=(-1);
  g1(22,18)=1;
  g1(23,2)=1-(1-params(46));
  g1(23,3)=(-params(46));
  g1(24,1)=(-T182);
  g1(24,2)=(-(params(53)*params(37)*(params(55)-params(54))));
  g1(24,4)=(-(params(37)*params(54)+(-(params(53)*params(37)*params(54)))));
  g1(24,6)=(-(params(37)*params(55)*params(53)));
  g1(24,7)=1-params(37)*params(54);
  g1(24,11)=(-(params(53)*params(37)*(params(55)-params(54))));
  g1(24,12)=T182;
  g1(25,9)=1-params(62);
  g1(25,19)=(-1);
  g1(26,15)=1-params(63);
  g1(27,4)=1;
  g1(27,5)=(-1);
  g1(27,14)=1;
  g1(28,4)=1;
  g1(28,6)=(-1);
  g1(28,17)=1;
  g1(29,9)=(-params(51));
  g1(29,20)=1;
  g1(29,22)=(-params(50));
  g1(29,26)=(-params(48));
  g1(30,23)=1;
  g1(31,21)=(-params(40));
  g1(31,23)=(-1);
  g1(31,24)=1;
  g1(31,25)=params(40);
  g1(31,27)=(-params(40));
  g1(32,20)=(-(1-params(41)));
  g1(32,21)=1-params(41);
  g1(32,24)=1;
  g1(32,27)=(-(params(41)-1));
  g1(33,21)=params(43);
  g1(33,22)=(-params(43));
  g1(33,27)=1;
  g1(34,15)=(-1);
  g1(34,20)=1;
  g1(34,21)=(-params(39));
  g1(34,28)=(-((1-params(39))*params(36)));
  g1(35,20)=1;
  g1(35,26)=(-1);
  g1(35,28)=(-1)-T137;
  g1(36,21)=1-(1-params(46));
  g1(36,22)=(-params(46));
  g1(37,20)=(-T182);
  g1(37,21)=(-(params(53)*params(37)*(params(55)-params(54))));
  g1(37,23)=(-(params(37)*params(54)+(-(params(53)*params(37)*params(54)))));
  g1(37,24)=(-(params(37)*params(55)*params(53)));
  g1(37,25)=1-params(37)*params(54);
  g1(37,27)=(-(params(53)*params(37)*(params(55)-params(54))));
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],37,1369);
end
end
