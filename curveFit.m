function [ out ] = curveFit( im, fil, w, sigma , order )
% Convolve the input with the curvature filiters and perform divisice
% normalization
% Created by Donald LI on 1/23/2020

if (size(im,3) == 3)
	im = rgb2gray(im); % Change the image into gray scale
end
im = im2double(im);
im = (im-0.5)./0.5; % Image normalization
out = curConv(im, fil); % Do the convolution
out = divNorm(out, w, sigma, order); % Do the divisive normalization

end
