COUNTER=5;
load data.mat
figure(1)
hold on
pdc=-(Sf*(results(:,17)-results(:,15))+Sc*(results(:,16)-results(:,14)))/(Sc+Sf);
plot(1:N,pdc,'-*','linewidth',1.5,'color','magenta')
mean(pdc)
hold off
if COUNTER==1
    legends={MODEL};
else
    legends=[legends,{MODEL}];
end

root='E:\MonFichier\Etude\ST7\Projet-safran\pseudo-periodic\models';
if COUNTER==5
    legend(legends,'Location', 'Best')
    title('Pressure Drop/Pa')
    grid on
    saveas(gcf,[root,'\PdC'],'fig')
    saveas(gcf,[root,'\PdC'],'jpg')
end