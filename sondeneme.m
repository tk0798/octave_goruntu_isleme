clear all;
pkg load image;
A1 = imread ('C:\Users\HP\Desktop\GoruntuIsleme\futbolcu.jpg');
A2 = rgb2hsv(A1);
sat=size(A2)(1);
sut=size(A2)(2);

D=rgb2gray(A1);

figure 1, imshow(D); title('Gri Resme dönüþtürme');

im_edge = edge(D, 'sobel');
figure 2, imshow(im_edge); title('sobel');
%D = imcomplement(im_edge);
%figure 100,imshow(D); title('imcomplementli sobel ')
%D = bwareaopen(D, 20);
%figure 131,imshow(D); title('bwareaopen sobel ')

level = graythresh(D);
bw = im2bw(D,level);
D = imcomplement(im_edge);
figure 3,imshow(D); title('imcomplementli sobel ')
bw = bwareaopen(bw,30);
figure 4,imshow(bw); title('bwareaopen sobel ')

%figure 17,imshow(A2(:,:,1)), title('deneme');



A=uint8(255*A2(:,:,1));
esik=125;
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
A3 = bwareaopen(A3,100);
figure 5, imshow(A3),      title('Hmask');


A=uint8(255*A2(:,:,2));
esik=10
for i=1:sat
  for j=1:sut
  if A(i,j)>esik 
    A4(i,j)=1;
  else 
    A4(i,j)=0;
  end
  end
end
figure 20, imshow(A4),      title('Smask');

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
A5 = bwareaopen(A5,60);
figure 50, imshow(A5),      title('Vmask');

AA=0;
AA = (A3.*D);





AA(:,:,1)=AA.*A1(:,:,1);
AA(:,:,2)=AA.*A1(:,:,2);
AA(:,:,3)=AA.*A1(:,:,3);

figure 8, imshow(AA),      title('sonuç');






