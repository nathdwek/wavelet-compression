clear all; close all;

c = double(imread('castle.png'));
figure;
imshow(uint8(c))
% figure;
% yuv = frct(c)
% imshow(uint8((irct(frct(c)))));

[LL, LH, HL, HH] = wavelet(c);

figure
subplot(221)
imshow(uint8(LL))
title('LL')
subplot(222)
imshow(uint8(LH))
title('LH')
subplot(223)
imshow(uint8(HL))
title('HL')
subplot(224)
imshow(uint8(HH))
title('HH')