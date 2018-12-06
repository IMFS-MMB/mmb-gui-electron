function [residual, g1, g2, g3] = Diko_mou2_dynamic(y, x, params, steady_state, it_)
%
% Status : Computes dynamic model for Dynare
%
% Inputs :
%   y         [#dynamic variables by 1] double    vector of endogenous variables in the order stored
%                                                 in M_.lead_lag_incidence; see the Manual
%   x         [nperiods by M_.exo_nbr] double     matrix of exogenous variables (in declaration order)
%                                                 for all simulation periods
%   steady_state  [M_.endo_nbr by 1] double       vector of steady state values
%   params    [M_.param_nbr by 1] double          vector of parameter values in declaration order
%   it_       scalar double                       time period for exogenous variables for which to evaluate the model
%
% Outputs:
%   residual  [M_.endo_nbr by 1] double    vector of residuals of the dynamic model equations in order of 
%                                          declaration of the equations.
%                                          Dynare may prepend auxiliary equations, see M_.aux_vars
%   g1        [M_.endo_nbr by #dynamic variables] double    Jacobian matrix of the dynamic model equations;
%                                                           rows: equations in order of declaration
%                                                           columns: variables in order stored in M_.lead_lag_incidence followed by the ones in M_.exo_names
%   g2        [M_.endo_nbr by (#dynamic variables)^2] double   Hessian matrix of the dynamic model equations;
%                                                              rows: equations in order of declaration
%                                                              columns: variables in order stored in M_.lead_lag_incidence followed by the ones in M_.exo_names
%   g3        [M_.endo_nbr by (#dynamic variables)^3] double   Third order derivative matrix of the dynamic model equations;
%                                                              rows: equations in order of declaration
%                                                              columns: variables in order stored in M_.lead_lag_incidence followed by the ones in M_.exo_names
%
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

%
% Model equations
%

residual = zeros(58, 1);
T16 = 1/params(6);
T30 = params(19)*y(18)^params(1);
T32 = (1+y(26))*T30/y(26);
T34 = 1/params(2);
T42 = params(7)*(y(75)/y(18))^(-params(1));
T45 = T42/y(77);
T63 = y(18)^(-params(1));
T169 = params(19)*y(38)^params(1);
T171 = (1+y(46))*T169/y(46);
T177 = params(7)*(y(79)/y(38))^(-params(1));
T180 = T177/y(81);
T196 = y(38)^(-params(1));
T291 = y(81)/y(83);
T294 = params(7)*params(4)*T291^params(5);
T303 = params(7)*params(4)*T291^(params(5)-1);
T310 = params(4)*y(53)^(1-params(5));
T311 = y(48)^(params(5)-1);
T316 = y(63)*params(5)/(params(5)-1)/y(64);
T324 = (y(48)/y(53))^params(5);
lhs =y(27);
rhs =(1+y(26))/y(77);
residual(1)= lhs-rhs;
lhs =y(20);
rhs =T16;
residual(2)= lhs-rhs;
lhs =y(17);
rhs =y(19);
residual(3)= lhs-rhs;
residual(4) = y(17)-y(18)-y(36);
lhs =y(21);
rhs =T32^T34;
residual(5)= lhs-rhs;
lhs =1;
rhs =y(27)*T42;
residual(6)= lhs-rhs;
lhs =1;
rhs =T45*(1+y(25)-y(78)*(1-params(8))*(y(76)-y(25)));
residual(7)= lhs-rhs;
lhs =y(30);
rhs =T45*(1+y(78)*(1-params(8)));
residual(8)= lhs-rhs;
lhs =y(29);
rhs =T63;
residual(9)= lhs-rhs;
lhs =params(13)*y(19)^params(3);
rhs =T16*y(20)*T63*(1-y(31));
residual(10)= lhs-rhs;
lhs =y(22);
rhs =(1-params(8))*y(2)/y(28)+y(23)+y(32);
residual(11)= lhs-rhs;
lhs =y(2)*(1-params(8))*y(3)/y(28)+y(25)*y(23);
rhs =y(22)*y(24);
residual(12)= lhs-rhs;
lhs =y(23)+y(21)+y(19)*y(20)*y(31)-y(1)/y(28);
rhs =y(36)+y(2)*(params(8)+y(3))/y(28);
residual(13)= lhs-rhs;
lhs =y(33);
rhs =params(9)*y(5)+params(10)*y(35);
residual(14)= lhs-rhs;
lhs =y(28);
rhs =(steady_state(12))*exp(y(34)/100);
residual(15)= lhs-rhs;
lhs =y(34);
rhs =params(12)*y(6)+x(it_, 2);
residual(16)= lhs-rhs;
lhs =y(32);
rhs =params(11)*y(4)+x(it_, 1);
residual(17)= lhs-rhs;
lhs =100*(log(y(36))-log((steady_state(20))));
rhs =100*params(18)*(log(y(7))-log((steady_state(20))))+x(it_, 4);
residual(18)= lhs-rhs;
lhs =y(47);
rhs =(1+y(46))/y(81);
residual(19)= lhs-rhs;
lhs =y(40);
rhs =y(54);
residual(20)= lhs-rhs;
lhs =y(37);
rhs =y(39)/y(62);
residual(21)= lhs-rhs;
residual(22) = y(37)-y(38)-y(55);
lhs =y(41);
rhs =T171^T34;
residual(23)= lhs-rhs;
lhs =1;
rhs =y(47)*T177;
residual(24)= lhs-rhs;
lhs =1;
rhs =T180*(1+y(45)-(1-params(8))*y(82)*(y(80)-y(45)));
residual(25)= lhs-rhs;
lhs =y(50);
rhs =T180*(1+(1-params(8))*y(82));
residual(26)= lhs-rhs;
lhs =y(49);
rhs =T196;
residual(27)= lhs-rhs;
lhs =params(13)*y(39)^params(3);
rhs =T16*y(40)*T196*(1-y(51));
residual(28)= lhs-rhs;
lhs =y(42);
rhs =y(32)+(1-params(8))*y(9)/y(48)+y(43);
residual(29)= lhs-rhs;
lhs =y(9)*(1-params(8))*y(10)/y(48)+y(45)*y(43);
rhs =y(42)*y(44);
residual(30)= lhs-rhs;
lhs =y(43)+y(41)+y(39)*y(40)*y(51)-y(8)/y(48);
rhs =y(55)+y(9)*(params(8)+y(10))/y(48);
residual(31)= lhs-rhs;
lhs =y(57);
rhs =params(9)*y(13)+params(10)*y(56);
residual(32)= lhs-rhs;
lhs =y(58)/4;
rhs =(1-params(14))*(y(52)+params(15)*(y(59)/4-y(52))+params(16)*(y(60)-y(61)))+params(14)*y(14)/4-y(65);
residual(33)= lhs-rhs;
lhs =y(65);
rhs =params(17)*y(16)+x(it_, 3);
residual(34)= lhs-rhs;
lhs =y(52);
rhs =x(it_, 2)+params(12)*y(11);
residual(35)= lhs-rhs;
lhs =y(53);
rhs =(steady_state(37))*exp(y(52)/100);
residual(36)= lhs-rhs;
lhs =y(63);
rhs =y(37)*y(54)*y(49)+T294*y(85);
residual(37)= lhs-rhs;
lhs =y(64);
rhs =y(37)*y(49)+T303*y(86);
residual(38)= lhs-rhs;
lhs =1;
rhs =T310*T311+(1-params(4))*T316^(1-params(5));
residual(39)= lhs-rhs;
lhs =y(62);
rhs =params(4)*y(15)*T324+(1-params(4))*T316^(-params(5));
residual(40)= lhs-rhs;
lhs =100*(log(y(55))-log((steady_state(39))));
rhs =x(it_, 4)+100*params(18)*(log(y(12))-log((steady_state(39))));
residual(41)= lhs-rhs;
lhs =y(59);
rhs =4*100*(y(48)-(steady_state(32)));
residual(42)= lhs-rhs;
lhs =y(58);
rhs =4*100*(y(46)-(steady_state(30)));
residual(43)= lhs-rhs;
lhs =y(60);
rhs =100*log(y(37)/(steady_state(21)));
residual(44)= lhs-rhs;
lhs =y(61);
rhs =100*log(y(17)/(steady_state(1)));
residual(45)= lhs-rhs;
lhs =y(57);
rhs =100*(y(51)-(steady_state(35)));
residual(46)= lhs-rhs;
lhs =y(33);
rhs =100*(y(31)-(steady_state(15)));
residual(47)= lhs-rhs;
lhs =y(56);
rhs =100*log(y(42)/(steady_state(26)));
residual(48)= lhs-rhs;
lhs =y(35);
rhs =100*log(y(22)/(steady_state(6)));
residual(49)= lhs-rhs;
lhs =y(66);
rhs =100*log(y(38)/(steady_state(22)));
residual(50)= lhs-rhs;
lhs =y(67);
rhs =100*log(y(40)/(steady_state(24)));
residual(51)= lhs-rhs;
lhs =y(68);
rhs =100*log(y(39)/(steady_state(23)));
residual(52)= lhs-rhs;
lhs =y(69);
rhs =100*log(y(43)/(steady_state(27)));
residual(53)= lhs-rhs;
lhs =y(70);
rhs =100*log(y(41)/(steady_state(25)));
residual(54)= lhs-rhs;
lhs =y(71);
rhs =y(58)-y(84);
residual(55)= lhs-rhs;
lhs =y(72);
rhs =100*log(y(50)/(steady_state(34)));
residual(56)= lhs-rhs;
lhs =y(73);
rhs =4*100*(y(45)-(steady_state(29)));
residual(57)= lhs-rhs;
lhs =y(74);
rhs =100*log(y(55)/(steady_state(39)));
residual(58)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(58, 90);

  %
  % Jacobian matrix
  %

T440 = getPowerDeriv(T32,T34,1);
T446 = getPowerDeriv(y(75)/y(18),(-params(1)),1);
T451 = params(7)*(-y(75))/(y(18)*y(18))*T446/y(77);
T456 = getPowerDeriv(y(18),(-params(1)),1);
T467 = params(7)*T446*1/y(18)/y(77);
T564 = getPowerDeriv(T171,T34,1);
T570 = getPowerDeriv(y(79)/y(38),(-params(1)),1);
T575 = params(7)*(-y(79))/(y(38)*y(38))*T570/y(81);
T580 = getPowerDeriv(y(38),(-params(1)),1);
T595 = params(7)*T570*1/y(38)/y(81);
T672 = getPowerDeriv(y(48)/y(53),params(5),1);
T686 = getPowerDeriv(T291,params(5),1);
T691 = getPowerDeriv(T291,params(5)-1,1);
T770 = params(5)/(params(5)-1)/y(64);
T771 = getPowerDeriv(T316,1-params(5),1);
T775 = getPowerDeriv(T316,(-params(5)),1);
T782 = (-(y(63)*params(5)/(params(5)-1)))/(y(64)*y(64));
  g1(1,26)=(-(1/y(77)));
  g1(1,27)=1;
  g1(1,77)=(-((-(1+y(26)))/(y(77)*y(77))));
  g1(2,20)=1;
  g1(3,17)=1;
  g1(3,19)=(-1);
  g1(4,17)=1;
  g1(4,18)=(-1);
  g1(4,36)=(-1);
  g1(5,18)=(-((1+y(26))*params(19)*getPowerDeriv(y(18),params(1),1)/y(26)*T440));
  g1(5,21)=1;
  g1(5,26)=(-(T440*(y(26)*T30-(1+y(26))*T30)/(y(26)*y(26))));
  g1(6,18)=(-(y(27)*params(7)*(-y(75))/(y(18)*y(18))*T446));
  g1(6,75)=(-(y(27)*params(7)*T446*1/y(18)));
  g1(6,27)=(-T42);
  g1(7,18)=(-((1+y(25)-y(78)*(1-params(8))*(y(76)-y(25)))*T451));
  g1(7,75)=(-((1+y(25)-y(78)*(1-params(8))*(y(76)-y(25)))*T467));
  g1(7,25)=(-(T45*(1-(-(y(78)*(1-params(8)))))));
  g1(7,76)=(-(T45*(-(y(78)*(1-params(8))))));
  g1(7,77)=(-((1+y(25)-y(78)*(1-params(8))*(y(76)-y(25)))*(-T42)/(y(77)*y(77))));
  g1(7,78)=(-(T45*(-((1-params(8))*(y(76)-y(25))))));
  g1(8,18)=(-((1+y(78)*(1-params(8)))*T451));
  g1(8,75)=(-((1+y(78)*(1-params(8)))*T467));
  g1(8,77)=(-((1+y(78)*(1-params(8)))*(-T42)/(y(77)*y(77))));
  g1(8,30)=1;
  g1(8,78)=(-(T45*(1-params(8))));
  g1(9,18)=(-T456);
  g1(9,29)=1;
  g1(10,18)=(-(T16*y(20)*(1-y(31))*T456));
  g1(10,19)=params(13)*getPowerDeriv(y(19),params(3),1);
  g1(10,20)=(-(T16*T63*(1-y(31))));
  g1(10,31)=(-(T16*y(20)*(-T63)));
  g1(11,2)=(-((1-params(8))/y(28)));
  g1(11,22)=1;
  g1(11,23)=(-1);
  g1(11,28)=(-((-((1-params(8))*y(2)))/(y(28)*y(28))));
  g1(11,32)=(-1);
  g1(12,2)=(1-params(8))*y(3)/y(28);
  g1(12,22)=(-y(24));
  g1(12,23)=y(25);
  g1(12,3)=(1-params(8))*y(2)/y(28);
  g1(12,24)=(-y(22));
  g1(12,25)=y(23);
  g1(12,28)=(-(y(2)*(1-params(8))*y(3)))/(y(28)*y(28));
  g1(13,19)=y(20)*y(31);
  g1(13,20)=y(19)*y(31);
  g1(13,1)=(-(1/y(28)));
  g1(13,21)=1;
  g1(13,2)=(-((params(8)+y(3))/y(28)));
  g1(13,23)=1;
  g1(13,3)=(-(y(2)/y(28)));
  g1(13,28)=(-((-y(1))/(y(28)*y(28))))-(-(y(2)*(params(8)+y(3))))/(y(28)*y(28));
  g1(13,31)=y(20)*y(19);
  g1(13,36)=(-1);
  g1(14,5)=(-params(9));
  g1(14,33)=1;
  g1(14,35)=(-params(10));
  g1(15,28)=1;
  g1(15,34)=(-((steady_state(12))*exp(y(34)/100)*0.01));
  g1(16,6)=(-params(12));
  g1(16,34)=1;
  g1(16,88)=(-1);
  g1(17,4)=(-params(11));
  g1(17,32)=1;
  g1(17,87)=(-1);
  g1(18,7)=(-(100*params(18)*1/y(7)));
  g1(18,36)=100*1/y(36);
  g1(18,90)=(-1);
  g1(19,46)=(-(1/y(81)));
  g1(19,47)=1;
  g1(19,81)=(-((-(1+y(46)))/(y(81)*y(81))));
  g1(20,40)=1;
  g1(20,54)=(-1);
  g1(21,37)=1;
  g1(21,39)=(-(1/y(62)));
  g1(21,62)=(-((-y(39))/(y(62)*y(62))));
  g1(22,37)=1;
  g1(22,38)=(-1);
  g1(22,55)=(-1);
  g1(23,38)=(-((1+y(46))*params(19)*getPowerDeriv(y(38),params(1),1)/y(46)*T564));
  g1(23,41)=1;
  g1(23,46)=(-(T564*(y(46)*T169-(1+y(46))*T169)/(y(46)*y(46))));
  g1(24,38)=(-(y(47)*params(7)*(-y(79))/(y(38)*y(38))*T570));
  g1(24,79)=(-(y(47)*params(7)*T570*1/y(38)));
  g1(24,47)=(-T177);
  g1(25,38)=(-((1+y(45)-(1-params(8))*y(82)*(y(80)-y(45)))*T575));
  g1(25,79)=(-((1+y(45)-(1-params(8))*y(82)*(y(80)-y(45)))*T595));
  g1(25,45)=(-(T180*(1-(-((1-params(8))*y(82))))));
  g1(25,80)=(-(T180*(-((1-params(8))*y(82)))));
  g1(25,81)=(-((1+y(45)-(1-params(8))*y(82)*(y(80)-y(45)))*(-T177)/(y(81)*y(81))));
  g1(25,82)=(-(T180*(-((1-params(8))*(y(80)-y(45))))));
  g1(26,38)=(-((1+(1-params(8))*y(82))*T575));
  g1(26,79)=(-((1+(1-params(8))*y(82))*T595));
  g1(26,81)=(-((1+(1-params(8))*y(82))*(-T177)/(y(81)*y(81))));
  g1(26,50)=1;
  g1(26,82)=(-((1-params(8))*T180));
  g1(27,38)=(-T580);
  g1(27,49)=1;
  g1(28,38)=(-(T16*y(40)*(1-y(51))*T580));
  g1(28,39)=params(13)*getPowerDeriv(y(39),params(3),1);
  g1(28,40)=(-(T16*T196*(1-y(51))));
  g1(28,51)=(-(T16*y(40)*(-T196)));
  g1(29,32)=(-1);
  g1(29,9)=(-((1-params(8))/y(48)));
  g1(29,42)=1;
  g1(29,43)=(-1);
  g1(29,48)=(-((-((1-params(8))*y(9)))/(y(48)*y(48))));
  g1(30,9)=(1-params(8))*y(10)/y(48);
  g1(30,42)=(-y(44));
  g1(30,43)=y(45);
  g1(30,10)=y(9)*(1-params(8))/y(48);
  g1(30,44)=(-y(42));
  g1(30,45)=y(43);
  g1(30,48)=y(9)*(-((1-params(8))*y(10)))/(y(48)*y(48));
  g1(31,39)=y(40)*y(51);
  g1(31,40)=y(39)*y(51);
  g1(31,8)=(-(1/y(48)));
  g1(31,41)=1;
  g1(31,9)=(-((params(8)+y(10))/y(48)));
  g1(31,43)=1;
  g1(31,10)=(-(y(9)/y(48)));
  g1(31,48)=(-((-y(8))/(y(48)*y(48))))-(-(y(9)*(params(8)+y(10))))/(y(48)*y(48));
  g1(31,51)=y(40)*y(39);
  g1(31,55)=(-1);
  g1(32,56)=(-params(10));
  g1(32,13)=(-params(9));
  g1(32,57)=1;
  g1(33,52)=(-((1-params(14))*(1-params(15))));
  g1(33,14)=(-(params(14)/4));
  g1(33,58)=0.25;
  g1(33,59)=(-((1-params(14))*params(15)*0.25));
  g1(33,60)=(-((1-params(14))*params(16)));
  g1(33,61)=(-((1-params(14))*(-params(16))));
  g1(33,65)=1;
  g1(34,16)=(-params(17));
  g1(34,65)=1;
  g1(34,89)=(-1);
  g1(35,11)=(-params(12));
  g1(35,52)=1;
  g1(35,88)=(-1);
  g1(36,52)=(-((steady_state(37))*exp(y(52)/100)*0.01));
  g1(36,53)=1;
  g1(37,37)=(-(y(54)*y(49)));
  g1(37,81)=(-(y(85)*params(7)*params(4)*1/y(83)*T686));
  g1(37,49)=(-(y(54)*y(37)));
  g1(37,83)=(-(y(85)*params(7)*params(4)*T686*(-y(81))/(y(83)*y(83))));
  g1(37,54)=(-(y(37)*y(49)));
  g1(37,63)=1;
  g1(37,85)=(-T294);
  g1(38,37)=(-y(49));
  g1(38,81)=(-(y(86)*params(7)*params(4)*1/y(83)*T691));
  g1(38,49)=(-y(37));
  g1(38,83)=(-(y(86)*params(7)*params(4)*T691*(-y(81))/(y(83)*y(83))));
  g1(38,64)=1;
  g1(38,86)=(-T303);
  g1(39,48)=(-(T310*getPowerDeriv(y(48),params(5)-1,1)));
  g1(39,53)=(-(T311*params(4)*getPowerDeriv(y(53),1-params(5),1)));
  g1(39,63)=(-((1-params(4))*T770*T771));
  g1(39,64)=(-((1-params(4))*T771*T782));
  g1(40,48)=(-(params(4)*y(15)*1/y(53)*T672));
  g1(40,53)=(-(params(4)*y(15)*T672*(-y(48))/(y(53)*y(53))));
  g1(40,15)=(-(params(4)*T324));
  g1(40,62)=1;
  g1(40,63)=(-((1-params(4))*T770*T775));
  g1(40,64)=(-((1-params(4))*T775*T782));
  g1(41,12)=(-(100*params(18)*1/y(12)));
  g1(41,55)=100*1/y(55);
  g1(41,90)=(-1);
  g1(42,48)=(-400);
  g1(42,59)=1;
  g1(43,46)=(-400);
  g1(43,58)=1;
  g1(44,37)=(-(100*1/(steady_state(21))/(y(37)/(steady_state(21)))));
  g1(44,60)=1;
  g1(45,17)=(-(100*1/(steady_state(1))/(y(17)/(steady_state(1)))));
  g1(45,61)=1;
  g1(46,51)=(-100);
  g1(46,57)=1;
  g1(47,31)=(-100);
  g1(47,33)=1;
  g1(48,42)=(-(100*1/(steady_state(26))/(y(42)/(steady_state(26)))));
  g1(48,56)=1;
  g1(49,22)=(-(100*1/(steady_state(6))/(y(22)/(steady_state(6)))));
  g1(49,35)=1;
  g1(50,38)=(-(100*1/(steady_state(22))/(y(38)/(steady_state(22)))));
  g1(50,66)=1;
  g1(51,40)=(-(100*1/(steady_state(24))/(y(40)/(steady_state(24)))));
  g1(51,67)=1;
  g1(52,39)=(-(100*1/(steady_state(23))/(y(39)/(steady_state(23)))));
  g1(52,68)=1;
  g1(53,43)=(-(100*1/(steady_state(27))/(y(43)/(steady_state(27)))));
  g1(53,69)=1;
  g1(54,41)=(-(100*1/(steady_state(25))/(y(41)/(steady_state(25)))));
  g1(54,70)=1;
  g1(55,58)=(-1);
  g1(55,84)=1;
  g1(55,71)=1;
  g1(56,50)=(-(100*1/(steady_state(34))/(y(50)/(steady_state(34)))));
  g1(56,72)=1;
  g1(57,45)=(-400);
  g1(57,73)=1;
  g1(58,55)=(-(100*1/(steady_state(39))/(y(55)/(steady_state(39)))));
  g1(58,74)=1;

if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],58,8100);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],58,729000);
end
end
end
end
