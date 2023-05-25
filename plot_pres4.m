function plot_pres4(file_name, time, data1, data2, data3, data4, mu) 

clf;

if mu == 25
    mu = 2.5;
end

LABEL_FONT_SIZE = 16;

hold on
grid off
box off
axis on

h2 = plot(time, data2, 'lineWidth', 1, 'Color', [225, 51, 51]/255);
h3 = plot(time, data3, 'lineWidth', 1, 'Color', [225, 225, 0]/255);
h4 = plot(time, data4, 'lineWidth', 1, 'Color', [225, 51, 51]/255);
h1 = plot(time, data1, 'lineWidth', 1, 'Color', [0, 0, 225]/255);

hold off

%max1 = max([data1(:)]);
%min1 = min([data1(:)]);


%m = abs(max1 - min1)/20;

ylim([0, 5]);
%% Plot settings
set(gcf,'Color',[128 128 128]/256)
set(gcf,'Units','Pixels');
set(gcf, 'Position', [100, 100, 800, 300]);
set(gca,'fontsize',12)
set(gca,'Color','none')
%% axes config
ax = gca;
xlabel('$t$, s','Interpreter','latex')
set(get(ax,'XLabel'),'fontsize',LABEL_FONT_SIZE)
ylabel("$\Omega$",'Interpreter','latex')
set(get(ax,'YLabel'),'fontsize',LABEL_FONT_SIZE)
legend([h1 h2 h3 h4],{"$\hat\omega_1, \mu=$"+mu, "$\omega_1$", "$\hat\omega_2, \mu=$"+mu, "$\omega_2$"},'FontSize',LABEL_FONT_SIZE,'Interpreter','latex','Location','northeast');

%% SAVE
FOLDER = './plots/';
print(gcf,strcat(FOLDER, file_name, '.png'),'-dpng');
print(gcf,strcat(FOLDER, file_name, '.eps'),'-depsc');