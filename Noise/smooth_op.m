function [img_out] = smooth_op(img, k)
    h = ones(k);
    h = h/sum(h(:));
    I = double(img);
    J = imfilter(I, h);
    img_out = uint8(J);
end
    