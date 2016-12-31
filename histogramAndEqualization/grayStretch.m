
Image=imread('3.png');

% 以对话框的形式选择打开一幅图像

[M,N,nDims]=size(Image);

Image=im2double(Image);

% 获取图像的尺寸和波段数

%灰度拉伸

ImageStretch=Image;

for i=1:nDims  % 对每个波段依次进行灰度拉伸

    Sp=Image(:,:,i);

    MaxDN=max(max(Sp));

    MinDN=min(min(Sp));

    Sp=(Sp-MinDN)/(MaxDN-MinDN);  % 灰度拉伸公式

    ImageStretch(:,:,i)=Sp;

end

% 将灰度拉伸结果保存在ImageStretch中

%保存输出

figure  % 在同一窗口显示原图与灰度拉伸结果图

if nDims==3||nDims==1  % 若为灰度图和RGB真彩色图则以常规方式保存并输出

    subplot(1,2,1),imshow(Image);title('原图');

    subplot(1,2,2),imshow(ImageStretch);title('灰度拉伸');

   % imwrite(ImageStretch,'Result_Stretch.jpg','jpeg');

else  % 若为多波段遥感影像则按照TM 3,2,1组合形式保存并输出

    subplot(1,2,1),imshow(Image(:,:,[3,2,1]));title('原图');

    subplot(1,2,2),imshow(ImageStretch(:,:,[3,2,1]));title('灰度拉伸');

    imwrite(ImageStretch(:,:,[3,2,1]),'Result_Stretch.tif','tiff');

end

% 将拉伸结果保存至当前目录并以Result_Stretch命名