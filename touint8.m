function simpleAdjusted = touint8(in)
    simpleAdjusted = uint8(in.*(255/max(max(max(in)))));
end