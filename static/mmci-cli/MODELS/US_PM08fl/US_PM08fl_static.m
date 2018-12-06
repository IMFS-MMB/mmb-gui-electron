function [residual, g1, g2] = US_PM08fl_static(y, x, params)
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

residual = zeros( 51, 1);

%
% Model equations
%

lhs =y(13);
rhs =y(7);
residual(1)= lhs-rhs;
lhs =y(14);
rhs =y(5);
residual(2)= lhs-rhs;
lhs =y(15);
rhs =y(4);
residual(3)= lhs-rhs;
lhs =y(16);
rhs =y(6);
residual(4)= lhs-rhs;
lhs =y(17);
rhs =y(6);
residual(5)= lhs-rhs;
lhs =y(13);
rhs =params(32)*x(6)+params(31)*y(26)+params(30)*y(25)+params(29)*y(24)+y(17)*params(28)+params(27)*y(32)+params(26)*y(31)+params(25)*y(30)+y(17)*params(24)+y(17)*params(23)+params(22)*y(23)+params(21)*y(22)+params(20)*y(21)+y(16)*params(19)+params(18)*y(35)+params(17)*y(34)+params(16)*y(33)+y(16)*params(15)+y(16)*params(14)+params(13)*y(20)+params(12)*y(19)+params(11)*y(18)+y(15)*params(10)+y(15)*params(6)+y(15)*params(5)+y(13)*params(1)+params(2)*y(36)+params(3)*y(37)+params(4)*y(38)+params(7)*y(39)+params(8)*y(40)+params(9)*y(41);
residual(6)= lhs-rhs;
lhs =y(3);
rhs =y(3)*params(36)+y(6)*params(37)+x(2);
residual(7)= lhs-rhs;
lhs =y(6);
rhs =x(3)+y(6)*params(40)+y(6)*params(41)-params(42)*(y(1)-y(2))-params(51)*(0.04*(y(11)+y(49))+0.08*(y(42)+y(48))+0.12*(y(43)+y(47))+0.16*(y(44)+y(46))+0.2*y(45));
residual(8)= lhs-rhs;
lhs =y(11);
rhs =x(5);
residual(9)= lhs-rhs;
lhs =y(4);
rhs =y(6)*params(44)+y(5)*(1-params(43))+params(43)*y(29)-x(4);
residual(10)= lhs-rhs;
lhs =y(1);
rhs =y(7)-y(4);
residual(11)= lhs-rhs;
lhs =y(2);
rhs =y(2)*(1-params(34))+x(1);
residual(12)= lhs-rhs;
lhs =y(5);
rhs =(y(4)+y(4)+y(50)+y(51))/4;
residual(13)= lhs-rhs;
lhs =y(8);
rhs =y(29);
residual(14)= lhs-rhs;
lhs =y(10);
rhs =y(4);
residual(15)= lhs-rhs;
lhs =y(9);
rhs =y(6);
residual(16)= lhs-rhs;
lhs =y(12);
rhs =params(51)*(0.04*(y(11)+y(49))+0.08*(y(42)+y(48))+0.12*(y(43)+y(47))+0.16*(y(44)+y(46))+0.2*y(45));
residual(17)= lhs-rhs;
lhs =y(18);
rhs =y(15);
residual(18)= lhs-rhs;
lhs =y(19);
rhs =y(18);
residual(19)= lhs-rhs;
lhs =y(20);
rhs =y(19);
residual(20)= lhs-rhs;
lhs =y(21);
rhs =y(16);
residual(21)= lhs-rhs;
lhs =y(22);
rhs =y(21);
residual(22)= lhs-rhs;
lhs =y(23);
rhs =y(22);
residual(23)= lhs-rhs;
lhs =y(24);
rhs =y(17);
residual(24)= lhs-rhs;
lhs =y(25);
rhs =y(24);
residual(25)= lhs-rhs;
lhs =y(26);
rhs =y(25);
residual(26)= lhs-rhs;
lhs =y(27);
rhs =y(5);
residual(27)= lhs-rhs;
lhs =y(28);
rhs =y(27);
residual(28)= lhs-rhs;
lhs =y(29);
rhs =y(28);
residual(29)= lhs-rhs;
lhs =y(30);
rhs =y(17);
residual(30)= lhs-rhs;
lhs =y(31);
rhs =y(30);
residual(31)= lhs-rhs;
lhs =y(32);
rhs =y(31);
residual(32)= lhs-rhs;
lhs =y(33);
rhs =y(16);
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
lhs =y(39);
rhs =y(15);
residual(39)= lhs-rhs;
lhs =y(40);
rhs =y(39);
residual(40)= lhs-rhs;
lhs =y(41);
rhs =y(40);
residual(41)= lhs-rhs;
lhs =y(42);
rhs =y(11);
residual(42)= lhs-rhs;
lhs =y(43);
rhs =y(42);
residual(43)= lhs-rhs;
lhs =y(44);
rhs =y(43);
residual(44)= lhs-rhs;
lhs =y(45);
rhs =y(44);
residual(45)= lhs-rhs;
lhs =y(46);
rhs =y(45);
residual(46)= lhs-rhs;
lhs =y(47);
rhs =y(46);
residual(47)= lhs-rhs;
lhs =y(48);
rhs =y(47);
residual(48)= lhs-rhs;
lhs =y(49);
rhs =y(48);
residual(49)= lhs-rhs;
lhs =y(50);
rhs =y(4);
residual(50)= lhs-rhs;
lhs =y(51);
rhs =y(50);
residual(51)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(51, 51);

  %
  % Jacobian matrix
  %

  g1(1,7)=(-1);
  g1(1,13)=1;
  g1(2,5)=(-1);
  g1(2,14)=1;
  g1(3,4)=(-1);
  g1(3,15)=1;
  g1(4,6)=(-1);
  g1(4,16)=1;
  g1(5,6)=(-1);
  g1(5,17)=1;
  g1(6,13)=1-params(1);
  g1(6,15)=(-(params(10)+params(6)+params(5)));
  g1(6,16)=(-(params(19)+params(15)+params(14)));
  g1(6,17)=(-(params(28)+params(24)+params(23)));
  g1(6,18)=(-params(11));
  g1(6,19)=(-params(12));
  g1(6,20)=(-params(13));
  g1(6,21)=(-params(20));
  g1(6,22)=(-params(21));
  g1(6,23)=(-params(22));
  g1(6,24)=(-params(29));
  g1(6,25)=(-params(30));
  g1(6,26)=(-params(31));
  g1(6,30)=(-params(25));
  g1(6,31)=(-params(26));
  g1(6,32)=(-params(27));
  g1(6,33)=(-params(16));
  g1(6,34)=(-params(17));
  g1(6,35)=(-params(18));
  g1(6,36)=(-params(2));
  g1(6,37)=(-params(3));
  g1(6,38)=(-params(4));
  g1(6,39)=(-params(7));
  g1(6,40)=(-params(8));
  g1(6,41)=(-params(9));
  g1(7,3)=1-params(36);
  g1(7,6)=(-params(37));
  g1(8,1)=params(42);
  g1(8,2)=(-params(42));
  g1(8,6)=1-(params(40)+params(41));
  g1(8,11)=params(51)*0.04;
  g1(8,42)=params(51)*0.08;
  g1(8,43)=params(51)*0.12;
  g1(8,44)=params(51)*0.16;
  g1(8,45)=params(51)*0.2;
  g1(8,46)=params(51)*0.16;
  g1(8,47)=params(51)*0.12;
  g1(8,48)=params(51)*0.08;
  g1(8,49)=params(51)*0.04;
  g1(9,11)=1;
  g1(10,4)=1;
  g1(10,5)=(-(1-params(43)));
  g1(10,6)=(-params(44));
  g1(10,29)=(-params(43));
  g1(11,1)=1;
  g1(11,4)=1;
  g1(11,7)=(-1);
  g1(12,2)=1-(1-params(34));
  g1(13,4)=(-0.5);
  g1(13,5)=1;
  g1(13,50)=(-0.25);
  g1(13,51)=(-0.25);
  g1(14,8)=1;
  g1(14,29)=(-1);
  g1(15,4)=(-1);
  g1(15,10)=1;
  g1(16,6)=(-1);
  g1(16,9)=1;
  g1(17,11)=(-(params(51)*0.04));
  g1(17,12)=1;
  g1(17,42)=(-(params(51)*0.08));
  g1(17,43)=(-(params(51)*0.12));
  g1(17,44)=(-(params(51)*0.16));
  g1(17,45)=(-(params(51)*0.2));
  g1(17,46)=(-(params(51)*0.16));
  g1(17,47)=(-(params(51)*0.12));
  g1(17,48)=(-(params(51)*0.08));
  g1(17,49)=(-(params(51)*0.04));
  g1(18,15)=(-1);
  g1(18,18)=1;
  g1(19,18)=(-1);
  g1(19,19)=1;
  g1(20,19)=(-1);
  g1(20,20)=1;
  g1(21,16)=(-1);
  g1(21,21)=1;
  g1(22,21)=(-1);
  g1(22,22)=1;
  g1(23,22)=(-1);
  g1(23,23)=1;
  g1(24,17)=(-1);
  g1(24,24)=1;
  g1(25,24)=(-1);
  g1(25,25)=1;
  g1(26,25)=(-1);
  g1(26,26)=1;
  g1(27,5)=(-1);
  g1(27,27)=1;
  g1(28,27)=(-1);
  g1(28,28)=1;
  g1(29,28)=(-1);
  g1(29,29)=1;
  g1(30,17)=(-1);
  g1(30,30)=1;
  g1(31,30)=(-1);
  g1(31,31)=1;
  g1(32,31)=(-1);
  g1(32,32)=1;
  g1(33,16)=(-1);
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
  g1(39,15)=(-1);
  g1(39,39)=1;
  g1(40,39)=(-1);
  g1(40,40)=1;
  g1(41,40)=(-1);
  g1(41,41)=1;
  g1(42,11)=(-1);
  g1(42,42)=1;
  g1(43,42)=(-1);
  g1(43,43)=1;
  g1(44,43)=(-1);
  g1(44,44)=1;
  g1(45,44)=(-1);
  g1(45,45)=1;
  g1(46,45)=(-1);
  g1(46,46)=1;
  g1(47,46)=(-1);
  g1(47,47)=1;
  g1(48,47)=(-1);
  g1(48,48)=1;
  g1(49,48)=(-1);
  g1(49,49)=1;
  g1(50,4)=(-1);
  g1(50,50)=1;
  g1(51,50)=(-1);
  g1(51,51)=1;
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],51,2601);
end
end
