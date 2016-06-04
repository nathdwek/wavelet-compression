function wq = iref(wq, wqsign, ref, thresh)
layer = 1;
refidx = 1;
while layer <= size(wq{1},3)
    subidx = 1;
    ldone = 0;
    while subidx <= length(wq) && ~ldone
        [r,c,~]=size(wq{subidx});
        i = 1;
        while i <= r && ~ldone
            j = 1;
            while j<= c && ~ldone
                if wqsign{subidx}(i,j,layer) ~= 0
                    wq{subidx}(i,j,layer) = wq{subidx}(i,j,layer) + thresh*ref(refidx);
                    refidx = refidx + 1;
                    if ref(refidx) == 3
                        ldone = 1;
                        refidx = refidx + 1;
                    end
                end
                j = j +1;
            end
            i = i + 1;
        end
        subidx = subidx + 1;
    end
    layer = layer +1;
end
end
