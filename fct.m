function yuvr = fct(rgb)
    r = rgb(:,:,1);
    g = rgb(:,:,2);
    b = rgb(:,:,3);
    yr = floor((r+2.*g+b)./4);
    ur = b - g;
    vr = r - g;
    yuvr = cat(3, yr, ur, vr);
end
