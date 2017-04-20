function [  ] = do_compare(  )

addpath('../sbin');

load('wts_hs_modes.mat');

result_table = cell(6,11);
result_table{3,1} = 'Hengshan';
result_table{4,1} = 'Wutaishan';
result_table{5,1} = 'Chi2';
result_table{6,1} = 'p-value';

mode_names = {'20','8 - 20','8'};

contingency_table = zeros(2,9);
for i = 1:3
    dsl_item = wts_hs_modes_in_dims{i,1,1};
    if isempty(dsl_item)
        continue;
    end
    result_table{1,(i-1)*3+2} = sprintf('%d-%d', dsl_item.yearBegin, dsl_item.yearEnd);
    has_empty = 0;
    total_count = zeros(1,2);
    datalens = zeros(3,2);
    for j = 1:3
        result_table{2,(i-1)*3+j+1} = mode_names{j};
        for k = 1:2
            dsl_item = wts_hs_modes_in_dims{i,j,k};
            if isempty(dsl_item)
                has_empty = 1;
                continue;
            end
            meanval = nanmean(dsl_item.data);
            datalen = max(size(dsl_item.indexes));
            total_count(k) = total_count(k) + datalen;
            datalens(j,k) = datalen;
            contingency_table(k,(i-1)*3+j) = datalen;
        end
    end
    for j = 1:3
        for k = 1:2
            if datalens(j,k)
                result_table{2+k,(i-1)*3+j+1} = sprintf('%d (%.2f)%%', datalens(j,k), datalens(j,k) * 100 / total_count(k));
            end
        end
    end
    % chi2 contingency testing
    [~,p,x2,freed] = mchi2test( contingency_table(:,((i-1)*3+1):(i*3)) );
    if freed > 0
        result_table{5,(i-1)*3+2} = sprintf('%f',x2);
        result_table{6,(i-1)*3+2} = sprintf('%f',p);
    end
end
[~,p,x2,freed] = mchi2test( contingency_table );
if freed > 0
    result_table{5,11} = sprintf('%f',x2);
    result_table{6,11} = sprintf('%f',p);
end

% xlswrite('compare.xlsx',result_table);
writecsv('compare.csv', result_table);

fprintf('%s  %s  %s\n', result_table{6,2}, result_table{6,5}, result_table{6,8});

end

