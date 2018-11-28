function [Av,Bv,target]=GLT_Mapping(Iv_num,In_num, stack)

addpath('Optimize');

[m, n, ~] = size(stack);
stackBlur = stack(:, :, Iv_num)/255;% Iv 对应模糊图
stackSharp = stack(:, :, In_num)/255;% In 对应清晰图

%% Gaussian
H = fspecial('gaussian',[21 21],10);
blurredBlur = imfilter(stackBlur,H,'replicate');
blurredSharp = imfilter(stackSharp,H,'replicate');

%% Optimize
Av =  0.8*ones(m, n);
Bv =  0.05*ones(m, n);
lambda = 1;
beta = 0.1;
[Av Bv] = gradDes(Av, Bv, blurredBlur, blurredSharp);%用9恢复8
target=uint8((Av.*stackSharp+Bv)*255);

