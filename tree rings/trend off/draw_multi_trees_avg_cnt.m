function [ tree_means ] = draw_multi_trees_avg_cnt( tree_rawdatas, tree_years, tree_descs )

tree_cnt = size(tree_rawdatas, 2);
tree_means = cell(tree_cnt,1);

for i = 1:tree_cnt
    years = tree_years{i};
    datas = tree_rawdatas{i} / 1000;

    data_size = size(datas);

    data_valid = datas;
    data_valid(~isnan(data_valid)) = 1;
    data_valid(isnan(data_valid)) = 0;
    data_vcnt = sum(data_valid);

    data_mean = nanmean(datas);

    figure(1);

    subplot(tree_cnt,1,i);

    [AX] = plotyy(years, data_mean, years, data_vcnt);

    mean_max = max(data_mean) + 0.01;

    HA1 = get(AX(1), 'YLabel');
    set(HA1, 'String', [tree_descs{i}, ' Average']);
    set(AX(1), 'ylim', [0 mean_max]);
    set(AX(1), 'ytick', 0:0.2:mean_max);

    HA2 = get(AX(2), 'YLabel');
    set(HA2, 'String', [tree_descs{i}, ' Count']);
    set(AX(2), 'ylim', [0 (max(data_vcnt) + 1)]);
    
    tree_means{i} = data_mean;
end

end

