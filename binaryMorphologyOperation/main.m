img = imread('word_bw.bmp');
[row,col]=size(img);


subplot(3,2,1);
imshow(img);
title('原图像');

B=[0,0,0;1,1,1;0,0,0;];
img1=binary(img,'imerode',B);
subplot(3,2,2);
imshow(img1);
title('腐蚀');


img2 = binary(img,'imdilate',B);
subplot(3,2,3);
imshow(img2);
title('膨胀');

img3=binary(img,'imopen',B);
subplot(3,2,4);
imshow(img3);
title('开运算');

img4=binary(img,'imclose',B);
subplot(3,2,5);
imshow(img4);
title('闭运算');

B2=[1,1,1;0,0,0;0,0,0;];
img5 = binary(img,'miss',B,B2);
subplot(3,2,6);
imshow(img5);
title('击中击不中变换');

