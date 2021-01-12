% A demo of how to use the curvature model to obtain curvature rating
% Created by Donald Li on 12/28/2020

%% First load the curvature filter and add path
load('bananaBank.mat');
addpath('./');

%% Load the image
img = imread('./SampleImages/scene.jpeg');

%% Obtain curvature rating and distribution of the image
[rating, dist] = curveRate(img, bf);