
%*************************************************************
% Plots the Irfs of several models/variants  
% Moyen S.
% Date: July 04, 2006
%*************************************************************

function plot_irfs(periods,ext)

global M_

modelsnames = str2mat('KM_debt_AEJ_Baseline','KM_debt_AEJ_Taxes'); 
Variables_List=str2mat('D_obs','Tau_obs','Y_obs','Pie_obs','Rrate','W_obs');
Schocks_List=str2mat('epsiD');

nf = size(modelsnames,1);

for k=1:nf

    load(['IRFs_' deblank(modelsnames(k,:)) '.mat']);

end


number_of_figs = size(Schocks_List,1);
nv = size(Variables_List,1);

for i=1:nv
    test = strmatch(Variables_List(i,:),M_.endo_names,'exact');
    if isempty(test)
        error (['One of the specified variables does not exist']) ;
        return
    end
end

for i=1:number_of_figs
    test = strmatch(Schocks_List(i,:),M_.exo_names,'exact');
    if isempty(test)
        error (['One of the specified Schocks does not exist']) ;
        return
    end
end
TMP = str2mat('D_obs','Tau_obs','Y_obs','Pie_obs','Rrate','W_obs');
Var = str2mat('Total Debt','Tax Rate','Output','Inflation','Real Interest Rate','Real Wage');
nt = size(TMP,1);
legend_var = [];

for i = 1:nv
    index = strmatch(Variables_List(i,:),TMP,'exact');
    if ~isempty(index)
        legend_var = strvcat(legend_var,Var(index,:));
    end
end

for j = 1:number_of_figs
    h1 = figure('Name',['Shock to' Schocks_List(j,:)]);
    Schocks_List(j,:);
    for i = 1:nv
        subplot(3,2,i);
        hold on
        for k=1:nf
            style1=str2mat('-b','--r','--g','-.k');
            style2=[1.5,1.5,1.5,1.5];
            TMP = zeros(periods,1);
            eval(['TMP(1:periods,1) =irfs_' deblank(modelsnames(k,:)) '.' deblank(Variables_List(i,:)) '_' deblank(Schocks_List(j,:)) '(1:periods,:);']);
            h2(k)= plot(TMP(1:periods,1),deblank(style1(k,:)),'linewidth',style2(k));
        end
        plot([1 periods],[0 0],'-k','linewidth',0.5);
        xlim([1 periods]);
        xlabel('Quarters','FontSize',9);
        title(deblank(legend_var(i,:)),'Interpreter','none','FontSize',11,'FontWeight','Bold');
        if i==4
            axis([1  80  -1  4]);
        end
        %if i==2
            %legend(h2,'essai','essai2','Location','Best');
        %end
        hold off
    end
    if exist ('ext') ==1
        eval(['print -depsc2 ' 'IRFs_to_' deblank(Schocks_List(j,:)) '_' ext]);
        eval(['print -dpdf ' 'IRFs_to_' deblank(Schocks_List(j,:)) '_' ext]);
        saveas(h1,['IRFs_to_' deblank(Schocks_List(j,:)) '_' ext '.fig']);
    else
        eval(['print -depsc2 ' 'IRFs_to_' deblank(Schocks_List(j,:))]);
        eval(['print -dpdf ' 'IRFs_to_' deblank(Schocks_List(j,:))]);
        saveas(h1,['IRFs_to_' deblank(Schocks_List(j,:)) '.fig']);
    end
end

