close all;
clear;
clc;
figure;
t = linspace(-10,4);
x = 6*exp(-t).*cos(3*t) - 2*exp(-t).*sin(3*t);
y = - exp(-t).*sin(3*t);
plot(t,x,t,y);
xlabel('Time(s)');
title('Zobrazenie funkcii x1 a x2');
legend('x_{1}','x_{2}');
%print('Jojov Graf','-depsc')


