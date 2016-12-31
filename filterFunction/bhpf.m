function subret = bhpf(sourmatrix, d0)
C = fft2(sourmatrix);
C = fftshift(C);
[row,col]=size(C);
n1 = fix(row/2);
n2 = fix(col/2);
for r =1 :row;
    for c =1 : col
        d = (n1-r)^2 + (n2-c)^2;
        if d == 0
            d  = 0.0000001;
        end
         h = 1/(1+d0^2/d);
         G(r,c) = C(r,c)*h;
     end
end
G = ifftshift(G) ;          
subret = ifft2(G);
subret = mat2gray(abs(real(subret)));
