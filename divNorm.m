function [ out ] = divNorm( im, w, sigma, order )
% Doing divisive normalization with different channels
%   Created by Donald LI on 1/23/2020

% im is the input to the divisive normalization layer (a tensor)
% w is the weight of differenet features (a vector)
% sigma is the bias of the demoninatorm (a number)
% order is the power of features (a number)

%% Prepare for the divisive normalization
nFil = size(im,3); % Get the size of the filter
sz_x = size(im,1);
sz_y = size(im,2);

%% Calculate the denominator
temp = zeros(1,1,nFil); % Make a 3 dimensional weight matrix
temp(1,1,:) = w;
w = repmat(temp,[sz_x sz_y,1]); % Create a wieghted matrix
denom = sum(w.*(im.^order),3) + sigma;

%% Doing the normalization
out = (im.^order)./denom;

end