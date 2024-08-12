//**************************************************************************
// A New Comparative Approach to Macroeconomic Modeling and Policy Analysis
//
// Volker Wieland, Tobias Cwik, Gernot J. Mueller, Sebastian Schmidt and 
// Maik Wolters
//
// Working Paper, 2009
//**************************************************************************

// Model: DEREA_GEAR16
// References:
// Gadatsch, N., K. Hauzenberger, and N. Stähler (2016): “Fiscal policy during the crisis: A look on Germany and the Euro area with GEAR,” Economic Modelling, 52, 997–1016.
// Last edited: 2023/12/15 by K. Bankowski

var              
    i_a_t $i^a$ i_b_t $i^b$ i_c_t $i^c$                                                     //Interest Rate
    i_Ga_t $i^{G,a}$ i_Gb_t $i^{G,b}$                                                       //Government bond rate
    i_ac_t $i^{a,c}$ i_ba_t $i^{b,a}$ i_bc_t $i^{b,c}$                                      //Interest Rate Foreign Bonds
    i_policy_t $i^{EA}$                                                                     //Policy Rate EMU
  
    y_a_t $Y^{a}$  y_b_t $Y^{b}$ y_c_t $Y^{c}$                                              //Output
    c_a_t $C^{a}$ c_b_t $C^{b}$                                                             //Total Consumption
    c_o_a_t $C^{o,a}$ c_o_b_t $C^{o,b}$                                                     //Consumption Optimizers 
    c_r_a_t $C^{r,a}$ c_r_b_t $C^{r,b}$                                                     //Consumption Rule-of-Thumbers (RoT)
    in_a_t $I^{a}$ in_b_t $I^{b}$                                                           //Total Investment
    in_o_a_t $I^{o,a}$ in_o_b_t $I^{o,b}$                                                   //Investment Optimizers
    lambda_o_a_t $\lambda^{o,a}$ lambda_o_b_t $\lambda^{o,b}$                               //Margin_a_tsl Utility Consumption Optimizers
    lambda_r_a_t $\lambda^{r,a}$ lambda_r_b_t $\lambda^{r,b}$                               //Margin_a_tsl Utility Consumption RoT
    n_a_t $N^{a}$ n_b_t $N^{b}$                                                             //Total Employment
    nP_a_t $N^{P,a}$ nP_b_t $N^{P,b}$                                                       //Private Employment
    nG_a_t $N^{G,a}$ nG_b_t $N^{G,b}$                                                       //Public Employment
    wr_a_t $w^{a}$ wr_b_t $w^{b}$                                                           //Real Wage
    wrG_a_t $w^{G,a}$ wrG_b_t $w^{G,b}$                                                     //Public wages
    mg_a_t $mg^{a}$ mg_b_t $mg^{b}$                                                         //Public wage markup (time-varying)
    k_a_t $K^{a}$ k_b_t $K^{b}$                                                             //Total Capital
    k_o_a_t $K^{o,a}$ k_o_b_t $K^{o,b}$                                                     //Capital Optimizers
    mcr_a_t $mc^{a}$ mcr_b_t $mc^{b}$                                                       //Marginal Cost
    rk_a_t $r^{k,a}$ rk_b_t $r^{k,b}$                                                       //Rental Rate of Capital
    q_a_t $Q^{a}$ q_b_t $Q^{b}$                                                             //Price of Capital
    Rk_a_t ${R^{a}_k}$ Rk_b_t ${R^{b}_k}$                                                   //Effective Rate of Return of Capital
    l_a_t $L^{a}$ l_b_t $L^{b}$                                                             //Total Labor Force
    l_o_a_t $L^{o,a}$ l_o_b_t $L^{o,b}$                                                     //Labor Force Optimizers
    l_r_a_t $L^{r,a}$ l_r_b_t $L^{r,b}$                                                     //Labor Force RoTs
    ur_a_t $UR^{a}$ ur_b_t $UR^{b}$                                                         //Total Unemployment Rate
    cG_a_t $C^{G,a}$ cG_b_t $C^{G,b}$                                                       //Public consumtpion
    tauw_a_t $\tau^a_w$ tauw_b_t $\tau^b_w$                                                 //Income taxes (includes social security contribution of employees)
    tausc_a_t $\tau^a_{sc}$ tausc_b_t $\tau^b_{sc}$                                         // Social security contribution (of employers)
    tauk_a_t $\tau^a_k$ tauk_b_t $\tau^b_k$                                                 //Capital tax (depreciation deductable)
    tauc_a_t $\tau^a_c$ tauc_b_t $\tau^b_c$                                                 //Consumption tax (paid by consumers)
    TR_r_a_t $TR^{r,a}$ TR_r_b_t $TR^{r,b}$                                                 //Transfers (RoTs)
    TR_o_a_t $TR^{o,a}$ TR_o_b_t $TR^{o,b}$                                                 //Transfers (Optimizers)
    TR_a_t $TR^{a}$ TR_b_t $TR^{b}$                                                         //Total Transfers
    T_a_t $T^{a}$ T_b_t $T^{b}$                                                             //Lump Sum Transfers (Optimizers only)   
    UB_a_t $UB^{a}$ UB_b_t $UB^{b}$                                                         // Unemployment benefit shock
    BG_a_t $B^{G,a}$ BG_b_t $B^{G,b}$                                                       //Real government debt
    kG_a_t $K^{G,a}$ kG_b_t $K^{G,b}$                                                       //Public capital stock
    inG_a_t $I^{G,a}$ inG_b_t $I^{G,b}$                                                     //Public cap investment
    yG_a_t $Y^{G,a}$ yG_b_t $Y^{G,b}$                                                       //"Public good" 
   
    omega_o_a_t $\omega^{o,a}_w$ omega_o_b_t $\omega^{o,b}_w$                               //Union Bargaining Lagrange Multiplicator Optimizers
    omega_r_a_t $\omega^{r,a}_w$ omega_r_b_t $\omega^{r,b}_w$                               //Union Bargaining Lagrange Multiplicator RoTs
    pi_w_a_t $\pi^{a}_w$ pi_w_b_t $\pi^{b}_w$                                               //Wage Inflation
    
    kappaw_a_t $\kappa^w_a$ kappaw_b_t $\kappa^w_b$                                         // Scaling parameter labor supply (not constant)

    pr_aa_t $R^{a,a}$ pr_ba_t $R^{b,a}$ pr_ca_t $R^{c,a}$                                   //relative prices
    pr_bb_t $R^{b,b}$ pr_ab_t $R^{a,b}$ pr_cb_t $R^{c,b}$                                   //relative prices
    pr_ac_t $R^{a,c}$ pr_bc_t $R^{b,c}$                                                     //relative prices

    pi_a_t $\pi^{a}$ pi_b_t $\pi^{b}$ pi_c_t $\pi^{c}$                                      //CPI inflation
    pi_aa_t $\pi^{a,a}$ pi_bb_t $\pi^{b,b}$                                                 //product-specific inflation 
    pi_ab_t $\pi^{a,b}$ pi_bc_t $\pi^{b,c}$                                                 //product-specific inflation 
    pi_ac_t $\pi^{a,c}$ pi_ba_t $\pi^{b,a}$                                                 //product-specific inflation 

    c_aa_t $C^{a,a}$ c_ba_t $C^{b,a}$                                                       //Total consumption of products from Country A in i
    c_bb_t $C^{b,b}$ c_ab_t $C^{a,b}$                                                       //Total consumption of products from Country B in i
    c_ac_t $C^{a,c}$ c_bc_t $C^{b,c}$                                                       //Total consumption of products from Country C in i
    in_aa_t $I^{a,a}$ in_ba_t $I^{b,a}$                                                     //Total investment of products from Country A in i
    in_bb_t $I^{b,b}$ in_ab_t $I^{a,b}$                                                     //Total investment of products from Country B in i
    in_ac_t $I^{a,c}$ in_bc_t $I^{b,c}$                                                     //Total investment of products from Country C in i
  
    Del_S_bc_t $\Delta S^{b,c}$ Del_S_ac_t $\Delta S^{a,c}$                                 //Change nomin_a_tsl Exchange Rate
    rer_ba_t $\epsilon^{b,a}$ rer_ca_t $\epsilon^{c,a}$ rer_bc_t $\epsilon^{b,c}$ rer_ac_t $\epsilon^{a,c}$        //real Exchange Rate
    B_c_t $B^c$ B_ac_t $B^{a,c}$ B_bc_t $B^{b,c}$ B_a_t $B^a$ B_ba_t $B^{b,a}$                                     //Total Real Bond Holdings
    nfa_a_t $nfa^a$ nfa_b_t $nfa^b$ nfa_c_t $nfa^c$                                                                //Net Foreign Asset Position
    ca_a_t $ca^a$ ca_b_t $ca^b$ ca_c_t $ca^c$                                                                      //Current Account

    a_a_t $\ln A^{a}$ a_b_t $\ln A^{b}$ z_g_t $\ln Z^{g}$                                   //Technology shock
    theta_a_t $\theta_a$ theta_b_t $\theta_b$                                               //Price markup shock
    thetaw_a_t $\theta^w_a$ thetaw_b_t $\theta^w_b$                                         //Price markup shock
    e_b_a_t $\varepsilon^{\beta_a}$ e_b_b_t $\varepsilon^{\beta_b}$                         //Preference shock
    e_n_a_t $\varepsilon^{N^a}$ e_n_b_t $\varepsilon^{N^b}$                                 //Labor supply shock
    e_in_a_t $\varepsilon^{I^a}$ e_in_b_t $\varepsilon^{I^b}$                               //Investment shock
    e_rp_a_t $\varepsilon^{RP,EA}$ e_rp_b_t $\varepsilon^{RP,RoW}$                          //Risk premium shock
    e_tau_a_t  $\varepsilon^{\tau^a_v }$ e_tau_b_t $\varepsilon^{\tau^b_v}$                 //Value-Added Tax shock
    e_RoW_a_t $\varepsilon^{RoW^a}$ e_RoW_b_t $\varepsilon^{RoW^b}$                         //Country-specific demand shocks from RoW
    e_RoE_a_t $\varepsilon^{RoE^a}$ e_RoE_b_t $\varepsilon^{RoE^b}$                         //Country-specific demand shocks from RoE

    pi_c_var_t $\pi^{VAR,c}$ i_c_var_t $i^{VAR,a}$ y_c_var_t $Y^{VAR,c}$ y_c_aux_t $Y^{aux,c}$                      //Variables of VAR for country c

    dgdp_a_t dgdp_b_t 

    // Observable variables for IRF plotting (log-deviation from SS)
    
   GDP_a_t $GDP^{a}$ GDP_b_t $GDP^{b}$                                                      //(Total) GDP including wage bill for public employment (as in national accounts)   
   ex_a_t ${EX}^a$ ex_b_t ${EX}^b$                                                          //Exports
   im_a_t ${IM}^a$ im_b_t ${IM}^b$                                                          //Imports
   y_a_obs $\hat{y}^a$ y_b_obs $\hat{y}^b$ y_c_obs $\hat{y}^c$
   c_a_obs $\hat{c}^a$ c_b_obs $\hat{c}^b$
   in_a_obs $\hat{I}^a$ in_b_obs $\hat{I}^b$
   n_a_obs $\hat{n}^a$ n_b_obs $\hat{n}^b$
   wr_a_obs $\hat{w}^a$ wr_b_obs $\hat{w}^b$
   pi_a_obs $\hat{\pi}^a$ pi_b_obs $\hat{\pi}^b$ pi_c_obs $\hat{\pi}^c$
   ca_a_obs $\hat{ca}^a$ ca_b_obs $\hat{ca}^b$ ca_c_obs $\hat{ca}^c$ 
   i_EMU_obs $\hat{i}^{EU}$ i_c_obs $\hat{i}^c$
   l_a_obs $\hat{l}^a$ l_b_obs $\hat{l}^b$
   ur_a_obs $\hat{ur}^a$ ur_b_obs $\hat{ur}^b$
   ur_a_dif ur_b_dif
   BG_a_obs $\hat{B}^{G,a}$ BG_b_obs $\hat{B}^{G,b}$
   def_a_obs $\hat{deficit}^{G,a}$ def_b_obs $\hat{deficit}^{G,b}$

   rer_ba_obs
  nuAGG_ecG
//**************************************************************************
// Modelbase Variables                                                   //*
        interest inflation inflationq outputgap output fispol            //*
        consumption investment employment wage;                          //*
//**************************************************************************

//***************************************************************************************
// Definition of exogenous variables (shocks)
//***************************************************************************************

varexo  nua_a $\nu^{A^a}$ nub_a $\nu^{A^b}$                                                   //Technology shock
        nua_etheta $\nu^{\theta_a}$ nub_etheta $\nu^{\theta_b}$                               //Price markup shock
        nua_ethetaw $\nu^{\theta_a^w}$ nub_ethetaw $\nu^{\theta_b^w}$                         //Wage markup shock
        nua_eb $\nu^{\beta_a}$ nub_eb $\nu^{\beta_b}$                                         //Preference shock
        nua_en $\nu^{N^a}$ nub_en $\nu^{N^b}$                                                 //Labor supply shock
        nua_ein $\nu^{I^a}$ nub_ein $\nu^{I^b}$                                               //Investment shock
        nua_erp $\nu^{RP,EA}$ nub_erp $\nu^{RP,RoW}$                                          //Risk premium shock               
        nua_etau  $\nu^{\tau^a_v}$ nub_etau  $\nu^{\tau^b_v}$                                 //Value-Added Tax shock
        nua_etauw $\nu^{\tau^a_w}$ nub_etauw $\nu^{\tau^b_w}$                                 //Labor Tax shock
        nua_etausc $\nu^{\tau^a_{sc}}$ nub_etausc $\nu^{\tau^b_{sc}}$                         //Social contribution shock
        nua_etauc $\nu^{\tau^a_c}$ nub_etauc $\nu^{\tau^b_c}$                                 //Consumption Tax shock
        nua_einG $\nu^{I^{G,a}}$ nub_einG $\nu^{I^{G,b}}$                                     //Public Investment shock
        nua_enG $\nu^{N^{G,a}}$ nub_enG $\nu^{N^{G,b}}$                                       //Public Employment shock
        nua_eTR $\nu^{TR^{a}}$ nub_eTR $\nu^{TR^{b}}$                                         //Transfer shock (excluding unemployment benefits)
        nua_eT $\nu^{T^{a}}$ nub_eT $\nu^{T^{b}}$                                             //Lump-sum tax shock
        nua_emg $\nu^{mg^{a}}$ nub_emg $\nu^{mg^{b}}$                                         //Public wage shock
        nua_RoW $\nu^{RoW^a}$ nub_RoW $\nu^{RoW^b}$                                           //Country-specific demand shocks from RoW
        nua_RoE $\nu^{RoE^a}$ nub_RoE $\nu^{RoE^b}$                                           //Country-specific demand shocks from RoE
        eps_y_c $\epsilon^{VAR,y^c}$  eps_i_c $\epsilon^{VAR,i^c}$   eps_pi_c $\epsilon^{VAR,\pi^c}$       //Shocks foreign VAR 
        eps_z_g $\epsilon^{z,g}$
//**************************************************************************
// Modelbase Shocks                                                      //*
       interest_ fiscal_;                                                //*
//**************************************************************************        

//***************************************************************************************
// Defin_a_tstion of deep model parameters
//***************************************************************************************

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
            mu_a $\mu^a$ mu_b $\mu^b$                                                   // share of RoT-households
            mu_bar_a $\overline{\mu}^a$ mu_bar_b $\overline{\mu}^b$                     // Transfers distribution parameter
            betta_a $\beta_a$ betta_b $\beta_b$                                         // discount factor
            delta_a $\delta_a$ delta_b $\delta_b$                                       // depreciation rate
            sigma_a $\sigma_a$ sigma_b $\sigma_b$                                       // consumption elasticity
            hab_a $h_a$ hab_b $h_b$                                                     // habit formation
            alpha_G_a $\alpha_G^a$ alpha_G_b $\alpha_G^b$                               // Measures how valuable gov spending is for consumer
            psi_a $\varphi_a$ psi_b $\varphi_b$                                         // inverse Frisch elasticity (only if rrs=0, otherwise more complicated...)
            psi_l_a $\psi^l_a$ psi_l_b $\psi^l_b$                                       // scaling parameter to create slugish adjustment of labor force (in kappa_w_a)
            kappaw_a_ts $\kappa^w_a$ kappaw_b_ts $\kappa^w_b$                           // Scaling parameter labor supply (in the ss)
            rho_a $\alpha_a$ rho_b $\alpha_b$                                           // capital share
            upsilon_a $\upsilon_a$ upsilon_b $\upsilon_b$                               // investment adjustment cost
            theta_a $\theta_a$ theta_b $\theta_b$                                       // Price elasticity
            thetaw_a $\theta^w_a$ thetaw_b $\theta^w_b$                                 // Wage elasticity 
            xip_a $\xi_a$ xip_b $\xi_b$                                                 // price indexation
            xiw_a $\xi^w_a$ xiw_b $\xi^w_b$                                             // wage indexation
            rho_a_i $\rho^a_i$                                                          // Taylor Rule - Interest smoothing 
            phi_a_pi $\phi^{EA}_{\pi}$                                                  // Taylor Rule - Inflation gap target
            phi_a_y $\phi^{EA}_{y}$                                                     // Taylor Rule - Output gap target
            phi_a_dy $\phi^{EA}_{dy}$                                                   // Taylor Rule - Output growth reaction
            phi_a_dpi $\phi^{EA}_{d\pi}$                                                // Taylor Rule - Inflation growth reaction
            phi $\phi$                                                                  // risk premium parameter
            gamma_a $\gamma_a$ gamma_b $\gamma_b$                                       // Trend growth of reals variables
            eta_a $\eta^a$ eta_b $\eta^b$ eta_c $\eta^c$                                // determines elasticity of substitution between home and foreign traded goods
            n_aa $n^{a}_{a}$ n_ab $n^{a}_{b}$ n_ac $n^{a}_{c}$                          // share of goods from i used in country A
            n_bb $n^{b}_{b}$ n_ba $n^{b}_{a}$ n_bc $n^{b}_{c}$                          // share of goods from i used in country B
            n_cc $n^{c}_{c}$ n_ca $n^{c}_{a}$ n_cb $n^{c}_{b}$                          // share of goods from i used in country C
            pop_a $\mathcal{P}^{a}$ pop_b $\mathcal{P}^{b}$ pop_c $\mathcal{P}^{c}$     // population Size
            rho_eg_a  $\rho_{G^a}$ rho_eg_b $\rho_{G^b}$                                // AR coefficient Gov. Spending
            rho_eTR_a  $\rho_{TR^a}$ rho_eTR_b $\rho_{TR^b}$                            // AR coefficient Transfers
            rho_eT_a  $\rho_{T^{a}}$ rho_eT_b $\rho_{T^{b}}$                            // AR coefficient Lump-sum taxes
            rho_emg_a  $\rho_{mg^a}$ rho_emg_b $\rho_{mg^b}$                            // AR coefficient public wage markup
            rho_a_a   $\rho_{A^a}$ rho_a_b  $\rho_{A^b}$                                // AR coefficient Technology
            rho_etheta_a $\rho_{\theta_a}$ rho_etheta_b $\rho^{\theta_b}$               // AR coefficient price markup shock
            rho_ethetaw_a $\rho_{\theta_a^w}$ rho_ethetaw_b $\rho^{\theta_b^w}$         // AR coefficient wage markup shock
            rho_eb_a  $\rho_{\beta_a}$ rho_eb_b $\rho_{\beta_b}$                        // AR coefficient Preference
            rho_en_a  $\rho_{N^a}$ rho_en_b  $\rho_{N^b}$                               // AR coefficient Labor Supply
            rho_ein_a $\rho_{I^a}$ rho_ein_b $\rho_{I^b}$                               // AR coefficient Investment
            rho_erp_a $\rho_{RP^a}$ rho_erp_b $\rho_{RP^b}$                             // AR coefficient Risk Premium
            rho_eRoW_a $\rho_{RoW^a}$ rho_eRoW_b $\rho_{RoW^b}$                         // AR coefficient country-specific demand shock (RoW)
            rho_eRoE_a $\rho_{RoE^a}$ rho_eRoE_b $\rho_{RoE^b}$                         // AR coefficient country-specific demand shock (RoW)
            rho_etau_a  $\rho_{\tau^a_v}$ rho_etau_b $\rho_{\tau^b_v}$                  // AR coefficient value-added tax
            rho_etauw_a $\rho_{\tau^a_w}$ rho_etauw_b $\rho^{\tau^b_w}$                 // AR coefficient labor tax
            rho_etausc_a $\rho_{\tau^a_{sc}}$ rho_etausc_b $\rho^{\tau^b_{sc}}$         // AR coefficient labor tax
            rho_etauk_a $\rho^{\tau^a_k}$ rho_etauk_b $\rho^{\tau^b_k}$                 // AR coefficient capital tax
            rho_etauc_a $\rho^{\tau^a_c}$ rho_etauc_b $\rho^{\tau^b_c}$                 // AR coefficient consumption tax
            rho_einG_a $\rho_{I^{G,a}}$ rho_einG_b $\rho_{I^{G,b}}$                     // AR coefficient Public Investment
            rho_enG_a  $\rho_{N^{G,a}}$ rho_enG_b  $\rho_{N^{G,b}}$                     // AR coefficient Public Employment
            rho_UB_a  $\rho_{UB^{a}}$ rho_UB_b  $\rho_{UB^{b}}$                         // AR coefficient Unemployment Benefits
            FC_a $\Omega^a$ FC_b $\Omega^b$                                             // Fixed Costs
            UB_a $UB^{a}$ UB_b $UB^{b}$                                                 // Unemployment benefits in the steady state
            rrs_a $rrs^{a}$ rrs_b $rrs^{b}$                                             // Replacement ratio
            upsilon_p_a $\upsilon_a^p$ upsilon_p_b $\upsilon_b^p$                       // price adjustment cost
            upsilon_w_a $\upsilon_a^w$ upsilon_w_b $\upsilon_b^w$                       // wage adjustment cost
            upsilon_n_a $\upsilon_a^n$ upsilon_n_b $\upsilon_b^n$                       // employment adjustment cost
            A_a $A^{a}$ A_b $A^{b}$                                                     // Total factor productivity shifter (to ensure GDP_a_ts=1)
            z_a $\zeta^{a}$ z_b $\zeta^{b}$                                             // Public total factor productivity shifter (to ensure yG_i_ts=1)
            mg_a $mg^{a}$ mg_b $mg^{b}$                                                 // markup of public over private wages 
            eta_kG_a $\eta^{K^G,a}$ eta_kG_b $\eta^{K^G,b}$                             // "Importance" of public capital for private production
            eta_nG_a $\eta^{N^G,a}$ eta_nG_b $\eta^{N^G,b}$                             // "Importance" of public employment for private production
            xi_b_etau_a $\xi^{b, \tau^v, a}$ xi_b_etau_b $\xi^{b, \tau^v, b}$           // Feedback of debt on value added tax
            xi_b_etauw_a $\xi^{b, \tau^w, a}$ xi_b_etauw_b $\xi^{b, \tau^w, b}$         // Feedback of debt on labor tax
            xi_y_etauw_a $\xi^{y, \tau^w, a}$ xi_y_etauw_b $\xi^{y, \tau^w, b}$         // Feedback of output on labor tax
            xi_b_etausc_a $\xi^{b, \tau^{sc}, a}$ xi_b_etausc_b $\xi^{b, \tau^{sc}, b}$ // Feedback of debt on social contribution rate
            xi_y_etausc_a $\xi^{y, \tau^{sc}, a}$ xi_y_etausc_b $\xi^{y, \tau^{sc}, b}$ // Feedback of debt on social contribution rate
            xi_b_etauk_a $\xi^{b, \tau^k, a}$ xi_b_etauk_b $\xi^{b, \tau^k, b}$         // Feedback of debt on capital tax
            xi_y_etauk_a $\xi^{y, \tau^k, a}$ xi_y_etauk_b $\xi^{y, \tau^k, b}$         // Feedback of debt on capital tax
            xi_b_etauc_a $\xi^{b, \tau^c, a}$ xi_b_etauc_b $\xi^{b, \tau^c, b}$         // Feedback of debt on consumption tax
            xi_y_etauc_a $\xi^{y, \tau^c, a}$ xi_y_etauc_b $\xi^{y, \tau^c, b}$         // Feedback of debt on consumption tax
            xi_b_eg_a $\xi^{b, g, a}$ xi_b_eg_b $\xi^{b, g, b}$                         // Feedback of debt on government spending
            xi_y_eg_a $\xi^{y, g, a}$ xi_y_eg_b $\xi^{y, g, b}$                         // Feedback of output on government spending
            xi_b_eTR_a $\xi^{b, TR, a}$ xi_b_eTR_b $\xi^{b, TR, b}$                     // Feedback of debt on lump-sum taxes
            xi_y_eTR_a $\xi^{y, TR, a}$ xi_y_eTR_b $\xi^{y, TR, b}$                     // Feedback of output on lump-sum taxes
            xi_b_eT_a $\xi^{b, T ,a}$ xi_b_eT_b $\xi^{b, T ,b}$                         // Feedback of debt on lump-sum taxes
            xi_y_eT_a $\xi^{y, T ,a}$ xi_y_eT_b $\xi^{y, T ,b}$                         // Feedback of output on lump-sum taxes
            xi_b_emg_a $\xi^{b, mg, a}$ xi_b_emg_b $\xi^{b, mg, b}$                     // Feedback of debt on public wage markup
            xi_b_ein_a $\xi^{b, I^G, a}$ xi_b_ein_b $\xi^{b, I^G, b}$                   // Feedback of debt on government investment
            xi_y_ein_a $\xi^{y, I^G, a}$ xi_y_ein_b $\xi^{y, I^G, b}$                   // Feedback of output on government investment
            xi_b_enG_a $\xi^{b, N^G, a}$ xi_b_enG_b $\xi^{b, N^G, b}$                   // Feedback of debt on government employment
            xi_y_enG_a $\xi^{y, N^G, a}$ xi_y_enG_b $\xi^{y, N^G, b}$                   // Feedback of output on government emplyoment
            xi_y_emg_a $\xi^{y, mg, a}$ xi_y_emg_b $\xi^{y, mg, b}$                     // Feedback of of output on public wage markup
            nu_etauw_a $\xi^{y, \tau^w, a}$ nu_etauw_b $\xi^{y, \tau^w, b}$             // Feedback of output on labor tax
            nu_eg_a $\xi^{b, g, a}$ nu_eg_b $\xi^{b, g, b}$                             // Feedback of debt on government spending
            nu_eT_r_a $\xi^{y, Tr, a}$ nu_eT_r_b $\xi^{y, Tr, b}$                       // Feedback of output on lump-sum taxes (RoTs)
            nu_ein_a $\xi^{b, I^G, a}$ nu_ein_b $\xi^{b, I^G, b}$                       // Feedback of debt on government investment
            psi_cG_a psi_inG_a psi_TR_a psi_T_a psi_tauw_a                              // Pre-announcement parameter
            psi_tausc_a psi_tauc_a psi_tauk_a psi_nG_a psi_mg_a
            psi_cG_b psi_inG_b psi_TR_b psi_T_b psi_tauw_b                              // Pre-announcement parameter
            psi_tausc_b psi_tauc_b psi_tauk_b psi_nG_b psi_mg_b
            a11 $a_{11}$ a12 $a_{12}$ a13 $a_{13}$ c11 $c_{11}$                         // Coefficients of foreign VAR
            a21 $a_{21}$ a22 $a_{22}$ a23 $a_{23}$ a24 $a_{24}$ c21 $c_{21}$ c22 $c_{22}$ c24 $c_{24}$ 
            a31 $a_{31}$ a32 $a_{32}$ a33 $a_{33}$ a34 $a_{34}$ c31 $c_{31}$ c32 $a_{32}$ c33 $c_{33}$ c34 $c_{34}$
            a44 $a_{44}$ c44 $c_{44}$
            tau_a  $\tau^a_v$ tau_b  $\tau^b_v$  
            tauw_a $\tau^a_w$ tauw_b $\tau^b_w$
            tausc_a $\tau^a_{sc}$ tausc_b $\tau^b_{sc}$
            tauk_a $\tau^a_k$ tauk_b $\tau^b_k$
            tauc_a $\tau^a_c$ tauc_b $\tau^b_c$
            gc_a $g^{c,a}$ gc_b $g^{c,b}$ gc_c $g^{c,c}$
            gin_a $g^{in,a}$ gin_b $g^{in,b}$ gin_c $g^{in,c}$
            gTR_a $g^{TR,a}$ gTR_b $g^{TR,b}$
            gn_a $g^{n,a}$ gn_b $g^{n,b}$
            c_c $(c/y)^{c}$ in_c $(i/y)^{c}$
           

//***************************************************************************************
// Definition of steady state model parameters
//***************************************************************************************
  
    i_a_ts $i^a$ i_b_ts $i^b$ i_c_ts $i^c$                                              //Interest Rate
    i_Ga_ts $i^{G,a}$ i_Gb_ts $i^{G,b}$                                                 //Government bond rate
    i_policy_ts $i^{EA}$                                                                //Policy Rate EMU
    y_a_ts $Y^{a}$  y_b_ts $Y^{b}$ y_c_ts $Y^{c}$                                       //Output
    c_a_ts $C^{a}$ c_b_ts $C^{b}$                                                       //Total Consumption
    c_o_a_ts $C^{o,a}$ c_o_b_ts $C^{o,b}$                                               //Consumption Optimizers 
    c_r_a_ts $C^{r,a}$ c_r_b_ts $C^{r,b}$                                               //Consumption Rule-of-Thumbers (RoT)
    c_tild_a_ts $\tilde{c}^{a}$ c_tild_b_ts $\tilde{c}^{b}$                   
    in_a_ts $I^{a}$ in_b_ts $I^{b}$                                                     //Total Investment
    in_o_a_ts $I^{o,a}$ in_o_b_ts $I^{o,b}$                                             //Investment Optimizers
    lambda_o_a_ts $\lambda^{o,a}$ lambda_o_b_ts $\lambda^{o,b}$                         //Margin_a_tssl Utility Consumption Optimizers
    n_a_ts $N^{a}$ n_b_ts $N^{b}$                                                       //Total Employment
    nP_a_ts $N^{P,a}$ nP_b_ts $N^{P,b}$                                                 //Private Employment
    nG_a_ts $N^{G,a}$ nG_b_ts $N^{G,b}$                                                 //Public Employment
    wr_a_ts $w^{a}$ wr_b_ts $w^{b}$                                                     //Real Wage
    wrG_a_ts $w^{G,a}$ wrG_b_ts $w^{G,b}$                                               //Public wages
    k_a_ts $K^{a}$ k_b_ts $K^{b}$                                                       //Total Capital
    k_o_a_ts $K^{o,a}$ k_o_b_ts $K^{o,b}$                                               //Capital Optimizers
    mcr_a_ts $mc^{a}$ mcr_b_ts $mc^{b}$                                                 //Margin_a_tssl Cost
    rk_a_ts $r^{k,a}$ rk_b_ts $r^{k,b}$                                                 //Rental Rate of Capital
    q_a_ts $Q^{a}$ q_b_ts $Q^{b}$                                                       //Price of Capital
    ex_a_ts ${EX}^a$ ex_b_ts ${EX}^b$                                                   //Exports
    im_a_ts ${IM}^a$ im_b_ts ${IM}^b$                                                   //Imports
    Rk_a_ts ${R^{a}_k}$ Rk_b_ts ${R^{b}_k}$                                             //Effective Rate of Return of Capital
    l_a_ts $L^{a}$ l_b_ts $L^{b}$                                                       //Total Labor Force
    l_o_a_ts $L^{o,a}$ l_o_b_ts $L^{o,b}$                                               //Labor Force Optimizers
    l_r_a_ts $L^{r,a}$ l_r_b_ts $L^{r,b}$                                               //Labor Force RoTs
    ur_a_ts $UR^{a}$ ur_b_ts $UR^{b}$                                                   //Total Unemployment Rate
    cG_a_ts $C^{G,a}$ cG_b_ts $C^{G,b}$ cG_c_ts $C^{G,a}$                               //Public consumtpion
    TR_r_a_ts $TR^{r,a}$ TR_r_b_ts $TR^{r,b}$                                           //Transfers (RoTs)
    TR_o_a_ts $TR^{o,a}$ TR_o_b_ts $TR^{o,b}$                                           //Transfers (Optimizers)
    TR_a_ts $TR^{a}$ TR_b_ts $TR^{b}$                                                   //Total Transfers
    T_a_ts $T^{a}$ T_b_ts $T^{b}$                                                       //Lump-Sum-Taxes (Optimizers only)
    BG_a_ts $B^{G,a}$ BG_b_ts $B^{G,b}$                                                 //Real government debt
    kG_a_ts $K^{G,a}$ kG_b_ts $K^{G,b}$                                                 //Public capital stock
    inG_a_ts $I^{G,a}$ inG_b_ts $I^{G,b}$ //inG_c_ts $I^{G,a}$                          //Public cap investment
    yG_a_ts $Y^{G,a}$ yG_b_ts $Y^{G,b}$                                                 //"Public good" 
    GDP_a_ts $GDP^{a}$ GDP_b_ts $GDP^{b}$                                               //(Total) GDP including wage bill for public employment (as in national accounts)   
    omega_o_a_ts $\omega^{o,a}_w$ omega_o_b_ts $\omega^{o,b}_w$                         //Union Bargaining Lagrange Multiplicator Optimizers
    omega_r_a_ts $\omega^{r,a}_w$ omega_r_b_ts $\omega^{r,b}_w$                         //Union Bargaining Lagrange Multiplicator RoTs
    pr_ts                                                                               //relative prices
    pi_ts $\pi$                                                                         //CPI and PPI inflation
    B_c_ts $B^c$ B_ac_ts $B^{a,c}$ B_bc_ts $B^{b,c}$ B_a_ts $B^a$ B_ba_ts $B^{b,a}$     //Total Real Bond Holdings
    nfa_a_ts $nfa^a$ nfa_b_ts $nfa^b$ nfa_c_ts $nfa^c$                                  //Net Foreign Asset Position
;

//***************************************************************************************
// Setting parameter values
//***************************************************************************************

mu_a	=	0.282477238710735000	;
mu_bar_a	=	0.476287322349070000	;
hab_a	=	0.494308239882487000	;
eta_a	=	0.978798953069214000	;
upsilon_a	=	4.950940456396190000	;
upsilon_p_a	=	69.810486611992200000	;
upsilon_w_a	=	61.801387405490500000	;
xip_a	=	0.351187547191756000	;
xiw_a	=	0.507403517488228000	;
eta_kG_a	=	0.083932208714118000	;
eta_nG_a	=	0.074302798757985500	;
rho_etauw_a	=	0.825931576173091000	;
rho_etauc_a	=	0.920601158040990000	;
rho_etausc_a	=	0.924865521659026000	;
rho_eg_a	=	0.822356083643030000	;
rho_einG_a	=	0.783423484437927000	;
rho_enG_a	=	0.951019923133490000	;
rho_eTR_a	=	0.843619277379409000	;
rho_eT_a	=	0.533263481090525000	;
rho_emg_a	=	0.896839087171709000	;
xi_b_etauw_a	=	-0.004672888129226880	;
xi_b_etausc_a	=	-0.007226040751017210	;
xi_b_eg_a	=	0.096938170950780100	;
xi_b_ein_a	=	0.219379534265127000	;
xi_b_eTR_a	=	0.165530467096634000	;
xi_b_eT_a	=	0.163396391108427000	;
xi_y_etauw_a	=	0.073188801245085200	;
xi_y_etausc_a	=	-0.005810721894570920	;
xi_y_eg_a	=	0.166475842825658000	;
xi_y_ein_a	=	0.199132812845768000	;
xi_y_eTR_a	=	0.197202888715513000	;
xi_y_eT_a	=	0.188279768710148000	;
psi_cG_a	=	0.776597272114415000	;
psi_inG_a	=	0.785480757328960000	;
psi_TR_a	=	0.725262270856316000	;
psi_T_a	=	0.802347279850517000	;
psi_tauw_a	=	0.605289321142294000	;
psi_tausc_a	=	0.681118557613049000	;
psi_tauc_a	=	0.561299099089667000	;
psi_nG_a	=	0.518745682043223000	;
psi_mg_a	=	0.748727862656477000	;
rho_a_i	=	0.840454065296516000	;
phi_a_pi	=	1.796006986201710000	;
phi_a_y	=	0.054033948356913700	;
rho_a_a	=	0.899238331477406000	;
rho_ein_a	=	0.757438246499296000	;
rho_eb_a	=	0.564543968129862000	;
rho_en_a	=	0.970835725680206000	;
rho_erp_a	=	0.771845035216218000	;
rho_erp_b	=	0.529155487135554000	;
rho_etheta_a	=	0.557694014418680000	;
rho_ethetaw_a	=	0.709153568277062000	;
rho_eRoE_a	=	0.936606103891553000	;
rho_eRoW_a	=	0.861180514202767000	;
mu_b	=	0.208628385317963000	;
mu_bar_b	=	0.356282857869388000	;
hab_b	=	0.748045037838636000	;
eta_b	=	0.893052672859960000	;
upsilon_b	=	4.929755999302440000	;
upsilon_p_b	=	67.315854957548200000	;
upsilon_w_b	=	79.885363045336300000	;
xip_b	=	0.447240087236102000	;
xiw_b	=	0.300897704295267000	;
eta_kG_b	=	0.069941117409300700	;
eta_nG_b	=	0.091619392655143900	;
rho_etauw_b	=	0.842012112212371000	;
rho_etauc_b	=	0.928804467566795000	;
rho_etausc_b	=	0.869254031381510000	;
rho_eg_b	=	0.919707454883866000	;
rho_einG_b	=	0.856730081685878000	;
rho_enG_b	=	0.982751143611852000	;
rho_eTR_b	=	0.940556719212743000	;
rho_eT_b	=	0.808108784868906000	;
rho_emg_b	=	0.881236728633140000	;
xi_b_etauw_b	=	0.021701933365160200	;
xi_b_etausc_b	=	0.006961683797481780	;
xi_b_eg_b	=	0.160924182266452000	;
xi_b_ein_b	=	0.196902075163885000	;
xi_b_eTR_b	=	0.127793318575280000	;
xi_b_eT_b	=	0.093881033640800000	;
xi_y_etauw_b	=	0.035944107701462800	;
xi_y_etausc_b	=	0.016376414288795700	;
xi_y_eg_b	=	0.184944995830773000	;
xi_y_ein_b	=	0.188800575641822000	;
xi_y_eTR_b	=	0.219552713235174000	;
xi_y_eT_b	=	0.193910514397887000	;
psi_cG_b	=	0.822519302825855000	;
psi_inG_b	=	0.764103197722301000	;
psi_TR_b	=	0.744004703867267000	;
psi_T_b	=	0.297703971950222000	;
psi_tauw_b	=	0.737950304365973000	;
psi_tausc_b	=	0.737798429223208000	;
psi_tauc_b	=	0.664352046313142000	;
psi_nG_b	=	0.655850748243596000	;
psi_mg_b	=	0.829545941189254000	;
rho_a_b	=	0.915134443546581000	;
rho_ein_b	=	0.720515979553970000	;
rho_eb_b	=	0.815139919204029000	;
rho_en_b	=	0.970682594671610000	;
rho_etheta_b	=	0.582024312094825000	;
rho_ethetaw_b	=	0.511860144017268000	;
rho_eRoE_b	=	0.929338466342018000	;
rho_eRoW_b	=	0.864026540437001000	;
eta_c	=	0.477981757337902000	;
a11	=	0.776167606195531000	;
a12	=	0.207902765062088000	;
a13	=	0.348053579664149000	;
a21	=	-0.053895843117779000	;
a22	=	0.514680362717915000	;
a23	=	0.532748186569371000	;
a24	=	-0.134100575515807000	;
c21	=	0.466675489839798000	;
c24	=	0.228228380609716000	;
a31	=	0.024470606672294800	;
a32	=	-0.002658659969743450	;
a33	=	0.925786973418931000	;
a34	=	-0.109029422496454000	;
c31	=	0.071931190596677100	;
c32	=	0.001956462802951850	;
c34	=	-0.108015662733109000	;
a44	=	0.791628592989840000	;

c11 = 1;
c22 = 1;
c33 = 1;
c44 = 1;

xi_y_emg_a = 0;
xi_y_emg_b = 0;

// set Taylor-rule growth coefficients to zero
phi_a_dpi	=	0;
phi_a_dy	=	0;

// Value-added Tax
tau_a = 0; 
tau_b = 0; 

// Labor Tax
tauw_a = 0.3039;
tauw_b = 0.2765;

// Social Security Contribution (employer)
tausc_a = 0.1667;
tausc_b = 0.2459;

// Capital Tax
tauk_a = 0.2143;
tauk_b = 0.3158;

// Consumption Tax
tauc_a = 0.1831;
tauc_b = 0.1960;

// discount factor
i_a_ts    = 0.025/4;
i_b_ts    = 0.025/4;

// Steady State Inflation (the same across countries)
pi_ts=1.00475;

// depreciation rate
delta_a   = 0.015;
delta_b   = 0.015;

// consumption elasticity
sigma_a   = 1;
sigma_b   = 1;

// Measures how valuable gov spending is for consumer (actually 1-alpha_G_a)
// for nu_G=1 (at the prior mode) and the requirement that marginal utility of consumption is
// the same for private and public consumption. it must be that  
// alpha_G_a = 1/(G_a_ts/c_o_a_ts+1).  
alpha_G_a = 1;
alpha_G_b = 1;

// inverse Frisch elasticity (correct only in a labor market without UB)
psi_a     = 10;
psi_b     = 9;

// scaling parameter to create slugish adjustment of labor force (in kappa_w_a)
psi_l_a     = 0;
psi_l_b     = 0;

// capital share
rho_a   =   0.33;
rho_b   =   0.33;

// Price elasticity
theta_a =   4;
theta_b =   4;

// employment adjustment cost
upsilon_n_a  = 0;
upsilon_n_b  = 0;

// replacement ratio
rrs_a  = 0.3511;
rrs_b  = 0.3511;

// Labor force
l_a_ts = 0.4717;
l_b_ts = 0.4013;

// Unemployment rate
ur_a_ts = 0.0818;
ur_b_ts = 0.0946;

// Share of public employment of total employment
gn_a = 0.1278;
gn_b = 0.1848;

// Public markup over private wages
mg_a = 0.03;
mg_b = 0.03;

// Public consumption as share of GDP
gc_a = 0.1112;
gc_b = 0.1006;
gc_c = 0.1059;

// Public transfers as share of GDP (including unemployment benefits)
gTR_a = 0.1900;
gTR_b = 0.1825;

// Public investment as share of GDP
gin_a = 0.0165;
gin_b = 0.0277;
gin_c = 0.0221;

// Consumption and investment share for RoW
c_c = 0.6;
in_c = 0.2;

// Normalization of public good
yG_a_ts = 1;
yG_b_ts = 1;

// Targeting of one bond position
B_ba_ts  = 0;
  
// international risk premium parameter
phi   = 0.01;

// Trend growth of real variables
gamma_a = 0.003163327;
gamma_b = 0.001341793;

// population Size (A and B)
pop_a     = 1;
pop_b     = 2.6;
pop_c     = 56;

GDP_a_ts = 1; // normalization
GDP_b_ts = 0.871*GDP_a_ts; // Based on GDP per Head in RoE

// AR coefficient unemployment benefits
rho_UB_a = 0;
rho_UB_b = 0;

 nu_etauw_a = 0;
 nu_etauw_b = 0;
 nu_eg_a = 0;
 nu_eg_b = 0;
 nu_eT_r_a = 0;
 nu_eT_r_b = 0;
 nu_ein_a = 0;
 nu_ein_b = 0;
 
// Public markup over private wages
mg_a = 0.03;
mg_b = 0.03;

xi_b_emg_a = 0;
xi_b_emg_b = 0;

psi_mg_a = 0*0.757595;
psi_mg_b = 0*0.806443;

// AR coefficient (rho) and debt feedback (xi) of value-added tax
rho_etau_a = 0;
rho_etau_b = 0;

xi_b_etau_a = 0*0.05;
xi_b_etau_b = 0*0.05;

rho_etauk_a = 0;
rho_etauk_b = 0;
xi_b_etauk_a = 0;
xi_b_etauk_b = 0;
xi_y_etauk_a = 0;
xi_y_etauk_b = 0;
xi_b_etauc_a = 0;
xi_b_etauc_b = 0;
xi_y_etauc_a = 0;
xi_y_etauc_b = 0;
xi_b_enG_a = 0;
xi_b_enG_b = 0;
xi_y_enG_a = 0;
xi_y_enG_b = 0;
psi_tauk_a = 0;
psi_tauk_b = 0;

//***************************************************************************************
// Steady state calculation
//***************************************************************************************

pr_ts    = 1;

betta_a = pi_ts/(1 + i_a_ts);
betta_b = pi_ts/(1 + i_b_ts);

i_c_ts  = i_a_ts;

i_Ga_ts = i_a_ts;
i_Gb_ts = i_b_ts;
i_policy_ts=i_a_ts;
Rk_a_ts=i_a_ts;
Rk_b_ts=i_b_ts;

q_a_ts=1;
q_b_ts=1;

rk_a_ts=(((1+ Rk_a_ts)/pi_ts -tauk_a*delta_a) -(1-delta_a))/(1-tauk_a) ;
rk_b_ts=(((1+ Rk_b_ts)/pi_ts -tauk_b*delta_b) -(1-delta_b))/(1-tauk_b) ;

mcr_a_ts   = (1-tau_a)*((theta_a-1)/theta_a);
mcr_b_ts   = (1-tau_b)*((theta_b-1)/theta_b);

in_a_ts = 0.172*GDP_a_ts;
in_b_ts = 0.193*GDP_b_ts;

k_a_ts  = in_a_ts/delta_a;
k_b_ts  = in_b_ts/delta_b;

l_o_a_ts = l_a_ts;
l_o_b_ts = l_b_ts;
l_r_a_ts = l_a_ts;
l_r_b_ts = l_b_ts;

n_a_ts    = (1-ur_a_ts)*l_a_ts;   
n_b_ts    = (1-ur_b_ts)*l_b_ts;   

nG_a_ts = n_a_ts*gn_a;
nG_b_ts = n_b_ts*gn_b;

nP_a_ts = n_a_ts - nG_a_ts;
nP_b_ts = n_b_ts - nG_b_ts;

n_k_a = nP_a_ts/k_a_ts;
n_k_b = nP_b_ts/k_b_ts;

wr_a_ts    = rk_a_ts*n_k_a^(-1)*(1-rho_a)/(rho_a*(1+tausc_a));
wr_b_ts    = rk_b_ts*n_k_b^(-1)*(1-rho_b)/(rho_b*(1+tausc_b));

wrG_a_ts = wr_a_ts*(1+mg_a);
wrG_b_ts = wr_b_ts*(1+mg_b);

y_a_ts = GDP_a_ts - (1+tausc_a)*wrG_a_ts*nG_a_ts;
y_b_ts = GDP_b_ts - (1+tausc_b)*wrG_b_ts*nG_b_ts;

A_a = (wr_a_ts*(1+tausc_a)*n_k_a^rho_a)/(mcr_a_ts*(1-rho_a));
A_b = (wr_b_ts*(1+tausc_b)*n_k_b^rho_b)/(mcr_b_ts*(1-rho_b));

k_o_a_ts    = k_a_ts/(1-mu_a); 
k_o_b_ts    = k_b_ts/(1-mu_b);

in_o_a_ts    = in_a_ts/(1-mu_a); 
in_o_b_ts    = in_b_ts/(1-mu_b);

FC_a=A_a*(k_a_ts^rho_a)*(nP_a_ts^(1-rho_a)) - y_a_ts;
FC_b=A_b*(k_b_ts^rho_b)*(nP_b_ts^(1-rho_b)) - y_b_ts;

BG_a_ts = 2.4*GDP_a_ts;
BG_b_ts = 2.4*GDP_b_ts;

cG_a_ts = GDP_a_ts*gc_a;
cG_b_ts = GDP_b_ts*gc_b;

inG_a_ts = GDP_a_ts*gin_a;
inG_b_ts = GDP_b_ts*gin_b;

kG_a_ts = inG_a_ts/delta_a;
kG_b_ts = inG_b_ts/delta_b;

z_a = yG_a_ts/(kG_a_ts^eta_kG_a*nG_a_ts^eta_nG_a);
z_b = yG_b_ts/(kG_b_ts^eta_kG_b*nG_b_ts^eta_nG_b);

UB_a = rrs_a*wr_a_ts*(1-tauw_a);
UB_b = rrs_b*wr_b_ts*(1-tauw_b);

c_a_ts    = y_a_ts - in_a_ts - cG_a_ts - inG_a_ts; 
c_b_ts    = y_b_ts - in_b_ts - cG_b_ts - inG_b_ts;

y_c_ts = (y_a_ts+y_b_ts)/2;

cG_c_ts = gc_c*y_c_ts;

in_c_ts = in_c*y_c_ts;

c_c_ts = c_c*y_c_ts;

n_ab=0.130*GDP_a_ts/(c_a_ts+in_a_ts);
n_ac=0.229*GDP_a_ts/(c_a_ts+in_a_ts);
n_ba=0.066*GDP_b_ts/(c_b_ts+in_b_ts);
n_bc=n_ac;
n_ca=(n_ab*(c_a_ts+in_a_ts)+n_ac*(c_a_ts+in_a_ts)-pop_b/pop_a*n_ba*(c_b_ts+in_b_ts))/(pop_c/pop_a*(c_c_ts+in_c_ts));
n_cb=(n_ba*(c_b_ts+in_b_ts)+n_bc*(c_b_ts+in_b_ts)-pop_a/pop_b*n_ab*(c_a_ts+in_a_ts))/(pop_c/pop_b*(c_c_ts+in_c_ts));

n_aa=1-n_ab-n_ac;
n_bb=1-n_ba-n_bc;
n_cc=1-n_ca-n_cb;

// home bias calculation
 vtheta_ab    = n_ab/pop_b*(pop_a + pop_b + pop_c);
 vtheta_ac    = n_ac/pop_c*(pop_a + pop_b + pop_c);
 vtheta_ba   = n_ba/pop_a*(pop_a + pop_b + pop_c);
 vtheta_bc  = n_bc/(pop_c)*(pop_a + pop_b + pop_c);

nfa_a_ts=0;
nfa_b_ts=0;
nfa_c_ts=0;

B_c_ts   = 0;
B_ba_ts  = 0;
B_a_ts   = 0;
B_ac_ts  = 0;
B_bc_ts  = 0;

c_r_a_ts    = c_a_ts; 
c_r_b_ts    = c_b_ts;
c_o_a_ts    = c_a_ts; 
c_o_b_ts    = c_b_ts;
c_tild_a_ts = c_o_a_ts;
c_tild_b_ts = c_o_b_ts;

lambda_o_a_ts = (c_tild_a_ts-hab_a*c_tild_a_ts)^(-sigma_a)/(1+tauc_a);
lambda_o_b_ts = (c_tild_b_ts-hab_b*c_tild_b_ts)^(-sigma_b)/(1+tauc_b);

kappaw_a_ts = lambda_o_a_ts*(wr_a_ts*(1-tauw_a)*nP_a_ts+wrG_a_ts*(1-tauw_a)*nG_a_ts+UB_a*(l_o_a_ts - n_a_ts))/(l_o_a_ts^psi_a*n_a_ts);
omega_o_a_ts = ((1-mu_a)*lambda_o_a_ts*UB_a)/(lambda_o_a_ts*UB_a-psi_a*l_o_a_ts^(psi_a-1)*n_a_ts*kappaw_a_ts);
omega_r_a_ts = ((mu_a)*lambda_o_a_ts*UB_a)/(lambda_o_a_ts*UB_a-psi_a*l_r_a_ts^(psi_a-1)*n_a_ts*kappaw_a_ts);

thetaw_a = (lambda_o_a_ts*wr_a_ts*(1-tauw_a)*(nP_a_ts - (omega_o_a_ts+omega_r_a_ts)*(nP_a_ts )))/(lambda_o_a_ts*nP_a_ts*wr_a_ts*(1-tauw_a) - kappaw_a_ts*nP_a_ts*n_a_ts^psi_a - UB_a*lambda_o_a_ts*nP_a_ts - (omega_o_a_ts+omega_r_a_ts)*(lambda_o_a_ts*wr_a_ts*(1-tauw_a)*nP_a_ts - UB_a*nP_a_ts*lambda_o_a_ts - kappaw_a_ts*nP_a_ts*l_o_a_ts^psi_a));    

kappaw_b_ts = lambda_o_b_ts*(wr_b_ts*(1-tauw_b)*nP_b_ts+wrG_b_ts*(1-tauw_b)*nG_b_ts+UB_b*(l_o_b_ts - n_b_ts))/(l_o_b_ts^psi_b*n_b_ts);
omega_o_b_ts = ((1-mu_b)*lambda_o_b_ts*UB_b)/(lambda_o_b_ts*UB_b-psi_b*l_o_b_ts^(psi_b-1)*n_b_ts*kappaw_b_ts);
omega_r_b_ts = ((mu_b)*lambda_o_b_ts*UB_b)/(lambda_o_b_ts*UB_b-psi_b*l_r_b_ts^(psi_b-1)*n_b_ts*kappaw_b_ts);

thetaw_b = (lambda_o_b_ts*wr_b_ts*(1-tauw_b)*(nP_b_ts - (omega_o_b_ts+omega_r_b_ts)*(nP_b_ts )))/(lambda_o_b_ts*nP_b_ts*wr_b_ts*(1-tauw_b) - kappaw_b_ts*nP_b_ts*n_b_ts^psi_b - UB_b*lambda_o_b_ts*nP_b_ts - (omega_o_b_ts+omega_r_b_ts)*(lambda_o_b_ts*wr_b_ts*(1-tauw_b)*nP_b_ts - UB_b*nP_b_ts*lambda_o_b_ts - kappaw_b_ts*nP_b_ts*l_o_b_ts^psi_b));    

ex_a_ts  = pop_b/pop_a*n_ba* (c_b_ts + in_b_ts) + pop_c/pop_a*n_ca*((c_c*y_c_ts) + (in_c*y_c_ts));
im_a_ts  = pr_ts*(n_ab*c_a_ts  + n_ab*in_a_ts)+ pr_ts*(n_ac*c_a_ts + n_ac*in_a_ts);

ex_b_ts  = pop_a/pop_b*n_ab*(c_a_ts + in_a_ts) + pop_c/pop_b*n_cb*((c_c*y_c_ts) + (in_c*y_c_ts));
im_b_ts  = pr_ts*(n_ba*c_b_ts + n_ba*in_b_ts) + pr_ts*(n_bc*c_b_ts + n_bc*in_b_ts);

TR_r_a_ts = ((1+tauc_a)*c_r_a_ts - (1-tauw_a)*(nP_a_ts*wr_a_ts+nG_a_ts*wrG_a_ts) - UB_a*(l_r_a_ts-n_a_ts));
TR_a_ts = gTR_a*y_a_ts - (l_a_ts-n_a_ts)*UB_a;
TR_o_a_ts = (TR_a_ts - mu_a*TR_r_a_ts)/(1-mu_a);
T_a_ts = ((cG_a_ts + inG_a_ts + (1+tausc_a)*wrG_a_ts*nG_a_ts + (l_a_ts-n_a_ts)*UB_a + TR_a_ts - (tauw_a+tausc_a)*(nP_a_ts*wr_a_ts+nG_a_ts*wrG_a_ts) - tauk_a*(rk_a_ts-delta_a)*k_a_ts - tau_a*y_a_ts - tauc_a*c_a_ts + (1+i_Ga_ts)*BG_a_ts/pi_ts - BG_a_ts)/(1-mu_a));

TR_r_b_ts = ((1+tauc_b)*c_r_b_ts - (1-tauw_b)*(nP_b_ts*wr_b_ts+nG_b_ts*wrG_b_ts) - UB_b*(l_r_b_ts-n_b_ts));
TR_b_ts = gTR_b*y_b_ts - (l_b_ts-n_b_ts)*UB_b;
TR_o_b_ts = (TR_b_ts - mu_b*TR_r_b_ts)/(1-mu_b);
T_b_ts = ((cG_b_ts + inG_b_ts + (1+tausc_b)*wrG_b_ts*nG_b_ts + (l_b_ts-n_b_ts)*UB_b + TR_b_ts - (tauw_b+tausc_b)*(nP_b_ts*wr_b_ts+nG_b_ts*wrG_b_ts) - tauk_b*(rk_b_ts-delta_b)*k_b_ts - tau_b*y_b_ts - tauc_b*c_b_ts + (1+i_Gb_ts)*BG_b_ts/pi_ts - BG_b_ts)/(1-mu_b));

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
std_r_=1;
// Definition of Discretionary Fiscal Policy Parameter                   //*
coffispol = 1/(gc_a*pop_a/(pop_b+pop_a)+gc_b*pop_b/(pop_b+pop_a));                                                        //*
//**************************************************************************

//*************************************************************************
// model equations
//*************************************************************************

model;

    //**************************************************************************
    // Definition of Modelbase Variables in Terms of Original Model Variables //*
    
    interest = 4*log((1+i_policy_t)/(1+i_policy_ts));
    inflation  = (inflationq + inflationq(-1) + inflationq(-2) + inflationq(-3))/4;
    inflationq = 4*(pop_a/(pop_b+pop_a)*log(pi_a_t/pi_ts)+(pop_b/(pop_b+pop_a)*log(pi_b_t/pi_ts)));
    outputgap = 1*(pop_a/(pop_b+pop_a)*log(GDP_a_t/GDP_a_ts)+(pop_b/(pop_b+pop_a)*log(GDP_b_t/GDP_b_ts)));
    output = 1*(pop_a/(pop_b+pop_a)*log(GDP_a_t)+(pop_b/(pop_b+pop_a)*log(GDP_b_t)));
    fispol = nuAGG_ecG;
    //**************************************************************************

    //**************************************************************************
    // Policy Rule                                                           //*
                                                                            //*
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
                                                                            //*
    // Discretionary Government Spending                                     //*
                                                                            //*
    fispol = coffispol*fiscal_;                                              //*
    //**************************************************************************
	    
    consumption = 1*(pop_a/(pop_b+pop_a)*log(c_a_t)+(pop_b/(pop_b+pop_a)*log(c_b_t)));
    investment = 1*(pop_a/(pop_b+pop_a)*log(in_a_t)+(pop_b/(pop_b+pop_a)*log(in_b_t)));
    employment = 1*(pop_a/(pop_b+pop_a)*log(n_a_t)+(pop_b/(pop_b+pop_a)*log(n_b_t)));
    wage = 1*(pop_a/(pop_b+pop_a)*log(wr_a_t)+(pop_b/(pop_b+pop_a)*log(wr_b_t)));

    //*************************************************************************
    // equations relevant for country A (monetary union member)
    //*************************************************************************
    lambda_o_a_t*pi_a_t(+1) = betta_a*exp(e_rp_a_t)*(1+i_a_t)*lambda_o_a_t(+1);
    lambda_o_b_t*pi_b_t(+1) = betta_b*(1+i_b_t)*exp(e_rp_a_t)*lambda_o_b_t(+1);

    lambda_o_a_t*pi_a_t(+1) = betta_a*(1+i_Ga_t)*lambda_o_a_t(+1);
    lambda_o_b_t*pi_b_t(+1) = betta_b*(1+i_Gb_t)*lambda_o_b_t(+1);

    lambda_o_a_t=exp(e_b_a_t)*(c_o_a_t-hab_a*c_o_a_t(-1))^(-sigma_a)/(1+tauc_a_t);
    lambda_o_b_t=exp(e_b_b_t)*(c_o_b_t-hab_b*c_o_b_t(-1))^(-sigma_b)/(1+tauc_b_t);

    lambda_r_a_t=exp(e_b_a_t)*(c_r_a_t-hab_a*c_r_a_t(-1))^(-sigma_a)/(1+tauc_a_t);
    lambda_r_b_t=exp(e_b_b_t)*(c_r_b_t-hab_b*c_r_b_t(-1))^(-sigma_b)/(1+tauc_b_t);

    //*************************************************************************
    // Introduction of labor force and unemployment rate
    //*************************************************************************

    // Labor force particpation constraint
    lambda_o_a_t*((1-tauw_a_t)*(wr_a_t*nP_a_t+wrG_a_t*nG_a_t)+UB_a_t*(l_o_a_t-n_a_t)) = kappaw_a_t*exp(e_n_a_t)*l_o_a_t^(psi_a)*n_a_t;
    lambda_o_b_t*((1-tauw_b_t)*(wr_b_t*nP_b_t+wrG_b_t*nG_b_t)+UB_b_t*(l_o_b_t-n_b_t)) = kappaw_b_t*exp(e_n_b_t)*l_o_b_t^(psi_b)*n_b_t;
    lambda_r_a_t*((1-tauw_a_t)*(wr_a_t*nP_a_t+wrG_a_t*nG_a_t)+UB_a_t*(l_r_a_t-n_a_t)) = kappaw_a_t*exp(e_n_a_t)*l_r_a_t^(psi_a)*n_a_t;
    lambda_r_b_t*((1-tauw_b_t)*(wr_b_t*nP_b_t+wrG_b_t*nG_b_t)+UB_b_t*(l_r_b_t-n_b_t)) = kappaw_b_t*exp(e_n_b_t)*l_r_b_t^(psi_b)*n_b_t;
    l_a_t = mu_a*l_r_a_t + (1-mu_a)*l_o_a_t;
    l_b_t = mu_b*l_r_b_t + (1-mu_b)*l_o_b_t;
    kappaw_a_t = kappaw_a_ts*(l_a_t/l_a_ts)^psi_l_a;
    kappaw_b_t = kappaw_b_ts*(l_b_t/l_b_ts)^psi_l_b;

    // Unemployment Rate
    ur_a_t = (l_a_t-n_a_t)/l_a_t;
    ur_b_t = (l_b_t-n_b_t)/l_b_t;

    // Total Employment
    n_a_t = nP_a_t + nG_a_t;
    n_b_t = nP_b_t + nG_b_t;

    // Rotemberg pricing on labor market
    // Wage inflation
    pi_w_a_t = wr_a_t/wr_a_t(-1)*pi_a_t;
    pi_w_b_t = wr_b_t/wr_b_t(-1)*pi_b_t;

    // Union bargaining solution
    (mu_a*lambda_r_a_t + (1-mu_a)*lambda_o_a_t)*((1-tauw_a_t)*(thetaw_a_t*nP_a_t-nP_a_t) - UB_a_t*thetaw_a_t*nP_a_t/wr_a_t + upsilon_w_a*(pi_w_a_t/(pi_w_a_t(-1)^xiw_a*pi_ts^(1-xiw_a))-1)*pi_w_a_t/(pi_w_a_t(-1)^xiw_a*pi_ts^(1-xiw_a))) - (lambda_o_a_t*omega_o_a_t+lambda_r_a_t*omega_r_a_t)*((1-tauw_a_t)*(thetaw_a_t*nP_a_t-nP_a_t) - UB_a_t*thetaw_a_t*nP_a_t/wr_a_t) + omega_r_a_t*l_r_a_t^psi_a*nP_a_t*thetaw_a_t*kappaw_a_t/wr_a_t*exp(e_n_a_t)*exp(e_b_a_t) + omega_o_a_t*l_o_a_t^psi_a*nP_a_t*thetaw_a_t*kappaw_a_t/wr_a_t*exp(e_n_a_t)*exp(e_b_a_t) = n_a_t^psi_a*thetaw_a_t*kappaw_a_t*nP_a_t/wr_a_t*exp(e_n_a_t)*exp(e_b_a_t) + betta_a*(mu_a*lambda_r_a_t(+1)+(1-mu_a)*lambda_o_a_t(+1))*upsilon_w_a*(pi_w_a_t(+1)/(pi_w_a_t^xiw_a*pi_ts^(1-xiw_a))-1)*pi_w_a_t(+1)^2*1/(pi_a_t(+1)*(pi_w_a_t(-1)^xiw_a*pi_ts^(1-xiw_a)));
    (mu_b*lambda_r_b_t + (1-mu_b)*lambda_o_b_t)*((1-tauw_b_t)*(thetaw_b_t*nP_b_t-nP_b_t) - UB_b_t*thetaw_b_t*nP_b_t/wr_b_t + upsilon_w_b*(pi_w_b_t/(pi_w_b_t(-1)^xiw_b*pi_ts^(1-xiw_b))-1)*pi_w_b_t/(pi_w_b_t(-1)^xiw_b*pi_ts^(1-xiw_b))) - (lambda_o_b_t*omega_o_b_t+lambda_r_b_t*omega_r_b_t)*((1-tauw_b_t)*(thetaw_b_t*nP_b_t-nP_b_t) - UB_b_t*thetaw_b_t*nP_b_t/wr_b_t) + omega_r_b_t*l_r_b_t^psi_b*nP_b_t*thetaw_b_t*kappaw_b_t/wr_b_t*exp(e_n_b_t)*exp(e_b_b_t) + omega_o_b_t*l_o_b_t^psi_b*nP_b_t*thetaw_b_t*kappaw_b_t/wr_b_t*exp(e_n_b_t)*exp(e_b_b_t) = n_b_t^psi_b*thetaw_b_t*kappaw_b_t*nP_b_t/wr_b_t*exp(e_n_b_t)*exp(e_b_b_t) + betta_b*(mu_b*lambda_r_b_t(+1)+(1-mu_b)*lambda_o_b_t(+1))*upsilon_w_b*(pi_w_b_t(+1)/(pi_w_b_t^xiw_b*pi_ts^(1-xiw_b))-1)*pi_w_b_t(+1)^2*1/(pi_b_t(+1)*(pi_w_b_t^xiw_b*pi_ts^(1-xiw_b)));

    mu_a*lambda_r_a_t*UB_a_t = omega_r_a_t*(lambda_r_a_t*UB_a_t-psi_a*l_r_a_t^(psi_a-1)*n_a_t*kappaw_a_t);
    mu_b*lambda_r_b_t*UB_b_t = omega_r_b_t*(lambda_r_b_t*UB_b_t-psi_b*l_r_b_t^(psi_b-1)*n_b_t*kappaw_b_t);

    (1-mu_a)*lambda_o_a_t*UB_a_t = omega_o_a_t*(lambda_o_a_t*UB_a_t-psi_a*l_o_a_t^(psi_a-1)*n_a_t*kappaw_a_t);
    (1-mu_b)*lambda_o_b_t*UB_b_t = omega_o_b_t*(lambda_o_b_t*UB_b_t-psi_b*l_o_b_t^(psi_b-1)*n_b_t*kappaw_b_t);

    //*************************************************************************
    // Government
    //*************************************************************************

    // government spending

    log(cG_a_t/cG_a_ts) = rho_eg_a*log(cG_a_t(-1)/cG_a_ts) - xi_b_eg_a*log(BG_a_t(-1)/BG_a_ts) - xi_y_eg_a*log(y_a_t(-1)/y_a_ts) + psi_cG_a*nuAGG_ecG + (1-psi_cG_a)*nuAGG_ecG(-1);
    log(cG_b_t/cG_b_ts) = rho_eg_b*log(cG_b_t(-1)/cG_b_ts) - xi_b_eg_b*log(BG_b_t(-1)/BG_b_ts) - xi_y_eg_b*log(y_b_t(-1)/y_b_ts) + psi_cG_b*nuAGG_ecG + (1-psi_cG_b)*nuAGG_ecG(-1);

    log(inG_a_t/inG_a_ts) = rho_einG_a*log(inG_a_t(-1)/inG_a_ts) - xi_b_ein_a*log(BG_a_t(-1)/BG_a_ts) - xi_y_ein_a*log(y_a_t(-1)/y_a_ts) + psi_inG_a*nua_einG + (1-psi_inG_a)*nua_einG(-1);
    log(inG_b_t/inG_b_ts) = rho_einG_b*log(inG_b_t(-1)/inG_b_ts) - xi_b_ein_b*log(BG_b_t(-1)/BG_b_ts) - xi_y_ein_b*log(y_b_t(-1)/y_b_ts)  + psi_inG_b*nub_einG + (1-psi_inG_b)*nub_einG(-1);

    log(TR_a_t/TR_a_ts) = rho_eTR_a*log(TR_a_t(-1)/TR_a_ts) - xi_b_eTR_a*log(BG_a_t(-1)/BG_a_ts) - xi_y_eTR_a*log(y_a_t(-1)/y_a_ts) + psi_TR_a*nua_eTR + (1-psi_TR_a)*nua_eTR(-1);
    log(TR_b_t/TR_b_ts) = rho_eTR_b*log(TR_b_t(-1)/TR_b_ts) - xi_b_eTR_b*log(BG_b_t(-1)/BG_b_ts) - xi_y_eTR_b*log(y_b_t(-1)/y_b_ts) + psi_TR_b*nub_eTR + (1-psi_TR_b)*nub_eTR(-1);

    (T_a_t-T_a_ts)/y_a_ts = rho_eT_a*(T_a_t(-1)-T_a_ts)/y_a_ts + xi_b_eT_a*log(BG_a_t(-1)/BG_a_ts) + xi_y_eT_a*log(y_a_t(-1)/y_a_ts) + psi_T_a*nua_eT + (1-psi_T_a)*nua_eT(-1); 
    (T_b_t-T_b_ts)/y_b_ts = rho_eT_b*(T_b_t(-1)-T_b_ts)/y_b_ts + xi_b_eT_b*log(BG_b_t(-1)/BG_b_ts) + xi_y_eT_b*log(y_b_t(-1)/y_b_ts) + psi_T_b*nub_eT + (1-psi_T_b)*nub_eT(-1); 

    tauw_a_t-tauw_a = rho_etauw_a*(tauw_a_t(-1)-tauw_a) + xi_b_etauw_a*log(BG_a_t(-1)/BG_a_ts) + xi_y_etauw_a*log(y_a_t(-1)/y_a_ts) + psi_tauw_a*nua_etauw + (1-psi_tauw_a)*nua_etauw(-1);
    tauw_b_t-tauw_b = rho_etauw_b*(tauw_b_t(-1)-tauw_b) + xi_b_etauw_b*log(BG_b_t(-1)/BG_b_ts) + xi_y_etauw_b*log(y_b_t(-1)/y_b_ts) + psi_tauw_b*nub_etauw + (1-psi_tauw_b)*nub_etauw(-1);

    tausc_a_t - tausc_a = rho_etausc_a*(tausc_a_t(-1)-tausc_a) + xi_b_etausc_a*log(BG_a_t(-1)/BG_a_ts) + xi_y_etausc_a*log(y_a_t(-1)/y_a_ts) + psi_tausc_a*nua_etausc + (1-psi_tausc_a)*nua_etausc(-1);
    tausc_b_t = tausc_b + rho_etausc_b*(tausc_b_t(-1)-tausc_b) + xi_b_etausc_b*log(BG_b_t(-1)/BG_b_ts) + xi_y_etausc_b*log(y_b_t(-1)/y_b_ts) + psi_tausc_b*nub_etausc + (1-psi_tausc_b)*nub_etausc(-1);

    tauk_b_t = tauk_b;
    tauk_a_t = tauk_a;

    tauc_a_t = tauc_a + rho_etauc_a*(tauc_a_t(-1)-tauc_a) + xi_b_etauc_a*log(BG_a_t(-1)/BG_a_ts) + xi_y_etauc_a*log(y_a_t(-1)/y_a_ts) + psi_tauc_a*nua_etauc + (1-psi_tauc_a)*nua_etauc(-1);
    tauc_b_t = tauc_b + rho_etauc_b*(tauc_b_t(-1)-tauc_b) + xi_b_etauc_b*log(BG_b_t(-1)/BG_b_ts) + xi_y_etauc_b*log(y_b_t(-1)/y_b_ts) + psi_tauc_b*nub_etauc + (1-psi_tauc_b)*nub_etauc(-1);

    nG_a_t = nG_a_ts + rho_enG_a*(nG_a_t(-1)-nG_a_ts) - xi_b_enG_a*log(BG_a_t(-1)/BG_a_ts) + xi_y_enG_a*log(y_a_t(-1)/y_a_ts) + psi_nG_a*nua_enG + (1-psi_nG_a)*nua_enG(-1);
    nG_b_t = nG_b_ts + rho_enG_b*(nG_b_t(-1)-nG_b_ts) - xi_b_enG_b*log(BG_b_t(-1)/BG_b_ts) + xi_y_enG_b*log(y_b_t(-1)/y_b_ts) + psi_nG_b*nub_enG + (1-psi_nG_b)*nub_enG(-1);

    UB_a_t = UB_a;
    UB_b_t = UB_b;

    TR_a_t = mu_a*TR_r_a_t + (1-mu_a)*TR_o_a_t;
    TR_b_t = (1-mu_b)*TR_o_b_t + mu_b*TR_r_b_t;

    mu_bar_a*(TR_o_a_t/TR_o_a_ts-1) = (1-mu_bar_a)*(TR_r_a_t/TR_r_a_ts-1);
    mu_bar_b*(TR_o_b_t/TR_o_b_ts-1) = (1-mu_bar_b)*(TR_r_b_t/TR_r_b_ts-1);

    cG_a_t*pr_aa_t + TR_a_t + UB_a_t*(mu_a*(l_r_a_t-n_a_t)+(1-mu_a)*(l_o_a_t-n_a_t)) + inG_a_t*pr_aa_t + (1+tausc_a_t)*wrG_a_t*nG_a_t +(1+i_Ga_t(-1))*BG_a_t(-1)/pi_a_t = BG_a_t + (tauw_a_t+tausc_a_t)*(wr_a_t*nP_a_t+wrG_a_t*nG_a_t) + tauk_a_t*(rk_a_t-delta_a)*k_a_t(-1) + tau_a*exp(e_tau_a_t)*y_a_t*pr_aa_t + tauc_a_t*c_a_t + (1-mu_a)*T_a_t;
    cG_b_t*pr_bb_t + TR_b_t + UB_b_t*(mu_b*(l_r_b_t-n_b_t)+(1-mu_b)*(l_o_b_t-n_b_t)) + inG_b_t*pr_bb_t + (1+tausc_b_t)*wrG_b_t*nG_b_t +(1+i_Gb_t(-1))*BG_b_t(-1)/pi_b_t = BG_b_t + (tauw_b_t+tausc_b_t)*(wr_b_t*nP_b_t+wrG_b_t*nG_b_t) + tauk_b_t*(rk_b_t-delta_b)*k_b_t(-1) + tau_b*exp(e_tau_b_t)*y_b_t*pr_bb_t + tauc_b_t*c_b_t + (1-mu_b)*T_b_t;

    kG_a_t = (1-delta_a)*kG_a_t(-1) + inG_a_t;
    kG_b_t = (1-delta_b)*kG_b_t(-1) + inG_b_t;

    yG_a_t = z_a*kG_a_t^eta_kG_a*nG_a_t^eta_nG_a;
    yG_b_t = z_b*kG_b_t^eta_kG_b*nG_b_t^eta_nG_b;

    mg_a_t = mg_a;
    mg_b_t = mg_b;

    log(wrG_a_t/wrG_a_ts) = rho_emg_a*log(wrG_a_t(-1)/wrG_a_ts) - xi_b_emg_a*log(BG_a_t(-1)/BG_a_ts) + xi_y_emg_a*log(y_a_t(-1)/y_a_ts) + psi_mg_a*nua_emg + (1-psi_mg_a)*nua_emg(-1);
    log(wrG_b_t/wrG_b_ts) = rho_emg_b*log(wrG_b_t(-1)/wrG_b_ts) - xi_b_emg_b*log(BG_b_t(-1)/BG_b_ts) + xi_y_emg_b*log(y_b_t(-1)/y_b_ts) + psi_mg_b*nub_emg + (1-psi_mg_b)*nub_emg(-1);

    y_a_t=(exp(a_a_t)*A_a*exp(z_g_t))*yG_a_t*(k_a_t(-1))^(rho_a)*(nP_a_t)^(1-rho_a)-FC_a;
    y_b_t=(exp(a_b_t)*A_b*exp(z_g_t))*yG_b_t*(k_b_t(-1))^(rho_b)*(nP_b_t)^(1-rho_b)-FC_b;

    rk_a_t = mcr_a_t*exp(a_a_t)*A_a*exp(z_g_t)*rho_a*((k_a_t(-1))/nP_a_t)^(rho_a-1)*yG_a_t;
    rk_b_t = mcr_b_t*exp(a_b_t)*A_b*exp(z_g_t)*rho_b*((k_b_t(-1))/nP_b_t)^(rho_b-1)*yG_b_t;

    wr_a_t*(1+tausc_a_t) = mcr_a_t*exp(a_a_t)*A_a*exp(z_g_t)*(1-rho_a)*((k_a_t(-1))/nP_a_t)^(rho_a)*yG_a_t - wr_a_t*(1+tausc_a_t)*upsilon_n_a*(nP_a_t-nP_a_t(-1)) + betta_a*upsilon_n_a*(lambda_r_a_t(+1)/lambda_r_a_t*wr_a_t(+1)*(1+tausc_a_t(+1))*(nP_a_t(+1)-nP_a_t));
    wr_b_t*(1+tausc_b_t) = mcr_b_t*exp(a_b_t)*A_b*exp(z_g_t)*(1-rho_b)*((k_b_t(-1))/nP_b_t)^(rho_b)*yG_b_t - wr_b_t*(1+tausc_b_t)*upsilon_n_b*(nP_b_t-nP_b_t(-1)) + betta_b*upsilon_n_b*(lambda_r_b_t(+1)/lambda_r_b_t*wr_b_t(+1)*(1+tausc_b_t(+1))*(nP_b_t(+1)-nP_b_t));

    k_o_a_t=(1-delta_a)*k_o_a_t(-1)+(in_o_a_t-in_o_a_t*((upsilon_a/2)*((in_o_a_t/in_o_a_t(-1))-1)^2))*(exp(e_in_a_t));
    k_o_b_t=(1-delta_b)*k_o_b_t(-1)+(in_o_b_t-in_o_b_t*((upsilon_b/2)*((in_o_b_t/in_o_b_t(-1))-1)^2))*(exp(e_in_b_t));

    1=betta_a*(lambda_o_a_t(+1)/lambda_o_a_t)/pi_a_t(+1)*(1+Rk_a_t(+1));
    1=betta_b*(lambda_o_b_t(+1)/lambda_o_b_t)/pi_b_t(+1)*(1+Rk_b_t(+1));

    Rk_a_t=pi_a_t*(q_a_t*(1-delta_a)+(1-tauk_a_t)*(rk_a_t)+tauk_a_t*delta_a)/q_a_t(-1)-1;
    Rk_b_t=pi_b_t*(q_b_t*(1-delta_b)+(1-tauk_b_t)*(rk_b_t)+tauk_b_t*delta_b)/q_b_t(-1)-1;

    1=q_a_t*(1-((upsilon_a/2)*((in_o_a_t/in_o_a_t(-1))-1)^2)-upsilon_a*(in_o_a_t/in_o_a_t(-1))*((in_o_a_t/in_o_a_t(-1))-1))*exp(e_in_a_t)+
    betta_a*(lambda_o_a_t(+1)/lambda_o_a_t)*q_a_t(+1)*(upsilon_a*((in_o_a_t(+1)/in_o_a_t)^2)*((in_o_a_t(+1)/in_o_a_t)-1))*(exp(e_in_a_t(+1)));
    1=q_b_t*(1-((upsilon_b/2)*((in_o_b_t/in_o_b_t(-1))-1)^2)-upsilon_b*(in_o_b_t/in_o_b_t(-1))*((in_o_b_t/in_o_b_t(-1))-1))*exp(e_in_b_t)+
    betta_b*(lambda_o_b_t(+1)/lambda_o_b_t)*q_b_t(+1)*(upsilon_b*((in_o_b_t(+1)/in_o_b_t)^2)*((in_o_b_t(+1)/in_o_b_t)-1))*(exp(e_in_b_t(+1)));

    (1-theta_a_t) + theta_a_t*mcr_a_t*pr_aa_t^(-1) + betta_a*(lambda_o_a_t(+1)/lambda_o_a_t*upsilon_p_a*(pi_aa_t(+1)/(pi_aa_t^xip_a*pi_ts^(1-xip_a))-1)*pi_aa_t(+1)^2/pi_a_t(+1)*y_a_t(+1)/y_a_t*1/(pi_aa_t^xip_a*pi_ts^(1-xip_a))) = upsilon_p_a*(pi_aa_t/(pi_aa_t(-1)^xip_a*pi_ts^(1-xip_a))-1)*pi_aa_t/(pi_aa_t(-1)^xip_a*pi_ts^(1-xip_a));
    (1-theta_b_t) + theta_b_t*mcr_b_t*pr_bb_t^(-1) + betta_b*(lambda_o_b_t(+1)/lambda_o_b_t*upsilon_p_b*(pi_bb_t(+1)/(pi_bb_t^xip_b*pi_ts^(1-xip_b))-1)*pi_bb_t(+1)^2/pi_b_t(+1)*y_b_t(+1)/y_b_t*1/(pi_bb_t^xip_b*pi_ts^(1-xip_b))) = upsilon_p_b*(pi_bb_t/(pi_bb_t(-1)^xip_b*pi_ts^(1-xip_b))-1)*pi_bb_t/(pi_bb_t(-1)^xip_b*pi_ts^(1-xip_b));

    pr_ba_t=rer_ba_t*pr_aa_t;
    pr_ab_t=pr_bb_t*(1/rer_ba_t);

    pr_ca_t=rer_ca_t*pr_aa_t;
    pr_cb_t=(rer_ca_t/rer_ba_t)*pr_bb_t;

    1=n_aa*(pr_aa_t)^(1-eta_a)+n_ab*(pr_ab_t)^(1-eta_a)+n_ac*(pr_ac_t)^(1-eta_a);
    1=n_bb*(pr_bb_t)^(1-eta_b)+n_ba*(pr_ba_t)^(1-eta_b)+n_bc*(pr_bc_t)^(1-eta_b);

    [name='pi_a_t']
    pi_a_t=(n_aa*(pi_aa_t*pr_aa_t(-1))^(1-eta_a) + n_ab*(pi_ab_t*pr_ab_t(-1))^(1-eta_a)+ n_ac*(pi_ac_t*pr_ac_t(-1))^(1-eta_a))^(1/(1-eta_a));
    [name='pi_b_t']
    pi_b_t=(n_bb*(pi_bb_t*pr_bb_t(-1))^(1-eta_b) + n_ba*(pi_ba_t*pr_ba_t(-1))^(1-eta_b)+ n_bc*(pi_bc_t*pr_bc_t(-1))^(1-eta_b))^(1/(1-eta_b));

    c_aa_t = mu_a*(n_aa*(pr_aa_t)^(-eta_a)*c_r_a_t) + (1-mu_a)*(n_aa*(pr_aa_t)^(-eta_a)*c_o_a_t);
    c_bb_t = mu_b*(n_bb*(pr_bb_t)^(-eta_b)*c_r_b_t) + (1-mu_b)*(n_bb*(pr_bb_t)^(-eta_b)*c_o_b_t);

    in_aa_t = (1-mu_a)*n_aa*(pr_aa_t)^(-eta_a)*in_o_a_t;
    in_bb_t = (1-mu_b)*(n_bb*(pr_bb_t)^(-eta_b)*in_o_b_t);

    c_ab_t = (mu_a*n_ab*(pr_ab_t)^(-eta_a)*c_r_a_t + (1-mu_a)*n_ab*(pr_ab_t)^(-eta_a)*c_o_a_t)*exp(e_RoE_a_t);
    c_ba_t = (mu_b*n_ba*(pr_ba_t)^(-eta_b)*c_r_b_t + (1-mu_b)*n_ba*(pr_ba_t)^(-eta_b)*c_o_b_t)*exp(e_RoE_b_t);

    in_ab_t = (1-mu_a)*n_ab*(pr_ab_t)^(-eta_a)*in_o_a_t*exp(e_RoE_a_t);
    in_ba_t = (1-mu_b)*n_ba*(pr_ba_t)^(-eta_b)*in_o_b_t*exp(e_RoE_b_t);

    c_ac_t = mu_a*n_ac*(pr_ac_t)^(-eta_a)*c_r_a_t + (1-mu_a)*n_ac*(pr_ac_t)^(-eta_a)*c_o_a_t;
    c_bc_t = mu_b*n_bc*(pr_bc_t)^(-eta_b)*c_r_b_t + (1-mu_b)*n_bc*(pr_bc_t)^(-eta_b)*c_o_b_t;

    in_ac_t = (1-mu_a)*n_ac*(pr_ac_t)^(-eta_a)*in_o_a_t;
    in_bc_t = (1-mu_b)*n_bc*(pr_bc_t)^(-eta_b)*in_o_b_t;

    (1+tauc_a_t)*c_r_a_t = (1-tauw_a_t)*(nP_a_t*wr_a_t+nG_a_t*wrG_a_t) + UB_a_t*(l_r_a_t-n_a_t) + TR_r_a_t;
    (1+tauc_b_t)*c_r_b_t = (1-tauw_b_t)*(nP_b_t*wr_b_t+nG_b_t*wrG_b_t) + UB_b_t*(l_r_b_t-n_b_t) + TR_r_b_t;

    c_a_t = mu_a*c_r_a_t + (1-mu_a)*c_o_a_t;
    c_b_t = mu_b*c_r_b_t + (1-mu_b)*c_o_b_t;

    k_a_t = (1-mu_a)*k_o_a_t;
    k_b_t = (1-mu_b)*k_o_b_t;

    in_a_t = (1-mu_a)*in_o_a_t;
    in_b_t = (1-mu_b)*in_o_b_t;

    y_a_t = c_aa_t+in_aa_t+pop_b/pop_a*(c_ba_t+in_ba_t)+pop_c/pop_a*exp(e_RoW_a_t)*((n_ca*(pr_ca_t)^(-eta_c)*c_c*y_c_t)+(n_ca*(pr_ca_t)^(-eta_c)*in_c*y_c_t))+cG_a_t + inG_a_t;
    y_b_t = pop_a/pop_b*(c_ab_t+in_ab_t)+(c_bb_t+in_bb_t)+pop_c/pop_b*exp(e_RoW_b_t)*((n_cb*(pr_cb_t)^(-eta_c)*c_c*y_c_t)+(n_cb*(pr_cb_t)^(-eta_c)*in_c*y_c_t))+cG_b_t + inG_b_t;

    /*
    log((1+i_policy_t)/(1+i_policy_ts)) = rho_a_i*log((1+i_policy_t(-1))/(1+i_policy_ts))   
                                        + (1-rho_a_i)*phi_a_pi*(pop_a/(pop_b+pop_a)*log(pi_a_t/pi_ts)
                                            +(pop_b/(pop_b+pop_a)*log(pi_b_t/pi_ts))) + (1-rho_a_i)*phi_a_y*(pop_a/(pop_b+pop_a)*log(GDP_a_t/GDP_a_ts)
                                            +(pop_b/(pop_b+pop_a)*log(GDP_b_t/GDP_b_ts)))
                                        + interest_/400; 
    */
    log((1+i_policy_t)/(1+i_policy_ts))  = pop_a/(pop_b+pop_a)*log((1+i_a_t)/(1+i_a_ts)) + pop_b/(pop_b+pop_a)*log((1+i_b_t)/(1+i_b_ts));

    //*************************************************************************
    // equations relevant for country C (outside monetary union)
    //*************************************************************************

    y_c_t = exp(z_g_t)*y_c_aux_t;

    y_c_var_t = log(y_c_aux_t/y_c_ts);
    pi_c_var_t = pi_c_t-pi_ts;          
    i_c_var_t = i_c_t-i_c_ts;

    y_c_var_t  = a11*y_c_var_t(-1) + a12*pi_c_var_t(-1) + a13*i_c_var_t(-1) + c11*eps_y_c;
    pi_c_var_t = a21*y_c_var_t(-1) + a22*pi_c_var_t(-1) + a23*i_c_var_t(-1) + a24*z_g_t(-1) + c21*eps_y_c + c22*eps_pi_c + c24*eps_z_g;
    i_c_var_t  = a31*y_c_var_t(-1) + a32*pi_c_var_t(-1) + a33*i_c_var_t(-1) + a34*z_g_t(-1) + c31*eps_y_c + c32*eps_pi_c + c33*eps_i_c + c34*eps_z_g;
    z_g_t = a44*z_g_t(-1) + c44*eps_z_g;

    pr_ac_t=(1/rer_ca_t)*1;
    pr_bc_t=(rer_ba_t/rer_ca_t)*1;

    //*************************************************************************
    // equations determining international relationship
    //*************************************************************************

    // B's holdings of A's bonds
    lambda_o_b_t = betta_b*exp(e_rp_a_t)*(1+i_ba_t)*lambda_o_b_t(+1)/pi_b_t(+1);

    // A's and B's holdings of C's bonds
    lambda_o_a_t = betta_a*exp(e_rp_b_t)*(1+i_ac_t)*lambda_o_a_t(+1)*Del_S_ac_t(+1)/pi_a_t(+1);     
    lambda_o_b_t = betta_b*exp(e_rp_b_t)*(1+i_bc_t)*lambda_o_b_t(+1)*Del_S_bc_t(+1)/pi_b_t(+1);

    (rer_ac_t*B_ac_t + B_a_t)  = (1 + i_ac_t(-1))*rer_ac_t*B_ac_t(-1)/pi_c_t + (1 + i_ba_t(-1))*B_a_t(-1)/pi_a_t + pr_aa_t*y_a_t - c_a_t - in_a_t - pr_aa_t*cG_a_t - pr_aa_t*inG_a_t;
    (rer_bc_t*B_bc_t + rer_ba_t*B_ba_t)  = (1 + i_bc_t(-1))*rer_bc_t*B_bc_t(-1)/pi_c_t + (1 + i_ba_t(-1))*rer_ba_t*B_ba_t(-1)/pi_a_t + pr_bb_t*y_b_t - c_b_t - in_b_t - pr_bb_t*cG_b_t - pr_bb_t*inG_b_t;
    B_c_t = - (pop_a/pop_c*B_ac_t + pop_b/pop_c*B_bc_t);

    B_a_t = - pop_b/pop_a*B_ba_t;

    nfa_a_t = (rer_ac_t*B_ac_t - pop_b/pop_a*B_ba_t);
    nfa_b_t = (rer_bc_t*B_bc_t + rer_ba_t*B_ba_t);

    nfa_c_t = B_c_t;
    ca_a_t=nfa_a_t-nfa_a_t(-1);
    ca_b_t=nfa_b_t-nfa_b_t(-1);
    ca_c_t=nfa_c_t-nfa_c_t(-1);

    (1+i_bc_t)=(1+i_c_t)*(1-phi*(exp(((rer_bc_t*B_bc_t)/(pr_bb_t*y_b_t)-(B_bc_ts)/y_b_ts))-1));         // B^(bc)

    (1+i_ac_t)=(1+i_c_t)*(1-phi*(exp(((rer_ac_t*B_ac_t)/(pr_aa_t*y_a_t)-(B_ac_ts)/y_a_ts))-1));         // B^(ac)

    (1+i_ba_t)=(1+i_a_t)*(1-phi*(exp(((rer_ba_t*B_ba_t)/(pr_bb_t*y_b_t)-(B_ba_ts)/y_b_ts))-1));         // B^(ba)

    rer_bc_t = rer_ba_t/rer_ca_t;
    rer_ac_t = 1/rer_ca_t;
    1 = (rer_ba_t/rer_ba_t(-1))*pi_b_t/pi_a_t;

    Del_S_bc_t = (rer_bc_t/rer_bc_t(-1))*pi_b_t/pi_c_t;
    Del_S_ac_t = (rer_ac_t/rer_ac_t(-1))*pi_a_t/pi_c_t;

    pi_ab_t = (1/1)*pi_bb_t;
    pi_ba_t = 1*pi_aa_t;
   [name='pi_ac_t']
    pi_ac_t = Del_S_ac_t*pi_c_t;
   [name='pi_bc_t']
    pi_bc_t = Del_S_bc_t*pi_c_t;


    //*************************************************************************
    // Shocks
    //*************************************************************************

    // technology shock
    a_a_t = rho_a_a*a_a_t(-1) + nua_a;
    a_b_t = rho_a_b*a_b_t(-1) + nub_a;

    // Price markup shock
    theta_a_t/(theta_a_t-1) = rho_etheta_a*theta_a_t(-1)/(theta_a_t(-1)-1) + (1-rho_etheta_a)*theta_a/(theta_a-1) + nua_etheta;
    theta_b_t/(theta_b_t-1) = rho_etheta_b*theta_b_t(-1)/(theta_b_t(-1)-1) + (1-rho_etheta_b)*theta_b/(theta_b-1) + nub_etheta;

    // Wage markup shock
    thetaw_a_t/(thetaw_a_t-1) = rho_ethetaw_a*thetaw_a_t(-1)/(thetaw_a_t(-1)-1) + (1-rho_ethetaw_a)*thetaw_a/(thetaw_a-1) + nua_ethetaw;
    thetaw_b_t/(thetaw_b_t-1) = rho_ethetaw_b*thetaw_b_t(-1)/(thetaw_b_t(-1)-1) + (1-rho_ethetaw_b)*thetaw_b/(thetaw_b-1) + nub_ethetaw;

    // time preference shock
    e_b_a_t=rho_eb_a*e_b_a_t(-1) + nua_eb;
    e_b_b_t=rho_eb_b*e_b_b_t(-1) + nub_eb; 

    // labour supply shock
    e_n_a_t=rho_en_a*e_n_a_t(-1) + nua_en; 
    e_n_b_t=rho_en_b*e_n_b_t(-1) + nub_en; 


    // investment shock
    e_in_a_t=rho_ein_a*e_in_a_t(-1) + nua_ein;
    e_in_b_t=rho_ein_b*e_in_b_t(-1) + nub_ein;

    // risk premium shock
    e_rp_a_t=rho_erp_a*e_rp_a_t(-1) + nua_erp;
    e_rp_b_t=rho_erp_b*e_rp_b_t(-1) + nub_erp;

    // country-specific demand shock from RoW
    e_RoW_a_t=rho_eRoW_a*e_RoW_a_t(-1) + nua_RoW;
    e_RoW_b_t=rho_eRoW_b*e_RoW_b_t(-1) + nub_RoW;

    // country-specific demand shock from RoE
    e_RoE_a_t=rho_eRoE_a*e_RoE_a_t(-1) + nua_RoE;
    e_RoE_b_t=rho_eRoE_b*e_RoE_b_t(-1) + nub_RoE;

    // tax shock
    e_tau_a_t=rho_etau_a*e_tau_a_t(-1) + xi_b_etau_a*log(BG_a_t(-1)/BG_a_ts) + nua_etau;
    e_tau_b_t=rho_etau_b*e_tau_b_t(-1) + xi_b_etau_b*log(BG_b_t(-1)/BG_b_ts) + nub_etau;

    //*************************************************************************
    // Obvservable variables
    // to generate log-deviations from Steady State in percent
    // inflation and interest rates in change in basispoint
    //*************************************************************************

    ex_a_t = y_a_t - (cG_a_t + c_aa_t + in_aa_t + inG_a_t);
    ex_b_t = y_b_t - (cG_b_t + c_bb_t + in_bb_t + inG_b_t);

    im_a_t = c_a_t + in_a_t - pr_aa_t*(c_aa_t + in_aa_t);
    im_b_t = c_b_t + in_b_t - pr_bb_t*(c_bb_t + in_bb_t);

    GDP_a_t = y_a_t + (1+tausc_a_t)*wrG_a_t*nG_a_t/pr_aa_t;
    GDP_b_t = y_b_t + (1+tausc_b_t)*wrG_b_t*nG_b_t/pr_bb_t;

    y_a_obs =log(y_a_t)-log(y_a_ts);
    y_b_obs =log(y_b_t)-log(y_b_ts);
    y_c_obs =log(y_c_t)-log(y_c_ts);

    dgdp_a_t = (y_a_ts/GDP_a_ts*(y_a_t)/y_a_ts + (1-y_a_ts/GDP_a_ts)*nG_a_t/nG_a_ts -1);
    dgdp_b_t = (y_b_ts/GDP_b_ts*(y_b_t)/y_b_ts + (1-y_b_ts/GDP_b_ts)*nG_b_t/nG_b_ts -1);

    BG_a_obs = log(BG_a_t)-log(BG_a_ts);
    BG_b_obs = log(BG_b_t)-log(BG_b_ts);

    c_a_obs =log(c_a_t/pr_aa_t)-log(c_a_ts);   
    c_b_obs =log(c_b_t/pr_bb_t)-log(c_b_ts);

    in_a_obs =log(in_a_t/pr_aa_t)-log(in_a_ts);
    in_b_obs =log(in_b_t/pr_bb_t)-log(in_b_ts);

    n_a_obs =n_a_t-n_a_ts;
    n_b_obs =n_b_t-n_b_ts;

    wr_a_obs =log(wr_a_t/pr_aa_t)-log(wr_a_ts);
    wr_b_obs =log(wr_b_t/pr_bb_t)-log(wr_b_ts);

    pi_a_obs =pi_aa_t-pi_ts;
    pi_b_obs =pi_bb_t-pi_ts;
    pi_c_obs =pi_c_t-pi_ts;

    rer_ba_obs = (rer_ba_t - 1);

    ca_a_obs =ca_a_t/pr_aa_t/y_a_t;
    ca_b_obs =ca_b_t/pr_bb_t/y_b_t;
    ca_c_obs =ca_c_t/1/y_c_t;

    i_EMU_obs =i_policy_t-i_policy_ts;
    i_c_obs =i_c_t-i_c_ts;

    l_a_obs =l_a_t-l_a_ts;   
    l_b_obs =l_b_t-l_b_ts;

    ur_a_obs =ur_a_t-ur_a_ts;
    ur_b_obs =ur_b_t-ur_b_ts;

    ur_a_dif =ur_a_t-ur_a_t(-1);
    ur_b_dif =ur_b_t-ur_b_t(-1);

    def_a_obs = -(BG_a_t-BG_a_t(-1))/(GDP_a_t*pr_aa_t); //I define it this way to be consistent with the data
    def_b_obs = -(BG_b_t-BG_b_t(-1))/(GDP_b_t*pr_bb_t); //I define it this way to be consistent with the data

end;


//*************************************************************************
// Steady sate determination
//*************************************************************************


initval;
i_a_t   = i_a_ts;
i_b_t   = i_b_ts;
i_c_t   = i_c_ts;

i_Ga_t  = i_Ga_ts;
i_Gb_t  = i_Gb_ts;

i_ba_t  = i_a_ts;
i_ac_t  = i_a_ts;
i_bc_t  = i_a_ts;

i_policy_t = i_policy_ts;

y_a_t   = y_a_ts;
y_b_t   = y_b_ts;
y_c_t   = y_c_ts;
y_c_aux_t = y_c_ts;

dgdp_a_t = 0; 
dgdp_b_t = 0;

c_a_t   = c_a_ts;
c_b_t   = c_b_ts;

c_o_a_t   = c_o_a_ts;
c_o_b_t   = c_o_b_ts;

c_r_a_t   = c_r_a_ts;
c_r_b_t   = c_r_b_ts;

in_a_t  = in_a_ts;
in_b_t  = in_b_ts;

in_o_a_t  = in_o_a_ts;
in_o_b_t  = in_o_b_ts;

lambda_o_a_t  = lambda_o_a_ts;
lambda_o_b_t  = lambda_o_b_ts;

lambda_r_a_t  = lambda_o_a_ts;
lambda_r_b_t  = lambda_o_b_ts;

n_a_t   = n_a_ts;
n_b_t   = n_b_ts;

nP_a_t   = nP_a_ts;
nP_b_t   = nP_b_ts;

nG_a_t   = nG_a_ts;
nG_b_t   = nG_b_ts;

wr_a_t   = wr_a_ts;
wr_b_t   = wr_b_ts;

wrG_a_t   = wrG_a_ts;
wrG_b_t   = wrG_b_ts;

k_a_t   = k_a_ts;
k_b_t   = k_b_ts;

k_o_a_t   = k_o_a_ts;
k_o_b_t   = k_o_b_ts;

mcr_a_t  = mcr_a_ts;
mcr_b_t  = mcr_b_ts;

rk_a_t  = rk_a_ts;
rk_b_t  = rk_b_ts;

q_a_t   = q_a_ts;
q_b_t   = q_b_ts;

ex_a_t  = ex_a_ts;
im_a_t  = im_a_ts;
ex_b_t  = ex_b_ts;
im_b_t  = im_b_ts;

Rk_a_t=i_a_ts;
Rk_b_t=i_a_ts;

l_o_a_t = l_o_a_ts;
l_o_b_t = l_o_b_ts;

l_r_a_t = l_r_a_ts;
l_r_b_t = l_r_b_ts;

l_a_t = l_a_ts;
l_b_t = l_b_ts;

kappaw_a_t = kappaw_a_ts;
kappaw_b_t = kappaw_b_ts;

ur_a_t = ur_a_ts;
ur_b_t = ur_b_ts;

cG_a_t = cG_a_ts;
cG_b_t = cG_b_ts;

tauw_a_t = tauw_a;
tauw_b_t =tauw_b;

tausc_a_t = tausc_a;
tausc_b_t = tausc_b;

tauk_a_t = tauk_a;
tauk_b_t = tauk_b;

tauc_a_t = tauc_a;
tauc_b_t = tauc_b;

TR_r_a_t = TR_r_a_ts;
TR_r_b_t = TR_r_b_ts;

TR_o_a_t = TR_o_a_ts;
TR_o_b_t = TR_o_b_ts;

TR_a_t = TR_a_ts;
TR_b_t = TR_b_ts;

T_a_t = T_a_ts;
T_b_t = T_b_ts;

UB_a_t = UB_a;
UB_b_t = UB_b;

BG_a_t = BG_a_ts;
BG_b_t = BG_b_ts;

kG_a_t   = kG_a_ts;
kG_b_t   = kG_b_ts;

yG_a_t   = yG_a_ts;
yG_b_t   = yG_b_ts;

inG_a_t  = inG_a_ts;
inG_b_t  = inG_b_ts;

GDP_a_t   = GDP_a_ts;
GDP_b_t   = GDP_b_ts;

omega_o_a_t = omega_o_a_ts;
omega_o_b_t = omega_o_b_ts;

omega_r_a_t = omega_r_a_ts;
omega_r_b_t = omega_r_b_ts;

pi_w_a_t = pi_ts;
pi_w_b_t = pi_ts;

pr_aa_t  = pr_ts;
pr_ba_t  = pr_ts;
pr_ca_t  = pr_ts;
pi_a_t   = pi_ts;

pr_ab_t  = pr_ts;
pr_bb_t  = pr_ts;
pr_cb_t  = pr_ts;
pi_b_t   = pi_ts;

pr_ac_t  = pr_ts;
pr_bc_t  = pr_ts;
pi_c_t   = pi_ts;

pi_aa_t = pi_ts;
pi_bb_t = pi_ts;
pi_ab_t = pi_ts;
pi_ac_t = pi_ts;
pi_ba_t = pi_ts;
pi_bc_t = pi_ts;

c_aa_t = mu_a*n_aa*c_r_a_ts + (1-mu_a)*n_aa*c_o_a_ts;

c_ab_t = mu_a*n_ab*c_r_a_ts + (1-mu_a)*n_ab*c_o_a_ts;

c_ac_t = mu_a*n_ac*c_r_a_ts + (1-mu_a)*n_ac*c_o_a_ts;

c_ba_t = mu_b*n_ba*c_r_b_ts + (1-mu_b)*n_ba*c_o_b_ts;

c_bb_t = mu_b*n_bb*c_r_b_ts + (1-mu_b)*n_bb*c_o_b_ts;

c_bc_t = mu_b*n_bc*c_r_b_ts + (1-mu_b)*n_bc*c_o_b_ts;

in_aa_t = (1-mu_a)*n_aa*in_o_a_ts;

in_ab_t = (1-mu_a)*n_ab*in_o_a_ts;

in_ac_t = (1-mu_a)*n_ac*in_o_a_ts;

in_ba_t = (1-mu_b)*n_ba*in_o_b_ts;

in_bb_t = (1-mu_b)*n_bb*in_o_b_ts;

in_bc_t = (1-mu_b)*n_bc*in_o_b_ts;

Del_S_bc_t  = 1;
Del_S_ac_t = 1;

rer_ba_t  = 1;
rer_ca_t  = 1;
rer_bc_t  = 1;
rer_ac_t  = 1;

B_c_t = B_c_ts;
B_ac_t = B_ac_ts; 
B_bc_t = B_bc_ts;
B_a_t = B_a_ts;
B_ba_t = B_ba_ts;

nfa_a_t = nfa_a_ts;
nfa_b_t = nfa_b_ts;
nfa_c_t = nfa_c_ts;

ca_a_t =0;
ca_b_t =0;
ca_c_t =0;

a_a_t=0;
a_b_t=0;
z_g_t = 0;

e_b_a_t=0;
e_b_b_t=0;

e_n_a_t=0;
e_n_b_t=0;

e_in_a_t=0;
e_in_b_t=0;

e_rp_a_t=0;
e_rp_b_t=0;

e_RoW_a_t=0;
e_RoW_b_t=0;

e_RoE_a_t=0;
e_RoE_b_t=0;

e_tau_a_t=0;
e_tau_b_t=0;

mg_a_t=mg_a;
mg_b_t=mg_a;

pi_c_var_t=0;
i_c_var_t=0;
y_c_var_t=0;

BG_a_obs=0;
BG_b_obs=0;

y_a_obs =0;
y_b_obs =0;
y_c_obs =0;

c_a_obs =0;
c_b_obs =0;

in_a_obs =0;
in_b_obs =0;

n_a_obs =0;
n_b_obs =0;

wr_a_obs =0;
wr_b_obs =0;

pi_a_obs =0;
pi_b_obs =0;
pi_c_obs =0;

ca_a_obs =0;
ca_b_obs =0;
ca_c_obs =0;

i_EMU_obs =0;
i_c_obs =0;

l_a_obs =0;
l_b_obs =0;

ur_a_obs =0;
ur_b_obs =0;

ur_a_dif =0;
ur_b_dif =0;

def_a_obs = 0;
def_b_obs = 0;

theta_a_t = theta_a;
theta_b_t = theta_b;

thetaw_a_t = thetaw_a;
thetaw_b_t = thetaw_b;

rer_ba_obs = 0;

interest = 0;
inflationq = 0;
inflation  = 0;
outputgap = 0;
output = 1*(pop_a/(pop_b+pop_a)*log(GDP_a_t)+(pop_b/(pop_b+pop_a)*log(GDP_b_t)));
consumption = 1*(pop_a/(pop_b+pop_a)*log(c_a_t)+(pop_b/(pop_b+pop_a)*log(c_b_t)));
investment = 1*(pop_a/(pop_b+pop_a)*log(in_a_t)+(pop_b/(pop_b+pop_a)*log(in_b_t)));
employment = 1*(pop_a/(pop_b+pop_a)*log(n_a_t)+(pop_b/(pop_b+pop_a)*log(n_b_t)));
wage = 1*(pop_a/(pop_b+pop_a)*log(wr_a_t)+(pop_b/(pop_b+pop_a)*log(wr_b_t)));

end;

//resid(1);
steady;

shocks;
  // var nua_eM = 0.00094078^2;
  var	nua_a	=	0.00753802716440	^2	;
  var	nua_ein	=	0.04644287574065	^2	;
  var	nua_eb	=	0.02011454200299	^2	;
  var	nua_en	=	0.02484617620910	^2	;
  var	nua_erp	=	0.00428121468710	^2	;
  var	nub_erp	=	0.00718940475370	^2	;
  var	nua_etheta	=	0.07290560125821	^2	;
  var	nua_ethetaw	=	0.21101449478709	^2	;
  var	nua_RoE	=	0.02735018785307	^2	;
  var	nua_RoW	=	0.05734678553545	^2	;
  var	nua_etauw	=	0.00227315527636	^2	;
  var	nua_etauc	=	0.00162619256566	^2	;
  var	nua_etausc	=	0.00137848984641	^2	;
//  var	nua_ecG	=	0.01605128003136	^2	;
  var	nua_einG	=	0.07503997122508	^2	;
  var	nua_enG	=	0.00018101663856	^2	;
  var	nua_emg	=	0.01084618528462	^2	;
  var	nua_eTR	=	0.01301741185614	^2	;
  var	nua_eT	=	0.02793296400063	^2	;
  var	nub_a	=	0.00473461040097	^2	;
  var	nub_ein	=	0.02432287957686	^2	;
  var	nub_eb	=	0.01126659878350	^2	;
  var	nub_en	=	0.02414766710473	^2	;
  var	nub_etheta	=	0.05103934639394	^2	;
  var	nub_ethetaw	=	0.36148852251111	^2	;
  var	nub_RoE	=	0.02686540985826	^2	;
  var	nub_RoW	=	0.02634508120905	^2	;
  var	nub_etauw	=	0.00193960315492	^2	;
  var	nub_etauc	=	0.00160944093838	^2	;
  var	nub_etausc	=	0.00153849138460	^2	;
//  var	nub_ecG	=	0.01095394183877	^2	;
  var	nub_einG	=	0.03564545677108	^2	;
  var	nub_enG	=	0.00018091979448	^2	;
  var	nub_emg	=	0.01137572024947	^2	;
  var	nub_eTR	=	0.01013080707864	^2	;
  var	nub_eT	=	0.01273726556139	^2	;
  var	eps_y_c	=	0.00683460951211	^2	;
  var	eps_i_c	=	0.00115265055366	^2	;
  var	eps_pi_c	=	0.00532841738948	^2	;
  var eps_z_g = 0;//0.01^2;
end;
//stoch_simul(order=1,irf=20,irf_shocks=(interest_,fiscal_)) output outputgap inflation interest;