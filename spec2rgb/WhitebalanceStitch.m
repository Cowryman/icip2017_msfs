function img = WhitebalanceStitch (image,ref)

ref = double(ref);
image = double(image);
ref = ref/max(ref(:));
image = image/max(image(:));


R = ref(:, :, 1);
G = ref(:, :, 2);
B = ref(:, :, 3);
R2 = image(:, :, 1);
G2 = image(:, :, 2);
B2 = image(:, :, 3);

ar= polyfit(R2, R, 1);
ag= polyfit(G2, G, 1);
ab= polyfit(B2, B, 1);

R2 = ar(1)*R2+ar(2);
G2 = ag(1)*G2+ag(2);
B2 = ab(1)*B2+ab(2);

img(:, :,1) = R2;
img(:, :,2) = G2;
img(:, :,3) = B2;

% figure, subplot(1, 2, 1), imshow(ref), subplot(122), imshow(img)
end