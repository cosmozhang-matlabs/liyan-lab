% author: Cosmo Zhang
% email: cosmozhang1995@gmail.com
% page: http://www.cosmozhang.com/
% bug report: https://github.com/cosmozhang1995

function [ gscore_mean, gscores ] = glk_float( data1, data2, window_size, method )
%GLK_FLOAT_OVERALL Summary of this function goes here
% Calculate floated inner glk score of data1 and data2
% method: overall | mean(refer to mean) | most_mean(refer to most similar
% to mean)(default) | refer_data
% only `overall` can calculate inter glk.
% if other mode, inner glk of data1 will be calculated

if nargin < 4
    method = 'most_mean';
end

cnt1 = size(data1, 1);
cnt2 = size(data2, 1);
if strcmp(method, 'overall')
    len = min(size(data1, 2),size(data2, 2));
else
    len = size(data1, 2);
end
len_result = len - window_size + 1;

if strcmpi(method, 'overall')
    gscores = zeros(cnt1, cnt2, len_result);
    gscore_mean = zeros(1, len_result);
    for iw = 1:len_result
        [gscore_mean(1,iw),gscores(:,:,iw)] = glk_overall(data1(:,iw:iw+window_size-1),data2(:,iw:iw+window_size-1));
    end
else
    gscores = zeros(cnt1, len_result);
    for iw = 1:len_result
        [~,gscores(:,iw)] = glk_ref(data1(:,iw:iw+window_size-1), method);
    end
    gscore_mean = nanmean(gscores, 1);
end

end

