function [A,Hz,Vt,D] = singledec(img,LPF,HPF)
    if size(LPF,1) > 1
        LPF = LPF';
    end
    if size(HPF,1) > 1
        HPF = HPF';
    end
    n = size(img,3);
    for i =1:n
        L = conv2(img(:,:,i), LPF', 'same');
        L = dyaddown(L,0,'c');

        H = conv2(img(:,:,i), HPF', 'same');
        H = dyaddown(H,0,'c');

        LL = conv2(L, LPF, 'same');
        A(:,:,i) = dyaddown(LL,0,'r');

        LH = conv2(L, HPF, 'same');
        Hz(:,:,i) = dyaddown(LH,0,'r');

        HL = conv2(H, LPF, 'same');
        Vt(:,:,i) = dyaddown(HL,0,'r');

        HH = conv2(H, HPF, 'same');
        D(:,:,i) = dyaddown(HH,0,'r');
    end
end
