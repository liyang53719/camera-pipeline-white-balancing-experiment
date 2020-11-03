% shows example of illuminant estimation based on Grey-World, Shades of
% Gray, max-RGB, and Grey-Edge algorithm

close all
clear all

%some example images uint8(img16 / 256);
input_im=double(uint8(imread('.\images\IMAG0235_stage4_8bit.tif')*2));
%input_im=double(imread('cow2.jpg'));
%input_im=double(imread('dog3.jpg'));

figure(1);
subplot(2,3,1)
imshow(uint8(input_im));
title('input image');

% Grey-World
[wR,wG,wB,out1]=general_cc(input_im,0,1,0);
subplot(2,3,2)
imshow(uint8(out1));
title('Grey-World');
imwrite(uint8(out1),'.\images\IMAG0235_stage4_gray_world.tif');

% max-RGB
[wR,wG,wB,out2]=general_cc(input_im,0,-1,0);
subplot(2,3,3)
imshow(uint8(out2));
title('max-RGB');

% Shades of Grey
mink_norm=5;    % any number between 1 and infinity
[wR,wG,wB,out3]=general_cc(input_im,0,mink_norm,0);
subplot(2,3,4)
imshow(uint8(out3));
title('Shades of Grey');

% Grey-Edge
mink_norm=10;    % any number between 1 and infinity
sigma=4;        % 
diff_order=1;   % differentiation order (1 or 2)

[wR,wG,wB,out4]=general_cc(input_im,diff_order,mink_norm,sigma);
subplot(2,3,5)
imshow(uint8(out4));
title('Grey-Edge');
imwrite(uint8(out4),'.\images\IMAG0235_stage4_gray_edge.tif');
