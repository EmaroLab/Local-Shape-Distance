function [val] = LSD(a,b, u, v)
%LSD Summary of this function goes here
%   Detailed explanation goes here
alpha = scalar_product(a,a);
beta = scalar_product(b,b);
gamma = scalar_product(u,u);
delta = scalar_product(v,v);
val = 0;
if beta*delta ~= 0
    numerator = alpha*delta + beta*gamma - 2*(scalar_product(a,b)*scalar_product(u,v)-scalar_product(a,v)*scalar_product(b,u)+scalar_product(a,u)*scalar_product(b,v));
    val = sqrt(numerator/(beta*delta));
end
end

