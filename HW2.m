clc; clear all;
%% Q1 Num 1
format long e
%Part A
hilba = single(hilb(8));
condH = cond(hilba);
%Part B
b = single(ones(8,1));
invhilba = inv(hilba);
hilbx = b.*invhilba;
r = b - hilba*hilbx;
%Part C
e = invhilba .* r;
%Part D
x_t = [8 504 -7560 46200 -138600 216216 -168168 51480];
trueerror = abs(x_t - e)/abs(x_t);
%Part E


%% Q1 Num 2
clc; clear; close all;
format long
%Givens
u = 1000;
Mo = 1*10^6;
m = 1*10^4;
g = 9.81;
v = 340;
t = 0;
old = 0;
func = @(t) u*log(Mo/(Mo-(m*t)))-(g*t)-v;
n = 0;

%Intial Guesses
a = 20;
b = 100;

%Error
e = 0.00001;
maxerror = e + 1;

%Function @ guesses
fa = func(a);
fb = func(b);

%Midpoint
c = (a+b)/2;

while maxerror > e
    fc = func(c);
    if fa * fc < 0
        b = c;
    else
        a = c;
    end
    old = c;
    c = (a+b)/2;
    e = abs(c - old)/abs(c);
end


fprintf('The rocket reaches the speed of sound in %d seconds \n', t);
fprintf('The mass of the rocket when it reaches the speed of sound is %d\n',Mo);

%% Q2
clc; clear; close all;
format long
%Givens
gamma = 1.4;
M1 = 2;
theta = -15*pi/180;

%Equations
vM = @(M) sqrt((gamma + 1)/(gamma - 1))*atan(sqrt((gamma - 1)/(gamma + 1))*(M^2-1)) - atan(sqrt(M^2-1));
machnum = @(x) vM(M1) - theta - vM(x);

%fSolve
M2 = fsolve(machnum,M1);