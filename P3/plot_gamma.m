clear all;
close all;
snr = 0;
I = imread('../images/lena.png');

h = figure;
set(h, 'position', [0 0 1000 300]);

subplot(1,5,1);    
imshow(I);
title('Original')
index = 2;
for gamma = [0.4 2.5 10 25 100]
    J = Gamma(I, gamma);
    subplot(1, 6, index);
    imshow(J);
    name = strcat('Gamma = ',num2str(gamma)); 
    title(name)
    index = index+1;
end

saveas(h, 'Gamma_fig','eps');