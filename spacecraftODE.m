function polardot = spacecraftODE(t, polarF)
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