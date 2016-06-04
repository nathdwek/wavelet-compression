function [im] = decoder(f, desiredTIters)
fileID = fopen([f '.gnj']);
asize = fread(fileID, [1 3], 'uint16');
initThresh = 2^fread(fileID, 1, 'uint8');
level = fread(fileID, 1, 'uint8');
bitstream = fread(fileID, 'ubit1');
fclose(fileID);
[sig, ref] = hufdecode(bitstream, desiredTIters, asize(3));
wq = iezw(sig, ref, initThresh, asize, level);
iyuv = wletrec(wq, 'bior4.4');
im = irct(iyuv);
end