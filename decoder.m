function [image] = decoder(f)
fileID = fopen([f '.gnj']);
image = fread(fileID, 'ubit1');
fclose(fileID);
end