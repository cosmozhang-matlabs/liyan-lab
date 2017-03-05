function [  ] = enum_cases(  )

% load('test_cases.mat');
test_cases = generate_cases;
load('../wts_36_rawdata.mat');
load('../hs_20_rawdata.mat');

cnt_thre = 1;
det_thre = 0.0001;

for iii = fliplr(1:size(test_cases,1))
    for jjj = 1:size(test_cases{iii},1)
        tcase = test_cases{iii}{jjj};
        fprintf('Case: %s\n', tcase.name);
        
        if strcmpi(tcase.nsite, 'wts')
            raw_data = wts_36_rawdata;
            raw_years = wts_36_years;
        elseif strcmpi(tcase.nsite, 'hs')
            raw_data = hs_20_rawdata./1000;
            raw_years = hs_20_years;
        else
            warning(sprintf('Cannot figure out the site name, %d, %d \n', iii, jjj));
            continue;
        end
        raw_data = raw_data(:, find(raw_years==tcase.years(1)):find(raw_years==tcase.years(end)));
        
        all_indexes = 1:size(raw_data,1);
        for k = 1:max(size(all_indexes))
            comb_cases = nchoosek(all_indexes, k);
            for i = 1:size(comb_cases,1)
                sidx = comb_cases(i,:);
                if calc_case(raw_data(sidx,:), tcase.data, det_thre) < cnt_thre
                    fprintf('  >> Match: [ %s ]\n', num2str(sidx));
                end
            end
        end
        
    end
end

end

