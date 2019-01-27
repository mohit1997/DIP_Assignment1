I = imread('../images/lena.png');
I = I(:, :, 2);
I = mat2gray(I);
temp = I;
% I(I<120/255.0 & I>200/255.0) = 20/255.0;
J = imadjust(I, [120/255.0, 200/255.0]);
temp(I>=120/255.0 & I<=200/255.0) = 0;
J(I<120/255.0) = 0.0;
J(I>=200/255.0) = 0.0;
% imhist(temp)
final = temp + J;
h = figure;
imshow(final);
saveas(h, 'Highlighted','eps');