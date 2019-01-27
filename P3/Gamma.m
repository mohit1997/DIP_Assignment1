function out = Gamma(img,gamma)
    img = double(img);
    out = 255*((img./255).^gamma);
    out = cast(out,'uint8');
end