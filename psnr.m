function psnr = psnr(orig, compressed)
    psnr = 10 * log10(max(max(max(orig)))^2*numel(orig)/sum(sum(sum((compressed - orig).^2))));
end
