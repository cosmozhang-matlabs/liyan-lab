function [ output_args ] = draw_multi_trees_corr_multi_envs( tree_rawdatas, tree_years, env_rawdatas, env_years, env_months, tree_descs, env_descs )

tree_cnt = size(tree_rawdatas); tree_cnt = tree_cnt(2);
env_cnt = size(env_rawdatas);   env_cnt = env_cnt(2);

iter_sp = 1;

for i_t = 1:tree_cnt
    for i_e = 1:env_cnt
        tree_rawdata = tree_rawdatas{i_t};
        tree_year = tree_years{i_t};
        env_rawdata = env_rawdatas{i_e};
        env_year = env_years{i_e};
        
        env_avg_ann = nanmean(env_rawdata, 2);
        pos_s = find(~isnan(env_avg_ann), 1, 'first');
        pos_e = find(~isnan(env_avg_ann), 1, 'last');
        env_avg_ann = env_avg_ann(pos_s:pos_e);

        pos = find(tree_year==env_year(pos_s));
        len = pos_e - pos_s + 1;

        datas = tree_rawdata / 1000;
        datas = datas(:,pos:pos+len-1);
        data_size = size(datas);
        data_size = data_size(1);

        data_mean = nanmean(datas);

        years = env_year(pos_s:pos_e);

        years_min = min(years);
        years_max = max(years);
        years_dst = years_max - years_min;

        env_avg_ann_min = min(env_avg_ann);
        env_avg_ann_max = max(env_avg_ann);
        env_avg_ann_dst = env_avg_ann_max - env_avg_ann_min;

        data_mean_min = min(data_mean);
        data_mean_max = max(data_mean);
        data_mean_dst = data_mean_max - data_mean_min;

        data_mean_strip = data_mean';
        env_avg_ann_strip = env_avg_ann;
        env_avg_ann_strip = env_avg_ann_strip(~isnan(data_mean_strip));
        data_mean_strip = data_mean_strip(~isnan(data_mean_strip));
        data_mean_strip = data_mean_strip(~isnan(env_avg_ann_strip));
        env_avg_ann_strip = env_avg_ann_strip(~isnan(env_avg_ann_strip));
        corrcoefv = corr(data_mean_strip, env_avg_ann_strip);

        % line

        figure(1);

        subplot(tree_cnt,env_cnt,iter_sp);

        AX = plotyy(years, data_mean, years, env_avg_ann);
        set(get(AX(1), 'YLabel'), 'String', tree_descs{i_t});
        set(AX(1), 'ylim', [data_mean_min - data_mean_dst / 10, data_mean_max + data_mean_dst / 10]);
        set(AX(1), 'ytick', data_mean_min - data_mean_dst / 10 : data_mean_dst / 10 : data_mean_max + data_mean_dst / 10);
        set(get(AX(2), 'YLabel'), 'String', env_descs{i_e});
        set(AX(2), 'ylim', [env_avg_ann_min - env_avg_ann_dst / 10, env_avg_ann_max + env_avg_ann_dst / 10]);
        set(AX(2), 'ytick', env_avg_ann_min - env_avg_ann_dst / 10 : env_avg_ann_dst / 10 : env_avg_ann_max + env_avg_ann_dst / 10);
        title(['r = ', num2str(corrcoefv)]);

        % scatter

        figure(2);

        subplot(tree_cnt,env_cnt,iter_sp);
        plot(env_avg_ann, data_mean, '.');
        xlabel(env_descs{i_e});
        ylabel(tree_descs{i_t});
        
        iter_sp = iter_sp + 1;
    end
end

end

