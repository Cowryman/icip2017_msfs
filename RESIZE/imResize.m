%微调不同焦距下focal stack的大小
%并把它们截成一样的尺寸


clc;clear;close all;
addpath('database');
load('PSNR_207-217.mat')
%I1 = imread('CP2A0171.jpg');
%PSNR = zeros(7, 200);

for k = 1:11
    I(:, :, :, k) = imread(strcat('CP2A0',num2str(206+k),'.jpg'));
    
%     [m, n, p] = size(I1);
%     for i = 1:50
%         J2 = imresize(I2, 1-i*0.001);
%         [mm nn ~] = size(J2);
%         
%         row = floor((m - mm)/2); col =floor((n-nn)/2);
%         J1 = I1((row:mm+row-1),(col: nn+ col -1), :);
%         PSNR(k, i) = psnr(J2, J1);
%     end
end
[a b]= max(PSNR');
b(1) = 0;
for i = 1:11
     J = imresize(I(:, :, :, i), 1-b(i)*0.001);
     [m n ~] = size(J);
     J = J((floor(m/2)-1500:floor(m/2)+1500-1), (floor(n/2)-2200:floor(n/2)+2200-1), :);
     J = imresize(J, 1/4);
     imname = strcat('_CP2A0',num2str(206+i),'.jpg');
     imwrite(J, imname);
end
