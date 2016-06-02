function [image] = decoder(f)
fileID = fopen([f '.gnj']);
asize = fread(fileID, 3, 'uint16');
initThresh = fread(fileID, 1, 'uint8');
depth = fread(fileID, 1, 'uint8');
bitstream = fread(fileID, 'ubit1');
fclose(fileID);
[sig, ref] = hufdecode(bitstream);
image = iezw(sig, ref, initThresh, initThresh, asize, depth);
end