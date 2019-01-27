function [out] = image_rotate(img, theta)
    
    % Type Conversion
    img = double(img);
    angle = pi/180.0*theta;
    [rows, cols, channels] = size(img);
    
    % Calculate Diagonal Length and form canvas
    diag_length = sqrt(rows^2 + cols^2); 
    rpadding = ceil(diag_length - rows) + 2;
    cpadding = ceil(diag_length - cols) + 2;
    imagepad = zeros(rows+rpadding, cols+cpadding, channels);
    
    % Fill in image into the canvas
    is = ceil(rpadding/2):(ceil(rpadding/2)+rows-1); % x coordinates
    js = ceil(cpadding/2):(ceil(cpadding/2)+cols-1); % Y coordinates
    
    imagepad(is, js, :) = img(:, :, :); % substitute into new indexes
    
    midx=ceil((size(imagepad,1)+1)/2); % mid point of canvas x coordinate
    midy=ceil((size(imagepad,2)+1)/2); % mid point of canvas y coordinate
    
    % Create new canvas for the rotated image
    out=zeros(size(imagepad)); % midx and midy will be same for both canvases

    % Iterating through each row
    for i=1:size(out,1)
        % Parallelizing thorough each column
        js = 1:size(out,2);
        
        % Using Nearest Neighbour to map new pixels
        x= (i-midx)*cos(angle)+(js-midy)*sin(angle);
        y= -(i-midx)*sin(angle)+(js-midy)*cos(angle);
        
        % Fixing the corner cases
        x= min(max(1, round(x)+midx), size(imagepad,1));
        y= min(max(1, round(y)+midy), size(imagepad,2));
        
        % Updating pixels for each channel
        idx = sub2ind(size(out), x, y, ones(1, size(x, 2)));
        out(i, js, 1)=imagepad(idx);
        idx = sub2ind(size(out), x, y, 2*ones(1, size(x, 2)));
        out(i, js, 2)=imagepad(idx);
        idx = sub2ind(size(out), x, y, 3*ones(1, size(x, 2)));
        out(i, js, 3)=imagepad(idx);
    end
    % Convert to original type
    out = uint8(out);

end