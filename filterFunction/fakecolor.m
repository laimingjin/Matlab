function subret = fakecolor(sourmatrix)
rgb(:,:,1) =  ilpf(sourmatrix,5);
rgb(:,:,2) =  ibpf(sourmatrix,4,20);
rgb(:,:,3) =  ihpf(sourmatrix,50);
subret = rgb;