function [residual, g1, g2, g3] = NK_IR04AL_dynamic(y, x, params, steady_state, it_)
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

residual = zeros(16, 1);
lhs =y(18);
rhs =4*y(13);
residual(1)= lhs-rhs;
lhs =y(19);
rhs =y(17);
residual(2)= lhs-rhs;
lhs =y(20);
rhs =4*y(12);
residual(3)= lhs-rhs;
lhs =y(23);
rhs =y(5);
residual(4)= lhs-rhs;
lhs =y(24);
rhs =y(8);
residual(5)= lhs-rhs;
lhs =y(25);
rhs =y(23)+y(24);
residual(6)= lhs-rhs;
lhs =y(21);
rhs =y(10)-(params(35)*y(16)+params(36)*(params(40)-1)*y(15))/(1-params(36)*params(38));
residual(7)= lhs-rhs;
lhs =y(22);
rhs =y(10);
residual(8)= lhs-rhs;
lhs =y(17);
rhs =0.25*(y(24)+y(20)+y(23)+y(9));
residual(9)= lhs-rhs;
lhs =y(18);
rhs =params(1)*y(4)+y(20)*params(5)+y(5)*params(6)+y(8)*params(7)+y(9)*params(8)+params(10)*y(31)+y(21)*params(14)+params(15)*y(6)+y(22)*params(23)+params(24)*y(7)+params(32)*x(it_, 4);
residual(10)= lhs-rhs;
lhs =y(14);
rhs =params(44)*y(1)+x(it_, 1);
residual(11)= lhs-rhs;
lhs =y(15);
rhs =params(45)*y(2)+x(it_, 2);
residual(12)= lhs-rhs;
lhs =y(16);
rhs =params(46)*y(3)+x(it_, 3);
residual(13)= lhs-rhs;
lhs =y(10);
rhs =y(26)-params(35)*(y(13)-y(28))+params(36)*(y(11)-y(15)-(y(27)-y(30)))+params(35)*(y(14)-y(29));
residual(14)= lhs-rhs;
lhs =y(11);
rhs =y(10)*params(38)-y(13)*params(39)+params(40)*y(15);
residual(15)= lhs-rhs;
lhs =y(12);
rhs =y(28)*params(57)/params(58)+params(37)*(y(10)*1/params(35)-(y(11)-y(15))*params(36)/params(35)-y(16));
residual(16)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(16, 35);

  %
  % Jacobian matrix
  %

  g1(1,13)=(-4);
  g1(1,18)=1;
  g1(2,17)=(-1);
  g1(2,19)=1;
  g1(3,12)=(-4);
  g1(3,20)=1;
  g1(4,5)=(-1);
  g1(4,23)=1;
  g1(5,8)=(-1);
  g1(5,24)=1;
  g1(6,23)=(-1);
  g1(6,24)=(-1);
  g1(6,25)=1;
  g1(7,10)=(-1);
  g1(7,15)=params(36)*(params(40)-1)/(1-params(36)*params(38));
  g1(7,16)=params(35)/(1-params(36)*params(38));
  g1(7,21)=1;
  g1(8,10)=(-1);
  g1(8,22)=1;
  g1(9,17)=1;
  g1(9,20)=(-0.25);
  g1(9,23)=(-0.25);
  g1(9,9)=(-0.25);
  g1(9,24)=(-0.25);
  g1(10,4)=(-params(1));
  g1(10,18)=1;
  g1(10,5)=(-params(6));
  g1(10,20)=(-params(5));
  g1(10,31)=(-params(10));
  g1(10,6)=(-params(15));
  g1(10,21)=(-params(14));
  g1(10,7)=(-params(24));
  g1(10,22)=(-params(23));
  g1(10,8)=(-params(7));
  g1(10,9)=(-params(8));
  g1(10,35)=(-params(32));
  g1(11,1)=(-params(44));
  g1(11,14)=1;
  g1(11,32)=(-1);
  g1(12,2)=(-params(45));
  g1(12,15)=1;
  g1(12,33)=(-1);
  g1(13,3)=(-params(46));
  g1(13,16)=1;
  g1(13,34)=(-1);
  g1(14,10)=1;
  g1(14,26)=(-1);
  g1(14,11)=(-params(36));
  g1(14,27)=params(36);
  g1(14,28)=(-params(35));
  g1(14,13)=params(35);
  g1(14,14)=(-params(35));
  g1(14,29)=params(35);
  g1(14,15)=params(36);
  g1(14,30)=(-params(36));
  g1(15,10)=(-params(38));
  g1(15,11)=1;
  g1(15,13)=params(39);
  g1(15,15)=(-params(40));
  g1(16,10)=(-(params(37)*1/params(35)));
  g1(16,11)=(-(params(37)*(-(params(36)/params(35)))));
  g1(16,12)=1;
  g1(16,28)=(-(params(57)/params(58)));
  g1(16,15)=(-(params(37)*params(36)/params(35)));
  g1(16,16)=params(37);
end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],16,1225);
end
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],16,42875);
end
end
