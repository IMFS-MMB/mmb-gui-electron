function [residual, g1, g2, g3] = NK_RW06AL_dynamic(y, x, params, steady_state, it_)
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

residual = zeros(12, 1);
lhs =y(11);
rhs =y(10)*4;
residual(1)= lhs-rhs;
lhs =y(16);
rhs =y(2);
residual(2)= lhs-rhs;
lhs =y(17);
rhs =y(5);
residual(3)= lhs-rhs;
lhs =y(18);
rhs =y(16)+y(17);
residual(4)= lhs-rhs;
lhs =y(12);
rhs =y(19);
residual(5)= lhs-rhs;
lhs =y(13);
rhs =4*y(9);
residual(6)= lhs-rhs;
lhs =y(14);
rhs =y(8);
residual(7)= lhs-rhs;
lhs =y(15);
rhs =y(8);
residual(8)= lhs-rhs;
lhs =y(19);
rhs =0.25*(y(2)+y(13)+y(7));
residual(9)= lhs-rhs;
lhs =y(11);
rhs =params(1)*y(1)+y(13)*params(5)+y(2)*params(6)+y(5)*params(7)+params(8)*y(6)+params(10)*y(22)+y(14)*params(14)+params(15)*y(3)+y(15)*params(23)+params(24)*y(4)+params(32)*x(it_, 2);
residual(10)= lhs-rhs;
lhs =y(8);
rhs =y(20)-1/params(35)*(y(10)-y(21))+x(it_, 1);
residual(11)= lhs-rhs;
lhs =y(9);
rhs =y(21)*params(37)+y(8)*params(39)*(params(35)+params(36))+y(10)*params(39);
residual(12)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(12, 24);

  %
  % Jacobian matrix
  %

  g1(1,10)=(-4);
  g1(1,11)=1;
  g1(2,2)=(-1);
  g1(2,16)=1;
  g1(3,5)=(-1);
  g1(3,17)=1;
  g1(4,16)=(-1);
  g1(4,17)=(-1);
  g1(4,18)=1;
  g1(5,12)=1;
  g1(5,19)=(-1);
  g1(6,9)=(-4);
  g1(6,13)=1;
  g1(7,8)=(-1);
  g1(7,14)=1;
  g1(8,8)=(-1);
  g1(8,15)=1;
  g1(9,2)=(-0.25);
  g1(9,13)=(-0.25);
  g1(9,7)=(-0.25);
  g1(9,19)=1;
  g1(10,1)=(-params(1));
  g1(10,11)=1;
  g1(10,2)=(-params(6));
  g1(10,13)=(-params(5));
  g1(10,22)=(-params(10));
  g1(10,3)=(-params(15));
  g1(10,14)=(-params(14));
  g1(10,4)=(-params(24));
  g1(10,15)=(-params(23));
  g1(10,5)=(-params(7));
  g1(10,6)=(-params(8));
  g1(10,24)=(-params(32));
  g1(11,8)=1;
  g1(11,20)=(-1);
  g1(11,21)=(-(1/params(35)));
  g1(11,10)=1/params(35);
  g1(11,23)=(-1);
  g1(12,8)=(-(params(39)*(params(35)+params(36))));
  g1(12,9)=1;
  g1(12,21)=(-params(37));
  g1(12,10)=(-params(39));
end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],12,576);
end
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],12,13824);
end
end
