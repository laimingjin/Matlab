function subret = ihpf(sourmatrix,d0)
C = fft2(sourmatrix);
C = fftshift(C);
[row,col]=size(C);
n1 = fix(row/2);
n2 = fix(col/2);
for r = 1:row
    for c =1:col
        d = sqrt((r-n1)^2 + (c-n2)^2);
        if d > d0
            G(r,c) = C(r,c);
        else
            G(r,c) = 0;
        end
    end
end
G = ifftshift(G) ;          
subret = ifft2(G);
subret = mat2gray(abs(real(subret)));
