
%******************************************
% Stéphane Moyen
% Produces Irfs under the forecast
% and learning assumptions
%
% May 2008
%******************************************

function Learn_Irfs_2(Variables_List,periods,extension)
global M_   options_ oo_ ys_ Shocks_List

Shocks_List=str2mat('ETA_R','ETA_PIESTAR');

load('IRFs_KM_debt_AEJ.mat');

ns = size(M_.exo_names,1);
n = size(Variables_List,1);
NumberOfStructuralShocks = ns;
NumberOfStructuralImpulses = ns;
NumberOfEndogenousVariables = n;
indx = [ ];
y0 = zeros(NumberOfEndogenousVariables,1);
y0 = oo_.steady_state;

for i=1:n
    test = strmatch(Variables_List(i,:),M_.endo_names,'exact');
    if isempty(test)
        error (['One of the specified variables does not exist']);
        return
    else
        indx = cat(1,indx,[test]);
    end
end

% initializes the Shocks struture

for jj = 1:NumberOfStructuralShocks
    eval(['Shocks_R.' M_.exo_names(jj,:) '(1:periods+1,1) = 0;']);
    eval(['Shocks_PIESTAR.' M_.exo_names(jj,:) '(1:periods+1,1) = 0;']);
    eval(['Shocks_R_frcst.' M_.exo_names(jj,:) '(1:periods+1,1) = 0;']);
    eval(['Shocks_PIESTAR_frcst.' M_.exo_names(jj,:) '(1:periods+1,1) = 0;']);
    eval(['Shocks_R_learn.' M_.exo_names(jj,:) '(1:periods+1,1) = 0;']);
    eval(['Shocks_PIESTAR_learn.' M_.exo_names(jj,:) '(1:periods+1,1) = 0;']);
end

eval(['Shocks_PIESTAR.ETA_PIESTAR(1,1) = sqrt(M_.Sigma_e(5,5));']);
eval(['Shocks_PIESTAR.epsiD(1,1) = sqrt(M_.Sigma_e(3,3));']);

eval(['Shocks_R.ETA_R(1,1) = -sqrt(M_.Sigma_e(4,4));']);
eval(['Shocks_R.epsiD(1,1) = sqrt(M_.Sigma_e(3,3));']);

eval(['Shocks_PIESTAR_frcst.ETA_PIESTAR(1,1) = irfs_' M_.fname '.ETA_PIE_est_ETA_PIESTAR(1,1);']);
eval(['Shocks_PIESTAR_frcst.ETA_R(1,1) = irfs_' M_.fname '.ETA_R_est_ETA_PIESTAR(1,1);']);
eval(['Shocks_PIESTAR_frcst.epsiD(1,1) = sqrt(M_.Sigma_e(3,3));']);

eval(['Shocks_R_frcst.ETA_PIESTAR(1,1) = -irfs_' M_.fname '.ETA_PIE_est_ETA_R(1,1);']);
eval(['Shocks_R_frcst.ETA_R(1,1) = -irfs_' M_.fname '.ETA_R_est_ETA_R(1,1);']);
eval(['Shocks_R_frcst.epsiD(1,1) = sqrt(M_.Sigma_e(3,3));']);

eval(['Shocks_PIESTAR_learn.ETA_PIESTAR(1,1) = irfs_' M_.fname '.ETA_PIE_est_ETA_PIESTAR(1,1);']);
eval(['Shocks_PIESTAR_learn.ETA_R(1,1) = irfs_' M_.fname '.ETA_R_est_ETA_PIESTAR(1,1);']);
eval(['Shocks_PIESTAR_learn.epsiD(1,1) = sqrt(M_.Sigma_e(3,3));']);

eval(['Shocks_R_learn.ETA_PIESTAR(1,1) = -irfs_' M_.fname '.ETA_PIE_est_ETA_R(1,1);']);
eval(['Shocks_R_learn.ETA_R(1,1) = -irfs_' M_.fname '.ETA_R_est_ETA_R(1,1);']);
eval(['Shocks_R_learn.epsiD(1,1) =sqrt(M_.Sigma_e(3,3));']);

eval(['Shocks_PIESTAR_learn.ETA_PIESTAR(2:(periods+1),1) = irfs_' M_.fname '.ETA_PIE_est_ETA_PIESTAR(2:(periods+1),1);']);
eval(['Shocks_PIESTAR_learn.ETA_R(2:(periods+1),1) = irfs_' M_.fname '.ETA_R_est_ETA_PIESTAR(2:(periods+1),1);']);

eval(['Shocks_R_learn.ETA_PIESTAR(2:(periods+1),1) = -irfs_' M_.fname '.ETA_PIE_est_ETA_R(2:(periods+1),1);']);
eval(['Shocks_R_learn.ETA_R(2:(periods+1),1) = -irfs_' M_.fname '.ETA_R_est_ETA_R(2:(periods+1),1);']);

eval(['TSlength = length(Shocks_PIESTAR_learn.' M_.exo_names(end,:) ');'])

Exo_PIESTAR = zeros(TSlength,NumberOfStructuralShocks);
Exo_PIESTAR_frcst = zeros(TSlength,NumberOfStructuralShocks);
Exo_PIESTAR_learn = zeros(TSlength,NumberOfStructuralShocks);
Exo_R = zeros(TSlength,NumberOfStructuralShocks);
Exo_R_frcst = zeros(TSlength,NumberOfStructuralShocks);
Exo_R_learn = zeros(TSlength,NumberOfStructuralShocks);

for ii = 1:NumberOfStructuralImpulses
    eval(['Exo_PIESTAR(:,ii) = Shocks_PIESTAR.' M_.exo_names(ii,:) ';']);
    eval(['Exo_PIESTAR_frcst(:,ii) = Shocks_PIESTAR_frcst.' M_.exo_names(ii,:) ';']);
    eval(['Exo_PIESTAR_learn(:,ii) = Shocks_PIESTAR_learn.' M_.exo_names(ii,:) ';']);
    eval(['Exo_R(:,ii) = Shocks_R.' M_.exo_names(ii,:) ';']);
    eval(['Exo_R_frcst(:,ii) = Shocks_R_frcst.' M_.exo_names(ii,:) ';']);
    eval(['Exo_R_learn(:,ii) = Shocks_R_learn.' M_.exo_names(ii,:) ';']);
end

y_PIESTAR = simult_(y0,oo_.dr,Exo_PIESTAR,1);
y_PIESTAR = y_PIESTAR(indx,1:TSlength);
TTT = size(y_PIESTAR,1);

y_PIESTAR_frcst = simult_(y0,oo_.dr,Exo_PIESTAR_frcst,1);
y_PIESTAR_frcst = y_PIESTAR_frcst(indx,1:TSlength);
TTTf = size(y_PIESTAR_frcst,1);

y_PIESTAR_learn = simult_(y0,oo_.dr,Exo_PIESTAR_learn,1);
y_PIESTAR_learn = y_PIESTAR_learn(indx,1:TSlength);
TTTl = size(y_PIESTAR_learn,1);

y_R = simult_(y0,oo_.dr,Exo_R,1);
y_R = y_R(indx,1:TSlength);

y_R_frcst = simult_(y0,oo_.dr,Exo_R_frcst,1);
y_R_frcst = y_R_frcst(indx,1:TSlength);

y_R_learn = simult_(y0,oo_.dr,Exo_R_learn,1);
y_R_learn = y_R_learn(indx,1:TSlength);

% Computes and plots the IRFs

Var = str2mat('Output','Inflation','Short-term Interest Rate','Tax Rate','Perceived Target','Perceived Temporary Shock','Total Debt','Newly Issued Debt','Real Wage','Long-term Interest Rate','Average Interest Rate on Debt','Interest Rate Payments','Labor Tax Revenue','Real Interest Rate');
TMP = str2mat('Y_obs','Pie_obs','Int_obs','Tau_obs','PIESTAR4','EPSI_R','D_obs','D_new_obs','W_obs','Int_new_obs','Int_D_obs','DI_obs','Tax_obs','Rrate');
nt = size(TMP,1);
legend_var = [];

for i = 1:n
    index = strmatch(Variables_List(i,:),TMP,'exact');
    if ~isempty(index)
        legend_var = strvcat(legend_var,Var(index,:));
    end
end



h5 = figure('Name',['Shock to ' Shocks_List(2,:)]);

istart=1;
iend = 6;
for i = istart:iend
    subplot(3,2,i);
    %disp('test1')
    hold on
    style1=str2mat('-g','-r','--b','-.b');
    style2=[2,1];
    h6(1) = plot(y_PIESTAR_learn(i,2:periods+1),deblank(style1(1,:)),'linewidth',style2(1));
    %h4(2) = plot(y_PIESTAR_frcst(i,2:periods+1),deblank(style1(2,:)),'linewidth',style2(2));
    h6(2) = plot(y_PIESTAR(i,2:periods+1),deblank(style1(3,:)),'linewidth',style2(1));
    TMP = zeros(periods,1);
    eval(['TMP(1:periods,:) = irfs_' M_.fname '.' deblank(Variables_List(i,:)) '_epsiD(1:periods,1);']);
    h6(3) = plot(TMP(1:periods,1),deblank(style1(4,:)),'linewidth',style2(2));
    plot([1 periods],[0 0],'-k','linewidth',0.5);
    xlim([1 periods]);
    xlabel('Quarters','FontSize',9);
    title(deblank(legend_var(i,:)),'Interpreter','none','FontSize',11,'FontWeight','Bold');
%     if i==1
%         legend(h6,'Learning','Full Information','Location','Best'); % ,'Forecast'
%     end
    hold off
end

eval(['print -depsc2 ' 'IRFs_to_' deblank(Shocks_List(2,:)) '_1_' extension]);
eval(['print -dpdf ' 'IRFs_to_' deblank(Shocks_List(2,:)) '_1_' extension]);
saveas(h5,['IRFs_to_' deblank(Shocks_List(2,:)) '_1_' extension '.fig']);

h7 = figure('Name',['Shock to ' Shocks_List(2,:)]);

istart= 7;
iend = 12;
for i = istart:iend
    subplot(3,2,(i-6));

    %disp('test1')
    hold on
    style1=str2mat('-g','-r','--b','-.b');
    style2=[2,1];
    h8(1) = plot(y_PIESTAR_learn(i,2:periods+1),deblank(style1(1,:)),'linewidth',style2(1));
    %h4(2) = plot(y_PIESTAR_frcst(i,2:periods+1),deblank(style1(2,:)),'linewidth',style2(2));
    h8(2) = plot(y_PIESTAR(i,2:periods+1),deblank(style1(3,:)),'linewidth',style2(1));
    TMP = zeros(periods,1);
    eval(['TMP(1:periods,:) = irfs_' M_.fname '.' deblank(Variables_List(i,:)) '_epsiD(1:periods,1);']);
    h6(3) = plot(TMP(1:periods,1),deblank(style1(4,:)),'linewidth',style2(2));
    plot([1 periods],[0 0],'-k','linewidth',0.5);
    xlim([1 periods]);
    xlabel('Quarters','FontSize',9);
    title(deblank(legend_var(i,:)),'Interpreter','none','FontSize',11,'FontWeight','Bold');
%     if i==9
%         legend(h8,'Learning','Full Information','Location','Best'); % ,'Forecast'
%     end
    hold off
end

eval(['print -depsc2 ' 'IRFs_to_' deblank(Shocks_List(2,:)) '_2_' extension]);
eval(['print -dpdf ' 'IRFs_to_' deblank(Shocks_List(2,:)) '_2_' extension]);
saveas(h7,['IRFs_to_' deblank(Shocks_List(2,:)) '_2_' extension '.fig']);