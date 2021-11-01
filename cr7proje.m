% Örnek dosyanýn 3x3 konvolüsyon ile Sobel Filtresini alan fonksiyon

clear all;
A1 = imread ('C:\Users\HP\Desktop\GoruntuIsleme\yesil.jpg');
A2 = rgb2hsv(A1);
sat=size(A2)(1);
sut=size(A2)(2);

A=uint8(255*A2(:,:,1));
esik=20;
A3=0;
for i=1:sat
  for j=1:sut
  if A(i,j)>esik 
    A3(i,j)=1;
  else 
    A3(i,j)=0;
  end
  end
end
imwrite(A3,'C:\Users\HP\Desktop\GoruntuIsleme\yesil_Hmask.jpg');

A=uint8(255*A2(:,:,2));
esik=60
for i=1:sat
  for j=1:sut
  if A(i,j)>esik 
    A4(i,j)=1;
  else 
    A4(i,j)=0;
  end
  end
end
%imwrite(A4,'C:\Users\HP\Desktop\GoruntuIsleme\yesil_Smask.jpg');

Amsk1=0;
Amsk1= (A3.*A4);
% küçük yamalarý yok etmek için bwareaopen(Amsk,25) iþlemi yapýlýr
% 25 bitiþik beyaz piksellerin eþik deðeridir. Daha az sayýda olanlar karartýlýr
%Amsk1 = imclearborder(Amsk1);
Amsk1 = bwareaopen(Amsk1,60);


%imwrite(255*Amsk1,'C:\Users\HP\Desktop\GoruntuIsleme\top_Full_Mask2.jpg');

%A=A2(:,:,3);
A=uint8(255*A2(:,:,3));
esik=140
for i=1:sat
  for j=1:sut
  if A(i,j)>esik 
    A5(i,j)=1;
  else 
    A5(i,j)=0;
  end
  end
end
%imwrite(A5,'C:\Users\HP\Desktop\GoruntuIsleme\top_V.jpg');
AA=0;
AA = (Amsk1.*A5);
AA = bwareaopen(AA,60);
%imwrite(AA,'C:\Users\HP\Desktop\GoruntuIsleme\top_3lumask.jpg');


A1(:,:,1)=AA.*A1(:,:,1);
A1(:,:,2)=AA.*A1(:,:,2);
A1(:,:,3)=AA.*A1(:,:,3);
%imwrite(A1,'C:\Users\HP\Desktop\GoruntuIsleme\top_maskelenmemiþ.jpg');



%imwrite(A1,'C:\Users\HP\Desktop\GoruntuIsleme\cr7_masked.jpg');
