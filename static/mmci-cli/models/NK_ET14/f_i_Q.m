function diff=f_i_Q(XX,params)
%Creating variables from the params structure
params_names     =   fieldnames(params);
nn=length(params_names);
for ii=1:nn
    eval([params_names{ii} '=params.' params_names{ii} ';']);
end;
ssPQ=params.ssPQ;
iQ=XX;
diff=-tau*exp(ssPQ)*exp(iQ)+ (1-(1/exp(iQ))^(tau))/(1-(1/exp(iQ)));
%diff(1)=-exp(b) + gB + (exp(Ps)*exp(sss)-exp(ssPB)*gB - exp(ssPQ)*gQ)/exp(ssPB)*(a1 + a2*log(exp(ssPB)/exp(ssPQ)));
%diff(2)=-exp(ssq)+ gQ + (exp(Ps)*exp(sss)-exp(ssPB)*gB - exp(ssPQ)*gQ)/exp(ssPQ)*(1 - a1 - a2*log(exp(ssPB)/exp(ssPQ)));


