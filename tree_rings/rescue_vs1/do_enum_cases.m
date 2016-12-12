function [cases] = do_enum_cases(site_name)

if nargin < 1
    site_name = 'hs';
end

mode_data = 0;
found_mode_data = 0;

load('wts_hs_modes.mat');
load('hs_20_rawdata.mat');
load('wts_36_rawdata.mat');

for i = 1:max(size(wts_hs_modes))
    mode_group = wts_hs_modes{i};
    for j = 1:max(size(mode_group))
        mode_item = mode_group{j};
        if strcmpi(mode_item.nsite, site_name)
            mode_data = mode_item;
            found_mode_data = 1;
            break;
        end
    end
    if found_mode_data
        break;
    end
end

cases = enum_cases(mode_data, hs_20_rawdata, hs_20_years);

end


