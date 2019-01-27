clear all;
close all;
snr = 0;
I = imread('../images/lena.png');
I = I(:, :, 2);

h = figure;
set(h, 'position', [0 0 800 400]);

subplot(1, 2, 1);
imhist(I);
title('Histogram')

subplot(1, 2, 2);
imshow(I);
title('Original')


saveas(h, 'Originalhist','eps');

h = figure;
I = histeq(I);
set(h, 'position', [0 0 800 400]);

subplot(1, 2, 1);
imhist(I);
title('Equalized Histogram')

subplot(1, 2, 2);
imshow(I);
title('Transformed Image')

saveas(h, 'Equalizedhist','eps');

