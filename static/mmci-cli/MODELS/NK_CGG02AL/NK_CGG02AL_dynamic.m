function [residual, g1, g2, g3] = NK_CGG02AL_dynamic(y, x, params, steady_state, it_)
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

residual = zeros(26, 1);
T114 = 1/params(35);
T142 = 1/params(43);
lhs =y(32);
rhs =y(20);
residual(1)= lhs-rhs;
lhs =y(34);
rhs =y(19);
residual(2)= lhs-rhs;
lhs =y(37);
rhs =y(9);
residual(3)= lhs-rhs;
lhs =y(38);
rhs =y(12);
residual(4)= lhs-rhs;
lhs =y(33);
rhs =0.25*(y(38)+y(34)+y(37)+y(13));
residual(5)= lhs-rhs;
lhs =y(39);
rhs =y(37)+y(38);
residual(6)= lhs-rhs;
lhs =y(35);
rhs =y(16);
residual(7)= lhs-rhs;
lhs =y(36);
rhs =y(18);
residual(8)= lhs-rhs;
lhs =y(40);
rhs =y(4);
residual(9)= lhs-rhs;
lhs =y(41);
rhs =y(14);
residual(10)= lhs-rhs;
lhs =y(32);
rhs =params(1)*y(8)+y(34)*params(5)+y(9)*params(6)+y(12)*params(7)+y(13)*params(8)+params(10)*y(50)+y(35)*params(14)+params(15)*y(10)+y(36)*params(23)+params(24)*y(11)+params(32)*x(it_, 7);
residual(11)= lhs-rhs;
lhs =y(28);
rhs =params(1)*y(5)+params(5)*y(27)+y(4)*params(6)+y(14)*params(7)+params(8)*y(15)+params(10)*y(49)+params(14)*y(24)+params(15)*y(3)+params(19)*y(46)+params(32)*x(it_, 5);
residual(12)= lhs-rhs;
lhs =y(16);
rhs =y(42)-T114*(y(20)-y(45)-y(21));
residual(13)= lhs-rhs;
lhs =y(19);
rhs =y(45)*params(36)+y(16)*params(37)+y(22);
residual(14)= lhs-rhs;
lhs =y(21);
rhs =params(35)*(y(43)-y(17))+params(41)*(y(48)-y(26));
residual(15)= lhs-rhs;
lhs =y(17);
rhs =T142*((1+params(44))*y(23)-params(41)*y(26));
residual(16)= lhs-rhs;
lhs =y(16);
rhs =y(18)-y(17);
residual(17)= lhs-rhs;
lhs =y(23);
rhs =params(38)*y(2)+x(it_, 2);
residual(18)= lhs-rhs;
lhs =y(22);
rhs =params(39)*y(1)+x(it_, 1);
residual(19)= lhs-rhs;
lhs =y(24);
rhs =y(46)-T114*(y(28)-y(49)-y(29))+x(it_, 4);
residual(20)= lhs-rhs;
lhs =y(27);
rhs =y(49)*params(36)+y(24)*params(37)+y(30);
residual(21)= lhs-rhs;
lhs =y(29);
rhs =params(35)*(y(47)-y(25))+params(41)*(y(44)-y(18));
residual(22)= lhs-rhs;
lhs =y(25);
rhs =T142*((1+params(44))*y(31)-y(18)*params(41));
residual(23)= lhs-rhs;
lhs =y(24);
rhs =y(26)-y(25);
residual(24)= lhs-rhs;
lhs =y(31);
rhs =params(38)*y(7)+x(it_, 6);
residual(25)= lhs-rhs;
lhs =y(30);
rhs =params(39)*y(6)+x(it_, 3);
residual(26)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(26, 57);

  %
  % Jacobian matrix
  %

  g1(1,20)=(-1);
  g1(1,32)=1;
  g1(2,19)=(-1);
  g1(2,34)=1;
  g1(3,9)=(-1);
  g1(3,37)=1;
  g1(4,12)=(-1);
  g1(4,38)=1;
  g1(5,33)=1;
  g1(5,34)=(-0.25);
  g1(5,37)=(-0.25);
  g1(5,13)=(-0.25);
  g1(5,38)=(-0.25);
  g1(6,37)=(-1);
  g1(6,38)=(-1);
  g1(6,39)=1;
  g1(7,16)=(-1);
  g1(7,35)=1;
  g1(8,18)=(-1);
  g1(8,36)=1;
  g1(9,4)=(-1);
  g1(9,40)=1;
  g1(10,14)=(-1);
  g1(10,41)=1;
  g1(11,8)=(-params(1));
  g1(11,32)=1;
  g1(11,9)=(-params(6));
  g1(11,34)=(-params(5));
  g1(11,50)=(-params(10));
  g1(11,10)=(-params(15));
  g1(11,35)=(-params(14));
  g1(11,11)=(-params(24));
  g1(11,36)=(-params(23));
  g1(11,12)=(-params(7));
  g1(11,13)=(-params(8));
  g1(11,57)=(-params(32));
  g1(12,3)=(-params(15));
  g1(12,24)=(-params(14));
  g1(12,46)=(-params(19));
  g1(12,4)=(-params(6));
  g1(12,27)=(-params(5));
  g1(12,49)=(-params(10));
  g1(12,5)=(-params(1));
  g1(12,28)=1;
  g1(12,14)=(-params(7));
  g1(12,15)=(-params(8));
  g1(12,55)=(-params(32));
  g1(13,16)=1;
  g1(13,42)=(-1);
  g1(13,45)=(-T114);
  g1(13,20)=T114;
  g1(13,21)=(-T114);
  g1(14,16)=(-params(37));
  g1(14,19)=1;
  g1(14,45)=(-params(36));
  g1(14,22)=(-1);
  g1(15,17)=params(35);
  g1(15,43)=(-params(35));
  g1(15,21)=1;
  g1(15,26)=params(41);
  g1(15,48)=(-params(41));
  g1(16,17)=1;
  g1(16,23)=(-(T142*(1+params(44))));
  g1(16,26)=(-(T142*(-params(41))));
  g1(17,16)=1;
  g1(17,17)=1;
  g1(17,18)=(-1);
  g1(18,2)=(-params(38));
  g1(18,23)=1;
  g1(18,52)=(-1);
  g1(19,1)=(-params(39));
  g1(19,22)=1;
  g1(19,51)=(-1);
  g1(20,24)=1;
  g1(20,46)=(-1);
  g1(20,49)=(-T114);
  g1(20,28)=T114;
  g1(20,29)=(-T114);
  g1(20,54)=(-1);
  g1(21,24)=(-params(37));
  g1(21,27)=1;
  g1(21,49)=(-params(36));
  g1(21,30)=(-1);
  g1(22,18)=params(41);
  g1(22,44)=(-params(41));
  g1(22,25)=params(35);
  g1(22,47)=(-params(35));
  g1(22,29)=1;
  g1(23,18)=(-(T142*(-params(41))));
  g1(23,25)=1;
  g1(23,31)=(-(T142*(1+params(44))));
  g1(24,24)=1;
  g1(24,25)=1;
  g1(24,26)=(-1);
  g1(25,7)=(-params(38));
  g1(25,31)=1;
  g1(25,56)=(-1);
  g1(26,6)=(-params(39));
  g1(26,30)=1;
  g1(26,53)=(-1);
end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],26,3249);
end
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],26,185193);
end
end
