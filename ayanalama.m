%aynalama
clear all;
A=imread ('C:\Users\HP\Desktop\GoruntuIsleme\Safari.jpg');

sat=size(A)*[1;0];
sut=size(A)*[0;1];
%xo=50;
orj=A;

for i=1:sat
for j=1:sut
  A(i,j)=orj(i,sut-j+1);
end
end


%imshow(B);
imwrite(A,'C:\Users\HP\Desktop\GoruntuIsleme\aynalama.jpg');
%end