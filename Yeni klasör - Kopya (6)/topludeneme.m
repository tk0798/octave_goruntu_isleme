clear all;
pkg load image;
A1 = imread ('C:\Users\HP\Desktop\GoruntuIsleme\futbolcu.jpg');
A2 = rgb2hsv(A1);
sat=size(A2)(1);
sut=size(A2)(2);



D=rgb2gray(A1);

%figure  111,imshow(bw); title('parlaklýk denemesi');


%figure  112,imshow(Z); title('bwboundaries ile sýnýrlarý belirleme')
%im_edge = edge(D, 'sobel');
%figure  19,imshow(im_edge); title('Sobel gradient');

S=double(D);
for i=2:size(S,1)-1
for j=2:size(S,2)-1
%Sobel maske x-yönü için:
Gx=((2*S(i+1,j)+S(i+1,j+1)+S(i+1,j-1))-(2*S(i-1,j)+S(i-1,j-1)+S(i-1,j+1)));
% Sobel maske y-yönü için:
Gy=((2*S(i,j-1)+S(i-1,j-1)+S(i+1,j-1))-(2*S(i,j+1)+S(i-1,j+1)+S(i+1,j+1)));
%Pikselin Bileþke Deðeri
%B(i,j)=abs(Gx)+abs(Gy);
D(i,j)=sqrt(Gx.^2+Gy.^2);
end
end

level = graythresh(D);
bw = im2bw(D,level);

bw = bwareaopen(bw,50);
se = strel('line',11,200);
bw2 = imdilate(bw,se);
bw2 = bwareaopen(bw2, 400);
bw2 = bwmorph(bw2,'thin');
subplot(231),imshow(bw);
subplot(232),imshow(bw2);
Z = bwboundaries(bw); %yazdýramýyoruz çünkü resim deðil diyor

%% Find Regions and display
%[B, D] = bwboundaries(D, 'holes');
 ## Generate a simple image
 %D = false (100);
 %D (10:30, 40:80) = true;
 %D (40:45, 40:80) = true;

 ## Find boundaries
 %D = bwboundaries (D);

%% Clean the border of the image from artifacts. 
%D = imclearborder(D);

%% Clean up image based on segments
%D = bwareaopen(D, 400);



figure  10,imshow(D); title('Sobel gradient');
level = graythresh(D);
D = im2bw(D,level);
D = imcomplement(D);
figure 100,imshow(D); title('imcomplementli sobel ')
beyaz = imfill(D,'holes');
figure 222,imshow(beyaz),title('HADÝ BE OGLUM');
%D = imclearborder(D);
%figure 118,imshow(D); title('imclearborder sobel ')
D = bwareaopen(D, 5);
figure 131,imshow(D); title('bwareaopen sobel ')







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
figure 1900, imshow(A3),      title('Hmask');
#imwrite(A3,'C:\Users\HP\Desktop\GoruntuIsleme\yesil_Hmask.jpg');

R(:,:,1)=D.*A3(:,:,1);
R(:,:,2)=D.*A3(:,:,1);
R(:,:,3)=D.*A3(:,:,1);
%figure 11, imshow(R),      title('DENEME');

AAA(:,:,1)=R(:,:,1).*A1(:,:,1);
AAA(:,:,2)=R(:,:,2).*A1(:,:,2);
AAA(:,:,3)=R(:,:,3).*A1(:,:,3);

figure 18, imshow(AAA),      title('DENEME SONUCU');



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
figure 2, imshow(A4),      title('Smask');
%imwrite(A4,'C:\Users\HP\Desktop\GoruntuIsleme\yesil_Smask.jpg');

%Amsk1=0;
%Amsk1= (A3.*A4);
%figure 3,imshow(Amsk1),     title('2li mask')
%Amsk1 = bwareaopen(Amsk1,60);
%figure 4, imshow(Amsk1),      title('giderilmiþ');

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
figure 5, imshow(A5),      title('Vmask');
%imwrite(A5,'C:\Users\HP\Desktop\GoruntuIsleme\top_V.jpg');
AA=0;
AA = (A3.*A5);
AA = bwareaopen(AA,120);
%AA = bwareaopen(AA,120);
%AA = bwareaopen(AA,120);

figure 6, imshow(AA),      title('3lü mask');
AA = bwareaopen(AA,120);
%AA = bwareaopen(AA,120);
%AA = bwareaopen(AA,120);
sat=size(AA)*[1;0];
sut=size(AA)*[0;1];
#C= imnoise(AA,'salt & pepper',0.20);
#imwrite(C,'C:\Users\HP\Desktop\GoruntuIsleme\medyan_filtreTB.jpg');

%for i=1:sat
%for j=1:sut
% B(i+1,j+1,:)=AA(i,j,:);
% 	if i==1
%	B(1,j,:)=AA(1,j,:);
%	end
%	if i==sat
%	B(sat+2,j+1,:)=AA(sat,j,:);
%	end
	
%	if j==1
%	B(i+1,1,:)=AA(i,1,:);
%	end
%	if j==sut
%	B(i+1,sut+2,:)=AA(i,sut,:);
%	end
%end
%end
%B(1,1,:)=AA(1,1,:);
%B(sat+2,1,:)=AA(sat,1,:);
%B(1,sut+2,:)=AA(1,sut,:);
%B(sat+2,sut+2,:)=AA(sat,sut,:);



%for i=1:sat
%for j=1:sut
%  winmd=[B(i,j) B(i,j+1) B(i,j+2)  B(i+1,j) B(i+1,j+1) B(i+1,j+2)  B(i+2,j) B(i+2,j+1) B(i+2,j+2)];

%  if (B(i+1,j+1) ==0 || B(i+1,j+1) ==255)
%    AA(i,j)=median(winmd);
%  end;
%end
%end

%figure 8, imshow(AA),      title('sonuç DOÐRU mu');




A1(:,:,1)=AA.*A1(:,:,1);
A1(:,:,2)=AA.*A1(:,:,2);
A1(:,:,3)=AA.*A1(:,:,3);,

figure 7, imshow(A1),      title('sonuç');
imwrite(A1,'C:\Users\HP\Desktop\GoruntuIsleme\futbolcu_sonuc.jpg');


