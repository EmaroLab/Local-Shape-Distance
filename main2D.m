%close all
N=50;
fs=50;
f=1;

S = [];
% for k=0.0001:0.0001:0.001
N = 3;
% alpha1 = -k + 2*k*rand(1,N);
% alpha2 = -k + 2*k*rand(1,N);

ts=1/fs;
t = ts*(0:N-1);
% template= [sin(2*pi*f*t); t];
% input= [alpha1 + cos(2*pi*f*t); t + alpha2];

template = [0, 1, 0; 0, 0, 1];
input = [0, 1, 0; 0, 0, -1];

%figure
%hold on
%plot(t,template(1,:), '*g')
%plot(t,input(1,:), '*r')

shape_template = zeros(1,N-2);
shape_input = zeros(1,N-2);
Sum = 0;
for j=2:N-1
    a = template(:,j)-template(:,j-1);
    b = template(:,j+1)-template(:,j);
    a_c  = a(1) + a(2)*i;
    b_c = b(1) + b(2)*i;
    shape_template(1,j-1) = a_c/b_c;
    
    u = input(:,j)-input(:,j-1);
    v = input(:,j+1)-input(:,j);
    u_c  = u(1) + u(2)*i;
    v_c = v(1) + v(2)*i;
    shape_input(1,j-1) = u_c/v_c;    
    
    Sum = Sum + LSD(a,b,u,v);
end
Sum
input = fliplr(input);
Sum = 0;
for j=2:N-1
    a = template(:,j)-template(:,j-1);
    b = template(:,j+1)-template(:,j);
    a_c  = a(1) + a(2)*i;
    b_c = b(1) + b(2)*i;
    shape_template(1,j-1) = a_c/b_c;
    
    u = input(:,j)-input(:,j-1);
    v = input(:,j+1)-input(:,j);
    u_c  = u(1) + u(2)*i;
    v_c = v(1) + v(2)*i;
    shape_input(1,j-1) = u_c/v_c;    
    
    Sum = Sum + LSD(a,b,u,v);
end
Sum
%figure
%hold on
%plot(shape_input, '*r');
%plot(shape_template, '*g');

S = [S, Sum];
% end
figure
plot(S, '*b')