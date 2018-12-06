function [residual, g1, g2] = US_DG08_static(y, x, params)
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

residual = zeros( 60, 1);

%
% Model equations
%

T174 = (1-params(35))/((1+params(35))*params(36));
T187 = params(38)/(1+params(38));
T189 = 1/(1+params(38));
T214 = (1-params(38)*params(40))*(1-params(40))/(params(40)*(1+params(38))*(1+(1+params(37))*params(41)/params(37)));
T267 = 1/(1+params(38)*params(45))*(1-params(38)*params(46))*(1-params(46))/params(46);
T349 = params(54)*(params(49)-1/params(38))*(1-1/params(52));
T446 = params(54)*(params(47)+1/params(38)-1)/params(44);
T481 = 1-(params(35)/(1+params(35))+1/(1+params(35)));
lhs =y(32);
rhs =y(16)*4;
residual(1)= lhs-rhs;
lhs =y(33);
rhs =y(6)+y(6)+y(47)+y(48);
residual(2)= lhs-rhs;
lhs =y(34);
rhs =4*y(6);
residual(3)= lhs-rhs;
lhs =y(35);
rhs =y(7)-y(26);
residual(4)= lhs-rhs;
lhs =y(36);
rhs =y(7);
residual(5)= lhs-rhs;
lhs =y(37);
rhs =y(31);
residual(6)= lhs-rhs;
lhs =y(32);
rhs =params(32)*x(7)+params(31)*y(46)+params(30)*y(45)+params(29)*y(44)+y(36)*params(28)+params(27)*y(51)+params(26)*y(50)+params(25)*y(49)+y(36)*params(24)+y(36)*params(23)+params(22)*y(43)+params(21)*y(42)+params(20)*y(41)+y(35)*params(19)+params(18)*y(54)+params(17)*y(53)+params(16)*y(52)+y(35)*params(15)+y(35)*params(14)+params(13)*y(40)+params(12)*y(39)+params(11)*y(38)+y(34)*params(10)+y(34)*params(6)+y(34)*params(5)+y(32)*params(1)+params(2)*y(55)+params(3)*y(56)+params(4)*y(57)+params(7)*y(58)+params(8)*y(59)+params(9)*y(60);
residual(7)= lhs-rhs;
lhs =y(37);
rhs =params(34)*x(8);
residual(8)= lhs-rhs;
lhs =y(1);
rhs =y(1)*params(35)/(1+params(35))+y(1)*1/(1+params(35))-T174*y(4)+T174*y(17);
residual(9)= lhs-rhs;
lhs =y(4);
rhs =y(3);
residual(10)= lhs-rhs;
lhs =y(5);
rhs =y(5)*T187+y(5)*T189+y(6)*T187-y(6)*(1+params(38)*params(39))/(1+params(38))+y(6)*params(39)/(1+params(38))-T214*(y(5)-y(2)*params(41)-params(36)/(1-params(35))*(y(1)-y(1)*params(35))-y(18))+x(1);
residual(11)= lhs-rhs;
lhs =y(7);
rhs =params(42)*(y(19)+params(43)*y(8)+params(43)/params(44)*y(9)+y(2)*(1-params(43)));
residual(12)= lhs-rhs;
lhs =y(2);
rhs =y(8)+(-y(5))+y(9)*(1+1/params(44));
residual(13)= lhs-rhs;
lhs =y(6);
rhs =y(6)*params(38)/(1+params(38)*params(45))+y(6)*params(45)/(1+params(38)*params(45))+T267*(params(43)*y(9)+y(5)*(1-params(43))-y(19))+x(2);
residual(14)= lhs-rhs;
lhs =y(8);
rhs =y(8)*(1-params(47))+params(47)*y(10)+(1+params(38))*params(47)*params(48)*y(20);
residual(15)= lhs-rhs;
lhs =y(10);
rhs =y(20)+T189*y(10)+T187*y(10)+1/((1+params(38))*params(48))*y(11);
residual(16)= lhs-rhs;
lhs =y(12);
rhs =y(11)*(1-params(47))/params(49)+y(9)*(params(47)+params(49)-1)/params(49)-y(11);
residual(17)= lhs-rhs;
lhs =y(13);
rhs =y(12);
residual(18)= lhs-rhs;
lhs =y(13);
rhs =y(3)+(-params(50))*(y(15)-y(11)-y(8));
residual(19)= lhs-rhs;
lhs =y(15);
rhs =params(49)*params(51)*(y(15)+y(13)+params(52)*(y(12)-y(13)));
residual(20)= lhs-rhs;
lhs =y(7);
rhs =y(1)*params(53)+y(10)*params(47)*params(54)+y(21)+y(9)*params(54)*(params(47)+params(49)-1)/params(44)+T349*(y(8)+y(11)+y(12));
residual(21)= lhs-rhs;
lhs =y(16);
rhs =y(6)+y(3);
residual(22)= lhs-rhs;
lhs =y(14);
rhs =y(13)-y(3);
residual(23)= lhs-rhs;
lhs =y(17);
rhs =y(17)*params(60)+x(3);
residual(24)= lhs-rhs;
lhs =y(18);
rhs =y(18)*params(61)+x(4);
residual(25)= lhs-rhs;
lhs =y(19);
rhs =y(19)*params(62)+x(5);
residual(26)= lhs-rhs;
lhs =y(20);
rhs =y(20)*params(63)+x(6);
residual(27)= lhs-rhs;
lhs =y(21);
rhs =y(31)+y(21)*params(64);
residual(28)= lhs-rhs;
lhs =y(22);
rhs =T174*y(17)+params(35)/(1+params(35))*y(22)+1/(1+params(35))*y(22)-T174*y(24);
residual(29)= lhs-rhs;
lhs =y(25);
rhs =y(18)+params(41)*y(23)+y(22)*params(36)*1/(1-params(35))-y(22)*params(35)*params(36)/(1-params(35));
residual(30)= lhs-rhs;
lhs =y(26);
rhs =params(42)*(y(19)+params(43)*y(27)+params(43)/params(44)*y(28)+(1-params(43))*y(23));
residual(31)= lhs-rhs;
lhs =y(23);
rhs =y(27)+(-y(25))+(1+1/params(44))*y(28);
residual(32)= lhs-rhs;
lhs =params(43)*y(28)+(1-params(43))*y(25);
rhs =y(19);
residual(33)= lhs-rhs;
lhs =y(27);
rhs =(1+params(38))*params(47)*params(48)*y(20)+(1-params(47))*y(27)+params(47)*y(29);
residual(34)= lhs-rhs;
lhs =y(29);
rhs =y(20)+T189*y(29)+T187*y(29)+1/((1+params(38))*params(48))*y(30);
residual(35)= lhs-rhs;
lhs =y(26);
rhs =y(21)+params(53)*y(22)+params(47)*params(54)*y(29)+y(28)*T446;
residual(36)= lhs-rhs;
lhs =y(24);
rhs =y(28)*(1-params(38)*(1-params(47)))+y(30)*params(38)*(1-params(47))-y(30);
residual(37)= lhs-rhs;
lhs =y(38);
rhs =y(34);
residual(38)= lhs-rhs;
lhs =y(39);
rhs =y(38);
residual(39)= lhs-rhs;
lhs =y(40);
rhs =y(39);
residual(40)= lhs-rhs;
lhs =y(41);
rhs =y(35);
residual(41)= lhs-rhs;
lhs =y(42);
rhs =y(41);
residual(42)= lhs-rhs;
lhs =y(43);
rhs =y(42);
residual(43)= lhs-rhs;
lhs =y(44);
rhs =y(36);
residual(44)= lhs-rhs;
lhs =y(45);
rhs =y(44);
residual(45)= lhs-rhs;
lhs =y(46);
rhs =y(45);
residual(46)= lhs-rhs;
lhs =y(47);
rhs =y(6);
residual(47)= lhs-rhs;
lhs =y(48);
rhs =y(47);
residual(48)= lhs-rhs;
lhs =y(49);
rhs =y(36);
residual(49)= lhs-rhs;
lhs =y(50);
rhs =y(49);
residual(50)= lhs-rhs;
lhs =y(51);
rhs =y(50);
residual(51)= lhs-rhs;
lhs =y(52);
rhs =y(35);
residual(52)= lhs-rhs;
lhs =y(53);
rhs =y(52);
residual(53)= lhs-rhs;
lhs =y(54);
rhs =y(53);
residual(54)= lhs-rhs;
lhs =y(55);
rhs =y(32);
residual(55)= lhs-rhs;
lhs =y(56);
rhs =y(55);
residual(56)= lhs-rhs;
lhs =y(57);
rhs =y(56);
residual(57)= lhs-rhs;
lhs =y(58);
rhs =y(34);
residual(58)= lhs-rhs;
lhs =y(59);
rhs =y(58);
residual(59)= lhs-rhs;
lhs =y(60);
rhs =y(59);
residual(60)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(60, 60);

  %
  % Jacobian matrix
  %

  g1(1,16)=(-4);
  g1(1,32)=1;
  g1(2,6)=(-2);
  g1(2,33)=1;
  g1(2,47)=(-1);
  g1(2,48)=(-1);
  g1(3,6)=(-4);
  g1(3,34)=1;
  g1(4,7)=(-1);
  g1(4,26)=1;
  g1(4,35)=1;
  g1(5,7)=(-1);
  g1(5,36)=1;
  g1(6,31)=(-1);
  g1(6,37)=1;
  g1(7,32)=1-params(1);
  g1(7,34)=(-(params(10)+params(6)+params(5)));
  g1(7,35)=(-(params(19)+params(15)+params(14)));
  g1(7,36)=(-(params(28)+params(24)+params(23)));
  g1(7,38)=(-params(11));
  g1(7,39)=(-params(12));
  g1(7,40)=(-params(13));
  g1(7,41)=(-params(20));
  g1(7,42)=(-params(21));
  g1(7,43)=(-params(22));
  g1(7,44)=(-params(29));
  g1(7,45)=(-params(30));
  g1(7,46)=(-params(31));
  g1(7,49)=(-params(25));
  g1(7,50)=(-params(26));
  g1(7,51)=(-params(27));
  g1(7,52)=(-params(16));
  g1(7,53)=(-params(17));
  g1(7,54)=(-params(18));
  g1(7,55)=(-params(2));
  g1(7,56)=(-params(3));
  g1(7,57)=(-params(4));
  g1(7,58)=(-params(7));
  g1(7,59)=(-params(8));
  g1(7,60)=(-params(9));
  g1(8,37)=1;
  g1(9,1)=T481;
  g1(9,4)=T174;
  g1(9,17)=(-T174);
  g1(10,3)=(-1);
  g1(10,4)=1;
  g1(11,1)=T214*(-((1-params(35))*params(36)/(1-params(35))));
  g1(11,2)=T214*(-params(41));
  g1(11,5)=1-(T187+T189-T214);
  g1(11,6)=(-(params(39)/(1+params(38))+T187-(1+params(38)*params(39))/(1+params(38))));
  g1(11,18)=(-T214);
  g1(12,2)=(-(params(42)*(1-params(43))));
  g1(12,7)=1;
  g1(12,8)=(-(params(42)*params(43)));
  g1(12,9)=(-(params(42)*params(43)/params(44)));
  g1(12,19)=(-params(42));
  g1(13,2)=1;
  g1(13,5)=1;
  g1(13,8)=(-1);
  g1(13,9)=(-(1+1/params(44)));
  g1(14,5)=(-((1-params(43))*T267));
  g1(14,6)=1-(params(38)/(1+params(38)*params(45))+params(45)/(1+params(38)*params(45)));
  g1(14,9)=(-(params(43)*T267));
  g1(14,19)=T267;
  g1(15,8)=1-(1-params(47));
  g1(15,10)=(-params(47));
  g1(15,20)=(-((1+params(38))*params(47)*params(48)));
  g1(16,10)=1-(T187+T189);
  g1(16,11)=(-(1/((1+params(38))*params(48))));
  g1(16,20)=(-1);
  g1(17,9)=(-((params(47)+params(49)-1)/params(49)));
  g1(17,11)=(-((1-params(47))/params(49)-1));
  g1(17,12)=1;
  g1(18,12)=(-1);
  g1(18,13)=1;
  g1(19,3)=(-1);
  g1(19,8)=(-params(50));
  g1(19,11)=(-params(50));
  g1(19,13)=1;
  g1(19,15)=params(50);
  g1(20,12)=(-(params(49)*params(51)*params(52)));
  g1(20,13)=(-(params(49)*params(51)*(1-params(52))));
  g1(20,15)=1-params(49)*params(51);
  g1(21,1)=(-params(53));
  g1(21,7)=1;
  g1(21,8)=(-T349);
  g1(21,9)=(-(params(54)*(params(47)+params(49)-1)/params(44)));
  g1(21,10)=(-(params(47)*params(54)));
  g1(21,11)=(-T349);
  g1(21,12)=(-T349);
  g1(21,21)=(-1);
  g1(22,3)=(-1);
  g1(22,6)=(-1);
  g1(22,16)=1;
  g1(23,3)=1;
  g1(23,13)=(-1);
  g1(23,14)=1;
  g1(24,17)=1-params(60);
  g1(25,18)=1-params(61);
  g1(26,19)=1-params(62);
  g1(27,20)=1-params(63);
  g1(28,21)=1-params(64);
  g1(28,31)=(-1);
  g1(29,17)=(-T174);
  g1(29,22)=T481;
  g1(29,24)=T174;
  g1(30,18)=(-1);
  g1(30,22)=(-(params(36)*1/(1-params(35))-params(35)*params(36)/(1-params(35))));
  g1(30,23)=(-params(41));
  g1(30,25)=1;
  g1(31,19)=(-params(42));
  g1(31,23)=(-(params(42)*(1-params(43))));
  g1(31,26)=1;
  g1(31,27)=(-(params(42)*params(43)));
  g1(31,28)=(-(params(42)*params(43)/params(44)));
  g1(32,23)=1;
  g1(32,25)=1;
  g1(32,27)=(-1);
  g1(32,28)=(-(1+1/params(44)));
  g1(33,19)=(-1);
  g1(33,25)=1-params(43);
  g1(33,28)=params(43);
  g1(34,20)=(-((1+params(38))*params(47)*params(48)));
  g1(34,27)=1-(1-params(47));
  g1(34,29)=(-params(47));
  g1(35,20)=(-1);
  g1(35,29)=1-(T187+T189);
  g1(35,30)=(-(1/((1+params(38))*params(48))));
  g1(36,21)=(-1);
  g1(36,22)=(-params(53));
  g1(36,26)=1;
  g1(36,28)=(-T446);
  g1(36,29)=(-(params(47)*params(54)));
  g1(37,24)=1;
  g1(37,28)=(-(1-params(38)*(1-params(47))));
  g1(37,30)=(-(params(38)*(1-params(47))-1));
  g1(38,34)=(-1);
  g1(38,38)=1;
  g1(39,38)=(-1);
  g1(39,39)=1;
  g1(40,39)=(-1);
  g1(40,40)=1;
  g1(41,35)=(-1);
  g1(41,41)=1;
  g1(42,41)=(-1);
  g1(42,42)=1;
  g1(43,42)=(-1);
  g1(43,43)=1;
  g1(44,36)=(-1);
  g1(44,44)=1;
  g1(45,44)=(-1);
  g1(45,45)=1;
  g1(46,45)=(-1);
  g1(46,46)=1;
  g1(47,6)=(-1);
  g1(47,47)=1;
  g1(48,47)=(-1);
  g1(48,48)=1;
  g1(49,36)=(-1);
  g1(49,49)=1;
  g1(50,49)=(-1);
  g1(50,50)=1;
  g1(51,50)=(-1);
  g1(51,51)=1;
  g1(52,35)=(-1);
  g1(52,52)=1;
  g1(53,52)=(-1);
  g1(53,53)=1;
  g1(54,53)=(-1);
  g1(54,54)=1;
  g1(55,32)=(-1);
  g1(55,55)=1;
  g1(56,55)=(-1);
  g1(56,56)=1;
  g1(57,56)=(-1);
  g1(57,57)=1;
  g1(58,34)=(-1);
  g1(58,58)=1;
  g1(59,58)=(-1);
  g1(59,59)=1;
  g1(60,59)=(-1);
  g1(60,60)=1;
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],60,3600);
end
end
