function [residual, g1, g2, g3] = NK_KM16AL_static(y, x, params)
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

residual = zeros( 65, 1);

%
% Model equations
%

T110 = params(55)*y(2)^params(35);
T112 = (1+y(10))*T110/y(10);
T114 = 1/params(36);
T121 = params(43)/y(12);
T134 = y(2)^(-params(35));
T145 = 1/params(42);
T224 = params(55)*y(21)^params(35);
T226 = (1+y(29))*T224/y(29);
T231 = params(43)/y(31);
T242 = y(21)^(-params(35));
T301 = y(31)/y(36);
T303 = T301^params(39);
T312 = params(43)*params(38)*T301^(params(39)-1);
T318 = params(38)*y(36)^(1-params(39));
T319 = y(31)^(params(39)-1);
T324 = y(46)*params(39)/(params(39)-1)/y(47);
lhs =y(57);
rhs =y(41);
residual(1)= lhs-rhs;
lhs =y(58);
rhs =0.25*(y(64)+y(59)+y(63)+y(64));
residual(2)= lhs-rhs;
lhs =y(59);
rhs =400*log(y(31)/(y(31)));
residual(3)= lhs-rhs;
lhs =y(63);
rhs =y(59);
residual(4)= lhs-rhs;
lhs =y(64);
rhs =y(63);
residual(5)= lhs-rhs;
lhs =y(65);
rhs =y(63)+y(64);
residual(6)= lhs-rhs;
lhs =y(60);
rhs =100*(log(y(20))-log(y(1)));
residual(7)= lhs-rhs;
lhs =y(61);
rhs =100*(log(y(20))-log((y(20))));
residual(8)= lhs-rhs;
lhs =y(62);
rhs =y(56);
residual(9)= lhs-rhs;
lhs =y(57);
rhs =y(57)*params(1)+y(59)*params(5)+y(59)*params(6)+y(63)*params(7)+y(64)*params(8)+y(59)*params(10)+y(60)*params(14)+y(60)*params(15)+y(61)*params(23)+y(61)*params(24)+params(32)*x(3);
residual(10)= lhs-rhs;
lhs =y(62);
rhs =params(34)*x(4);
residual(11)= lhs-rhs;
lhs =y(11);
rhs =(1+y(10))/y(12);
residual(12)= lhs-rhs;
lhs =y(4);
rhs =1/params(40);
residual(13)= lhs-rhs;
lhs =y(1);
rhs =y(3);
residual(14)= lhs-rhs;
residual(15) = y(1)-y(2)-y(38);
lhs =y(5);
rhs =T112^T114;
residual(16)= lhs-rhs;
lhs =1;
rhs =y(11)*params(43);
residual(17)= lhs-rhs;
lhs =1;
rhs =T121*(1+y(9));
residual(18)= lhs-rhs;
lhs =y(14);
rhs =T121*(1+y(14)*(1-params(44)));
residual(19)= lhs-rhs;
lhs =y(13);
rhs =T134;
residual(20)= lhs-rhs;
lhs =params(49)*y(3)^params(37);
rhs =y(4)*T134*(1-y(15))*T145;
residual(21)= lhs-rhs;
lhs =y(6);
rhs =(1-params(44))*y(6)/y(12)+y(7)+y(16);
residual(22)= lhs-rhs;
lhs =y(6)*(1-params(44))*y(8)/y(12)+y(9)*y(7);
rhs =y(6)*y(8)-y(16)*y(8);
residual(23)= lhs-rhs;
lhs =y(7)+y(5)+y(3)*y(4)*y(15)-y(5)/y(12);
rhs =y(38)+y(6)*(params(44)+y(8))/y(12);
residual(24)= lhs-rhs;
lhs =y(17);
rhs =y(17)*params(45)+params(46)*y(19);
residual(25)= lhs-rhs;
lhs =y(12);
rhs =(y(12))*exp(y(18)/100);
residual(26)= lhs-rhs;
lhs =y(18);
rhs =y(18)*params(48)+x(2);
residual(27)= lhs-rhs;
lhs =y(16);
rhs =y(16)*params(47)+x(1);
residual(28)= lhs-rhs;
lhs =log(y(38))-log((y(38)));
rhs =y(56);
residual(29)= lhs-rhs;
lhs =y(30);
rhs =(1+y(29))/y(31);
residual(30)= lhs-rhs;
lhs =y(23);
rhs =y(37);
residual(31)= lhs-rhs;
lhs =y(20);
rhs =y(22)/y(45);
residual(32)= lhs-rhs;
residual(33) = y(20)-y(21)-y(38);
lhs =y(24);
rhs =T226^T114;
residual(34)= lhs-rhs;
lhs =1;
rhs =params(43)*y(30);
residual(35)= lhs-rhs;
lhs =1;
rhs =T231*(1+y(28));
residual(36)= lhs-rhs;
lhs =y(33);
rhs =T231*(1+(1-params(44))*y(33));
residual(37)= lhs-rhs;
lhs =y(32);
rhs =T242;
residual(38)= lhs-rhs;
lhs =params(49)*y(22)^params(37);
rhs =T145*y(23)*T242*(1-y(34));
residual(39)= lhs-rhs;
lhs =y(25);
rhs =y(16)+(1-params(44))*y(25)/y(31)+y(26);
residual(40)= lhs-rhs;
lhs =y(25)*(1-params(44))*y(27)/y(31)+y(28)*y(26);
rhs =y(25)*y(27)-y(16)*y(27);
residual(41)= lhs-rhs;
lhs =y(26)+y(24)+y(22)*y(23)*y(34)-y(24)/y(31);
rhs =y(38)+y(25)*(params(44)+y(27))/y(31);
residual(42)= lhs-rhs;
lhs =y(40);
rhs =params(45)*y(40)+params(46)*y(39);
residual(43)= lhs-rhs;
lhs =y(35);
rhs =x(2)+params(48)*y(35);
residual(44)= lhs-rhs;
lhs =y(36);
rhs =(y(36))*exp(y(35)/100);
residual(45)= lhs-rhs;
lhs =y(46);
rhs =y(20)*y(37)*y(32)+y(46)*params(43)*params(38)*T303;
residual(46)= lhs-rhs;
lhs =y(47);
rhs =y(20)*y(32)+y(47)*T312;
residual(47)= lhs-rhs;
lhs =1;
rhs =T318*T319+(1-params(38))*T324^(1-params(39));
residual(48)= lhs-rhs;
lhs =y(45);
rhs =T303*y(45)*params(38)+(1-params(38))*T324^(-params(39));
residual(49)= lhs-rhs;
lhs =y(42);
rhs =4*log(y(31)/(y(31)))*100;
residual(50)= lhs-rhs;
lhs =y(41);
rhs =4*100*(y(29)-(y(29)));
residual(51)= lhs-rhs;
lhs =y(43);
rhs =100*log(y(20)/(y(20)));
residual(52)= lhs-rhs;
lhs =y(44);
rhs =100*log(y(1)/(y(1)));
residual(53)= lhs-rhs;
lhs =y(40);
rhs =100*(y(34)-(y(34)));
residual(54)= lhs-rhs;
lhs =y(17);
rhs =100*(y(15)-(y(15)));
residual(55)= lhs-rhs;
lhs =y(39);
rhs =100*log(y(25)/(y(25)));
residual(56)= lhs-rhs;
lhs =y(19);
rhs =100*log(y(6)/(y(6)));
residual(57)= lhs-rhs;
lhs =y(48);
rhs =100*log(y(21)/(y(21)));
residual(58)= lhs-rhs;
lhs =y(49);
rhs =100*log(y(23)/(y(23)));
residual(59)= lhs-rhs;
lhs =y(50);
rhs =100*log(y(22)/(y(22)));
residual(60)= lhs-rhs;
lhs =y(51);
rhs =100*log(y(26)/(y(26)));
residual(61)= lhs-rhs;
lhs =y(52);
rhs =100*log(y(24)/(y(24)));
residual(62)= lhs-rhs;
lhs =y(53);
rhs =y(41)-y(42);
residual(63)= lhs-rhs;
lhs =y(54);
rhs =100*log(y(33)/(y(33)));
residual(64)= lhs-rhs;
lhs =y(55);
rhs =4*100*(y(28)-(y(28)));
residual(65)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(65, 65);

  %
  % Jacobian matrix
  %

T434 = getPowerDeriv(T112,T114,1);
T437 = getPowerDeriv(y(2),(-params(35)),1);
T532 = getPowerDeriv(T226,T114,1);
T535 = getPowerDeriv(y(21),(-params(35)),1);
T607 = ((y(31))-y(31))/((y(31))*(y(31)))/(y(31)/(y(31)));
T632 = getPowerDeriv(T301,params(39),1);
T637 = getPowerDeriv(T301,params(39)-1,1);
T698 = params(39)/(params(39)-1)/y(47);
T699 = getPowerDeriv(T324,1-params(39),1);
T703 = getPowerDeriv(T324,(-params(39)),1);
T710 = (-(y(46)*params(39)/(params(39)-1)))/(y(47)*y(47));
  g1(1,41)=(-1);
  g1(1,57)=1;
  g1(2,58)=1;
  g1(2,59)=(-0.25);
  g1(2,63)=(-0.25);
  g1(2,64)=(-0.5);
  g1(3,31)=(-(400*T607));
  g1(3,59)=1;
  g1(4,59)=(-1);
  g1(4,63)=1;
  g1(5,63)=(-1);
  g1(5,64)=1;
  g1(6,63)=(-1);
  g1(6,64)=(-1);
  g1(6,65)=1;
  g1(7,1)=(-(100*(-(1/y(1)))));
  g1(7,20)=(-(100*1/y(20)));
  g1(7,60)=1;
  g1(8,20)=(-(100*(1/y(20)-1/(y(20)))));
  g1(8,61)=1;
  g1(9,56)=(-1);
  g1(9,62)=1;
  g1(10,57)=1-params(1);
  g1(10,59)=(-(params(10)+params(5)+params(6)));
  g1(10,60)=(-(params(14)+params(15)));
  g1(10,61)=(-(params(23)+params(24)));
  g1(10,63)=(-params(7));
  g1(10,64)=(-params(8));
  g1(11,62)=1;
  g1(12,10)=(-(1/y(12)));
  g1(12,11)=1;
  g1(12,12)=(-((-(1+y(10)))/(y(12)*y(12))));
  g1(13,4)=1;
  g1(14,1)=1;
  g1(14,3)=(-1);
  g1(15,1)=1;
  g1(15,2)=(-1);
  g1(15,38)=(-1);
  g1(16,2)=(-((1+y(10))*params(55)*getPowerDeriv(y(2),params(35),1)/y(10)*T434));
  g1(16,5)=1;
  g1(16,10)=(-(T434*(y(10)*T110-(1+y(10))*T110)/(y(10)*y(10))));
  g1(17,11)=(-params(43));
  g1(18,9)=(-T121);
  g1(18,12)=(-((1+y(9))*(-params(43))/(y(12)*y(12))));
  g1(19,12)=(-((1+y(14)*(1-params(44)))*(-params(43))/(y(12)*y(12))));
  g1(19,14)=1-T121*(1-params(44));
  g1(20,2)=(-T437);
  g1(20,13)=1;
  g1(21,2)=(-(T145*y(4)*(1-y(15))*T437));
  g1(21,3)=params(49)*getPowerDeriv(y(3),params(37),1);
  g1(21,4)=(-(T134*(1-y(15))*T145));
  g1(21,15)=(-(T145*y(4)*(-T134)));
  g1(22,6)=1-(1-params(44))/y(12);
  g1(22,7)=(-1);
  g1(22,12)=(-((-((1-params(44))*y(6)))/(y(12)*y(12))));
  g1(22,16)=(-1);
  g1(23,6)=(1-params(44))*y(8)/y(12)-y(8);
  g1(23,7)=y(9);
  g1(23,8)=(1-params(44))*y(6)/y(12)-(y(6)-y(16));
  g1(23,9)=y(7);
  g1(23,12)=(-(y(6)*(1-params(44))*y(8)))/(y(12)*y(12));
  g1(23,16)=y(8);
  g1(24,3)=y(4)*y(15);
  g1(24,4)=y(3)*y(15);
  g1(24,5)=1-1/y(12);
  g1(24,6)=(-((params(44)+y(8))/y(12)));
  g1(24,7)=1;
  g1(24,8)=(-(y(6)/y(12)));
  g1(24,12)=(-((-y(5))/(y(12)*y(12))))-(-(y(6)*(params(44)+y(8))))/(y(12)*y(12));
  g1(24,15)=y(4)*y(3);
  g1(24,38)=(-1);
  g1(25,17)=1-params(45);
  g1(25,19)=(-params(46));
  g1(26,12)=1-exp(y(18)/100);
  g1(26,18)=(-((y(12))*exp(y(18)/100)*0.01));
  g1(27,18)=1-params(48);
  g1(28,16)=1-params(47);
  g1(29,38)=1/y(38)-1/(y(38));
  g1(29,56)=(-1);
  g1(30,29)=(-(1/y(31)));
  g1(30,30)=1;
  g1(30,31)=(-((-(1+y(29)))/(y(31)*y(31))));
  g1(31,23)=1;
  g1(31,37)=(-1);
  g1(32,20)=1;
  g1(32,22)=(-(1/y(45)));
  g1(32,45)=(-((-y(22))/(y(45)*y(45))));
  g1(33,20)=1;
  g1(33,21)=(-1);
  g1(33,38)=(-1);
  g1(34,21)=(-((1+y(29))*params(55)*getPowerDeriv(y(21),params(35),1)/y(29)*T532));
  g1(34,24)=1;
  g1(34,29)=(-(T532*(y(29)*T224-(1+y(29))*T224)/(y(29)*y(29))));
  g1(35,30)=(-params(43));
  g1(36,28)=(-T231);
  g1(36,31)=(-((1+y(28))*(-params(43))/(y(31)*y(31))));
  g1(37,31)=(-((1+(1-params(44))*y(33))*(-params(43))/(y(31)*y(31))));
  g1(37,33)=1-(1-params(44))*T231;
  g1(38,21)=(-T535);
  g1(38,32)=1;
  g1(39,21)=(-(T145*y(23)*(1-y(34))*T535));
  g1(39,22)=params(49)*getPowerDeriv(y(22),params(37),1);
  g1(39,23)=(-(T145*T242*(1-y(34))));
  g1(39,34)=(-(T145*y(23)*(-T242)));
  g1(40,16)=(-1);
  g1(40,25)=1-(1-params(44))/y(31);
  g1(40,26)=(-1);
  g1(40,31)=(-((-((1-params(44))*y(25)))/(y(31)*y(31))));
  g1(41,16)=y(27);
  g1(41,25)=(1-params(44))*y(27)/y(31)-y(27);
  g1(41,26)=y(28);
  g1(41,27)=y(25)*(1-params(44))/y(31)-(y(25)-y(16));
  g1(41,28)=y(26);
  g1(41,31)=y(25)*(-((1-params(44))*y(27)))/(y(31)*y(31));
  g1(42,22)=y(23)*y(34);
  g1(42,23)=y(22)*y(34);
  g1(42,24)=1-1/y(31);
  g1(42,25)=(-((params(44)+y(27))/y(31)));
  g1(42,26)=1;
  g1(42,27)=(-(y(25)/y(31)));
  g1(42,31)=(-((-y(24))/(y(31)*y(31))))-(-(y(25)*(params(44)+y(27))))/(y(31)*y(31));
  g1(42,34)=y(23)*y(22);
  g1(42,38)=(-1);
  g1(43,39)=(-params(46));
  g1(43,40)=1-params(45);
  g1(44,35)=1-params(48);
  g1(45,35)=(-((y(36))*exp(y(35)/100)*0.01));
  g1(45,36)=1-exp(y(35)/100);
  g1(46,20)=(-(y(37)*y(32)));
  g1(46,31)=(-(y(46)*params(43)*params(38)*1/y(36)*T632));
  g1(46,32)=(-(y(20)*y(37)));
  g1(46,36)=(-(y(46)*params(43)*params(38)*T632*(-y(31))/(y(36)*y(36))));
  g1(46,37)=(-(y(20)*y(32)));
  g1(46,46)=1-params(43)*params(38)*T303;
  g1(47,20)=(-y(32));
  g1(47,31)=(-(y(47)*params(43)*params(38)*1/y(36)*T637));
  g1(47,32)=(-y(20));
  g1(47,36)=(-(y(47)*params(43)*params(38)*T637*(-y(31))/(y(36)*y(36))));
  g1(47,47)=1-T312;
  g1(48,31)=(-(T318*getPowerDeriv(y(31),params(39)-1,1)));
  g1(48,36)=(-(T319*params(38)*getPowerDeriv(y(36),1-params(39),1)));
  g1(48,46)=(-((1-params(38))*T698*T699));
  g1(48,47)=(-((1-params(38))*T699*T710));
  g1(49,31)=(-(y(45)*params(38)*1/y(36)*T632));
  g1(49,36)=(-(y(45)*params(38)*T632*(-y(31))/(y(36)*y(36))));
  g1(49,45)=1-params(38)*T303;
  g1(49,46)=(-((1-params(38))*T698*T703));
  g1(49,47)=(-((1-params(38))*T703*T710));
  g1(50,31)=(-(4*100*T607));
  g1(50,42)=1;
  g1(51,41)=1;
  g1(52,20)=(-(100*((y(20))-y(20))/((y(20))*(y(20)))/(y(20)/(y(20)))));
  g1(52,43)=1;
  g1(53,1)=(-(100*((y(1))-y(1))/((y(1))*(y(1)))/(y(1)/(y(1)))));
  g1(53,44)=1;
  g1(54,40)=1;
  g1(55,17)=1;
  g1(56,25)=(-(100*((y(25))-y(25))/((y(25))*(y(25)))/(y(25)/(y(25)))));
  g1(56,39)=1;
  g1(57,6)=(-(100*((y(6))-y(6))/((y(6))*(y(6)))/(y(6)/(y(6)))));
  g1(57,19)=1;
  g1(58,21)=(-(100*((y(21))-y(21))/((y(21))*(y(21)))/(y(21)/(y(21)))));
  g1(58,48)=1;
  g1(59,23)=(-(100*((y(23))-y(23))/((y(23))*(y(23)))/(y(23)/(y(23)))));
  g1(59,49)=1;
  g1(60,22)=(-(100*((y(22))-y(22))/((y(22))*(y(22)))/(y(22)/(y(22)))));
  g1(60,50)=1;
  g1(61,26)=(-(100*((y(26))-y(26))/((y(26))*(y(26)))/(y(26)/(y(26)))));
  g1(61,51)=1;
  g1(62,24)=(-(100*((y(24))-y(24))/((y(24))*(y(24)))/(y(24)/(y(24)))));
  g1(62,52)=1;
  g1(63,41)=(-1);
  g1(63,42)=1;
  g1(63,53)=1;
  g1(64,33)=(-(100*((y(33))-y(33))/((y(33))*(y(33)))/(y(33)/(y(33)))));
  g1(64,54)=1;
  g1(65,55)=1;
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],65,4225);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],65,274625);
end
end
end
end
