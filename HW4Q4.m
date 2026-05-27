%HW4 Q4
clc; clear; close all;

%Bounds and givens
step = 0.5;
t = 0:step:10*pi;
a = 0; %Lower Bound
b = 10*pi; %Upper Bound
yinitial = 1; %Initial Condition

%Via hand solution
ysep = exp(-t/4+(sin(2*t)/8));

%Euler Explicit
[te,ye] = eulerexpHW4(@hw4ode,a,b,step,yinitial);

%Runge Katta
[tr,yr] = rungekatta4HW4(@hw4ode,a,b,step,yinitial);

%ODE 45
[to,yo] =  ode45(@hw4ode,t,yinitial);

%Plot to Compare
figure(1)
plot(t,ysep)
grid on
hold on
plot(te,ye,'--p')
plot(tr,yr,'--o')
plot(to,yo,'*g')
xlabel('t');
ylabel('y');
legend('Hand Solution','Euler Explicit','Runge-Katta 4th Order','ode45','location','NW')
grid on

%Function to solve ODE
function dydt = hw4ode(t,y) 
    dydt = (-0.5)*y*(sin(t))^2;
end