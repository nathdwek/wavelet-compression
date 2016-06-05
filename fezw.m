function [sig, ref, initThresh, wq] = fezw(w, minThresh)
initThresh = init_thresh(w);
sig=[];
ref=[];
wq = samestruct(w, 0);
thresh = initThresh;
while thresh > minThresh
    wzt = samestruct(w,0);
    for layer = 1:size(w{1},3)
        for subidx = 1:length(w)
            subband = w{subidx};
            qsubband = wq{subidx};
            [r, c, ~] = size(subband);
            for i = 1:r
                for j=1:c
                    justsigflag = 0;
                    if wzt{subidx}(i,j,layer) == 0%Check first if it was not encoded as member of zt
                        if (abs(w{subidx}(i,j,layer)) > thresh) && wq{subidx}(i,j,layer) == 0 %found significant at this step
                            justsigflag = 1;
                            sig(end+1) = sign(subband(i,j,layer));
                            wq{subidx}(i,j,layer) = thresh;
                        else%choose between zerotree and isolated zero
                            [isZT, wzt] =  checkZT(w, wq, wzt, subidx, i, j, layer, thresh);
                            if isZT
                                sig(end+1) = 2;
                            else
                                sig(end+1) = 0;
                            end
                        end
                    end
                    if (qsubband(i,j,layer) ~= 0) && (~justsigflag)%It was found significant previously, do refinement
                        nextref = subband(i,j,layer) >= (qsubband(i,j,layer) + thresh);
                        ref(end+1) = nextref;
                        if nextref
                            wq{subidx}(i,j,layer) = qsubband(i,j,layer) + thresh;
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
end
