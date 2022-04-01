% Code to be run under the condition of COMSOL multiphysics with MATLAB
% written by Chensheng Luo
% Post Traitment of results
% In normal case, this code doesn't need to be run manually.

%% Sauvegarde
saveas(1,[root,'\result\CutSection'],'fig')
saveas(1,[root,'\result\CutSection'],'jpg')
saveas(2,[root,'\result\Output'],'fig')
saveas(2,[root,'\result\Output'],'jpg')
close all

%% Temperature
figure
PlotDataLR(0:N,[273.15+700;results(:,1)],'red');
hold on
PlotDataLR(0:N,[273.15+100;results(:,2)],'blue');
hold off
title('T/K')
legend({'Hot gas','LR','Cold gas','LR'},'Location', 'Best')
grid on
saveas(gcf,[root,'\result\T'],'fig')
saveas(gcf,[root,'\result\T'],'jpg')

%% Vitesse
figure
plot(1:N,results(:,4),'r--');
hold on
plot(1:N,results(:,5),'b--');
plot(1:N,results(:,6),'r.-');
plot(1:N,results(:,7),'b.-');
title('vitesse/ms-1')
legend({'Uhot','Ucold','Vhot','Vcold'},'Location', 'Best')
grid on
saveas(gcf,[root,'\result\UV'],'fig')
saveas(gcf,[root,'\result\UV'],'jpg')

%% Vitesse sortie
figure
PlotDataLR(0:N,abs([-46;results(:,8)]),'red');
hold on
PlotDataLR(0:N,abs([-20;results(:,9)]),'blue');
hold off
title('vitesse/ms-1')
legend({'Hot gas','LR','Cold gas','LR'},'Location', 'Best')
grid on
saveas(gcf,[root,'\result\W'],'fig')
saveas(gcf,[root,'\result\W'],'jpg')

%% Chute de pression
figure
plot(1:N,results(:,10)-results(:,12),'r-*');
hold on
plot(1:N,results(:,11)-results(:,13),'b-*');
hold off
title('$\Delta p/Pa$','Interpreter','latex')
legend({'Hot gas','Cold gas'},'Location', 'Best')
grid on
saveas(gcf,[root,'\result\Pdiff'],'fig')
saveas(gcf,[root,'\result\Pdiff'],'jpg')

%% Perte de charge
figure
plot(1:N,results(:,15)-results(:,14),'r-*');
hold on
plot(1:N,results(:,17)-results(:,16),'b-*');
hold off
title('Perte de charge/Pa')
legend({'Hot gas','Cold gas'},'Location', 'Best')
grid on
saveas(gcf,[root,'\result\PdCharge'],'fig')
saveas(gcf,[root,'\result\PdCharge'],'jpg')

close all
%% Sauvegarder tout
save('data.mat')