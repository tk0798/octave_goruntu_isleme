%Dönem Sonu Projesi 4
clear all;
pkg load image;
A1 = imread ('C:\Users\HP\Desktop\GoruntuIsleme\yesiltop10.jpg');
figure  1,imshow(A1); title('Ýlk Hali');
A2 = rgb2hsv(A1);
sat=size(A2)(1);
sut=size(A2)(2);

A=uint8(255*A2(:,:,1));
esik=62;
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
figure  2,imshow(A3); title('Hue Uzayý');
A3 = bwareaopen(A3,200);
figure  21,imshow(A3); title('Hue bwareaopen Uzayý');
A3 = imcomplement(A3);
figure  22,imshow(A3); title('Hue imcomplement Uzayý');

A3 = imfill(A3,'holes');
figure  23,imshow(A3); title('Hue imfill Uzayý');

A=uint8(255*A2(:,:,2));
esik=50
for i=1:sat
  for j=1:sut
  if A(i,j)>esik 
    A4(i,j)=1;
  else 
    A4(i,j)=0;
  end
  end
end
figure  3,imshow(A4); title('Saturation Uzayý');

A4 = imcomplement(A4);
figure  31,imshow(A4); title('Saturation imcomplement Uzayý');
%A4 = imfill(A4,'holes');
%figure  32,imshow(A4); title('Saturation imfill Uzayý');
A4 = bwareaopen(A4,400);
figure  33,imshow(A4); title('Saturation bwareaopen Uzayý');

A=uint8(255*A2(:,:,3));
esik=150
for i=1:sat
  for j=1:sut
  if A(i,j)>esik 
    A8(i,j)=1;
  else 
    A8(i,j)=0;
  end
  end
end
figure 4,imshow(A8), title('Value Uzayý');

A8 = bwareaopen(A8,120);
figure  41,imshow(A8); title('Value bwareaopen Uzayý');

%A8 = imfill(A8,'holes');
%figure  42,imshow(A8); title('Value imfill Uzayý');
Amsk1=0;
Amsk1= (A3.*A4);
%Amsk1 = (A3.*Amsk1);
Amsk1 = bwareaopen(Amsk1,200);

figure  5,imshow(Amsk1); title('Hue uzayý ve Saturation uzayý çarpýmý');
Amsk2=0;
%Amsk2= (A3.*A4);
Amsk2 = (A8.*Amsk1);
Amsk2 = bwareaopen(Amsk2,250);
Amsk2 = bwareaopen(Amsk2,600);
figure  85,imshow(Amsk2); title('3 uzayý çarpýmý');

A10(:,:,1)=Amsk2.*A1(:,:,1);
A10(:,:,2)=Amsk2.*A1(:,:,2);
A10(:,:,3)=Amsk2.*A1(:,:,3);
figure  86,imshow(A10); title('3 uzayý çarpýmý SON HALÝ');

A1(:,:,1)=Amsk1.*A1(:,:,1);
A1(:,:,2)=Amsk1.*A1(:,:,2);
A1(:,:,3)=Amsk1.*A1(:,:,3);

figure  9,imshow(A1); title('Son Hali');


