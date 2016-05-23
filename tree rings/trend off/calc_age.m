function [ age, ys, ye ] = calc_age( data, years )
%CALC_AGE Summary of this function goes here
%   Detailed explanation goes here

data_len = size(data);
year_cnt = data_len(2);
sample_cnt = data_len(1);

ys = zeros(sample_cnt, 1);
ye = zeros(sample_cnt, 1);
for s = 1:sample_cnt
    for i = 1:year_cnt
        if ~isnan(data(s, i))
            if ys(s) == 0
                ys(s) = years(i);
            else
                ye(s) = years(i);
            end
        end
    end
end

age = ye - ys;

end

