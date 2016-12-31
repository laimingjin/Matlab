function subret = blpf(sourmatrix, d0)
C = fft2(sourmatrix);
C = fftshift(C);
[row,col]=size(C);
n1 = fix(row/2);
n2 = fix(col/2);
for r =1 :row;
    for c =1 : col
         h = 1/(1+((n1-r)^2+(n2-c)^2)/d0^2);
         G(r,c) = C(r,c)*h;
     end
end
G = ifftshift(G) ;          
subret = ifft2(G);
subret = mat2gray(abs(real(subret)));