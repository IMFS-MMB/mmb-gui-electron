function [residual, g1, g2] = US_IR11_static(y, x, params)
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

residual = zeros( 38, 1);

%
% Model equations
%

T168 = params(40)^2+params(41)*params(34)^2;
lhs =y(11);
rhs =y(5)*4;
residual(1)= lhs-rhs;
lhs =y(12);
rhs =y(6)+y(6)+y(25)+y(26);
residual(2)= lhs-rhs;
lhs =y(13);
rhs =4*y(6);
residual(3)= lhs-rhs;
lhs =y(15);
rhs =y(10);
residual(4)= lhs-rhs;
lhs =y(14);
rhs =y(3);
residual(5)= lhs-rhs;
lhs =y(11);
rhs =params(32)*x(4)+params(31)*y(24)+params(30)*y(23)+params(29)*y(22)+y(14)*params(28)+params(27)*y(29)+params(26)*y(28)+params(25)*y(27)+y(14)*params(24)+y(14)*params(23)+params(22)*y(21)+params(21)*y(20)+params(20)*y(19)+y(15)*params(19)+params(18)*y(32)+params(17)*y(31)+params(16)*y(30)+y(15)*params(15)+y(15)*params(14)+params(13)*y(18)+params(12)*y(17)+params(11)*y(16)+y(13)*params(10)+y(13)*params(6)+y(13)*params(5)+y(11)*params(1)+params(2)*y(33)+params(3)*y(34)+params(4)*y(35)+params(7)*y(36)+params(8)*y(37)+params(9)*y(38);
residual(6)= lhs-rhs;
lhs =y(1);
rhs =y(1)*params(38)+x(1);
residual(7)= lhs-rhs;
lhs =(params(40)-params(41)*params(34))*(params(40)-params(34))*y(2);
rhs =y(3)*params(40)*params(34)-y(3)*T168+y(3)*params(40)*params(41)*params(34)+y(1)*(params(40)-params(34))*(params(40)-params(38)*params(41)*params(34))-params(40)*params(34)*y(4);
residual(8)= lhs-rhs;
lhs =y(2);
rhs =y(5)+y(2)-y(6);
residual(9)= lhs-rhs;
lhs =y(7);
rhs =y(7)*params(39)+x(2);
residual(10)= lhs-rhs;
lhs =y(4);
rhs =x(3);
residual(11)= lhs-rhs;
lhs =y(6)*(1+params(41)*params(35));
rhs =y(7)+y(6)*params(35)+y(6)*params(41)-y(2)*params(42)+y(1)*params(42);
residual(12)= lhs-rhs;
lhs =y(8);
rhs =y(4);
residual(13)= lhs-rhs;
lhs =0;
rhs =params(40)*params(34)*y(9)-T168*y(9)+params(40)*params(41)*params(34)*y(9)+y(1)*params(41)*params(34)*(params(40)-params(34))*(1-params(38))-params(40)*params(34)*y(4);
residual(14)= lhs-rhs;
lhs =y(10);
rhs =y(3)-y(9);
residual(15)= lhs-rhs;
lhs =y(16);
rhs =y(13);
residual(16)= lhs-rhs;
lhs =y(17);
rhs =y(16);
residual(17)= lhs-rhs;
lhs =y(18);
rhs =y(17);
residual(18)= lhs-rhs;
lhs =y(19);
rhs =y(15);
residual(19)= lhs-rhs;
lhs =y(20);
rhs =y(19);
residual(20)= lhs-rhs;
lhs =y(21);
rhs =y(20);
residual(21)= lhs-rhs;
lhs =y(22);
rhs =y(14);
residual(22)= lhs-rhs;
lhs =y(23);
rhs =y(22);
residual(23)= lhs-rhs;
lhs =y(24);
rhs =y(23);
residual(24)= lhs-rhs;
lhs =y(25);
rhs =y(6);
residual(25)= lhs-rhs;
lhs =y(26);
rhs =y(25);
residual(26)= lhs-rhs;
lhs =y(27);
rhs =y(14);
residual(27)= lhs-rhs;
lhs =y(28);
rhs =y(27);
residual(28)= lhs-rhs;
lhs =y(29);
rhs =y(28);
residual(29)= lhs-rhs;
lhs =y(30);
rhs =y(15);
residual(30)= lhs-rhs;
lhs =y(31);
rhs =y(30);
residual(31)= lhs-rhs;
lhs =y(32);
rhs =y(31);
residual(32)= lhs-rhs;
lhs =y(33);
rhs =y(11);
residual(33)= lhs-rhs;
lhs =y(34);
rhs =y(33);
residual(34)= lhs-rhs;
lhs =y(35);
rhs =y(34);
residual(35)= lhs-rhs;
lhs =y(36);
rhs =y(13);
residual(36)= lhs-rhs;
lhs =y(37);
rhs =y(36);
residual(37)= lhs-rhs;
lhs =y(38);
rhs =y(37);
residual(38)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(38, 38);

  %
  % Jacobian matrix
  %

  g1(1,5)=(-4);
  g1(1,11)=1;
  g1(2,6)=(-2);
  g1(2,12)=1;
  g1(2,25)=(-1);
  g1(2,26)=(-1);
  g1(3,6)=(-4);
  g1(3,13)=1;
  g1(4,10)=(-1);
  g1(4,15)=1;
  g1(5,3)=(-1);
  g1(5,14)=1;
  g1(6,11)=1-params(1);
  g1(6,13)=(-(params(10)+params(6)+params(5)));
  g1(6,14)=(-(params(28)+params(24)+params(23)));
  g1(6,15)=(-(params(19)+params(15)+params(14)));
  g1(6,16)=(-params(11));
  g1(6,17)=(-params(12));
  g1(6,18)=(-params(13));
  g1(6,19)=(-params(20));
  g1(6,20)=(-params(21));
  g1(6,21)=(-params(22));
  g1(6,22)=(-params(29));
  g1(6,23)=(-params(30));
  g1(6,24)=(-params(31));
  g1(6,27)=(-params(25));
  g1(6,28)=(-params(26));
  g1(6,29)=(-params(27));
  g1(6,30)=(-params(16));
  g1(6,31)=(-params(17));
  g1(6,32)=(-params(18));
  g1(6,33)=(-params(2));
  g1(6,34)=(-params(3));
  g1(6,35)=(-params(4));
  g1(6,36)=(-params(7));
  g1(6,37)=(-params(8));
  g1(6,38)=(-params(9));
  g1(7,1)=1-params(38);
  g1(8,1)=(-((params(40)-params(34))*(params(40)-params(38)*params(41)*params(34))));
  g1(8,2)=(params(40)-params(41)*params(34))*(params(40)-params(34));
  g1(8,3)=(-(params(40)*params(41)*params(34)+params(40)*params(34)-T168));
  g1(8,4)=params(40)*params(34);
  g1(9,5)=(-1);
  g1(9,6)=1;
  g1(10,7)=1-params(39);
  g1(11,4)=1;
  g1(12,1)=(-params(42));
  g1(12,2)=params(42);
  g1(12,6)=1+params(41)*params(35)-(params(41)+params(35));
  g1(12,7)=(-1);
  g1(13,4)=(-1);
  g1(13,8)=1;
  g1(14,1)=(-(params(41)*params(34)*(params(40)-params(34))*(1-params(38))));
  g1(14,4)=params(40)*params(34);
  g1(14,9)=(-(params(40)*params(41)*params(34)+params(40)*params(34)-T168));
  g1(15,3)=(-1);
  g1(15,9)=1;
  g1(15,10)=1;
  g1(16,13)=(-1);
  g1(16,16)=1;
  g1(17,16)=(-1);
  g1(17,17)=1;
  g1(18,17)=(-1);
  g1(18,18)=1;
  g1(19,15)=(-1);
  g1(19,19)=1;
  g1(20,19)=(-1);
  g1(20,20)=1;
  g1(21,20)=(-1);
  g1(21,21)=1;
  g1(22,14)=(-1);
  g1(22,22)=1;
  g1(23,22)=(-1);
  g1(23,23)=1;
  g1(24,23)=(-1);
  g1(24,24)=1;
  g1(25,6)=(-1);
  g1(25,25)=1;
  g1(26,25)=(-1);
  g1(26,26)=1;
  g1(27,14)=(-1);
  g1(27,27)=1;
  g1(28,27)=(-1);
  g1(28,28)=1;
  g1(29,28)=(-1);
  g1(29,29)=1;
  g1(30,15)=(-1);
  g1(30,30)=1;
  g1(31,30)=(-1);
  g1(31,31)=1;
  g1(32,31)=(-1);
  g1(32,32)=1;
  g1(33,11)=(-1);
  g1(33,33)=1;
  g1(34,33)=(-1);
  g1(34,34)=1;
  g1(35,34)=(-1);
  g1(35,35)=1;
  g1(36,13)=(-1);
  g1(36,36)=1;
  g1(37,36)=(-1);
  g1(37,37)=1;
  g1(38,37)=(-1);
  g1(38,38)=1;
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],38,1444);
end
end
