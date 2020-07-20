%%color
a=imread('taj.jpg');
figure, imshow(a); title('color');

%b=a.*2
%b=a./2
class(a)
b=a-15;
imshow(b), title('other');
