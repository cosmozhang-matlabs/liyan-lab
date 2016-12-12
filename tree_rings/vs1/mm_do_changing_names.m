size1 = max(size(wts_hs_modes));
for i = 1:size1
    size2 = max(size(wts_hs_modes{i}));
    for j = 1:size2
        str_split = strsplit(wts_hs_modes{i}{j}.name, ' ');
        
        last_str = str_split{3};
        if strcmpi(last_str, '8')
            wts_hs_modes{i}{j}.nmode = 8;
        elseif strcmpi(last_str, '20');
            wts_hs_modes{i}{j}.nmode = 20;
        else
            wts_hs_modes{i}{j}.nmode = -1;
        end
        
        first_str = str_split{1};
        wts_hs_modes{i}{j}.nsite = first_str;
    end
end