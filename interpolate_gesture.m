function [newG] = interpolate_gesture(g, P)
%INTERPOLATE_GESTURE Summary of this function goes here
%   Detailed explanation goes here
newG = zeros(3,P);
L = length(g);
Pless1 = P-1;
for i=1:P
    factor1 = (P-i)/Pless1;
    factor2 = i/Pless1;
    factorForI = (L*i)/P;
    for j=1:size(g,1)
        newG(j,i) = factor1*g(j,floor(factorForI)) + factor2 * g(j,ceil(factorForI));
    end
end
end

