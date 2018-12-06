function [residual, g1, g2, g3] = NK_BGG99AL_dynamic(y, x, params, steady_state, it_)
%
% Status : Computes dynamic model for Dynare
%
% Inputs :
%   y         [#dynamic variables by 1] double    vector of endogenous variables in the order stored
%                                                 in M_.lead_lag_incidence; see the Manual
%   x         [M_.exo_nbr by nperiods] double     matrix of exogenous variables (in declaration order)
%                                                 for all simulation periods
%   params    [M_.param_nbr by 1] double          vector of parameter values in declaration order
%   it_       scalar double                       time period for exogenous variables for which to evaluate the model
%
% Outputs:
%   residual  [M_.endo_nbr by 1] double    vector of residuals of the dynamic model equations in order of 
%                                          declaration of the equations
%   g1        [M_.endo_nbr by #dynamic variables] double    Jacobian matrix of the dynamic model equations;
%                                                           rows: equations in order of declaration
%                                                           columns: variables in order stored in M_.lead_lag_incidence
%   g2        [M_.endo_nbr by (#dynamic variables)^2] double   Hessian matrix of the dynamic model equations;
%                                                              rows: equations in order of declaration
%                                                              columns: variables in order stored in M_.lead_lag_incidence
%   g3        [M_.endo_nbr by (#dynamic variables)^3] double   Third order derivative matrix of the dynamic model equations;
%                                                              rows: equations in order of declaration
%                                                              columns: variables in order stored in M_.lead_lag_incidence
%
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

%
% Model equations
%

residual = zeros(37, 1);
T148 = params(42)^(-1);
T199 = (1-params(39))*(1-params(36))*params(60)/params(47);
lhs =y(46);
rhs =4*y(22);
residual(1)= lhs-rhs;
lhs =y(47);
rhs =0.25*(y(48)+y(49)+y(50)+y(15));
residual(2)= lhs-rhs;
lhs =y(48);
rhs =4*y(31);
residual(3)= lhs-rhs;
lhs =y(49);
rhs =y(13);
residual(4)= lhs-rhs;
lhs =y(50);
rhs =y(14);
residual(5)= lhs-rhs;
lhs =y(51);
rhs =y(49)+y(50);
residual(6)= lhs-rhs;
lhs =y(52);
rhs =y(18)-y(37);
residual(7)= lhs-rhs;
lhs =y(53);
rhs =y(18);
residual(8)= lhs-rhs;
lhs =y(54);
rhs =y(36);
residual(9)= lhs-rhs;
lhs =y(46);
rhs =params(1)*y(12)+y(48)*params(5)+y(13)*params(6)+y(14)*params(7)+y(15)*params(8)+params(10)*y(62)+y(52)*params(14)+params(15)*y(16)+y(53)*params(23)+params(24)*y(17)+params(32)*x(it_, 2);
residual(10)= lhs-rhs;
lhs =y(54);
rhs =params(34)*x(it_, 3);
residual(11)= lhs-rhs;
lhs =y(18);
rhs =params(48)*y(25)+params(50)*y(20)+params(51)*y(26);
residual(12)= lhs-rhs;
lhs =y(25);
rhs =(-y(21))+y(56);
residual(13)= lhs-rhs;
residual(14) = y(27);
lhs =y(55)-y(21);
rhs =(-params(40))*(y(24)-y(28)-y(19));
residual(15)= lhs-rhs;
lhs =y(23);
rhs =(1-params(41))*(y(18)-y(1)-y(29))+y(28)*params(41)-y(5);
residual(16)= lhs-rhs;
lhs =y(28);
rhs =params(43)*(y(20)-y(1));
residual(17)= lhs-rhs;
lhs =y(18);
rhs =y(32)+y(1)*params(39)+(1-params(39))*params(36)*y(30);
residual(18)= lhs-rhs;
lhs =y(18)-y(30)-y(29)-y(25);
rhs =y(30)*T148;
residual(19)= lhs-rhs;
lhs =y(33);
rhs =(-params(44))*y(57)+params(45)*y(59);
residual(20)= lhs-rhs;
lhs =y(31);
rhs =y(7);
residual(21)= lhs-rhs;
lhs =y(35);
rhs =y(58);
residual(22)= lhs-rhs;
lhs =y(19);
rhs =y(20)*params(46)+y(1)*(1-params(46));
residual(23)= lhs-rhs;
lhs =y(24);
rhs =y(23)*params(37)*params(55)*params(53)-params(53)*params(37)*params(54)*y(2)+params(53)*params(37)*(params(55)-params(54))*(y(1)+y(5))+params(37)*params(54)*(y(2)+y(3))+T199*(y(18)-y(29));
residual(24)= lhs-rhs;
lhs =y(26);
rhs =y(36)+params(62)*y(4);
residual(25)= lhs-rhs;
lhs =y(32);
rhs =params(63)*y(6)+x(it_, 1);
residual(26)= lhs-rhs;
lhs =y(21);
rhs =y(22)-y(58);
residual(27)= lhs-rhs;
lhs =y(34);
rhs =y(55)-y(21);
residual(28)= lhs-rhs;
lhs =y(37);
rhs =params(51)*y(26)+params(48)*y(43)+params(50)*y(39);
residual(29)= lhs-rhs;
lhs =y(43);
rhs =(-y(40))+y(61);
residual(30)= lhs-rhs;
lhs =y(60)-y(40);
rhs =(-params(40))*(y(42)-y(44)-y(38));
residual(31)= lhs-rhs;
lhs =y(41);
rhs =(1-params(41))*(y(37)-y(8))+params(41)*y(44)-y(11);
residual(32)= lhs-rhs;
lhs =y(44);
rhs =params(43)*(y(39)-y(8));
residual(33)= lhs-rhs;
lhs =y(37);
rhs =y(32)+params(39)*y(8)+(1-params(39))*params(36)*y(45);
residual(34)= lhs-rhs;
lhs =y(37)-y(45)-y(43);
rhs =T148*y(45);
residual(35)= lhs-rhs;
lhs =y(38);
rhs =params(46)*y(39)+(1-params(46))*y(8);
residual(36)= lhs-rhs;
lhs =y(42);
rhs =params(37)*params(55)*params(53)*y(41)-params(53)*params(37)*params(54)*y(9)+params(53)*params(37)*(params(55)-params(54))*(y(8)+y(11))+params(37)*params(54)*(y(9)+y(10))+y(37)*T199;
residual(37)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(37, 65);

  %
  % Jacobian matrix
  %

  g1(1,22)=(-4);
  g1(1,46)=1;
  g1(2,47)=1;
  g1(2,48)=(-0.25);
  g1(2,49)=(-0.25);
  g1(2,15)=(-0.25);
  g1(2,50)=(-0.25);
  g1(3,31)=(-4);
  g1(3,48)=1;
  g1(4,13)=(-1);
  g1(4,49)=1;
  g1(5,14)=(-1);
  g1(5,50)=1;
  g1(6,49)=(-1);
  g1(6,50)=(-1);
  g1(6,51)=1;
  g1(7,18)=(-1);
  g1(7,37)=1;
  g1(7,52)=1;
  g1(8,18)=(-1);
  g1(8,53)=1;
  g1(9,36)=(-1);
  g1(9,54)=1;
  g1(10,12)=(-params(1));
  g1(10,46)=1;
  g1(10,13)=(-params(6));
  g1(10,48)=(-params(5));
  g1(10,62)=(-params(10));
  g1(10,14)=(-params(7));
  g1(10,15)=(-params(8));
  g1(10,16)=(-params(15));
  g1(10,52)=(-params(14));
  g1(10,17)=(-params(24));
  g1(10,53)=(-params(23));
  g1(10,64)=(-params(32));
  g1(11,54)=1;
  g1(11,65)=(-params(34));
  g1(12,18)=1;
  g1(12,20)=(-params(50));
  g1(12,25)=(-params(48));
  g1(12,26)=(-params(51));
  g1(13,21)=1;
  g1(13,25)=1;
  g1(13,56)=(-1);
  g1(14,27)=1;
  g1(15,19)=(-params(40));
  g1(15,21)=(-1);
  g1(15,55)=1;
  g1(15,24)=params(40);
  g1(15,28)=(-params(40));
  g1(16,18)=(-(1-params(41)));
  g1(16,1)=1-params(41);
  g1(16,23)=1;
  g1(16,5)=1;
  g1(16,28)=(-params(41));
  g1(16,29)=1-params(41);
  g1(17,1)=params(43);
  g1(17,20)=(-params(43));
  g1(17,28)=1;
  g1(18,18)=1;
  g1(18,1)=(-params(39));
  g1(18,30)=(-((1-params(39))*params(36)));
  g1(18,32)=(-1);
  g1(19,18)=1;
  g1(19,25)=(-1);
  g1(19,29)=(-1);
  g1(19,30)=(-1)-T148;
  g1(20,57)=params(44);
  g1(20,33)=1;
  g1(20,59)=(-params(45));
  g1(21,31)=1;
  g1(21,7)=(-1);
  g1(22,58)=(-1);
  g1(22,35)=1;
  g1(23,1)=(-(1-params(46)));
  g1(23,19)=1;
  g1(23,20)=(-params(46));
  g1(24,18)=(-T199);
  g1(24,1)=(-(params(53)*params(37)*(params(55)-params(54))));
  g1(24,2)=(-(params(37)*params(54)+(-(params(53)*params(37)*params(54)))));
  g1(24,23)=(-(params(37)*params(55)*params(53)));
  g1(24,3)=(-(params(37)*params(54)));
  g1(24,24)=1;
  g1(24,5)=(-(params(53)*params(37)*(params(55)-params(54))));
  g1(24,29)=T199;
  g1(25,4)=(-params(62));
  g1(25,26)=1;
  g1(25,36)=(-1);
  g1(26,6)=(-params(63));
  g1(26,32)=1;
  g1(26,63)=(-1);
  g1(27,21)=1;
  g1(27,22)=(-1);
  g1(27,58)=1;
  g1(28,21)=1;
  g1(28,55)=(-1);
  g1(28,34)=1;
  g1(29,26)=(-params(51));
  g1(29,37)=1;
  g1(29,39)=(-params(50));
  g1(29,43)=(-params(48));
  g1(30,40)=1;
  g1(30,43)=1;
  g1(30,61)=(-1);
  g1(31,38)=(-params(40));
  g1(31,40)=(-1);
  g1(31,60)=1;
  g1(31,42)=params(40);
  g1(31,44)=(-params(40));
  g1(32,37)=(-(1-params(41)));
  g1(32,8)=1-params(41);
  g1(32,41)=1;
  g1(32,11)=1;
  g1(32,44)=(-params(41));
  g1(33,8)=params(43);
  g1(33,39)=(-params(43));
  g1(33,44)=1;
  g1(34,32)=(-1);
  g1(34,37)=1;
  g1(34,8)=(-params(39));
  g1(34,45)=(-((1-params(39))*params(36)));
  g1(35,37)=1;
  g1(35,43)=(-1);
  g1(35,45)=(-1)-T148;
  g1(36,8)=(-(1-params(46)));
  g1(36,38)=1;
  g1(36,39)=(-params(46));
  g1(37,37)=(-T199);
  g1(37,8)=(-(params(53)*params(37)*(params(55)-params(54))));
  g1(37,9)=(-(params(37)*params(54)+(-(params(53)*params(37)*params(54)))));
  g1(37,41)=(-(params(37)*params(55)*params(53)));
  g1(37,10)=(-(params(37)*params(54)));
  g1(37,42)=1;
  g1(37,11)=(-(params(53)*params(37)*(params(55)-params(54))));
end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],37,4225);
end
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],37,274625);
end
end
