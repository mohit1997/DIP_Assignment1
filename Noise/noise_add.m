clear all;
close all;
snr = 0;
I = imread('../images/lena.png');

% Convert Image to Grayscale - Taking the Green Channel Only
I = I(:, :, 2);

l1 = zeros(1, 5);
l2 = zeros(3, 5);

index = 1;
for snr = 0:5:20
    
    h = figure;
    set(h, 'position', [0 0 1000 300]);
    subplot(1,5,1);
    
    imshow(I);
    title('Original')

    J = add_gaussian(I, snr);
    subplot(1, 5, 2);
    
    imshow(J);
    title('Noise')

    J_smooth5 = smooth_op(J, 5);
    subplot(1, 5, 3);
    
    imshow(J_smooth5);
    title('Smooth - 5x5')
    
    J_smooth7 = smooth_op(J, 7);
    subplot(1, 5, 4);
    
    imshow(J_smooth7);
    title('Smooth - 7x7')
    
    J_smooth9 = smooth_op(J, 9);
    subplot(1, 5, 5);
    
    imshow(J_smooth9);
    title('Smooth - 9x9')
    
    name = num2str(snr);
    saveas(h, name,'eps');

    e1 = mean_error(I, J);
    e2 = [mean_error(I, J_smooth5), mean_error(I, J_smooth7), mean_error(I, J_smooth9)];
    l1(1, index) = e1;
    l2(1, index) = e2(1);
    l2(2, index) = e2(2);
    l2(3, index) = e2(3);
    index = index + 1;
end
s_list = 0:5:20;

h = figure;
title('Error Trend');
plot(s_list, l1);
hold on;
plot(s_list, l2(1, :));
plot(s_list, l2(2, :));
plot(s_list, l2(3, :));
legend('MSE - Noise','MSE - Smoothened 5x5', 'MSE - Smoothened 7x7', 'MSE - Smoothened 9x9')
xlabel('SNR');
ylabel('Mean Squared Error');
grid on;
saveas(h, 'Error','epsc');