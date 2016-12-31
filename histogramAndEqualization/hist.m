I = imread('lena.png');
I = rgb2gray(I);
[height,width]=size(I);
figure
subplot(2,2,1);
imshow(I);
subplot(2,2,2);
imhist(I);

NumPixel=zeros(1,256);
for i=1:height
  for j=1:width
      NumPixel(I(i,j)+1)= NumPixel(I(i,j)+1)+1;
  end
end

ProbPixel=zeros(1,256);
for i=1:256
    ProbPixel(i)=NumPixel(i)/(height*width*1.0);
end

CumuPixel=zeros(1,256);
for i= 1:256
    if i==1
        CumuPixel(i)=ProbPixel(i);
    else
        CumuPixel(i)=CumuPixel(i-1)+ProbPixel(i);
    end
end

CumuPixel = uint8(255 .* CumuPixel + 0.5);  
for i=1:height
  for j=1:width
      I(i,j)=CumuPixel(I(i,j));
  end
end

subplot(2,2,3);
imshow(I);
subplot(2,2,4);
imhist(I);
