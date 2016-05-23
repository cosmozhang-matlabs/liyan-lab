% author: Cosmo Zhang
% email: cosmozhang1995@gmail.com
% page: http://www.cosmozhang.com/
% bug report: https://github.com/cosmozhang1995

function [ gscore_mean, gscores ] = glk_ref( data, data_ref )
%GLK_REF Summary of this function goes here
%   Detailed explanation goes here
% data_ref: reference | mean | most_mean

if nargin < 2
    data_ref = 'mean';
end

cnt = size(data, 1);

if strcmp(data_ref , 'mean')
    data_ref = nanmean(data, 1);
elseif strcmp(data_ref , 'most_mean')
    meanval = nanmean(data, 1);
    [~,mostmeanpos] = max(nanmean(data - repmat(meanval, cnt, 1), 2));
    data_ref = data(mostmeanpos,:);
end

gscores = zeros(cnt,1);

for i = 1:cnt
    gscores(i) = glk(data(i,:), data_ref);
end

gscore_mean = nanmean(gscores);


end

