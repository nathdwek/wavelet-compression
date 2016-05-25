function img = singlerec(A, H, V, D, LPF, HPF, sze)
    if size(LPF,1) > 1
        LPF = LPF';
    end
    if size(HPF,1) > 1
        HPF = HPF';
    end
    [~,~,o] = size(A);
    for i =1:o
        t = size(A(:,:,i))
        t = size(H(:,:,i))
        t =size(V(:,:,i))
        t = size(D(:,:,i))
        if ~isempty(sze)
            img(:,:,i) = idwt2(A(:,:,i), H(:,:,i), V(:,:,i), D(:,:,i), LPF, HPF, sze(1:2));
        else
            img(:,:,i) = idwt2(A(:,:,i), H(:,:,i), V(:,:,i), D(:,:,i), LPF, HPF);
        end
    end
end
