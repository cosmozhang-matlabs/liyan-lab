data_top = [hs_20_rawdata(12,:);hs_20_rawdata(18:20,:)];
data_middle = [hs_20_rawdata(1:4,:);hs_20_rawdata(9:11,:);hs_20_rawdata(13:17,:)];

draw_two_groups_relation(data_top, 'Top', data_middle, 'Middle', hs_20_years, 50);