clear all;
A=imread('C:\Users\HP\Desktop\GoruntuIsleme\Safari_RGB.jpg');


GIm=uint8(zeros(size(A,1),size(A,2)));

for m=1:size(A,1)
for n=1:size(A,2)
GIm(m,n)=0.2989*A(m,n,1)+0.5870*A(m,n,2)+0.1140*A(m,n,3);
end
end




imwrite(GIm,'C:\Users\HP\Desktop\GoruntuIsleme\griyedonusturme.jpg');

%%%%%%%%%%
satir=size(A1)*[1;0];
sutun=size(A1)*[0;1];

for i=1:satir
for j=1:sutun
 Amsk(i+1,j+1,:)=A1(i,j,:);
 	if i==1
	Amsk(1,j,:)=A1(1,j,:);
	end
	if i==satir
	Amsk(satir+2,j+1,:)=A1(satir,j,:);
	end
	
	if j==1
	Amsk(i+1,1,:)=A1(i,1,:);
	end
	if j==sut
	Amsk(i+1,sutun+2,:)=A1(i,sutun,:);
	end
end
end
Amsk(1,1,:)=A1(1,1,:);
Amsk(satir+2,1,:)=A1(satir,1,:);
Amsk(1,sutun+2,:)=A1(1,sutun,:);
Amsk(satir+2,sutun+2,:)=A1(satir,sutun,:);



for i=1:satir
for j=1:sutun
  winmd=[Amsk(i,j) Amsk(i,j+1) Amsk(i,j+2)  Amsk(i+1,j) Amsk(i+1,j+1) Amsk(i+1,j+2)  Amsk(i+2,j) Amsk(i+2,j+1) Amsk(i+2,j+2)];
%  temp = median(winmd);
  if (Amsk(i+1,j+1) ==0 || Amsk(i+1,j+1) ==255)
    A1(i,j)=median(winmd);
  end;
end
end

%%%%