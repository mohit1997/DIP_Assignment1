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
imshow(255 - I);
title('Negative')

subplot(1,4,3);
img = double(I) + 1;
img = mat2gray(log(img));
imshow(img);
title('Log')


subplot(1,4,4);
img = double(I);
img = mat2gray(exp(img));
imshow(img);
title('Antilog')

saveas(h, 'Negative','eps');