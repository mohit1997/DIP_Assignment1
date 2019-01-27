function [out] = translate_image(img, xshift, yshift)
    
    [rows, cols, channels] = size(img);
    
    R = yshift+rows;
    C = xshift+cols;
    
    out = zeros(R, C, channels);
    js = 1:cols;
    js = xshift+js;
    
    for i = yshift+1:R
        out(i, js(1, :), :) = img(i-yshift, :, :);
    end
    out = uint8(out);
end