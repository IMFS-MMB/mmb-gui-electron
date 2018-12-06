function [residual, g1, g2] = US_RA07_static(y, x, params)
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

residual = zeros( 56, 1);

%
% Model equations
%

T226 = (1-params(49))/params(48);
T246 = 1/(1+params(39));
lhs =y(28);
rhs =y(5)*4;
residual(1)= lhs-rhs;
lhs =y(29);
rhs =y(1)+y(1)+y(43)+y(44);
residual(2)= lhs-rhs;
lhs =y(30);
rhs =4*y(1);
residual(3)= lhs-rhs;
lhs =y(32);
rhs =y(14)-y(26);
residual(4)= lhs-rhs;
lhs =y(31);
rhs =y(14);
residual(5)= lhs-rhs;
lhs =y(33);
rhs =y(27);
residual(6)= lhs-rhs;
lhs =y(28);
rhs =params(32)*x(3)+params(31)*y(42)+params(30)*y(41)+params(29)*y(40)+y(31)*params(28)+params(27)*y(47)+params(26)*y(46)+params(25)*y(45)+y(31)*params(24)+y(31)*params(23)+params(22)*y(39)+params(21)*y(38)+params(20)*y(37)+y(32)*params(19)+params(18)*y(50)+params(17)*y(49)+params(16)*y(48)+y(32)*params(15)+y(32)*params(14)+params(13)*y(36)+params(12)*y(35)+params(11)*y(34)+y(30)*params(10)+y(30)*params(6)+y(30)*params(5)+y(28)*params(1)+params(2)*y(51)+params(3)*y(52)+params(4)*y(53)+params(7)*y(54)+params(8)*y(55)+params(9)*y(56);
residual(7)= lhs-rhs;
lhs =y(33);
rhs =params(34)*x(4);
residual(8)= lhs-rhs;
lhs =y(1);
rhs =y(1)*params(35)+y(1)*params(36)+params(37)*y(2)+params(37)*x(1);
residual(9)= lhs-rhs;
lhs =y(2);
rhs =params(41)*y(3)+(1-params(41))*(y(4)+y(5)*params(42))-y(6);
residual(10)= lhs-rhs;
lhs =y(7);
rhs =y(3)*params(45);
residual(11)= lhs-rhs;
lhs =y(4)*(1+params(39));
rhs =y(4)+y(4)*params(39)+y(1)*params(46)-y(1)*(1+params(39)*params(46))+y(1)*params(39)-params(47)*(y(4)-params(48)/(1-params(49))*(y(8)-params(49)*y(8))-params(50)*y(9));
residual(12)= lhs-rhs;
lhs =y(10)-y(7)-y(11);
rhs =y(3)-(y(4)+y(5)*params(42));
residual(13)= lhs-rhs;
lhs =y(8)*(1+params(49));
rhs =y(8)+params(49)*y(8)-T226*(y(5)-y(1));
residual(14)= lhs-rhs;
lhs =y(12);
rhs =y(12)*params(39)*(1-params(51))+y(3)*(1-params(39)*(1-params(51)))-(y(5)-y(1));
residual(15)= lhs-rhs;
lhs =y(11);
rhs =y(11)*(1-params(51))+params(51)*y(13);
residual(16)= lhs-rhs;
lhs =y(13);
rhs =T246*(y(13)+params(39)*y(13)+y(12)*params(44));
residual(17)= lhs-rhs;
lhs =y(14);
rhs =y(6)+params(41)*(y(7)+y(11))+(1-params(41))*y(9);
residual(18)= lhs-rhs;
lhs =y(14);
rhs =y(8)*(1-params(55)-params(56))+y(13)*params(55)+params(56)*y(15)+y(7)*params(41)*params(57)/(params(57)-1);
residual(19)= lhs-rhs;
lhs =y(6);
rhs =y(6)*params(58)+x(2);
residual(20)= lhs-rhs;
lhs =y(15);
rhs =y(27)+y(15)*params(59);
residual(21)= lhs-rhs;
lhs =y(10);
rhs =y(9);
residual(22)= lhs-rhs;
lhs =0;
rhs =params(41)*y(16)+(1-params(41))*y(17)-y(6);
residual(23)= lhs-rhs;
lhs =y(19);
rhs =params(45)*y(16);
residual(24)= lhs-rhs;
lhs =y(17);
rhs =params(48)/(1-params(49))*(y(20)-params(49)*y(20))+params(50)*y(21);
residual(25)= lhs-rhs;
lhs =y(22)-y(19)-y(23);
rhs =y(16)-y(17);
residual(26)= lhs-rhs;
lhs =(1+params(49))*y(20);
rhs =y(20)+params(49)*y(20)-T226*y(18);
residual(27)= lhs-rhs;
lhs =y(24);
rhs =params(39)*(1-params(51))*y(24)+(1-params(39)*(1-params(51)))*y(16)-y(18);
residual(28)= lhs-rhs;
lhs =y(23);
rhs =(1-params(51))*y(23)+params(51)*y(25);
residual(29)= lhs-rhs;
lhs =y(25);
rhs =T246*(y(25)+params(39)*y(25)+params(44)*y(24));
residual(30)= lhs-rhs;
lhs =y(26);
rhs =y(6)+params(41)*(y(19)+y(23))+(1-params(41))*y(21);
residual(31)= lhs-rhs;
lhs =y(26);
rhs =params(56)*y(15)+(1-params(55)-params(56))*y(20)+params(55)*y(25)+params(41)*params(57)/(params(57)-1)*y(19);
residual(32)= lhs-rhs;
lhs =y(22);
rhs =y(21);
residual(33)= lhs-rhs;
lhs =y(34);
rhs =y(30);
residual(34)= lhs-rhs;
lhs =y(35);
rhs =y(34);
residual(35)= lhs-rhs;
lhs =y(36);
rhs =y(35);
residual(36)= lhs-rhs;
lhs =y(37);
rhs =y(32);
residual(37)= lhs-rhs;
lhs =y(38);
rhs =y(37);
residual(38)= lhs-rhs;
lhs =y(39);
rhs =y(38);
residual(39)= lhs-rhs;
lhs =y(40);
rhs =y(31);
residual(40)= lhs-rhs;
lhs =y(41);
rhs =y(40);
residual(41)= lhs-rhs;
lhs =y(42);
rhs =y(41);
residual(42)= lhs-rhs;
lhs =y(43);
rhs =y(1);
residual(43)= lhs-rhs;
lhs =y(44);
rhs =y(43);
residual(44)= lhs-rhs;
lhs =y(45);
rhs =y(31);
residual(45)= lhs-rhs;
lhs =y(46);
rhs =y(45);
residual(46)= lhs-rhs;
lhs =y(47);
rhs =y(46);
residual(47)= lhs-rhs;
lhs =y(48);
rhs =y(32);
residual(48)= lhs-rhs;
lhs =y(49);
rhs =y(48);
residual(49)= lhs-rhs;
lhs =y(50);
rhs =y(49);
residual(50)= lhs-rhs;
lhs =y(51);
rhs =y(28);
residual(51)= lhs-rhs;
lhs =y(52);
rhs =y(51);
residual(52)= lhs-rhs;
lhs =y(53);
rhs =y(52);
residual(53)= lhs-rhs;
lhs =y(54);
rhs =y(30);
residual(54)= lhs-rhs;
lhs =y(55);
rhs =y(54);
residual(55)= lhs-rhs;
lhs =y(56);
rhs =y(55);
residual(56)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(56, 56);

  %
  % Jacobian matrix
  %

  g1(1,5)=(-4);
  g1(1,28)=1;
  g1(2,1)=(-2);
  g1(2,29)=1;
  g1(2,43)=(-1);
  g1(2,44)=(-1);
  g1(3,1)=(-4);
  g1(3,30)=1;
  g1(4,14)=(-1);
  g1(4,26)=1;
  g1(4,32)=1;
  g1(5,14)=(-1);
  g1(5,31)=1;
  g1(6,27)=(-1);
  g1(6,33)=1;
  g1(7,28)=1-params(1);
  g1(7,30)=(-(params(10)+params(6)+params(5)));
  g1(7,31)=(-(params(28)+params(24)+params(23)));
  g1(7,32)=(-(params(19)+params(15)+params(14)));
  g1(7,34)=(-params(11));
  g1(7,35)=(-params(12));
  g1(7,36)=(-params(13));
  g1(7,37)=(-params(20));
  g1(7,38)=(-params(21));
  g1(7,39)=(-params(22));
  g1(7,40)=(-params(29));
  g1(7,41)=(-params(30));
  g1(7,42)=(-params(31));
  g1(7,45)=(-params(25));
  g1(7,46)=(-params(26));
  g1(7,47)=(-params(27));
  g1(7,48)=(-params(16));
  g1(7,49)=(-params(17));
  g1(7,50)=(-params(18));
  g1(7,51)=(-params(2));
  g1(7,52)=(-params(3));
  g1(7,53)=(-params(4));
  g1(7,54)=(-params(7));
  g1(7,55)=(-params(8));
  g1(7,56)=(-params(9));
  g1(8,33)=1;
  g1(9,1)=1-(params(35)+params(36));
  g1(9,2)=(-params(37));
  g1(10,2)=1;
  g1(10,3)=(-params(41));
  g1(10,4)=(-(1-params(41)));
  g1(10,5)=(-((1-params(41))*params(42)));
  g1(10,6)=1;
  g1(11,3)=(-params(45));
  g1(11,7)=1;
  g1(12,1)=(-(params(39)+params(46)-(1+params(39)*params(46))));
  g1(12,4)=1+params(39)-(1+params(39)-params(47));
  g1(12,8)=params(47)*(-((1-params(49))*params(48)/(1-params(49))));
  g1(12,9)=params(47)*(-params(50));
  g1(13,3)=(-1);
  g1(13,4)=1;
  g1(13,5)=params(42);
  g1(13,7)=(-1);
  g1(13,10)=1;
  g1(13,11)=(-1);
  g1(14,1)=(-T226);
  g1(14,5)=T226;
  g1(15,1)=(-1);
  g1(15,3)=(-(1-params(39)*(1-params(51))));
  g1(15,5)=1;
  g1(15,12)=1-params(39)*(1-params(51));
  g1(16,11)=1-(1-params(51));
  g1(16,13)=(-params(51));
  g1(17,12)=(-(T246*params(44)));
  g1(17,13)=1-(1+params(39))*T246;
  g1(18,6)=(-1);
  g1(18,7)=(-params(41));
  g1(18,9)=(-(1-params(41)));
  g1(18,11)=(-params(41));
  g1(18,14)=1;
  g1(19,7)=(-(params(41)*params(57)/(params(57)-1)));
  g1(19,8)=(-(1-params(55)-params(56)));
  g1(19,13)=(-params(55));
  g1(19,14)=1;
  g1(19,15)=(-params(56));
  g1(20,6)=1-params(58);
  g1(21,15)=1-params(59);
  g1(21,27)=(-1);
  g1(22,9)=(-1);
  g1(22,10)=1;
  g1(23,6)=1;
  g1(23,16)=(-params(41));
  g1(23,17)=(-(1-params(41)));
  g1(24,16)=(-params(45));
  g1(24,19)=1;
  g1(25,17)=1;
  g1(25,20)=(-((1-params(49))*params(48)/(1-params(49))));
  g1(25,21)=(-params(50));
  g1(26,16)=(-1);
  g1(26,17)=1;
  g1(26,19)=(-1);
  g1(26,22)=1;
  g1(26,23)=(-1);
  g1(27,18)=T226;
  g1(28,16)=(-(1-params(39)*(1-params(51))));
  g1(28,18)=1;
  g1(28,24)=1-params(39)*(1-params(51));
  g1(29,23)=1-(1-params(51));
  g1(29,25)=(-params(51));
  g1(30,24)=(-(T246*params(44)));
  g1(30,25)=1-(1+params(39))*T246;
  g1(31,6)=(-1);
  g1(31,19)=(-params(41));
  g1(31,21)=(-(1-params(41)));
  g1(31,23)=(-params(41));
  g1(31,26)=1;
  g1(32,15)=(-params(56));
  g1(32,19)=(-(params(41)*params(57)/(params(57)-1)));
  g1(32,20)=(-(1-params(55)-params(56)));
  g1(32,25)=(-params(55));
  g1(32,26)=1;
  g1(33,21)=(-1);
  g1(33,22)=1;
  g1(34,30)=(-1);
  g1(34,34)=1;
  g1(35,34)=(-1);
  g1(35,35)=1;
  g1(36,35)=(-1);
  g1(36,36)=1;
  g1(37,32)=(-1);
  g1(37,37)=1;
  g1(38,37)=(-1);
  g1(38,38)=1;
  g1(39,38)=(-1);
  g1(39,39)=1;
  g1(40,31)=(-1);
  g1(40,40)=1;
  g1(41,40)=(-1);
  g1(41,41)=1;
  g1(42,41)=(-1);
  g1(42,42)=1;
  g1(43,1)=(-1);
  g1(43,43)=1;
  g1(44,43)=(-1);
  g1(44,44)=1;
  g1(45,31)=(-1);
  g1(45,45)=1;
  g1(46,45)=(-1);
  g1(46,46)=1;
  g1(47,46)=(-1);
  g1(47,47)=1;
  g1(48,32)=(-1);
  g1(48,48)=1;
  g1(49,48)=(-1);
  g1(49,49)=1;
  g1(50,49)=(-1);
  g1(50,50)=1;
  g1(51,28)=(-1);
  g1(51,51)=1;
  g1(52,51)=(-1);
  g1(52,52)=1;
  g1(53,52)=(-1);
  g1(53,53)=1;
  g1(54,30)=(-1);
  g1(54,54)=1;
  g1(55,54)=(-1);
  g1(55,55)=1;
  g1(56,55)=(-1);
  g1(56,56)=1;
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],56,3136);
end
end
