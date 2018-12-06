function [residual, g1, g2, g3] = US_IR15_dynamic(y, x, params, steady_state, it_)
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

residual = zeros(59, 1);
lhs =y(55);
rhs =y(24)*4;
residual(1)= lhs-rhs;
lhs =y(56);
rhs =y(25)+y(2)+y(10)+y(11);
residual(2)= lhs-rhs;
lhs =y(57);
rhs =4*y(25);
residual(3)= lhs-rhs;
lhs =y(58);
rhs =y(26);
residual(4)= lhs-rhs;
lhs =y(59);
rhs =y(26);
residual(5)= lhs-rhs;
lhs =y(55);
rhs =params(32)*x(it_, 8)+params(31)*y(94)+params(30)*y(93)+params(29)*y(92)+params(28)*y(85)+params(27)*y(14)+params(26)*y(13)+params(25)*y(12)+params(24)*y(9)+y(59)*params(23)+params(22)*y(91)+params(21)*y(90)+params(20)*y(89)+params(19)*y(84)+params(18)*y(17)+params(17)*y(16)+params(16)*y(15)+params(15)*y(8)+y(58)*params(14)+params(13)*y(88)+params(12)*y(87)+params(11)*y(86)+params(10)*y(83)+params(6)*y(7)+y(57)*params(5)+params(1)*y(6)+params(2)*y(18)+params(3)*y(19)+params(4)*y(20)+params(7)*y(21)+params(8)*y(22)+params(9)*y(23);
residual(6)= lhs-rhs;
lhs =y(54);
rhs =params(32)*x(it_, 8);
residual(7)= lhs-rhs;
lhs =y(29);
rhs =y(24)*params(79)+y(25)*params(80)+y(26)*params(81)+params(82)*y(27)+params(83)*y(28);
residual(8)= lhs-rhs;
lhs =y(30);
rhs =y(24)*params(84)+y(25)*params(85)+y(26)*params(86)+y(27)*params(87)+y(28)*params(88);
residual(9)= lhs-rhs;
lhs =y(31);
rhs =y(24)*params(89)+y(25)*params(90)+y(26)*params(91)+y(27)*params(92)+y(28)*params(93);
residual(10)= lhs-rhs;
lhs =y(32);
rhs =y(24)*params(94)+y(25)*params(95)+y(26)*params(96)+y(27)*params(97)+y(28)*params(98)+params(66)*x(it_, 5);
residual(11)= lhs-rhs;
lhs =y(33);
rhs =y(24)*params(99)+y(25)*params(100)+y(26)*params(101)+y(27)*params(102)+y(28)*params(103)+params(67)*x(it_, 6);
residual(12)= lhs-rhs;
lhs =y(34);
rhs =y(24)*params(104)+y(25)*params(105)+y(26)*params(106)+y(27)*params(107)+y(28)*params(108);
residual(13)= lhs-rhs;
lhs =y(35);
rhs =y(24)*params(109)+y(25)*params(110)+y(26)*params(111)+y(27)*params(112)+y(28)*params(113)+params(68)*x(it_, 7);
residual(14)= lhs-rhs;
lhs =y(36);
rhs =y(24)*params(114)+y(25)*params(115)+y(26)*params(116)+y(27)*params(117)+y(28)*params(118);
residual(15)= lhs-rhs;
lhs =y(25);
rhs =params(124)*y(1)+y(2)*params(125)+params(126)*y(3)+params(127)*y(4)+params(128)*y(5)+y(54)*params(174)+params(175)*x(it_, 1)+params(176)*x(it_, 2)+params(177)*x(it_, 3)+params(178)*x(it_, 4);
residual(16)= lhs-rhs;
lhs =y(26);
rhs =y(1)*params(129)+y(2)*params(130)+y(3)*params(131)+y(4)*params(132)+y(5)*params(133)+y(54)*params(179)+x(it_, 1)*params(180)+x(it_, 2)*params(181)+x(it_, 3)*params(182)+x(it_, 4)*params(183);
residual(17)= lhs-rhs;
lhs =y(27);
rhs =y(1)*params(134)+y(2)*params(135)+y(3)*params(136)+y(4)*params(137)+y(5)*params(138)+y(54)*params(184)+x(it_, 1)*params(185)+x(it_, 2)*params(186)+x(it_, 3)*params(187)+x(it_, 4)*params(188);
residual(18)= lhs-rhs;
lhs =y(28);
rhs =y(1)*params(139)+y(2)*params(140)+y(3)*params(141)+y(4)*params(142)+y(5)*params(143)+y(54)*params(189)+x(it_, 1)*params(190)+x(it_, 2)*params(191)+x(it_, 3)*params(192)+x(it_, 4)*params(193);
residual(19)= lhs-rhs;
lhs =y(37);
rhs =4*y(32)-y(29);
residual(20)= lhs-rhs;
lhs =y(38);
rhs =4*y(33)-y(29);
residual(21)= lhs-rhs;
lhs =y(39);
rhs =4*y(34)-y(29);
residual(22)= lhs-rhs;
lhs =y(40);
rhs =4*y(35)-y(29);
residual(23)= lhs-rhs;
lhs =y(41);
rhs =4*y(36)-y(29);
residual(24)= lhs-rhs;
lhs =y(42);
rhs =4*y(32);
residual(25)= lhs-rhs;
lhs =y(43);
rhs =4*(y(24)*params(144)+y(25)*params(145)+y(26)*params(146)+y(27)*params(147)+y(28)*params(148));
residual(26)= lhs-rhs;
lhs =y(44);
rhs =4*y(25);
residual(27)= lhs-rhs;
lhs =y(45);
rhs =4*y(33);
residual(28)= lhs-rhs;
lhs =y(46);
rhs =4*(y(24)*params(149)+y(25)*params(150)+y(26)*params(151)+y(27)*params(152)+y(28)*params(153));
residual(29)= lhs-rhs;
lhs =y(47);
rhs =4*y(29);
residual(30)= lhs-rhs;
lhs =y(48);
rhs =4*y(34);
residual(31)= lhs-rhs;
lhs =y(49);
rhs =4*(y(24)*params(154)+y(25)*params(155)+y(26)*params(156)+y(27)*params(157)+y(28)*params(158));
residual(32)= lhs-rhs;
lhs =y(50);
rhs =4*y(35);
residual(33)= lhs-rhs;
lhs =y(51);
rhs =4*(y(24)*params(159)+y(25)*params(160)+y(26)*params(161)+y(27)*params(162)+y(28)*params(163));
residual(34)= lhs-rhs;
lhs =y(52);
rhs =4*y(36);
residual(35)= lhs-rhs;
lhs =y(53);
rhs =4*(y(24)*params(164)+y(25)*params(165)+y(26)*params(166)+y(27)*params(167)+y(28)*params(168));
residual(36)= lhs-rhs;
lhs =y(60);
rhs =y(83);
residual(37)= lhs-rhs;
lhs =y(61);
rhs =y(86);
residual(38)= lhs-rhs;
lhs =y(62);
rhs =y(87);
residual(39)= lhs-rhs;
lhs =y(63);
rhs =y(84);
residual(40)= lhs-rhs;
lhs =y(64);
rhs =y(89);
residual(41)= lhs-rhs;
lhs =y(65);
rhs =y(90);
residual(42)= lhs-rhs;
lhs =y(66);
rhs =y(85);
residual(43)= lhs-rhs;
lhs =y(67);
rhs =y(92);
residual(44)= lhs-rhs;
lhs =y(68);
rhs =y(93);
residual(45)= lhs-rhs;
lhs =y(69);
rhs =y(2);
residual(46)= lhs-rhs;
lhs =y(70);
rhs =y(10);
residual(47)= lhs-rhs;
lhs =y(71);
rhs =y(9);
residual(48)= lhs-rhs;
lhs =y(72);
rhs =y(12);
residual(49)= lhs-rhs;
lhs =y(73);
rhs =y(13);
residual(50)= lhs-rhs;
lhs =y(74);
rhs =y(8);
residual(51)= lhs-rhs;
lhs =y(75);
rhs =y(15);
residual(52)= lhs-rhs;
lhs =y(76);
rhs =y(16);
residual(53)= lhs-rhs;
lhs =y(77);
rhs =y(6);
residual(54)= lhs-rhs;
lhs =y(78);
rhs =y(18);
residual(55)= lhs-rhs;
lhs =y(79);
rhs =y(19);
residual(56)= lhs-rhs;
lhs =y(80);
rhs =y(7);
residual(57)= lhs-rhs;
lhs =y(81);
rhs =y(21);
residual(58)= lhs-rhs;
lhs =y(82);
rhs =y(22);
residual(59)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(59, 102);

  %
  % Jacobian matrix
  %

  g1(1,24)=(-4);
  g1(1,55)=1;
  g1(2,2)=(-1);
  g1(2,25)=(-1);
  g1(2,56)=1;
  g1(2,10)=(-1);
  g1(2,11)=(-1);
  g1(3,25)=(-4);
  g1(3,57)=1;
  g1(4,26)=(-1);
  g1(4,58)=1;
  g1(5,26)=(-1);
  g1(5,59)=1;
  g1(6,6)=(-params(1));
  g1(6,55)=1;
  g1(6,7)=(-params(6));
  g1(6,57)=(-params(5));
  g1(6,83)=(-params(10));
  g1(6,8)=(-params(15));
  g1(6,58)=(-params(14));
  g1(6,84)=(-params(19));
  g1(6,9)=(-params(24));
  g1(6,59)=(-params(23));
  g1(6,85)=(-params(28));
  g1(6,102)=(-params(32));
  g1(6,86)=(-params(11));
  g1(6,87)=(-params(12));
  g1(6,88)=(-params(13));
  g1(6,89)=(-params(20));
  g1(6,90)=(-params(21));
  g1(6,91)=(-params(22));
  g1(6,92)=(-params(29));
  g1(6,93)=(-params(30));
  g1(6,94)=(-params(31));
  g1(6,12)=(-params(25));
  g1(6,13)=(-params(26));
  g1(6,14)=(-params(27));
  g1(6,15)=(-params(16));
  g1(6,16)=(-params(17));
  g1(6,17)=(-params(18));
  g1(6,18)=(-params(2));
  g1(6,19)=(-params(3));
  g1(6,20)=(-params(4));
  g1(6,21)=(-params(7));
  g1(6,22)=(-params(8));
  g1(6,23)=(-params(9));
  g1(7,54)=1;
  g1(7,102)=(-params(32));
  g1(8,24)=(-params(79));
  g1(8,25)=(-params(80));
  g1(8,26)=(-params(81));
  g1(8,27)=(-params(82));
  g1(8,28)=(-params(83));
  g1(8,29)=1;
  g1(9,24)=(-params(84));
  g1(9,25)=(-params(85));
  g1(9,26)=(-params(86));
  g1(9,27)=(-params(87));
  g1(9,28)=(-params(88));
  g1(9,30)=1;
  g1(10,24)=(-params(89));
  g1(10,25)=(-params(90));
  g1(10,26)=(-params(91));
  g1(10,27)=(-params(92));
  g1(10,28)=(-params(93));
  g1(10,31)=1;
  g1(11,24)=(-params(94));
  g1(11,25)=(-params(95));
  g1(11,26)=(-params(96));
  g1(11,27)=(-params(97));
  g1(11,28)=(-params(98));
  g1(11,32)=1;
  g1(11,99)=(-params(66));
  g1(12,24)=(-params(99));
  g1(12,25)=(-params(100));
  g1(12,26)=(-params(101));
  g1(12,27)=(-params(102));
  g1(12,28)=(-params(103));
  g1(12,33)=1;
  g1(12,100)=(-params(67));
  g1(13,24)=(-params(104));
  g1(13,25)=(-params(105));
  g1(13,26)=(-params(106));
  g1(13,27)=(-params(107));
  g1(13,28)=(-params(108));
  g1(13,34)=1;
  g1(14,24)=(-params(109));
  g1(14,25)=(-params(110));
  g1(14,26)=(-params(111));
  g1(14,27)=(-params(112));
  g1(14,28)=(-params(113));
  g1(14,35)=1;
  g1(14,101)=(-params(68));
  g1(15,24)=(-params(114));
  g1(15,25)=(-params(115));
  g1(15,26)=(-params(116));
  g1(15,27)=(-params(117));
  g1(15,28)=(-params(118));
  g1(15,36)=1;
  g1(16,1)=(-params(124));
  g1(16,2)=(-params(125));
  g1(16,25)=1;
  g1(16,3)=(-params(126));
  g1(16,4)=(-params(127));
  g1(16,5)=(-params(128));
  g1(16,54)=(-params(174));
  g1(16,95)=(-params(175));
  g1(16,96)=(-params(176));
  g1(16,97)=(-params(177));
  g1(16,98)=(-params(178));
  g1(17,1)=(-params(129));
  g1(17,2)=(-params(130));
  g1(17,3)=(-params(131));
  g1(17,26)=1;
  g1(17,4)=(-params(132));
  g1(17,5)=(-params(133));
  g1(17,54)=(-params(179));
  g1(17,95)=(-params(180));
  g1(17,96)=(-params(181));
  g1(17,97)=(-params(182));
  g1(17,98)=(-params(183));
  g1(18,1)=(-params(134));
  g1(18,2)=(-params(135));
  g1(18,3)=(-params(136));
  g1(18,4)=(-params(137));
  g1(18,27)=1;
  g1(18,5)=(-params(138));
  g1(18,54)=(-params(184));
  g1(18,95)=(-params(185));
  g1(18,96)=(-params(186));
  g1(18,97)=(-params(187));
  g1(18,98)=(-params(188));
  g1(19,1)=(-params(139));
  g1(19,2)=(-params(140));
  g1(19,3)=(-params(141));
  g1(19,4)=(-params(142));
  g1(19,5)=(-params(143));
  g1(19,28)=1;
  g1(19,54)=(-params(189));
  g1(19,95)=(-params(190));
  g1(19,96)=(-params(191));
  g1(19,97)=(-params(192));
  g1(19,98)=(-params(193));
  g1(20,29)=1;
  g1(20,32)=(-4);
  g1(20,37)=1;
  g1(21,29)=1;
  g1(21,33)=(-4);
  g1(21,38)=1;
  g1(22,29)=1;
  g1(22,34)=(-4);
  g1(22,39)=1;
  g1(23,29)=1;
  g1(23,35)=(-4);
  g1(23,40)=1;
  g1(24,29)=1;
  g1(24,36)=(-4);
  g1(24,41)=1;
  g1(25,32)=(-4);
  g1(25,42)=1;
  g1(26,24)=(-(4*params(144)));
  g1(26,25)=(-(4*params(145)));
  g1(26,26)=(-(4*params(146)));
  g1(26,27)=(-(4*params(147)));
  g1(26,28)=(-(4*params(148)));
  g1(26,43)=1;
  g1(27,25)=(-4);
  g1(27,44)=1;
  g1(28,33)=(-4);
  g1(28,45)=1;
  g1(29,24)=(-(4*params(149)));
  g1(29,25)=(-(4*params(150)));
  g1(29,26)=(-(4*params(151)));
  g1(29,27)=(-(4*params(152)));
  g1(29,28)=(-(4*params(153)));
  g1(29,46)=1;
  g1(30,29)=(-4);
  g1(30,47)=1;
  g1(31,34)=(-4);
  g1(31,48)=1;
  g1(32,24)=(-(4*params(154)));
  g1(32,25)=(-(4*params(155)));
  g1(32,26)=(-(4*params(156)));
  g1(32,27)=(-(4*params(157)));
  g1(32,28)=(-(4*params(158)));
  g1(32,49)=1;
  g1(33,35)=(-4);
  g1(33,50)=1;
  g1(34,24)=(-(4*params(159)));
  g1(34,25)=(-(4*params(160)));
  g1(34,26)=(-(4*params(161)));
  g1(34,27)=(-(4*params(162)));
  g1(34,28)=(-(4*params(163)));
  g1(34,51)=1;
  g1(35,36)=(-4);
  g1(35,52)=1;
  g1(36,24)=(-(4*params(164)));
  g1(36,25)=(-(4*params(165)));
  g1(36,26)=(-(4*params(166)));
  g1(36,27)=(-(4*params(167)));
  g1(36,28)=(-(4*params(168)));
  g1(36,53)=1;
  g1(37,83)=(-1);
  g1(37,60)=1;
  g1(38,86)=(-1);
  g1(38,61)=1;
  g1(39,87)=(-1);
  g1(39,62)=1;
  g1(40,84)=(-1);
  g1(40,63)=1;
  g1(41,89)=(-1);
  g1(41,64)=1;
  g1(42,90)=(-1);
  g1(42,65)=1;
  g1(43,85)=(-1);
  g1(43,66)=1;
  g1(44,92)=(-1);
  g1(44,67)=1;
  g1(45,93)=(-1);
  g1(45,68)=1;
  g1(46,2)=(-1);
  g1(46,69)=1;
  g1(47,10)=(-1);
  g1(47,70)=1;
  g1(48,9)=(-1);
  g1(48,71)=1;
  g1(49,12)=(-1);
  g1(49,72)=1;
  g1(50,13)=(-1);
  g1(50,73)=1;
  g1(51,8)=(-1);
  g1(51,74)=1;
  g1(52,15)=(-1);
  g1(52,75)=1;
  g1(53,16)=(-1);
  g1(53,76)=1;
  g1(54,6)=(-1);
  g1(54,77)=1;
  g1(55,18)=(-1);
  g1(55,78)=1;
  g1(56,19)=(-1);
  g1(56,79)=1;
  g1(57,7)=(-1);
  g1(57,80)=1;
  g1(58,21)=(-1);
  g1(58,81)=1;
  g1(59,22)=(-1);
  g1(59,82)=1;
end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],59,10404);
end
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],59,1061208);
end
end
