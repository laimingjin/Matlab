
Image=imread('3.png');

% �ԶԻ������ʽѡ���һ��ͼ��

[M,N,nDims]=size(Image);

Image=im2double(Image);

% ��ȡͼ��ĳߴ�Ͳ�����

%�Ҷ�����

ImageStretch=Image;

for i=1:nDims  % ��ÿ���������ν��лҶ�����

    Sp=Image(:,:,i);

    MaxDN=max(max(Sp));

    MinDN=min(min(Sp));

    Sp=(Sp-MinDN)/(MaxDN-MinDN);  % �Ҷ����칫ʽ

    ImageStretch(:,:,i)=Sp;

end

% ���Ҷ�������������ImageStretch��

%�������

figure  % ��ͬһ������ʾԭͼ��Ҷ�������ͼ

if nDims==3||nDims==1  % ��Ϊ�Ҷ�ͼ��RGB���ɫͼ���Գ��淽ʽ���沢���

    subplot(1,2,1),imshow(Image);title('ԭͼ');

    subplot(1,2,2),imshow(ImageStretch);title('�Ҷ�����');

   % imwrite(ImageStretch,'Result_Stretch.jpg','jpeg');

else  % ��Ϊ�ನ��ң��Ӱ������TM 3,2,1�����ʽ���沢���

    subplot(1,2,1),imshow(Image(:,:,[3,2,1]));title('ԭͼ');

    subplot(1,2,2),imshow(ImageStretch(:,:,[3,2,1]));title('�Ҷ�����');

    imwrite(ImageStretch(:,:,[3,2,1]),'Result_Stretch.tif','tiff');

end

% ����������������ǰĿ¼����Result_Stretch����