clear all; close all;

c = double(imread('castle.png'));
yuv = frct(c);
w = wletdec(yuv,3,'bior4.4');
t = wletcells2array(w);
figure;
imshow(uint8(t(:,:,1)));

