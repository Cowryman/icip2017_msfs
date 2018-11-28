function [focal_spectrum stack] = groundTruth(channel)

addpath('rgb2spectral');
addpath('database');

for i = 1:channel

%% Load data
imageName=strcat('_CP2A0',num2str(206+i),'.jpg');
im1 = imread(imageName);

%% simSI
im = rgb2spectral(im1, channel);
focal_spectrum(:,:,:,i) = uint8(im*255); 
if (ndims(im) == 3)
    im = im(:, :, i);
end
im = double(im.*255);
stack(:, :, i) = im;
end

