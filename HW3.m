%% Q1
clc; clear; close all;

%Givens
reynolds = [2 20 200 2000 20000 40000 200000 400000 2000000];
drag = [13.9 2.72 0.8 0.401 0.433 0.47 0.4 0.0775 0.214];

%Polyfit
x = log(reynolds);
y = log(drag);
coef = polyfit(x,y,1);
xx = linspace(min(x),max(x),11);
yy = polyval(coef,xx);
plot(x,y,'*',xx,yy)

%Vandermonde
xxv = linspace(min(x),max(x));
v = vander(x);
ydiv = y';
a = v\ydiv;
yyv = polyval(a,xxv);
hold on
plot(x,y,'*',xxv,yyv,'b'); grid on

%Spline
spl = spline(x,y,xxv);
plot(x,y,'*',xxv,spl,'g'); grid on

%Quadratic Fit
coef4 = polyfit(x,y,4);
xx4 = linspace(min(x),max(x),11);
yy4 = polyval(coef4,xx);
plot(xx4,yy4,'yellow')

%CSape
pp = csape(x,y);
fnplt(pp)

xlabel('log(Reynolds)')
ylabel('log(Drag)')
legend('','Polynomial','','Vandermonde','Data Points','Spline','Quad','Csape')
%% Q2
clc; clear; close all;

%Original Function
t1 = linspace(-1,0,1000);
t2 = linspace(0,1,1000);
f1a = 1+t1;
f2a = 1-t2;
hold on
plot(t1,f1a,t2,f2a);

%Fourier Series
t = linspace(-2,2,1000);
ks1 = 1:1;
ks2 = 1:3;
ks3 = 1:21;

%Coeff
a0 = 1/2;
ak1 = (2-2*cos(ks1.*(pi)))/((pi^2)*(ks1.^2));
ak2 = (2-2*cos(ks2.*(pi)))/((pi^2)*(ks2.^2));
ak3 = (2-2*cos(ks3.*(pi)))/((pi^2)*(ks3.^2));

for i = 1:1000
    f1(i) = a0 + sum(ak1*cos(pi.*ks1*t(i)));
    f2(i) = a0 + sum(ak2*cos(pi.*ks2*t(i)));
    f3(i) = a0 + sum(ak3*cos(pi.*ks3*t(i)));
end

%Plot fourier approxs on top of orig function
plot(t,f1,t,f2,t,f3);
grid on
xlabel('Time')
ylabel('Amplitude');
legend('1+t', '1-t', 'kmax = 1', 'kmax = 3','kmax = 21')


%% Q3
clc; clear; close all;

%Givens
r = [0 800 1200 1400 2000 3000 3400 3600 4000 5000 5500 6370];
p = [13000 12900 12700 12050 11650 10600 9900 5500 5300 4750 4500 3300];

rm = r*1000; %Convert into meters so we can use rho which is in meters
 
%Bounds
a = 0;
b = 6370*1000;
n = 11;
%Part A
%Trapezoid Rule
h = (b - a)/n;
XtrapzA = a:h:b;
functA = ((p).*(4)*(pi).*(rm.^3))/3;
Atrapz = trapz(XtrapzA,functA);
fprintf('The mass of the earth found through trapz in Part A is %e kg \n', Atrapz);

%Part B
fxB = linspace(0,6370,50);
pB = linspace(13000,3300,50);
XpartB = 1000*(fxB);
functB = ((pB).*(4)*(pi).*(fxB.^3))/3;
s = spline(rm,p,XpartB);
Btrapz = trapz(XpartB,functB);
fprintf('The mass of the earth found through trapz in Part B is %e kg \n', Btrapz);
fs = @(x) (max(pB)*4)*(pi*((x)^3))/3;
hs = (b-a)/2;
simpson = (hs/3)*(fs(a)+(4*fs((a+b)/2)+fs(b)));
fprintf('The mass of the earth found through simpsons rule in Part B is %e kg \n', simpson);
