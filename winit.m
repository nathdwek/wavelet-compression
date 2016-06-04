function w = winit(asize, depth, initval)
    w = cell(3*depth+1, 1);
    w{1} = initval*ones(asize);
    for i = 0:depth-1
        for j = 1:3
            w{3*i+j+1} = initval*ones(asize);
        end
        asize(1:2) = 2*asize(1:2);
    end
end
