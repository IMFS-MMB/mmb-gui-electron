function [residual, g1, g2] = NK_CGG02AL_static(y, x, params)
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

residual = zeros( 26, 1);

%
% Model equations
%

T98 = 1/params(35);
T118 = 1/params(43);
lhs =y(17);
rhs =y(5);
residual(1)= lhs-rhs;
lhs =y(19);
rhs =y(4);
residual(2)= lhs-rhs;
lhs =y(22);
rhs =y(19);
residual(3)= lhs-rhs;
lhs =y(23);
rhs =y(22);
residual(4)= lhs-rhs;
lhs =y(18);
rhs =0.25*(y(23)+y(23)+y(19)+y(22));
residual(5)= lhs-rhs;
lhs =y(24);
rhs =y(22)+y(23);
residual(6)= lhs-rhs;
lhs =y(20);
rhs =y(1);
residual(7)= lhs-rhs;
lhs =y(21);
rhs =y(3);
residual(8)= lhs-rhs;
lhs =y(25);
rhs =y(12);
residual(9)= lhs-rhs;
lhs =y(26);
rhs =y(25);
residual(10)= lhs-rhs;
lhs =y(17);
rhs =y(17)*params(1)+y(19)*params(5)+y(19)*params(6)+y(22)*params(7)+y(23)*params(8)+y(19)*params(10)+y(20)*params(14)+y(20)*params(15)+y(21)*params(23)+y(21)*params(24)+params(32)*x(7);
residual(11)= lhs-rhs;
lhs =y(13);
rhs =params(1)*y(13)+y(12)*params(5)+y(12)*params(6)+y(25)*params(7)+y(26)*params(8)+y(12)*params(10)+params(14)*y(9)+params(15)*y(9)+y(9)*params(19)+params(32)*x(5);
residual(12)= lhs-rhs;
lhs =y(1);
rhs =y(1)-T98*(y(5)-y(4)-y(6));
residual(13)= lhs-rhs;
lhs =y(4);
rhs =y(4)*params(36)+y(1)*params(37)+y(7);
residual(14)= lhs-rhs;
residual(15) = y(6);
lhs =y(2);
rhs =T118*((1+params(44))*y(8)-params(41)*y(11));
residual(16)= lhs-rhs;
lhs =y(1);
rhs =y(3)-y(2);
residual(17)= lhs-rhs;
lhs =y(8);
rhs =y(8)*params(38)+x(2);
residual(18)= lhs-rhs;
lhs =y(7);
rhs =y(7)*params(39)+x(1);
residual(19)= lhs-rhs;
lhs =y(9);
rhs =y(9)-T98*(y(13)-y(12)-y(14))+x(4);
residual(20)= lhs-rhs;
lhs =y(12);
rhs =y(12)*params(36)+y(9)*params(37)+y(15);
residual(21)= lhs-rhs;
residual(22) = y(14);
lhs =y(10);
rhs =T118*((1+params(44))*y(16)-y(3)*params(41));
residual(23)= lhs-rhs;
lhs =y(9);
rhs =y(11)-y(10);
residual(24)= lhs-rhs;
lhs =y(16);
rhs =params(38)*y(16)+x(6);
residual(25)= lhs-rhs;
lhs =y(15);
rhs =params(39)*y(15)+x(3);
residual(26)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(26, 26);

  %
  % Jacobian matrix
  %

  g1(1,5)=(-1);
  g1(1,17)=1;
  g1(2,4)=(-1);
  g1(2,19)=1;
  g1(3,19)=(-1);
  g1(3,22)=1;
  g1(4,22)=(-1);
  g1(4,23)=1;
  g1(5,18)=1;
  g1(5,19)=(-0.25);
  g1(5,22)=(-0.25);
  g1(5,23)=(-0.5);
  g1(6,22)=(-1);
  g1(6,23)=(-1);
  g1(6,24)=1;
  g1(7,1)=(-1);
  g1(7,20)=1;
  g1(8,3)=(-1);
  g1(8,21)=1;
  g1(9,12)=(-1);
  g1(9,25)=1;
  g1(10,25)=(-1);
  g1(10,26)=1;
  g1(11,17)=1-params(1);
  g1(11,19)=(-(params(10)+params(5)+params(6)));
  g1(11,20)=(-(params(14)+params(15)));
  g1(11,21)=(-(params(23)+params(24)));
  g1(11,22)=(-params(7));
  g1(11,23)=(-params(8));
  g1(12,9)=(-(params(19)+params(14)+params(15)));
  g1(12,12)=(-(params(10)+params(5)+params(6)));
  g1(12,13)=1-params(1);
  g1(12,25)=(-params(7));
  g1(12,26)=(-params(8));
  g1(13,4)=(-T98);
  g1(13,5)=T98;
  g1(13,6)=(-T98);
  g1(14,1)=(-params(37));
  g1(14,4)=1-params(36);
  g1(14,7)=(-1);
  g1(15,6)=1;
  g1(16,2)=1;
  g1(16,8)=(-(T118*(1+params(44))));
  g1(16,11)=(-(T118*(-params(41))));
  g1(17,1)=1;
  g1(17,2)=1;
  g1(17,3)=(-1);
  g1(18,8)=1-params(38);
  g1(19,7)=1-params(39);
  g1(20,12)=(-T98);
  g1(20,13)=T98;
  g1(20,14)=(-T98);
  g1(21,9)=(-params(37));
  g1(21,12)=1-params(36);
  g1(21,15)=(-1);
  g1(22,14)=1;
  g1(23,3)=(-(T118*(-params(41))));
  g1(23,10)=1;
  g1(23,16)=(-(T118*(1+params(44))));
  g1(24,9)=1;
  g1(24,10)=1;
  g1(24,11)=(-1);
  g1(25,16)=1-params(38);
  g1(26,15)=1-params(39);
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],26,676);
end
end
