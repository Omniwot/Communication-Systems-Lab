A = imread('image1.jpg');
image(A);
imagestream = dec2bin(A); 
imreshape = reshape(imagestream, 1 ,[]);