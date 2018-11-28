%% calculate RGB image from spectrum datacube
% specData -- spectral data
%  minW -- minimum wavelength
%  maxW -- maximum wavelegth
%  step -- step between neighboring wavelenth

function RGB=convRGB(specData,min_w,max_w,step)

    specData = double(specData);
    specData = specData./max(specData(:));
    [height width specNum]=size(specData);
 
    % XYZ 积分曲线 400-720nm, 10nm
    load curvesRGB.mat;
    if min_w<400 || max_w>710
        error('exceed wavelength range');
        exit;
    end
    
    wl=min_w:step:max_w;
    % 插值
    x=400:1/3:710-1/3;
    cur=zeros(specNum,3);
    cur(:,1)=spline(x,responseR,wl);
    cur(:,2)=spline(x,responseG,wl);
    cur(:,3)=spline(x,responseB,wl);
    
    % spectral to RGB
    specData_r=reshape(specData,width*height,specNum);
    RGB_r=specData_r*cur;

    RGB=reshape(RGB_r,height,width,3);
    RGB = RGB/max(RGB(:));
end