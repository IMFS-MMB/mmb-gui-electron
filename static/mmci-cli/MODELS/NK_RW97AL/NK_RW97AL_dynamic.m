function [residual, g1, g2, g3] = NK_RW97AL_dynamic(y, x, params, steady_state, it_)
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

residual = zeros(18, 1);
T110 = params(36)^(-1);
lhs =y(18);
rhs =y(13)*4;
residual(1)= lhs-rhs;
lhs =y(19);
rhs =0.25*(y(20)+y(21)+y(22)+y(6));
residual(2)= lhs-rhs;
lhs =y(20);
rhs =4*y(9);
residual(3)= lhs-rhs;
lhs =y(21);
rhs =y(4);
residual(4)= lhs-rhs;
lhs =y(22);
rhs =y(5);
residual(5)= lhs-rhs;
lhs =y(23);
rhs =y(21)+y(22);
residual(6)= lhs-rhs;
lhs =y(24);
rhs =y(14);
residual(7)= lhs-rhs;
lhs =y(25);
rhs =y(10);
residual(8)= lhs-rhs;
lhs =y(26);
rhs =y(17);
residual(9)= lhs-rhs;
lhs =y(18);
rhs =params(24)*y(8)+y(25)*params(23)+params(1)*y(3)+y(20)*params(5)+y(4)*params(6)+y(5)*params(7)+y(6)*params(8)+params(10)*y(31)+y(24)*params(14)+params(15)*y(7)+y(25)*params(23)+params(24)*y(8)+params(32)*x(it_, 2);
residual(10)= lhs-rhs;
lhs =y(26);
rhs =params(34)*x(it_, 3);
residual(11)= lhs-rhs;
lhs =y(9);
rhs =params(35)*y(27)+y(14)*params(40)+y(15);
residual(12)= lhs-rhs;
lhs =y(15);
rhs =params(41)*y(1)+x(it_, 1);
residual(13)= lhs-rhs;
lhs =y(14);
rhs =y(29)-params(36)*(y(13)-y(27)-y(12));
residual(14)= lhs-rhs;
lhs =y(12);
rhs =T110*(y(16)-y(11)-(y(30)-y(28)));
residual(15)= lhs-rhs;
lhs =y(11);
rhs =T110*y(16)/(T110+params(39));
residual(16)= lhs-rhs;
lhs =y(14);
rhs =y(10)-y(11);
residual(17)= lhs-rhs;
lhs =y(16);
rhs =y(17)+params(42)*y(2);
residual(18)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(18, 34);

  %
  % Jacobian matrix
  %

  g1(1,13)=(-4);
  g1(1,18)=1;
  g1(2,19)=1;
  g1(2,20)=(-0.25);
  g1(2,21)=(-0.25);
  g1(2,6)=(-0.25);
  g1(2,22)=(-0.25);
  g1(3,9)=(-4);
  g1(3,20)=1;
  g1(4,4)=(-1);
  g1(4,21)=1;
  g1(5,5)=(-1);
  g1(5,22)=1;
  g1(6,21)=(-1);
  g1(6,22)=(-1);
  g1(6,23)=1;
  g1(7,14)=(-1);
  g1(7,24)=1;
  g1(8,10)=(-1);
  g1(8,25)=1;
  g1(9,17)=(-1);
  g1(9,26)=1;
  g1(10,3)=(-params(1));
  g1(10,18)=1;
  g1(10,4)=(-params(6));
  g1(10,20)=(-params(5));
  g1(10,31)=(-params(10));
  g1(10,5)=(-params(7));
  g1(10,6)=(-params(8));
  g1(10,7)=(-params(15));
  g1(10,24)=(-params(14));
  g1(10,8)=(-(params(24)+params(24)));
  g1(10,25)=(-(params(23)+params(23)));
  g1(10,33)=(-params(32));
  g1(11,26)=1;
  g1(11,34)=(-params(34));
  g1(12,9)=1;
  g1(12,27)=(-params(35));
  g1(12,14)=(-params(40));
  g1(12,15)=(-1);
  g1(13,1)=(-params(41));
  g1(13,15)=1;
  g1(13,32)=(-1);
  g1(14,27)=(-params(36));
  g1(14,12)=(-params(36));
  g1(14,13)=params(36);
  g1(14,14)=1;
  g1(14,29)=(-1);
  g1(15,11)=T110;
  g1(15,28)=(-T110);
  g1(15,12)=1;
  g1(15,16)=(-T110);
  g1(15,30)=T110;
  g1(16,11)=1;
  g1(16,16)=(-(T110/(T110+params(39))));
  g1(17,10)=(-1);
  g1(17,11)=1;
  g1(17,14)=1;
  g1(18,2)=(-params(42));
  g1(18,16)=1;
  g1(18,17)=(-1);
end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],18,1156);
end
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],18,39304);
end
end
