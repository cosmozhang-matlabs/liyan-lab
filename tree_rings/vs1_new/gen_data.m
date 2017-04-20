function [  ] = gen_data(  )

[xlsxData, xlsxText] = xlsread('tree_indexes.xlsx');
casCount = size(xlsxText,1);
wts_hs_modes = cell(casCount,1);

% dims: period, mode, site
% period: 1, 2, 3
% mode: 20, -1, 8
% site: 1, 2
wts_hs_modes_in_dims = cell(3, 3, 2);

hs_20_rawdata = load('hs_20_rawdata.(6extreme-modfied).mat');
hs_20_years = hs_20_rawdata.hs_20_years;
hs_20_rawdata = hs_20_rawdata.hs_20_rawdata;
wts_36_rawdata = load('wts_36_rawdata.(6extreme-modfied).mat');
wts_36_years = wts_36_rawdata.wts_36_years;
wts_36_rawdata = wts_36_rawdata.wts_36_rawdata;

yearBegins = [zeros(1,casCount)];
yearBegins_idx = 1;
for ci = 1:casCount
    cName = xlsxText{ci};
    cNameSplit = strsplit(cName, ' ');
    cYearStr = cNameSplit{2};
    cYearSplit = strsplit(cYearStr, '-');
    cYearBegin = str2num(cYearSplit{1});
    if sum(yearBegins == cYearBegin) == 0
        yearBegins(yearBegins_idx) = cYearBegin;
        yearBegins_idx = yearBegins_idx + 1;
    end
end
yearBegins = sort(yearBegins(1:(yearBegins_idx-1)));
% yearBegins = sort(yearBegins(1:3));

for ci = 1:casCount
    cStruct = struct();
    cName = xlsxText{ci};
    cIndexes = xlsxData(ci,:);
    cIndexes = cIndexes(~isnan(cIndexes));
    cNameSplit = strsplit(cName, ' ');
    cSite = cNameSplit{1};
    cYearStr = cNameSplit{2};
    cTypeStr = cNameSplit{3};
    cYearSplit = strsplit(cYearStr, '-');
    cYearBegin = str2num(cYearSplit{1});
    cYearEnd = str2num(cYearSplit{2});
    
    if isempty(cIndexes)
        continue;
    end
    
    if strcmpi(cTypeStr, '20')
        cTypeNum = 20;
        cTypeNumx = 1;
    elseif strcmpi(cTypeStr, '8')
        cTypeNum = 8;
        cTypeNumx = 3;
    elseif strcmpi(cTypeStr, 'others')
        cTypeNum = -1;
        cTypeNumx = 2;
    elseif strcmpi(cTypeStr, 'other')
        cTypeNum = -1;
        cTypeNumx = 2;
    else
        continue;
    end
    
    if strcmpi(cSite, 'hs')
        cSiteNum = 1;
        rawdata = hs_20_rawdata ./ 1000;
        rawyear = hs_20_years;
    elseif strcmpi(cSite, 'wts')
        cSiteNum = 2;
        rawdata = wts_36_rawdata;
        rawyear = wts_36_years;
    else
        continue;
    end
    
    for i = 1:size(yearBegins,2)
        if cYearBegin == yearBegins(i)
            cYearNum = i;
            break;
        end
    end
    
    cYears = cYearBegin:cYearEnd;
    cYearIndexes = find(rawyear==cYearBegin):find(rawyear==cYearEnd);
    cData = nanmean( rawdata(cIndexes,cYearIndexes), 1 );
    
    cStruct.name = cName;
    cStruct.indexes = cIndexes;
    cStruct.site = cSite;
    cStruct.siten = cSiteNum;
    cStruct.yearn = cYearNum;
    cStruct.yearBegin = cYearBegin;
    cStruct.yearEnd = cYearEnd;
    cStruct.type = cTypeStr;
    cStruct.typen = cTypeNum;
    cStruct.years = cYears;
    cStruct.data = cData;
    
    wts_hs_modes{ci} = cStruct;
    wts_hs_modes_in_dims{cYearNum, cTypeNumx, cSiteNum} = cStruct;
end

save('wts_hs_modes.mat', 'wts_hs_modes', 'wts_hs_modes_in_dims');

end

