clear all; close all;
thresh_vect = [128, 64, 32, 16, 8, 4, 2, 1];
CR= [];
psnrs = [];
quant = [];

LEVEL = 5;
LOGRESCALE = 0;
IMAGE = 'castle.png';
OIMAGE = 'castle';
DESIRED_TITERS = 10;

c = double(imread(IMAGE));

for MIN_THRESH=thresh_vect
    initThresh = encoder(c, OIMAGE, LEVEL, LOGRESCALE, MIN_THRESH);
    [ic] = decoder(OIMAGE, DESIRED_TITERS);
    outFile = dir([OIMAGE '.gnj']);
    fsize = ceil(outFile.bytes/1000);
    CR(end+1) = numel(c)/(1000*fsize);
    psnrs(end+1) = psnr(round(c),round(ic));
    quant(end+1) = 100*MIN_THRESH/initThresh;
end

f=figure;
p=plot(psnrs, CR, '-o');
set(get(get(p,'Annotation'),'LegendInformation'),'IconDisplayStyle','off');
title('Compression Ratio vs PSNR for thresholds = 128, 64, 32, 16, 8, 4, 2, 1')
xlabel('PSNR [dB]');
ylabel('Compression Ratio');
legend('-DynamicLegend');
set(findall(f,'-property','FontSize'),'FontSize',17);
set(findall(f,'-property','FontName'),'FontName', 'Helvetica');
grid on;

