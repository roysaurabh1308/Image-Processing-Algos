clc
close all
clear all

im=imread('peppers.png');
figure
imshow(im)

% %%enlarge
% %interpolation  bilinea bicubic
% im2=imresize(im,3,'nearest');
% figure
% imshow(im2);
% im3=imresize(im,3,'bilinear');
% im4=imresize(im,3,'bicubic');
%%shrink to size 100x100
im6=imresize(im,[100 100],'bilinear');
%%shrink by 4
im7=imresize(im,0.25,'bilinear');
figure
imshow(im6);
figure
imshow(im7);
% figure
% imshow(im3);
%%rotate
im_rot=imrotate(im,45,'bilinear');
figure
imshow(im_rot)