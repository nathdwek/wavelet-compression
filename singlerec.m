function img = singlerec(A, H, V, D, LPF, HPF)
    if size(LPF,1) > 1
        LPF = LPF';
    end
    if size(HPF,1) > 1
        HPF = HPF';
    end
    o = size(A,3);
    for i =1:o
        img(:,:,i) = idwt2(A(:,:,i), H(:,:,i), V(:,:,i), D(:,:,i), LPF, HPF,'mode','per');
    end
end
