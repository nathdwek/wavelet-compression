function img = wletrec(inCells, wlet)
        if ischar(wlet)
        [LPF, HPF] = wfilters(wlet, 'r');
    else
        LPF = wlet(1,:);
        HPF = wlet(2,:);
        end
    img = inCells{1};
    level = (length(inCells)-1)/3;
    for i = 1:level-1
        img = singlerec(img, inCells{3*i-1}, inCells{3*i}, inCells{3*i+1}, LPF, HPF, size(inCells{3*i+2}));
    end
    img = singlerec(img, inCells{3*level-1}, inCells{3*level}, inCells{3*level+1}, LPF, HPF, []);
end
