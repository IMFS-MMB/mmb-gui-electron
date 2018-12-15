function [residual, g1, g2, g3] = EA_CW05ta_static(y, x, params)
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

residual = zeros( 55, 1);

%
% Model equations
%

lhs =y(15);
rhs =y(10)*100;
residual(1)= lhs-rhs;
lhs =y(16);
rhs =100*y(9);
residual(2)= lhs-rhs;
lhs =y(17);
rhs =100*y(6)*4;
residual(3)= lhs-rhs;
lhs =y(18);
rhs =100*y(1);
residual(4)= lhs-rhs;
lhs =y(19);
rhs =100*y(1);
residual(5)= lhs-rhs;
lhs =y(15);
rhs =params(32)*x(3)+y(19)*params(31)+y(19)*params(30)+y(19)*params(29)+y(19)*params(28)+y(19)*params(27)+y(19)*params(26)+y(19)*params(25)+y(19)*params(24)+y(19)*params(23)+y(18)*params(22)+y(18)*params(21)+y(18)*params(20)+y(18)*params(19)+y(18)*params(18)+y(18)*params(17)+y(18)*params(16)+y(18)*params(15)+y(18)*params(14)+y(17)*params(13)+y(17)*params(12)+y(17)*params(11)+y(17)*params(10)+y(17)*params(6)+y(17)*params(5)+y(15)*params(1)+y(15)*params(2)+y(15)*params(3)+y(15)*params(4)+y(17)*params(7)+y(17)*params(8)+y(17)*params(9);
residual(6)= lhs-rhs;
lhs =y(1);
rhs =y(1)*params(42)+params(43)*y(2)+params(44)*y(14)+params(45)*x(2);
residual(7)= lhs-rhs;
lhs =y(2);
rhs =y(1);
residual(8)= lhs-rhs;
lhs =y(3);
rhs =params(46)*x(1)+y(6)*(params(37)+params(38)+params(39))+y(6)*(params(38)+params(39))+y(6)*params(39)+params(40)*(y(1)*params(36)+y(1)*params(37)+y(1)*params(38)+y(1)*params(39));
residual(9)= lhs-rhs;
lhs =y(4);
rhs =y(3);
residual(10)= lhs-rhs;
lhs =y(5);
rhs =y(4);
residual(11)= lhs-rhs;
lhs =y(6);
rhs =(y(3)*params(36)+y(3)*params(37)+params(38)*y(4)+params(39)*y(5)-y(6)*(params(38)+params(39))-params(39)*y(7))/(params(37)+params(38)+params(39));
residual(12)= lhs-rhs;
lhs =y(7);
rhs =y(6);
residual(13)= lhs-rhs;
lhs =y(8);
rhs =y(7);
residual(14)= lhs-rhs;
lhs =y(9);
rhs =y(8)+y(7)+y(6)+y(6);
residual(15)= lhs-rhs;
lhs =y(11);
rhs =y(10);
residual(16)= lhs-rhs;
residual(17) = y(12);
lhs =y(13);
rhs =(y(10)+y(10)+y(10)+y(10)+y(10)+y(10)+y(10)+y(10))/8;
residual(18)= lhs-rhs;
lhs =y(14);
rhs =y(13)-(y(6)+y(6)+y(6)+y(6)+y(6)+y(6)+y(6)+y(6))/2;
residual(19)= lhs-rhs;
lhs =y(20);
rhs =y(17);
residual(20)= lhs-rhs;
lhs =y(21);
rhs =y(17);
residual(21)= lhs-rhs;
lhs =y(22);
rhs =y(17);
residual(22)= lhs-rhs;
lhs =y(23);
rhs =y(18);
residual(23)= lhs-rhs;
lhs =y(24);
rhs =y(18);
residual(24)= lhs-rhs;
lhs =y(25);
rhs =y(18);
residual(25)= lhs-rhs;
lhs =y(26);
rhs =y(19);
residual(26)= lhs-rhs;
lhs =y(27);
rhs =y(19);
residual(27)= lhs-rhs;
lhs =y(28);
rhs =y(19);
residual(28)= lhs-rhs;
lhs =y(29);
rhs =y(6);
residual(29)= lhs-rhs;
lhs =y(30);
rhs =y(6);
residual(30)= lhs-rhs;
lhs =y(31);
rhs =y(1);
residual(31)= lhs-rhs;
lhs =y(32);
rhs =y(1);
residual(32)= lhs-rhs;
lhs =y(33);
rhs =y(10);
residual(33)= lhs-rhs;
lhs =y(34);
rhs =y(10);
residual(34)= lhs-rhs;
lhs =y(35);
rhs =y(10);
residual(35)= lhs-rhs;
lhs =y(36);
rhs =y(10);
residual(36)= lhs-rhs;
lhs =y(37);
rhs =y(10);
residual(37)= lhs-rhs;
lhs =y(38);
rhs =y(10);
residual(38)= lhs-rhs;
lhs =y(39);
rhs =y(6);
residual(39)= lhs-rhs;
lhs =y(40);
rhs =y(6);
residual(40)= lhs-rhs;
lhs =y(41);
rhs =y(6);
residual(41)= lhs-rhs;
lhs =y(42);
rhs =y(6);
residual(42)= lhs-rhs;
lhs =y(43);
rhs =y(6);
residual(43)= lhs-rhs;
lhs =y(44);
rhs =y(19);
residual(44)= lhs-rhs;
lhs =y(45);
rhs =y(19);
residual(45)= lhs-rhs;
lhs =y(46);
rhs =y(19);
residual(46)= lhs-rhs;
lhs =y(47);
rhs =y(18);
residual(47)= lhs-rhs;
lhs =y(48);
rhs =y(18);
residual(48)= lhs-rhs;
lhs =y(49);
rhs =y(18);
residual(49)= lhs-rhs;
lhs =y(50);
rhs =y(15);
residual(50)= lhs-rhs;
lhs =y(51);
rhs =y(15);
residual(51)= lhs-rhs;
lhs =y(52);
rhs =y(15);
residual(52)= lhs-rhs;
lhs =y(53);
rhs =y(17);
residual(53)= lhs-rhs;
lhs =y(54);
rhs =y(17);
residual(54)= lhs-rhs;
lhs =y(55);
rhs =y(17);
residual(55)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(55, 55);

  %
  % Jacobian matrix
  %

  g1(1,10)=(-100);
  g1(1,15)=1;
  g1(2,9)=(-100);
  g1(2,16)=1;
  g1(3,6)=(-400);
  g1(3,17)=1;
  g1(4,1)=(-100);
  g1(4,18)=1;
  g1(5,1)=(-100);
  g1(5,19)=1;
  g1(6,15)=1-(params(4)+params(3)+params(1)+params(2));
  g1(6,17)=(-(params(13)+params(12)+params(11)+params(10)+params(9)+params(8)+params(7)+params(6)+params(5)));
  g1(6,18)=(-(params(22)+params(21)+params(20)+params(19)+params(18)+params(17)+params(16)+params(15)+params(14)));
  g1(6,19)=(-(params(31)+params(30)+params(29)+params(28)+params(27)+params(26)+params(25)+params(24)+params(23)));
  g1(7,1)=1-params(42);
  g1(7,2)=(-params(43));
  g1(7,14)=(-params(44));
  g1(8,1)=(-1);
  g1(8,2)=1;
  g1(9,1)=(-(params(40)*(params(39)+params(38)+params(37)+params(36))));
  g1(9,3)=1;
  g1(9,6)=(-(params(39)+params(37)+params(38)+params(39)+params(38)+params(39)));
  g1(10,3)=(-1);
  g1(10,4)=1;
  g1(11,4)=(-1);
  g1(11,5)=1;
  g1(12,3)=(-((params(37)+params(36))/(params(37)+params(38)+params(39))));
  g1(12,4)=(-(params(38)/(params(37)+params(38)+params(39))));
  g1(12,5)=(-(params(39)/(params(37)+params(38)+params(39))));
  g1(12,6)=1-(-(params(38)+params(39)))/(params(37)+params(38)+params(39));
  g1(12,7)=(-((-params(39))/(params(37)+params(38)+params(39))));
  g1(13,6)=(-1);
  g1(13,7)=1;
  g1(14,7)=(-1);
  g1(14,8)=1;
  g1(15,6)=(-2);
  g1(15,7)=(-1);
  g1(15,8)=(-1);
  g1(15,9)=1;
  g1(16,10)=(-1);
  g1(16,11)=1;
  g1(17,12)=1;
  g1(18,10)=(-1);
  g1(18,13)=1;
  g1(19,6)=4;
  g1(19,13)=(-1);
  g1(19,14)=1;
  g1(20,17)=(-1);
  g1(20,20)=1;
  g1(21,17)=(-1);
  g1(21,21)=1;
  g1(22,17)=(-1);
  g1(22,22)=1;
  g1(23,18)=(-1);
  g1(23,23)=1;
  g1(24,18)=(-1);
  g1(24,24)=1;
  g1(25,18)=(-1);
  g1(25,25)=1;
  g1(26,19)=(-1);
  g1(26,26)=1;
  g1(27,19)=(-1);
  g1(27,27)=1;
  g1(28,19)=(-1);
  g1(28,28)=1;
  g1(29,6)=(-1);
  g1(29,29)=1;
  g1(30,6)=(-1);
  g1(30,30)=1;
  g1(31,1)=(-1);
  g1(31,31)=1;
  g1(32,1)=(-1);
  g1(32,32)=1;
  g1(33,10)=(-1);
  g1(33,33)=1;
  g1(34,10)=(-1);
  g1(34,34)=1;
  g1(35,10)=(-1);
  g1(35,35)=1;
  g1(36,10)=(-1);
  g1(36,36)=1;
  g1(37,10)=(-1);
  g1(37,37)=1;
  g1(38,10)=(-1);
  g1(38,38)=1;
  g1(39,6)=(-1);
  g1(39,39)=1;
  g1(40,6)=(-1);
  g1(40,40)=1;
  g1(41,6)=(-1);
  g1(41,41)=1;
  g1(42,6)=(-1);
  g1(42,42)=1;
  g1(43,6)=(-1);
  g1(43,43)=1;
  g1(44,19)=(-1);
  g1(44,44)=1;
  g1(45,19)=(-1);
  g1(45,45)=1;
  g1(46,19)=(-1);
  g1(46,46)=1;
  g1(47,18)=(-1);
  g1(47,47)=1;
  g1(48,18)=(-1);
  g1(48,48)=1;
  g1(49,18)=(-1);
  g1(49,49)=1;
  g1(50,15)=(-1);
  g1(50,50)=1;
  g1(51,15)=(-1);
  g1(51,51)=1;
  g1(52,15)=(-1);
  g1(52,52)=1;
  g1(53,17)=(-1);
  g1(53,53)=1;
  g1(54,17)=(-1);
  g1(54,54)=1;
  g1(55,17)=(-1);
  g1(55,55)=1;
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],55,3025);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],55,166375);
end
end
end
end
