%HW Prob 1
clc; clear; close all;

T = 0.5;
y = [3.5 6.0 11.7 14.1 15.3 8.5 8.0 9.1 10.1 10.9 8.6 1.05 -1.9 -3.2 -4.7 -4.8 -3.9 -1.7 0.5 3.5];
N = length(y);
w = 2*pi/T;
t = linspace(0,T,N);
k = 0:N-1;

%A
a0 = (1/N)*sum(y);
ak = [];
bk = [];

for j = 1:length(k)
    ak1 = [];
    bk1 = [];
    for i = 1:N
        ak1 = [ak1 y(i).*cos(k(j).*w.*t(j))];
        bk1 = [bk1 y(i).*sin(k(j).*w.*t(j))];
    end
end
ak = [ak (2/N)*sum(ak1)];
bk = [bk (2/N)*sum(bk1)];

%B
ck = sqrt((ak.^2) * (bk.^2));
phi = atan(-bk/ak);

%C
figure(1);
plot(t,y,ak1,y,bk1,y)
xlabel('Time');
ylabel('Amplitude');
legend('Original','Ak','Bk');