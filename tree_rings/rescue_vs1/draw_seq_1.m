function [  ] = draw_seq_1( raw_years, raw_data, name, datarng )

years = [1825, 1855; 1900, 1940; 1960, 2012];
year_rng = [1825 2012];
year_span = year_rng(1):year_rng(end);

data = NaN + zeros(size(raw_data));
for i = 1:size(years, 1)
    data(:, find(raw_years==years(i,1)):find(raw_years==years(i,end))) = raw_data(:, find(raw_years==years(i,1)):find(raw_years==years(i,end)));
end
data = data(datarng, find(raw_years==year_span(1)):find(raw_years==year_span(end)));

figure;
base_pos = [0, 0, 18, 6 * size(data,1)];
set(gcf, 'PaperPositionMode', 'manual');
set(gcf, 'unit', 'inches');
set(gcf, 'position', base_pos);
set(gcf, 'paperunits', 'inches');
set(gcf, 'paperposition', base_pos);
for i = 1:size(data,1)
    subplot(size(data,1),1,i);
    plot(year_span, data(i,:));
    set(gca, 'YLim', [0 5]);
    set(gca, 'YTick', [0, 1, 2, 3, 4, 5]);
    set(gca, 'LineWidth', 0.1);
    set(gca, 'FontSize', 6);
    title(sprintf('%s # %d', name, datarng(1)+i-1));
end

print(gcf, sprintf('%s %d-%d.tiff', name, datarng(1), datarng(end)), '-dtiff', '-r72');

end

