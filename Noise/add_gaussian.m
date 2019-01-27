function [img_out] = add_gaussian(img, snr)
    % Read Image
    I = img;


    

    % Power of Image
    I = double(I);

    %// Adjust intensities in image I to range from 0 to 1
    I = I - min(I(:));
    I = I / max(I(:));

    v_noise = var(I(:)) * 10 ^(-0.1*snr);

    J = imnoise(I,'gaussian',0,v_noise);
    img_out = uint8(255*J);
    
end
    

    