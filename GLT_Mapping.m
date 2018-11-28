function [Av,Bv,target]=GLT_Mapping(Iv_num,In_num, stack)

addpath('Optimize');

[m, n, ~] = size(stack);
stackBlur = stack(:, :, Iv_num)/255;% Iv ��Ӧģ��ͼ
stackSharp = stack(:, :, In_num)/255;% In ��Ӧ����ͼ

%% Gaussian
H = fspecial('gaussian',[21 21],10);
blurredBlur = imfilter(stackBlur,H,'replicate');
blurredSharp = imfilter(stackSharp,H,'replicate');

%% Optimize
Av =  0.8*ones(m, n);
Bv =  0.05*ones(m, n);
lambda = 1;
beta = 0.1;
[Av Bv] = gradDes(Av, Bv, blurredBlur, blurredSharp);%��9�ָ�8
target=uint8((Av.*stackSharp+Bv)*255);

