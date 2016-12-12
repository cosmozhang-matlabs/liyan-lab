
% rows: goh,gou,grh,gru,grht,grut,gohu 
% cols: HengShan  1830 - 1850
%       HengShan  1900 - 1940 
%       Wutaishan 1830 - 1850
%       Wutaishan 1900 - 1940
results = zeros(7,4);
result_table = cell(8,5);
result_table{1,1} = '';
result_table{1,2} = 'HengShan 1830 - 1850';
result_table{1,3} = 'HengShan 1900 - 1940';
result_table{1,4} = 'Wutaishan 1830 - 1850';
result_table{1,5} = 'Wutaishan 1900 - 1940';
result_table(2:end,1) = {'goh';'gou';'grh';'gru';'grht';'grut';'gohu'};

% HengShan 1830 - 1850

years = hs_20_years;
year_slicer = find(years==1830):find(years==1850);
data = hs_20_rawdata(:,year_slicer);
years = years(year_slicer);
idx_unhealthy = [5,8,11,12,15,20];
idx_healthy = setdiff(1:20, idx_unhealthy);

[goh,gou,grh,gru,grht,grut,gohu] = glk_healty_unhealthy_7(data,idx_healthy,idx_unhealthy);
results(:,1) = [goh,gou,grh,gru,grht,grut,gohu];

% HengShan 1900 - 1940

years = hs_20_years;
year_slicer = find(years==1900):find(years==1940);
data = hs_20_rawdata(:,year_slicer);
years = years(year_slicer);
idx_unhealthy = [9,11:17,19,20];
idx_healthy = setdiff(1:20, idx_unhealthy);

[goh,gou,grh,gru,grht,grut,gohu] = glk_healty_unhealthy_7(data,idx_healthy,idx_unhealthy);
results(:,2) = [goh,gou,grh,gru,grht,grut,gohu];

% Wutaishan 1830 - 1850

years = wts_36_years;
year_slicer = find(years==1830):find(years==1850);
data = wts_36_rawdata(:,year_slicer);
years = years(year_slicer);
idx_unhealthy = [1,2,4:7,9,10,15:18,23,28,32,36];
idx_healthy = setdiff(1:20, idx_unhealthy);

[goh,gou,grh,gru,grht,grut,gohu] = glk_healty_unhealthy_7(data,idx_healthy,idx_unhealthy);
results(:,3) = [goh,gou,grh,gru,grht,grut,gohu];

% Wutaishan 1900 - 1940

years = wts_36_years;
year_slicer = find(years==1900):find(years==1940);
data = wts_36_rawdata(:,year_slicer);
years = years(year_slicer);
idx_unhealthy = [7:10,12,13,18,21,22,27,28,30,35];
idx_healthy = setdiff(1:20, idx_unhealthy);

[goh,gou,grh,gru,grht,grut,gohu] = glk_healty_unhealthy_7(data,idx_healthy,idx_unhealthy);
results(:,4) = [goh,gou,grh,gru,grht,grut,gohu];

% Result to table

for i = 1:7
    for j = 1:4
        result_table{i+1,j+1} = num2str(results(i,j));
    end
end


% HengShan Glk
glk_window = 20;
glk_float_hs = glk_float(hs_20_rawdata, 0, glk_window);
result_table_glk_hs = zeros(2,size(hs_20_years,2));
result_table_glk_hs(1,:) = hs_20_years;
result_table_glk_hs(2,1:end-glk_window+1) = glk_float_hs;

% Wutaishan Glk
glk_window = 20;
glk_float_wts = glk_float(wts_36_rawdata, 0, glk_window);
result_table_glk_wts = zeros(2,size(wts_36_years,2));
result_table_glk_wts(1,:) = wts_36_years;
result_table_glk_wts(2,1:end-glk_window+1) = glk_float_wts;

% Inter Glk
glk_window = 20;
start_year = max(hs_20_years(1),wts_36_years(1));
end_year = max(hs_20_years(end),wts_36_years(end));
wts_slicer = find(wts_36_years == start_year):find(wts_36_years == end_year);
hs_slicer = find(hs_20_years == start_year):find(hs_20_years == end_year);
glk_float_inter = glk_float(wts_36_rawdata(:,wts_slicer), hs_20_rawdata(:,hs_slicer), glk_window);
result_table_glk_inter = zeros(2,size(start_year:end_year,2));
result_table_glk_inter(1,:) = start_year:end_year;
result_table_glk_inter(2,1:end-glk_window+1) = glk_float_inter;

% Write Results

% xlswrite('result.xls', result_table, 'Glk');
% xlswrite('result.xls', result_table_glk_hs, 'Float Glk: HengShan');
% xlswrite('result.xls', result_table_glk_wts, 'Float Glk: WuTaiShan');

