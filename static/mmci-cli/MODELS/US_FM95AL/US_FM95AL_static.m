function [residual, g1, g2] = US_FM95AL_static(y, x, params)
%
% Status : Computes static model for Dynare
%
% Inputs : 
%   y         [M_.endo_nbr by 1] double    vector of endogenous variables in declaration order
%   x         [M_.exo_nbr by 1] double     vector of exogenous variables in declaration order
%   params    [M_.param_nbr by 1] double   vector of parameter values in declaration order
%
% Outputs:
%   residual  [M_.endo_nbr by 1] double    vector of residuals of the static model equations 
%                                          in order of declaration of the equations
%   g1        [M_.endo_nbr by M_.endo_nbr] double    Jacobian matrix of the static model equations;
%                                                     columns: variables in declaration order
%                                                     rows: equations in order of declaration
%   g2        [M_.endo_nbr by (M_.endo_nbr)^2] double   Hessian matrix of the static model equations;
%                                                       columns: variables in declaration order
%                                                       rows: equations in order of declaration
%
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

residual = zeros( 25, 1);

%
% Model equations
%

lhs =y(8);
rhs =y(5)+params(41)/params(44);
residual(1)= lhs-rhs;
lhs =y(9);
rhs =0.25*(y(12)+y(10)+y(11)+y(12));
residual(2)= lhs-rhs;
lhs =y(10);
rhs =y(6);
residual(3)= lhs-rhs;
lhs =y(11);
rhs =y(10);
residual(4)= lhs-rhs;
lhs =y(12);
rhs =y(11);
residual(5)= lhs-rhs;
lhs =y(13);
rhs =y(11)+y(12);
residual(6)= lhs-rhs;
lhs =y(14);
rhs =y(3);
residual(7)= lhs-rhs;
lhs =y(15);
rhs =y(3);
residual(8)= lhs-rhs;
lhs =y(8);
rhs =y(8)*params(1)+y(10)*params(5)+y(10)*params(6)+y(11)*params(7)+y(12)*params(8)+y(10)*params(10)+y(14)*params(14)+y(14)*params(15)+y(15)*params(23)+y(15)*params(24)+params(32)*x(3);
residual(9)= lhs-rhs;
lhs =y(19);
rhs =y(4);
residual(10)= lhs-rhs;
lhs =y(20);
rhs =y(19);
residual(11)= lhs-rhs;
lhs =y(16);
rhs =y(3);
residual(12)= lhs-rhs;
lhs =y(17);
rhs =y(16);
residual(13)= lhs-rhs;
lhs =y(18);
rhs =y(3);
residual(14)= lhs-rhs;
lhs =y(24);
rhs =y(2);
residual(15)= lhs-rhs;
lhs =y(25);
rhs =y(24);
residual(16)= lhs-rhs;
lhs =y(21);
rhs =y(2)-y(1);
residual(17)= lhs-rhs;
lhs =y(22);
rhs =y(21);
residual(18)= lhs-rhs;
lhs =y(23);
rhs =y(22);
residual(19)= lhs-rhs;
lhs =y(1);
rhs =y(2)*params(36)+y(24)*params(37)+y(25)*params(38)+y(25)*params(39);
residual(20)= lhs-rhs;
lhs =y(21);
rhs =params(36)*(y(4)+y(3)*params(45))+params(37)*(y(19)+y(16)*params(45))+params(38)*(y(20)+y(17)*params(45))+params(39)*(y(20)+y(17)*params(45))+x(1);
residual(21)= lhs-rhs;
lhs =y(4);
rhs =y(21)*params(36)+y(22)*params(37)+y(23)*params(38)+y(23)*params(39);
residual(22)= lhs-rhs;
lhs =y(3);
rhs =params(41)+y(18)*params(42)+y(18)*params(43)+params(44)*y(7)+x(2);
residual(23)= lhs-rhs;
lhs =y(7);
rhs =y(5)-y(6);
residual(24)= lhs-rhs;
residual(25) = y(6);
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(25, 25);

  %
  % Jacobian matrix
  %

  g1(1,5)=(-1);
  g1(1,8)=1;
  g1(2,9)=1;
  g1(2,10)=(-0.25);
  g1(2,11)=(-0.25);
  g1(2,12)=(-0.5);
  g1(3,6)=(-1);
  g1(3,10)=1;
  g1(4,10)=(-1);
  g1(4,11)=1;
  g1(5,11)=(-1);
  g1(5,12)=1;
  g1(6,11)=(-1);
  g1(6,12)=(-1);
  g1(6,13)=1;
  g1(7,3)=(-1);
  g1(7,14)=1;
  g1(8,3)=(-1);
  g1(8,15)=1;
  g1(9,8)=1-params(1);
  g1(9,10)=(-(params(10)+params(5)+params(6)));
  g1(9,11)=(-params(7));
  g1(9,12)=(-params(8));
  g1(9,14)=(-(params(14)+params(15)));
  g1(9,15)=(-(params(23)+params(24)));
  g1(10,4)=(-1);
  g1(10,19)=1;
  g1(11,19)=(-1);
  g1(11,20)=1;
  g1(12,3)=(-1);
  g1(12,16)=1;
  g1(13,16)=(-1);
  g1(13,17)=1;
  g1(14,3)=(-1);
  g1(14,18)=1;
  g1(15,2)=(-1);
  g1(15,24)=1;
  g1(16,24)=(-1);
  g1(16,25)=1;
  g1(17,1)=1;
  g1(17,2)=(-1);
  g1(17,21)=1;
  g1(18,21)=(-1);
  g1(18,22)=1;
  g1(19,22)=(-1);
  g1(19,23)=1;
  g1(20,1)=1;
  g1(20,2)=(-params(36));
  g1(20,24)=(-params(37));
  g1(20,25)=(-(params(38)+params(39)));
  g1(21,3)=(-(params(36)*params(45)));
  g1(21,4)=(-params(36));
  g1(21,16)=(-(params(37)*params(45)));
  g1(21,17)=(-(params(38)*params(45)+params(39)*params(45)));
  g1(21,19)=(-params(37));
  g1(21,20)=(-(params(38)+params(39)));
  g1(21,21)=1;
  g1(22,4)=1;
  g1(22,21)=(-params(36));
  g1(22,22)=(-params(37));
  g1(22,23)=(-(params(38)+params(39)));
  g1(23,3)=1;
  g1(23,7)=(-params(44));
  g1(23,18)=(-(params(42)+params(43)));
  g1(24,5)=(-1);
  g1(24,6)=1;
  g1(24,7)=1;
  g1(25,6)=1;
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],25,625);
end
end
