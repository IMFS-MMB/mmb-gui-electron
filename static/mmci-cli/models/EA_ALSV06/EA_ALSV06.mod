// Model: ALSV06

// Reference: Javier Andrés, J. David López-Salido and Javier Vallés 
// "Money in an estimated business cycle model of the Euro area"
// The Economic Journal, 2006, 116 (April), 457-477.

// Last edited: 08/10/2019 by Jonas Wendelborn and Sehrish Usman



// VARIABLES

var y         //Output
    m         //real balances (M/P)
    pi        //inflation
    r         //nominal interest rate
    mc        //marginal costs
    mu        //money growth
    a         //autoregressive demand/preference shock
    e         //autoregressive money demand/velocity shock
    z         //autoregressive supply/technology shock
    y_flex    //flex-price output
    m_flex    //flex-price real balances (M/P)



//**************************************************************************
// Modelbase Variables                                                  //*    
   interest inflation inflationq outputgap output;                      //*
//**************************************************************************


varexo epsa_  //iid innovation of demand shock
       epse_  //iid innovation of money demand shock
       epsz_  //iid innovation of supply shock

//**************************************************************************
// Modelbase Shocks                                                      //*       
       interest_;                                                        //*
//************************************************************************** 
       



// PARAMETERS
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
           beta psi1 psi2 h gamma1 gamma2 gammaf gammab
           chi lambda rhor rhoy rhopi rhomu rhoa rhoe rhoz
           phi1 phi2 sigmaa sigmae sigmaz sigmar;

// parameters of unconstrained model (see Table 1, p. 466):

beta = 0.988;
psi1 = 0.952;
psi2 = 0; //for positive values <= 0.14 the model can still be solved
h = 0.906;

phi1 = ((psi1^(-1) - 1) * h) / (1 - beta * h);
phi2 = (psi1^(-1) + (psi1^(-1) - 1) * beta * h^2 - beta * h) / (1 - beta * h);

gamma1 = 0.118;
gamma2 = 0.366;
gammaf = 0.988;
gammab = 1 - gammaf;
chi = 0.682;
lambda = 1.063;
rhor = 0.5;
rhoy = 0.072;
rhopi = 1.175;
rhomu = 0.705;
rhoa = 0.984;
rhoe = 0.963;
rhoz = 0.969;
sigmaa = 0.052;
sigmae = 0.0046;
sigmaz = 0.0045;
sigmar = 0.0019;


//**************************************************************************
// Specification of Modelbase Parameters                                 //*
                                                                         //*
// Load Modelbase Monetary Policy Parameters                             //*
thispath = cd;                                                           
cd('..');                                                                
load policy_param.mat;                                                   
for i=1:33                                                               
    deep_parameter_name = M_.param_names(i,:);                           
    eval(['M_.params(i)  = ' deep_parameter_name ' ;'])                  
end                                                                      
cd(thispath); 
//**************************************************************************

// MODEL

model(linear);

//**************************************************************************
// Definition of Modelbase Variables in Terms of Original Model Variables//*                                                                        
interest = 4*r;                                                          //*
inflation = pi + pi(-1) + pi(-2) + pi(-3);		          	             //*
inflationq  = 4*pi;                                                      //*
outputgap = y - y_flex;                                                  //*
output = y;                                                              //*
//**************************************************************************


//**************************************************************************                                                                    
// Policy Rule                                                           //*
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
//**************************************************************************

// Original Model Code:

y = (phi1/(phi1+phi2)) * y(-1) + ((beta*phi1+phi2)/(phi1+phi2)) * y(+1) - (1/(phi1+phi2)) * (r - pi(+1))
    - ((beta*phi1)/(phi1+phi2)) * y(+2) + (psi2/psi1)*(1/(1-beta*h))*(1/(phi1+phi2)) * (m - e)
    - (psi2/psi1)*(1/(1-beta*h))*((1+beta*h)/(phi1+phi2)) * (m(+1) - e(+1))
    + (psi2/psi1)*(1/(1-beta*h))*((beta*h)/(phi1+phi2)) * (m(+2) - e(+2))
    + ((1-beta*h*rhoa)/(1-beta*h))*((1-rhoa)/(phi1+phi2)) * a;                // IS-curve, eq. (5)

m = gamma1 * y - gamma2 * r + (gamma2*(STEADY_STATE(r)-1)*(h*phi2-phi1)-h*gamma1) * y(-1)
    - (gamma2*(STEADY_STATE(r)-1)*beta*phi1) * y(+1) + (psi2/psi1)*(((STEADY_STATE(r)-1)*beta*h*gamma2)/(1-beta*h)) * m(+1)
    - (((STEADY_STATE(r)-1)*beta*h*(1-rhoa))/(1-beta*h))*gamma2 * a
    + (1-((STEADY_STATE(r)-1)*gamma2*((psi2/psi1)*((beta*h*rhoe)/(1-beta*h))+1))) * e;              // money demand equation, eq. (6)

//r = rhor * r(-1) + (1-rhor)*rhoy * y + (1-rhor)*rhopi * pi + (1-rhor)*rhomu * mu + interest_;        // original interest rate rule, eq. (7)

mu = m - m(-1) + pi;                // money growth equation, eq. (8)

pi = gammaf * pi(+1) + gammab * pi(-1) + lambda * mc;           // Phillips-curve, eq. (9)

mc = (chi+phi2) * y - phi1 * y(-1) - beta*phi1 * y(+1) - (psi2/psi1)*(1/(1-beta*h)) * (m - e)
    + (psi2/psi1)*(beta*h/(1-beta*h)) * (m(+1) - e(+1)) - (beta*h*(1-rhoa)/(1-beta*h)) * a - (1+chi) * z;          // marginal costs, eq. (10)

a = rhoa * a(-1) + epsa_; //AR(1) demand shock, eq. (11)
e = rhoe * e(-1) + epse_; //AR(1) money demand shock, eq. (12)
z = rhoz * z(-1) + epsz_; //AR(1) supply shock, eq. (13)

// flex-price eq., not treated in the paper
y_flex = ( (1/(chi+phi2)) * (phi1 * y_flex(-1) + (beta*phi1) * y_flex(+1)
                + (psi2/psi1)*(1/(1-beta*h)) * (m_flex - e) 
                - (psi2/psi1)*((beta*h)/(1-beta*h)) * (m_flex(+1) - e(+1)) 
                + (((1-rhoa)*beta*h)/(1-beta*h)) * a + (chi+1) * z));                               //flex-price output

m_flex = gamma1 * y_flex - gamma2 * r + (gamma2*(STEADY_STATE(r)-1)*(h*phi2-phi1)-h*gamma1) * y_flex(-1)
    - (gamma2*(STEADY_STATE(r)-1)*beta*phi1) * y_flex(+1) + (psi2/psi1)*(((STEADY_STATE(r)-1)*beta*h*gamma2)/(1-beta*h)) * m_flex(+1)
    - (((STEADY_STATE(r)-1)*beta*h*(1-rhoa))/(1-beta*h))*gamma2 * a
    + (1-((STEADY_STATE(r)-1)*gamma2*((psi2/psi1)*((beta*h*rhoe)/(1-beta*h))+1))) * e;              //flex-price money demand


end;

steady;
check;

shocks;
var epsa_ = 10000*sigmaa^2;
var epse_ = 10000*sigmae^2;
var epsz_ = 10000*sigmaz^2;
var interest_ = 10000*sigmar^2;
end;

//stoch_simul(irf=30) y m pi r mc mu;


