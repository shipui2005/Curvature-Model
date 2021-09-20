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

# Notes
1. The default model uses the "Roberts" edge detector to detect edge pixels, which may not be optimal. Better performance can be yielded by providing an edge map to the curvature model.
2. The default model uses a 6-point curvature rating. The common range yielded by natural images is usually between 2-4. The curvature rating should be interpreted in a relative manner instead of an absolute way. For example, an image of a square (sq1.img) will yield a curvature level of 2, and this does not mean that the image contains a lot of curvy edges.
3. The curvature filter bank (bananaBank.mat) could be modified to include filters at different sizes, orientations, and curvature levels. The default settings may need to be changed depending on the kinds of images you are working with. The parameters of the curvature filters can be changed via bananaBank.m and bananaFilter.m. After updating the curvature bank, you will also to modify the curveRate.m to obtain a correct rating.

# Contact and support
Please email to Donald Li -  sli97[ at ]jhu[ dot ]edu - for support.

# Authors
* Donald Li (https://pages.jh.edu/sli97/)
* Michael Bonner (https://bonnerlab.org)

Link to the paper: https://openreview.net/forum?id=CUi1G2UWsAm
