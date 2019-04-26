function F = fraction_new_borr2(delta,lambda,gamma,epsilon,epsilon_borr,chi,beta,sigma,phi,alpha,mu,F_bar)

RR_bar=1/beta;

%%omega_bar = (1-chi)*prem/beta;
omega_bar = (1-chi);

sigma_bar = csolve(@(sigma_bar) frac_default(F_bar,omega_bar,sigma_bar),0.5,[],1e-8,200); 

G_bar = 1- normcdf((0.5*sigma_bar^2 -log(omega_bar))/sigma_bar,0,1);

RL_bar = RR_bar/((1-mu)*G_bar/omega_bar+1-F_bar);
beta_borr = (RL_bar*(1-F_bar+G_bar/omega_bar))^(-1);

upsilon_borr=gamma*(1-beta_borr*(1-delta))/(beta_borr*(1-gamma)*(1-epsilon_borr));

upsilon=gamma*(1-beta*(1-delta))/(beta*(1-gamma)*(1-epsilon));

% Hours worked and consumption by borrowers
L_borr_bar=(gamma/(1-epsilon_borr)*(1+(delta+G_bar+(1-F_bar-(1/RL_bar))*omega_bar)/upsilon_borr))^(1/(1+phi));

C_borr_bar=gamma/(1-epsilon_borr)*(1-1/sigma)*L_borr_bar^(-phi);

W_bar = 1-1/sigma;

%D_tilde_bar=C_tilde_bar/omega_tilde;
D_borr_bar=C_borr_bar/upsilon_borr;

%S_tilde_bar=(1-chi)*D_tilde_bar;
S_borr_bar=omega_bar*D_borr_bar/RL_bar;

% Hours worked and consumption by savers

%Z_bar=(1-lambda)/lambda*(alpha+(1-alpha)/alpha_D-(sigma-1)/sigma)*L_tilde_bar+(RR_bar-1)*S_tilde_bar*(1-lambda)/lambda;
Z_bar=(1-lambda)/lambda*((1-(sigma-1)/sigma)*L_borr_bar+(RR_bar-1)*S_borr_bar+mu*G_bar*D_borr_bar);
L_bar= csolve(@(L_bar) hours_savers(delta,upsilon,phi,L_bar,W_bar,Z_bar,gamma,epsilon,alpha),0.2,[],1e-8,200);
C_bar=W_bar*gamma/(1-epsilon)*L_bar^(-phi);
D_bar=C_bar/upsilon;

%F = (lambda*C_bar+(1-lambda)*C_tilde_bar)/(lambda*(C_bar+delta*D_bar)+(1-lambda)*(C_tilde_bar+delta*D_tilde_bar))-alpha/(alpha+(1-alpha)/alpha_D);
F = (lambda*C_bar+(1-lambda)*C_borr_bar)/(lambda*(C_bar+delta*D_bar)+(1-lambda)*(C_borr_bar+delta*D_borr_bar)) -alpha;
