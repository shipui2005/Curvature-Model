function [ fil ] = bananaFilter(s, fre, theta, cur, gamma, sigx, sigy, sz)

% It is a function that used to produce banana wavelet filter based on
% different variables
% The input to this function is size of the wavelet, frequency of the gabor,
% theta as the orientation (in rad), cur as curvature, gamma as a constant, sigx and
% sigy as the scale of the gabor (sigma in Gaussian distribution), sz
% stands for the size of the filter
% Refered to Ibrahim(2012) Wavelet based approach for detection and
% recognition in ear biometrics for more detail
%
% Example: fil = bananaFilter(50,0.8,pi/4,0.005,100,0.5,0.5,50);
%   Created by Donald LI on 1/6/2020

% Define a matrix that used as a filter
[x y] = meshgrid(-fix(sz/2):fix(sz/2),fix(sz/2):-1:fix(-sz/2));

% Define orientation of the filter
xc = x*cos(theta)+y*sin(theta);
xs = -x*sin(theta)+y*cos(theta);

% Define the bias term
bias = exp(-sigx/2);
k = xc+cur*(xs).^2;

% Define the rotated Guassian rotated and curved function
k2 = (k/sigx).^2+(xs/(sigy*s)).^2;
G = exp(-k2*(fre)^2/2);

% Define the rotated and curved complex wave function
F = exp(fre*k*1i);

% Mutiply the complex wave function with the Gaussian function with a
% constant and bias
fil = gamma*G.*(F-bias);

end