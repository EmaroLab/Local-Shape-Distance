close all
% Randomize triangle vertices
vertices = (rand(3,3) - 0.5).*2;
sides(:,1) = sum((vertices - vertices(1,:)).^2,2);
sides(1,1) = sum((vertices(2,:) - vertices(3,:)).^2,2);

% Plot triangle
figure
hold on
fill3(vertices(1,:),vertices(2,:),vertices(3,:),1)


% Rotation of theta rad around x axis
theta = 6*rand;
R = [1 0 0; 0 cos(theta) -sin(theta); 0 sin(theta) cos(theta)];
vertices_R = (R*vertices')';

% Checking congruence of triangles
sides(:,2) = sum((vertices_R - vertices_R(1,:)).^2,2);
sides(1,2) = sum((vertices_R(2,:) - vertices_R(3,:)).^2,2);
disp("mean difference between side length of the two triangles");
mean(sides(:,1) -sides(:,2))

% Plot rotated triangle
fill3(vertices_R(1,:),vertices_R(2,:),vertices_R(3,:),2)


% Scale
scale = (rand -.5)*4;
vertices_S = vertices.*scale;

% Plot scaled triangle
fill3(vertices_S(1,:),vertices_S(2,:),vertices_S(3,:),4)

% Translation
translation = (rand -.5)*4;
vertices_T = vertices+translation;

% Plot translated triangle
fill3(vertices_R(1,:),vertices_R(2,:),vertices_R(3,:),8)

%Distances computation
a = vertices(2,:) - vertices(1,:);
b = vertices(3,:) - vertices(2,:);

u = vertices_R(2,:) - vertices_R(1,:);
v = vertices_R(3,:) - vertices_R(2,:);

disp("Rotation distance");
LSD(a,b,u,v)

u = vertices_S(2,:) - vertices_S(1,:);
v = vertices_S(3,:) - vertices_S(2,:);

disp("Scale distance");
LSD(a,b,u,v)

u = vertices_T(2,:) - vertices_T(1,:);
v = vertices_T(3,:) - vertices_T(2,:);

disp("Translation distance");
LSD(a,b,u,v)