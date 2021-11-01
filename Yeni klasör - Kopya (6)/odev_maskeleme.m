% �rnek dosyan�n 3x3 konvol�syon ile Sobel Filtresini alan fonksiyon

clear all;
A1 = imread ('C:\Users\HP\Desktop\GoruntuIsleme\yesiltop3.jpg');
A2 = rgb2hsv(A1);
sat=size(A2)(1);
sut=size(A2)(2);

A=uint8(255*A2(:,:,1));
esik=120;
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
imwrite(A3,'C:\Users\HP\Desktop\GoruntuIsleme\yesiltop3_Hmask.jpg');

A=uint8(255*A2(:,:,2));
esik=120
for i=1:sat
  for j=1:sut
  if A(i,j)>esik 
    A4(i,j)=1;
  else 
    A4(i,j)=0;
  end
  end
end
imwrite(A4,'C:\Users\HP\Desktop\GoruntuIsleme\yesiltop3_Smask.jpg');

Amsk=0;
Amsk= (A3.*A4);
% k���k yamalar� yok etmek i�in bwareaopen(Amsk,25) i�lemi yap�l�r
% 25 biti�ik beyaz piksellerin e�ik de�eridir. Daha az say�da olanlar karart�l�r
Amsk = bwareaopen(Amsk,25);
imwrite(255*Amsk,'C:\Users\HP\Desktop\GoruntuIsleme\yesiltop3_Fullmask.jpg');

A=A2(:,:,3);
imwrite(A,'C:\Users\HP\Desktop\GoruntuIsleme\yesiltop3_V.jpg');

A1(:,:,1)=Amsk.*A1(:,:,1);
A1(:,:,2)=Amsk.*A1(:,:,2);
A1(:,:,3)=Amsk.*A1(:,:,3);
imwrite(A1,'C:\Users\HP\Desktop\GoruntuIsleme\yesiltop3_maskelenmis.jpg');