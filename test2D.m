close all
% Randomize triangle vertices
vertices = (rand(3,2) - 0.5).*2;

% Plot triangle
figure
hold on
T = delaunayTriangulation(vertices); 
triplot(T)

% Rotation of theta rad
theta = 6*rand;
R = [cos(theta) -sin(theta); sin(theta) cos(theta)];
vertices_R = (R*vertices')';

% Plot rotated triangle
T = delaunayTriangulation(vertices_R);
triplot(T,'--')

% Scale
scale = (rand -.5)*4;
vertices_S = vertices.*scale;

% Plot scaled triangle
T = delaunayTriangulation(vertices_S);
triplot(T,':')

% Translation
translation = (rand -.5)*4;
vertices_T = vertices+translation;

% Plot translated triangle
T = delaunayTriangulation(vertices_T);
triplot(T,':')

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