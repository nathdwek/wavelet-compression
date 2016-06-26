function shifted = cshift(orig, shift, dir)

%Inspired by

% 2D Circular Shift
% 
% USAGE:
%    y = cshift2D(x, m)
% INPUT:
%    x - M by N array
%    m - amount of shift
% OUTPUT:
%    y - matrix x will be shifed by m samples down
%
% WAVELET SOFTWARE AT POLYTECHNIC UNIVERSITY, BROOKLYN, NY
% http://taco.poly.edu/WaveletSoftware/

[nr, nc] = size(orig);
if dir == 1
    n = 0:nr-1;
    n = mod(n-shift, nr);
    shifted = orig(n+1,:);
elseif dir == 2
    n = 0:nc-1;
    n = mod(n-shift, nc);
    shifted = orig(:,n+1);
end
end


