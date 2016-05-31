function [bitstream] = encoder(im, f)
yuv = frct(im);
w = wletdec(yuv, 4, 'bior4.4');

bitstream = randi([0, 1], 1, 64);

fileID = fopen([f '.gnj'],'w');
fwrite(fileID,bitstream,'ubit1');
fclose(fileID);
end