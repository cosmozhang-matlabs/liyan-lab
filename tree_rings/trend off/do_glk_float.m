datas = hs_20_rawdata;
years = hs_20_years;
window = 20;
dodraw = 1;

[gsm, gss] = glk_float(datas, window, 'most_mean');

if dodraw
    plot(years(1:end-window+1), gsm);
end