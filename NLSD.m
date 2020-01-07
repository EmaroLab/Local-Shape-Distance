function [val] = NLSD(a,b, u, v)
%NLSD Summary of this function goes here
%   Detailed explanation goes here
alpha = scalar_product(a,a);
beta = scalar_product(b,b);
gamma = scalar_product(u,u);
delta = scalar_product(v,v);
val = 0;
if alpha*beta*gamma*delta ~= 0
    val = sqrt(max(0,(1 - ((scalar_product(a,b)*scalar_product(u,v) + scalar_product(a,u) + scalar_product(u,v)*scalar_product(b,v) - scalar_product(a,v)*scalar_product(b,u))/(sqrt(alpha)*sqrt(beta)*sqrt(gamma)*sqrt(delta))))));
end
end

