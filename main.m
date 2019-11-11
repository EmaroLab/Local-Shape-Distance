% Parameters;
P = 45;
threshold = 200;
plotFlag = false;
% Create gestures database
RPg = cell(1,6);

for i=1:6
    data = load(strcat("../Datasets/gesti carola_cut/G",num2str(i),"/500s_1.mat"));
    RPg(i) = mat2cell(data.data, size(data.data,1), size(data.data,2));
end

% Test on the other gestures
mat_true = [];
mat_res = []; 
results = cell(1,6);
for j=1:6
    d = dir(strcat("../Datasets/gesti carola_cut/G",num2str(j),"/*.mat"));
    list = {};
    for i=1:length(d)
        if ~strcmp(d(i).name,"500s_1.mat")
            list = [list, d(i).name];
        end
    end
    
    indexes = zeros(1,length(list));
    for i=1:length(list)
        data = load(strcat("../Datasets/gesti carola_cut/G1/", list(i)));
        [distances, index] = compare_gesture(data.data, RPg, P, threshold, plotFlag, "NLSD");
        indexes(i) = index;
        mat_res = [mat_res, index];
        mat_true = [mat_true, j];
    end
    results(j) = mat2cell(indexes,1,length(indexes));
end

C = confusionmat(mat_true,mat_res);
confusionchart(C);
%data = load(strcat("../Datasets/gesti carola_cut/G6/500s_1.mat"));
%[distances, index] = compare_gesture(data.data, RPg, P)
