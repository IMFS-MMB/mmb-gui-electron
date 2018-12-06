function [residual, g1, g2, g3] = NK_LWW03_dynamic(y, x, params, steady_state, it_)
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

residual = zeros(27, 1);
lhs =y(25);
rhs =y(21);
residual(1)= lhs-rhs;
lhs =y(26);
rhs =0.25*(y(20)+y(1)+y(8)+y(9));
residual(2)= lhs-rhs;
lhs =y(27);
rhs =y(20);
residual(3)= lhs-rhs;
lhs =y(28);
rhs =y(19);
residual(4)= lhs-rhs;
lhs =y(25);
rhs =params(32)*x(it_, 3)+params(22)*y(55)+params(21)*y(54)+params(20)*y(53)+params(19)*y(49)+params(18)*y(12)+params(17)*y(11)+params(16)*y(10)+params(15)*y(7)+y(28)*params(14)+params(13)*y(52)+params(12)*y(51)+params(11)*y(50)+params(10)*y(48)+params(6)*y(6)+y(27)*params(5)+params(1)*y(5)+params(2)*y(13)+params(3)*y(14)+params(4)*y(15)+params(7)*y(16)+params(8)*y(17)+params(9)*y(18);
residual(5)= lhs-rhs;
lhs =y(19);
rhs =y(46)-0.25*params(36)*(y(21)-y(47)-y(22));
residual(6)= lhs-rhs;
lhs =y(20);
rhs =y(47)*params(35)+y(19)*4*params(37)+y(24);
residual(7)= lhs-rhs;
lhs =y(23);
rhs =y(21)-y(2);
residual(8)= lhs-rhs;
lhs =y(22);
rhs =params(39)*y(3)+x(it_, 1);
residual(9)= lhs-rhs;
lhs =y(24);
rhs =params(40)*y(4)+x(it_, 2);
residual(10)= lhs-rhs;
lhs =y(29);
rhs =y(48);
residual(11)= lhs-rhs;
lhs =y(30);
rhs =y(50);
residual(12)= lhs-rhs;
lhs =y(31);
rhs =y(51);
residual(13)= lhs-rhs;
lhs =y(32);
rhs =y(49);
residual(14)= lhs-rhs;
lhs =y(33);
rhs =y(53);
residual(15)= lhs-rhs;
lhs =y(34);
rhs =y(54);
residual(16)= lhs-rhs;
lhs =y(35);
rhs =y(1);
residual(17)= lhs-rhs;
lhs =y(36);
rhs =y(8);
residual(18)= lhs-rhs;
lhs =y(37);
rhs =y(7);
residual(19)= lhs-rhs;
lhs =y(38);
rhs =y(10);
residual(20)= lhs-rhs;
lhs =y(39);
rhs =y(11);
residual(21)= lhs-rhs;
lhs =y(40);
rhs =y(5);
residual(22)= lhs-rhs;
lhs =y(41);
rhs =y(13);
residual(23)= lhs-rhs;
lhs =y(42);
rhs =y(14);
residual(24)= lhs-rhs;
lhs =y(43);
rhs =y(6);
residual(25)= lhs-rhs;
lhs =y(44);
rhs =y(16);
residual(26)= lhs-rhs;
lhs =y(45);
rhs =y(17);
residual(27)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(27, 58);

  %
  % Jacobian matrix
  %

  g1(1,21)=(-1);
  g1(1,25)=1;
  g1(2,1)=(-0.25);
  g1(2,20)=(-0.25);
  g1(2,26)=1;
  g1(2,8)=(-0.25);
  g1(2,9)=(-0.25);
  g1(3,20)=(-1);
  g1(3,27)=1;
  g1(4,19)=(-1);
  g1(4,28)=1;
  g1(5,5)=(-params(1));
  g1(5,25)=1;
  g1(5,6)=(-params(6));
  g1(5,27)=(-params(5));
  g1(5,48)=(-params(10));
  g1(5,7)=(-params(15));
  g1(5,28)=(-params(14));
  g1(5,49)=(-params(19));
  g1(5,58)=(-params(32));
  g1(5,50)=(-params(11));
  g1(5,51)=(-params(12));
  g1(5,52)=(-params(13));
  g1(5,53)=(-params(20));
  g1(5,54)=(-params(21));
  g1(5,55)=(-params(22));
  g1(5,10)=(-params(16));
  g1(5,11)=(-params(17));
  g1(5,12)=(-params(18));
  g1(5,13)=(-params(2));
  g1(5,14)=(-params(3));
  g1(5,15)=(-params(4));
  g1(5,16)=(-params(7));
  g1(5,17)=(-params(8));
  g1(5,18)=(-params(9));
  g1(6,19)=1;
  g1(6,46)=(-1);
  g1(6,47)=(-(0.25*params(36)));
  g1(6,21)=0.25*params(36);
  g1(6,22)=(-(0.25*params(36)));
  g1(7,19)=(-(4*params(37)));
  g1(7,20)=1;
  g1(7,47)=(-params(35));
  g1(7,24)=(-1);
  g1(8,2)=1;
  g1(8,21)=(-1);
  g1(8,23)=1;
  g1(9,3)=(-params(39));
  g1(9,22)=1;
  g1(9,56)=(-1);
  g1(10,4)=(-params(40));
  g1(10,24)=1;
  g1(10,57)=(-1);
  g1(11,48)=(-1);
  g1(11,29)=1;
  g1(12,50)=(-1);
  g1(12,30)=1;
  g1(13,51)=(-1);
  g1(13,31)=1;
  g1(14,49)=(-1);
  g1(14,32)=1;
  g1(15,53)=(-1);
  g1(15,33)=1;
  g1(16,54)=(-1);
  g1(16,34)=1;
  g1(17,1)=(-1);
  g1(17,35)=1;
  g1(18,8)=(-1);
  g1(18,36)=1;
  g1(19,7)=(-1);
  g1(19,37)=1;
  g1(20,10)=(-1);
  g1(20,38)=1;
  g1(21,11)=(-1);
  g1(21,39)=1;
  g1(22,5)=(-1);
  g1(22,40)=1;
  g1(23,13)=(-1);
  g1(23,41)=1;
  g1(24,14)=(-1);
  g1(24,42)=1;
  g1(25,6)=(-1);
  g1(25,43)=1;
  g1(26,16)=(-1);
  g1(26,44)=1;
  g1(27,17)=(-1);
  g1(27,45)=1;

if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],27,3364);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],27,195112);
end
end
end
end
