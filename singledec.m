function [A,H,V,D] = singledec(img,LPF,HPF)
    if size(LPF,1) > 1
        LPF = LPF';
    end
    if size(HPF,1) > 1
        HPF = HPF';
    end
    n = size(img,3);
    for i =1:n
        [a_, h_, v_, d_] = dwt2(img(:,:,i), LPF, HPF, 'mode','per');
        A(:,:,i) = a_;
        H(:,:,i) = h_;
        V(:,:,i) = v_;
        D(:,:,i) = d_;
    end
end
