clear all; close all;

c = double(imread('castle.png'));
figure;
imshow(uint8(c))
figure;
yuv = frct(c)
imshow(uint8((irct(frct(c)))));
