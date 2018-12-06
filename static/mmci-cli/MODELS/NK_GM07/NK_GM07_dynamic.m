function [residual, g1, g2, g3] = NK_GM07_dynamic(y, x, params, steady_state, it_)
%
% Status : Computes dynamic model for Dynare
%
% Inputs :
%   y         [#dynamic variables by 1] double    vector of endogenous variables in the order stored
%                                                 in M_.lead_lag_incidence; see the Manual
%   x         [nperiods by M_.exo_nbr] double     matrix of exogenous variables (in declaration order)
%                                                 for all simulation periods
%   steady_state  [M_.endo_nbr by 1] double       vector of steady state values
%   params    [M_.param_nbr by 1] double          vector of parameter values in declaration order
%   it_       scalar double                       time period for exogenous variables for which to evaluate the model
%
% Outputs:
%   residual  [M_.endo_nbr by 1] double    vector of residuals of the dynamic model equations in order of 
%                                          declaration of the equations.
%                                          Dynare may prepend auxiliary equations, see M_.aux_vars
%   g1        [M_.endo_nbr by #dynamic variables] double    Jacobian matrix of the dynamic model equations;
%                                                           rows: equations in order of declaration
%                                                           columns: variables in order stored in M_.lead_lag_incidence followed by the ones in M_.exo_names
%   g2        [M_.endo_nbr by (#dynamic variables)^2] double   Hessian matrix of the dynamic model equations;
%                                                              rows: equations in order of declaration
%                                                              columns: variables in order stored in M_.lead_lag_incidence followed by the ones in M_.exo_names
%   g3        [M_.endo_nbr by (#dynamic variables)^3] double   Third order derivative matrix of the dynamic model equations;
%                                                              rows: equations in order of declaration
%                                                              columns: variables in order stored in M_.lead_lag_incidence followed by the ones in M_.exo_names
%
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

%
% Model equations
%

residual = zeros(51, 1);
T47 = params(51)*(1-params(40))/(params(50)*params(52));
T61 = params(41)*params(48)/params(51)/(params(41)*params(48)/params(51)+params(53));
T67 = params(53)/(params(41)*params(48)/params(51)+params(53));
T95 = params(51)*params(40)*params(53)/(params(51)*params(53)+params(41)*params(48)*(1+params(43)));
T119 = params(41)*params(54)*params(35)/(params(51)*params(55));
T123 = params(41)*params(54)*(params(35)/(params(51)*params(55))-1);
T138 = (params(49)/params(48))^(1-params(36));
T141 = params(38)/(1+params(43))*(1-params(42)+params(36)*params(56)*T138);
T148 = T138*params(56)*params(38)*params(36)/(1+params(43));
T157 = T119+T141;
T324 = 1/params(38)/(1+params(43));
T331 = params(54)*params(35)/(params(51)*params(55));
lhs =y(24);
rhs =params(38)*y(75)+params(39)*y(25);
residual(1)= lhs-rhs;
lhs =y(25);
rhs =y(28)-y(27);
residual(2)= lhs-rhs;
lhs =y(35);
rhs =y(32)+y(34);
residual(3)= lhs-rhs;
lhs =y(27)+y(29);
rhs =params(49)/(1-params(49)-params(50))*y(30)+params(50)/(1-params(49)-params(50))*y(31);
residual(4)= lhs-rhs;
residual(5) = y(29)+y(31)+y(32)*T47+y(27)*(1+T47);
lhs =y(26);
rhs =T61*(y(32)-y(33)-y(39))-T67*y(36);
residual(6)= lhs-rhs;
lhs =y(32);
rhs =(1+params(48)*params(42)/params(51))*(1-params(36))*(y(30)+y(37))-y(33)*params(48)*params(42)/params(51);
residual(7)= lhs-rhs;
lhs =y(32);
rhs =(1-params(40))*(y(31)+y(38))+T95*(y(32)+y(36))+(1+params(43))*params(48)*params(40)*params(41)/(params(51)*params(53)+params(41)*params(48)*(1+params(43)))*(y(33)+y(39));
residual(8)= lhs-rhs;
lhs =y(25);
rhs =y(29)+y(30)-y(32);
residual(9)= lhs-rhs;
lhs =y(24);
rhs =y(34)-y(2);
residual(10)= lhs-rhs;
lhs =y(32)*T119;
rhs =T123*(y(26)+y(39))+y(33)*(T123-1)+params(38)/(1+params(43))*(1-params(42))*y(79)+T141*y(77)+T148*(y(76)+(1-params(36))*(y(78)+y(80)))-y(27)*T157;
residual(11)= lhs-rhs;
lhs =y(46);
rhs =y(43)*4;
residual(12)= lhs-rhs;
lhs =y(47);
rhs =y(24)+y(1)+y(10)+y(11);
residual(13)= lhs-rhs;
lhs =y(48);
rhs =y(24)*4;
residual(14)= lhs-rhs;
lhs =y(50);
rhs =y(25)*4;
residual(15)= lhs-rhs;
lhs =y(49);
rhs =y(32);
residual(16)= lhs-rhs;
residual(17) = y(51);
lhs =y(46);
rhs =params(32)*x(it_, 4)+params(31)*y(92)+params(30)*y(91)+params(29)*y(90)+params(28)*y(82)+params(27)*y(14)+params(26)*y(13)+params(25)*y(12)+params(24)*y(8)+y(49)*params(23)+params(22)*y(89)+params(21)*y(88)+params(20)*y(87)+params(19)*y(83)+params(18)*y(17)+params(17)*y(16)+params(16)*y(15)+params(15)*y(9)+y(50)*params(14)+params(13)*y(86)+params(12)*y(85)+params(11)*y(84)+params(10)*y(81)+params(6)*y(7)+y(48)*params(5)+params(1)*y(6)+params(2)*y(18)+params(3)*y(19)+params(4)*y(20)+params(7)*y(21)+params(8)*y(22)+params(9)*y(23);
residual(18)= lhs-rhs;
lhs =y(40)/params(58);
rhs =y(29)+y(31)-y(32);
residual(19)= lhs-rhs;
lhs =y(41)/params(57);
rhs =y(29)+y(31)-y(32);
residual(20)= lhs-rhs;
lhs =y(42);
rhs =T324*(y(75)+y(27)-y(77));
residual(21)= lhs-rhs;
lhs =y(42)-y(45);
rhs =T331*(y(26)-y(32)-y(27))-y(26)*params(54);
residual(22)= lhs-rhs;
lhs =y(42)-y(43);
rhs =y(41);
residual(23)= lhs-rhs;
lhs =y(44)-y(43);
rhs =y(40);
residual(24)= lhs-rhs;
residual(25) = y(36);
lhs =y(37);
rhs =params(64)*y(3)+x(it_, 1);
residual(26)= lhs-rhs;
lhs =y(38);
rhs =params(65)*y(4)+x(it_, 2);
residual(27)= lhs-rhs;
lhs =y(39);
rhs =params(66)*y(5)-x(it_, 3);
residual(28)= lhs-rhs;
lhs =y(52);
rhs =y(81);
residual(29)= lhs-rhs;
lhs =y(53);
rhs =y(84);
residual(30)= lhs-rhs;
lhs =y(54);
rhs =y(85);
residual(31)= lhs-rhs;
lhs =y(55);
rhs =y(83);
residual(32)= lhs-rhs;
lhs =y(56);
rhs =y(87);
residual(33)= lhs-rhs;
lhs =y(57);
rhs =y(88);
residual(34)= lhs-rhs;
lhs =y(58);
rhs =y(82);
residual(35)= lhs-rhs;
lhs =y(59);
rhs =y(90);
residual(36)= lhs-rhs;
lhs =y(60);
rhs =y(91);
residual(37)= lhs-rhs;
lhs =y(61);
rhs =y(1);
residual(38)= lhs-rhs;
lhs =y(62);
rhs =y(10);
residual(39)= lhs-rhs;
lhs =y(63);
rhs =y(8);
residual(40)= lhs-rhs;
lhs =y(64);
rhs =y(12);
residual(41)= lhs-rhs;
lhs =y(65);
rhs =y(13);
residual(42)= lhs-rhs;
lhs =y(66);
rhs =y(9);
residual(43)= lhs-rhs;
lhs =y(67);
rhs =y(15);
residual(44)= lhs-rhs;
lhs =y(68);
rhs =y(16);
residual(45)= lhs-rhs;
lhs =y(69);
rhs =y(6);
residual(46)= lhs-rhs;
lhs =y(70);
rhs =y(18);
residual(47)= lhs-rhs;
lhs =y(71);
rhs =y(19);
residual(48)= lhs-rhs;
lhs =y(72);
rhs =y(7);
residual(49)= lhs-rhs;
lhs =y(73);
rhs =y(21);
residual(50)= lhs-rhs;
lhs =y(74);
rhs =y(22);
residual(51)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(51, 96);

  %
  % Jacobian matrix
  %

T529 = (-((1+params(43))*params(48)*params(40)*params(41)/(params(51)*params(53)+params(41)*params(48)*(1+params(43)))));
  g1(1,24)=1;
  g1(1,75)=(-params(38));
  g1(1,25)=(-params(39));
  g1(2,25)=1;
  g1(2,27)=1;
  g1(2,28)=(-1);
  g1(3,32)=(-1);
  g1(3,34)=(-1);
  g1(3,35)=1;
  g1(4,27)=1;
  g1(4,29)=1;
  g1(4,30)=(-(params(49)/(1-params(49)-params(50))));
  g1(4,31)=(-(params(50)/(1-params(49)-params(50))));
  g1(5,27)=1+T47;
  g1(5,29)=1;
  g1(5,31)=1;
  g1(5,32)=T47;
  g1(6,26)=1;
  g1(6,32)=(-T61);
  g1(6,33)=T61;
  g1(6,36)=T67;
  g1(6,39)=T61;
  g1(7,30)=(-((1+params(48)*params(42)/params(51))*(1-params(36))));
  g1(7,32)=1;
  g1(7,33)=params(48)*params(42)/params(51);
  g1(7,37)=(-((1+params(48)*params(42)/params(51))*(1-params(36))));
  g1(8,31)=(-(1-params(40)));
  g1(8,32)=1-T95;
  g1(8,33)=T529;
  g1(8,36)=(-T95);
  g1(8,38)=(-(1-params(40)));
  g1(8,39)=T529;
  g1(9,25)=1;
  g1(9,29)=(-1);
  g1(9,30)=(-1);
  g1(9,32)=1;
  g1(10,24)=1;
  g1(10,2)=1;
  g1(10,34)=(-1);
  g1(11,76)=(-T148);
  g1(11,26)=(-T123);
  g1(11,27)=T157;
  g1(11,77)=(-T141);
  g1(11,78)=(-((1-params(36))*T148));
  g1(11,32)=T119;
  g1(11,33)=(-(T123-1));
  g1(11,79)=(-(params(38)/(1+params(43))*(1-params(42))));
  g1(11,80)=(-((1-params(36))*T148));
  g1(11,39)=(-T123);
  g1(12,43)=(-4);
  g1(12,46)=1;
  g1(13,1)=(-1);
  g1(13,24)=(-1);
  g1(13,47)=1;
  g1(13,10)=(-1);
  g1(13,11)=(-1);
  g1(14,24)=(-4);
  g1(14,48)=1;
  g1(15,25)=(-4);
  g1(15,50)=1;
  g1(16,32)=(-1);
  g1(16,49)=1;
  g1(17,51)=1;
  g1(18,6)=(-params(1));
  g1(18,46)=1;
  g1(18,7)=(-params(6));
  g1(18,48)=(-params(5));
  g1(18,81)=(-params(10));
  g1(18,8)=(-params(24));
  g1(18,49)=(-params(23));
  g1(18,82)=(-params(28));
  g1(18,9)=(-params(15));
  g1(18,50)=(-params(14));
  g1(18,83)=(-params(19));
  g1(18,96)=(-params(32));
  g1(18,84)=(-params(11));
  g1(18,85)=(-params(12));
  g1(18,86)=(-params(13));
  g1(18,87)=(-params(20));
  g1(18,88)=(-params(21));
  g1(18,89)=(-params(22));
  g1(18,90)=(-params(29));
  g1(18,91)=(-params(30));
  g1(18,92)=(-params(31));
  g1(18,12)=(-params(25));
  g1(18,13)=(-params(26));
  g1(18,14)=(-params(27));
  g1(18,15)=(-params(16));
  g1(18,16)=(-params(17));
  g1(18,17)=(-params(18));
  g1(18,18)=(-params(2));
  g1(18,19)=(-params(3));
  g1(18,20)=(-params(4));
  g1(18,21)=(-params(7));
  g1(18,22)=(-params(8));
  g1(18,23)=(-params(9));
  g1(19,29)=(-1);
  g1(19,31)=(-1);
  g1(19,32)=1;
  g1(19,40)=1/params(58);
  g1(20,29)=(-1);
  g1(20,31)=(-1);
  g1(20,32)=1;
  g1(20,41)=1/params(57);
  g1(21,75)=(-T324);
  g1(21,27)=(-T324);
  g1(21,77)=T324;
  g1(21,42)=1;
  g1(22,26)=(-(T331-params(54)));
  g1(22,27)=T331;
  g1(22,32)=T331;
  g1(22,42)=1;
  g1(22,45)=(-1);
  g1(23,41)=(-1);
  g1(23,42)=1;
  g1(23,43)=(-1);
  g1(24,40)=(-1);
  g1(24,43)=(-1);
  g1(24,44)=1;
  g1(25,36)=1;
  g1(26,3)=(-params(64));
  g1(26,37)=1;
  g1(26,93)=(-1);
  g1(27,4)=(-params(65));
  g1(27,38)=1;
  g1(27,94)=(-1);
  g1(28,5)=(-params(66));
  g1(28,39)=1;
  g1(28,95)=1;
  g1(29,81)=(-1);
  g1(29,52)=1;
  g1(30,84)=(-1);
  g1(30,53)=1;
  g1(31,85)=(-1);
  g1(31,54)=1;
  g1(32,83)=(-1);
  g1(32,55)=1;
  g1(33,87)=(-1);
  g1(33,56)=1;
  g1(34,88)=(-1);
  g1(34,57)=1;
  g1(35,82)=(-1);
  g1(35,58)=1;
  g1(36,90)=(-1);
  g1(36,59)=1;
  g1(37,91)=(-1);
  g1(37,60)=1;
  g1(38,1)=(-1);
  g1(38,61)=1;
  g1(39,10)=(-1);
  g1(39,62)=1;
  g1(40,8)=(-1);
  g1(40,63)=1;
  g1(41,12)=(-1);
  g1(41,64)=1;
  g1(42,13)=(-1);
  g1(42,65)=1;
  g1(43,9)=(-1);
  g1(43,66)=1;
  g1(44,15)=(-1);
  g1(44,67)=1;
  g1(45,16)=(-1);
  g1(45,68)=1;
  g1(46,6)=(-1);
  g1(46,69)=1;
  g1(47,18)=(-1);
  g1(47,70)=1;
  g1(48,19)=(-1);
  g1(48,71)=1;
  g1(49,7)=(-1);
  g1(49,72)=1;
  g1(50,21)=(-1);
  g1(50,73)=1;
  g1(51,22)=(-1);
  g1(51,74)=1;

if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],51,9216);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],51,884736);
end
end
end
end
