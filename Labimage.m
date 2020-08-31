clc
clear all
close all

im=imread('Lena_Color.png');

figure
imshow(im)

impixelinfo
pix=im(136,191,:);
pix_sq=squeeze(pix);

pix2=[0;0;255];
im(136,191,:)=pix2;
figure
imshow(im);
impixelinfo

%extract
im2=im(1:136,1:136,:);
figure
imshow(im2)

%write
imwrite(im2,'newlenaex.png');

%RGB
figure
imshow(im(:,:,1))
title('Red')
figure
imshow(im(:,:,2))
title('Green')
figure
imshow(im(:,:,3))
title('Blue')