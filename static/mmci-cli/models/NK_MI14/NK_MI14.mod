//**************************************************************************
// A Theory of Countercyclical Government Multiplier
//
// Pascal Michaillat
//
// AEJ:Macro, 2014
//**************************************************************************

// Model:

var a c pie l n th R g gendo
    y
//add other endogenous variables to get rid of hashtags from the original code
    u h w mpl f
//add flex-price variables; a, gendo, g and w are the same
    c_flex pie_flex l_flex n_flex th_flex R_flex y_flex u_flex h_flex mpl_flex f_flex
    hireg

//**************************************************************************
//Modelbase variables                                                    //*
interest, inflation, inflationq, output, outputgap, fispol;              //*
//**************************************************************************


// Innovations
varexo epsa

//**************************************************************************
// Modelbase Shocks                                                      //*
interest_ fiscal_;                                                       //*
//**************************************************************************

// Parameters
parameters
//**************************************************************************
// Modelbase Parameters                                                  //*
                                                                         //*
        cofintintb1 cofintintb2 cofintintb3 cofintintb4                  //*
        cofintinf0 cofintinfb1 cofintinfb2 cofintinfb3 cofintinfb4       //*
        cofintinff1 cofintinff2 cofintinff3 cofintinff4                  //*
        cofintout cofintoutb1 cofintoutb2 cofintoutb3 cofintoutb4        //*
        cofintoutf1 cofintoutf2 cofintoutf3 cofintoutf4                  //*
        cofintoutp cofintoutpb1 cofintoutpb2 cofintoutpb3 cofintoutpb4   //*
        cofintoutpf1 cofintoutpf2 cofintoutpf3 cofintoutpf4              //*
        std_r_ std_r_quart coffispol                                     //*
//**************************************************************************
        phi phipi D s delta r omegah eta alpha omega gamma R_ss rhoa epsilon sigmaa  phir zeta gexo
        th_ss n_ss a_ss l_ss u_ss h_ss w_ss mpl_ss f_ss g_ss y_ss c_ss gendo_ss
        phi_flex;

alpha=0.66;
epsilon=11;
delta=0.999014076834481^13;
eta=0.7;
s=0.036*3;
gamma=0.5;
phipi=1.5;
phir=0.961467727988398^13;
phi=61;
phi_flex=0.000001;
rhoa=0.991693729807990^13;
D=delta*(1-s);
zeta=0.165479788012770;
gexo=0.156346165403230;
gendo_ss=0;

//Shocks
valg=0.005;
sigmaa=0.003022418150967;

//Steady-states
n_ss=1-0.064;
th_ss=0.425619083447042;
u_ss=1-(1-s)*n_ss;
a_ss=1;
g_ss = gexo + gendo_ss;
l_ss=n_ss-g_ss;

omegah = s*n_ss*th_ss^(eta-1)/u_ss;
omega=((epsilon-1)/epsilon)*alpha*l_ss^(alpha-1)/(1+(1-D)*0.32/(omegah*th_ss^(-eta)));
r=0.32*omega;

h_ss = s*n_ss;
w_ss = omega*a_ss^gamma;
mpl_ss = a_ss*alpha*l_ss^(alpha-1);
f_ss = omegah*th_ss^(1-eta);
R_ss=1/delta;
y_ss = a_ss*(l_ss^alpha);
c_ss = (y_ss - (r*a_ss*h_ss)/(omegah*th_ss^(-eta)))/(1+(phi/2)*pie^2);

//**************************************************************************
// Specification of Modelbase Parameters                                 //*
                                                                         //*
// Load Modelbase Monetary Policy Parameters                             //*
thispath = pwd;
cd('..');
load policy_param.mat;
for i=1:33
    deep_parameter_name = M_.param_names(i,:);
    eval(['M_.params(i)  = ' deep_parameter_name ' ;'])
end
cd(thispath);
std_r_ = 1;

// Definition of Discretionary Fiscal Policy Parameter                   //*
coffispol = 1;                                                           //*
//**************************************************************************

model;
//**************************************************************************
// Definition of Modelbase Variables in Terms of Original Model Variables //*

interest = log(R/R_ss)*4;                                                     //*
inflation = (1/4)*(inflationq+inflationq(-1)+inflationq(-2)+inflationq(-3));  //*
inflationq = pie*4;                                                      //*
output = y;
outputgap = y-y_flex;                                                    //*
fispol = hireg;                                                          //*

//**************************************************************************
//Policy Rule                                                            //*

// Monetary Policy                                                       //*
                                                                         //*
interest =   cofintintb1*interest(-1)                                    //*
           + cofintintb2*interest(-2)                                    //*
           + cofintintb3*interest(-3)                                    //*
           + cofintintb4*interest(-4)                                    //*
           + cofintinf0*inflationq                                       //*
           + cofintinfb1*inflationq(-1)                                  //*
           + cofintinfb2*inflationq(-2)                                  //*
           + cofintinfb3*inflationq(-3)                                  //*
           + cofintinfb4*inflationq(-4)                                  //*
           + cofintinff1*inflationq(+1)                                  //*
           + cofintinff2*inflationq(+2)                                  //*
           + cofintinff3*inflationq(+3)                                  //*
           + cofintinff4*inflationq(+4)                                  //*
           + cofintout*outputgap 	                                     //*
           + cofintoutb1*outputgap(-1)                                   //*
           + cofintoutb2*outputgap(-2)                                   //*
           + cofintoutb3*outputgap(-3)                                   //*
           + cofintoutb4*outputgap(-4)                                   //*
           + cofintoutf1*outputgap(+1)                                   //*
           + cofintoutf2*outputgap(+2)                                   //*
           + cofintoutf3*outputgap(+3)                                   //*
           + cofintoutf4*outputgap(+4)                                   //*
           + cofintoutp*output 	                                         //*
           + cofintoutpb1*output(-1)                                     //*
           + cofintoutpb2*output(-2)                                     //*
           + cofintoutpb3*output(-3)                                     //*
           + cofintoutpb4*output(-4)                                     //*
           + cofintoutpf1*output(+1)                                     //*
           + cofintoutpf2*output(+2)                                     //*
           + cofintoutpf3*output(+3)                                     //*
           + cofintoutpf4*output(+4)                                     //*
           + std_r_ *interest_;                                          //*

// Discretionary Government Spending                                     //*
                                                                         //*
fispol = coffispol*fiscal_;                                              //*
//**************************************************************************

//Original model equations

//Job-finding probability
f = omegah*th^(1-eta);
f_flex = omegah*th_flex^(1-eta);

//Unemployment
u = 1-(1-s)*n(-1);
u_flex = 1-(1-s)*n_flex(-1);

//Matching function
h = n-(1-s)*n(-1);
h_flex = n_flex-(1-s)*n_flex(-1);

//Exogneous wage
w = omega*a^gamma;

//Marginal product of labor
mpl = a*alpha*l^(alpha-1);
mpl_flex = a*alpha*l_flex^(alpha-1);

//Monetary policy rule
//R = R_ss*(1+pie)^(phipi*(1-phir))*(R(-1)/R_ss)^phir;
R_flex = R_ss*(1+pie_flex)^(phipi*(1-phir))*(R_flex(-1)/R_ss)^phir;

//Euler equation
1/R = delta*c/(c(+1)*(1+pie(+1)));
1/R_flex = delta*c_flex/(c_flex(+1)*(1+pie_flex(+1)));

// Resource constraint
y=c*(1+(phi/2)*pie^2)+(r/(omegah*th^(-eta)))*h*a;
y_flex=c_flex*(1+(phi_flex/2)*pie_flex^2)+(r/(omegah*th_flex^(-eta)))*h_flex*a;

//New Keynesian Phillips Curve
pie*(1+pie)=1/phi*(epsilon*((1/mpl)*(w+a*r/(omegah*th^(-eta))-D*(c/c(+1))*a(+1)*r/(omegah*th(+1)^(-eta))))+(1-epsilon))*(y/c)+ delta*pie(+1)*(1+pie(+1));
pie*(1+pie)=1/phi_flex*(epsilon*((1/mpl_flex)*(w+a*r/(omegah*th_flex^(-eta))-D*(c_flex/c_flex(+1))*a(+1)*r/(omegah*th_flex(+1)^(-eta))))+(1-epsilon))*(y_flex/c_flex)+ delta*pie_flex(+1)*(1+pie_flex(+1));

//Production function
y = a*(l^alpha);
y_flex = a*(l_flex^alpha);

//Total employment
n=l+g;
n_flex=l_flex+g;

//Law of motion of total employment
n=(1-s)*n(-1)+u*f;
n_flex=(1-s)*n_flex(-1)+u_flex*f_flex;

//Government employment endogenous component
gendo=(1-s)*gendo(-1)+hireg;

//Government employment total
g=gendo+gexo;

//Technology
log(a) = rhoa* log(a(-1))+epsa;

end;

initval;

n=n_ss;
th=th_ss;
l=l_ss;
pie=0;
c=c_ss;
y=y_ss;
a=a_ss;
R=R_ss;
gendo=gendo_ss;
epsa=0;
hireg=0;
g=gendo+gexo;
u=u_ss;
h=h_ss;
w=w_ss;
mpl=mpl_ss;
f=f_ss;

n_flex=n_ss;
th_flex=th_ss;
l_flex=l_ss;
pie_flex=0;
c_flex=c_ss;
y_flex=y_ss;
R_flex=R_ss;
u_flex = u_ss;
h_flex = h_ss;
mpl_flex = mpl_ss;
f_flex = f_ss;

end;

shocks;
var epsa = 18*sigmaa;
var fiscal_= valg;
var interest_=0.025;
end;

%steady;
%check;
%resid;


//stoch_simul(order=1, irf=40) a g th l u y R pie;
