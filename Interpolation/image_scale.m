I = imread('../images/lena.png');

% I = imresize(I, [100, 100]);
h = figure;
set(h, 'position', [0 0 1000 300]);

subplot(1,3,1); 
imshow(I);
title('Original')

J = fast_bilinear(I, 3, 2);
L = translate_image(J, 6, 7); 

subplot(1,3,2); 
imshow(L);
title('Scaled and Translated')

K = image_rotate(L, 75);
subplot(1,3,3); 
imshow(K);
title('Rotated')

saveas(h, 'Transformations','eps');