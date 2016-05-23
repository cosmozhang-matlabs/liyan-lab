data_live = [hs_20_rawdata(1:4,:);hs_20_rawdata(9:20,:)];
data_died = hs_20_rawdata(5:8,:);

draw_two_groups_relation(data_live, 'Living', data_died, 'Died', hs_20_years, 50);