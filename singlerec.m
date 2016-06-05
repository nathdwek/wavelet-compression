function img = singlerec(A, H, V, D, LPF, HPF)
    if size(LPF,1) > 1
        LPF = LPF';
    end
    if size(HPF,1) > 1
        HPF = HPF';
    end
    [nr, nc, nl] = size(A);
for layer = 1:nl
    aup = zeros(nr, 2*nc);
    aup(:,1:2:end) = A(:,:,layer);
    hup = zeros(nr, 2*nc);
    hup(:,1:2:end) = H(:,:,layer);
    vtlo = conv2(aup,LPF )+conv2(hup,HPF);
    L = length(LPF);
    vtlo(:, 1:L-2) = vtlo(:,1:L-2) + vtlo(:, 2*nc+(1:L-2));
    vtlo = vtlo(:,1:2*nc);
    vtlo = cshift(vtlo, 1-L/2, 2);

    vup = zeros(nr, 2*nc);
    vup(:,1:2:end) = V(:,:,layer);
    dup = zeros(nr, 2*nc);
    dup(:,1:2:end) = D(:,:,layer);
    vthi = conv2(vup,LPF)+conv2(dup,HPF);
    vthi(:, 1:L-2) = vthi(:,1:L-2) + vthi(:, 2*nc+(1:L-2));
    vthi = vthi(:,1:2*nc);
    vthi = cshift(vthi, 1-L/2, 2);

    vtloup = zeros(2*nr,2*nc);
    vtloup(1:2:end,:) = vtlo;
    vthiup = zeros(2*nr,2*nc);
    vthiup(1:2:end,:) = vthi;

    layerout = conv2(vtloup,LPF')+conv2(vthiup,HPF');
    layerout(1:L-2,:) = layerout(1:L-2,:) + layerout(2*nr+(1:L-2), :);
    layerout = layerout(1:2*nr, :);
    layerout = cshift(layerout, 1-L/2, 1);

    img(:,:,layer) = layerout;
end

end
