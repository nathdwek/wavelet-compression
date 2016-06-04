function segment = coderef(ref)
layerlims = find(ref==3);
segment = [];
for i = 1:length(layerlims)
    if i == 1
        lstart = 1;
    else
        lstart = layerlims(i-1)+1;
    end
    lend = layerlims(i)-1;
    layer = ref(lstart:lend);
    codedLength = dec2bin(length(layer)) - '0';
    codedLength = [zeros(1, 16 - length(codedLength)), codedLength];
    segment = [segment codedLength layer];
end
end
