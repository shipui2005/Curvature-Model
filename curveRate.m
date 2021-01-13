function [rating, dist] = curveRate(orig_img, bf, edgeMap, w, sigma, order)
% Return a curvature rating from a model running on ADE20K dataset
% Created by Donald LI on 2/25/2020

% Input:
% orig_img is the original image, bf is the curvature filter bank, mask is the edge mask of the image
% If no mask is provided, it uses the default edge detector to create edge mask
% Last 3 variables are the parameters for divisive normalization used after fitting image to the banana filter
% Default the mean for divisive normalization

% Output:
% rating is the curvature rating from 1 to 6
% dist is the curvature distribution of edge pixels, each element in the vector contains
% the probability of edge pixels that fit best for that curvature level
    
    % Initialize parameters
    if ~exist('edgeMap','var')   
        % Fit with edge detector
        if (size(orig_img,3) == 3)
            edgeMap = edge(rgb2gray(orig_img),'Roberts');% Change the image into gray scale
        else
            edgeMap = edge(orig_img,'Roberts');
        end
    end
    
    if ~exist('w','var')
        w = ones([1 size(bf,2)]);
    end
    
    if ~exist('sigma','var')
        sigma = 5;
    end
    
    if ~exist('order','var')
        order = 2;
    end
    
    % Resize image
    orig_img = imresize(orig_img, [256 256]);
    edgeMap = imresize(edgeMap, [256 256]);
    
    % Fit with banana filter
    curveMatch = curveFit(orig_img,bf,w,sigma,order); 
    
    % Find the maximum matched channel for each pixels
    [M,I] = max(curveMatch,[],3);
    
    % Use the edge pixels 
    I(edgeMap==0) = 0;
    [~,~,v] = find(I);
    
    % Calculate the probability of curvature from edge pixels
    % Bin has to be changed if the filters are changed
    % For the default, filter 1-16 has no curvature, and every 32 filters
    % afterward has 1 level of curvature increment, that's why the default 
    % confiuration is [1,17:23:177]. 
    [dist EDGES] = histcounts(v,[1,17:32:177],'Normalization','probability');
    
    % Get the mean curvature of all pixels
    rating = sum(dist.*[1:6]);
    
end
