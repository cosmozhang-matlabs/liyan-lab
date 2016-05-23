pdsi_avg_ann = nanmean(dt_pdsi_rawdata, 2);
pos_s = find(~isnan(pdsi_avg_ann), 1, 'first');
pos_e = find(~isnan(pdsi_avg_ann), 1, 'last');
pdsi_avg_ann = pdsi_avg_ann(pos_s:pos_e);

pos = find(hs_20_years==dt_pdsi_years(pos_s));
len = pos_e - pos_s + 1;

datas = hs_20_rawdata / 1000;
datas = datas(:,pos:pos+len-1);
data_size = size(datas);
data_size = data_size(1);

data_live = [datas(1:4,:);datas(9:20,:)];
data_died = datas(5:8,:);

data_live_mean = nanmean(data_live);
data_died_mean = nanmean(data_died);

years = dt_pdsi_years(pos_s:pos_e);

years_min = min(years);
years_max = max(years);
years_dst = years_max - years_min;

pdsi_avg_ann_min = min(pdsi_avg_ann);
pdsi_avg_ann_max = max(pdsi_avg_ann);
pdsi_avg_ann_dst = pdsi_avg_ann_max - pdsi_avg_ann_min;

data_live_mean_min = min(data_live_mean);
data_live_mean_max = max(data_live_mean);
data_live_mean_dst = data_live_mean_max - data_live_mean_min;

data_died_mean_min = min(data_died_mean);
data_died_mean_max = max(data_died_mean);
data_died_mean_dst = data_died_mean_max - data_died_mean_min;

corrcoef_live = corr(data_live_mean', pdsi_avg_ann);
corrcoef_died = corr(data_died_mean', pdsi_avg_ann);

% line

figure(1);

subplot(2,1,1);

AX = plotyy(years, data_live_mean, years, pdsi_avg_ann);
set(get(AX(1), 'YLabel'), 'String', 'Living');
set(AX(1), 'ylim', [data_live_mean_min - data_live_mean_dst / 10, data_live_mean_max + data_live_mean_dst / 10]);
set(AX(1), 'ytick', data_live_mean_min - data_live_mean_dst / 10 : 0.2 : data_live_mean_max + data_live_mean_dst / 10);
set(get(AX(2), 'YLabel'), 'String', 'PDSI');
set(AX(2), 'ylim', [pdsi_avg_ann_min - pdsi_avg_ann_dst / 10, pdsi_avg_ann_max + pdsi_avg_ann_dst / 10]);
set(AX(2), 'ytick', pdsi_avg_ann_min - pdsi_avg_ann_dst / 10 : 2 : pdsi_avg_ann_max + pdsi_avg_ann_dst / 10);
title(['r = ', num2str(corrcoef_live)]);

subplot(2,1,2);

AX = plotyy(years, data_died_mean, years, pdsi_avg_ann);
set(get(AX(1), 'YLabel'), 'String', 'Died');
set(AX(1), 'ylim', [data_died_mean_min - data_died_mean_dst / 10, data_died_mean_max + data_died_mean_dst / 10]);
set(AX(1), 'ytick', data_died_mean_min - data_died_mean_dst / 10 : 0.2 : data_died_mean_max + data_died_mean_dst / 10);
set(get(AX(2), 'YLabel'), 'String', 'PDSI');
set(AX(2), 'ylim', [pdsi_avg_ann_min - pdsi_avg_ann_dst / 10, pdsi_avg_ann_max + pdsi_avg_ann_dst / 10]);
set(AX(2), 'ytick', pdsi_avg_ann_min - pdsi_avg_ann_dst / 10 : 2 : pdsi_avg_ann_max + pdsi_avg_ann_dst / 10);
title(['r = ', num2str(corrcoef_died)]);

% scatter

figure(2);

subplot(1,2,1);
plot(pdsi_avg_ann, data_live_mean, '.');
xlabel('PDSI');
ylabel('Living');

subplot(1,2,2);
plot(pdsi_avg_ann, data_died_mean, '.');
xlabel('PDSI');
ylabel('Died');