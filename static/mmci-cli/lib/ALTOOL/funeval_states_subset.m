function [] = funeval_states_subset(varargin)
% Callback for pushbutton.
global selstates states2 length;
    S2 = varargin{3};  % Get structure.
    count=0;
    R=zeros(1,length);
    temp=cell(1,length);
    for i=1:length
    R(1,i)=get(S2.r(i),'val');  % Get state of radios.
    if R(1,i)==1
        count=count+1;
        temp(1,count)=states2(1,i);
    end
    end
    selstates=cell(1,count);
    selstates=temp(1,1:count);

    close(gcbf);           
end
