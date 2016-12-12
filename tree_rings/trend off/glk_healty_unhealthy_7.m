% author: Cosmo Zhang
% email: cosmozhang1995@gmail.com
% page: http://www.cosmozhang.com/
% bug report: https://github.com/cosmozhang1995

function [ goh,gou,grh,gru,grht,grut,gohu ] = glk_healty_unhealthy_7( data, idx_healthy, idx_unhealthy )
% Calculate:
% - Heathy trees inner glk (overall)                         goh
% - Unhealty trees inner glk (overall)                       gou
% - Heathy trees inner glk (to inner-refer)                  grh
% - Unhealty trees inner glk (to inner-refer)                gru
% - Glk between heathy trees and total reference             grht
% - Glk between unheathy trees and total reference           grut
% - Glk between heathy trees and unhealty trees (overall)    gohu

data_healthy = data(idx_healthy,:);
data_unhealthy = data(idx_unhealthy,:);

meanval = nanmean(data, 1);
[~,mostmeanpos] = max(nanmean(data - repmat(meanval, size(data, 1), 1), 2));
data_ref = data(mostmeanpos,:);

goh = glk_overall(data_healthy);
gou = glk_overall(data_unhealthy);
grh = glk_ref(data_healthy, 'most_mean');
gru = glk_ref(data_unhealthy, 'most_mean');
grht = glk_ref(data_healthy, data_ref);
grut = glk_ref(data_unhealthy, data_ref);
gohu = glk_overall(data_healthy, data_unhealthy);

end