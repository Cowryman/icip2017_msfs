%% generate pseudo image
%  data -- input spectral data
%  minW -- minimum wavelength
%  maxW -- maximum wavelegth
%  stepW -- step between neighboring wavelenth

function A=pseu(data,minW,maxW,stepW)
data = double(data);

load('curvesRGB.mat');
x=400:1/3:710-1/3;
xx=minW:stepW:maxW;

if minW<400 || maxW>710-1/3
    disp('exceed wavelength range');
    return;
end

rR=spline(x,responseR,xx);
rG=spline(x,responseG,xx);
rB=spline(x,responseB,xx);

[row col sn]=size(data);
A=zeros(row,col,3,sn);

for ind=1:sn
    r=squeeze(rR(ind));
    g=squeeze(rG(ind));
    b=squeeze(rB(ind));
    A(:,:,1,ind)=data(:,:,ind)*r;
    A(:,:,2,ind)=data(:,:,ind)*g;
    A(:,:,3,ind)=data(:,:,ind)*b;
 end
     
end
