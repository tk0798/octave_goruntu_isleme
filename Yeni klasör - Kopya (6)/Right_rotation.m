clear all;
A = imread ('C:\Users\HP\Desktop\GoruntuIsleme\Safari.jpg');
sat=size(A)*[1;0];
sut=size(A)*[0;1];
xo=50;

orj=A;
clear A;
for i=1:sat
for j=1:sut
  A(j,i)=orj(sat-i+1,j);
end
end

imwrite(A,'C:\Users\HP\Desktop\GoruntuIsleme\rightrotation.jpg');