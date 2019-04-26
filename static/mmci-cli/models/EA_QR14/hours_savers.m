function F = hours_savers(delta,upsilon,phi,L_bar,W_bar,Z_bar,gamma,epsilon,alpha)

F = (1+delta/upsilon)*W_bar*gamma/(1-epsilon) -Z_bar*L_bar^phi - L_bar^(1+phi);
%F = (1+delta*omegainv)*W_bar*gamma/(1-epsilon)-Z_bar*L_bar^phi - L_bar^(1+phi);