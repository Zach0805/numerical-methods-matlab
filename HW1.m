%% Q3 
clc; clear; close all;
format long
xQ3 = 0.001;

%%Part B
truevalueB = (sqrt(16+xQ3)-4)/(xQ3);
approxvalue = 0.12;
relerrorB = (abs(truevalueB-approxvalue))/abs(truevalueB);

%%Part C
truevalueC = ((sqrt(16+xQ3)-4)/(xQ3))*((sqrt(16+xQ3)+4)/(sqrt(16+xQ3)+4));
approxvalue = 0.12;
relerrorC = (abs(truevalueC-approxvalue))/abs(truevalueC);

%%Solution
display(relerrorB);
display(relerrorC);

%% Q4 
clc; clear; close all;
format long
%%Part A

%Givens
N = 100000;
truevalueQ4A = (pi)^4/90;

%Going forward
ansforward = 0;
for i = 0:1:N
    ansforward = ansforward + (1)/(N)^4;
end
forwardsrelerror = (abs(truevalueQ4A-ansforward))/abs(truevalueQ4A);

%Going backwards
ansbackwards = 0;
for i = N:-1:1
    ansbackwards = ansbackwards + (1)/(N)^4;
end
backwardsrelerror = (abs(truevalueQ4A-ansbackwards))/abs(truevalueQ4A);

%%Solutions
display(forwardsrelerror);
display(backwardsrelerror);

%Q4 Part B

%Givens
NPB = 10000;
NPB1 = single(NPB);
truevalueQ4PB = (pi)^4/90;
truevalueQ4PB1 = single(truevalueQ4PB);

%Going forward
ansforwardB = 0;
ansforwardB1 = single(ansforwardB);
for i = 1:1:NPB1
    ansforwardB1 = ansforwardB1 + (1)/(NPB1)^4;
end
forwardsrelerrorB = (abs(truevalueQ4PB1-ansforwardB1))/abs(truevalueQ4PB1);

%Going backwards
ansbackwardsB = 0;
ansbackwardsB1 = single(ansbackwardsB);
for i = NPB1:-1:1
    ansbackwardsB1 = ansbackwardsB1 + (1)/(NPB1)^4;
end
backwardsrelerrorB = (abs(truevalueQ4PB1-ansbackwardsB1))/abs(truevalueQ4PB1);

%%Solutions
display(forwardsrelerrorB);
display(backwardsrelerrorB);