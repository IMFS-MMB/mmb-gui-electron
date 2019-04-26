function diff=f_PB_PQ(XX,params)
%Creating variables from the params structure
params_names     =   fieldnames(params);
nn=length(params_names);
for ii=1:nn
    eval([params_names{ii} '=params.' params_names{ii} ';']);
end;
Ps=params.Ps;
b=params.b;
s=params.s;
q=params.q;
ssPB=XX(1);
ssPQ=XX(2);

diff(1)=-exp(b) + gB + (exp(Ps)*exp(s)-exp(ssPB)*gB - exp(ssPQ)*gQ)/exp(ssPB)*(a1 + a2*log(exp(ssPB)/exp(ssPQ)));
diff(2)=-exp(q)+ gQ + (exp(Ps)*exp(s)-exp(ssPB)*gB - exp(ssPQ)*gQ)/exp(ssPQ)*(1 - a1 - a2*log(exp(ssPB)/exp(ssPQ)));


