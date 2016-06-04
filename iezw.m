function wq = iezw(sig, ref, initThresh, asize, level)
wqsign = winit(asize, level, 0);
wq = winit(asize, level, 0);
thresh = initThresh;
sigThreshLims = find(sig==4);
refThreshLims = find(ref==4);
for i = 1:length(sigThreshLims)
    if i == 1
        sigstart = 1;
        refstart = 1;
    else
        sigstart = sigThreshLims(i-1)+1;
        refstart = refThreshLims(i-1)+1;
    end
    wq = iref(wq, wqsign, ref(refstart:refThreshLims(i)-1), thresh);
    [wq, wqsign] = isig(wq, wqsign, sig(sigstart:sigThreshLims(i)-1), thresh);
    thresh = thresh/2
end
for subbidx = 1:length(wq)
    wq{subbidx} = wq{subbidx}.*wqsign{subbidx};
end
end
