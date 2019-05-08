function [IRF_Non_Aux_Var,IRFendo_names_Non_Aux]=Get_IRF_VAR(current_shock,current_rule,i, rules_set,rules_chosen,rule_solved,rules_setshort1,IRF_STR,Index_Non_Aux_Var,All_Endo_Var,precision)
    r1=1;
    for r=1:size(rules_set,1)
        if (rules_chosen(r)>0)
            if ~rule_solved(r)
                IRF_Non_Negligeable_Var = IRF_STR.(num2str(deblank(rules_setshort1(r,:))))(:,:,current_shock);
                for v=1:size(IRF_Non_Negligeable_Var,1)
                    IRF_Non_Negligeable(v,r1)=(max(abs(IRF_Non_Negligeable_Var(v,:)))>precision);
                end
                r1=r1+1;
            end
        end
    end
    Index_Non_Negligeable_Var{current_shock}=max(IRF_Non_Negligeable,[],2);
    Index_Non_Negligeable_Var{current_shock}=find(Index_Non_Negligeable_Var{current_shock}>0);
To_be_plotted=intersect(Index_Non_Aux_Var,Index_Non_Negligeable_Var{current_shock});
IRF_Non_Aux_Var=IRF_STR.(num2str(deblank(rules_setshort1(current_rule,:))))(To_be_plotted,:,:);
IRFendo_names_Non_Aux = All_Endo_Var(To_be_plotted,:);
end
%end
