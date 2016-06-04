function [isZT, wzt] = checkZT(wmod, wzt, subidx, i, j, layer, thresh)
    isZT = 1;
    if subidx == 1
        [m,n,~] = size(wmod{1});
        if i > m/2
            i = floor(i/2);
            if j > n/2
                j = floor(j/2);
                firstband = 4;
            else
                firstband = 3;
            end
        else
            if j > n/2
                j = floor(j/2);
                firstband = 2;
            else
                isZT=0;
                firstband = 0;
            end
        end
    else
        firstband = subidx+3;
    end
    band = firstband;
    imin = 2*(i-1)+1;
    imax = 2*i;
    jmin = 2*(j-1)+1;
    jmax = 2*j;
    while isZT && (band <= length(wmod))
        isZT = all(all(abs(wmod{band}(imin:imax,jmin:jmax,layer)) < thresh));
        imin = 2*(imin-1)+1;
        imax = 2*imax;
        jmin = 2*(jmin-1)+1;
        jmax = 2*jmax;
        band = band+3;
    end
    if isZT
        band = firstband;
        imin = 2*(i-1)+1;
        imax = 2*i;
        jmin = 2*(j-1)+1;
        jmax = 2*j;
        while band <= length(wzt)
            wzt{band}(imin:imax,jmin:jmax,layer) = 1;
            imin = 2*(imin-1)+1;
            imax = 2*imax;
            jmin = 2*(jmin-1)+1;
            jmax = 2*jmax;
            band = band+3;
        end
    end
end
