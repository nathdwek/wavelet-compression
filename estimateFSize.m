function estimation = estimateFSize(sig, ref)
    estimation = length(ref);
    for coeff = sig
        if coeff == -1
            estimation = estimation + 3;
        elseif coeff == 0
            estimation = estimation +2;
        elseif coeff == 1
            estimation = estimation + 4;
        elseif coeff == 2
            estimation = estimation +1;
        elseif coeff == 3
            estimation = estimation + 5;
        else
            estimation = estimation + 5;
        end
    end
    estimation = ceil(estimation/8000);
end