function initThresh = init_thresh(w)
initThresh = 0;
for i = 1:length(w)
    t = 2^floor(log2(max(max(max(abs(w{i}))))));
    if t > initThresh
        initThresh = t;
    end
end
end
