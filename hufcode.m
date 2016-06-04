function bitstream = hufcode(sig, ref)
    bitstream = [];
    siglims = find(sig == 4);
    reflims = find(ref == 4);
    for i = 1:length(siglims)
       if i == 1
           sigstart = 1;
           refstart = 1;
       else
           sigstart = siglims(i-1)+1;
           refstart = reflims(i-1)+1;
       end
       bitstream = [bitstream hufsig(sig(sigstart:siglims(i)-1)) coderef(ref(refstart:reflims(i)-1))];
    end
end
