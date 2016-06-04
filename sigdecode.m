function [nextSig, i, eofreached] = sigdecode(bitstream, i, layercount)
layerdones = 0;
symbols = [2, 0, -1, 1, 3];
currentLength = 1;
nextSig = [];
while (i<=length(bitstream)) && (layerdones<layercount)
    if bitstream(i)
        if currentLength == 4
            nextSig(end+1) = 3;
            currentLength = 1;
            layerdones = layerdones + 1;
        else
            currentLength = currentLength + 1;
        end
    else
        nextSig(end+1) = symbols(currentLength);
        currentLength = 1;
    end
    i = i + 1;    
end
eofreached = (layerdones < layercount);
end