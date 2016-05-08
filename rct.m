function rgb = rct(yuvr)
    yr = yuvr(:,:,1);
    ur = yuvr(:,:,2);
    vr = yuvr(:,:,3);
    g = yr - floor((ur+vr)./4);
    r = vr + g;
    b = ur + g;
    rgb = cat(3, r, g, b);
end
