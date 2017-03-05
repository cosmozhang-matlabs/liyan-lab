function [ result ] = calc_case( sdata, cdata, thre )
% result: count of dismatch points

if nargin < 3
    thre = 0.001;
end

ddata = nanmean(sdata, 1) - cdata;
result = abs(ddata) > thre;
result = sum(result);

end

