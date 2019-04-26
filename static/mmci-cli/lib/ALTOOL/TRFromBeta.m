function [T,R] = TRFromBeta(beta)

%  This program was written for Sergey Slobodyan and Raf Wouters DSGE
%  estimation under adaptive learning project.
%  It takes agents' beliefs and uses them to generate a new transmission 
%  mechanism of the model. 
%  Both constant gain and Kalman filter learning are supported.
%  Sergey.Slobodyan@cerge-ei.cz, August 18, 2011

global estim_params_ options_ oo_

reorder     = options_.reorder;
reorder_f   = options_.reorder_f;
vars        = options_.vars;
jacobia     = oo_.dr.jacobia;
nsfwrd      = oo_.dr.nsfwrd;
dir_order   = oo_.dr.order_var;

% Kalman filter learning piece. This subroutine is used only BEFORE the
% estimation begins, when all weights are initialized at 1/NUM_MODELS. 
% Therefore, aggregate beliefs are a simple average of individual models' beliefs.  

% if options_.kalman_algo > 200
%    beta(1,:) = [];
% end

fw = size(jacobia,2) - size(oo_.exo_simul,2);
t_vars = oo_.dr.npred+1:fw - nsfwrd;

% Re-constructing the matrix which gives us E_t[y_{t+1}]. Columns are
% still in ENDOGENOUS, SHOCKS order
betama_ = beta';
% Transforming columns back into order_var order, rows into declaration
% order
betama_ = betama_(reorder_f,reorder);
% betama_ = betama_(:,reorder);
% Generating predictions as a function of current vars, and padding it
% to the square matrix.
EXP = zeros(size(jacobia,1));
EXP(:,vars) = jacobia(:,fw - nsfwrd+1:fw) * betama_;
% Taking the lagged part of jacobia_ into full matrix. Order of
% variables is declaration throughout. In order_var, they are declaration in two
% groups separately, that's why need sorting here.
LG = zeros(size(jacobia,1));
LG(:,sort(dir_order(oo_.dr.nstatic+1:oo_.dr.nstatic+oo_.dr.npred))) = ...
  jacobia(:,1:oo_.dr.npred);
% Transition equations for purely backward-looking model with learning
T_ = - (jacobia(:,t_vars) + EXP) \ LG;
R_ = - (jacobia(:,t_vars) + EXP) \ jacobia(:,fw+1:end);
% Transformation of T: both rows and columns should be put in
% order_var. R: rows should be put in order_var.
T = T_(dir_order,dir_order);
R = R_(dir_order,:);
