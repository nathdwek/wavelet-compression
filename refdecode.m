function [nextRef, i, eofreached] = refdecode(bitstream, i, layercount)
layerdones = 0;
eofreached = 0;
nextRef = [];
while layerdones < layercount && ~eofreached
    if length(bitstream) - i >= 16-1
        reflength = bitstream(i:i+16-1);
        reflength = num2str(reflength);
        reflength(isspace(reflength)) = '';
        reflength = bin2dec(reflength);
        i = i + 16;
        if length(bitstream) - i >= reflength -1
            nextRef = [nextRef bitstream(i:i+reflength-1) 3];
            i = i + reflength;
            layerdones = layerdones + 1;
        else
            eofreached = 1;
        end
    else
        eofreached = 1;
    end
end
end
