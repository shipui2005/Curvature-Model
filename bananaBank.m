%% Building a banana filter bank
% Created by Donald Li on 1/10/2020

%% Creating banana filter banks

% This script creates banana filter bank and a customized curvature filter
% bank designed for the dataset used could optimize performance. Remember
% to change the histcount line in the curvRate.m file after making changes
% to the curvature filter bank.

% Define a set of parameters used to create curvature filter bank
% For the default, there are 6 curvature levels (each curvature level apart
% from 0 has a concave and a convex version), 16 orientations for each
% curvature level and 1 gaussian size. 
ories = [0:pi/16:15*pi/16]; % Orientation of filter in radian
curvs = [0, -1/128, 1/128, -1/64, 1/64, -1/32, 1/32, -1/20, 1/20, -1/12, 1/12]; % Curvature level 
gau_sizes = [10]; % Gaussian filter size
fil = struct('par',[],'filter',[]); % Filter bank initialization


% Loop through parameters to create individual filter in the curvature
% filter bank
count = 1;
for curv=curvs
    for gau_size=gau_sizes
        for orie=ories
            fil(count).filter = bananaFilter(gau_size, 1.2, orie, curv , 4, 1, 1, 50); % Create filter 
            fil(count).par = [orie, curv, gau_size]; % Record parameters used in that filter
            count = count+1;      
        end
    end
end

save('bananaBank.mat','bf');

% Curvature filter 1-16 has curvature level 1 (0),  17-48 has level 2 (1/128),
% 49-80 (1/64) has level 3, 81-112 has level 4 (1/32), 113-144 has
% level 5 (1/20), and 145-176 has level 6 (1/12).
