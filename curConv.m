function [ out ] = curConv( im, fil )
% Convolve the image with different curvature filters
%   Created by Donald LI on 1/23/2020

% im is the input image
% fil is the filter bank

%% Prepare for the convolution
nFil = size(fil,2); % Get the size of the filter
sz_fil = size(fil(1).filter); % Size of the filter
sz = size(im); % Size of the result image
out = zeros(sz(1), sz(2), nFil); % Initialize output

%% Convolution
for i = 1:nFil
    out(:,:,i) = conv2(im,real(fil(i).filter),'same');
end

end