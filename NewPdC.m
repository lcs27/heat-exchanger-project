clear
load data.mat
root='E:\MonFichier\Etude\ST7\Projet-safran\pseudo-periodic\models\diamond'
figure(1)
Sc=4.7090E-4;
Sf=4.7625E-4;
plot(1:N,results(:,14)-results(:,15),'r-*');
hold on
plot(1:N,results(:,16)-results(:,17),'b-*');
plot(1:N,-(Sf*(results(:,17)-results(:,15))+Sc*(results(:,16)-results(:,14)))/(Sc+Sf),'k-*','linewidth',1.5)
title('Perte de charge/Pa')
legend({'Hot gas','Cold gas','Average'},'Location', 'Best')
hold off
grid on
saveas(gcf,[root,'\result\PdCharge'],'fig')
saveas(gcf,[root,'\result\PdCharge'],'jpg')
close all
save('data.mat')