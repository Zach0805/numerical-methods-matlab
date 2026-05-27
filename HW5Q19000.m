clc; clear; close all;

% Initial conditions found on paper
Me = 5.9742e24;
G = 6.672e-11;
rI = 7150.14*1000;
rDot = 9000;
thetaI = 0;
thetaDot = 9.3704e-4;

%ode45
[tout, polarout] = ode45(@spacecraftODEB, [0 1200], [rI, rDot, thetaI, thetaDot]);

%Radius and Theta
rF = polarout(:, 1);
rFKM = polarout(:, 1)./1000;
thetaF = polarout(:, 3);

figure(3);
polarplot(thetaF, rFKM);
title('Trajectory 9000');

%  
function polardot = spacecraftODEB(t, polarF)
    %Constants
    Me = 5.9742e24;
    G = 6.672e-11;

    %Equations
    polardot(1) = polarF(2);
    polardot(2) = polarF(1)*(polarF(4))^2-(G*Me)/((polarF(1))^2);
    polardot(3) = polarF(4);
    polardot(4) = -(2*(polarF(2))*(polarF(4)))/(polarF(1));

    %Formatting
    polardot = polardot';
end