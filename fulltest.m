clear all; close all;

MIN_THRESH = 16;
LEVEL = 5;
LOGRESCALE = 0;
IMAGE = 'castle.png';
OIMAGE = 'castle';

c = double(imread(IMAGE));

[wq, initThresh, sig, ref] = encoder(c, OIMAGE, LEVEL, LOGRESCALE, MIN_THRESH);

iyuv = wletrec(wq, 'bior4.4');
ic = irct(iyuv);
figure;
subplot(121)
imshow(touint8(c));
subplot(122);
imshow(touint8(ic));

outFile = dir([OIMAGE '.gnj']);
fsize = ceil(outFile.bytes/1000);
[sx, sy, ~] = size(c);
[sxout, syout, ~] = size(ic);
t = sprintf('Original size: %d x %d\nRescaled: %d x %d', sx, sy, sxout, syout);
t = [t sprintf('\nQuantization: %g%%', 100*MIN_THRESH/initThresh)];
t = [t sprintf('\n Estimated compressed file size: %d kB', fsize)];
t = [t sprintf('\n Compression ratio (compared to raw size): %g', numel(c)/(1000*fsize))]; 
if LOGRESCALE == 0
    t = [t sprintf('\nPSNR = %g', psnr(round(c),round(ic)))];
end
title(t);