clear all; close all;

c = double(imread('castle.png'));
w = wletdec(c, 3, 'bior4.4');

for i = 1:length(w)
    w{i} = wcodemat(w{i}, 255);
end

imshow(uint8(wletcells2array(w)));
