data_top = [hs_20_rawdata(12,:);hs_20_rawdata(18:20,:)];
data_middle = [hs_20_rawdata(1:4,:);hs_20_rawdata(9:11,:);hs_20_rawdata(13:17,:)];

draw_multi_trees_avg_cnt({data_top,data_middle},{hs_20_years,hs_20_years},{'Top','Middle'});