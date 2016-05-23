years = hs_20_years;
datas = hs_20_rawdata / 1000;

data_size = size(datas);

data_died = datas(5:8, :);
data_live = zeros(16, data_size(2));
data_live(1:4, :) = datas(1:4,:);
data_live(5:16, :) = datas(9:20,:);

data_live_valid = data_live;
data_live_valid(~isnan(data_live_valid)) = 1;
data_live_valid(isnan(data_live_valid)) = 0;
data_live_vcnt = sum(data_live_valid);

data_died_valid = data_died;
data_died_valid(~isnan(data_died_valid)) = 1;
data_died_valid(isnan(data_died_valid)) = 0;
data_died_vcnt = sum(data_died_valid);

data_live_mean = data_live;
data_live_mean(isnan(data_live_mean)) = 0;
data_live_mean = mean(data_live_mean);

data_died_mean = data_died;
data_died_mean(isnan(data_died_mean)) = 0;
data_died_mean = mean(data_died_mean);

figure(1);

subplot(2,1,1);

[AX] = plotyy(years, data_live_mean, years, data_live_vcnt);

mean_max = max(data_live_mean) + 0.01;

HA1 = get(AX(1), 'YLabel');
set(HA1, 'String', 'Average');
set(AX(1), 'ylim', [0 mean_max]);
set(AX(1), 'ytick', 0:0.2:mean_max);

HA2 = get(AX(2), 'YLabel');
set(HA2, 'String', 'Living Count');
set(AX(2), 'ylim', [0 (max(data_live_vcnt) + 1)]);

subplot(2,1,2);

[AX] = plotyy(years, data_died_mean, years, data_died_vcnt);

mean_max = max(data_died_mean) + 0.01;

HA1 = get(AX(1), 'YLabel');
set(HA1, 'String', 'Average');
set(AX(1), 'ylim', [0 mean_max]);
set(AX(1), 'ytick', 0:0.2:mean_max);

HA2 = get(AX(2), 'YLabel');
set(HA2, 'String', 'Died Count');
set(AX(2), 'ylim', [0 (max(data_died_vcnt) + 1)]);