% MMB_settings.m
% This function sets up and collects the settings for the estimation using
% the command line.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% OPTIONS:
% excercise : 1 for One rule many models, 2 for One model many rules
% modelsvec : 1*114 vector for selecting models to run 
% rule      : 1*11 vector for selecting rules to run
% shocks    : 1*2  vector for selecting Monetary policy shock (default,
%             shocks(1,1)=1) and/or Fiscal polilcy shock (shocks(1,2) = 1) 
% data      : 9*4 matrix for user specified rule default is the SW rule.
%             The data has the following structure:
%              
%               int      infl        outputgap   output
%       t       1,1      1,2         1,3         1,4
%       t-1     2,1      2,2         2,3         2,4
%       ...     ...      ...         ...         ...     
%       t-4     5,1      5,2         5,3         5,4
%       t+1     6,1      6,2         6,3         6,4
%       ...     ...      ...         ...         ...     
%       t+4     9,1      9,2         9,3         9,4
%
% option1 :(1 - double) Autocorrelation Functions (ACFs) will be plotted, default = 1
% option2 :(1 - double) Impulse Response Functions (IRFs) will be plotted, default = 1
% option3 :(0 - double) Compute the IRFs to a contemporaneous combination of shocks in the MMBOPT2, default = 0 
% option4 :(1 - double) Plot selected (0) or all variables (1) in the MMBOPT2, default = 1 
% option5 :(1 - double) Show the unconditional variance in the Matlab console, default =1 
% option6 :(0 - double) Choose model specific shocks (1) in the MMBOPT2, default = 0 
% results :('results.xls' - string) Name of the ouptut file, default results=num2str('results.xls')
% horizon :(20- double) Number of periods to be plotted, default = 20
% gain    :(0.01 - double) AL gain parameter - by default it is 0.01, gain can be between
%          0.01 and 0.05, if outside of this range, then it is reset to its
%          default value.
% states  :([1 0] -1*2 matrix)  Model state variables in AL that agents learn about
%% Main options
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


Number_models = 114;
Number_rule = 11;
%% ------------------------------
if ~exist('option1','var')
    option1=1;
end
modelbase.option(1) = option1;
 
%% ------------------------------
if ~exist('option2','var')
    option2=1;
end
modelbase.option(2) = option2;

%% ------------------------------
if ~exist('option3','var')
    option3=0;
end
modelbase.option(3) = option3;

%% ------------------------------
if ~exist('option4','var')
    option4=1;
end
modelbase.option(4) = option4;
%% ------------------------------
if ~exist('option5','var')
    option5=1;
end
modelbase.option(5) = option5;

%% ------------------------------
if ~exist('option6','var')
    option6=0;
end
modelbase.option(6) = option6;

%% ------------------------------  The name of output file specified by the user
if ~exist('results','var')
  results=num2str('results.xls');  
end
modelbase.results = results;

%% ------------------------------ IRF/PACF horizon
if ~exist('horizon','var')
     horizon = 20; 
end
modelbase.horizon = horizon;
maxhorizon = 100;
modelbase.maxhorizon = maxhorizon;

%% ------------------------------ Models
if ~exist('modelsvec','var') 
    modelsvec=zeros(Number_models,1);      
end
modelbase.modelsvec = modelsvec;
 
%% ------------------------------ Rules
if ~exist('rule','var')
    rule=zeros(Number_rule,1);
end
modelbase.rule = find(rule==1);
%% ------------------------------ User specified rule
if ~exist('data','var')
data =[NaN 0.39 0 0.97;0.81 0 0 -0.9;0 0 0 0;0 0 0 0;...
    0 0 0 0;NaN 0 0 0;NaN 0 0 0;NaN 0 0 0;NaN 0 0 0];
end
modelbase.data = data;
%% ------------------------------ 
if ~exist('shocks','var') % Common Shocks (a Monetary Policy shock and a Fiscal Policy shock)
shocks=zeros(1,2);
shocks(1,1) = 1; 
end
modelbase.shocks = shocks;

%% ------------------------------ 
if ~exist('gain','var') % AL gain
gain = 0.01;
end
if gain<0 || gain>0.05
gain = 0.01;

end
modelbase.gain = gain;

%% ------------------------------ Retrunres
if ~exist('returnres','var')
     returnres = 20; 
end
modelbase.returnres = returnres;


 %%  MMB Structure setting up
%%%%%%%%%%%%%%%%%%%%%%% List of model names
names =char(['NK_RW97       ' % model_number 1     
               'NK_LWW03      ' %              2
               'NK_CGG99      ' %              3
               'NK_CGG02      ' %              4
               'NK_MCN99cr    ' %              5
               'NK_IR04       ' %              6
               'NK_BGG99      ' %              7
               'NK_GM05       ' %              8
               'NK_GK09lin    ' %              9
               'NK_CK08       ' %              10
               'NK_CKL09      ' %              11
               'NK_RW06       ' %              12
               'US_CMR14noFA  ' %              13 (used to be at place 67 in MMB2.2 had to be brought to the front due to Dynare's SS auxiliary variables' indexation's bug)
               'US_CMR14      ' %              14 (66)
               'US_FRB03      ' %              15
               'US_FRB08      ' %              16
               'US_FRB08mx    ' %              17
               'US_SW07       ' %              18
               'US_ACELm      ' %              19 IRFs to monetary policy shock with cost channel
               'US_ACELt      ' %              20 IRFs to technology shocks with cost channel                       
               'US_ACELswm    ' %              21 IRFs to monetary policy shock without cost channel, no timing constraint
               'US_ACELswt    ' %              22 IRFs to technology shocks without cost channel, no timing constraint
              % 'US_NFED08    ' % contained only in the MMB version 1.2 for DYNARE 3
               'US_RS99       ' %              23
               'US_OR03       ' %              24
               'US_PM08       ' %              25
               'US_PM08fl     ' %              26
               'US_DG08       ' %              27
               'US_CD08       ' %              28
               'US_IAC05      ' %              29
               'US_MR07       ' %              30
               'US_RA07       ' %              31
               'US_CCTW10     ' %              32
               'US_IR11       ' %              33
               'EA_CW05ta     ' %              34
               'EA_CW05fm     ' %              35
               'EA_AWM05      ' %              36
               'EA_SW03       ' %              37
               'EA_SR07       ' %              38
               'EA_QUEST3     ' %              39
               'EA_CKL09      ' %              40
               'EA_GE10       ' %              41
               'G7_TAY93      ' %              42
               'G3_CW03       ' %              43
               'EACZ_GEM03    ' %              44
               'G2_SIGMA08    ' %              45
               'EAUS_NAWM08   ' %              46
               'EAES_RA09     ' %              47
               'CL_MS07       ' %              48
              % 'CA_ToTEM10  ' % available only in the MMB version 1.2 for DYNARE 3
               'BRA_SAMBA08   ' %              49
               'CA_LS07       ' %              50
               'HK_FPP11      ' %              51
               'US_IN10       ' %              52
               'US_CMR10      ' %              53
               'US_CMR10fa    ' %              54
               'US_VMDno      ' %              55
               'US_VMDop      ' %              56
               'EA_GNSS10     ' %              57
               'NK_MM10       ' %              58
               'NK_KRS12      ' %              59
               'HK_FP13       ' %              60
               'EAUS_NAWMctww ' %              61
               'NK_CW09       ' %              62                 
               'GPM6_IMF13    ' %              63   
               'CA_BMZ12      ' %              64
               'NK_GK11       ' %              65
               'US_FM95       ' %              66 (13)
               'US_OW98       ' %              67 (14)
               'EA_QR14       ' %              68
               'NK_RW97AL     ' %              69
               'NK_LWW03AL    ' %              70
               'NK_CGG99AL    ' %              71
               'NK_CGG02AL    ' %              72
               'NK_IR04AL     ' %              73
               'NK_BGG99AL    ' %              74
               'NK_RW06AL     ' %              75
               'US_FM95AL     ' %              76
               'US_SW07AL     ' %              77
               'US_MI07AL     ' %              78
               'US_YR13AL     ' %              79
               'NK_ET14       ' %              80
               'NK_GK13       ' %              81
               'EA_DKR11      ' %              82
               'NK_BGEU10     ' %              83
               'NK_BGUS10     ' %              84
               'RBC_DTT11     ' %              85
               'US_CFOP14     ' %              86
               'US_JPT11      ' %              87
               'US_CPS10      ' %              88
               'NK_NS14       ' %              89
               'US_DNGS15     ' %              90
               'US_FMS134     ' %              91
               'NK_AFL15      ' %              92
               'US_FGKR15     ' %              93
               'EA_PV15       ' %              94
               'NK_CFP10      ' %              95
               'NK_GM07       ' %              96
               'NK_KW16       ' %              97
               'NK_MPT10      ' %              98
               'NK_PP17       ' %              99
               'NK_PSV16      ' %              100
               'NK_RA16       ' %              101
               'NK_ST13       ' %              102
               'US_AJ16       ' %              103
               'US_CFP17endo  ' %              104
               'US_CFP17exo   ' %              105
               'US_DNGS15SW   ' %              106
               'US_DNGS15SWpi ' %              107
               'US_DNGS15SWSP ' %              108
               'US_FV10       ' %              109
               'US_FV15       ' %              110
               'US_IR15       ' %              111
               'US_LWY13      ' %              112
               'US_RE09       ' %              113
               'NK_GLSV07     ' %              114
                         ]);%             

% Models by categories
NK_Models=[1 2 3 4 5 6 7 8 9 10 11 12 58 59 62 65 80 81 83 84 85 89 92 95 96 97 98 99 100 101 102 114];
Est_US_Models=[13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 52 53 54 55 56 66 67 86 87 88 90 91 93 103 104 105 106 107 108 109 110 111 112 113];
Est_EA_Models=[34 35 36 37 38 39 40 41 57 68 82 94];
Est_Cal_Models=[42 43 44 45 46 47 61 63];
Est_SOE_Models=[48 49 50 51 60 64];
AL_Models=[69 70 71 72 73 74 75 76 77 78 79];
% Dimension unit of original model shocks
% 1 -> shocks in percent
% 2 -> shocks in percent/100

  variabledim = [1   %NK_RW97      
                 1   %NK_LWW03     
                 1   %NK_CGG99         
                 1   %NK_CGG02
                 2   %NK_MCN99cr
                 1   %NK_IR04
                 1   %NK_BGG99
                 2   %NK_GM05
                 1   %NK_GK09lin   
                 1   %NK_CK08
                 1   %NK_CKL09
                 1   %NK_RW06
                 2   %US_CMR14noFA  
                 2   %US_CMR14  
                 2   %US_FRB03 
                 2   %US_FRB08    
                 2   %US_FRB08mx 
                 1   %US_SW07       
                 1   %US_ACELm    
                 1   %US_ACELt                               
                 1   %US_ACELswm    
                 1   %US_ACELswt  
               % 1   %US_NFED08
                 1   %US_RS99
                 1   %US_OR03
                 1   %US_PM08
                 1   %US_PM08fl
                 1   %US_DG08
                 2   %US_CD08
                 1   %US_IAC05
                 1   %US_MR07
                 1   %US_RA07
                 1   %US_CCTW10
                 1   %US_IR11
                 2   %EA_CW05ta       
                 2   %EA_CW05fm                                  
                 1   %EA_AWM05 (different from D3 version, see shock section in modfile)           
                 1   %EA_SW03          
                 1   %EA_SR07     
                 2   %EA_QUEST3
                 1   %EA_CKL09
                 1   %EA_GE10
                 2   %G7_TAY93        
                 2   %G3_CW03     
                 2   %EACZ_GEM03        
                 1   %G2_SIGMA08  
                 1   %EAUS_NAWM08
                 1   %EAES_RA09
                 1   %CL_MS07
                %1   %CA_ToTEM10
                 2   %BRA_SAMBA08
                 1   %CA_LS07
                 1   %HK_FPP11
                 2   %US_IN10
                 2   %US_CMR10
                 2   %US_CMR10fa
                 2   %US_VMDno
                 2   %US_VMDop 
                 2   %EA_GNSS10
                 2   %NK_MM10
                 1   %NK_KRS12
                 1   %HK_FP13
                 1   %EAUS_NAWMctww
                 1   %NK_CW09
                 1   %GPM6_IMF13
                 2   %CA_BMZ12
                 2   %NK_GK11
                 1   %US_FM95  (different from D3 version, see shock section in modfile)       
                 1   %US_OW98  (different from D3 version, see shock section in modfile)    
                 2   %EA_QR14
                 1   %NK_RW97AL
                 1   %NK_LWW03AL
                 1   %NK_CGG99AL
                 1   %NK_CGG02AL
                 1   %NK_IR04AL
                 1   %NK_BGG99AL
                 1   %NK_LWW03AL
                 1   %NK_RW06AL
                 1   %US_FM95AL
                 1   %US_SW07AL
                 1  % US_MI07AL
                 2   %NK_ET14
                 1   %NK_GK13
                 2   %EA_DKR11
                 1   %NK_BGEU10
                 1   %NK_BGUS10
                 2   %RBC_DTT11
                 1   %US_CFOP14
                 1   %US_JPT11
                 1   %US_CPS10
                 1   %NK_NS14
                 1   %US_DNGS15
                 1   %US_FMS134
                 1   %NK_AFL15
                 1   %US_FGKR15
                 1   %EA_PV15
                 1   %NK_CFP10  
                 1   %NK_GM07  
                 2   %NK_KW16  
                 2   %NK_MPT10  
                 1   %NK_PP17  
                 1   %NK_PSV16  
                 1   %NK_RA16  
                 2   %NK_ST13  
                 1   %US_AJ16  
                 1   %US_CFP17_endo  
                 1   %US_CFP17_exo  
                 1   %US_DNGS15_SW  
                 1   %US_DNGS15_SWpi  
                 1   %US_DNGS15_SWSP  
                 1   %US_FV10  
                 1   %US_FV15  
                 1   %US_IR15  
                 1   %US_LWY13  
                 1   %US_RE09  
                 1   %NK_GLSV07  
                 ];%  


Number_models=max(size(names));                   

%%
% The size of character in the variable of rulenames should be same.
rulenames = char(['User specified rule                 ' %rule_number 1
                  'Model Specific Policy Rule          ' %            2
                  'Taylor (1993)                       ' %            3
                  'Gerdesmeier and Roffia (2003)       ' %            4
                  'Levin, Wieland, Williams (2003)     ' %            5
                  'Smets and Wouters US (2007)         ' %            6
                  'Christiano, Eichenbaum, Evans (2005)' %            7
                  'Orphanides and Wieland (2008)       ' %            8
                  'Orphanides and Wieland (2013)       ' %            9
                  'Coenen et al. (2012)                ' %            10
                  'Chistiano, Motto, Rostagno (2014)   ' %            11
                  ]);     
         
 rulenamesshort = char(['User rule   ' %rule_number 1
                        'Model rule  ' %            2
                        'Taylor rule ' %            3
                        'GR rule     ' %            4
                        'LWW rule    ' %            5
                        'SW rule     ' %            6
                        'CEE rule    ' %            7
                        'OW08 rule   ' %            8
                        'OW13 rule   ' %            9
                        'Coenen rule ' %            10
                        'CMR rule    ' %            11
                  ]);    
rulenamesshort1 = char(['User_Rule   ' %rule_number 1
                        'Model_Rule  ' %            2
                        'Taylor_Rule ' %            3
                        'GR_Rule     ' %            4
                        'LWW_Rule    ' %            5
                        'SW_Rule     ' %            6
                        'CEE_Rule    ' %            7
                        'OW08_Rule   ' %            8
                        'OW13_Rule   ' %            9
                        'Coenen_Rule ' %            10
                        'CMR_Rule    ' %            11
                  ]); 

              % List of numbers of models according to having a model-specific rule implemented
model_with_rule=[2 3 4 5 6 7 10 11 14    18 19 20 21 22 24 25 26 27 29 31 ...
                32 33 34 35 37 39 40 41 42 43 45 46 47 49 52 ...
                55 56 57 58 59 61 62 63 64 66 68 70 71 72 73 74 ...
                77 78 79 80 86 87 88 89 90 91 92 93 94 95 96 97 98 99 100 101 102 103 104 105 106 107 108 112 113 114 ];
model_without_rule=[1 8 9 12 13 15 16 17 23 28 30 36 38 44 48 50 51 53 54 60 ...
                65 67 69 75 76 81 82 83 84 85 109 110 111];

Number_rule=size(rulenames,1);
common_rule=zeros(Number_rule,33);


  % Set Parameters for the Monetary Policy Rule
        % The Policy Rule is Described by the Following Equation in Each model Dynare file:
        % interest = const + cofintintb1*interest(-1) + cofintintb2*interest(-2) + cofintintb3*interest(-3) + cofintintb4*interest(-4)
        %           + cofintinf0*inflationq + cofintinfb1*inflationq(-1) + cofintinfb2*inflationq(-2) + cofintinfb3*inflationq(-3) + cofintinfb4*inflationq(-4)
        %           + cofintinff1*inflationq(+1) + cofintinff2*inflationq(+2) + cofintinff3*inflationq(+3) + cofintinff4*inflationq(+4)
        %           + cofintout*outputgap + cofintoutb1*outputgap(-1) + cofintoutb2*outputgap(-2) + cofintoutb3*outputgap(-3) + cofintoutb4*outputgap(-4)
        %           + cofintoutf1*outputgap(+1) + cofintoutf2*outputgap(+2) + cofintoutf3*outputgap(+3) + cofintoutf4*outputgap(+4)
        %           + cofintoutp*output + cofintoutpb1*output(-1) + cofintoutpb2*output(-2) + cofintoutpb3*output(-3) + cofintoutpb4*output(-4)
        %           + cofintoutpf1*output(+1) + cofintoutpf2*output(+2) + cofintoutpf3*output(+3) + cofintoutpf4*output(+4)
        %           + {std_r_ * interest_            , if the model has an annual interest rate
        %           + {std_r_quart * interest_       , if the model has an quarterly interest rate
        
        % Description of Modelbase Variables:
        % interest is the annualized quarterly nominal interest rate
        % inflationq is the annualized quarterly inflation rate
        % inflation is the year-on-year inflation rate
        % outputgap
        % output
        
        % The mapping of coefficients in the monetary rule (rule_number = rn)   
        
        % common_rule(rn,1)=cofintintb1,common_rule(rn,2)=cofintintb2,common_rule(rn,3)=cofintintb3,common_rule(rn,4)=cofintintb4
        % common_rule(rn,5)=cofintinf0,common_rule(rn,6)=cofintinfb1,common_rule(rn,7)=cofintinfb2,common_rule(rn,8)=cofintinfb3,common_rule(rn,9)=cofintinfb4,
        % common_rule(rn,10)=cofintinff1,common_rule(rn,11)=cofintinff2,common_rule(rn,12)=cofintinff3,common_rule(rn,13)=cofintinff4,
        % common_rule(rn,14)=cofintout,common_rule(rn,15)=cofintoutb1,common_rule(rn,16)=cofintoutb2,common_rule(rn,17)=cofintoutb3,common_rule(rn,18)=cofintoutb4,
        % common_rule(rn,19)=cofintoutf1,common_rule(rn,20)=cofintoutf2,common_rule(rn,21)=cofintoutf3,common_rule(rn,22)=cofintoutf4,
        % common_rule(rn,23)=cofintoutp,common_rule(rn,24)=cofintoutpb1,common_rule(rn,25)=cofintoutpb2,common_rule(rn,26)=cofintoutpb3,common_rule(rn,27)=cofintoutpb4,
        % common_rule(rn,28)=cofintoutpf1,common_rule(rn,29)=cofintoutpf2,common_rule(rn,30)=cofintoutpf3,common_rule(rn,31)=cofintoutpf4,
        % common_rule(rn,32) =std_r_,common_rule(rn,33) = std_r_quart
        
        % Taylor (1993) Rule
            %
            % Original formulation of the policy rule:
            % r = p + 0.5*y + 0.5*(p-2)+2
            % [Equation (1) in the paper]
            % Variables:
            % r is the federal funds rate
            % p is the rate of inflation over the previous four quarters
            % y is the percent deviation of real GDP from a target
            %
            % Description in terms of the Modelbase general rule specification:  
            
            common_rule(3,1) =  0; common_rule(3,2) = 0; common_rule(3,3) = 0; common_rule(3,4) = 0;
            common_rule(3,5) = 1.5/4; common_rule(3,6) = 1.5/4; common_rule(3,7) = 1.5/4; common_rule(3,8) = 1.5/4; common_rule(3,9) = 0;
            common_rule(3,10) = 0; common_rule(3,11) = 0; common_rule(3,12) = 0; common_rule(3,13) = 0;
            common_rule(3,14) = 0.5;common_rule(3,15) = 0; common_rule(3,16) = 0; common_rule(3,17) = 0; common_rule(3,18) = 0;
            common_rule(3,19) = 0; common_rule(3,20) = 0; common_rule(3,21) = 0; common_rule(3,22) = 0;
            common_rule(3,23) = 0; common_rule(3,24) = 0;common_rule(3,25) = 0;common_rule(3,26) = 0;common_rule(3,27) = 0;
            common_rule(3,28) = 0; common_rule(3,29) = 0;common_rule(3,30) = 0;common_rule(3,31) = 0;
            common_rule(3,32) = 1;
            common_rule(3,33) = 0.25;
            
            % Policy Rule Gerdesmeier and Roffia (2003)
            %
            % Original formulation of the policy rule as in Kuester and Wieland
            % (2008), who adjusted GR's monthly estimates to quarterly frequency:
            % r = 0.87^3*r(-1) + (1-0.87^3)*(1.93*pi + 0.28*y)
            % [Equation (1) in the paper]
            % Variables:
            % r is the annualized quarterly nominal interest rate
            % pi is the year-on-year inflation rate
            % y is the output gap
            %
            % Description in terms of the Modelbase general rule specification:
            common_rule(4,1) =  0.87^3; common_rule(4,2) = 0; common_rule(4,3) = 0; common_rule(4,4) = 0;
            common_rule(4,5) = (1-0.87^3)*1.93/4; common_rule(4,6) = (1-0.87^3)*1.93/4; common_rule(4,7) = (1-0.87^3)*1.93/4; common_rule(4,8)= (1-0.87^3)*1.93/4; common_rule(4,9) = 0;
            common_rule(4,10) = 0; common_rule(4,11) = 0; common_rule(4,12) = 0; common_rule(4,13) = 0;
            common_rule(4,14) = (1-0.87^3)*0.28; common_rule(4,15) = 0; common_rule(4,16) = 0; common_rule(4,17) = 0; common_rule(4,18) = 0;  
            common_rule(4,19) = 0; common_rule(4,20) = 0; common_rule(4,21) = 0; common_rule(4,22) = 0;
            common_rule(4,23) = 0; common_rule(4,24) = 0; common_rule(4,25) = 0; common_rule(4,26) = 0; common_rule(4,27) = 0; 
            common_rule(4,28) = 0; common_rule(4,29) = 0; common_rule(4,30) = 0; common_rule(4,31) = 0;
            common_rule(4,32) = 1; %1.0124*1.0238; to replicate results from Kuester, Wieland
            common_rule(4,33) = 0.25; % use 0.0808*.25*4*3.1479 to replicate results from Kuester, Wieland
            
            % Policy Rule Levin, Wieland and Williams (2003)
            %
            % Original formulation of the policy rule:
            % i = -0.28 + 0.76*i(-1) + 0.60*pitilde + 0.21*y + 0.97*dy
            %[Equation (4) in the paper]
            % Variables:
            % i is the annualized short-term nominal interest rate
            % pitilde is the four-quarter average inflation rate (annualized)
            % y is the output gap
            % dy is the first difference of the output gap
            %
            % Description in terms of the Modelbase general rule specification:
            common_rule(5,1) =  0.755226; common_rule(5,2) = 0; common_rule(5,3) = 0; common_rule(5,4) = 0;
            common_rule(5,5) = 0.602691/4; common_rule(5,6) = 0.602691/4; common_rule(5,7) = 0.602691/4; common_rule(5,8) = 0.602691/4; common_rule(5,9) = 0;
            common_rule(5,10) = 0; common_rule(5,11) = 0; common_rule(5,12) = 0; common_rule(5,13) = 0;
            common_rule(5,14) = 1.17616; common_rule(5,15) = -0.972390; common_rule(5,16) = 0; common_rule(5,17) = 0;common_rule(5,18) = 0;
            common_rule(5,19) = 0; common_rule(5,20) = 0; common_rule(5,21) = 0; common_rule(5,22) = 0;
            common_rule(5,23) = 0; common_rule(5,24) = 0;common_rule(5,25) = 0; common_rule(5,26) = 0; common_rule(5,27) = 0;
            common_rule(5,28) = 0; common_rule(5,29) = 0; common_rule(5,30) = 0; common_rule(5,31) = 0;
            common_rule(5,32) = 1;
            common_rule(5,33) = 0.25;
            
            % Policy Rule Smets Wouters 2007 US
            %
            % Original formulation of the policy rule:
            % r =  crpi*(1-crr)*pinf + cry*(1-crr)*(y-yf) + crdy*(y - yf - y(-1) + yf(-1)) + crr*r(-1) + ms
            % [Equation (14) in the paper]
            % Variables:
            % r is the quarterly interest rate, not annualized
            % pinf is quarterly inflation, not annualized
            % y is output
            % yf is potential output
            % ms is a monetary policy shock
            % Coefficients:
            % crpi=     2.0443; Taylor rule reaction to inflation
            % crr=      0.8103; Taylor rule interest rate smoothing
            % cry=      0.0882; Taylor rule long run reaction to output gap
            % crdy=     0.2247; Taylor rule short run reaction to output gap
            %
            % Description in terms of the Modelbase general rule specification:
            
            common_rule(6,1) =  0.8103; common_rule(6,2) = 0; common_rule(6,3) = 0; common_rule(6,4) = 0;
            common_rule(6,5) = (1-0.8103)*2.0443; common_rule(6,6) = 0; common_rule(6,7) = 0; common_rule(6,8) = 0;common_rule(6,9) = 0;
            common_rule(6,10) = 0; common_rule(6,11) = 0; common_rule(6,12) = 0; common_rule(6,13) = 0;
            common_rule(6,14) = ((1-0.8103)*0.0882+0.2247)*4; common_rule(6,15) = -0.2247*4; common_rule(6,16) = 0;common_rule(6,17) = 0; common_rule(6,18) = 0;
            common_rule(6,19) = 0; common_rule(6,20) = 0; common_rule(6,21) = 0;common_rule(6,22) = 0; 
            common_rule(6,23) = 0; common_rule(6,24) = 0; common_rule(6,25) = 0; common_rule(6,26) = 0;common_rule(6,27) = 0;  
            common_rule(6,28) = 0; common_rule(6,29) = 0; common_rule(6,30) = 0; common_rule(6,31) = 0;
            common_rule(6,32) = 1;
            common_rule(6,33) = 0.25;
            
            % Policy Rule Christiano, Eichenbaum and Evans (2005)
            %
            % Original formulation of the policy rule:
            % R = rho*R(-1) + (1-rho)*(alpha_pi*pi(+1) + alpha_y*y) + eps
            % [Equation on page 28 of the paper]
            % Variables:
            % R is the short-run nominal interest rate, annualized or not?
            % pi is inflation, annualized or not?
            % y is the output gap
            % Coefficients:
            % rho = 0.80; Taylor rule interest rate smoothing
            % alpha_pi = 1.5; Taylor rule reaction to expected inflation one period ahead
            % alpha_y = 0.1; Taylor rule reaction to output gap
            %
            % Description in terms of the Modelbase general rule specification:
            common_rule(7,1) =  0.8; common_rule(7,2) = 0; common_rule(7,3) = 0; common_rule(7,4) = 0;
            common_rule(7,5) = 0;common_rule(7,6) = 0; common_rule(7,7) = 0; common_rule(7,8) = 0; common_rule(7,9) = 0;
            common_rule(7,10) = (1-0.8)*1.5; common_rule(7,11) = 0; common_rule(7,12) = 0; common_rule(7,13) = 0;
            common_rule(7,14) = (1-0.8)*0.1*4; common_rule(7,15) = 0; common_rule(7,16) = 0; common_rule(7,17) = 0; common_rule(7,18)= 0;
            common_rule(7,19) = 0; common_rule(7,20) = 0; common_rule(7,21) = 0; common_rule(7,22) = 0;
            common_rule(7,23) = 0; common_rule(7,24) = 0; common_rule(7,25) = 0; common_rule(7,26) = 0; common_rule(7,27) = 0; 
            common_rule(7,28) = 0; common_rule(7,29) = 0; common_rule(7,30) = 0; common_rule(7,31) = 0;
            common_rule(7,32) = 1;
            common_rule(7,33) = 0.25;
            
            %
            % Policy Rule Orphanides and Wieland (2008)
            % Original formulation of the policy rule
            % i = 6.97+ 2.34*pi(+3) -1.53*u(+3)
            % i = 0.39*i(-2)+ (1-0.39)*(8.25+2.48*pi(+3)-1.84*u(+3))
            % [The third and fourth columns in Table 3 on page 316 of the paper
            % Variables:
            % i is the short-run nominal interest rate, annualized or not?
            % pi is annual inflation
            % u is the unemployment rate, and u* the natural rate of unemployment
            % y is the output gap
            % By the Okuns Law, -2(u-u*)=y, the rule can be expressed in terms
            % of output gap as follows:
            %  i = 2.34*pi(+3) + 1.53/2*y(+3)                  (1)
            %  i = 0.39*i(-2)+1.5128*pi(+3) + 1.1224/2*y(+3)   (2)
            % we make use of the rule without smoothing (1)
            
            common_rule(8,1) =  0;common_rule(8,2) = 0; common_rule(8,3) = 0; common_rule(8,4) = 0;
            common_rule(8,5) = 2.34/4; common_rule(8,6) = 0; common_rule(8,7) = 0; common_rule(8,8) = 0;common_rule(8,9) = 0; 
            common_rule(8,10)= 2.34/4; common_rule(8,11) = 2.34/4; common_rule(8,12) =2.34/4; common_rule(8,13) = 0;
            common_rule(8,14) = 0; common_rule(8,15) = 0; common_rule(8,16) = 0; common_rule(8,17) = 0; common_rule(8,18) = 0; 
            common_rule(8,19) = 0; common_rule(8,20) = 0; common_rule(8,21) = 0.765; common_rule(8,22) = 0; 
            common_rule(8,23) = 0; common_rule(8,24) = 0; common_rule(8,25) = 0; common_rule(8,26) = 0; common_rule(8,27) = 0; 
            common_rule(8,28) = 0; common_rule(8,29) = 0; common_rule(8,30) = 0; common_rule(8,31) = 0;
            common_rule(8,32) = 1;
            common_rule(8,33) = 0.25;
            
            %
            % Policy Rule Orphanides and Wieland (2013)
            % Original formulation of the policy rule
            % i = i(-1) + 1/2*(pi-pi*) + 1/2(q-q(-4) -(q*-q*(-4)))
            % [Equation 1 on page 174 of the paper]
            % Variables:
            % i is the short-run nominal interest rate, annualized
            % pi is annual inflationb
            % q-q(-4) is the output growth rate over four quarters
            % q*-q*(-4) is the potential output growth rate over four quarters
            
            % Description in terms of the Modelbase general rule specification:
            common_rule(9,1) =  1; common_rule(9,2) = 0; common_rule(9,3) = 0; common_rule(9,4) = 0;
            common_rule(9,5) = 0.5/4; common_rule(9,6) = 0.5/4; common_rule(9,7) = 0.5/4; common_rule(9,8) = 0.5/4; common_rule(9,9) = 0; 
            common_rule(9,10) = 0; common_rule(9,11) = 0; common_rule(9,12) = 0; common_rule(9,13) = 0;
            common_rule(9,14) = 0.5; common_rule(9,15) = 0; common_rule(9,16) = 0; common_rule(9,17) = 0; common_rule(9,18) = -0.5;
            common_rule(9,19) = 0; common_rule(9,20) = 0; common_rule(9,21) = 0; common_rule(9,22) = 0;
            common_rule(9,23) = 0; common_rule(9,24) = 0; common_rule(9,25) = 0; common_rule(9,26) = 0; common_rule(9,27) = 0; common_rule(9,28) = 0;
            common_rule(9,29) = 0; common_rule(9,30) = 0; common_rule(9,31) = 0;
            common_rule(9,32) = 1;
            common_rule(9,33) = 0.25;
            
            % Standardized Policy Rule in Coenen et al. (2012)
            %
            % Original formulation of the policy rule:
            % R = 0.7*R(-1) + 1.25*(pi + pi(+4)) + eps
            % Policy Rule specified on page 40 of the paper
            % Variables:
            % R is the quarterly short-run nominal interest rate
            % pi is the quarterly inflation  
            %
            % Description in terms of the Modelbase general rule specification:
            common_rule(10,1) =  0.7; common_rule(10,2) = 0; common_rule(10,3) = 0; common_rule(10,4) = 0;
            common_rule(10,5) = 1.25;common_rule(10,6) = 0; common_rule(10,7) = 0; common_rule(10,8) = 0; common_rule(10,9) = 0;
            common_rule(10,10) = 0; common_rule(10,11) = 0; common_rule(10,12) = 0; common_rule(10,13) = 1.25;
            common_rule(10,14) = 0; common_rule(10,15) = 0; common_rule(10,16) = 0; common_rule(10,17) = 0; common_rule(10,18)= 0;
            common_rule(10,19) = 0; common_rule(10,20) = 0; common_rule(10,21) = 0; common_rule(10,22) = 0;
            common_rule(10,23) = 0; common_rule(10,24) = 0; common_rule(10,25) = 0; common_rule(10,26) = 0; common_rule(10,27) = 0; 
            common_rule(10,28) = 0; common_rule(10,29) = 0; common_rule(10,30) = 0; common_rule(10,31) = 0;
            common_rule(10,32) = 1;
            common_rule(10,33) = 0.25;
            
            % Policy Rule Christiano, Motto and Rostagno (2014)
            %
            % Original formulation of the policy rule:
            % R = rhop*R(-1) + (1-rhop)*(alpha_pi*(pi(+1)-pi_start)+alpha_delta_y/4*(g_y-nu_start_z)) + e_xp/400
            % Policy Rule specified in equation 39 of the paper
            % Variables:
            % R is the deviation of the net quarterly short-run nominal
            % interest rate from its steady-state value
            % (pi(+1)-pi_start) is the deviation of anticipated quarterly inflation from the central bank’s inflation target
            % (g_y-nu_start_z)is quarterly growth in gross domestic product (GDP), in deviation from its steady state. 
            % e_xp is a shock (in annual percentage points) to monetary policy
            % rhop=0.850296450300000;alpha_pi=
            % 2.396495942700000*1.006010795406775;alpha_delta_y=0.364943654300000*1.004124413586981;
            % Description in terms of the Modelbase general rule specification:
            common_rule(11,1) = 0.850296450300000; common_rule(11,2) = 0; common_rule(11,3) = 0; common_rule(11,4) = 0;
            common_rule(11,5) = 0; common_rule(11,6) = 0; common_rule(11,7) = 0; common_rule(11,8) = 0;common_rule(11,9) = 0; 
            common_rule(11,10) = (1-0.850296450300000)* 2.396495942700000*1.006010795406775; common_rule(11,11) = 0; common_rule(11,12) = 0; common_rule(11,13) = 0;
            common_rule(11,14) = 0; common_rule(11,15) = 0; common_rule(11,16) = 0; common_rule(11,17) = 0; common_rule(11,18) = 0;
            common_rule(11,19) = 0; common_rule(11,20) = 0; common_rule(11,21) = 0; common_rule(11,22) = 0;
            common_rule(11,23) = (1-0.850296450300000)*0.364943654300000*1.004124413586981; common_rule(11,24) = -(1-0.850296450300000)*0.364943654300000*1.004124413586981; common_rule(11,25) = 0; common_rule(11,26) = 0; common_rule(11,27) = 0; common_rule(11,28) = 0;
            common_rule(11,29) = 0; common_rule(11,30) = 0; common_rule(11,31) = 0;
            common_rule(11,32) = 1;
            common_rule(11,33) = 0.25;

            % A New Common Policy Rule
            % common_rule(rn,1) = 0; common_rule(rn,2) = 0; common_rule(rn,3) = 0; common_rule(rn,4) = 0;
            % common_rule(rn,5) = 0; common_rule(rn,6) = 0; common_rule(rn,7) = 0; common_rule(rn,8) = 0;common_rule(rn,9) = 0; 
            % common_rule(rn,10) = 0; common_rule(rn,11) = 0; common_rule(rn,12) = 0; common_rule(rn,13) = 0;
            % common_rule(rn,14) = 0; common_rule(rn,15) = 0; common_rule(rn,16) = 0; common_rule(rn,17) = 0; common_rule(rn,18) = 0;
            % common_rule(rn,19) = 0; common_rule(rn,20) = 0; common_rule(rn,21) = 0; common_rule(rn,22) = 0;
            % common_rule(rn,23) = 0; common_rule(rn,24) = 0; common_rule(rn,25) = 0; common_rule(rn,26) = 0; common_rule(rn,27) = 0; common_rule(rn,28) = 0;
            % common_rule(rn,29) = 0; common_rule(rn,30) = 0; common_rule(rn,31) = 0;
            % common_rule(rn,32) = 1;
            % common_rule(rn,33) = 0.25;
       

%% User specific rule 
%data =[NaN 0 0 0;0 0 0 0;0 0 0 0;0 0 0 0;...
%    0 0 0 0;NaN 0 0 0;NaN 0 0 0;NaN 0 0 0;NaN 0 0 0];


%%
modelbase.names =names;
modelbase.variabledim = variabledim;
modelbase.rulenames = rulenames;
modelbase.rulenamesshort = rulenamesshort;
modelbase.rulenamesshort1 = rulenamesshort1;
modelbase.rulelegend  = [];
modelbase.common_rule=common_rule;
modelbase.data = data;
modelbase.AL_Models = AL_Models;


%% Adding folder structure to path
modelbase.homepath = cd; cd(modelbase.homepath); addpath(modelbase.homepath);
modelbase.uphomepath =cd(cd('..')); addpath(modelbase.uphomepath);
%% Creating the additional variables needed
modelbase.totaltime = cputime;
modelbase.models = find(modelsvec~=0);
modelbase.savepath = [modelbase.uphomepath filesep 'OUTPUT' filesep num2str('results.xls')];
modelbase.rule = find(rule==1);
solution_found = zeros(size(find(modelsvec~=0)')); % solution_found(number)= 1 if a solution is found and 0 else

%% ------------------------------ AL states
if ~exist('states','var')
    for epsilon=1:size(modelbase.models,2)
      modelbase.setpath(modelbase.models(epsilon),:) = [modelbase.uphomepath filesep 'MODELS' filesep strtrim(modelbase.names(modelbase.models(epsilon),:))]; % path for dynare file of specific model
      al=deblank(modelbase.names(modelbase.models(epsilon),:));
        modelbase.AL=strcmp(al(end-1:end),'AL');
         
            if modelbase.AL
            if ~ismember(modelbase.rule,[8 9 10])
                thepath=cd;
                cd(modelbase.setpath(modelbase.models(epsilon),:))
                load AL_Info
                cd(thepath);
                AL_.forwards = AL_Info.forwards;
                if ismember(modelbase.rule,[6 7])
                    AL_.states = AL_Info.states_short;
                else
                    AL_.states = AL_Info.states_long;
                end
                
                modelbase.AL_=AL_;
                modelbase.ModelStates(modelbase.models(epsilon))={modelbase.AL_.states};
             else
                modelbase.AL_=[];
                modelbase.ModelStates(modelbase.models(epsilon))={[]};
            end        
            end
    modelbase = rmfield(modelbase,'setpath') ; % path for dynare file of specific model
        
    end
            options_.ar=100;
end
