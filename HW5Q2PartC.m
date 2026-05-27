%Given
L = 1;
%Function 
fun = @(lambda) cosh(lambda*L).*cos(lambda*L) + 1;
% Number of eigenvalues to find 
numeigen = 2; 
%Bisection Method
to = 1e-6;
maxiter = 100;
lambdamin = 0;
lambdamax = 10;
eigenvalues = zeros(numeigen, 1);
eigenvectors = zeros(numeigen, 100);
for i = 1:numeigen 
    iter = 0; 
    while iter < maxiter 
        lambda = (lambdamin + lambdamax)/2;
        equationValue = fun(lambda);
        if abs(equationValue) < to
            break;
        elseif equationValue < 0 
            lambdamin = lambda; 
        else 
            lambdamax = lambda; 
        end 
        iter = iter + 1;
    end 
   eigenvalues(i) = lambda; 
  lambdamin = lambdamax;
  lambdamax = lambda + 10;
  x = linspace(0, L, 100);
  eigenvector = sin(lambda*x);
  eigenvectors(i, :) = eigenvector;
end

disp('Eigenvalues:');
disp(eigenvalues);

%Plot
figure;
hold on;
for i = 1:numeigen
    modeShape = eigenvectors(i, :);
    plot(x, modeShape);
end
grid on;
xlabel('x');
ylabel('Displacement');
title('Q2 Modes');
legend('Mode 1', 'Mode 2');
