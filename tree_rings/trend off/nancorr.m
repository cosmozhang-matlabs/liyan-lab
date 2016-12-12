function [ corr_effc ] = nancorr( data1, data2 )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

if size(data1, 1) == 1
    data1 = data1';
end
if size(data2, 1) == 1
    data2 = data2';
end

data1 = data1(~isnan(data2));
data2 = data2(~isnan(data2));
data2 = data2(~isnan(data1));
data1 = data1(~isnan(data1));

corr_effc = corr(data1, data2);

end

