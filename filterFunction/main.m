function  main();
a = imread('lena_noise.bmp');
b = imread('lena_blur.bmp');
figure(1);
subplot(2,3,1);
imshow(ilpf(a,5));   %��a����׼��ͨ�˲�������ֹƵ��Ϊ5
title('��׼��ͨ�˲�����');
subplot(2,3,2);
imshow(blpf(a,5));   %��a��һ�װ�����˼��ͨ�˲�������ֹƵ��Ϊ5
title('һ�װ�����˼��ͨ�˲�����');
subplot(2,3,3);
imshow(elpf(a,5));   %��a������ָ����ͨ�˲�������ֹƵ��Ϊ5
title('����ָ����ͨ�˲�����');
subplot(2,3,4);
imshow(ihpf(b,1.4));  %��b����׼��ͨ�˲�������ֹƵ��Ϊ1.4
title('��׼��ͨ�˲�����');
subplot(2,3,5);
imshow(bhpf(b,3));    %��b��һ�װ�����˼��ͨ�˲�������ֹƵ��Ϊ3
title('һ�װ�����˼��ͨ�˲�����');
subplot(2,3,6);
imshow(ehpf(b,2));    %��b������ָ����ͨ�˲�������ֹƵ��Ϊ2
title('����ָ����ͨ�˲�����');

figure(2);
subplot(2,3,1);
imshow(ibpf(b,0,20));  %��b����׼��ͨ�˲�������ֹƵ�ʷֱ�Ϊ0��20
title('��׼��ͨ�˲�����');
subplot(2,3,2);
imshow(bbpf(b,0,8));    %��b��һ�װ�����˼��ͨ�˲�������ֹƵ�ʷֱ�Ϊ0��8
title('һ�װ�����˼��ͨ�˲�����');
subplot(2,3,3);
imshow(ibsf(b,0,2));    %��b����׼�����˲�������ֹƵ�ʷֱ�Ϊ0��2
title('��׼�����˲�����');
subplot(2,3,4);
imshow(bbsf(b,0,2));    %��b��һ�װ�����˼�����˲�������ֹƵ�ʷֱ�Ϊ0��2
title('һ�װ�����˼�����˲�����');
subplot(2,3,5);
imshow(fakecolor(a));    %��a��α��ɫ����
title('lenanoiseα��ɫ����');
subplot(2,3,6);
imshow(fakecolor(b));    %��b��α��ɫ����
title('lenablurα��ɫ����');