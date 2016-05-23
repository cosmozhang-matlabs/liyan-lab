function [  ] = draw_two_groups_relation( group1, name1, group2, name2, years, rel_interval )
%DRAW_TWO_GROUPS_RELATION Summary of this function goes here
%   Detailed explanation goes here

years_cnt = size(years);
years_cnt = years_cnt(2);

group1 = group1 / 1000;
group2 = group2 / 1000;

group1_mean = nanmean(group1, 1);
group2_mean = nanmean(group2, 1);

figure(1);
set(gcf,'position',[0,0,1000,400])

h1 = plot(years, group1_mean, 'r'); hold on;
h2 = plot(years, group2_mean, 'k'); hold on;
legend([h1,h2], name1, name2); hold on;
xlabel('Year');
ylabel('Tree Ring Index');

maxm = max(max(group1_mean), max(group2_mean));
minm = min(min(group1_mean), min(group2_mean));
text_pos = [maxm - (maxm - minm) * 0.15, years(1) + rel_interval / 2];
for i = 1:rel_interval:years_cnt
    end_p = min(i+rel_interval-1,years_cnt);
    group1_mean_strip = group1_mean(i:end_p)';
    group2_mean_strip = group2_mean(i:end_p)';
    group2_mean_strip = group2_mean_strip(~isnan(group1_mean_strip));
    group1_mean_strip = group1_mean_strip(~isnan(group1_mean_strip));
    group1_mean_strip = group1_mean_strip(~isnan(group2_mean_strip));
    group2_mean_strip = group2_mean_strip(~isnan(group2_mean_strip));
    if sum(~isnan(group1_mean_strip)) && sum(~isnan(group2_mean_strip))
        correffc_val = corr(group1_mean_strip, group2_mean_strip);
%         text_to_draw = {[num2str(years(i)), ' to ', num2str(years(end_p))]; ['r = ', num2str(correffc_val)]};
        text_to_draw = ['r = ', num2str(correffc_val)];
        text(text_pos(2), text_pos(1), text_to_draw, 'HorizontalAlignment', 'center'); hold on;
    end
    if end_p < years_cnt
        line('XData', [years(end_p) years(end_p)], 'YData', [minm maxm], 'LineStyle', '--');
    end
    text_pos(2) = text_pos(2) + rel_interval;
end

end

