function rgb = irct(yuvr)
    yr = yuvr(:,:,1);
    ur = yuvr(:,:,2);
    vr = yuvr(:,:,3);
    
    g = yr - floor((ur+vr)./4);
    b = ur + g;
    r = vr + g;
    
    rgb = cat(3, r, g, b);
end
