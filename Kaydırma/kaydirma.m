%kaydirma
clear all
A=imread('C:\Users\HP\Desktop\GoruntuIsleme\Safari_RGB.jpg');
B=zeros(size(A));
B=uint8(B);
B=A;
sat=size(B)(1);
sut=size(B)(2);
xsh=70;
ysh=30;


for i=1:sat
  for j=1:sut
    ii=i-ysh;
        if (ii<1)
        ii=ii+sat;
        end
        jj=j+xsh;
        if (jj>sut)
        jj=jj-sut;
        end
    C(ii,jj,1)=B(i,j,1);
    C(ii,jj,2)=B(i,j,2);
    C(ii,jj,3)=B(i,j,3);
    end
    end
imwrite(C,'C:\Users\HP\Desktop\GoruntuIsleme\kaydirma.jpg');