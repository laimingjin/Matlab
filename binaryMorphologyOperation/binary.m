function outPic = binary( inPic, type , B ,B2)
% :本程序实现形态化处理,通过不同参数type,以及结构元素和算子
% :输入
% :     inPic:输入图像
% :     type:检测算子
% :         imdilate:膨胀处理
% :         imerode:腐蚀处理
% :         imopen:开运算
% :         imclose:闭运算
% :         miss:击中击不中变换
% :     B:结构元素1
% :     B2:结构元素2
% :输出
% :     根据type选择对应结构
[row,col]=size(inPic);
outPic=zeros(row,col);
[b_row,b_col]=size(B);
mid_Y=floor((b_col+1)/2);                             %取原点
mid_X=floor((b_row+1)/2);                             %取原点

if strcmp(type, 'imdilate') % :imdilate:膨胀处理
for i=1:row
    for j=1:col
        if(inPic(i,j)==1)
            for k=1:b_row
                for l=1:b_col
                    if ((mid_X-k)<i)&&((mid_Y-l)<j)&&(((k-mid_X)<(row+1-i)))&&(((l-mid_Y)<(col+1-j)))      %判断是否出界，出界则不进行运算
                        if B(k,l)==1 
                            outPic(i+k-mid_X,j+l-mid_Y)=1;                                              %进行位移操作
                        end
                    end
                end
            end
        end
    end
end
end

if strcmp(type, 'imerode')% : imerode:腐蚀处理
for i=1:row
    for j=1:col
        match=true;            
            for k=1:b_row
                for l=1:b_col
                    if ((mid_X-k)<i)&&((mid_Y-l)<j)&&(((k-mid_X)<(row+1-i)))&&(((l-mid_Y)<(col+1-j)))       %判断是否越界
                        if B(k,l)==1&&inPic(i+k-mid_X,j+l-mid_Y)~=1                                        %判断结构元素上为1的位置上BW的对应位置的值是否均为1
                            match=false;                                                                %不为1则将match设为false
                        end
                    end
                end
            end
         if (match==true)                           %当match不为true时，将结果矩阵的对应位置为1
                outPic(i,j)=1;
         end
    end
end
end

if strcmp(type, 'imopen')  
outPic = binary(inPic,'imerode',B);
outPic = binary(outPic,'imdilate',B);
end

if strcmp(type, 'imclose')  
outPic = binary(inPic,'imdilate',B);
outPic = binary(outPic,'imerode',B);
end

if strcmp(type, 'miss')  
tmp = binary(inPic,'imerode',B);
for i=1:row
    for j=1:col
        if(inPic(i,j)==1)
            inPic(i,j)=0;
        else
            inPic(i,j)=1;
        end
    end
end
tmp2 = binary(inPic,'imerode',B2);
for i=1:row
    for j=1:col
        if(tmp(i,j)==1&&tmp2(i,j)==1)
            outPic(i,j)=1;
        end
    end
end
end
