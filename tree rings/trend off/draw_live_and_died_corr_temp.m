data_live = [hs_20_rawdata(1:4,:);hs_20_rawdata(9:20,:)];
data_died = hs_20_rawdata(5:8,:);

draw_multi_trees_corr_multi_envs({data_live,data_died},{hs_20_years,hs_20_years},{dt_temp_rawdata(:,1:12)},{dt_temp_years},{dt_temp_months},{'Living','Died'},{'Temperature'});