close all;
clear all;
y= hw_3a_std(02, 02, 97);
graph = get(gca, 'Children');
x_s = get(graph, 'XData');
y_s = get(graph, 'YData');
t = 0.63 *1;
%T = interp1(y_s, x_s, t)


k=1;%ustalena hodnota
T=21.61;%casova konstanta
t = 0:size(y)-1;
size (t)
y1=k.*(1-exp(-(t)./(T)));


figure
g1= plot(t,y, 'LineWidth', 1);
hold on
g2= plot(t,y1, 'LineWidth', 1,'LineStyle','--', 'Color', 'r');
grid on;
xlabel('t[s]','FontSize',10);
ylabel('y(t) [-] ','FontSize',10);
title('Porovnání odezvy modelu a skutečné odezvy');
legend ([g1, g2],["Odezva skutečného systému", "Odezva reálného systému"]);
ylim([0 1.1]);
hold off



figure
y= hw_3b_std(02, 02, 97);
t = 0:size(y)-1;

H = tf(0.707, [1 0.0754 0.101])
y1 = step(H,t);

%syms s
%F = 0.707/(s*(s^2 + 0.0754*s + 0.101));
%y1 =ilaplace (F)
%1 = 7 - 7*exp(-(377*t)/10000).*(cos((9957871^(1/2)*t)/10000) + (377*9957871^(1/2).*sin((9957871^(1/2)*t)/10000))/9957871)

figure
g1= plot(t,y, 'LineWidth', 1.5);
hold on
g2= plot(t,y1, 'LineWidth', 1.5,'LineStyle','--', 'Color', 'r');
plot (t, 7 * ones(size(t)), 'LineWidth', 1,'LineStyle','--');

grid on;
xlabel('t[s]','FontSize',10);
ylabel('y(t) [-] ','FontSize',10);
title('Porovnání odezvy modelu a skutečné odezvy');
legend ([g1, g2],["Odezva skutečného systému", "Odezva reálného systému"]);
ylim([0 12]);
xlim ([0 150]);
hold off


