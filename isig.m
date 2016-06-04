function [wq, wqsign] = isig(wq, wqsign, sig, thresh)
layer = 1;
sigidx = 1;
wzt = samestruct(wq, 0);
while layer <= size(wq{1},3)
    subidx = 1;
    ldone = 0;
    while subidx <= length(wq) && ~ldone
        [r,c,~]=size(wq{subidx});
        i = 1;
        while i <= r && ~ldone
            j = 1;
            while j <= c && ~ldone
                if ~wzt{subidx}(i,j,layer)
                    symbol = sig(sigidx);
                    if any(symbol == [-1 1])
                        wqsign{subidx}(i,j,layer) = symbol;
                        wq{subidx}(i,j,layer) = thresh;
                    elseif symbol == 2
                        wzt = setzt(wzt,subidx,i,j,layer);
                    end
                    sigidx = sigidx + 1;
                    if sig(sigidx) == 3
                        ldone = 1;
                        sigidx = sigidx + 1;
                    end
                end
                j = j +1;
            end
            i = i +1;
        end
        subidx = subidx + 1;
    end
    layer = layer +1;
end