clear all;
close all;
snr = 0;
I = imread('../images/lena.png');
I = I(:, :, 2);

h = figure;
set(h, 'position', [0 0 1000 300]);

subplot(1,4,1);    
imshow(I);
title('Original')

subplot(1,4,2);
img = mat2gray(double(I).^2);
imshow(img);
title(strcat(num2str(2), 'nd Power'));

subplot(1,4,3);
img = mat2gray(double(I).^3);
imshow(img);
title(strcat(num2str(3), 'rd Power'));



subplot(1,4,4);
img = mat2gray(double(I).^4);
imshow(img);
title(strcat(num2str(4), 'th Power'));


saveas(h, 'Powers','eps');