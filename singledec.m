function [A,H,V,D] = singledec(img,LPF,HPF)
if size(LPF,1) > 1
    LPF = LPF';
end
if size(HPF,1) > 1
    HPF = HPF';
end
L = length(LPF)/2;
[nr, nc, nl] = size(img);
for layer = 1:nl
    imglayer = cshift(img(:,:,layer), -L, 2);

    convresult = conv2(imglayer, LPF);
    hzlo = convresult(:,1:2:end);
    hzlo(:, 1:L) = hzlo(:, 1:L) + hzlo(:,(1:L)+nc/2);
    hzlo = hzlo(:,1:nc/2);

    convresult = conv2(imglayer, HPF);
    hzhi = convresult(:,1:2:end);
    hzhi(:, 1:L) = hzhi(:, 1:L) + hzhi(:,(1:L)+nc/2);
    hzhi = hzhi(:,1:nc/2);

    hzlo = cshift(hzlo, -L, 1);
    hzhi = cshift(hzhi, -L, 1);

    convresult = conv2(hzlo, LPF');
    alayer = convresult(1:2:end,:);
    alayer(1:L, :) = alayer(1:L, :) + alayer((1:L)+nr/2, :);
    A(:,:,layer) = alayer(1:nr/2,:);

    convresult = conv2(hzhi, LPF');
    hlayer = convresult(1:2:end,:);
    hlayer(1:L, :) = hlayer(1:L, :) + hlayer((1:L)+nr/2, :);
    H(:,:,layer) = hlayer(1:nr/2,:);

    convresult = conv2(hzlo, HPF');
    vlayer = convresult(1:2:end,:);
    vlayer(1:L, :) = vlayer(1:L, :) + vlayer((1:L)+nr/2, :);
    V(:,:,layer) = vlayer(1:nr/2,:);

    convresult = conv2(hzhi, HPF');
    dlayer = convresult(1:2:end,:);
    dlayer(1:L, :) = dlayer(1:L, :) + dlayer((1:L)+nr/2, :);
    D(:,:,layer) = dlayer(1:nr/2,:);
end
end
