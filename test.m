clear all; close all;

c = double(imread('castle.png'));
yuv = frct(c);
w = wletdec(yuv, 4, 'bior4.4');
iyuv = wletrec(w, 'bior4.4');
ic = irct(iyuv);
figure;
subplot(121)
imshow(uint8(c));
subplot(122);
imshow(uint8(ic));
title(sprintf('PSNR = %g', psnr(round(c),round(ic))))
