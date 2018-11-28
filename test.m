clc;clear;close all

% test pic
addpath('00-09');
load('stack 00-09.mat');
load('focal_spectrum 00-09.mat')
% zoom out
stack2 = imresize(stack, 1/3);
for i = 3
    for j = 7
        tic
        if (j~=i)
        [A,...
         B,...
         target] = GLT_Mapping(i, j, stack2);%”√jª÷∏¥i
        end
        toc
    end
end
%% ZOOM in A & B
% zoom in A & B
Av = imresize(A, 3);
Bv = imresize(B, 3);
% calculate
target1 = uint8(Av.*stack(:, :, 7)+Bv);
%PSNR SSIM
PSNR1 = psnr(target1,focal_spectrum(:,:,i,j));
%% ZOOM in pic
% zoom in pic


% calculate
target2 = imresize(target, 3);

%PSNR SSIM
PSNR2 = psnr(target2,focal_spectrum(:,:,i,j));
