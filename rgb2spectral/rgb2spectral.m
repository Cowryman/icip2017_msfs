function spectralImage= rgb2spectral( rgbImage , sn)
%generate a pseudo spectral image
load('curvesRGB.mat');

wl = linspace(400, 700, sn);

%sn=(wl(end)-wl(1))/(wl(2)-wl(1))+1; %²¨¶ÎÊý
x=400:1/3:(710-1/3);
cur=zeros(3,sn);
cur(1,:)=spline(x,responseR,wl); % R
cur(2,:)=spline(x,responseG,wl); % G
cur(3,:)=spline(x,responseB,wl); % B
RGBImg=double(rgbImage);
RGBImg=RGBImg./max(RGBImg(:));
[row col chn]=size(RGBImg);
specData=zeros(row,col,sn);
RGBImg_r=reshape(RGBImg,row*col,chn);
specData_r=RGBImg_r*cur;
spectralImage=reshape(specData_r,row,col,sn);
end

