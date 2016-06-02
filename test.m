clear all; close all;
global wq;
MIN_THRESH = 50;
c = double(imread('castle.png'));
yuv = frct(c);
w = wletdec(yuv, 4, 'bior4.4');
[sig, ref, initThresh] = fezw(w, MIN_THRESH);
iyuv = wletrec(wq, 'bior4.4');
ic = irct(iyuv);
figure;
subplot(121)
imshow(uint8(c));
subplot(122);
imshow(uint8(ic));
title(sprintf('PSNR = %g', psnr(round(c),round(ic))));
