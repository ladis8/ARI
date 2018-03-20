%Ukol 2
figure;
t = linspace(-10,10);
x = 6*exp(-t).*cos(3*t) - 2*exp(-t).*sin(3*t);
y = - exp(-t).*sin(3*t);
plot(t,x,t,y);
xlabel('Time[s]');
ylabel('Amplitude[-]');
title('Řešení soustavy x1 a x2');
legend('x_{1}','x_{2}');
%print('Jojov Graf','-depsc')
return 

%Ukol3
t = linspace(-10,4);
x = 6*exp(-t).*cos(3*t) - 2*exp(-t).*sin(3*t);
y = - exp(-t).*sin(3*t);
plot(t,x,t,y);
xlabel('Time(s)');
title('Zobrazenie funkcii x1 a x2');
legend('x_{1}','x_{2}');
%print('Jojov Graf','-depsc')


%Ukol 5
A = [-4 2 0 0; -6 4 0 0; -3 3 2 -2; -9 9 2 -3];
B = [1 ; 0.5; 0 ;-1];
C = [4 0 0 0];
syms s
H = C *inv((s * eye(4) -A))* B

%Ukol 6
A = [1 0 0; 2 -2 -2; 1 2 0];
lambda = eig(A)

%Ukol 7

Hs = tf([1 -3], [1 1, 1 7])
fs = 10; % [Hz]
 
Ts = 1 / fs
Hz = c2d(Hs, Ts, 'zoh')  % impulseinvariant, matched
Hz = c2d(Hs, Ts, 'impulse')  % impulseinvariant, matched

%Ukol 8
sys = tf(1, [1 0.5 -1])
stable = isstable(sys)

root = abs (roots ([3 -1 0.5]))

sys = tf(1, [1 0 0])
stable = isstable(sys)
