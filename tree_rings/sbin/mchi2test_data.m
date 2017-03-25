function [ h,p,x2 ] = mchi2test_data( d1,d2 )

nbins = 10;
minval = min(min([d1,d2]));
maxval = max(max([d1,d2]));
xbins = linspace(minval,maxval,nbins);
% xbins = mean([xbins(1:end-1);xbins(2:end)], 1);
f1 = histcounts(d1,xbins);
f2 = histcounts(d2,xbins);
fs = [f1;f2];

[h,p,x2] = mchi2test(fs);

end

