clear;clc;close all;
sys = hw_4_std(9,3,97);

%x>0
figure;
xlim([-10 40]);
ylim([-10 10]);
grid on;
hold on;
% ha = gca;
% ha.XAxisLocation = 'origin';
% ha.YAxisLocation = 'origin';
plot(linspace(0,0),linspace(-100,100),'Color','green','LineWidth',3,'LineStyle','--');
for k=0:1.6:100
    plot(linspace(k,k),linspace(-40,40),'LineStyle','--','Color','yellow','LineWidth',0.1);
end
legend('k_i=0','k_i>0','Location','southwest'); 
xlabel('k_i');
ylabel('k');
a = plot(linspace(-100,100),linspace(0,0),'LineStyle','--','Color','black','LineWidth',0.1);
b = plot(linspace(0,0),linspace(-100,100),'LineStyle','--','Color','black','LineWidth',0.1);
uistack(a,'bottom');
uistack(b,'bottom');
   
    
    
% prienik    
figure;
xlim([-10 40]);
ylim([-10 10]);
grid on;
hold on;
% ha = gca;
% ha.XAxisLocation = 'origin';
% ha.YAxisLocation = 'origin';
xlabel('k_i');
ylabel('k');
for k=0:0.3:30
    plot(linspace(0,5*k),linspace((k-6),(k-6)),'LineStyle',':','Color','r','LineWidth',1);
end
plot(linspace(0,0),linspace(-6,100),'Color','r','LineWidth',3,'LineStyle','--');
x = linspace(0,100);
y = x./5 - 6;
plot(x,y,'Color','r','LineWidth',3,'LineStyle','--');    
legend('k_i>0 & k>0.2k_i-6','Location','southeast');
a = plot(linspace(-100,100),linspace(0,0),'LineStyle','--','Color','black','LineWidth',0.1);
b = plot(linspace(0,0),linspace(-100,100),'LineStyle','--','Color','black','LineWidth',0.1);
uistack(a,'bottom');
uistack(b,'bottom');


%0.2x-6 
figure;
xlim([-10 40]);
ylim([-10 10]);
grid on;
hold on;
% ha = gca;
% ha.XAxisLocation = 'origin';
% ha.YAxisLocation = 'origin';   
xlabel('k_i');
ylabel('k');    
x = linspace(-100,100);
y = x./5 - 6;
plot(x,y,'Color','green','LineWidth',3,'LineStyle','--');     
for k=0:0.7:100
    plot(linspace(-100,100),linspace(-100,100)./5-6+k,'LineStyle','--','Color','green','LineWidth',0.1);
end  
legend('k=0.2k_i-6','k>0.2k_i-6','Location','southeast'); 

a = plot(linspace(-100,100),linspace(0,0),'LineStyle','--','Color','black','LineWidth',0.1);
b = plot(linspace(0,0),linspace(-100,100),'LineStyle','--','Color','black','LineWidth',0.1);
uistack(a,'bottom');
uistack(b,'bottom');


%vsetko v kope
figure;
xlim([-10 40]);
ylim([-10 10]);
grid on;
hold on;
% ha = gca;
% ha.XAxisLocation = 'origin';
% ha.YAxisLocation = 'origin';
xlabel('k_i');
ylabel('k');

%kvoli legende
plot(linspace(-100,100),linspace(-100,100)./5-6,'LineStyle','--','Color','green','LineWidth',0.1);
plot(linspace(0,0),linspace(-40,40),'LineStyle','--','Color','yellow','LineWidth',0.1);
plot(linspace(0,0),linspace((-6),(-6)),'LineStyle',':','Color','r','LineWidth',1);


x = linspace(-100,100);
y = x./5 - 6;
plot(x,y,'Color','green','LineWidth',3,'LineStyle','--');     
for k=0:0.7:100
    plot(linspace(-100,100),linspace(-100,100)./5-6+k,'LineStyle','--','Color','green','LineWidth',0.1);
end  
plot(linspace(0,0),linspace(-100,100),'Color','yellow','LineWidth',3,'LineStyle','--');
for k=0:1.6:100
    plot(linspace(k,k),linspace(-40,40),'LineStyle','--','Color','yellow','LineWidth',0.1);
end

for k=0:0.3:30
    plot(linspace(0,5*k),linspace((k-6),(k-6)),'LineStyle',':','Color','r','LineWidth',1);
end
plot(linspace(0,0),linspace(-6,100),'Color','r','LineWidth',3,'LineStyle','--');
x = linspace(0,100);
y = x./5 - 6;
plot(x,y,'Color','r','LineWidth',3,'LineStyle','--');    
a = plot(linspace(-100,100),linspace(0,0),'LineStyle','--','Color','black','LineWidth',0.1);
b = plot(linspace(0,0),linspace(-100,100),'LineStyle','--','Color','black','LineWidth',0.1);
legend('k>0.2k_i-6','k_i>0','k_i>0 & k>0.2k_i-6','Location','southeast');
title('Hodnoty zesílení se stabilní ZV');
uistack(a,'bottom');
uistack(b,'bottom');
