function [residual, g1, g2, g3] = NK_LWW03_static(y, x, params)
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
%                                          in order of declaration of the equations.
%                                          Dynare may prepend or append auxiliary equations, see M_.aux_vars
%   g1        [M_.endo_nbr by M_.endo_nbr] double    Jacobian matrix of the static model equations;
%                                                       columns: variables in declaration order
%                                                       rows: equations in order of declaration
%   g2        [M_.endo_nbr by (M_.endo_nbr)^2] double   Hessian matrix of the static model equations;
%                                                       columns: variables in declaration order
%                                                       rows: equations in order of declaration
%   g3        [M_.endo_nbr by (M_.endo_nbr)^3] double   Third derivatives matrix of the static model equations;
%                                                       columns: variables in declaration order
%                                                       rows: equations in order of declaration
%
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

residual = zeros( 27, 1);

%
% Model equations
%

lhs =y(7);
rhs =y(3);
residual(1)= lhs-rhs;
lhs =y(8);
rhs =0.25*(y(2)+y(2)+y(2)+y(2));
residual(2)= lhs-rhs;
lhs =y(9);
rhs =y(2);
residual(3)= lhs-rhs;
lhs =y(10);
rhs =y(1);
residual(4)= lhs-rhs;
lhs =y(7);
rhs =params(32)*x(3)+y(10)*params(22)+y(10)*params(21)+y(10)*params(20)+y(10)*params(19)+y(10)*params(18)+y(10)*params(17)+y(10)*params(16)+y(10)*params(15)+y(10)*params(14)+y(9)*params(13)+y(9)*params(12)+y(9)*params(11)+y(9)*params(10)+y(9)*params(6)+y(9)*params(5)+y(7)*params(1)+y(7)*params(2)+y(7)*params(3)+y(7)*params(4)+y(9)*params(7)+y(9)*params(8)+y(9)*params(9);
residual(5)= lhs-rhs;
lhs =y(1);
rhs =y(1)-0.25*params(36)*(y(3)-y(2)-y(4));
residual(6)= lhs-rhs;
lhs =y(2);
rhs =y(2)*params(35)+y(1)*4*params(37)+y(6);
residual(7)= lhs-rhs;
residual(8) = y(5);
lhs =y(4);
rhs =y(4)*params(39)+x(1);
residual(9)= lhs-rhs;
lhs =y(6);
rhs =y(6)*params(40)+x(2);
residual(10)= lhs-rhs;
lhs =y(11);
rhs =y(9);
residual(11)= lhs-rhs;
lhs =y(12);
rhs =y(9);
residual(12)= lhs-rhs;
lhs =y(13);
rhs =y(9);
residual(13)= lhs-rhs;
lhs =y(14);
rhs =y(10);
residual(14)= lhs-rhs;
lhs =y(15);
rhs =y(10);
residual(15)= lhs-rhs;
lhs =y(16);
rhs =y(10);
residual(16)= lhs-rhs;
lhs =y(17);
rhs =y(2);
residual(17)= lhs-rhs;
lhs =y(18);
rhs =y(2);
residual(18)= lhs-rhs;
lhs =y(19);
rhs =y(10);
residual(19)= lhs-rhs;
lhs =y(20);
rhs =y(10);
residual(20)= lhs-rhs;
lhs =y(21);
rhs =y(10);
residual(21)= lhs-rhs;
lhs =y(22);
rhs =y(7);
residual(22)= lhs-rhs;
lhs =y(23);
rhs =y(7);
residual(23)= lhs-rhs;
lhs =y(24);
rhs =y(7);
residual(24)= lhs-rhs;
lhs =y(25);
rhs =y(9);
residual(25)= lhs-rhs;
lhs =y(26);
rhs =y(9);
residual(26)= lhs-rhs;
lhs =y(27);
rhs =y(9);
residual(27)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(27, 27);

  %
  % Jacobian matrix
  %

  g1(1,3)=(-1);
  g1(1,7)=1;
  g1(2,2)=(-1);
  g1(2,8)=1;
  g1(3,2)=(-1);
  g1(3,9)=1;
  g1(4,1)=(-1);
  g1(4,10)=1;
  g1(5,7)=1-(params(4)+params(3)+params(1)+params(2));
  g1(5,9)=(-(params(13)+params(12)+params(11)+params(10)+params(9)+params(8)+params(7)+params(6)+params(5)));
  g1(5,10)=(-(params(22)+params(21)+params(20)+params(19)+params(18)+params(17)+params(16)+params(15)+params(14)));
  g1(6,2)=(-(0.25*params(36)));
  g1(6,3)=0.25*params(36);
  g1(6,4)=(-(0.25*params(36)));
  g1(7,1)=(-(4*params(37)));
  g1(7,2)=1-params(35);
  g1(7,6)=(-1);
  g1(8,5)=1;
  g1(9,4)=1-params(39);
  g1(10,6)=1-params(40);
  g1(11,9)=(-1);
  g1(11,11)=1;
  g1(12,9)=(-1);
  g1(12,12)=1;
  g1(13,9)=(-1);
  g1(13,13)=1;
  g1(14,10)=(-1);
  g1(14,14)=1;
  g1(15,10)=(-1);
  g1(15,15)=1;
  g1(16,10)=(-1);
  g1(16,16)=1;
  g1(17,2)=(-1);
  g1(17,17)=1;
  g1(18,2)=(-1);
  g1(18,18)=1;
  g1(19,10)=(-1);
  g1(19,19)=1;
  g1(20,10)=(-1);
  g1(20,20)=1;
  g1(21,10)=(-1);
  g1(21,21)=1;
  g1(22,7)=(-1);
  g1(22,22)=1;
  g1(23,7)=(-1);
  g1(23,23)=1;
  g1(24,7)=(-1);
  g1(24,24)=1;
  g1(25,9)=(-1);
  g1(25,25)=1;
  g1(26,9)=(-1);
  g1(26,26)=1;
  g1(27,9)=(-1);
  g1(27,27)=1;
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],27,729);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],27,19683);
end
end
end
end
