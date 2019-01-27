function [out] = fast_bilinear(img, scl_row, scl_col)
    % Change type to double     
    img = double(img);
    
    % Find rows, columns and channels
    [rows, cols, channels] = size(img);
    
    % New number of rows and columns
    R = floor(rows*scl_row);
    C = floor(cols*scl_col);
    
    % Scale factors adjusted
    sclrow = R/(rows - 1);
    sclcol = C/(cols - 1);
    
    % Initialize New Image Matrix
    out = zeros(R, C, channels);
    
    % Iterate over Rows
    for i=1:R
        % Mapping to Original Image - x coordinate
        rorg = i/sclrow;
        r_up = max(1, floor(rorg));
        r_down = ceil(rorg);
        
        % Distance to Upper Row
        drow = rorg - r_up;
        
        % Parallelized for each Row
        j=1:C;
        
        % Mapping to Original Image - y coordinate
        corg = j/sclcol;
        c_left = max(1, floor(corg));
        c_right = ceil(corg);

        dcol = corg - c_left;
        
        % Nearest Pixels in Original Image
        UL = img(r_up, c_left, :);
        DL = img(r_down, c_left, :);
        UR = img(r_up, c_left, :);
        DR = img(r_down, c_right, :);
        
        % Weighted sum - using bilinear interpolation
        pixel_value = (UL.*(1-dcol) + UR.*(dcol))*(1-drow) + (DL.*(1-dcol) + DR.*(dcol))*drow;
    
        % Updating pixels of new image
        out(i, j, :) = pixel_value;
        
        % Type Conversion
        out = uint8(out);
    end
        
    
end
