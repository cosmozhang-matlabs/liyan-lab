data_live = [hs_20_rawdata(1:4,:);hs_20_rawdata(9:end,:)]/1000;
data_died = [hs_20_rawdata([5,7,8],:)]/1000;

% draw_multi_trees_avg_cnt({data_live,data_died},{hs_20_years,hs_20_years},{'Living','Died'});
figure(1);
data_live = nanmean(data_live);
data_died = nanmean(data_died);
xlim = [1772 2020];
textpos = [0.01 0.92];
% color = [92 126 229]/255;
color = 'k';
fontsize = 20;
subplot(2,1,1);
ylim = [0 max([data_live data_died]) * 1.1];
plot(hs_20_years, data_live, '-', 'Color', color, 'linewidth', 2);
hold on;
plot([1983.5 1998.5 1998.5 2013], [0.8 0.8 0.5 0.5], '-r', 'linewidth', 2);
hold on;
text('Position', [xlim(1), ylim(1)].*(1-textpos) + [xlim(2), ylim(2)].*textpos,...
    'String', 'a)',...
    'FontSize', fontsize);
set(gca, 'xlim', xlim);
set(gca, 'ylim', ylim);
ylabel('Tree-ring indices');
xlabel('Year');
set(gca,'fontsize',fontsize);
set(gca,'linewidth',2);

subplot(2,1,2);
ylim = [0 max([data_live data_died]) * 1.1];
plot(hs_20_years, data_died, '-', 'Color', color, 'linewidth', 2);
hold on;
plot([1961.5 2006], [0.87 0.5], '-r', 'linewidth', 2);
hold on;
text('Position', [xlim(1), ylim(1)].*(1-textpos) + [xlim(2), ylim(2)].*textpos,...
    'String', 'b)',...
    'FontSize', fontsize);
set(gca, 'xlim', xlim);
set(gca, 'ylim', ylim);
ylabel('Tree-ring indices');
xlabel('Year');
set(gca,'fontsize',fontsize);
set(gca,'linewidth',2);

mprintfig('savename','figgg','sizemode','single','dims',[2 1],'size',[15,5],'printscale',1);