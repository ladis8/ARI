close all;
[A, B, C, x0] = hw_1_std(02,02,97);
D=0;

%Systems toolbox
sys = ss (A,B,C,D);
[b_pol,a_pol] = ss2tf(A,B,C,D);
H_sys = tf(b_pol,a_pol)
H_pol = sdf(A,B,C,D)

%[ a , b , c , d ] = abcd ( H_pol ) 
[ a , b , c , d ] = tf2ss (b_pol,a_pol) 
return


[ a , b , c , d , e ] = ss2dss (A, B, C,D) %Descriptor
[ N,D] = dss2lmf ( a , b , c , d , e )
[ Z , P ,K] = lmf2zpk (N, D) %Zero p o l e g a i n
[ N,D] = zpk2rmf ( Z , P ,K) %R i g h t m a t r i x f r a c t i o n c o n v e r s i o n
[NUM,DEN] = rmf2tf (N, D)  %Transfer function form
syms s

%Hmat = C *inv((s * eye(2) -A))* B
[b,a] = ss2tf(A,B,C,D)
p =roots (b)
[r,p]=residue ([108 621], [1 15 3 0])
%W = H *s
Wmat = (108*s + 621)/(s*(s^2 + 15*s +3))

partfrac(Wmat, s)
w = ilaplace (W)




return 
%initial response
figure
initial (sys, x0)
ylabel ('y amplitude [-]');
legend ('y(t)');
grid on
set(findall(gca, 'Type', 'Line'),'LineWidth',1.5);


%response
t = 0:0.01:10; %do the simulation from 0 to 2 seconds with step 0.01

%3 possible inputs, you can test with other inputs
%just be sure that u is the same size has t
%u = [1 zeros(1,numel(t)-1)]; %impulse
u = ones(1,numel(t)); %step


[y,x] = lsim(A,B,C,D,u,t,x0); %do the simulation

figure
plot(t,y)
title ('Response');
ylabel ('y amplitude [-]');
xlabel ('Time [s]');
grid on
legend('y(t)')
set(findall(gca, 'Type', 'Line'),'LineWidth',2);


