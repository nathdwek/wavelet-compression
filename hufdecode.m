function [sig, ref] = hufdecode(bitstream, desiredTIters, layercount)
finished = 0;
i = 1;
sig = [];
ref = [];
TIters = 0;
bitstream = bitstream';
while ~finished
    [nextSig, i, eofreached] = sigdecode(bitstream, i, layercount);
    if ~eofreached
        [nextRef, i, eofreached] = refdecode(bitstream, i, layercount);
    end
    if ~eofreached
       sig = [sig nextSig 4];
       ref = [ref nextRef 4];
    end
    TIters = TIters + 1;
    finished = (TIters == desiredTIters) || eofreached;
end
