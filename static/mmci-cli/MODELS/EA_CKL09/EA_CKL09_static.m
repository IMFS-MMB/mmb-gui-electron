function [residual, g1, g2, g3] = EA_CKL09_static(y, x, params)
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

residual = zeros( 73, 1);

%
% Model equations
%

T3 = (-1);
T162 = (-params(38))/(1-params(37));
T184 = 1/(1+params(41)*params(35))*(1-params(40))*(1-params(35)*params(40))/params(40);
T265 = (-params(47))/(1-params(47));
T267 = 1/(1-params(47));
T269 = y(18)*T265+(y(20)+y(43))*T267;
T279 = y(38)*params(46)/(1-params(46));
T297 = (-(1+params(39)))/(1-params(47));
T300 = (1+params(39))/(1-params(47));
T305 = params(44)*params(35)*(1-params(46))/(1-params(44)*params(35)*(1-params(46)));
T315 = T305*(params(78)*params(88)*(params(47)/(1-params(47)))^2-params(78)*params(82)*(1+params(39))/(1-params(47))^2);
T326 = params(88)*params(78)/params(47);
T352 = params(47)*params(88)*params(78)/(1-params(47))-params(78)*T267*params(82);
T355 = params(88)*params(78)/(1-params(47));
T358 = params(78)*params(82)/(1+params(39));
T369 = T352*params(85)*params(35)*params(44)/(1-params(44)*params(35)*(1-params(46)));
T385 = params(68)/params(84);
T391 = params(78)*params(88)*params(35)*params(44)/(1-params(44)*params(35)*(1-params(46)));
T470 = params(78)*params(82)*T3/(1-params(47));
lhs =y(45);
rhs =4*y(14);
residual(1)= lhs-rhs;
lhs =y(46);
rhs =y(12);
residual(2)= lhs-rhs;
lhs =y(47);
rhs =4*y(11);
residual(3)= lhs-rhs;
lhs =y(48);
rhs =y(21)-y(35);
residual(4)= lhs-rhs;
lhs =y(49);
rhs =y(21);
residual(5)= lhs-rhs;
lhs =y(50);
rhs =y(44);
residual(6)= lhs-rhs;
lhs =y(45);
rhs =params(32)*x(7)+y(49)*params(31)+y(49)*params(30)+y(49)*params(29)+y(49)*params(28)+y(49)*params(27)+y(49)*params(26)+y(49)*params(25)+y(49)*params(24)+y(49)*params(23)+y(48)*params(22)+y(48)*params(21)+y(48)*params(20)+y(48)*params(19)+y(48)*params(18)+y(48)*params(17)+y(48)*params(16)+y(48)*params(15)+y(48)*params(14)+y(47)*params(13)+y(47)*params(12)+y(47)*params(11)+y(47)*params(10)+y(47)*params(6)+y(47)*params(5)+y(45)*params(1)+y(45)*params(2)+y(45)*params(3)+y(45)*params(4)+y(47)*params(7)+y(47)*params(8)+y(47)*params(9);
residual(7)= lhs-rhs;
lhs =y(50);
rhs =params(34)*x(8);
residual(8)= lhs-rhs;
lhs =y(7);
rhs =y(14)+y(7)+y(39)-y(11);
residual(9)= lhs-rhs;
lhs =y(7);
rhs =T162*(y(1)-params(37)*y(1));
residual(10)= lhs-rhs;
lhs =y(11);
rhs =y(11)*params(41)/(1+params(41)*params(35))+y(11)*params(35)/(1+params(41)*params(35))+T184*y(8);
residual(11)= lhs-rhs;
lhs =y(8);
rhs =y(40)+y(20);
residual(12)= lhs-rhs;
lhs =y(9);
rhs =params(42)*y(16)+(1-params(42))*y(17);
residual(13)= lhs-rhs;
lhs =y(10);
rhs =y(10)*(1-params(46))+y(9)*params(80)/params(83)-params(46)*y(38);
residual(14)= lhs-rhs;
lhs =y(10);
rhs =y(16)*(-params(86))/(1-params(86));
residual(15)= lhs-rhs;
lhs =y(13);
rhs =y(9)-y(17);
residual(16)= lhs-rhs;
lhs =y(15);
rhs =y(9)-y(16);
residual(17)= lhs-rhs;
lhs =y(6)+y(3);
rhs =y(4)+y(2)-1/(1-params(43))*y(36);
residual(18)= lhs-rhs;
lhs =y(19);
rhs =y(20)+y(43)+(params(47)-1)*y(5);
residual(19)= lhs-rhs;
lhs =y(19);
rhs =params(44)*(y(19)-y(11)+y(11)*params(45))+(1-params(44))*y(18);
residual(20)= lhs-rhs;
lhs =y(2);
rhs =(1-params(44)*params(35)*(1-params(46)))*T269+params(44)*params(35)*(1-params(46))*(y(7)+y(2)+T265*(y(11)*params(45)+y(18)-y(18)-y(11))-y(7)-T279);
residual(21)= lhs-rhs;
lhs =y(3)*params(75);
rhs =T269*T265*params(88)*params(78)+params(78)*T267*params(82)*(y(18)*T297-y(7)+(y(20)+y(43))*T300)+(y(11)*params(45)+y(18)-y(18)-y(11))*T315+params(44)*params(35)*(1-params(46))*params(75)*(y(3)-T279);
residual(22)= lhs-rhs;
lhs =y(6)*params(79);
rhs =T326*(y(43)+y(20)+y(18)*(-params(47)))+params(78)*params(88)*T305*(y(11)+y(18)-y(18)-y(11)*params(45))+params(35)*(1-params(46))*params(79)*(y(6)-T279);
residual(23)= lhs-rhs;
lhs =y(4)*params(74);
rhs =y(4)*params(74)*params(35)*(1-params(46)-params(85))+(y(11)+y(18)-y(18)-y(11)*params(45))*T305*T352+(y(43)+y(20)+y(18)*(-params(47)))*T355-T358*(T300*(y(43)+y(20)-y(18))-y(7))-T369*(y(11)+y(18)-y(19)-y(11)*params(45))-y(15)*params(85)*params(35)*params(74)-y(38)*params(46)*params(35)*params(74);
residual(24)= lhs-rhs;
lhs =T385*(y(37)-y(13));
rhs =T391*(y(11)+y(18)-y(19)-y(11)*params(45))+y(6)*params(35)*params(79);
residual(25)= lhs-rhs;
lhs =y(21)*params(89);
rhs =y(1)*params(73)+params(77)*y(42)+params(68)*params(87)*(y(17)+y(37))+y(10)*params(83)*params(70);
residual(26)= lhs-rhs;
lhs =y(21);
rhs =y(10)+y(43)+params(47)*y(5);
residual(27)= lhs-rhs;
lhs =y(12);
rhs =y(11)+y(11)+y(11)+y(11);
residual(28)= lhs-rhs;
lhs =y(28);
rhs =T162*(y(22)-params(37)*y(1));
residual(29)= lhs-rhs;
lhs =0;
rhs =y(40)+y(34);
residual(30)= lhs-rhs;
lhs =y(29);
rhs =params(42)*y(16)+(1-params(42))*y(32);
residual(31)= lhs-rhs;
lhs =y(30);
rhs =y(29)-y(32);
residual(32)= lhs-rhs;
lhs =y(31);
rhs =y(29)-y(16);
residual(33)= lhs-rhs;
lhs =y(27)+y(24);
rhs =y(25)+y(23)-1/(1-params(43))*y(36);
residual(34)= lhs-rhs;
lhs =y(33);
rhs =y(43)+y(34)+(params(47)-1)*y(26);
residual(35)= lhs-rhs;
lhs =y(23);
rhs =T265*y(33)+T267*(y(43)+y(34));
residual(36)= lhs-rhs;
lhs =y(24)*params(90);
rhs =T265*params(88)*params(78)*(T265*y(33)+T267*(y(43)+y(34)))-T470*(T297*y(33)-y(28)+T300*(y(43)+y(34)));
residual(37)= lhs-rhs;
lhs =params(79)*y(27);
rhs =T326*(y(43)+y(34)+(-params(47))*y(33))+params(35)*(1-params(46))*params(79)*(y(27)-T279);
residual(38)= lhs-rhs;
lhs =params(74)*y(25);
rhs =params(74)*params(35)*(1-params(46)-params(85))*y(25)+T355*(y(43)+y(34)+(-params(47))*y(33))-T358*(T300*(y(43)+y(34)-y(33))-y(28))-params(85)*params(35)*params(74)*y(31)-y(38)*params(46)*params(35)*params(74);
residual(39)= lhs-rhs;
lhs =T385*(y(37)-y(30));
rhs =params(35)*params(79)*y(27);
residual(40)= lhs-rhs;
lhs =y(35)*params(89);
rhs =y(10)*params(83)*params(70)+params(77)*y(42)+params(73)*y(22)+params(68)*params(87)*(y(37)+y(32));
residual(41)= lhs-rhs;
lhs =y(35);
rhs =y(10)+y(43)+params(47)*y(26);
residual(42)= lhs-rhs;
lhs =y(39);
rhs =y(39)*params(48)+params(60)*x(4);
residual(43)= lhs-rhs;
lhs =y(42);
rhs =y(44)+y(42)*params(50);
residual(44)= lhs-rhs;
lhs =y(41);
rhs =y(41)*params(49)+x(7)*params(61);
residual(45)= lhs-rhs;
lhs =y(43);
rhs =y(43)*params(51)+params(63)*x(6);
residual(46)= lhs-rhs;
lhs =y(36);
rhs =y(36)*params(52)+params(65)*x(1);
residual(47)= lhs-rhs;
lhs =y(37);
rhs =y(37)*params(53)+params(66)*x(2);
residual(48)= lhs-rhs;
lhs =y(38);
rhs =y(38)*params(54)+params(67)*x(3);
residual(49)= lhs-rhs;
lhs =y(40);
rhs =y(40)*params(55)+params(64)*x(5);
residual(50)= lhs-rhs;
lhs =y(51);
rhs =y(47);
residual(51)= lhs-rhs;
lhs =y(52);
rhs =y(47);
residual(52)= lhs-rhs;
lhs =y(53);
rhs =y(47);
residual(53)= lhs-rhs;
lhs =y(54);
rhs =y(48);
residual(54)= lhs-rhs;
lhs =y(55);
rhs =y(48);
residual(55)= lhs-rhs;
lhs =y(56);
rhs =y(48);
residual(56)= lhs-rhs;
lhs =y(57);
rhs =y(49);
residual(57)= lhs-rhs;
lhs =y(58);
rhs =y(49);
residual(58)= lhs-rhs;
lhs =y(59);
rhs =y(49);
residual(59)= lhs-rhs;
lhs =y(60);
rhs =y(49);
residual(60)= lhs-rhs;
lhs =y(61);
rhs =y(49);
residual(61)= lhs-rhs;
lhs =y(62);
rhs =y(49);
residual(62)= lhs-rhs;
lhs =y(63);
rhs =y(48);
residual(63)= lhs-rhs;
lhs =y(64);
rhs =y(48);
residual(64)= lhs-rhs;
lhs =y(65);
rhs =y(48);
residual(65)= lhs-rhs;
lhs =y(66);
rhs =y(45);
residual(66)= lhs-rhs;
lhs =y(67);
rhs =y(45);
residual(67)= lhs-rhs;
lhs =y(68);
rhs =y(45);
residual(68)= lhs-rhs;
lhs =y(69);
rhs =y(47);
residual(69)= lhs-rhs;
lhs =y(70);
rhs =y(47);
residual(70)= lhs-rhs;
lhs =y(71);
rhs =y(47);
residual(71)= lhs-rhs;
lhs =y(72);
rhs =y(11);
residual(72)= lhs-rhs;
lhs =y(73);
rhs =y(11);
residual(73)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(73, 73);

  %
  % Jacobian matrix
  %

  g1(1,14)=(-4);
  g1(1,45)=1;
  g1(2,12)=T3;
  g1(2,46)=1;
  g1(3,11)=(-4);
  g1(3,47)=1;
  g1(4,21)=T3;
  g1(4,35)=1;
  g1(4,48)=1;
  g1(5,21)=T3;
  g1(5,49)=1;
  g1(6,44)=T3;
  g1(6,50)=1;
  g1(7,45)=1-(params(4)+params(3)+params(1)+params(2));
  g1(7,47)=(-(params(13)+params(12)+params(11)+params(10)+params(9)+params(8)+params(7)+params(6)+params(5)));
  g1(7,48)=(-(params(22)+params(21)+params(20)+params(19)+params(18)+params(17)+params(16)+params(15)+params(14)));
  g1(7,49)=(-(params(31)+params(30)+params(29)+params(28)+params(27)+params(26)+params(25)+params(24)+params(23)));
  g1(8,50)=1;
  g1(9,11)=1;
  g1(9,14)=T3;
  g1(9,39)=T3;
  g1(10,1)=(-((1-params(37))*T162));
  g1(10,7)=1;
  g1(11,8)=(-T184);
  g1(11,11)=1-(params(41)/(1+params(41)*params(35))+params(35)/(1+params(41)*params(35)));
  g1(12,8)=1;
  g1(12,20)=T3;
  g1(12,40)=T3;
  g1(13,9)=1;
  g1(13,16)=(-params(42));
  g1(13,17)=(-(1-params(42)));
  g1(14,9)=(-(params(80)/params(83)));
  g1(14,10)=1-(1-params(46));
  g1(14,38)=params(46);
  g1(15,10)=1;
  g1(15,16)=(-((-params(86))/(1-params(86))));
  g1(16,9)=T3;
  g1(16,13)=1;
  g1(16,17)=1;
  g1(17,9)=T3;
  g1(17,15)=1;
  g1(17,16)=1;
  g1(18,2)=T3;
  g1(18,3)=1;
  g1(18,4)=T3;
  g1(18,6)=1;
  g1(18,36)=1/(1-params(43));
  g1(19,5)=(-(params(47)-1));
  g1(19,19)=1;
  g1(19,20)=T3;
  g1(19,43)=T3;
  g1(20,11)=(-(params(44)*(T3+params(45))));
  g1(20,18)=(-(1-params(44)));
  g1(20,19)=1-params(44);
  g1(21,2)=1-params(44)*params(35)*(1-params(46));
  g1(21,11)=(-(params(44)*params(35)*(1-params(46))*T265*(params(45)-1)));
  g1(21,18)=(-((1-params(44)*params(35)*(1-params(46)))*T265));
  g1(21,20)=(-((1-params(44)*params(35)*(1-params(46)))*T267));
  g1(21,38)=(-(params(44)*params(35)*(1-params(46))*(-(params(46)/(1-params(46))))));
  g1(21,43)=(-((1-params(44)*params(35)*(1-params(46)))*T267));
  g1(22,3)=params(75)-params(44)*params(35)*(1-params(46))*params(75);
  g1(22,7)=params(78)*T267*params(82);
  g1(22,11)=(-(T315*(params(45)-1)));
  g1(22,18)=(-(T265*T265*params(88)*params(78)+params(78)*T267*params(82)*T297));
  g1(22,20)=(-(T267*T265*params(88)*params(78)+params(78)*T267*params(82)*T300));
  g1(22,38)=(-(params(44)*params(35)*(1-params(46))*params(75)*(-(params(46)/(1-params(46))))));
  g1(22,43)=(-(T267*T265*params(88)*params(78)+params(78)*T267*params(82)*T300));
  g1(23,6)=params(79)-params(35)*(1-params(46))*params(79);
  g1(23,11)=(-(params(78)*params(88)*T305*(1-params(45))));
  g1(23,18)=(-((-params(47))*T326));
  g1(23,20)=(-T326);
  g1(23,38)=(-(params(35)*(1-params(46))*params(79)*(-(params(46)/(1-params(46))))));
  g1(23,43)=(-T326);
  g1(24,4)=params(74)-params(74)*params(35)*(1-params(46)-params(85));
  g1(24,7)=(-T358);
  g1(24,11)=(-(T305*T352*(1-params(45))-T369*(1-params(45))));
  g1(24,15)=params(85)*params(35)*params(74);
  g1(24,18)=(-((-params(47))*T355-T358*(-T300)-T369));
  g1(24,19)=(-T369);
  g1(24,20)=(-(T355-T300*T358));
  g1(24,38)=params(46)*params(35)*params(74);
  g1(24,43)=(-(T355-T300*T358));
  g1(25,6)=(-(params(35)*params(79)));
  g1(25,11)=(-(T391*(1-params(45))));
  g1(25,13)=(-T385);
  g1(25,18)=(-T391);
  g1(25,19)=T391;
  g1(25,37)=T385;
  g1(26,1)=(-params(73));
  g1(26,10)=(-(params(83)*params(70)));
  g1(26,17)=(-(params(68)*params(87)));
  g1(26,21)=params(89);
  g1(26,37)=(-(params(68)*params(87)));
  g1(26,42)=(-params(77));
  g1(27,5)=(-params(47));
  g1(27,10)=T3;
  g1(27,21)=1;
  g1(27,43)=T3;
  g1(28,11)=(-4);
  g1(28,12)=1;
  g1(29,1)=(-(T162*(-params(37))));
  g1(29,22)=(-T162);
  g1(29,28)=1;
  g1(30,34)=T3;
  g1(30,40)=T3;
  g1(31,16)=(-params(42));
  g1(31,29)=1;
  g1(31,32)=(-(1-params(42)));
  g1(32,29)=T3;
  g1(32,30)=1;
  g1(32,32)=1;
  g1(33,16)=1;
  g1(33,29)=T3;
  g1(33,31)=1;
  g1(34,23)=T3;
  g1(34,24)=1;
  g1(34,25)=T3;
  g1(34,27)=1;
  g1(34,36)=1/(1-params(43));
  g1(35,26)=(-(params(47)-1));
  g1(35,33)=1;
  g1(35,34)=T3;
  g1(35,43)=T3;
  g1(36,23)=1;
  g1(36,33)=(-T265);
  g1(36,34)=(-T267);
  g1(36,43)=(-T267);
  g1(37,24)=params(90);
  g1(37,28)=(-T470);
  g1(37,33)=(-(T265*T265*params(88)*params(78)-T297*T470));
  g1(37,34)=(-(T267*T265*params(88)*params(78)-T300*T470));
  g1(37,43)=(-(T267*T265*params(88)*params(78)-T300*T470));
  g1(38,27)=params(79)-params(35)*(1-params(46))*params(79);
  g1(38,33)=(-((-params(47))*T326));
  g1(38,34)=(-T326);
  g1(38,38)=(-(params(35)*(1-params(46))*params(79)*(-(params(46)/(1-params(46))))));
  g1(38,43)=(-T326);
  g1(39,25)=params(74)-params(74)*params(35)*(1-params(46)-params(85));
  g1(39,28)=(-T358);
  g1(39,31)=params(85)*params(35)*params(74);
  g1(39,33)=(-((-params(47))*T355-T358*(-T300)));
  g1(39,34)=(-(T355-T300*T358));
  g1(39,38)=params(46)*params(35)*params(74);
  g1(39,43)=(-(T355-T300*T358));
  g1(40,27)=(-(params(35)*params(79)));
  g1(40,30)=(-T385);
  g1(40,37)=T385;
  g1(41,10)=(-(params(83)*params(70)));
  g1(41,22)=(-params(73));
  g1(41,32)=(-(params(68)*params(87)));
  g1(41,35)=params(89);
  g1(41,37)=(-(params(68)*params(87)));
  g1(41,42)=(-params(77));
  g1(42,10)=T3;
  g1(42,26)=(-params(47));
  g1(42,35)=1;
  g1(42,43)=T3;
  g1(43,39)=1-params(48);
  g1(44,42)=1-params(50);
  g1(44,44)=T3;
  g1(45,41)=1-params(49);
  g1(46,43)=1-params(51);
  g1(47,36)=1-params(52);
  g1(48,37)=1-params(53);
  g1(49,38)=1-params(54);
  g1(50,40)=1-params(55);
  g1(51,47)=T3;
  g1(51,51)=1;
  g1(52,47)=T3;
  g1(52,52)=1;
  g1(53,47)=T3;
  g1(53,53)=1;
  g1(54,48)=T3;
  g1(54,54)=1;
  g1(55,48)=T3;
  g1(55,55)=1;
  g1(56,48)=T3;
  g1(56,56)=1;
  g1(57,49)=T3;
  g1(57,57)=1;
  g1(58,49)=T3;
  g1(58,58)=1;
  g1(59,49)=T3;
  g1(59,59)=1;
  g1(60,49)=T3;
  g1(60,60)=1;
  g1(61,49)=T3;
  g1(61,61)=1;
  g1(62,49)=T3;
  g1(62,62)=1;
  g1(63,48)=T3;
  g1(63,63)=1;
  g1(64,48)=T3;
  g1(64,64)=1;
  g1(65,48)=T3;
  g1(65,65)=1;
  g1(66,45)=T3;
  g1(66,66)=1;
  g1(67,45)=T3;
  g1(67,67)=1;
  g1(68,45)=T3;
  g1(68,68)=1;
  g1(69,47)=T3;
  g1(69,69)=1;
  g1(70,47)=T3;
  g1(70,70)=1;
  g1(71,47)=T3;
  g1(71,71)=1;
  g1(72,11)=T3;
  g1(72,72)=1;
  g1(73,11)=T3;
  g1(73,73)=1;
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],73,5329);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],73,389017);
end
end
end
end
