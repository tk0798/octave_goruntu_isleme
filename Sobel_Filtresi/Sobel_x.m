% Örnek dosyan?n 3x3 konvolüsyon ile Sobel Filtresini alan fonksiyon

clear all;
A1 = imread ('C:\Users\HP\Desktop\GoruntuIsleme\Safari_RGB.jpg');
A=A1(:,:,3);
imwrite(A,'C:\Users\HP\Desktop\GoruntuIsleme\Safari_CH3.jpg');
sat=size(A)*[1;0];
sut=size(A)*[0;1];

for i=1:sat

for j=1:sut
 B(i+1,j+1)=A(i,j);
 	if i==1
	B(1,j)=A(1,j);
	end
	if i==sat
	B(sat+2,j+1)=A(sat,j);
	end
	
	if j==1
	B(i+1,1)=A(i,1);
	end
	if j==sut
	B(i+1,sut+2)=A(i,sut);
	end
end
end
B(1,1)=A(1,1);
B(sat+2,1)=A(sat,1);
B(1,sut+2)=A(1,sut);
B(sat+2,sut+2)=A(sat,sut);

A=0;
A=B;

orj=double(A);
cnvx=[-1 0 1; -2 0 2; -1 0 1];
cnvy=[1 2 1; 0 0 0 ; -1 -2 -1];



for i=1:sat
for j=1:sut
  tmp=[orj(i,j) orj(i,j+1) orj(i,j+2) ;
  orj(i+1,j) orj(i+1,j+1) orj(i+1,j+2) ; 
  orj(i+2,j) orj(i+2,j+1) orj(i+2,j+2) ];
 B1=uint8( sum(sum(tmp.*cnvx)) );
 B2=uint8( sum(sum(tmp.*cnvy)) ); 
 Bnew=floor(B1+B2);
Anew(i,j)=Bnew;
 
end
end

% imshow(Anew);
imwrite(Anew,'C:\Users\HP\Desktop\GoruntuIsleme\Sobel_xy.jpg');