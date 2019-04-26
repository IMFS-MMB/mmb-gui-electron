function [] = funeval_states(varargin)
% Callback for pushbutton.
global R;
    S = varargin{3};  % Get structure.
    R = [get(S.r(1),'val'), get(S.r(2),'val')];  % Get state of radios.

    close(gcbf);           
end
