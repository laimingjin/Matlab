function  main();
a = imread('lena_noise.bmp');
b = imread('lena_blur.bmp');
figure(1);
subplot(2,3,1);
imshow(ilpf(a,5));   %对a作标准低通滤波处理，截止频率为5
title('标准低通滤波处理');
subplot(2,3,2);
imshow(blpf(a,5));   %对a作一阶巴特沃思低通滤波处理，截止频率为5
title('一阶巴特沃思低通滤波处理');
subplot(2,3,3);
imshow(elpf(a,5));   %对a作二阶指数低通滤波处理，截止频率为5
title('二阶指数低通滤波处理');
subplot(2,3,4);
imshow(ihpf(b,1.4));  %对b作标准高通滤波处理，截止频率为1.4
title('标准高通滤波处理');
subplot(2,3,5);
imshow(bhpf(b,3));    %对b作一阶巴特沃思高通滤波处理，截止频率为3
title('一阶巴特沃思高通滤波处理');
subplot(2,3,6);
imshow(ehpf(b,2));    %对b作二阶指数高通滤波处理，截止频率为2
title('二阶指数高通滤波处理');

figure(2);
subplot(2,3,1);
imshow(ibpf(b,0,20));  %对b作标准带通滤波处理，截止频率分别为0、20
title('标准带通滤波处理');
subplot(2,3,2);
imshow(bbpf(b,0,8));    %对b作一阶巴特沃思带通滤波处理，截止频率分别为0、8
title('一阶巴特沃思带通滤波处理');
subplot(2,3,3);
imshow(ibsf(b,0,2));    %对b作标准带阻滤波处理，截止频率分别为0、2
title('标准带阻滤波处理');
subplot(2,3,4);
imshow(bbsf(b,0,2));    %对b作一阶巴特沃思带阻滤波处理，截止频率分别为0、2
title('一阶巴特沃思带阻滤波处理');
subplot(2,3,5);
imshow(fakecolor(a));    %对a作伪彩色处理
title('lenanoise伪彩色处理');
subplot(2,3,6);
imshow(fakecolor(b));    %对b作伪彩色处理
title('lenablur伪彩色处理');