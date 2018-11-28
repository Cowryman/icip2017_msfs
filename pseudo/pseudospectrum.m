clc;clear;close all
addpath('C:\Users\CianHuang\Documents\MATLAB\jnb_detection_code\207-217');
load('target 207-217');

target = double(target)/255;

channel = 11;
d = 10;
A = pseu(target(:, :, d, :), 400, 700, 300/(channel - 1));

for i = 1:channel
%    imname = strcat('pseu_d', num2str(d),'_',num2str(206+v(i)), '.eps');
%     figure
%     imshow(A(:,:,:,i), [])
    imRe = A(:,:,:,i);
%end
    
%% stitch
c = [318,722]; %(207-217)
size = 55;
times = 5;
block3 = imRe(c(1)-size:c(1)+size-1, c(2)-size:c(2)+size-1, :);

block = coloredge(block3, 4);

imRe(c(1)-size:c(1)+size-1, c(2)-size:c(2)+size-1, :) = block;
figure
imshow(imRe, [])
% saveas(gca,imname,'psc2')

J(:, :, :, i) = imresize(block3,times);
end
J1 = cat(2, J(:,:,:,1), J(:,:,:,2));
J2 = cat(2, J(:,:,:,3), J(:,:,:,4));
im_new = cat(1, J1, J2);
im_new(545:555, :, :) = 1;
im_new(:, 545:555, :) = 1;

figure, imshow(im_new, [])
% saveas(gca,strcat('pseu_d', num2str(d),'.eps'),'psc2');

