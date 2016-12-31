function outPic = binary( inPic, type , B ,B2)
% :������ʵ����̬������,ͨ����ͬ����type,�Լ��ṹԪ�غ�����
% :����
% :     inPic:����ͼ��
% :     type:�������
% :         imdilate:���ʹ���
% :         imerode:��ʴ����
% :         imopen:������
% :         imclose:������
% :         miss:���л����б任
% :     B:�ṹԪ��1
% :     B2:�ṹԪ��2
% :���
% :     ����typeѡ���Ӧ�ṹ
[row,col]=size(inPic);
outPic=zeros(row,col);
[b_row,b_col]=size(B);
mid_Y=floor((b_col+1)/2);                             %ȡԭ��
mid_X=floor((b_row+1)/2);                             %ȡԭ��

if strcmp(type, 'imdilate') % :imdilate:���ʹ���
for i=1:row
    for j=1:col
        if(inPic(i,j)==1)
            for k=1:b_row
                for l=1:b_col
                    if ((mid_X-k)<i)&&((mid_Y-l)<j)&&(((k-mid_X)<(row+1-i)))&&(((l-mid_Y)<(col+1-j)))      %�ж��Ƿ���磬�����򲻽�������
                        if B(k,l)==1 
                            outPic(i+k-mid_X,j+l-mid_Y)=1;                                              %����λ�Ʋ���
                        end
                    end
                end
            end
        end
    end
end
end

if strcmp(type, 'imerode')% : imerode:��ʴ����
for i=1:row
    for j=1:col
        match=true;            
            for k=1:b_row
                for l=1:b_col
                    if ((mid_X-k)<i)&&((mid_Y-l)<j)&&(((k-mid_X)<(row+1-i)))&&(((l-mid_Y)<(col+1-j)))       %�ж��Ƿ�Խ��
                        if B(k,l)==1&&inPic(i+k-mid_X,j+l-mid_Y)~=1                                        %�жϽṹԪ����Ϊ1��λ����BW�Ķ�Ӧλ�õ�ֵ�Ƿ��Ϊ1
                            match=false;                                                                %��Ϊ1��match��Ϊfalse
                        end
                    end
                end
            end
         if (match==true)                           %��match��Ϊtrueʱ�����������Ķ�Ӧλ��Ϊ1
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
