function [residual, g1, g2] = US_FM95_static(y, x, params)
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

residual = zeros( 44, 1);

%
% Model equations
%

lhs =y(8);
rhs =y(5)+params(41)/params(44);
residual(1)= lhs-rhs;
lhs =y(9);
rhs =0.25*(y(6)+y(6)+y(26)+y(27));
residual(2)= lhs-rhs;
lhs =y(10);
rhs =y(6);
residual(3)= lhs-rhs;
lhs =y(11);
rhs =y(3);
residual(4)= lhs-rhs;
lhs =y(12);
rhs =y(3);
residual(5)= lhs-rhs;
lhs =y(8);
rhs =params(32)*x(3)+params(31)*y(21)+params(30)*y(20)+params(29)*y(19)+y(12)*params(28)+params(27)*y(30)+params(26)*y(29)+params(25)*y(28)+y(12)*params(24)+y(12)*params(23)+params(22)*y(18)+params(21)*y(17)+params(20)*y(16)+y(11)*params(19)+params(18)*y(33)+params(17)*y(32)+params(16)*y(31)+y(11)*params(15)+y(11)*params(14)+params(13)*y(15)+params(12)*y(14)+params(11)*y(13)+y(10)*params(10)+y(10)*params(6)+y(10)*params(5)+y(8)*params(1)+params(2)*y(34)+params(3)*y(35)+params(4)*y(36)+params(7)*y(37)+params(8)*y(38)+params(9)*y(39);
residual(6)= lhs-rhs;
lhs =y(1);
rhs =params(36)*y(2)+y(2)*params(37)+params(38)*y(40)+params(39)*y(41);
residual(7)= lhs-rhs;
lhs =y(2)-y(1);
rhs =x(1)+params(36)*(y(4)+y(3)*params(45))+params(37)*(y(4)+y(3)*params(45))+params(38)*(y(22)+params(45)*y(23))+params(39)*(y(24)+params(45)*y(25));
residual(8)= lhs-rhs;
lhs =y(4);
rhs =params(36)*(y(2)-y(1))+params(37)*(y(2)-y(1))+params(38)*(y(40)-y(42))+params(39)*(y(41)-y(43));
residual(9)= lhs-rhs;
lhs =y(3);
rhs =x(2)+params(44)*y(7)+params(41)+y(3)*params(42)+params(43)*y(44);
residual(10)= lhs-rhs;
lhs =y(7);
rhs =y(5)-y(6);
residual(11)= lhs-rhs;
residual(12) = y(6);
lhs =y(13);
rhs =y(10);
residual(13)= lhs-rhs;
lhs =y(14);
rhs =y(13);
residual(14)= lhs-rhs;
lhs =y(15);
rhs =y(14);
residual(15)= lhs-rhs;
lhs =y(16);
rhs =y(11);
residual(16)= lhs-rhs;
lhs =y(17);
rhs =y(16);
residual(17)= lhs-rhs;
lhs =y(18);
rhs =y(17);
residual(18)= lhs-rhs;
lhs =y(19);
rhs =y(12);
residual(19)= lhs-rhs;
lhs =y(20);
rhs =y(19);
residual(20)= lhs-rhs;
lhs =y(21);
rhs =y(20);
residual(21)= lhs-rhs;
lhs =y(22);
rhs =y(4);
residual(22)= lhs-rhs;
lhs =y(23);
rhs =y(3);
residual(23)= lhs-rhs;
lhs =y(24);
rhs =y(22);
residual(24)= lhs-rhs;
lhs =y(25);
rhs =y(23);
residual(25)= lhs-rhs;
lhs =y(26);
rhs =y(6);
residual(26)= lhs-rhs;
lhs =y(27);
rhs =y(26);
residual(27)= lhs-rhs;
lhs =y(28);
rhs =y(12);
residual(28)= lhs-rhs;
lhs =y(29);
rhs =y(28);
residual(29)= lhs-rhs;
lhs =y(30);
rhs =y(29);
residual(30)= lhs-rhs;
lhs =y(31);
rhs =y(11);
residual(31)= lhs-rhs;
lhs =y(32);
rhs =y(31);
residual(32)= lhs-rhs;
lhs =y(33);
rhs =y(32);
residual(33)= lhs-rhs;
lhs =y(34);
rhs =y(8);
residual(34)= lhs-rhs;
lhs =y(35);
rhs =y(34);
residual(35)= lhs-rhs;
lhs =y(36);
rhs =y(35);
residual(36)= lhs-rhs;
lhs =y(37);
rhs =y(10);
residual(37)= lhs-rhs;
lhs =y(38);
rhs =y(37);
residual(38)= lhs-rhs;
lhs =y(39);
rhs =y(38);
residual(39)= lhs-rhs;
lhs =y(40);
rhs =y(2);
residual(40)= lhs-rhs;
lhs =y(41);
rhs =y(40);
residual(41)= lhs-rhs;
lhs =y(42);
rhs =y(1);
residual(42)= lhs-rhs;
lhs =y(43);
rhs =y(42);
residual(43)= lhs-rhs;
lhs =y(44);
rhs =y(3);
residual(44)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(44, 44);

  %
  % Jacobian matrix
  %

  g1(1,5)=(-1);
  g1(1,8)=1;
  g1(2,6)=(-0.5);
  g1(2,9)=1;
  g1(2,26)=(-0.25);
  g1(2,27)=(-0.25);
  g1(3,6)=(-1);
  g1(3,10)=1;
  g1(4,3)=(-1);
  g1(4,11)=1;
  g1(5,3)=(-1);
  g1(5,12)=1;
  g1(6,8)=1-params(1);
  g1(6,10)=(-(params(10)+params(6)+params(5)));
  g1(6,11)=(-(params(19)+params(15)+params(14)));
  g1(6,12)=(-(params(28)+params(24)+params(23)));
  g1(6,13)=(-params(11));
  g1(6,14)=(-params(12));
  g1(6,15)=(-params(13));
  g1(6,16)=(-params(20));
  g1(6,17)=(-params(21));
  g1(6,18)=(-params(22));
  g1(6,19)=(-params(29));
  g1(6,20)=(-params(30));
  g1(6,21)=(-params(31));
  g1(6,28)=(-params(25));
  g1(6,29)=(-params(26));
  g1(6,30)=(-params(27));
  g1(6,31)=(-params(16));
  g1(6,32)=(-params(17));
  g1(6,33)=(-params(18));
  g1(6,34)=(-params(2));
  g1(6,35)=(-params(3));
  g1(6,36)=(-params(4));
  g1(6,37)=(-params(7));
  g1(6,38)=(-params(8));
  g1(6,39)=(-params(9));
  g1(7,1)=1;
  g1(7,2)=(-(params(36)+params(37)));
  g1(7,40)=(-params(38));
  g1(7,41)=(-params(39));
  g1(8,1)=(-1);
  g1(8,2)=1;
  g1(8,3)=(-(params(36)*params(45)+params(37)*params(45)));
  g1(8,4)=(-(params(36)+params(37)));
  g1(8,22)=(-params(38));
  g1(8,23)=(-(params(38)*params(45)));
  g1(8,24)=(-params(39));
  g1(8,25)=(-(params(39)*params(45)));
  g1(9,1)=(-((-params(36))-params(37)));
  g1(9,2)=(-(params(36)+params(37)));
  g1(9,4)=1;
  g1(9,40)=(-params(38));
  g1(9,41)=(-params(39));
  g1(9,42)=params(38);
  g1(9,43)=params(39);
  g1(10,3)=1-params(42);
  g1(10,7)=(-params(44));
  g1(10,44)=(-params(43));
  g1(11,5)=(-1);
  g1(11,6)=1;
  g1(11,7)=1;
  g1(12,6)=1;
  g1(13,10)=(-1);
  g1(13,13)=1;
  g1(14,13)=(-1);
  g1(14,14)=1;
  g1(15,14)=(-1);
  g1(15,15)=1;
  g1(16,11)=(-1);
  g1(16,16)=1;
  g1(17,16)=(-1);
  g1(17,17)=1;
  g1(18,17)=(-1);
  g1(18,18)=1;
  g1(19,12)=(-1);
  g1(19,19)=1;
  g1(20,19)=(-1);
  g1(20,20)=1;
  g1(21,20)=(-1);
  g1(21,21)=1;
  g1(22,4)=(-1);
  g1(22,22)=1;
  g1(23,3)=(-1);
  g1(23,23)=1;
  g1(24,22)=(-1);
  g1(24,24)=1;
  g1(25,23)=(-1);
  g1(25,25)=1;
  g1(26,6)=(-1);
  g1(26,26)=1;
  g1(27,26)=(-1);
  g1(27,27)=1;
  g1(28,12)=(-1);
  g1(28,28)=1;
  g1(29,28)=(-1);
  g1(29,29)=1;
  g1(30,29)=(-1);
  g1(30,30)=1;
  g1(31,11)=(-1);
  g1(31,31)=1;
  g1(32,31)=(-1);
  g1(32,32)=1;
  g1(33,32)=(-1);
  g1(33,33)=1;
  g1(34,8)=(-1);
  g1(34,34)=1;
  g1(35,34)=(-1);
  g1(35,35)=1;
  g1(36,35)=(-1);
  g1(36,36)=1;
  g1(37,10)=(-1);
  g1(37,37)=1;
  g1(38,37)=(-1);
  g1(38,38)=1;
  g1(39,38)=(-1);
  g1(39,39)=1;
  g1(40,2)=(-1);
  g1(40,40)=1;
  g1(41,40)=(-1);
  g1(41,41)=1;
  g1(42,1)=(-1);
  g1(42,42)=1;
  g1(43,42)=(-1);
  g1(43,43)=1;
  g1(44,3)=(-1);
  g1(44,44)=1;
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],44,1936);
end
end
