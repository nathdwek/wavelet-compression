function [initThresh] = encoder(im, f, level, logrescale, minthresh)
yuv = frct(im);

w = wletdec(yuv, level, 'bior4.4');
w = w(1:3*(level-logrescale)+1);

[sig, ref, initThresh, wq] = fezw(w, minthresh);

bitstream = hufcode(sig,ref);

fileID = fopen([f '.gnj'], 'w');
fwrite(fileID, size(w{1}), 'uint16');
fwrite(fileID, log2(initThresh), 'uint8');
fwrite(fileID, level-logrescale, 'uint8');
fwrite(fileID, bitstream,'ubit1');
fclose(fileID);
end
