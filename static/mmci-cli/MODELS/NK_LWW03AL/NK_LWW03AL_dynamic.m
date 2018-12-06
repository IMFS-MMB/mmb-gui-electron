function [residual, g1, g2, g3] = NK_LWW03AL_dynamic(y, x, params, steady_state, it_)
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

residual = zeros(15, 1);
lhs =y(17);
rhs =y(12);
residual(1)= lhs-rhs;
lhs =y(18);
rhs =y(16);
residual(2)= lhs-rhs;
lhs =y(19);
rhs =y(11);
residual(3)= lhs-rhs;
lhs =y(22);
rhs =y(5);
residual(4)= lhs-rhs;
lhs =y(23);
rhs =y(8);
residual(5)= lhs-rhs;
lhs =y(24);
rhs =y(22)+y(23);
residual(6)= lhs-rhs;
lhs =y(20);
rhs =y(10);
residual(7)= lhs-rhs;
lhs =y(21);
rhs =y(10);
residual(8)= lhs-rhs;
lhs =y(16);
rhs =0.25*(y(23)+y(19)+y(22)+y(9));
residual(9)= lhs-rhs;
lhs =y(17);
rhs =params(1)*y(4)+y(19)*params(5)+y(5)*params(6)+y(8)*params(7)+y(9)*params(8)+params(10)*y(27)+y(20)*params(14)+params(15)*y(6)+y(21)*params(23)+params(24)*y(7)+params(32)*x(it_, 3);
residual(10)= lhs-rhs;
lhs =y(10);
rhs =y(25)-0.25*params(36)*(y(12)-y(26)-y(13));
residual(11)= lhs-rhs;
lhs =y(11);
rhs =y(26)*params(35)+y(10)*4*params(37)+y(15);
residual(12)= lhs-rhs;
lhs =y(14);
rhs =y(12)-y(1);
residual(13)= lhs-rhs;
lhs =y(13);
rhs =params(39)*y(2)+x(it_, 1);
residual(14)= lhs-rhs;
lhs =y(15);
rhs =params(40)*y(3)+x(it_, 2);
residual(15)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(15, 30);

  %
  % Jacobian matrix
  %

  g1(1,12)=(-1);
  g1(1,17)=1;
  g1(2,16)=(-1);
  g1(2,18)=1;
  g1(3,11)=(-1);
  g1(3,19)=1;
  g1(4,5)=(-1);
  g1(4,22)=1;
  g1(5,8)=(-1);
  g1(5,23)=1;
  g1(6,22)=(-1);
  g1(6,23)=(-1);
  g1(6,24)=1;
  g1(7,10)=(-1);
  g1(7,20)=1;
  g1(8,10)=(-1);
  g1(8,21)=1;
  g1(9,16)=1;
  g1(9,19)=(-0.25);
  g1(9,22)=(-0.25);
  g1(9,9)=(-0.25);
  g1(9,23)=(-0.25);
  g1(10,4)=(-params(1));
  g1(10,17)=1;
  g1(10,5)=(-params(6));
  g1(10,19)=(-params(5));
  g1(10,27)=(-params(10));
  g1(10,6)=(-params(15));
  g1(10,20)=(-params(14));
  g1(10,7)=(-params(24));
  g1(10,21)=(-params(23));
  g1(10,8)=(-params(7));
  g1(10,9)=(-params(8));
  g1(10,30)=(-params(32));
  g1(11,10)=1;
  g1(11,25)=(-1);
  g1(11,26)=(-(0.25*params(36)));
  g1(11,12)=0.25*params(36);
  g1(11,13)=(-(0.25*params(36)));
  g1(12,10)=(-(4*params(37)));
  g1(12,11)=1;
  g1(12,26)=(-params(35));
  g1(12,15)=(-1);
  g1(13,1)=1;
  g1(13,12)=(-1);
  g1(13,14)=1;
  g1(14,2)=(-params(39));
  g1(14,13)=1;
  g1(14,28)=(-1);
  g1(15,3)=(-params(40));
  g1(15,15)=1;
  g1(15,29)=(-1);
end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],15,900);
end
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],15,27000);
end
end
