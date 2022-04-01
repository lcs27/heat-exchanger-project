function PlotDataLR(x,y,color)
if size(x,2)==size(y,1) && size(x,1)==size(y,2)
    y=y';
else if size(x,1)==size(y,1) && size(x,2)==size(y,2)
    else
        error(1,'dimension error');
    end
end

plot(x,y,'*','Color',color);

%% Linear Progression
p=polyfit(x,y,1);
yfit = polyval(p,x);
yresid = y - yfit;
SSresid = sum(yresid.^2);
SStotal = (length(y)-1) * var(y);
rsq = 1 - SSresid/SStotal;

%% Plot linear progression
hold on
plot(x,yfit,'--','Color',color)
text(x(end-3),y(end-1)+abs(p(1))*0.1,{['$k=',num2str(round(p(1),2)),'$',',$R^2=',num2str(round(rsq,2)),'$']},'Interpreter','latex','color',color)
hold off
end