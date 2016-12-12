function [ all_cases ] = enum_cases( mode_data, sample_data, sample_years )
%TEST_SEQ Summary of this function goes here
%   Detailed explanation goes here

mode_rawdata = mode_data.data;
mode_years = mode_data.years;

sample_idx_begin = max(find(sample_years, mode_years(1)));
sample_idx_end = max(find(sample_years, mode_years(end)));

sample_data = sample_data(:, sample_idx_begin:sample_idx_end);
sample_count = size(sample_data, 1);

all_cases = cell(sample_count, 1);

for nc = 1:sample_count
    case_count = nchoosek(sample_count, nc);
    cases = zeros(case_count, nc);
    cases = fill_cases(sample_count, nc, cases, zeros(1, nc), 0, 0, 0);
    all_cases{nc} = cases;
    fprintf('Enumerated combinations of %d samples: %d cases\n', nc, size(cases, 1));
end

end




function [ret_cases, ret_iter] = fill_cases(sample_count, nc, cases, case_array, iter, start_i, n)

ret_cases = cases;
ret_iter = iter;
n = n + 1;

for i = (start_i+1):sample_count
    new_case_array = case_array;
    new_case_array(n) = i;
    if (n == nc)
        ret_iter = ret_iter + 1;
        ret_cases(ret_iter, :) = new_case_array;
    elseif (i < sample_count)
        [ret_cases, ret_iter] = fill_cases(sample_count, nc, ret_cases, new_case_array, ret_iter, i, n);
    end
end

end

