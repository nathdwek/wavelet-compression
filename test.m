clear all; close all;
global wq;
MIN_THRESH = 8;
LEVELIN = 3;
LOGSCALING = 0;
c = double(imread('castle.png'));
yuv = frct(c);
w = wletdec(yuv, LEVELIN, 'bior4.4');
w = w(1:3*(LEVELIN-LOGSCALING)+1);
[sig, ref, initThresh] = fezw(w, MIN_THRESH);
iyuv = wletrec(wq, 'bior4.4');
ic = irct(iyuv);
figure;
subplot(121)
imshow(touint8(c));
subplot(122);
imshow(touint8(ic));

fsize = estimateFSize(sig, ref);
[sx, sy, ~] = size(c);
[sxout, syout, ~] = size(ic);
t = sprintf('Original size: %d x %d\nRescaled: %d x %d', sx, sy, sxout, syout);
t = [t sprintf('\nQuantization: %g%%', 100*MIN_THRESH/initThresh)];
t = [t sprintf('\n Estimated compressed file size: %d kB', fsize)];
t = [t sprintf('\n Compression ratio (compared to raw size): %g', numel(c)/(1000*fsize))]; 
if LOGSCALING == 0
    t = [t sprintf('\nPSNR = %g', psnr(round(c),round(ic)))];
end
title(t);
