function [sum] = scalar_product(a,u)
%SCALAR_PRODUCT Summary of this function goes here
%   Detailed explanation goes here
sum = 0;
for i = 1:length(a)
    sum = sum + a(i)*u(i);
end
end

