close all;clear;clc;

channel = 11;

[focal_spectrum stack] = groundTruth(channel);
[m n ~] = size(stack);

%% test all spectrum
for i = 1:channel
    for j = 1:channel
        tic
        if (j~=i)
        [Av(:, :, i, j),...
         Bv(:, :, i, j),...
         target(:,:, i, j)] = GLT_Mapping(i, j, stack);%”√jª÷∏¥i
        else
            target(:,:, i, j) = focal_spectrum(:,:, i, i); 
        end
        toc
    end
end

%% Av
% for i = 1:channel
%     a = 1;
%     figure;
%     for j = 1:channel
%         subplot(2, 5, a)
%         imshow(Av(: , :, i, j), []);
%         colormap jet; colorbar;
%         a = a + 1;
%     end
% end

%% Bv
% for i = 1:channel
%     b = 1;
%     figure;
%     for j = 1:channel
%         subplot(2, 5, b)
%         imshow(Bv(: , :, i, j ),[]);
%         colormap jet; colorbar;
%         b = b + 1;
%     end
% end

%% target
% for i = 1:channel
%     t=1;
%     figure;
%     for j = 1:channel
%         subplot(2, 5, t),imshow(target(:,:,i,j),[]);
%         t = t + 1;
%     end
% end
 
%% PSNR
PSNR = zeros(channel,channel);
for i = 1:channel
    for j= 1:channel
        PSNR(j,i) = ...
            psnr(target(:,:,i,j),focal_spectrum(:,:,i,j));
    end
end

%% SSIM
SSIM = zeros(channel,channel);
for i = 1:channel
    for j= 1:channel
        SSIM(j,i) = ...
            ssim(target(:,:,i,j),focal_spectrum(:,:,i,j));
    end
end

% save Av Av
% save Bv Bv


