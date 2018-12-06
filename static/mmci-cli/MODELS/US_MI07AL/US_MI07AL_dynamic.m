function [residual, g1, g2, g3] = US_MI07AL_dynamic(y, x, params, steady_state, it_)
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

residual = zeros(15, 1);
T96 = ((1-params(35)*params(40))*params(36))^(-1);
lhs =y(18);
rhs =y(11)*4;
residual(1)= lhs-rhs;
lhs =y(23);
rhs =y(6);
residual(2)= lhs-rhs;
lhs =y(24);
rhs =y(9);
residual(3)= lhs-rhs;
lhs =y(25);
rhs =y(23)+y(24);
residual(4)= lhs-rhs;
lhs =y(20);
rhs =4*y(12);
residual(5)= lhs-rhs;
lhs =y(21);
rhs =y(14);
residual(6)= lhs-rhs;
lhs =y(22);
rhs =y(14);
residual(7)= lhs-rhs;
lhs =y(19);
rhs =0.25*(y(24)+y(23)+y(20)+y(10));
residual(8)= lhs-rhs;
lhs =y(18);
rhs =params(1)*y(5)+y(20)*params(5)+y(6)*params(6)+y(9)*params(7)+y(10)*params(8)+params(10)*y(30)+y(21)*params(14)+params(15)*y(7)+y(22)*params(23)+params(24)*y(8)+params(32)*x(it_, 3);
residual(9)= lhs-rhs;
lhs =y(15);
rhs =y(29)-(1-params(35)*params(40))*params(36)*(y(11)-y(26)-y(16));
residual(10)= lhs-rhs;
lhs =y(13);
rhs =params(38)*(y(14)*params(39)+y(15)*T96)+params(35)*y(27)+y(17);
residual(11)= lhs-rhs;
lhs =y(13);
rhs =y(12)-params(37)*y(1);
residual(12)= lhs-rhs;
lhs =y(15);
rhs =y(14)-params(40)*y(2)-params(35)*params(40)*(y(28)-y(14)*params(40));
residual(13)= lhs-rhs;
lhs =y(16);
rhs =params(41)*y(3)+x(it_, 1);
residual(14)= lhs-rhs;
lhs =y(17);
rhs =params(42)*y(4)+x(it_, 2);
residual(15)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(15, 33);

  %
  % Jacobian matrix
  %

  g1(1,11)=(-4);
  g1(1,18)=1;
  g1(2,6)=(-1);
  g1(2,23)=1;
  g1(3,9)=(-1);
  g1(3,24)=1;
  g1(4,23)=(-1);
  g1(4,24)=(-1);
  g1(4,25)=1;
  g1(5,12)=(-4);
  g1(5,20)=1;
  g1(6,14)=(-1);
  g1(6,21)=1;
  g1(7,14)=(-1);
  g1(7,22)=1;
  g1(8,19)=1;
  g1(8,20)=(-0.25);
  g1(8,23)=(-0.25);
  g1(8,10)=(-0.25);
  g1(8,24)=(-0.25);
  g1(9,5)=(-params(1));
  g1(9,18)=1;
  g1(9,6)=(-params(6));
  g1(9,20)=(-params(5));
  g1(9,30)=(-params(10));
  g1(9,7)=(-params(15));
  g1(9,21)=(-params(14));
  g1(9,8)=(-params(24));
  g1(9,22)=(-params(23));
  g1(9,9)=(-params(7));
  g1(9,10)=(-params(8));
  g1(9,33)=(-params(32));
  g1(10,11)=(1-params(35)*params(40))*params(36);
  g1(10,26)=(-((1-params(35)*params(40))*params(36)));
  g1(10,15)=1;
  g1(10,29)=(-1);
  g1(10,16)=(-((1-params(35)*params(40))*params(36)));
  g1(11,13)=1;
  g1(11,27)=(-params(35));
  g1(11,14)=(-(params(38)*params(39)));
  g1(11,15)=(-(params(38)*T96));
  g1(11,17)=(-1);
  g1(12,1)=params(37);
  g1(12,12)=(-1);
  g1(12,13)=1;
  g1(13,2)=params(40);
  g1(13,14)=(-(1-params(35)*params(40)*(-params(40))));
  g1(13,28)=params(35)*params(40);
  g1(13,15)=1;
  g1(14,3)=(-params(41));
  g1(14,16)=1;
  g1(14,31)=(-1);
  g1(15,4)=(-params(42));
  g1(15,17)=1;
  g1(15,32)=(-1);

if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],15,1089);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],15,35937);
end
end
end
end
