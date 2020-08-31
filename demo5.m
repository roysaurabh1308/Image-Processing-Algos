clc
clear all
close all
im=imread('Retina_Normal.tif');
figure
imshow(im)

im2=rgb2gray(im);
figure
imshow(im2)

I=edge(im2,'prewitt');
figure
imshow(I)

I1=edge(im2,'sobel');
figure
imshow(I1)

I2=edge(im2,'Canny');
figure
imshow(I2)

mask=fspecial('average',7);
ib=imfilter(im2,mask);
i=im2-ib;
figure
imshow(i)

