close all;

% Get the data from Simulink
% First column is the time signal
Sim_data=omegavalues;
time = Sim_data(:,1);
size (Sim_data)
signals = Sim_data(:,2:end);
size (signals)


%in case no simulink is used
%time = 0:0.01:10;
%signals = time*2;


% Plot signal
graph =[];
graph(1) = plot(time,signals(:,3));
hold on

[ a , b , c , d ] = tf2ss ( 0.0175* 86.93, [1 0.5061 86.93])
syms s 
t = time
%y= ilaplace (86.93/(s^2 + 0.5061*s + 86.93))
%y= (1738600*34746386279^(1/2)*exp(-(5061*t)/20000).*sin((34746386279^(1/2)*t)/20000))/34746386279;
%plot(t,y*-0.0175);

t = 0:size(time);
sys = ss(a,b,c,d);
initial(sys, [-0.0175 0]')
y= step(sys,t);
graph(2)= plot(t,y,'LineWidth', 3,'LineStyle','--', 'Color', 'r');

plot (time, 82.675 * ones(size(signals)),'LineWidth', 1,'LineStyle','--', 'Color', 'g');
line([0.935 0.935], [0 100], 'LineWidth', 1,'LineStyle','--', 'Color', 'g');
hold off
% Lines width in the graph
set(graph,'LineWidth',3);
% Changes linestyle. Four options are available {'-';'--';'-.';'none'}
%set(graph,{'LineStyle'},{'--';'-'});
% Specify markers of the plot
%set(graph,{'Marker'},{'none';'x'},'Markersize',15);

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