clc; clear; close all;

%ode45
[timeode45out, polarode45out] = ode45(@spacecraftODE, [0 12], [7150.14*1000, 0,  0, 9.3704e-4]);

radiusQ1 = polarode45out(:, 1);
thetaQ1 = polarode45out(:, 3);

%Plots
figure(1);
plot(timeode45out, polarode45out(:,1));
grid on;
xlabel('Time');
ylabel('Radius in M');
title('Radius over Time');

figure(2);
plot(timeode45out, polarode45out(:,3));
grid on;
xlabel('Time');
ylabel('d\thetat');
title('Theta over Time');

figure(3);
polarplot(polarode45out(:,3), polarode45out(:,1));
grid on;
title('Trajectory');

%Values at impact
impactR = find(radiusQ1 <= 6378.14*1000, 1);
thetai = thetaQ1(impactR);

%Find the velocity components at impact
vr_at_impact = y(impactR, 3);
vtheta_at_impact = y(impactR, 4);

% Compute the horizontal and vertical velocities at impact
horizontal_velocity_at_impact = vr_at_impact;
vertical_velocity_at_impact = vtheta_at_impact / radius(impactR);

%function
function polardot = spacecraftODE(t , polarF) %Inputs so we can use ode45
    %Constants
    Me = 5.9742e24;
    G = 6.672e-11;

    %Equations
    polardot(1) = polarF(2);
    polardot(2) = polarF(1)*(polarF(4))^2-(G*Me)/(polarF(1))^2;
    polardot(3) = polarF(1);
    polardot(4) = -(2*(polarF(2))*(polarF(4)))/(polarF(1));

    %Formatting
    polardot = polardot';
end