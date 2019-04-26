function [beta,SecMom] = BetaFromTR(T,R,Q)

%  This program was written for Sergey Slobodyan and Raf Wouters DSGE
%  estimation under adaptive learning project.
%  It takes transmission mechanism of the model (typically, derived at some 
%  REE) and forms agents' beliefs which are consistent with the stationary
%  distribution implied by this transmission mechanism
%  Sergey.Slobodyan@cerge-ei.cz, August 18, 2011

global options_

ys_list = options_.ys_list;
yf_list = options_.yf_list;

%%%% Deriving the theoretical  betamat for constant gain learning. 
%%%% Rows are arranged in DR oder. 
%%%% Columns are ENDOGENOUS vars first, SCHOCKS second, DR within groups? 

% The version of the lyapunov_symm.m to be called depends on the dynare version
d_version=dynare_version;
if ~isempty(str2num(d_version([1 3]))) 
    if str2num(d_version([1 3]))<=44 %
        tmp = lyapunov_symm(T,R*Q*R',options_.qz_criterium,options_.lyapunov_complex_threshold);
    else
         tmp = lyapunov_symm(T,R*Q*R',0,options_.qz_criterium,options_.lyapunov_complex_threshold);
    end
else
     tmp = lyapunov_symm(T,R*Q*R',0,options_.qz_criterium,options_.lyapunov_complex_threshold);
end


tmp = 0.5 * (tmp + tmp');

XX = tmp(ys_list,ys_list);
XX = 0.5 * (XX + XX');

% Re-scaling
C = diag(1 ./ sqrt(diag(XX)) );
SecMom = XX;
XX = C * XX * C;

XY = T(yf_list,:) * tmp(:,ys_list);

beta = C * (XX \ (XY * C)');

options_.tmp = tmp;
