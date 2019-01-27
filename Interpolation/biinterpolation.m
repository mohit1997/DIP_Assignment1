function [out] = biinterpolation(img, scl_row, scl_col)
    I = double(img(:));
    [rows, cols, channels] = size(img);
    R = floor(rows*scl_row);
    C = floor(cols*scl_col);
    
    sclrow = R/(rows - 1);
    sclcol = C/(cols - 1);
    
    out = zeros(R, C, channels);
    
    for i=1:R
        rorg = i/sclrow;
        r_up = max(1, floor(rorg));
        r_down = ceil(rorg);
        
        drow = rorg - r_up;
        for j=1:C
            corg = j/sclcol;
            c_left = max(1, floor(corg));
            c_right = ceil(corg);
            
            dcol = corg - c_left;
            
            UL = img(r_up, c_left, :);
            DL = img(r_down, c_left, :);
            UR = img(r_up, c_left, :);
            DR = img(r_down, c_right, :);
            
            pixel_value = (UL*(1-dcol) + UR*(dcol))*(1-drow) + (DL*(1-dcol) + DR*(dcol))*drow;
            
            out(i, j, :) = pixel_value;
        end
    end
        
    
end
