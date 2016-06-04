function [sig, ref, initThresh] = fezw(w, minThresh)
global wq;
initThresh = init_thresh(w);
sig=[];
ref=[];
wq = samestruct(w, 0);
wqsign = samestruct(w,0);
wmod = w;
thresh = initThresh;
while thresh > minThresh
    wzt = samestruct(w,0);
    for layer = 1:3
        for subidx = 1:length(w)
            subband = w{subidx};
            qsubband = wq{subidx};
            [r, c, ~] = size(subband);
            for i = 1:r
                for j=1:c
                    if wzt{subidx}(i,j,layer) == 0%Check first if it was not encoded as member of zt
                        if qsubband(i,j,layer) > 0%It was found significant previously, do refinement
                            nextref = subband(i,j,layer) >= (qsubband(i,j,layer) + thresh);
                            ref(end+1) = nextref;
                            if nextref
                                wq{subidx}(i,j,layer) = qsubband(i,j,layer) + thresh;
                            end
                        elseif abs(subband(i,j,layer)) > thresh%Found significant at this step
                            sig(end+1) = sign(subband(i,j,layer));
                            wmod{subidx}(i,j,layer) = 0;
                            wq{subidx}(i,j,layer) = thresh;
                            wqsign{subidx}(i,j,layer) = sign(subband(i,j,layer));
                        else%choose between zerotree and isolated zero
                            [isZT, wzt] =  checkZT(wmod, wzt, subidx, i, j, layer, thresh);
                            if isZT
                                sig(end+1) = 2;
                            else
                                sig(end+1) = 0;
                            end
                        end
                    end
                end
            end
        end
        ref(end+1) = 3;
        sig(end+1) = 3;
    end
    thresh = thresh/2
    ref(end+1) = 4;
    sig(end+1) = 4;
end
for subbidx = 1:length(wq)
    wq{subbidx} = wq{subbidx}.*wqsign{subbidx};
end
end
