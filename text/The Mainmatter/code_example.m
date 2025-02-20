function [y, y_total] = customFunc(x)
% This is an example MATLAB function.

y = x.^2;
y_total = sum(y);
fprintf("The total is %.2f\n", y_total);