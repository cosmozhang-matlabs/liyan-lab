function [  ] = gen_data(  )

[xlsxData, xlsxText] = xlsread('tree_indexes.xlsx');
casCount = size(xlsxText,1);
wts_hs_modes = cell(casCount,1);

hs_20_rawdata = load('hs_20_rawdata.mat');
hs_20_years = hs_20_rawdata.hs_20_years;
hs_20_rawdata = hs_20_rawdata.hs_20_rawdata;
wts_36_rawdata = load('wts_36_rawdata.mat');
wts_36_years = wts_36_rawdata.wts_36_years;
wts_36_rawdata = wts_36_rawdata.wts_36_rawdata;

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
    
    if strcmpi(cTypeStr, '20')
        cTypeNum = 20;
    elseif strcmpi(cTypeStr, '8')
        cTypeNum = 8;
    elseif strcmpi(cTypeStr, 'others')
        cTypeNum = -1;
    elseif strcmpi(cTypeStr, 'other')
        cTypeNum = -1;
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
    
    if (cYearBegin == 1825) && (cYearEnd == 1855)
        cYearNum = 1;
    elseif (cYearBegin == 1900) && (cYearEnd == 1940)
        cYearNum = 2;
    elseif (cYearBegin == 1960) && (cYearEnd == 2012)
        cYearNum = 3;
    else
        continue;
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
end

save('wts_hs_modes.mat', 'wts_hs_modes');

end

