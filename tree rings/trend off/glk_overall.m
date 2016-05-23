% author: Cosmo Zhang
% email: cosmozhang1995@gmail.com
% page: http://www.cosmozhang.com/
% bug report: https://github.com/cosmozhang1995

function [ gscore_mean, gscores ] = glk_overall( data1, data2 )

% overall glk between data1 and data2
% if data2 not set, calculates inner glk of data1

mode = 'inter';

if nargin < 2
    data2 = data1;
    mode = 'inner';
end

cnt1 = size(data1, 1);
cnt2 = size(data2, 1);

gscores = zeros(cnt1, cnt2);

for i = 1:cnt1
    for j = 1:cnt2
        gscores(i,j) = glk(data1(i,:), data2(j,:));
    end
end

if strcmp(mode, 'inter')
    gscore_mean = nansum(nansum(gscores)) / sum(sum(~isnan(gscores)));
else
    gscore_mean = nansum(nansum(gscores.*(1-eye(cnt1)))) / sum(sum(~isnan(gscores)));
end

end

