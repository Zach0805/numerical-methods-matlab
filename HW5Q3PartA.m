clc; clear; close all;
L = 1;
x = linspace(0,L,1000);
t = 0.1;
N = 100;
T = zeros(size(x));

for n = 1:N
    T = T + 5*exp(-(n*pi)^2*0.1)*sin((n*pi*x)/L);
end

T = T + 2;

plot(x,T);
grid on;
xlabel('x');
ylabel('Temp');
title('Q3 Part A Graph');