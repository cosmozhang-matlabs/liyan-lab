years = hs_20_years;
datas = hs_20_rawdata / 1000;
datas = data_mean;

idx_s = find(years==1830);
idx_e = find(years==1850);
years = years(idx_s:idx_e);
datas = datas(:,idx_s:idx_e);
% datas = datas(1,:); % always low
% datas = datas(2,:); % low - high
% datas = datas(3,:); % always high
datas = datas(4,:); % 
% datas = datas(5,:); % low - high

data_size = size(datas);
sample_cnt = data_size(1);

titles = cell(sample_cnt, 1);
for i = 1:sample_cnt
    titles{i} = sprintf('HS%02d', i);
end

options = struct();
options.mode = 'h';
options.subplot_size = [5,4];
options.titles = titles;

draw_data_figures(datas, years, options, 't');