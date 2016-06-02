function replica = samestruct(orig, initvalue)
    replica = cell(size(orig));
    for i = 1:length(replica)
        replica{i} = initvalue*ones(size(orig{i}));
    end
end
