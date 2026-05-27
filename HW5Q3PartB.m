clc; clear; close all;
L = 1;
x = linspace(0,L,1000);
t = 0.1;
N = 100;
T = zeros(size(x));

for n = 1:N
    T = 2 + (T + ((-2)/(n*pi)*(-2)*cos(n*pi)-1)*exp(-0.1*n^2*pi^2)*sin((n*pi*x)/L));
end

T = T + 2;

plot(x,T);
grid on;
xlabel('x');
ylabel('Temp');
title('Q3 Part B Graph');