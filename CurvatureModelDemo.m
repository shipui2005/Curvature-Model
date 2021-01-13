% A demo of how to use the curvature model to obtain curvature rating
% Created by Donald Li on 12/28/2020

%% First load the curvature filter and add path
load('bananaBank.mat');
addpath('./');


%% Load the image and obtain curvature rating and distribution of the image

img = imread('./SampleImages/square.jpeg'); % load the image
figure
imshow(img);

% The function will resize the image into  256*256, this process may have
% effect on the curvature rating if the aspect ratio of the input image is different
[rating_square, ~] = curveRate(img, bf); % obtain curvature rating


% The rating of the circle image should have higher curvature rating
% than the square one
img = imread('./SampleImages/circle.png'); % load the image

figure
imshow(img);
[rating_circle, ~] = curveRate(img, bf); % obtain curvature rating

% A house example, the chosen curvature filter bank works better in natural
% images 
img = imread('./SampleImages/house.jpeg'); % load the image
figure
imshow(img);
[rating_house, ~] = curveRate(img, bf); % obtain curvature rating

% An animal example, this default model works better when edge pixels could
% be easily captured by the MATLAB default edge detector, see the edgemap
img = imread('./SampleImages/animal.png'); % load the image
edgeMap = edge(rgb2gray(img),'Roberts');
figure
imshow(img);% show orignal image
figure
imshow(edgeMap); % show edge map
[rating_animal, ~] = curveRate(img, bf); % obtain curvature rating
