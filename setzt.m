function wzt = setzt(wzt,subidx,i,j,layer)
if subidx == 1
    [m,n,~] = size(wzt{1});
    if i > m/2
        i = floor(i/2);
        if j > n/2
            j = floor(j/2);
            firstband = 4;
        else
            firstband = 3;
        end
    else
        j = floor(j/2);
        firstband = 2;
    end
else
    firstband = subidx+3;
end

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
