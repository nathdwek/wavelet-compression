function [LL, LH, HL, HH] = wavelet(pic)
    %LL=A, LH = H, HL = V, HH = D
    [m,n,p] = size(pic);
    L = zeros(m,n,p);
    H = zeros(m,n,p);
    Ldown = zeros(m,n/2,p);
    Hdown = zeros(m,n/2,p);
    LLtmp = zeros(m,n/2,p);
    LHtmp = zeros(m,n/2,p);
    LL = zeros(m/2,n/2,p);
    LH = zeros(m/2,n/2,p);
    HLtmp = zeros(m,n/2,p);
    HHtmp = zeros(m,n/2,p);
    HL = zeros(m/2,n/2,p);
    HH = zeros(m/2,n/2,p);
    [LPF, HPF] = wfilters('bior4.4','d');
    for i =1:3
        L(:,:,i) = conv2(pic(:,:,i), LPF, 'same');
        Ldown(:,:,i) = dyaddown(L(:,:,i),0,'c');
        
        LLtmp(:,:,i) = conv2(Ldown(:,:,i), LPF, 'same');
        LL = dyaddown(LLtmp(:,:,i),0,'r');
        
        LHtmp(:,:,i) = conv2(Ldown(:,:,i), HPF, 'same');
        LH = dyaddown(LHtmp(:,:,i),0,'r');
        
        H(:,:,i) = conv2(pic(:,:,i), HPF, 'same');    
        Hdown(:,:,i) = dyaddown(H(:,:,i),0,'c');
        
        HLtmp(:,:,i) = conv2(Hdown(:,:,i), LPF, 'same');
        HL(:,:,i) = dyaddown(HLtmp(:,:,i),0,'r');
        HHtmp(:,:,i) = conv2(Hdown(:,:,i), HPF, 'same');
        HH(:,:,i) = dyaddown(HHtmp(:,:,i),0,'r');
    end
end