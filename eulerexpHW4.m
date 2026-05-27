%Explicit Euler method
function [t,y] = eulerexpHW4(ODE,a,b,step,yinitial)
t(1) = a; 
y(1) = yinitial; 
Nee = (b-a)/step; %Number of steps

    for i = 1:Nee
        t(i+1) = t(i) + step;
        y(i+1) = y(i) + ODE(t(i),y(i))*step;
    end
end