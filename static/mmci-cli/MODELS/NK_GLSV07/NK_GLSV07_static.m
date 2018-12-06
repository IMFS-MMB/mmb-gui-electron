function [residual, g1, g2, g3] = NK_GLSV07_static(y, x, params)
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

residual = zeros( 44, 1);

%
% Model equations
%

T169 = 1-params(40)+params(40)*params(35)/(1-params(38));
lhs =y(16);
rhs =4*y(3);
residual(1)= lhs-rhs;
lhs =y(17);
rhs =y(4)+y(4)+y(4)+y(4);
residual(2)= lhs-rhs;
lhs =y(18);
rhs =4*y(4);
residual(3)= lhs-rhs;
lhs =y(19);
rhs =y(8)-y(14);
residual(4)= lhs-rhs;
lhs =y(20);
rhs =y(8);
residual(5)= lhs-rhs;
lhs =y(21);
rhs =y(9);
residual(6)= lhs-rhs;
lhs =y(16);
rhs =params(32)*x(1)+y(20)*params(31)+y(20)*params(30)+y(20)*params(29)+y(20)*params(28)+y(20)*params(27)+y(20)*params(26)+y(20)*params(25)+y(20)*params(24)+y(20)*params(23)+y(19)*params(22)+y(19)*params(21)+y(19)*params(20)+y(19)*params(19)+y(19)*params(18)+y(19)*params(17)+y(19)*params(16)+y(19)*params(15)+y(19)*params(14)+y(18)*params(13)+y(18)*params(12)+y(18)*params(11)+y(18)*params(10)+y(18)*params(6)+y(18)*params(5)+y(16)*params(1)+y(16)*params(2)+y(16)*params(3)+y(16)*params(4)+y(18)*params(7)+y(18)*params(8)+y(18)*params(9);
residual(7)= lhs-rhs;
lhs =y(21);
rhs =params(34)*x(2);
residual(8)= lhs-rhs;
lhs =y(5);
rhs =params(40)*y(1)*(1-params(35))/(1-params(38))+y(5)*T169-params(40)*y(2)*params(37)/(1-params(38))-params(40)*y(7)/(1-params(38));
residual(9)= lhs-rhs;
lhs =y(4);
rhs =y(1)*params(46)*(params(35)+params(55))+y(4)*params(36)+y(2)*params(46)-y(5)*params(35)*params(46);
residual(10)= lhs-rhs;
lhs =y(2)-y(1)*params(43)+y(3)/params(50);
rhs =y(7)*params(44)*params(52)*(params(49)-1)+y(2)+y(4)/params(50)-y(1)*params(43);
residual(11)= lhs-rhs;
lhs =y(3)*(1-params(38))*params(41)+y(1)*(1-params(35))-y(2)*params(37)-y(5)*(1-params(38)-params(35));
rhs =y(7)*(1-params(36)*params(49))+y(4)*(1-params(38))*params(41)+y(1)*(params(54)*(1+params(55))+(1-params(35))*params(36))+y(2)*(params(54)-params(37)*params(36))-y(5)*(params(54)+params(36)*(1-params(38)-params(35)));
residual(12)= lhs-rhs;
lhs =y(6);
rhs =y(7)*(1+params(48))*(1-params(52))+y(6)*(1+params(48))*(1-params(51));
residual(13)= lhs-rhs;
lhs =y(7);
rhs =y(9)+y(7)*params(49);
residual(14)= lhs-rhs;
lhs =y(8);
rhs =y(1)*(1-params(35))+y(5)*params(35);
residual(15)= lhs-rhs;
lhs =y(12);
rhs =(1-params(35))*params(40)*y(10)/(1-params(38))+T169*y(12)-params(37)*params(40)*y(11)/(1-params(38))-params(40)*y(7)/(1-params(38));
residual(16)= lhs-rhs;
lhs =0;
rhs =(params(35)+params(55))*y(10)+y(11)-params(35)*y(12);
residual(17)= lhs-rhs;
lhs =y(11)-params(43)*y(10)+y(15)/params(50);
rhs =y(7)*params(44)*params(52)*(params(49)-1)+y(11)-params(43)*y(10);
residual(18)= lhs-rhs;
lhs =(1-params(38))*params(41)*y(15)+(1-params(35))*y(10)-params(37)*y(11)-(1-params(38)-params(35))*y(12);
rhs =y(7)*(1-params(36)*params(49))+(params(54)*(1+params(55))+(1-params(35))*params(36))*y(10)+(params(54)-params(37)*params(36))*y(11)-(params(54)+params(36)*(1-params(38)-params(35)))*y(12);
residual(19)= lhs-rhs;
lhs =y(13);
rhs =y(7)*(1+params(48))*(1-params(52))+(1+params(48))*(1-params(51))*y(13);
residual(20)= lhs-rhs;
lhs =y(14);
rhs =params(35)*y(12)+(1-params(35))*y(10);
residual(21)= lhs-rhs;
lhs =y(22);
rhs =y(18);
residual(22)= lhs-rhs;
lhs =y(23);
rhs =y(18);
residual(23)= lhs-rhs;
lhs =y(24);
rhs =y(18);
residual(24)= lhs-rhs;
lhs =y(25);
rhs =y(19);
residual(25)= lhs-rhs;
lhs =y(26);
rhs =y(19);
residual(26)= lhs-rhs;
lhs =y(27);
rhs =y(19);
residual(27)= lhs-rhs;
lhs =y(28);
rhs =y(20);
residual(28)= lhs-rhs;
lhs =y(29);
rhs =y(20);
residual(29)= lhs-rhs;
lhs =y(30);
rhs =y(20);
residual(30)= lhs-rhs;
lhs =y(31);
rhs =y(4);
residual(31)= lhs-rhs;
lhs =y(32);
rhs =y(4);
residual(32)= lhs-rhs;
lhs =y(33);
rhs =y(20);
residual(33)= lhs-rhs;
lhs =y(34);
rhs =y(20);
residual(34)= lhs-rhs;
lhs =y(35);
rhs =y(20);
residual(35)= lhs-rhs;
lhs =y(36);
rhs =y(19);
residual(36)= lhs-rhs;
lhs =y(37);
rhs =y(19);
residual(37)= lhs-rhs;
lhs =y(38);
rhs =y(19);
residual(38)= lhs-rhs;
lhs =y(39);
rhs =y(16);
residual(39)= lhs-rhs;
lhs =y(40);
rhs =y(16);
residual(40)= lhs-rhs;
lhs =y(41);
rhs =y(16);
residual(41)= lhs-rhs;
lhs =y(42);
rhs =y(18);
residual(42)= lhs-rhs;
lhs =y(43);
rhs =y(18);
residual(43)= lhs-rhs;
lhs =y(44);
rhs =y(18);
residual(44)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(44, 44);

  %
  % Jacobian matrix
  %

  g1(1,3)=(-4);
  g1(1,16)=1;
  g1(2,4)=(-4);
  g1(2,17)=1;
  g1(3,4)=(-4);
  g1(3,18)=1;
  g1(4,8)=(-1);
  g1(4,14)=1;
  g1(4,19)=1;
  g1(5,8)=(-1);
  g1(5,20)=1;
  g1(6,9)=(-1);
  g1(6,21)=1;
  g1(7,16)=1-(params(4)+params(3)+params(1)+params(2));
  g1(7,18)=(-(params(13)+params(12)+params(11)+params(10)+params(9)+params(8)+params(7)+params(6)+params(5)));
  g1(7,19)=(-(params(22)+params(21)+params(20)+params(19)+params(18)+params(17)+params(16)+params(15)+params(14)));
  g1(7,20)=(-(params(31)+params(30)+params(29)+params(28)+params(27)+params(26)+params(25)+params(24)+params(23)));
  g1(8,21)=1;
  g1(9,1)=(-(params(40)*(1-params(35))/(1-params(38))));
  g1(9,2)=params(40)*params(37)/(1-params(38));
  g1(9,5)=1-T169;
  g1(9,7)=params(40)/(1-params(38));
  g1(10,1)=(-(params(46)*(params(35)+params(55))));
  g1(10,2)=(-params(46));
  g1(10,4)=1-params(36);
  g1(10,5)=params(35)*params(46);
  g1(11,3)=1/params(50);
  g1(11,4)=(-(1/params(50)));
  g1(11,7)=(-(params(44)*params(52)*(params(49)-1)));
  g1(12,1)=1-params(35)-(params(54)*(1+params(55))+(1-params(35))*params(36));
  g1(12,2)=(-params(37))-(params(54)-params(37)*params(36));
  g1(12,3)=(1-params(38))*params(41);
  g1(12,4)=(-((1-params(38))*params(41)));
  g1(12,5)=(-(1-params(38)-params(35)))-(-(params(54)+params(36)*(1-params(38)-params(35))));
  g1(12,7)=(-(1-params(36)*params(49)));
  g1(13,6)=1-(1+params(48))*(1-params(51));
  g1(13,7)=(-((1+params(48))*(1-params(52))));
  g1(14,7)=1-params(49);
  g1(14,9)=(-1);
  g1(15,1)=(-(1-params(35)));
  g1(15,5)=(-params(35));
  g1(15,8)=1;
  g1(16,7)=params(40)/(1-params(38));
  g1(16,10)=(-(params(40)*(1-params(35))/(1-params(38))));
  g1(16,11)=params(40)*params(37)/(1-params(38));
  g1(16,12)=1-T169;
  g1(17,10)=(-(params(35)+params(55)));
  g1(17,11)=(-1);
  g1(17,12)=params(35);
  g1(18,7)=(-(params(44)*params(52)*(params(49)-1)));
  g1(18,15)=1/params(50);
  g1(19,7)=(-(1-params(36)*params(49)));
  g1(19,10)=1-params(35)-(params(54)*(1+params(55))+(1-params(35))*params(36));
  g1(19,11)=(-params(37))-(params(54)-params(37)*params(36));
  g1(19,12)=(-(1-params(38)-params(35)))-(-(params(54)+params(36)*(1-params(38)-params(35))));
  g1(19,15)=(1-params(38))*params(41);
  g1(20,7)=(-((1+params(48))*(1-params(52))));
  g1(20,13)=1-(1+params(48))*(1-params(51));
  g1(21,10)=(-(1-params(35)));
  g1(21,12)=(-params(35));
  g1(21,14)=1;
  g1(22,18)=(-1);
  g1(22,22)=1;
  g1(23,18)=(-1);
  g1(23,23)=1;
  g1(24,18)=(-1);
  g1(24,24)=1;
  g1(25,19)=(-1);
  g1(25,25)=1;
  g1(26,19)=(-1);
  g1(26,26)=1;
  g1(27,19)=(-1);
  g1(27,27)=1;
  g1(28,20)=(-1);
  g1(28,28)=1;
  g1(29,20)=(-1);
  g1(29,29)=1;
  g1(30,20)=(-1);
  g1(30,30)=1;
  g1(31,4)=(-1);
  g1(31,31)=1;
  g1(32,4)=(-1);
  g1(32,32)=1;
  g1(33,20)=(-1);
  g1(33,33)=1;
  g1(34,20)=(-1);
  g1(34,34)=1;
  g1(35,20)=(-1);
  g1(35,35)=1;
  g1(36,19)=(-1);
  g1(36,36)=1;
  g1(37,19)=(-1);
  g1(37,37)=1;
  g1(38,19)=(-1);
  g1(38,38)=1;
  g1(39,16)=(-1);
  g1(39,39)=1;
  g1(40,16)=(-1);
  g1(40,40)=1;
  g1(41,16)=(-1);
  g1(41,41)=1;
  g1(42,18)=(-1);
  g1(42,42)=1;
  g1(43,18)=(-1);
  g1(43,43)=1;
  g1(44,18)=(-1);
  g1(44,44)=1;
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],44,1936);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],44,85184);
end
end
end
end
