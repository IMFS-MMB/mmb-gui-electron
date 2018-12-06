function [residual, g1, g2, g3] = NK_MCN99cr_dynamic(y, x, params, steady_state, it_)
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

residual = zeros(31, 1);
T164 = 1/params(38)*1/params(40);
lhs =y(31);
rhs =400*y(24);
residual(1)= lhs-rhs;
lhs =y(32);
rhs =25*(4*y(21)+4*y(1)+4*y(10)+4*y(11));
residual(2)= lhs-rhs;
lhs =y(33);
rhs =400*y(21);
residual(3)= lhs-rhs;
lhs =y(34);
rhs =100*y(29);
residual(4)= lhs-rhs;
lhs =y(31);
rhs =params(32)*x(it_, 5)+params(22)*y(61)+params(21)*y(60)+params(20)*y(59)+params(19)*y(55)+params(18)*y(14)+params(17)*y(13)+params(16)*y(12)+params(15)*y(9)+y(34)*params(14)+params(13)*y(58)+params(12)*y(57)+params(11)*y(56)+params(10)*y(54)+params(6)*y(8)+y(33)*params(5)+params(1)*y(7)+params(2)*y(15)+params(3)*y(16)+params(4)*y(17)+params(7)*y(18)+params(8)*y(19)+params(9)*y(20);
residual(5)= lhs-rhs;
lhs =y(21);
rhs =y(22)-y(2);
residual(6)= lhs-rhs;
lhs =y(23);
rhs =y(53)-params(35)*params(36)*(y(24)-y(52))+params(36)*y(25);
residual(7)= lhs-rhs;
lhs =y(26)-y(22);
rhs =1/(params(35)*params(38))*params(37)*(y(23)-params(39)*y(27))-y(24)*T164+y(28);
residual(8)= lhs-rhs;
lhs =y(25);
rhs =params(41)*y(3)+x(it_, 4);
residual(9)= lhs-rhs;
lhs =y(28);
rhs =params(42)*y(5)+x(it_, 1);
residual(10)= lhs-rhs;
lhs =y(27);
rhs =params(43)+y(4)+x(it_, 2);
residual(11)= lhs-rhs;
lhs =y(30);
rhs =params(44)+params(45)*y(6)+x(it_, 3);
residual(12)= lhs-rhs;
lhs =y(29);
rhs =y(23)-y(30);
residual(13)= lhs-rhs;
lhs =y(21);
rhs =y(52)*params(46)+y(29)*params(47);
residual(14)= lhs-rhs;
lhs =y(35);
rhs =y(54);
residual(15)= lhs-rhs;
lhs =y(36);
rhs =y(56);
residual(16)= lhs-rhs;
lhs =y(37);
rhs =y(57);
residual(17)= lhs-rhs;
lhs =y(38);
rhs =y(55);
residual(18)= lhs-rhs;
lhs =y(39);
rhs =y(59);
residual(19)= lhs-rhs;
lhs =y(40);
rhs =y(60);
residual(20)= lhs-rhs;
lhs =y(41);
rhs =y(1);
residual(21)= lhs-rhs;
lhs =y(42);
rhs =y(10);
residual(22)= lhs-rhs;
lhs =y(43);
rhs =y(9);
residual(23)= lhs-rhs;
lhs =y(44);
rhs =y(12);
residual(24)= lhs-rhs;
lhs =y(45);
rhs =y(13);
residual(25)= lhs-rhs;
lhs =y(46);
rhs =y(7);
residual(26)= lhs-rhs;
lhs =y(47);
rhs =y(15);
residual(27)= lhs-rhs;
lhs =y(48);
rhs =y(16);
residual(28)= lhs-rhs;
lhs =y(49);
rhs =y(8);
residual(29)= lhs-rhs;
lhs =y(50);
rhs =y(18);
residual(30)= lhs-rhs;
lhs =y(51);
rhs =y(19);
residual(31)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(31, 66);

  %
  % Jacobian matrix
  %

  g1(1,24)=(-400);
  g1(1,31)=1;
  g1(2,1)=(-100);
  g1(2,21)=(-100);
  g1(2,32)=1;
  g1(2,10)=(-100);
  g1(2,11)=(-100);
  g1(3,21)=(-400);
  g1(3,33)=1;
  g1(4,29)=(-100);
  g1(4,34)=1;
  g1(5,7)=(-params(1));
  g1(5,31)=1;
  g1(5,8)=(-params(6));
  g1(5,33)=(-params(5));
  g1(5,54)=(-params(10));
  g1(5,9)=(-params(15));
  g1(5,34)=(-params(14));
  g1(5,55)=(-params(19));
  g1(5,66)=(-params(32));
  g1(5,56)=(-params(11));
  g1(5,57)=(-params(12));
  g1(5,58)=(-params(13));
  g1(5,59)=(-params(20));
  g1(5,60)=(-params(21));
  g1(5,61)=(-params(22));
  g1(5,12)=(-params(16));
  g1(5,13)=(-params(17));
  g1(5,14)=(-params(18));
  g1(5,15)=(-params(2));
  g1(5,16)=(-params(3));
  g1(5,17)=(-params(4));
  g1(5,18)=(-params(7));
  g1(5,19)=(-params(8));
  g1(5,20)=(-params(9));
  g1(6,21)=1;
  g1(6,2)=1;
  g1(6,22)=(-1);
  g1(7,52)=(-(params(35)*params(36)));
  g1(7,23)=1;
  g1(7,53)=(-1);
  g1(7,24)=params(35)*params(36);
  g1(7,25)=(-params(36));
  g1(8,22)=(-1);
  g1(8,23)=(-(1/(params(35)*params(38))*params(37)));
  g1(8,24)=T164;
  g1(8,26)=1;
  g1(8,27)=(-(1/(params(35)*params(38))*params(37)*(-params(39))));
  g1(8,28)=(-1);
  g1(9,3)=(-params(41));
  g1(9,25)=1;
  g1(9,65)=(-1);
  g1(10,5)=(-params(42));
  g1(10,28)=1;
  g1(10,62)=(-1);
  g1(11,4)=(-1);
  g1(11,27)=1;
  g1(11,63)=(-1);
  g1(12,6)=(-params(45));
  g1(12,30)=1;
  g1(12,64)=(-1);
  g1(13,23)=(-1);
  g1(13,29)=1;
  g1(13,30)=1;
  g1(14,21)=1;
  g1(14,52)=(-params(46));
  g1(14,29)=(-params(47));
  g1(15,54)=(-1);
  g1(15,35)=1;
  g1(16,56)=(-1);
  g1(16,36)=1;
  g1(17,57)=(-1);
  g1(17,37)=1;
  g1(18,55)=(-1);
  g1(18,38)=1;
  g1(19,59)=(-1);
  g1(19,39)=1;
  g1(20,60)=(-1);
  g1(20,40)=1;
  g1(21,1)=(-1);
  g1(21,41)=1;
  g1(22,10)=(-1);
  g1(22,42)=1;
  g1(23,9)=(-1);
  g1(23,43)=1;
  g1(24,12)=(-1);
  g1(24,44)=1;
  g1(25,13)=(-1);
  g1(25,45)=1;
  g1(26,7)=(-1);
  g1(26,46)=1;
  g1(27,15)=(-1);
  g1(27,47)=1;
  g1(28,16)=(-1);
  g1(28,48)=1;
  g1(29,8)=(-1);
  g1(29,49)=1;
  g1(30,18)=(-1);
  g1(30,50)=1;
  g1(31,19)=(-1);
  g1(31,51)=1;

if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],31,4356);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],31,287496);
end
end
end
end
