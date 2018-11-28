clc;clear; close all;

%%
addpath('00-09');
addpath('rgb2spectral');
addpath('spec2rgb');
addpath('database');

% load('focal_spectrum 00-09.mat');
% im = focal_spectrum(:, :, :,8);
I = imread('07.jpg');
[m n k] = size(I);
channel =10;
im = rgb2spectral(I, channel);

imRGB = convRGB(im, 400, 700, (700-400)/(channel-1));
imRe = WhitebalanceStitch(imRGB, I);

figure
imshow(I)
% saveas(gca,'217.eps','psc2')
figure
imshow(imRe)
% saveas(gca,'r0217.eps','psc2')

% figure, subplot(121),
% imshow(I)
% subplot(122), imshow(imRe)

%% stitch
% a = [345,176]; b = [360,553]; c = [318,722]; %(207-217)
%a = [279 ,255];b = [367 ,546];c = [285 ,972]  %(00-09)
size = 60;
times = 3;
block1 = imRe(a(1)-size:a(1)+size-1, a(2)-size:a(2)+size-1, :);
block2 = imRe(b(1)-size:b(1)+size-1, b(2)-size:b(2)+size-1, :);
block3 = imRe(c(1)-size:c(1)+size-1, c(2)-size:c(2)+size-1, :);

block1 = coloredge(block1, 1);
block2 = coloredge(block2, 2);
block3 = coloredge(block3, 3);

imRe(a(1)-size:a(1)+size-1, a(2)-size:a(2)+size-1, :) = block1;
imRe(b(1)-size:b(1)+size-1, b(2)-size:b(2)+size-1, :) = block2;
imRe(c(1)-size:c(1)+size-1, c(2)-size:c(2)+size-1, :) = block3;

J1 = imresize(block1,times);
J2= imresize(block2,times);
J3 = imresize(block3,times);
J = cat(2, J1, J2, J3);
im_new = cat(1, imRe, J);
figure, imshow(im_new)
