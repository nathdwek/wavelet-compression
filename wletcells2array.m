function singleblock = wletcells2array(wvecells)
    level = (length(wvecells)-1)/3;
    singleblock = [wcodemat(wvecells{1},255) wcodemat(wvecells{2},255); wcodemat(wvecells{3},255) wcodemat(wvecells{4},255)];
    for i = 2:level
        offset = 3*i-1;
        singleblock = [singleblock wcodemat(wvecells{offset},255);wcodemat(wvecells{offset+1},255) wcodemat(wvecells{offset+2},255)];
    end
end
