function [] = enum_cases_3 ()

load('wts_hs_modes.mat');
load('wts_36_rawdata.mat');
load('hs_20_rawdata.mat');

raw_years = wts_36_years;
raw_data = wts_36_rawdata;
mode_data = wts_hs_modes{1}{1};
fprintf('Handling mode: %s\n', mode_data.name);
mode_year = mode_data.years;
mode_data = mode_data.data;

mode_year = mode_year(1);
mode_data = mode_data(1);

raw_data = raw_data(:,raw_years==mode_year);
raw_count = size(raw_data, 1);

bin_powers = 2.^(1:raw_count);

gpu_bin_powers = gpuArray(bin_powers);

for i = 1:2^raw_count
    selflags = i - bitand(i, uint32(gpu_bin_powers));
    selflags = selflags > 0;
    seldata = raw_data(selflags,1);
    if nanmean(seldata) == mode_data
        selidx = 1:raw_count;
        selidx = selidx(selflags);
        fprintf('>> Found mode: ');
        for j = selidx(1:end-1)
            fprintf('%d, ', j);
        end
        fprintf('%d\n', selidx(end));
    end
    if mod(i, 2^20) == 0
        fprintf('  # Handled: %d M\n', uint32(i/2^20));
    end
end

end

% function [ res ] = aGpuFun ()

