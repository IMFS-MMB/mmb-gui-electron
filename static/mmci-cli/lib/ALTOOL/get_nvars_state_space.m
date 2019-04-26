function [nstatic,npred,nboth,nfwrd,nsfwrd] = get_nvars_state_space(dr,M_) 
%This function is a part of the set_state_space skript of dynare 4.2.5. The
%function is used to recover the number of static vars,predetermined vars,
%forward vars and forward variables in the state vector
max_lead = M_.maximum_endo_lead;
max_lag = M_.maximum_endo_lag;
endo_nbr = M_.endo_nbr;
lead_lag_incidence = M_.lead_lag_incidence;
klen = max_lag + max_lead + 1;

fwrd_var = find(lead_lag_incidence(max_lag+2:end,:))';
if max_lag > 0
    pred_var = find(lead_lag_incidence(1,:))';
    both_var = intersect(pred_var,fwrd_var);
    pred_var = setdiff(pred_var,both_var);
    fwrd_var = setdiff(fwrd_var,both_var);
    stat_var = setdiff([1:endo_nbr]',union(union(pred_var,both_var),fwrd_var));  % static variables
else
    pred_var = [];
    both_var = [];
    stat_var = setdiff([1:endo_nbr]',fwrd_var);
end
nboth = length(both_var);
npred = length(pred_var);
nfwrd = length(fwrd_var);
nstatic = length(stat_var); 
npred = npred+nboth;
nsfwrd = nfwrd+nboth;
end

