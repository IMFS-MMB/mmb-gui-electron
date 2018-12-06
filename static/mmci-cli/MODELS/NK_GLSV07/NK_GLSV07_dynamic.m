function [residual, g1, g2, g3] = NK_GLSV07_dynamic(y, x, params, steady_state, it_)
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

residual = zeros(44, 1);
T176 = 1-params(40)+params(40)*params(35)/(1-params(38));
lhs =y(40);
rhs =4*y(27);
residual(1)= lhs-rhs;
lhs =y(41);
rhs =y(28)+y(1)+y(11)+y(12);
residual(2)= lhs-rhs;
lhs =y(42);
rhs =4*y(28);
residual(3)= lhs-rhs;
lhs =y(43);
rhs =y(32)-y(38);
residual(4)= lhs-rhs;
lhs =y(44);
rhs =y(32);
residual(5)= lhs-rhs;
lhs =y(45);
rhs =y(33);
residual(6)= lhs-rhs;
lhs =y(40);
rhs =params(32)*x(it_, 1)+params(31)*y(85)+params(30)*y(84)+params(29)*y(83)+params(28)*y(76)+params(27)*y(15)+params(26)*y(14)+params(25)*y(13)+params(24)*y(10)+y(44)*params(23)+params(22)*y(82)+params(21)*y(81)+params(20)*y(80)+params(19)*y(75)+params(18)*y(18)+params(17)*y(17)+params(16)*y(16)+params(15)*y(9)+y(43)*params(14)+params(13)*y(79)+params(12)*y(78)+params(11)*y(77)+params(10)*y(74)+params(6)*y(8)+y(42)*params(5)+params(1)*y(7)+params(2)*y(19)+params(3)*y(20)+params(4)*y(21)+params(7)*y(22)+params(8)*y(23)+params(9)*y(24);
residual(7)= lhs-rhs;
lhs =y(45);
rhs =params(34)*x(it_, 2);
residual(8)= lhs-rhs;
lhs =y(29);
rhs =params(40)*y(25)*(1-params(35))/(1-params(38))+T176*y(2)-params(40)*y(26)*params(37)/(1-params(38))-params(40)*y(31)/(1-params(38));
residual(9)= lhs-rhs;
lhs =y(28);
rhs =y(25)*params(46)*(params(35)+params(55))+params(36)*y(71)+y(26)*params(46)-params(35)*params(46)*y(2);
residual(10)= lhs-rhs;
lhs =y(26)-y(25)*params(43)+y(27)/params(50);
rhs =y(31)*params(44)*params(52)*(params(49)-1)+y(70)+y(71)/params(50)-params(43)*y(69)+params(44)*params(51)*(y(30)-y(3));
residual(11)= lhs-rhs;
lhs =y(27)*(1-params(38))*params(41)+y(25)*(1-params(35))-y(26)*params(37)-(1-params(38)-params(35))*y(2);
rhs =y(31)*(1-params(36)*params(49))+y(71)*(1-params(38))*params(41)+y(69)*(params(54)*(1+params(55))+(1-params(35))*params(36))+y(70)*(params(54)-params(37)*params(36))-y(29)*(params(54)+params(36)*(1-params(38)-params(35)));
residual(12)= lhs-rhs;
lhs =y(30);
rhs =y(31)*(1+params(48))*(1-params(52))+(1+params(48))*(1-params(51))*y(3);
residual(13)= lhs-rhs;
lhs =y(31);
rhs =y(33)+params(49)*y(4);
residual(14)= lhs-rhs;
lhs =y(32);
rhs =y(25)*(1-params(35))+params(35)*y(2);
residual(15)= lhs-rhs;
lhs =y(36);
rhs =(1-params(35))*params(40)*y(34)/(1-params(38))+T176*y(5)-params(37)*params(40)*y(35)/(1-params(38))-params(40)*y(31)/(1-params(38));
residual(16)= lhs-rhs;
lhs =0;
rhs =(params(35)+params(55))*y(34)+y(35)-params(35)*y(5);
residual(17)= lhs-rhs;
lhs =y(35)-params(43)*y(34)+y(39)/params(50);
rhs =y(31)*params(44)*params(52)*(params(49)-1)+y(73)-params(43)*y(72)+params(44)*params(51)*(y(37)-y(6));
residual(18)= lhs-rhs;
lhs =(1-params(38))*params(41)*y(39)+(1-params(35))*y(34)-params(37)*y(35)-(1-params(38)-params(35))*y(5);
rhs =y(31)*(1-params(36)*params(49))+(params(54)*(1+params(55))+(1-params(35))*params(36))*y(72)+(params(54)-params(37)*params(36))*y(73)-(params(54)+params(36)*(1-params(38)-params(35)))*y(36);
residual(19)= lhs-rhs;
lhs =y(37);
rhs =y(31)*(1+params(48))*(1-params(52))+(1+params(48))*(1-params(51))*y(6);
residual(20)= lhs-rhs;
lhs =y(38);
rhs =(1-params(35))*y(34)+params(35)*y(5);
residual(21)= lhs-rhs;
lhs =y(46);
rhs =y(74);
residual(22)= lhs-rhs;
lhs =y(47);
rhs =y(77);
residual(23)= lhs-rhs;
lhs =y(48);
rhs =y(78);
residual(24)= lhs-rhs;
lhs =y(49);
rhs =y(75);
residual(25)= lhs-rhs;
lhs =y(50);
rhs =y(80);
residual(26)= lhs-rhs;
lhs =y(51);
rhs =y(81);
residual(27)= lhs-rhs;
lhs =y(52);
rhs =y(76);
residual(28)= lhs-rhs;
lhs =y(53);
rhs =y(83);
residual(29)= lhs-rhs;
lhs =y(54);
rhs =y(84);
residual(30)= lhs-rhs;
lhs =y(55);
rhs =y(1);
residual(31)= lhs-rhs;
lhs =y(56);
rhs =y(11);
residual(32)= lhs-rhs;
lhs =y(57);
rhs =y(10);
residual(33)= lhs-rhs;
lhs =y(58);
rhs =y(13);
residual(34)= lhs-rhs;
lhs =y(59);
rhs =y(14);
residual(35)= lhs-rhs;
lhs =y(60);
rhs =y(9);
residual(36)= lhs-rhs;
lhs =y(61);
rhs =y(16);
residual(37)= lhs-rhs;
lhs =y(62);
rhs =y(17);
residual(38)= lhs-rhs;
lhs =y(63);
rhs =y(7);
residual(39)= lhs-rhs;
lhs =y(64);
rhs =y(19);
residual(40)= lhs-rhs;
lhs =y(65);
rhs =y(20);
residual(41)= lhs-rhs;
lhs =y(66);
rhs =y(8);
residual(42)= lhs-rhs;
lhs =y(67);
rhs =y(22);
residual(43)= lhs-rhs;
lhs =y(68);
rhs =y(23);
residual(44)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(44, 87);

  %
  % Jacobian matrix
  %

  g1(1,27)=(-4);
  g1(1,40)=1;
  g1(2,1)=(-1);
  g1(2,28)=(-1);
  g1(2,41)=1;
  g1(2,11)=(-1);
  g1(2,12)=(-1);
  g1(3,28)=(-4);
  g1(3,42)=1;
  g1(4,32)=(-1);
  g1(4,38)=1;
  g1(4,43)=1;
  g1(5,32)=(-1);
  g1(5,44)=1;
  g1(6,33)=(-1);
  g1(6,45)=1;
  g1(7,7)=(-params(1));
  g1(7,40)=1;
  g1(7,8)=(-params(6));
  g1(7,42)=(-params(5));
  g1(7,74)=(-params(10));
  g1(7,9)=(-params(15));
  g1(7,43)=(-params(14));
  g1(7,75)=(-params(19));
  g1(7,10)=(-params(24));
  g1(7,44)=(-params(23));
  g1(7,76)=(-params(28));
  g1(7,86)=(-params(32));
  g1(7,77)=(-params(11));
  g1(7,78)=(-params(12));
  g1(7,79)=(-params(13));
  g1(7,80)=(-params(20));
  g1(7,81)=(-params(21));
  g1(7,82)=(-params(22));
  g1(7,83)=(-params(29));
  g1(7,84)=(-params(30));
  g1(7,85)=(-params(31));
  g1(7,13)=(-params(25));
  g1(7,14)=(-params(26));
  g1(7,15)=(-params(27));
  g1(7,16)=(-params(16));
  g1(7,17)=(-params(17));
  g1(7,18)=(-params(18));
  g1(7,19)=(-params(2));
  g1(7,20)=(-params(3));
  g1(7,21)=(-params(4));
  g1(7,22)=(-params(7));
  g1(7,23)=(-params(8));
  g1(7,24)=(-params(9));
  g1(8,45)=1;
  g1(8,87)=(-params(34));
  g1(9,25)=(-(params(40)*(1-params(35))/(1-params(38))));
  g1(9,26)=params(40)*params(37)/(1-params(38));
  g1(9,2)=(-T176);
  g1(9,29)=1;
  g1(9,31)=params(40)/(1-params(38));
  g1(10,25)=(-(params(46)*(params(35)+params(55))));
  g1(10,26)=(-params(46));
  g1(10,28)=1;
  g1(10,71)=(-params(36));
  g1(10,2)=params(35)*params(46);
  g1(11,25)=(-params(43));
  g1(11,69)=params(43);
  g1(11,26)=1;
  g1(11,70)=(-1);
  g1(11,27)=1/params(50);
  g1(11,71)=(-(1/params(50)));
  g1(11,3)=params(44)*params(51);
  g1(11,30)=(-(params(44)*params(51)));
  g1(11,31)=(-(params(44)*params(52)*(params(49)-1)));
  g1(12,25)=1-params(35);
  g1(12,69)=(-(params(54)*(1+params(55))+(1-params(35))*params(36)));
  g1(12,26)=(-params(37));
  g1(12,70)=(-(params(54)-params(37)*params(36)));
  g1(12,27)=(1-params(38))*params(41);
  g1(12,71)=(-((1-params(38))*params(41)));
  g1(12,2)=(-(1-params(38)-params(35)));
  g1(12,29)=params(54)+params(36)*(1-params(38)-params(35));
  g1(12,31)=(-(1-params(36)*params(49)));
  g1(13,3)=(-((1+params(48))*(1-params(51))));
  g1(13,30)=1;
  g1(13,31)=(-((1+params(48))*(1-params(52))));
  g1(14,4)=(-params(49));
  g1(14,31)=1;
  g1(14,33)=(-1);
  g1(15,25)=(-(1-params(35)));
  g1(15,2)=(-params(35));
  g1(15,32)=1;
  g1(16,31)=params(40)/(1-params(38));
  g1(16,34)=(-(params(40)*(1-params(35))/(1-params(38))));
  g1(16,35)=params(40)*params(37)/(1-params(38));
  g1(16,5)=(-T176);
  g1(16,36)=1;
  g1(17,34)=(-(params(35)+params(55)));
  g1(17,35)=(-1);
  g1(17,5)=params(35);
  g1(18,31)=(-(params(44)*params(52)*(params(49)-1)));
  g1(18,34)=(-params(43));
  g1(18,72)=params(43);
  g1(18,35)=1;
  g1(18,73)=(-1);
  g1(18,6)=params(44)*params(51);
  g1(18,37)=(-(params(44)*params(51)));
  g1(18,39)=1/params(50);
  g1(19,31)=(-(1-params(36)*params(49)));
  g1(19,34)=1-params(35);
  g1(19,72)=(-(params(54)*(1+params(55))+(1-params(35))*params(36)));
  g1(19,35)=(-params(37));
  g1(19,73)=(-(params(54)-params(37)*params(36)));
  g1(19,5)=(-(1-params(38)-params(35)));
  g1(19,36)=params(54)+params(36)*(1-params(38)-params(35));
  g1(19,39)=(1-params(38))*params(41);
  g1(20,31)=(-((1+params(48))*(1-params(52))));
  g1(20,6)=(-((1+params(48))*(1-params(51))));
  g1(20,37)=1;
  g1(21,34)=(-(1-params(35)));
  g1(21,5)=(-params(35));
  g1(21,38)=1;
  g1(22,74)=(-1);
  g1(22,46)=1;
  g1(23,77)=(-1);
  g1(23,47)=1;
  g1(24,78)=(-1);
  g1(24,48)=1;
  g1(25,75)=(-1);
  g1(25,49)=1;
  g1(26,80)=(-1);
  g1(26,50)=1;
  g1(27,81)=(-1);
  g1(27,51)=1;
  g1(28,76)=(-1);
  g1(28,52)=1;
  g1(29,83)=(-1);
  g1(29,53)=1;
  g1(30,84)=(-1);
  g1(30,54)=1;
  g1(31,1)=(-1);
  g1(31,55)=1;
  g1(32,11)=(-1);
  g1(32,56)=1;
  g1(33,10)=(-1);
  g1(33,57)=1;
  g1(34,13)=(-1);
  g1(34,58)=1;
  g1(35,14)=(-1);
  g1(35,59)=1;
  g1(36,9)=(-1);
  g1(36,60)=1;
  g1(37,16)=(-1);
  g1(37,61)=1;
  g1(38,17)=(-1);
  g1(38,62)=1;
  g1(39,7)=(-1);
  g1(39,63)=1;
  g1(40,19)=(-1);
  g1(40,64)=1;
  g1(41,20)=(-1);
  g1(41,65)=1;
  g1(42,8)=(-1);
  g1(42,66)=1;
  g1(43,22)=(-1);
  g1(43,67)=1;
  g1(44,23)=(-1);
  g1(44,68)=1;

if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],44,7569);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],44,658503);
end
end
end
end
