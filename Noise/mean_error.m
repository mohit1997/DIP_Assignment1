function [error] = mean_error(inp1, inp2);
    error = (inp1 - inp2).^2;
    error = mean(error(:));
end