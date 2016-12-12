function [  ] = draw_data_figures(datas, years, options, save_name)
%DRAW_DATA_FIGURES Summary of this function goes here
%   Detailed explanation goes here

% options : struct
%     titles : vector
%     mode   : string : h -- hold on; f -- multipul figures; s -- sub figures
%     subplot_size : len 2 vector. subplot size. if mode is 's'

data_len = size(datas);
year_cnt = data_len(2);
sample_cnt = data_len(1);

if nargin < 3
    options = struct();
end
if isfield(options, 'titles')
    titles = options.titles;
else
    if isfield(options, 'title')
        thetitle = options.title;
    else
        thetitle = 'Figure';
    end
    titles = cell(sample_cnt, 1);
    for i = 1:sample_cnt
        titles{i} = sprintf('%s %d', thetitle, i);
    end
end
if isfield(options, 'mode')
    mode = options.mode;
else
    mode = 'h';
end
if isfield(options, 'subplot_size')
    subplot_size = options.subplot_size;
else
    subplot_size = [sample_cnt, 1];
end

if mode == 'm'
    mkdir(save_name);
end

unit = 'inches';
base_pos = [0 0 9 5];

dpioption = '-r300';

figure(1);

if mode == 's'
    set(gcf, 'PaperPositionMode', 'manual');
    set(gcf,'unit',unit);
    set(gcf,'position',base_pos .* [0 0 flip(subplot_size)]);
    set(gcf,'paperunits',unit);
    set(gcf,'paperposition',base_pos .* [0 0 flip(subplot_size)]);
elseif mode == 'h'
    set(gcf, 'PaperPositionMode', 'manual');
    set(gcf,'unit',unit);
    set(gcf,'position',base_pos);
    set(gcf,'paperunits',unit);
    set(gcf,'paperposition',base_pos);
end

for i = 1:sample_cnt
    valid_positions = find(~isnan(datas(i,:)));
    valid_range = [valid_positions(1):valid_positions(end)];
    sample_years = years(valid_range);
    sample_datas = datas(i, valid_range);
    if mode == 'm'
        figure(i);
        set(gcf, 'PaperPositionMode', 'manual');
        set(gcf,'unit',unit);
        set(gcf,'position',base_pos);
        set(gcf,'paperunits',unit);
        set(gcf,'paperposition',base_pos);
    elseif mode == 's'
        subplot(subplot_size(1), subplot_size(2), i);
    end
    plot(sample_years, sample_datas);
    if mode == 'm' || mode == 's'
        title(titles{i});
        hold on;
        plot([min(sample_years) - 20, max(sample_years) + 20], [1 1], '--k');
        xlim([min(sample_years) - 20, max(sample_years) + 20]);
    end
    if mode == 'm'
        print(gcf, '-dtiff', dpioption, sprintf('%s/%d.tiff', save_name, i));
    end
    if mode == 'h'
        hold on;
    end
end

if mode == 'h'
    plot([min(years) - 20, max(years) + 20], [1 1], '--k');
    xlim([min(years) - 20, max(years) + 20]);
end

if mode == 'h' || mode == 's'
    print(gcf, '-dtiff', dpioption, sprintf('%s.tiff', save_name));
end

end