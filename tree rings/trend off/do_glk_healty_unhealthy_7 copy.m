
% rows: goh,gou,grh,gru,grht,grut,gohu 
% cols: HengShan  1830 - 1850
%       HengShan  1900 - 1940 
%       Wutaishan 1830 - 1850
%       Wutaishan 1900 - 1940
row_header = ['HengShan  1830 - 1850','HengShan  1900 - 1940 ','Wutaishan 1830 - 1850','Wutaishan 1900 - 1940'];
results = zeros(7,4);
result_cell = cell(8,5);
result_cell{2,1} = 'goh';
result_cell{3,1} = 'gou';
result_cell{4,1} = 'grh';
result_cell{5,1} = 'gru';
result_cell{6,1} = 'grht';
result_cell{7,1} = 'grut';
result_cell{8,1} = 'gohu';
result_cell{1,2} = 'HengShan 1830 - 1850';
result_cell{1,3} = 'HengShan 1900 - 1940';
result_cell{1,4} = 'Wutaishan 1830 - 1850';
result_cell{1,5} = 'Wutaishan 1900 - 1940';

% HengShan 1830 - 1850

years = hs_20_years;
year_slicer = find(years==1830):find(years==1850);
data = hs_20_rawdata(:,year_slicer);
years = years(year_slicer);
idx_unhealthy = [5,8,11,12,15,20];
idx_healthy = setdiff(1:20, idx_unhealthy);

[goh,gou,grh,gru,grht,grut,gohu] = glk_healty_unhealthy_7(data,idx_healthy,idx_unhealthy);
results(:,1) = [goh,gou,grh,gru,grht,grut,gohu];
result_cell{2,2} = goh;
result_cell{3,2} = gou;
result_cell{4,2} = grh;
result_cell{5,2} = gru;
result_cell{6,2} = grht;
result_cell{7,2} = grut;
result_cell{8,2} = gohu;

% HengShan 1900 - 1940

years = hs_20_years;
year_slicer = find(years==1900):find(years==1940);
data = hs_20_rawdata(:,year_slicer);
years = years(year_slicer);
idx_unhealthy = [9,11:17,19,20];
idx_healthy = setdiff(1:20, idx_unhealthy);

[goh,gou,grh,gru,grht,grut,gohu] = glk_healty_unhealthy_7(data,idx_healthy,idx_unhealthy);
results(:,2) = [goh,gou,grh,gru,grht,grut,gohu];
result_cell{2,3} = goh;
result_cell{3,3} = gou;
result_cell{4,3} = grh;
result_cell{5,3} = gru;
result_cell{6,3} = grht;
result_cell{7,3} = grut;
result_cell{8,3} = gohu;

% Wutaishan 1830 - 1850

years = wts_36_years;
year_slicer = find(years==1830):find(years==1850);
data = wts_36_rawdata(:,year_slicer);
years = years(year_slicer);
idx_unhealthy = [1,2,4:7,9,10,15:18,23,28,32,36];
idx_healthy = setdiff(1:20, idx_unhealthy);

[goh,gou,grh,gru,grht,grut,gohu] = glk_healty_unhealthy_7(data,idx_healthy,idx_unhealthy);
results(:,3) = [goh,gou,grh,gru,grht,grut,gohu];
result_cell{2,4} = goh;
result_cell{3,4} = gou;
result_cell{4,4} = grh;
result_cell{5,4} = gru;
result_cell{6,4} = grht;
result_cell{7,4} = grut;
result_cell{8,4} = gohu;

% Wutaishan 1900 - 1940

years = wts_36_years;
year_slicer = find(years==1900):find(years==1940);
data = wts_36_rawdata(:,year_slicer);
years = years(year_slicer);
idx_unhealthy = [7:10,12,13,18,21,22,27,28,30,35];
idx_healthy = setdiff(1:20, idx_unhealthy);

[goh,gou,grh,gru,grht,grut,gohu] = glk_healty_unhealthy_7(data,idx_healthy,idx_unhealthy);
results(:,4) = [goh,gou,grh,gru,grht,grut,gohu];
result_cell{2,5} = goh;
result_cell{3,5} = gou;
result_cell{4,5} = grh;
result_cell{5,5} = gru;
result_cell{6,5} = grht;
result_cell{7,5} = grut;
result_cell{8,5} = gohu;