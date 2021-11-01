%Dönem Sonu Projesi 1
clear all;
pkg load image;
A1 = imread ('C:\Users\HP\Desktop\GoruntuIsleme\yesiltop6.jpg');
figure  1,imshow(A1); title('Ýlk Hali');
A2 = rgb2hsv(A1);
sat=size(A2)(1);
sut=size(A2)(2);

A=uint8(255*A2(:,:,1));
esik=59;
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
%A3 = imfill(A3,'holes');
figure  2,imshow(A3); title('Hue Uzayý');
%A3 = imcomplement(A3);
%figure  21,imshow(A3); title('Hue imcomplement Uzayý');

A=uint8(255*A2(:,:,2));
esik=155
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
A4 = imfill(A4,'holes');
figure  32,imshow(A4); title('Saturation imfill Uzayý');

A=uint8(255*A2(:,:,3));
esik=177
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

A8 = imfill(A8,'holes');
figure  42,imshow(A8); title('Value imfill Uzayý');

A1(:,:,1)=A8.*A1(:,:,1);
A1(:,:,2)=A8.*A1(:,:,2);
A1(:,:,3)=A8.*A1(:,:,3);

figure  9,imshow(A1); title('Son Hali');

