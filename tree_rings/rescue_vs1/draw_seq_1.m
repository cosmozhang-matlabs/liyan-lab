function [  ] = draw_seq_1( raw_years, year_rng, raw_data, name, datarng )

year_span = year_rng(1):year_rng(end);

% data = NaN + zeros(size(raw_data));
% for i = 1:size(years, 1)
%     data(:, find(raw_years==years(i,1)):find(raw_years==years(i,end))) = raw_data(:, find(raw_years==years(i,1)):find(raw_years==years(i,end)));
% end
% data = data(datarng, find(raw_years==year_span(1)):find(raw_years==year_span(end)));

data = raw_data(:, find(raw_years==year_rng(1)):find(raw_years==year_rng(end)));

figure(1);
set(gcf, 'Visible', 'off');
base_pos = [0, 0, 18, 6 * size(data,1)];
set(gcf, 'PaperPositionMode', 'manual');
set(gcf, 'unit', 'inches');
set(gcf, 'position', base_pos);
set(gcf, 'paperunits', 'inches');
set(gcf, 'paperposition', base_pos);
for i = 1:size(data,1)
    data_to_plot = data(i,:);
    subplot(size(data,1),1,i);
    plot(year_span, data_to_plot, 'LineWidth', 0.1, 'Color', [0.4 0.6 0.7]);
    hold on;
    plot(year_span, 1+zeros(size(year_span)), 'LineWidth', 0.1, 'Color', [0 0 0]+0.5, 'LineStyle', '--');
    title(sprintf('%s(%d-%d) # %d', name, year_rng(1), year_rng(end), datarng(1)+i-1));
    set(gca, 'YLim', [0, max(0.1, max(data_to_plot)*1.05)] );
    set(gca, 'YTick', [0, 1, 2, 3, 4, 5]);
    set(gca, 'LineWidth', 1);
    set(gca, 'FontSize', 1);
    set(gca, 'FontUnit', 'points');
%     set(gca, 'LabelFontSizeMultiplier', 1);
%     set(gca, 'TitleFontSizeMultiplier', 1);
end

print(gcf, sprintf('%s(%d-%d) # %d-%d.tiff', name, year_rng(1), year_rng(end), datarng(1), datarng(end)), '-dtiff', '-r72');

end

