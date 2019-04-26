function F = call_csolve2(F_bar,omega_bar)

%uses the csolve command and the function "frac_default" to solve for sigma_bar
sigma_bar = csolve(@(sigma_bar) frac_default(F_bar,omega_bar,sigma_bar),0.5,[],1e-8,200);
F = sigma_bar;
end