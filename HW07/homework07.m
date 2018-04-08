close all;
clear all;
%PART 2
asbode (112*[1, 13, 40], [1,  20, 127, 252],[0,1],[-30,30],[0,0])
return

syms s
L = [17.8*(1+s/5)*(1+s/8)]/[(1+s/4)*(1+s/7)*(1+s/9)]
L = simplify(L)

%odozva na skok
L = tf(112*[1 13 40], [1  20 127 252])
step(L) 
title('Odezva systému na skok');

%odozva na rampu
figure;
L = tf(112*[1 13 40], [1  20 127 252 0])
step(L) 
title('Odezva systému na rampu');

%Odezva na parabolu
figure;
L = tf(112 *2*[1 13 40], [1  20 127 252 0 0])
step(L) 
title('Odezva systému na parabolu');



return 

H = tf([5],[1 150 5000 0])
bode(H)
figure;
asbode([5],[1 150 5000 0],[0,4],[-50,-250],[-100,-270]);

H = tf([151000],[1 150 5000 0])
bode(H)




figure
h = H/(1+H)
step(h)
hold on
grid on 
plot(linspace(0,0.35),linspace(1,1),'LineStyle','--','Color','black');


