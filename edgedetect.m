clc
close all
% real=imread('rube.png');
% clip=real(:,1:500,:);
clip=imread('man.jpg');
figure()
imshow(clip)
title('Original image')
pause

%partial gray scale black and white
black_white=uint8((1/3)*(double(clip(:,:,1))+double(clip(:,:,2))+double(clip(:,:,3))));
figure()
imshow(black_white)
title('Black & white')
b_wdouble=double(black_white);
gr=rgb2gray(clip);
%mask x by sobel operator...
maskofx=[-1 0 1;-2 0 2;-1 0 1];
[r,c]=size(black_white);
output=zeros(r-3,c-3);
for rowindex=1:(r-3)
    for colindex=1:(c-3)
        bws=b_wdouble(rowindex:(rowindex+2),colindex:(colindex+2));
        res=maskofx.*bws;
        output(rowindex,colindex)=sum(sum(res));
    end
end
Gx=output;
figure()
imshow(Gx)
title('mask in X')
lol1=edge(gr,'sobel');
lol2=edge(gr,'Canny');
lol3=edge(gr,'prewitt');
%mask in y sobel operator
maskofy=[-1 -2 -1;0 0 0;1 2 1];
for rowindex=1:(r-3)
    for colindex=1:(c-3)
        bws=b_wdouble(rowindex:(rowindex+2),colindex:(colindex+2));
        res=maskofy.*bws;
        output(rowindex,colindex)=sum(sum(res));
    end
end
Gy=output;
figure()
imshow(Gy)
title('mask in Y')
%vector sum
G=(Gx.^2+Gy.^2);
figure()
imshow(G)
title('Final image')
figure()
imshow(lol1)
title('Improved version..')
figure()
imshow(lol2)
title('Improved version2..')
figure()
imshow(lol3)
title('Improved version3..')