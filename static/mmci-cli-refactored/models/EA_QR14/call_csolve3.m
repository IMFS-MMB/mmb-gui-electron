function F = call_csolve3(delta,upsilon,phi,W_bar,Z_bar,gamma,epsilon,alpha);

%uses the csolve command and the function "hours_savers" to solve for L_bar
fn3 = @(L_bar) hours_savers(delta,upsilon,phi,L_bar,W_bar,Z_bar,gamma,epsilon,alpha);
L_bar= csolve(fn3,0.2,[],1e-8,200);
F = L_bar;
end