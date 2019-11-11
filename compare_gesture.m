function [distances, index] = compare_gesture(SP,RPg, NumberOfPoints, threshold, plotFlag, method)
%COMPARE_GESTURE Summary of this function goes here
%   Detailed explanation goes here
P = NumberOfPoints;

%SP = movmean(SP', 4)';

if length(SP) ~= P
    SP = interpolate_gesture(SP, P);
end

sum = zeros(1,length(RPg));
for j=1:length(RPg)
    RP = cell2mat(RPg(1,j));
    %RP = movmean(RP', 4)';
    
    if length(RP) ~= P
        RP = interpolate_gesture(RP, P);
    end
    
    if strcmp(method, "LDS")
        for i=2:P-1
            a = SP(:,i)-SP(:,i-1);
            b = SP(:,i+1)-SP(:,i);
            u = RP(:,i)-RP(:,i-1);
            v = RP(:,i+1)-RP(:,i);
            sum(j) = sum(j) + LSD(a, b, u, v);
        end
    else
        for i=2:P-1
            sum(j) = sum(j) + NLSD(SP(:,i)-SP(:,i-1), SP(:,i+1)-SP(:,i), RP(:,i)-RP(:,i-1), RP(:,i+1)-RP(:,i));
        end
    end
    
    if plotFlag
        
        subplot(3,2,1)
        plot(SP(1,:))
        subplot(3,2,3)
        plot(SP(2,:))
        subplot(3,2,5)
        plot(SP(3,:))

        subplot(3,2,2)
        plot(RP(1,:))
        subplot(3,2,4)
        plot(RP(2,:))
        subplot(3,2,6)
        plot(RP(3,:))
        title(num2str(sum(j)))
        pause   
        clf
    end
end


distances = sum;
[maxV,index] = min(sum);

if maxV > threshold
    index = NaN;
end
end

