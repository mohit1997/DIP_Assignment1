clear all;
close all;
snr = 0;
I = imread('../images/lena.png');
I = I(:, :, 2);

h = figure;
set(h, 'position', [0 0 1000 1000]);

subplot(3, 3, 1);    
imshow(I);
title('Original')

B=bitget(I,1); subplot(3, 3, 2); imshow(logical(B)); title('Bit plane 1');
B=bitget(I,2); subplot(3, 3, 3); imshow(logical(B)); title('Bit plane 2');
B=bitget(I,3); subplot(3, 3, 4); imshow(logical(B)); title('Bit plane 3');
B=bitget(I,4); subplot(3, 3, 5); imshow(logical(B)); title('Bit plane 4');
B=bitget(I,5); subplot(3, 3, 6); imshow(logical(B)); title('Bit plane 5');
B=bitget(I,6); subplot(3, 3, 7); imshow(logical(B)); title('Bit plane 6');
B=bitget(I,7); subplot(3, 3, 8); imshow(logical(B)); title('Bit plane 7');
B=bitget(I,8); subplot(3, 3, 9); imshow(logical(B)); title('Bit plane 8');

saveas(h, 'Bitplanes','eps');

