function [residual, g1, g2, g3] = NK_CGG99_dynamic(y, x, params, steady_state, it_)
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

residual = zeros(24, 1);
lhs =y(20);
rhs =y(18)*4;
residual(1)= lhs-rhs;
lhs =y(21);
rhs =y(19)+y(2)+y(6)+y(7);
residual(2)= lhs-rhs;
lhs =y(22);
rhs =4*y(19);
residual(3)= lhs-rhs;
lhs =y(23);
rhs =y(17);
residual(4)= lhs-rhs;
lhs =y(20);
rhs =params(32)*x(it_, 3)+params(22)*y(50)+params(21)*y(49)+params(20)*y(48)+params(19)*y(44)+params(18)*y(10)+params(17)*y(9)+params(16)*y(8)+params(15)*y(5)+y(23)*params(14)+params(13)*y(47)+params(12)*y(46)+params(11)*y(45)+params(10)*y(43)+params(6)*y(4)+y(22)*params(5)+params(1)*y(3)+params(2)*y(11)+params(3)*y(12)+params(4)*y(13)+params(7)*y(14)+params(8)*y(15)+params(9)*y(16);
residual(5)= lhs-rhs;
lhs =y(17);
rhs =params(36)*(y(18)-y(42))+params(35)*y(1)+(1-params(35))*y(41)+x(it_, 2);
residual(6)= lhs-rhs;
lhs =y(19);
rhs =y(17)*params(38)+y(2)*params(37)+y(42)*(1-params(37))*params(39)+x(it_, 1);
residual(7)= lhs-rhs;
lhs =y(24);
rhs =y(43);
residual(8)= lhs-rhs;
lhs =y(25);
rhs =y(45);
residual(9)= lhs-rhs;
lhs =y(26);
rhs =y(46);
residual(10)= lhs-rhs;
lhs =y(27);
rhs =y(44);
residual(11)= lhs-rhs;
lhs =y(28);
rhs =y(48);
residual(12)= lhs-rhs;
lhs =y(29);
rhs =y(49);
residual(13)= lhs-rhs;
lhs =y(30);
rhs =y(2);
residual(14)= lhs-rhs;
lhs =y(31);
rhs =y(6);
residual(15)= lhs-rhs;
lhs =y(32);
rhs =y(5);
residual(16)= lhs-rhs;
lhs =y(33);
rhs =y(8);
residual(17)= lhs-rhs;
lhs =y(34);
rhs =y(9);
residual(18)= lhs-rhs;
lhs =y(35);
rhs =y(3);
residual(19)= lhs-rhs;
lhs =y(36);
rhs =y(11);
residual(20)= lhs-rhs;
lhs =y(37);
rhs =y(12);
residual(21)= lhs-rhs;
lhs =y(38);
rhs =y(4);
residual(22)= lhs-rhs;
lhs =y(39);
rhs =y(14);
residual(23)= lhs-rhs;
lhs =y(40);
rhs =y(15);
residual(24)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(24, 53);

  %
  % Jacobian matrix
  %

  g1(1,18)=(-4);
  g1(1,20)=1;
  g1(2,2)=(-1);
  g1(2,19)=(-1);
  g1(2,21)=1;
  g1(2,6)=(-1);
  g1(2,7)=(-1);
  g1(3,19)=(-4);
  g1(3,22)=1;
  g1(4,17)=(-1);
  g1(4,23)=1;
  g1(5,3)=(-params(1));
  g1(5,20)=1;
  g1(5,4)=(-params(6));
  g1(5,22)=(-params(5));
  g1(5,43)=(-params(10));
  g1(5,5)=(-params(15));
  g1(5,23)=(-params(14));
  g1(5,44)=(-params(19));
  g1(5,53)=(-params(32));
  g1(5,45)=(-params(11));
  g1(5,46)=(-params(12));
  g1(5,47)=(-params(13));
  g1(5,48)=(-params(20));
  g1(5,49)=(-params(21));
  g1(5,50)=(-params(22));
  g1(5,8)=(-params(16));
  g1(5,9)=(-params(17));
  g1(5,10)=(-params(18));
  g1(5,11)=(-params(2));
  g1(5,12)=(-params(3));
  g1(5,13)=(-params(4));
  g1(5,14)=(-params(7));
  g1(5,15)=(-params(8));
  g1(5,16)=(-params(9));
  g1(6,1)=(-params(35));
  g1(6,17)=1;
  g1(6,41)=(-(1-params(35)));
  g1(6,18)=(-params(36));
  g1(6,42)=params(36);
  g1(6,52)=(-1);
  g1(7,17)=(-params(38));
  g1(7,2)=(-params(37));
  g1(7,19)=1;
  g1(7,42)=(-((1-params(37))*params(39)));
  g1(7,51)=(-1);
  g1(8,43)=(-1);
  g1(8,24)=1;
  g1(9,45)=(-1);
  g1(9,25)=1;
  g1(10,46)=(-1);
  g1(10,26)=1;
  g1(11,44)=(-1);
  g1(11,27)=1;
  g1(12,48)=(-1);
  g1(12,28)=1;
  g1(13,49)=(-1);
  g1(13,29)=1;
  g1(14,2)=(-1);
  g1(14,30)=1;
  g1(15,6)=(-1);
  g1(15,31)=1;
  g1(16,5)=(-1);
  g1(16,32)=1;
  g1(17,8)=(-1);
  g1(17,33)=1;
  g1(18,9)=(-1);
  g1(18,34)=1;
  g1(19,3)=(-1);
  g1(19,35)=1;
  g1(20,11)=(-1);
  g1(20,36)=1;
  g1(21,12)=(-1);
  g1(21,37)=1;
  g1(22,4)=(-1);
  g1(22,38)=1;
  g1(23,14)=(-1);
  g1(23,39)=1;
  g1(24,15)=(-1);
  g1(24,40)=1;

if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],24,2809);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],24,148877);
end
end
end
end
