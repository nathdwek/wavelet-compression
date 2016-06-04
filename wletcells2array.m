function singleblock = wletcells2array(wvecells)
    level = (length(wvecells)-1)/3;
    singleblock = [wvecells{1} wvecells{2}; wvecells{3} wvecells{4}];
    for i = 2:level
        offset = 3*i-1;
        singleblock = [singleblock wvecells{offset};wvecells{offset+1} wvecells{offset+2}];
    end
end
