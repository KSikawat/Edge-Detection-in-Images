%  Matlab code to detect edges in a given image

clc;
clear all;
close all;

img = imread('original.png');
B = rgb2gray(img); 

figure;
a = B;

figure;
I = double(B);

for i = 1:size(I,1) - 2
	for j = 1:size(I,2) - 2
		%  Sobel mask for x-direction:
		mx = ( -(2*I(i+2, j+1) + I(i+2, j) + I(i+2, j+2)) + (2*I(i, j+1) + I(i, j) + I(i, j+2)) );

		%  Sobel mask for y-direction:
		my = ( -(2*I(i+1, j+2) + I(i, j+2) + I(i+2, j+2)) + (2*I(i+1, j) + I(i, j) + I(i+2, j)) );

		%  Using thresholding to remove background clutter
		mx = mx.*(abs(mx) > 150); 
		my = my.*(abs(my) > 150);

		B(i, j) = sqrt(mx.^2 + my.^2);
	end
end

subplot(2, 1, 1);
imshow(a);
title('Original image');

subplot(2, 1, 2);
imshow(B);
title('Edge detected');