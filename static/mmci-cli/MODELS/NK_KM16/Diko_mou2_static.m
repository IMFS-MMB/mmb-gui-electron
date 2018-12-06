function [residual, g1, g2, g3] = Diko_mou2_static(y, x, params)
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

residual = zeros( 58, 1);

%
% Model equations
%

T16 = 1/params(6);
T30 = params(19)*y(2)^params(1);
T32 = (1+y(10))*T30/y(10);
T34 = 1/params(2);
T41 = params(7)/y(12);
T54 = y(2)^(-params(1));
T150 = params(19)*y(22)^params(1);
T152 = (1+y(30))*T150/y(30);
T157 = params(7)/y(32);
T168 = y(22)^(-params(1));
T254 = y(32)/y(37);
T256 = T254^params(5);
T265 = params(7)*params(4)*T254^(params(5)-1);
T271 = params(4)*y(37)^(1-params(5));
T272 = y(32)^(params(5)-1);
T277 = y(47)*params(5)/(params(5)-1)/y(48);
lhs =y(11);
rhs =(1+y(10))/y(12);
residual(1)= lhs-rhs;
lhs =y(4);
rhs =T16;
residual(2)= lhs-rhs;
lhs =y(1);
rhs =y(3);
residual(3)= lhs-rhs;
residual(4) = y(1)-y(2)-y(20);
lhs =y(5);
rhs =T32^T34;
residual(5)= lhs-rhs;
lhs =1;
rhs =y(11)*params(7);
residual(6)= lhs-rhs;
lhs =1;
rhs =T41*(1+y(9));
residual(7)= lhs-rhs;
lhs =y(14);
rhs =T41*(1+y(14)*(1-params(8)));
residual(8)= lhs-rhs;
lhs =y(13);
rhs =T54;
residual(9)= lhs-rhs;
lhs =params(13)*y(3)^params(3);
rhs =T16*y(4)*T54*(1-y(15));
residual(10)= lhs-rhs;
lhs =y(6);
rhs =(1-params(8))*y(6)/y(12)+y(7)+y(16);
residual(11)= lhs-rhs;
lhs =y(6)*(1-params(8))*y(8)/y(12)+y(9)*y(7);
rhs =y(6)*y(8);
residual(12)= lhs-rhs;
lhs =y(7)+y(5)+y(3)*y(4)*y(15)-y(5)/y(12);
rhs =y(20)+y(6)*(params(8)+y(8))/y(12);
residual(13)= lhs-rhs;
lhs =y(17);
rhs =y(17)*params(9)+params(10)*y(19);
residual(14)= lhs-rhs;
lhs =y(12);
rhs =(y(12))*exp(y(18)/100);
residual(15)= lhs-rhs;
lhs =y(18);
rhs =y(18)*params(12)+x(2);
residual(16)= lhs-rhs;
lhs =y(16);
rhs =y(16)*params(11)+x(1);
residual(17)= lhs-rhs;
lhs =100*(log(y(20))-log((y(20))));
rhs =100*(log(y(20))-log((y(20))))*params(18)+x(4);
residual(18)= lhs-rhs;
lhs =y(31);
rhs =(1+y(30))/y(32);
residual(19)= lhs-rhs;
lhs =y(24);
rhs =y(38);
residual(20)= lhs-rhs;
lhs =y(21);
rhs =y(23)/y(46);
residual(21)= lhs-rhs;
residual(22) = y(21)-y(22)-y(39);
lhs =y(25);
rhs =T152^T34;
residual(23)= lhs-rhs;
lhs =1;
rhs =params(7)*y(31);
residual(24)= lhs-rhs;
lhs =1;
rhs =T157*(1+y(29));
residual(25)= lhs-rhs;
lhs =y(34);
rhs =T157*(1+(1-params(8))*y(34));
residual(26)= lhs-rhs;
lhs =y(33);
rhs =T168;
residual(27)= lhs-rhs;
lhs =params(13)*y(23)^params(3);
rhs =T16*y(24)*T168*(1-y(35));
residual(28)= lhs-rhs;
lhs =y(26);
rhs =y(16)+(1-params(8))*y(26)/y(32)+y(27);
residual(29)= lhs-rhs;
lhs =y(26)*(1-params(8))*y(28)/y(32)+y(29)*y(27);
rhs =y(26)*y(28);
residual(30)= lhs-rhs;
lhs =y(27)+y(25)+y(23)*y(24)*y(35)-y(25)/y(32);
rhs =y(39)+y(26)*(params(8)+y(28))/y(32);
residual(31)= lhs-rhs;
lhs =y(41);
rhs =params(9)*y(41)+params(10)*y(40);
residual(32)= lhs-rhs;
lhs =y(42)/4;
rhs =(1-params(14))*(y(36)+params(15)*(y(43)/4-y(36))+params(16)*(y(44)-y(45)))+y(42)*params(14)/4-y(49);
residual(33)= lhs-rhs;
lhs =y(49);
rhs =y(49)*params(17)+x(3);
residual(34)= lhs-rhs;
lhs =y(36);
rhs =x(2)+params(12)*y(36);
residual(35)= lhs-rhs;
lhs =y(37);
rhs =(y(37))*exp(y(36)/100);
residual(36)= lhs-rhs;
lhs =y(47);
rhs =y(21)*y(38)*y(33)+y(47)*params(7)*params(4)*T256;
residual(37)= lhs-rhs;
lhs =y(48);
rhs =y(21)*y(33)+y(48)*T265;
residual(38)= lhs-rhs;
lhs =1;
rhs =T271*T272+(1-params(4))*T277^(1-params(5));
residual(39)= lhs-rhs;
lhs =y(46);
rhs =T256*y(46)*params(4)+(1-params(4))*T277^(-params(5));
residual(40)= lhs-rhs;
lhs =100*(log(y(39))-log((y(39))));
rhs =x(4)+100*params(18)*(log(y(39))-log((y(39))));
residual(41)= lhs-rhs;
lhs =y(43);
rhs =4*100*(y(32)-(y(32)));
residual(42)= lhs-rhs;
lhs =y(42);
rhs =4*100*(y(30)-(y(30)));
residual(43)= lhs-rhs;
lhs =y(44);
rhs =100*log(y(21)/(y(21)));
residual(44)= lhs-rhs;
lhs =y(45);
rhs =100*log(y(1)/(y(1)));
residual(45)= lhs-rhs;
lhs =y(41);
rhs =100*(y(35)-(y(35)));
residual(46)= lhs-rhs;
lhs =y(17);
rhs =100*(y(15)-(y(15)));
residual(47)= lhs-rhs;
lhs =y(40);
rhs =100*log(y(26)/(y(26)));
residual(48)= lhs-rhs;
lhs =y(19);
rhs =100*log(y(6)/(y(6)));
residual(49)= lhs-rhs;
lhs =y(50);
rhs =100*log(y(22)/(y(22)));
residual(50)= lhs-rhs;
lhs =y(51);
rhs =100*log(y(24)/(y(24)));
residual(51)= lhs-rhs;
lhs =y(52);
rhs =100*log(y(23)/(y(23)));
residual(52)= lhs-rhs;
lhs =y(53);
rhs =100*log(y(27)/(y(27)));
residual(53)= lhs-rhs;
lhs =y(54);
rhs =100*log(y(25)/(y(25)));
residual(54)= lhs-rhs;
lhs =y(55);
rhs =y(42)-y(43);
residual(55)= lhs-rhs;
lhs =y(56);
rhs =100*log(y(34)/(y(34)));
residual(56)= lhs-rhs;
lhs =y(57);
rhs =4*100*(y(29)-(y(29)));
residual(57)= lhs-rhs;
lhs =y(58);
rhs =100*log(y(39)/(y(39)));
residual(58)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(58, 58);

  %
  % Jacobian matrix
  %

T396 = getPowerDeriv(T32,T34,1);
T399 = getPowerDeriv(y(2),(-params(1)),1);
T474 = 1/y(20)-1/(y(20));
T491 = getPowerDeriv(T152,T34,1);
T494 = getPowerDeriv(y(22),(-params(1)),1);
T584 = getPowerDeriv(T254,params(5),1);
T589 = getPowerDeriv(T254,params(5)-1,1);
T643 = 1/y(39)-1/(y(39));
T672 = params(5)/(params(5)-1)/y(48);
T673 = getPowerDeriv(T277,1-params(5),1);
T677 = getPowerDeriv(T277,(-params(5)),1);
T684 = (-(y(47)*params(5)/(params(5)-1)))/(y(48)*y(48));
  g1(1,10)=(-(1/y(12)));
  g1(1,11)=1;
  g1(1,12)=(-((-(1+y(10)))/(y(12)*y(12))));
  g1(2,4)=1;
  g1(3,1)=1;
  g1(3,3)=(-1);
  g1(4,1)=1;
  g1(4,2)=(-1);
  g1(4,20)=(-1);
  g1(5,2)=(-((1+y(10))*params(19)*getPowerDeriv(y(2),params(1),1)/y(10)*T396));
  g1(5,5)=1;
  g1(5,10)=(-(T396*(y(10)*T30-(1+y(10))*T30)/(y(10)*y(10))));
  g1(6,11)=(-params(7));
  g1(7,9)=(-T41);
  g1(7,12)=(-((1+y(9))*(-params(7))/(y(12)*y(12))));
  g1(8,12)=(-((1+y(14)*(1-params(8)))*(-params(7))/(y(12)*y(12))));
  g1(8,14)=1-T41*(1-params(8));
  g1(9,2)=(-T399);
  g1(9,13)=1;
  g1(10,2)=(-(T16*y(4)*(1-y(15))*T399));
  g1(10,3)=params(13)*getPowerDeriv(y(3),params(3),1);
  g1(10,4)=(-(T16*T54*(1-y(15))));
  g1(10,15)=(-(T16*y(4)*(-T54)));
  g1(11,6)=1-(1-params(8))/y(12);
  g1(11,7)=(-1);
  g1(11,12)=(-((-((1-params(8))*y(6)))/(y(12)*y(12))));
  g1(11,16)=(-1);
  g1(12,6)=(1-params(8))*y(8)/y(12)-y(8);
  g1(12,7)=y(9);
  g1(12,8)=(1-params(8))*y(6)/y(12)-y(6);
  g1(12,9)=y(7);
  g1(12,12)=(-(y(6)*(1-params(8))*y(8)))/(y(12)*y(12));
  g1(13,3)=y(4)*y(15);
  g1(13,4)=y(3)*y(15);
  g1(13,5)=1-1/y(12);
  g1(13,6)=(-((params(8)+y(8))/y(12)));
  g1(13,7)=1;
  g1(13,8)=(-(y(6)/y(12)));
  g1(13,12)=(-((-y(5))/(y(12)*y(12))))-(-(y(6)*(params(8)+y(8))))/(y(12)*y(12));
  g1(13,15)=y(4)*y(3);
  g1(13,20)=(-1);
  g1(14,17)=1-params(9);
  g1(14,19)=(-params(10));
  g1(15,12)=1-exp(y(18)/100);
  g1(15,18)=(-((y(12))*exp(y(18)/100)*0.01));
  g1(16,18)=1-params(12);
  g1(17,16)=1-params(11);
  g1(18,20)=100*T474-100*params(18)*T474;
  g1(19,30)=(-(1/y(32)));
  g1(19,31)=1;
  g1(19,32)=(-((-(1+y(30)))/(y(32)*y(32))));
  g1(20,24)=1;
  g1(20,38)=(-1);
  g1(21,21)=1;
  g1(21,23)=(-(1/y(46)));
  g1(21,46)=(-((-y(23))/(y(46)*y(46))));
  g1(22,21)=1;
  g1(22,22)=(-1);
  g1(22,39)=(-1);
  g1(23,22)=(-((1+y(30))*params(19)*getPowerDeriv(y(22),params(1),1)/y(30)*T491));
  g1(23,25)=1;
  g1(23,30)=(-(T491*(y(30)*T150-(1+y(30))*T150)/(y(30)*y(30))));
  g1(24,31)=(-params(7));
  g1(25,29)=(-T157);
  g1(25,32)=(-((1+y(29))*(-params(7))/(y(32)*y(32))));
  g1(26,32)=(-((1+(1-params(8))*y(34))*(-params(7))/(y(32)*y(32))));
  g1(26,34)=1-(1-params(8))*T157;
  g1(27,22)=(-T494);
  g1(27,33)=1;
  g1(28,22)=(-(T16*y(24)*(1-y(35))*T494));
  g1(28,23)=params(13)*getPowerDeriv(y(23),params(3),1);
  g1(28,24)=(-(T16*T168*(1-y(35))));
  g1(28,35)=(-(T16*y(24)*(-T168)));
  g1(29,16)=(-1);
  g1(29,26)=1-(1-params(8))/y(32);
  g1(29,27)=(-1);
  g1(29,32)=(-((-((1-params(8))*y(26)))/(y(32)*y(32))));
  g1(30,26)=(1-params(8))*y(28)/y(32)-y(28);
  g1(30,27)=y(29);
  g1(30,28)=y(26)*(1-params(8))/y(32)-y(26);
  g1(30,29)=y(27);
  g1(30,32)=y(26)*(-((1-params(8))*y(28)))/(y(32)*y(32));
  g1(31,23)=y(24)*y(35);
  g1(31,24)=y(23)*y(35);
  g1(31,25)=1-1/y(32);
  g1(31,26)=(-((params(8)+y(28))/y(32)));
  g1(31,27)=1;
  g1(31,28)=(-(y(26)/y(32)));
  g1(31,32)=(-((-y(25))/(y(32)*y(32))))-(-(y(26)*(params(8)+y(28))))/(y(32)*y(32));
  g1(31,35)=y(24)*y(23);
  g1(31,39)=(-1);
  g1(32,40)=(-params(10));
  g1(32,41)=1-params(9);
  g1(33,36)=(-((1-params(14))*(1-params(15))));
  g1(33,42)=0.25-params(14)/4;
  g1(33,43)=(-((1-params(14))*params(15)*0.25));
  g1(33,44)=(-((1-params(14))*params(16)));
  g1(33,45)=(-((1-params(14))*(-params(16))));
  g1(33,49)=1;
  g1(34,49)=1-params(17);
  g1(35,36)=1-params(12);
  g1(36,36)=(-((y(37))*exp(y(36)/100)*0.01));
  g1(36,37)=1-exp(y(36)/100);
  g1(37,21)=(-(y(38)*y(33)));
  g1(37,32)=(-(y(47)*params(7)*params(4)*1/y(37)*T584));
  g1(37,33)=(-(y(38)*y(21)));
  g1(37,37)=(-(y(47)*params(7)*params(4)*T584*(-y(32))/(y(37)*y(37))));
  g1(37,38)=(-(y(21)*y(33)));
  g1(37,47)=1-params(7)*params(4)*T256;
  g1(38,21)=(-y(33));
  g1(38,32)=(-(y(48)*params(7)*params(4)*1/y(37)*T589));
  g1(38,33)=(-y(21));
  g1(38,37)=(-(y(48)*params(7)*params(4)*T589*(-y(32))/(y(37)*y(37))));
  g1(38,48)=1-T265;
  g1(39,32)=(-(T271*getPowerDeriv(y(32),params(5)-1,1)));
  g1(39,37)=(-(T272*params(4)*getPowerDeriv(y(37),1-params(5),1)));
  g1(39,47)=(-((1-params(4))*T672*T673));
  g1(39,48)=(-((1-params(4))*T673*T684));
  g1(40,32)=(-(y(46)*params(4)*1/y(37)*T584));
  g1(40,37)=(-(y(46)*params(4)*T584*(-y(32))/(y(37)*y(37))));
  g1(40,46)=1-params(4)*T256;
  g1(40,47)=(-((1-params(4))*T672*T677));
  g1(40,48)=(-((1-params(4))*T677*T684));
  g1(41,39)=100*T643-100*params(18)*T643;
  g1(42,43)=1;
  g1(43,42)=1;
  g1(44,21)=(-(100*((y(21))-y(21))/((y(21))*(y(21)))/(y(21)/(y(21)))));
  g1(44,44)=1;
  g1(45,1)=(-(100*((y(1))-y(1))/((y(1))*(y(1)))/(y(1)/(y(1)))));
  g1(45,45)=1;
  g1(46,41)=1;
  g1(47,17)=1;
  g1(48,26)=(-(100*((y(26))-y(26))/((y(26))*(y(26)))/(y(26)/(y(26)))));
  g1(48,40)=1;
  g1(49,6)=(-(100*((y(6))-y(6))/((y(6))*(y(6)))/(y(6)/(y(6)))));
  g1(49,19)=1;
  g1(50,22)=(-(100*((y(22))-y(22))/((y(22))*(y(22)))/(y(22)/(y(22)))));
  g1(50,50)=1;
  g1(51,24)=(-(100*((y(24))-y(24))/((y(24))*(y(24)))/(y(24)/(y(24)))));
  g1(51,51)=1;
  g1(52,23)=(-(100*((y(23))-y(23))/((y(23))*(y(23)))/(y(23)/(y(23)))));
  g1(52,52)=1;
  g1(53,27)=(-(100*((y(27))-y(27))/((y(27))*(y(27)))/(y(27)/(y(27)))));
  g1(53,53)=1;
  g1(54,25)=(-(100*((y(25))-y(25))/((y(25))*(y(25)))/(y(25)/(y(25)))));
  g1(54,54)=1;
  g1(55,42)=(-1);
  g1(55,43)=1;
  g1(55,55)=1;
  g1(56,34)=(-(100*((y(34))-y(34))/((y(34))*(y(34)))/(y(34)/(y(34)))));
  g1(56,56)=1;
  g1(57,57)=1;
  g1(58,39)=(-(100*((y(39))-y(39))/((y(39))*(y(39)))/(y(39)/(y(39)))));
  g1(58,58)=1;
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],58,3364);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],58,195112);
end
end
end
end
