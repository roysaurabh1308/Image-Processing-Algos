clc
clear all
close all
im=imread('office_3.jpg');
figure
imshow(im)

%%power-law adjust by gamma=2 contrast
newim=imadjust(im,[],[],2);
figure
imshow(newim)
%%power-law adjust by gamma=2 contrast
newim2=imadjust(im,[],[],0.7);
figure
imshow(newim2)

%% add 50 to all channels
im2=im+50;
figure
imshow(im2)
%% sub 100 to all channels
im3=im-100;
figure
imshow(im3)
%% mul 5 to all channels
im4=im*5;
figure
imshow(im4)
%% div 5 to all channels
im5=im/5;
figure
imshow(im5)
%% lina
nim=imread('Lena_color.png');
figure
imshow(nim)
%%histogram
figure
imhist(nim(:,:,1));
figure
imhist(nim(:,:,2));
figure
imhist(nim(:,:,3));
%% histogram equilization (as equilised histogram is needed for a good image it is very important concept)
nim(:,:,1)=histeq(nim(:,:,1));
nim(:,:,2)=histeq(nim(:,:,2));
nim(:,:,3)=histeq(nim(:,:,3));
figure
imshow(nim)