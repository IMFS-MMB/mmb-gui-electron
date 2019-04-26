function F = call_csolve1(delta,lambda,epsilon,epsilon_borr,chi,beta,sigma,phi,alpha,mu,F_bar)

%uses the csolve command and the function "frac_new_borr2" to solve for
%gamma
fn1 = @(gamma) fraction_new_borr2_timingI(delta,lambda,gamma,epsilon,epsilon_borr,chi,beta,sigma,phi,alpha,mu,F_bar);
gamma = csolve(fn1,0.2,[],1e-8,200);
F = gamma;
end