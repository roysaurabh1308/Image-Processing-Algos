clc
clear all
close all

im=imread('peppers.png');
imshow(im)
%% create a 5x5 average convolution mask
mask=fspecial('average',9);
%% filter the image and thus blur
out=imfilter(im,mask);
figure
imshow(out)
%% motion blur
mask2=fspecial('motion',50,45);
out2=imfilter(im,mask2);
figure
imshow(out2)
%% unsharp blur increase sharpness
im2=imread('cameraman.tif');
mask4=fspecial('unsharp');
out3=imfilter(im2,mask4);
figure
imshow(out3)