function F = frac_default(F_bar,omega_bar,sigma_bar)

mean = -0.5*sigma_bar^2;

F = F_bar -logncdf(omega_bar,mean,sigma_bar);