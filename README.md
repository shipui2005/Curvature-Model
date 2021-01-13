# Curvature-Model
Curvature model is a MATLAB computational model to obtain curvature index from an input image.

# Installation
No extra installation required if MATLAB is installed. 

# Usage
1. First load the curvature filter bank. 
2. Then load the target image.
3. Run the curvature rating of the input image.
```MATLAB
load('bananaBank.mat');
img = imread('./SampleImages/scene.jpeg');
[rating, dist] = curveRate(img, bf);
```

# Implementation details
* CurvatureModelDemo.m is a demo MATLAB script to obtain curvature index of the sample images.
* curveRate.m is the main code to obtain curvature rating of the image.
* bananaFilter.m contains the script to create curvature filters used in the model.
* bananaBank.m gathers all the curvature filters to create a curvature filter bank.
* curveFit.m fits curvature filter to the input image using curConv.m and divNorm.m.
* curConv convolves the curvature filter with the input image.
* divNorm.m performs divisive normalization of the convolution output.

See our paper - https://openreview.net/forum?id=CUi1G2UWsAm - for the model details.

# Contact and support
Please email to Donald Li -  shipui2005[ at ]hotmail[ dot ]com - for support.

# Authors
* Donald Li (https://pages.jh.edu/sli97/)
* Michael Bonner (https://bonnerlab.org)

Link to the paper: https://openreview.net/forum?id=CUi1G2UWsAm
