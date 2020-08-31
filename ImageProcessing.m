clc;
clear all;
close all;
im  = imread('Images\Lena_Color.png');
figure;
imshow(im);
impixelinfo
%%  Change the pixel color
pix = im(136, 191, :);
pix_sq = squeeze(pix);
pix2 = [0;0;255];
im(136, 191, :) = pix2;
figure;
imshow(im);
impixelinfo
%%  Extract image portion from the main image
row1 = 31;
col1 = 112;
row2  = 244;
col2 = 274;
im2= im(row1:row2, col1:col2,:);
imshow(im2);

%% Save the extracted image
imwrite(im2, 'lena_subset.jpg');
%% Extract the red, green and blue channels from the image

figure;
imshow(im(:,:,1));
title('red channel')


figure;
imshow(im(:, :, 2));
title('Green channel');


figure;
imshow(im(:, :, 3));
title('blue channel');
%%  Image resize
im2 = imread('Images\pepper.png');
figure;
imshow(im2);
im2 = imresize(im2, 3, 'nearest');
figure;
imshow(im2);

im5 = imresize(im, 0.25, 'bilinear');
figure;
imshow(im5);

%% Shrink the image to size 100 rows by 100 columns
im6 = imresize(im, [100, 100], 'bilinear');

%% Rotate the image by 45 degrees
im_rot = imrotate(im, 45, 'bicubic');
figure;
imshow(im_rot);

%% Read an image of new york city
im = imread('office_3.jpg');
close all;
figure;
imshow(im);

%% Power-law adjust by gamma =2

out = imadjust(im, [], [], 2);
figure;
imshow(out);

%% Power law adjust by gamma = 0.7
out2 = imadjust(im, [], [], 0.7);
figure;
imshow(out2);

%% Addd 50 to all channels
im2  = im +50;
figure;
imshow(im2);
title('add 50');

%% Subtract 100 from all elements
im3 =im - 100;
figure;
imshow(im3);
title('subtract 100');

%% Read Lena_color
close all;
clear all;
im = imread('Images/Lena_Color.png');
figure;
imshow(im);
%% Display each channel
figure;
imhist(im(:,:,1));
figure;
imhist(im(:,:,2));
figure;
imhist(im(:,:,3));

%% Histogram equalise to increase conrast
im(:,:,1) = histeq(im(:,:,1));
im(:,:,2) = histeq(im(:,:,2));
im(:,:,3) = histeq(im(:,:,3));
figure;
imshow(im);
title('histequalized');

%% Display each channel
figure;
imhist(im(:,:,1));
figure;
imhist(im(:,:,2));
figure;
imhist(im(:,:,3));


%% Smoothening the image
close all;
clear all;
im = imread('peppers.png');
figure;
imshow(im);

%% Create a 5 x5 average convoluion mask
mask = fspecial('average', 5);

%% Filter the image and thus we blur
out = imfilter(im, mask);
figure;
imshow(out);
title('blurred image');
%% Average convolution mask of 10x10
mask2 = fspecial('average', 10);

%% Filter the image using the mask 2
out2 = imfilter(im, mask2);
figure;
imshow(out2);
title('more blurred image');

%% 
mask3 = fspecial('motion', 50 , 45);
out3 = imfilter(im, mask3);
figure;
imshow(out3);

%% Sharpening of image reverse of blur
mask4 = fspecial('unsharp');
out4 = imfilter(im, mask4);
figure;
imshow(out4);

%% Edge detection
close all;
clear all;
im = imread('Images/Retina_Normal.tif');
figure;
imshow(im);

%% Convert to gray scale
if(size(im, 3)>1)  %if image is not grayscale
    Igray = rgb2gray(im)
else
    Igray  = img
end

%% find edges using the Prewitt(scientist) definition
I = edge(Igray, 'prewitt',0.01);
figure;
imshow(I);
title('prewitt edge detection');

%% find eges using Sobel method
I = edge(Igray, 'sobel');
figure;
imshow(I);
title('Sobel edge detection');

%% find edge using unsharp masking

mask = fspecial('average', 10);
Iblur = imfilter(Igray, mask);
Iunsharp = Igray- Iblur;
figure;
imshow(Iunsharp);
title('edge using unsharp');