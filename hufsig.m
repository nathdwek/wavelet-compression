function segment = hufsig(sig)
    segment = [];
    for coeff = sig
        if coeff == -1
            segment = [segment 1 1 0];
        elseif coeff == 0
            segment = [segment 1 0];
        elseif coeff == 1
            segment = [segment 1 1 1 0];
        elseif coeff == 2
            segment = [segment 0];
        else
            segment = [segment 1 1 1 1];
        end
    end
end