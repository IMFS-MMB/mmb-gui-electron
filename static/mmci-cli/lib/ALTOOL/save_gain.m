function save_gain(~, ~)
    global bp S;
    bp = get(S.e,'string');
    close(gcbf);           
end