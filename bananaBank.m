%% Building a banana filter bank
% Created by Donald Li on 1/10/2020

%% Creating banana filter banks

% Define a set of parameters used to create curvature filter bank

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

%% Visualise a subset of curvature filters
figure
colormap gray

for i=1:length(curvs)
    for j=1:length(ories)
        colormap gray
        ax((i-1)*length(ories)+j) = subplot('Position',[(j-1)*1/length(ories) (length(curvs)-i)*1/length(curvs) 1/length(ories) 1/length(curvs)]); 
        imagesc(real(fil((i-1)*length(ories)+j).filter),[-0.4754, 1.6] );
        axis off
    end
end



