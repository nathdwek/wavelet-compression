function bitstream = hufcode(sig, ref, initThresh)
    bitstream = zeros(1,8);
    binInitThresh = dec2bin(initThresh) - '0';
    bitstream(1:length(binInitThresh)) = binInitThresh;
    s1 = sig(1:find) 
    for coeff = sig
        if coeff == -1
            bistream = [bitstream 1 1 0];
        elseif coeff == 0
            bitstream = [bitstream 1 0];
        elseif coeff == 1
            bitstream = [bitstream 1 1 1 0];
        elseif coeff = 2
            bistream = [bitstream 0]
        elseif coeff = 3
            bitstream = [bitstream 1 1 1 1 0]
        else
            bitstream = [bitstream 1 1 1 1 1]
        end
    end
end
