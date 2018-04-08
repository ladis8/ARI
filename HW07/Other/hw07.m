close all; clear; clc;
zeta = -log(0.2)/(sqrt(pi^2 + log(0.2)^2))
PM = atan((2*zeta)/(sqrt(-2*zeta^2+sqrt(1+4*zeta^4))))
angle = PM/pi*180
H = tf([5],[1 150 5000 0])
bode(H)
hold on
h = tf([151000],[1 150 5000 0])
bode(h)


% H = tf([151000],[1 150 5000 0])
% bode(H)

% h = H/(1+H)
% step(h)
% hold on
% grid on 
% plot(linspace(0,0.35),linspace(1,1),'LineStyle','--','Color','black');

%PART 2
close all; clear; clc;
H = tf([40 40],[1 4 0 0])
step(H) %odozva na skok
print('hw0305','-depsc')
H1 = tf([40 40],[1 4 0 0 0])
step(H1) %odozva na rampu
print('hw0306','-depsc')
H2 = tf([80 80],[1 4 0 0 0 0])
step(H2) %odozva na parabolu
print('hw0307','-depsc')


