img = imread('word_bw.bmp');
[row,col]=size(img);


subplot(3,2,1);
imshow(img);
title('ԭͼ��');

B=[0,0,0;1,1,1;0,0,0;];
img1=binary(img,'imerode',B);
subplot(3,2,2);
imshow(img1);
title('��ʴ');


img2 = binary(img,'imdilate',B);
subplot(3,2,3);
imshow(img2);
title('����');

img3=binary(img,'imopen',B);
subplot(3,2,4);
imshow(img3);
title('������');

img4=binary(img,'imclose',B);
subplot(3,2,5);
imshow(img4);
title('������');

B2=[1,1,1;0,0,0;0,0,0;];
img5 = binary(img,'miss',B,B2);
subplot(3,2,6);
imshow(img5);
title('���л����б任');

