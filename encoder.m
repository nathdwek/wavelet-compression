function [bitstream] = encoder(im, f)
yuv = frct(im);
w = wletdec(yuv, 4, 'bior4.4');
[sig, ref, initThresh] = fezw(w, MIN_THRESH);

bitstream = hufcode(sig,ref, initThresh);

fileID = fopen([f '.gnj'],'w');
fwrite(fileID,bitstream,'ubit1');
fclose(fileID);
end
