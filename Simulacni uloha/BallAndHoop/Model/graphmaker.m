close all;


k= 8.657

syms R bb bh Jh
g= 9.81
r=0.0091
m=0.032
c1 =-1.070
c4 =-k *c1
d2 =-0.509
d3 =-86.7

eqn1= c1==  1/(2*m*R^2 + 7*Jh)*(7*bh - 5*R^2*bb/r^2)
eqn2= d2==  1/(2*m*R^2 + 7*Jh)*(5*Jh*bb/m*r^2 - 2*bh)
eqn3= d3==-1/(2*m*R^2 + 7*Jh)*g*(5*Jh/R + 2*m*R)
eqn4= c4 == 2/(2*m*R^2 + 7*Jh)
eqn= [eqn1,eqn2,eqn3,eqn4]
[solR, solbb, solbh, solJh] = solve(eqn, [R,bb,bh,Jh]);
%S = structfun(@vpa,symsol,'UniformOutput',false)
sR = vpa(solR)
sJh = vpa(solJh)
sbb= vpa(solbb)
sbh = vpa(solbh)






cc1=1/(2*m*sR(2)^2 + 7*sJh(2))*(7*sbh(2) - 5*sR(2)^2*sbb(2)/r^2)
cc4= 1/(2*m*sR(2)^2 + 7*sJh(2))



% Get the data from Simulink
% First column is the time signal
Sim_data=psivalues;
time = Sim_data(:,1);
size (Sim_data)
signals = Sim_data(:,2:end);
size (signals)


%in case no simulink is used
%time = 0:0.01:10;
%signals = time*2;


% Plot signal
graph =[];
graph(1) = plot(time,0.0175 * signals(:,3));

hold on


%syms s 
%t = time
%y= ilaplace (86.93/(s^2 + 0.5061*s + 86.93))
%y= (1738600*34746386279^(1/2)*exp(-(5061*t)/20000).*sin((34746386279^(1/2)*t)/20000))/34746386279;
%plot(t,y*-0.0175);


A1= 0.950
A2=0.775
u = log(A1/A2)
Td=0.6741
zeta = u/sqrt(4*pi^2 + u^2)
omega = 2*pi/(Td*sqrt(1-zeta^2))
b= [0.0175 *omega^2]
a= [1 2*zeta*omega omega^2]

[ a , b , c , d ] = tf2ss (b,a)
sys = ss(a,b,c,d);

t = 0:size(time);
initial(sys, [0 -0.0175 ]')




%y= step(sys,t);
%graph(2)= plot(t,y,'LineWidth', 3,'LineStyle','--', 'Color', 'r');

%plot (time, 82.675 * ones(size(signals)),'LineWidth', 1,'LineStyle','--', 'Color', 'g');
%line([0.935 0.935], [0 100], 'LineWidth', 1,'LineStyle','--', 'Color', 'g');
hold off
% Lines width in the graph
set(graph,'LineWidth',3);


% Change the hiearchy of ploted lines
uistack(graph(1), 'bottom')

% Font size of the legend
set(gca,'FontSize',15);
% Signals description and position of the legend
legend(graph ,{'omega(t)','omega__lin(t)'},'Location','SouthEast');

% Axes description
xlabel('Time t[s]','FontSize',15);
ylabel('Omega [rad/s]','FontSize',15);
title('Odezva obruče na skok - úhlová rychlost');

% Do this only if you want to change the implicit limits
x_plot_limits = [0 10];
y_plot_limits = [-0.1 0.1];

xlim(x_plot_limits);
ylim(y_plot_limits);

% Turn on the grid
grid on; 


%% Export to files
file = 'file_to_export'
% srt dimensipon for a PDF export
set(gcf, 'PaperUnits', 'centimeters ',  'OuterPosition', [150, 50, 1300, 850], 'PaperType', 'A4', 'PaperOrientation', 'landscape');
set(gcf,'Position', [200,100,1200,800]);
%set landscape figure for pdf export
set(gcf,'PaperPositionMode','Auto', 'PaperOrientation', 'Landscape')
%save pdf
%print(gcf, '-dpdf', strcat(file, '.pdf'), '-r0');
%save eps
print(gcf, '-depsc2', strcat(file, '.eps'));
%save png
%han = getframe(gcf);
%imwrite(han.cdata, strcat(file, '.png'));