%4th Order Runge Katta
function[t,y] = rungekatta4HW4(ODE,a,b,step,yinitial)
    t(1) = a;
    y(1) = yinitial;
    Nrk = (b-a)/step;

    for i = 1:Nrk
        t(i+1) = t(i) + step;
        k1 = ODE(t(i),y(i));
        xhalf = t(i) + step/2;
        yhalf = y(i) + k1*step/2;
        k2 = ODE(xhalf,yhalf);
        yk2 = y(i) + k2*step/2;
        k3 = ODE(xhalf,yk2);
        yk3 = y(i) +k3*step;
        k4 = ODE(t(i+1),yk3);
        y(i+1) = y(i)+ (k1 + 2*k2 + 2*k3 +k4) * (step/6);
    end
end