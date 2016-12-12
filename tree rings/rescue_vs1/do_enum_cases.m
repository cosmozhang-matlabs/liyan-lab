mode_data = 0;
found_mode_data = 0;

for i = 1:max(size(wts_hs_modes))
    mode_group = wts_hs_modes{i};
    for j = 1:max(size(mode_group))
        mode_item = mode_group{j};
        if strcmpi(mode_item.nsite, 'hs')
            mode_data = mode_item;
            found_mode_data = 1;
            break;
        end
    end
    if found_mode_data
        break;
    end
end

test_seq(mode_data, hs_20_rawdata, hs_20_years);


