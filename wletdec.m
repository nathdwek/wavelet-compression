function outCell = wletdec(img, level, wlet)
    if ischar(wlet)
        [LPF, HPF] = wfilters(wlet, 'd')
    else
        LPF = wlet(1,:);
        HPF = wlet(2,:);
    end
    outCell = cell(3*level+1,1);
    A = img;
    for i = 1:level
        [A,H,V,D] = singledec(A,LPF,HPF);
        outCell(end-3*i+1:end-3*(i-1)) = {H,V,D};
    end
    outCell{1} = A;
end
